.class Lcom/miui/gallery/picker/PickGalleryActivity$MediaScanJob;
.super Ljava/lang/Object;
.source "PickGalleryActivity.java"

# interfaces
.implements Lcom/miui/gallery/threadpool/ThreadPool$Job;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/picker/PickGalleryActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "MediaScanJob"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/threadpool/ThreadPool$Job",
        "<",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 792
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/picker/PickGalleryActivity$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/miui/gallery/picker/PickGalleryActivity$1;

    .prologue
    .line 792
    invoke-direct {p0}, Lcom/miui/gallery/picker/PickGalleryActivity$MediaScanJob;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 792
    invoke-virtual {p0, p1}, Lcom/miui/gallery/picker/PickGalleryActivity$MediaScanJob;->run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method public run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Void;
    .locals 2
    .param p1, "jc"    # Lcom/miui/gallery/threadpool/ThreadPool$JobContext;

    .prologue
    .line 795
    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    .line 796
    .local v0, "context":Landroid/content/Context;
    invoke-static {v0}, Lcom/miui/gallery/scanner/MediaScannerUtil;->scanMediaProvider(Landroid/content/Context;)V

    .line 797
    const/4 v1, 0x5

    invoke-static {v0, v1}, Lcom/miui/gallery/scanner/MediaScannerUtil;->scanAllAlbumDirectories(Landroid/content/Context;I)V

    .line 798
    invoke-static {v0}, Lcom/miui/gallery/scanner/MediaScannerUtil;->cleanup(Landroid/content/Context;)V

    .line 799
    const/4 v1, 0x0

    return-object v1
.end method
