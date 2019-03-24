package miui.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

public interface FileAccessable {

    public static abstract class AbstractFileAccessable implements FileAccessable {
        public boolean isDirectory() {
            if (exists() && !isFile()) {
                return true;
            }
            return false;
        }

        public List<FileAccessable> list(FileAccessableFilter filter) {
            if (filter == null) {
                return list();
            }
            List<FileAccessable> allFiles = list();
            if (allFiles == null) {
                return null;
            }
            List<FileAccessable> returnFiles = new ArrayList();
            for (FileAccessable fileAccessable : allFiles) {
                if (filter.accept(fileAccessable)) {
                    returnFiles.add(fileAccessable);
                }
            }
            return returnFiles;
        }
    }

    public static class DeskFile extends AbstractFileAccessable {
        File mFile;

        public DeskFile(File root, String subpath) {
            this.mFile = new File(root, subpath);
        }

        public DeskFile(String root, String subpath) {
            this.mFile = new File(root, subpath);
        }

        public DeskFile(String filePath) {
            this.mFile = new File(filePath);
        }

        public File getFile() {
            return this.mFile;
        }

        public boolean exists() {
            return this.mFile.exists();
        }

        public boolean isFile() {
            return this.mFile.isFile();
        }

        public List<FileAccessable> list() {
            String[] files = this.mFile.list();
            List<FileAccessable> returnList = new ArrayList();
            for (String file : files) {
                returnList.add(new DeskFile(this.mFile, file));
            }
            return returnList;
        }

        public InputStream getInputStream() {
            try {
                return new FileInputStream(this.mFile);
            } catch (FileNotFoundException e) {
                e.printStackTrace();
                return null;
            }
        }

        public String getName() {
            return this.mFile.getName();
        }

        public boolean equals(Object o) {
            if (o == null || !(o instanceof DeskFile)) {
                return false;
            }
            if (this.mFile.equals(((DeskFile) o).mFile)) {
                return true;
            }
            return false;
        }

        public int hashCode() {
            return this.mFile.hashCode();
        }

        public FileAccessable createBySubpath(String subpath) {
            return new DeskFile(this.mFile.getAbsolutePath(), subpath);
        }

        public FileAccessable createByExtension(String extensionName) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(this.mFile.getAbsolutePath());
            stringBuilder.append(extensionName);
            return new DeskFile(stringBuilder.toString());
        }
    }

    public static class Factory {
        private static HashMap<String, WeakReference<ZipFile>> sZipFiles = new HashMap();

        public static FileAccessable create(String root, String subpath) throws IOException {
            if (new File(root).isDirectory()) {
                return new DeskFile(root, subpath);
            }
            ZipFile zipFile;
            synchronized (sZipFiles) {
                WeakReference<ZipFile> zipFileRef = (WeakReference) sZipFiles.get(root);
                zipFile = zipFileRef == null ? null : (ZipFile) zipFileRef.get();
                if (zipFile == null) {
                    zipFile = new ZipFile(root);
                    sZipFiles.put(root, new WeakReference(zipFile));
                }
            }
            return new ZipInnerFile(zipFile, subpath);
        }

        public static void clearCache() {
            synchronized (sZipFiles) {
                sZipFiles.clear();
            }
        }
    }

    public interface FileAccessableFilter {
        boolean accept(FileAccessable fileAccessable);
    }

    public static class ZipInnerFile extends AbstractFileAccessable {
        String mEntryName;
        boolean mExists;
        boolean mIsFolder;
        ZipFile mZipFile;

        public ZipInnerFile(ZipFile zipFile, String entryName) {
            init(zipFile, entryName);
        }

        private void init(ZipFile zipFile, String entryName) {
            this.mZipFile = zipFile;
            this.mEntryName = entryName.endsWith("/") ? entryName.substring(0, entryName.length() - 1) : entryName;
            if (this.mZipFile != null) {
                ZipEntry zipEntry = zipFile.getEntry(entryName);
                if (zipEntry == null) {
                    String folder = entryName;
                    if (!folder.endsWith("/")) {
                        StringBuilder stringBuilder = new StringBuilder();
                        stringBuilder.append(folder);
                        stringBuilder.append("/");
                        folder = stringBuilder.toString();
                    }
                    Enumeration<? extends ZipEntry> entries = zipFile.entries();
                    while (entries.hasMoreElements()) {
                        if (((ZipEntry) entries.nextElement()).getName().startsWith(folder)) {
                            this.mExists = true;
                            this.mIsFolder = true;
                            break;
                        }
                    }
                } else {
                    this.mExists = true;
                    this.mIsFolder = zipEntry.isDirectory();
                }
            }
        }

        public boolean exists() {
            return this.mExists;
        }

        public boolean isFile() {
            return this.mIsFolder ^ 1;
        }

        public List<FileAccessable> list() {
            if (!this.mExists || !this.mIsFolder) {
                return null;
            }
            Enumeration<? extends ZipEntry> entries = this.mZipFile.entries();
            List<FileAccessable> returnList = new ArrayList();
            HashSet<String> setForQuickCheck = new HashSet();
            while (entries.hasMoreElements()) {
                String currEntryFolder = new StringBuilder();
                currEntryFolder.append(this.mEntryName);
                currEntryFolder.append('/');
                currEntryFolder = currEntryFolder.toString();
                ZipEntry entry = (ZipEntry) entries.nextElement();
                if (entry.getName().length() > currEntryFolder.length() && entry.getName().startsWith(currEntryFolder)) {
                    String subpath = entry.getName().substring(currEntryFolder.length());
                    String name = entry.getName();
                    int index = subpath.indexOf(47);
                    if (index != -1) {
                        String folderName = subpath.substring(null, index);
                        StringBuilder stringBuilder = new StringBuilder();
                        stringBuilder.append(currEntryFolder);
                        stringBuilder.append(folderName);
                        name = stringBuilder.toString();
                    }
                    if (!setForQuickCheck.contains(name)) {
                        returnList.add(new ZipInnerFile(this.mZipFile, name));
                        setForQuickCheck.add(name);
                    }
                }
            }
            return returnList;
        }

        public InputStream getInputStream() {
            if (!this.mExists || this.mIsFolder) {
                return null;
            }
            try {
                return this.mZipFile.getInputStream(this.mZipFile.getEntry(this.mEntryName));
            } catch (IOException e) {
                e.printStackTrace();
                return null;
            }
        }

        public String getName() {
            int separatorIndex = this.mEntryName.lastIndexOf(47);
            return separatorIndex < 0 ? this.mEntryName : this.mEntryName.substring(separatorIndex + 1, this.mEntryName.length());
        }

        public boolean equals(Object o) {
            if (o == null || !(o instanceof ZipInnerFile)) {
                return false;
            }
            ZipInnerFile target = (ZipInnerFile) o;
            if (objectEquals(this.mZipFile, target.mZipFile) && objectEquals(this.mEntryName, target.mEntryName)) {
                return true;
            }
            return false;
        }

        public int hashCode() {
            if (this.mZipFile == null) {
                return this.mEntryName.hashCode();
            }
            return this.mZipFile.hashCode() ^ this.mEntryName.hashCode();
        }

        private static boolean objectEquals(Object obj1, Object obj2) {
            if (obj1 == obj2) {
                return true;
            }
            if (obj1 == null) {
                return false;
            }
            return obj1.equals(obj2);
        }

        public FileAccessable createBySubpath(String subpath) {
            ZipFile zipFile = this.mZipFile;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(this.mEntryName);
            stringBuilder.append("/");
            stringBuilder.append(subpath);
            return new ZipInnerFile(zipFile, stringBuilder.toString());
        }

        public FileAccessable createByExtension(String extensionName) {
            ZipFile zipFile = this.mZipFile;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(this.mEntryName);
            stringBuilder.append(extensionName);
            return new ZipInnerFile(zipFile, stringBuilder.toString());
        }
    }

    FileAccessable createByExtension(String str);

    FileAccessable createBySubpath(String str);

    boolean exists();

    InputStream getInputStream();

    String getName();

    boolean isDirectory();

    boolean isFile();

    List<FileAccessable> list();

    List<FileAccessable> list(FileAccessableFilter fileAccessableFilter);
}
