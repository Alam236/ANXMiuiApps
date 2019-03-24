package miui.provider;

import android.net.Uri;
import android.provider.CalendarContract;

public class ExtraCalendarContracts {
    public static final String ACCOUNT_NAME_LOCAL = "account_name_local";
    public static final String ACCOUNT_TYPE_LOCAL = "LOCAL";
    public static final int CALENDAR_ACCESS_LEVEL_LOCAL = 700;
    public static final String CALENDAR_DISPLAYNAME_BIRTHDAY = "calendar_displayname_birthday";
    public static final String CALENDAR_DISPLAYNAME_LOCAL = "calendar_displayname_local";
    public static final String CALENDAR_DISPLAYNAME_XIAOMI = "calendar_displayname_xiaomi";
    public static final String CALENDAR_NAME_XIAOMI = "Xiaomi Calendar";
    public static final String INTENT_EXTRA_KEY_BIRTHDAY_QUERY = "BIRTHDAY_QUERY";
    public static final String INTENT_EXTRA_KEY_DETAIL_VIEW = "DETAIL_VIEW";
    public static final String OWNERACCOUNT_LOCAL = "owner_account_local";
    public static final String XIAOMI_ACCOUNT_TYPE = "com.xiaomi";

    public static final class HolidayContracts {
        public static final int HOLIDAY_COLUMN_DAYSOFYEAR_INDEX = 1;
        public static final int HOLIDAY_COLUMN_TYPE_INDEX = 2;
        public static final int HOLIDAY_COLUMN_YEAR_INDEX = 0;
        public static final Uri HOLIDAY_CONTENT_URI;

        public interface HolidayType {
            public static final int FREE_DAY = 1;
            public static final int INVALIDATE_DAY = 3;
            public static final int NORMAL_DAY = 0;
            public static final int WORK_DAY = 2;
        }

        static {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(CalendarContract.CONTENT_URI);
            stringBuilder.append("/holiday");
            HOLIDAY_CONTENT_URI = Uri.parse(stringBuilder.toString());
        }
    }
}
