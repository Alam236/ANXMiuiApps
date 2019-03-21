package com.miui.gallery.util.deprecated;

import java.util.Locale;
import java.util.TimeZone;

public class Time {
    public static String getUpgradeMixedDateTimeSqlString(String tableName) {
        return String.format(Locale.US, " update  %1$s set %2$s =  coalesce(    strftime(        '%%s000',        (            replace(%3$s,':','-')||' '||            case when substr(%4$s,2,1)=':'                then 0|| substr(%4$s,1,1)||':'||                    (case when substr(%4$s, 4,1)=':'                        then 0|| substr(substr(%4$s,3),1,1) ||':'||                            (case when length(substr(%4$s,5))=1                                then 0|| substr(%4$s,5)                                ELSE substr(%4$s,5)                            END)                        ELSE substr(substr(%4$s,3),1,2)||':'||                            (case when length(substr(%4$s,6))=1                                then 0|| substr(%4$s,6)                                ELSE substr(%4$s,6)                            END)                        END)                ELSE  substr(%4$s,1,2) ||':'||                    (case when substr(%4$s, 5,1)=':'                        then 0|| substr(substr(%4$s,4),1,1) ||':'||                            (case when length(substr(%4$s,6))=1                                then 0|| substr(%4$s,6)                                ELSE substr(%4$s,6)                            END)                        ELSE substr(substr(%4$s,4),1,2)||':'||                            (case when length(substr(%4$s,7))=1                                then 0|| substr(%4$s,7)                                ELSE substr(%4$s,7)                            END)                        END)            END        )    ),    strftime(        '%%s000',        (            replace(substr(%5$s,1,10),':','-') || ' ' ||substr(%5$s,12,8)        )    )-%7$s,    %6$s  ) ", new Object[]{tableName, "mixedDateTime", "exifGPSDateStamp", "exifGPSTimeStamp", "exifDateTime", "dateModified", Integer.valueOf(TimeZone.getDefault().getRawOffset())});
    }
}
