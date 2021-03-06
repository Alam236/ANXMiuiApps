package miui.util;

import android.content.res.MiuiConfiguration;
import android.content.res.Resources;
import android.text.TextUtils;
import android.text.format.Time;
import com.miui.gallery.assistant.jni.filter.BaiduSceneResult;
import com.miui.internal.vip.VipConstants;
import com.miui.system.internal.R;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import miui.media.Recorder.ErrorCode;
import miui.os.C0015Build;

public class LunarDate {
    public static final int MAX_LUNAR_YEAR = 2050;
    public static final int MIN_LUNAR_YEAR = 1900;
    private static final char[] iSolarLunarOffsetTable = new char[]{'1', '&', 28, '.', '\"', 24, '+', ' ', 21, '(', 29, '0', '$', 25, ',', '!', 22, ')', 31, '2', '&', 27, '.', '#', 23, '+', ' ', 22, '(', 29, '/', '$', 25, ',', '\"', 23, ')', 30, '1', '&', 26, '-', '#', 24, '+', ' ', 21, '(', 28, '/', '$', 26, ',', '!', 23, '*', 30, '0', '&', 27, '-', '#', 24, '+', ' ', 20, '\'', 29, '/', '$', 26, '-', '!', 22, ')', 30, '0', '%', 27, '.', '#', 24, '+', ' ', '2', '\'', 28, '/', '$', 26, '-', '\"', 22, '(', 30, '1', '%', 27, '.', '#', 23, '*', 31, 21, '\'', 28, '0', '%', 25, ',', '!', 22, '(', 30, '1', '&', 27, '.', '#', 24, '*', 31, 21, '(', 28, '/', '$', 25, '+', '!', 22, ')', 30, '1', '&', 27, '-', '\"', 23, '*', 31, 21, '(', 29, '/', '$', 25, ',', ' ', 22};
    private static final long[] luYearData = new long[]{19416, 19168, 42352, 21717, 53856, 55632, 91476, 22176, 39632, 21970, 19168, 42422, 42192, 53840, 119381, 46400, 54944, 44450, 38320, 84343, 18800, 42160, 46261, 27216, 27968, 109396, 11104, 38256, 21234, 18800, 25958, 54432, 59984, 28309, 23248, 11104, 100067, 37600, 116951, 51536, 54432, 120998, 46416, 22176, 107956, 9680, 37584, 53938, 43344, 46423, 27808, 46416, 86869, 19872, 42448, 83315, 21200, 43432, 59728, 27296, 44710, 43856, 19296, 43748, 42352, 21088, 62051, 55632, 23383, 22176, 38608, 19925, 19152, 42192, 54484, 53840, 54616, 46400, 46752, 103846, 38320, 18864, 43380, 42160, 45690, 27216, 27968, 44870, 43872, 38256, 19189, 18800, 25776, 29859, 59984, 27480, 23232, 43872, 38613, 37600, 51552, 55636, 54432, 55888, 30034, 22176, 43959, 9680, 37584, 51893, 43344, 46240, 47780, 44368, 21977, 19360, 42416, 86390, 21168, 43312, 31060, 27296, 44368, 23378, 19296, 42726, 42208, 53856, 60005, 54576, 23200, 30371, 38608, 19415, 19152, 42192, 118966, 53840, 54560, 56645, 46496, 22224, 21938, 18864, 42359, 42160, 43600, 111189, 27936, 44448};
    private static int[] lunarHolidays = new int[]{R.string.the_spring_festival, R.string.lantern_festival, R.string.the_dragon_boat_festival, R.string.double_seventh_day, R.string.the_mid_autumn_festival, R.string.the_double_ninth_festival, R.string.the_laba_rice_porridge_festival};
    private static int[] lunarHolidaysTable = new int[]{101, BaiduSceneResult.BUILDING_OTHER, 505, 707, 815, 909, 1208};
    private static final HashMap<Integer, Integer> sEasterCache = new HashMap();
    private static int[] solarHolidays = new int[]{R.string.new_years_day, R.string.valentines_day, R.string.international_womens_day, R.string.arbor_day, R.string.fools_day, R.string.labour_day, R.string.chinese_youth_day, R.string.childrens_day, R.string.partys_day, R.string.the_armys_day, R.string.teachers_day, R.string.national_day, R.string.christmas_day};
    private static int[] solarHolidaysTable = new int[]{101, 214, 308, 312, 401, 501, 504, 601, 701, 801, 910, 1001, 1225};
    private static int[] solarHolidaysTable_HK = new int[]{101, 214, 501, 701, 1001, 1225};
    private static int[] solarHolidaysTable_TW = new int[]{101, 214, 228, 308, 312, 314, 329, 404, 501, 715, 903, 928, ErrorCode.SERVER_DIED, 1024, 1025, 1112, 1225};
    private static int[] solarHolidays_HK = new int[]{R.string.new_years_day, R.string.valentines_day, R.string.labour_day, R.string.hksar_establishment_day, R.string.national_day, R.string.christmas_day};
    private static int[] solarHolidays_TW = new int[]{R.string.new_years_day, R.string.valentines_day, R.string.peace_day, R.string.international_womens_day, R.string.arbor_day, R.string.anti_aggression_day, R.string.tw_youth_day, R.string.tw_childrens_day, R.string.labour_day, R.string.anniversary_of_lifting_martial_law, R.string.armed_forces_day, R.string.teachers_day, R.string.national_day, R.string.united_nations_day, R.string.retrocession_day, R.string.national_father_day, R.string.christmas_day};
    private static int[] solarTerms = new int[]{R.string.slight_cold, R.string.great_cold, R.string.spring_begins, R.string.the_rains, R.string.insects_awaken, R.string.vernal_equinox, R.string.clear_and_bright, R.string.grain_rain, R.string.summer_begins, R.string.grain_buds, R.string.grain_in_ear, R.string.summer_solstice, R.string.slight_heat, R.string.great_heat, R.string.autumn_begins, R.string.stopping_the_heat, R.string.white_dews, R.string.autumn_equinox, R.string.cold_dews, R.string.hoar_frost_falls, R.string.winter_begins, R.string.light_snow, R.string.heavy_snow, R.string.winter_solstice};
    private static char[] solarTermsTable = new char[]{150, 180, 150, 166, 151, 151, 'x', 'y', 'y', 'i', 'x', 'w', 150, 164, 150, 150, 151, 135, 'y', 'y', 'y', 'i', 'x', 'x', 150, 165, 135, 150, 135, 135, 'y', 'i', 'i', 'i', 'x', 'x', 134, 165, 150, 165, 150, 151, 136, 'x', 'x', 'y', 'x', 135, 150, 180, 150, 166, 151, 151, 'x', 'y', 'y', 'i', 'x', 'w', 150, 164, 150, 150, 151, 151, 'y', 'y', 'y', 'i', 'x', 'x', 150, 165, 135, 150, 135, 135, 'y', 'i', 'i', 'i', 'x', 'x', 134, 165, 150, 165, 150, 151, 136, 'x', 'x', 'i', 'x', 135, 150, 180, 150, 166, 151, 151, 'x', 'y', 'y', 'i', 'x', 'w', 150, 164, 150, 150, 151, 151, 'y', 'y', 'y', 'i', 'x', 'x', 150, 165, 135, 150, 135, 135, 'y', 'i', 'i', 'i', 'x', 'x', 134, 165, 150, 165, 150, 151, 136, 'x', 'x', 'i', 'x', 135, 149, 180, 150, 166, 151, 151, 'x', 'y', 'y', 'i', 'x', 'w', 150, 180, 150, 166, 151, 151, 'y', 'y', 'y', 'i', 'x', 'x', 150, 165, 151, 150, 151, 135, 'y', 'y', 'i', 'i', 'x', 'x', 150, 165, 150, 165, 150, 151, 136, 'x', 'x', 'y', 'w', 135, 149, 180, 150, 166, 150, 151, 'x', 'y', 'x', 'i', 'x', 135, 150, 180, 150, 166, 151, 151, 'y', 'y', 'y', 'i', 'x', 'w', 150, 165, 151, 150, 151, 135, 'y', 'y', 'i', 'i', 'x', 'x', 150, 165, 150, 165, 150, 151, 136, 'x', 'x', 'y', 'w', 135, 149, 180, 150, 165, 150, 151, 'x', 'y', 'x', 'i', 'x', 135, 150, 180, 150, 166, 151, 151, 'y', 'y', 'y', 'i', 'x', 'w', 150, 164, 150, 150, 151, 135, 'y', 'y', 'i', 'i', 'x', 'x', 150, 165, 150, 165, 150, 151, 136, 'x', 'x', 'y', 'w', 135, 149, 180, 150, 165, 150, 151, 'x', 'y', 'x', 'i', 'x', 135, 150, 180, 150, 166, 151, 151, 'x', 'y', 'y', 'i', 'x', 'w', 150, 164, 150, 150, 151, 135, 'y', 'y', 'y', 'i', 'x', 'x', 150, 165, 150, 165, 150, 150, 136, 'x', 'x', 'x', 135, 135, 149, 180, 150, 165, 150, 151, 136, 'x', 'x', 'y', 'w', 135, 150, 180, 150, 166, 151, 151, 'x', 'y', 'y', 'i', 'x', 'w', 150, 164, 150, 150, 151, 135, 'y', 'y', 'y', 'i', 'x', 'x', 150, 165, 150, 165, 150, 150, 136, 'x', 'x', 'x', 135, 135, 149, 180, 150, 165, 150, 151, 136, 'x', 'x', 'i', 'x', 135, 150, 180, 150, 166, 151, 151, 'x', 'y', 'y', 'i', 'x', 'w', 150, 164, 150, 150, 151, 151, 'y', 'y', 'y', 'i', 'x', 'x', 150, 165, 150, 165, 150, 150, 136, 'x', 'x', 'x', 135, 135, 149, 180, 150, 165, 150, 151, 136, 'x', 'x', 'i', 'x', 135, 150, 180, 150, 166, 151, 151, 'x', 'y', 'y', 'i', 'x', 'w', 150, 164, 150, 150, 151, 151, 'y', 'y', 'y', 'i', 'x', 'x', 150, 165, 150, 165, 150, 150, 136, 'x', 'x', 'x', 135, 135, 149, 180, 150, 165, 150, 151, 136, 'x', 'x', 'i', 'x', 135, 150, 180, 150, 166, 151, 151, 'x', 'y', 'y', 'i', 'x', 'w', 150, 164, 150, 150, 151, 151, 'y', 'y', 'y', 'i', 'x', 'x', 150, 165, 150, 165, 166, 150, 136, 'x', 'x', 'x', 135, 135, 149, 180, 150, 165, 150, 151, 136, 'x', 'x', 'y', 'w', 135, 149, 180, 150, 166, 151, 151, 'x', 'y', 'x', 'i', 'x', 'w', 150, 180, 150, 166, 151, 151, 'y', 'y', 'y', 'i', 'x', 'x', 150, 165, 166, 165, 166, 150, 136, 136, 'x', 'x', 135, 135, 165, 180, 150, 165, 150, 151, 136, 'y', 'x', 'y', 'w', 135, 149, 180, 150, 165, 150, 151, 'x', 'y', 'x', 'i', 'x', 'w', 150, 180, 150, 166, 151, 151, 'y', 'y', 'y', 'i', 'x', 'x', 150, 165, 166, 165, 166, 150, 136, 136, 'x', 'x', 135, 135, 165, 180, 150, 165, 150, 151, 136, 'x', 'x', 'y', 'w', 135, 149, 180, 150, 165, 150, 151, 'x', 'y', 'x', 'h', 'x', 135, 150, 180, 150, 166, 151, 151, 'x', 'y', 'y', 'i', 'x', 'w', 150, 165, 165, 165, 166, 150, 136, 136, 'x', 'x', 135, 135, 165, 180, 150, 165, 150, 151, 136, 'x', 'x', 'y', 'w', 135, 149, 180, 150, 165, 150, 151, 136, 'x', 'x', 'i', 'x', 135, 150, 180, 150, 166, 151, 151, 'x', 'y', 'y', 'i', 'x', 'w', 150, 164, 165, 165, 166, 150, 136, 136, 136, 'x', 135, 135, 165, 180, 150, 165, 150, 150, 136, 'x', 'x', 'x', 135, 135, 150, 180, 150, 165, 150, 151, 136, 'x', 'x', 'i', 'x', 135, 150, 180, 150, 166, 151, 151, 'x', 'y', 'y', 'i', 'x', 'w', 150, 164, 165, 165, 166, 150, 136, 136, 136, 'x', 135, 135, 165, 180, 150, 165, 150, 150, 136, 'x', 'x', 'x', 135, 135, 149, 180, 150, 165, 150, 151, 136, 'x', 'x', 'i', 'x', 135, 150, 180, 150, 166, 151, 151, 'x', 'y', 'y', 'i', 'x', 'w', 150, 164, 165, 165, 166, 166, 136, 136, 136, 'x', 135, 135, 165, 180, 150, 165, 150, 150, 136, 'x', 'x', 'x', 135, 135, 149, 180, 150, 165, 150, 151, 136, 'x', 'x', 'i', 'x', 135, 150, 180, 150, 166, 151, 151, 'x', 'y', 'y', 'i', 'x', 'w', 150, 164, 165, 165, 166, 166, 136, 136, 136, 'x', 135, 135, 165, 181, 150, 165, 166, 150, 136, 'x', 'x', 'x', 135, 135, 149, 180, 150, 165, 150, 151, 136, 'x', 'x', 'i', 'x', 135, 150, 180, 150, 166, 151, 151, 'x', 'y', 'x', 'i', 'x', 'w', 150, 164, 165, 181, 166, 166, 136, 137, 136, 'x', 135, 135, 165, 180, 150, 165, 150, 150, 136, 136, 'x', 'x', 135, 135, 149, 180, 150, 165, 150, 151, 136, 'x', 'x', 'y', 'x', 135, 150, 180, 150, 166, 150, 151, 'x', 'y', 'x', 'i', 'x', 'w', 150, 164, 165, 181, 166, 166, 136, 136, 136, 'x', 135, 135, 165, 180, 150, 165, 166, 150, 136, 136, 'x', 'x', 'w', 135, 149, 180, 150, 165, 150, 151, 136, 'x', 'x', 'y', 'w', 135, 149, 180, 150, 165, 150, 151, 'x', 'y', 'x', 'i', 'x', 'w', 150, 180, 165, 181, 166, 166, 135, 136, 136, 'x', 135, 135, 165, 180, 166, 165, 166, 150, 136, 136, 'x', 'x', 135, 135, 165, 180, 150, 165, 150, 151, 136, 'x', 'x', 'y', 'w', 135, 149, 180, 150, 165, 150, 151, 136, 'y', 'x', 'i', 'x', 135, 150, 180, 165, 181, 166, 166, 135, 136, 136, 'x', 135, 134, 165, 180, 165, 165, 166, 150, 136, 136, 136, 'x', 135, 135, 165, 180, 150, 165, 150, 150, 136, 'x', 'x', 'y', 'w', 135, 149, 180, 150, 165, 134, 151, 136, 'x', 'x', 'i', 'x', 135, 150, 180, 165, 181, 166, 166, 135, 136, 136, 'x', 135, 134, 165, 179, 165, 165, 166, 150, 136, 136, 136, 'x', 135, 135, 165, 180, 150, 165, 150, 150, 136, 'x', 'x', 'x', 135, 135, 149, 180, 150, 165, 150, 151, 136, 'v', 'x', 'i', 'x', 135, 150, 180, 165, 181, 166, 166, 135, 136, 136, 'x', 135, 134, 165, 179, 165, 165, 166, 166, 136, 136, 136, 'x', 135, 135, 165, 180, 150, 165, 150, 150, 136, 'x', 'x', 'x', 135, 135, 149, 180, 150, 165, 150, 151, 136, 'x', 'x', 'i', 'x', 135, 150, 180, 165, 181, 166, 166, 135, 136, 136, 'x', 135, 134, 165, 179, 165, 165, 166, 166, 136, 136, 136, 'x', 135, 135, 165, 180, 150, 165, 150, 150, 136, 'x', 'x', 'x', 135, 135, 149, 180, 150, 165, 150, 151, 136, 'x', 'x', 'i', 'x', 135, 150, 180, 165, 181, 166, 166, 135, 136, 136, 'x', 135, 134, 165, 179, 165, 165, 166, 166, 136, 136, 136, 'x', 135, 135, 165, 180, 150, 165, 166, 150, 136, 136, 'x', 'x', 135, 135, 149, 180, 150, 165, 150, 151, 136, 'x', 'x', 'i', 'x', 135, 150, 180, 165, 181, 166, 166, 135, 136, 135, 'x', 135, 134, 165, 179, 165, 181, 166, 166, 136, 136, 136, 'x', 135, 135, 165, 180, 150, 165, 166, 150, 136, 136, 'x', 'x', 135, 135, 149, 180, 150, 165, 150, 151, 136, 'x', 'x', 'y', 'x', 135, 150, 180, 165, 181, 165, 166, 135, 136, 135, 'x', 135, 134, 165, 179, 165, 181, 166, 166, 135, 136, 136, 'x', 135, 135, 165, 180, 150, 165, 166, 150, 136, 136, 'x', 'x', 135, 135, 149, 180, 150, 165, 150, 151, 136, 'x', 'x', 'y', 'w', 135, 149, 180, 165, 180, 165, 166, 135, 136, 135, 'x', 135, 134, 165, 195, 165, 181, 166, 166, 135, 136, 136, 'x', 135, 135, 165, 180, 166, 165, 166, 150, 136, 136, 'x', 'x', 135, 135, 165, 180, 150, 165, 150, 150, 136, 'x', 'x', 'y', 'w', 135, 149, 180, 165, 180, 165, 166, 151, 135, 135, 'x', 135, 134, 165, 195, 165, 181, 166, 166, 135, 136, 136, 'x', 135, 134, 165, 180, 165, 165, 166, 150, 136, 136, 136, 'x', 135, 135, 165, 180, 150, 165, 150, 150, 136, 'x', 'x', 'y', 'w', 135, 149, 180, 165, 180, 165, 166, 151, 135, 135, 'x', 135, 150, 165, 195, 165, 181, 166, 166, 135, 136, 136, 'x', 135, 134, 165, 179, 165, 165, 166, 166, 136, 136, 136, 'x', 135, 135, 165, 180, 150, 165, 150, 150, 136, 'x', 'x', 'x', 135, 135, 149, 180, 165, 180, 165, 166, 151, 135, 135, 'x', 135, 150, 165, 195, 165, 181, 166, 166, 135, 136, 136, 'x', 135, 134, 165, 179, 165, 165, 166, 166, 136, 136, 136, 'x', 135, 135, 165, 180, 150, 165, 150, 150, 136, 'x', 'x', 'x', 135, 135, 149, 180, 165, 180, 165, 166, 151, 135, 135, 'x', 135, 150, 165, 195, 165, 181, 166, 166, 136, 136, 136, 'x', 135, 134, 165, 179, 165, 165, 166, 166, 136, 'x', 136, 'x', 135, 135, 165, 180, 150, 165, 166, 150, 136, 136, 'x', 'x', 135, 135, 149, 180, 165, 180, 165, 166, 151, 135, 135, 'x', 135, 150, 165, 195, 165, 181, 166, 166, 135, 136, 136, 'x', 135, 134, 165, 179, 165, 165, 166, 166, 136, 136, 136, 'x', 135, 135, 165, 180, 150, 165, 166, 150, 136, 136, 'x', 'x', 135, 135, 149, 180, 165, 180, 165, 166, 151, 135, 135, 'x', 135, 150, 165, 195, 165, 181, 165, 166, 135, 136, 135, 'x', 135, 134, 165, 179, 165, 181, 166, 166, 136, 136, 136, 'x', 135, 135, 165, 180, 150, 165, 166, 150, 136, 136, 'x', 'x', 135, 135, 149, 180, 165, 180, 165, 166, 151, 135, 135, 136, 135, 150, 165, 195, 165, 180, 165, 166, 135, 136, 135, 'x', 135, 134, 165, 179, 165, 181, 166, 166, 135, 136, 136, 'x', 135, 135, 165, 180, 150, 165, 166, 150, 136, 136, 'x', 'x', 135, 135, 149, 180, 165, 180, 165, 165, 151, 135, 135, 136, 134, 150, 164, 195, 165, 165, 165, 166, 151, 135, 135, 'x', 135, 134, 165, 195, 165, 181, 166, 166, 135, 136, 'x', 'x', 135, 135};

    public static class BirthHoroscope {
        private static final String BASE_DATE_STRING = "1900-1-31";
        private static final long DAY_IN_MILLS = 86400000;
        private static Date sBaseDate;
        private static final SimpleDateFormat sChineseDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        private static String[] sDiZhi;
        private static boolean sIsInitialized;
        private static String[] sJiaZi;
        private static String[] sTianGan;
        private Calendar mCalendar;
        private int mDay;
        private int mHour;
        private int mMonth;
        private int mYear;

        public BirthHoroscope(Calendar c, int year, int month, int day, int hour) {
            this.mCalendar = c;
            this.mYear = year;
            this.mMonth = month;
            this.mDay = day;
            this.mHour = hour;
        }

        public static BirthHoroscope newInstance(Resources res, Calendar calendar) {
            Resources resources = res;
            try {
                int iMonth = 1;
                if (!sIsInitialized) {
                    sTianGan = resources.getStringArray(R.array.tian_gan);
                    sDiZhi = resources.getStringArray(R.array.di_zhi);
                    sJiaZi = resources.getStringArray(R.array.jia_zi);
                    sBaseDate = sChineseDateFormat.parse(BASE_DATE_STRING);
                    sIsInitialized = true;
                }
                int dayOffset = (int) ((calendar.getTime().getTime() - sBaseDate.getTime()) / 86400000);
                int lunarDay = dayOffset + 40;
                int lunarMonth = 14;
                int dayOfYear = 0;
                int iYear = LunarDate.MIN_LUNAR_YEAR;
                while (iYear < LunarDate.MAX_LUNAR_YEAR && dayOffset > 0) {
                    dayOfYear = LunarDate.yrDays(iYear);
                    dayOffset -= dayOfYear;
                    lunarMonth += 12;
                    iYear++;
                }
                if (dayOffset < 0) {
                    dayOffset += dayOfYear;
                    iYear--;
                    lunarMonth -= 12;
                }
                int year = iYear;
                int lunarYear = iYear - 1864;
                int leapMonth = LunarDate.rMonth(iYear);
                boolean isLeapYear = false;
                int lunarMonth2 = lunarMonth;
                lunarMonth = 0;
                while (iMonth < 13 && dayOffset > 0) {
                    if (leapMonth <= 0 || iMonth != leapMonth + 1 || isLeapYear) {
                        lunarMonth = LunarDate.mthDays(year, iMonth);
                    } else {
                        iMonth--;
                        isLeapYear = true;
                        lunarMonth = LunarDate.rMthDays(year);
                    }
                    dayOffset -= lunarMonth;
                    if (isLeapYear && iMonth == leapMonth + 1) {
                        isLeapYear = false;
                    }
                    if (!isLeapYear) {
                        lunarMonth2++;
                    }
                    iMonth++;
                }
                if (dayOffset == 0 && leapMonth > 0 && iMonth == leapMonth + 1) {
                    if (isLeapYear) {
                        isLeapYear = false;
                    } else {
                        isLeapYear = true;
                        iMonth--;
                        lunarMonth2--;
                    }
                }
                if (dayOffset < 0) {
                    dayOffset += lunarMonth;
                    iMonth--;
                    lunarMonth2--;
                }
                Calendar calendar2 = calendar;
                return new BirthHoroscope(calendar2, year, iMonth, dayOffset + 1, calendar2.get(11));
            } catch (Exception e) {
                e.printStackTrace();
                return null;
            }
        }

        public String getBirthHoroscope() {
            int yearOffset = (this.mYear - 1864) % 60;
            String year = sJiaZi[yearOffset];
            int monthOffset = ((yearOffset % 5) + 1) * 2;
            if (monthOffset == 10) {
                monthOffset = 0;
            }
            String month = new StringBuilder();
            month.append(sTianGan[((this.mMonth + monthOffset) - 1) % 10]);
            month.append(sDiZhi[((this.mMonth + 2) - 1) % 12]);
            month = month.toString();
            int dayOffset = getRiZhu();
            String day = sJiaZi[dayOffset];
            int hourOffset = (dayOffset % 5) * 2;
            int lunarHourIndex = getLunarHourIndex(this.mHour);
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(sTianGan[(hourOffset + lunarHourIndex) % 10]);
            stringBuilder.append(sDiZhi[lunarHourIndex]);
            String hour = stringBuilder.toString();
            stringBuilder = new StringBuilder();
            stringBuilder.append(year);
            stringBuilder.append(month);
            stringBuilder.append(day);
            stringBuilder.append(hour);
            return stringBuilder.toString();
        }

        private static int getLunarHourIndex(int hour) {
            return ((hour + 1) % 24) / 2;
        }

        public int getRiZhu() {
            return (((int) ((this.mCalendar.getTime().getTime() - sBaseDate.getTime()) / 86400000)) + 40) % sJiaZi.length;
        }
    }

    public static String getSolarTerm(Resources res, Calendar c) {
        int year = c.get(1);
        int month = c.get(2);
        int day = c.get(5);
        char flag = solarTermsTable[((year - 1901) * 12) + month];
        if (day == (flag % 16) + 15) {
            return res.getString(solarTerms[(2 * month) + 1]);
        }
        if (day == 15 - (flag / 16)) {
            return res.getString(solarTerms[2 * month]);
        }
        return null;
    }

    private static final int yrDays(int y) {
        int sum = 348;
        for (int i = 32768; i > 8; i >>= 1) {
            if ((luYearData[y - 1900] & ((long) i)) != 0) {
                sum++;
            }
        }
        return rMthDays(y) + sum;
    }

    public static final int rMthDays(int y) {
        if (rMonth(y) == 0) {
            return 0;
        }
        if ((luYearData[y - 1900] & MiuiConfiguration.THEME_FLAG_CLOCK) != 0) {
            return 30;
        }
        return 29;
    }

    public static final int rMonth(int y) {
        return (int) (luYearData[y - 1900] & 15);
    }

    public static final int mthDays(int y, int m) {
        if ((luYearData[y - 1900] & ((long) (65536 >> m))) == 0) {
            return 29;
        }
        return 30;
    }

    static boolean isSolarLeapYear(int iYear) {
        return (iYear % 4 == 0 && iYear % 100 != 0) || iYear % 400 == 0;
    }

    static int getSolarYearMonthDays(int iYear, int iMonth) {
        if (iMonth == 1 || iMonth == 3 || iMonth == 5 || iMonth == 7 || iMonth == 8 || iMonth == 10 || iMonth == 12) {
            return 31;
        }
        if (iMonth == 4 || iMonth == 6 || iMonth == 9 || iMonth == 11) {
            return 30;
        }
        if (iMonth != 2) {
            return 0;
        }
        if (isSolarLeapYear(iYear)) {
            return 29;
        }
        return 28;
    }

    public static int[] lunarToSolar(int y, int m, int d) {
        int iSYear;
        int[] solar_date = new int[3];
        int iOffsetDays = getLunarNewYearOffsetDays(y, m, d) + iSolarLunarOffsetTable[y - 1901];
        int iYearDays = isSolarLeapYear(y) ? 366 : 365;
        if (iOffsetDays >= iYearDays) {
            iSYear = y + 1;
            iOffsetDays -= iYearDays;
        } else {
            iSYear = y;
        }
        int iSDay = iOffsetDays + 1;
        int iOffsetDays2 = iOffsetDays;
        iOffsetDays = 1;
        while (iOffsetDays2 >= 0) {
            iSDay = iOffsetDays2 + 1;
            iOffsetDays2 -= getSolarYearMonthDays(iSYear, iOffsetDays);
            iOffsetDays++;
        }
        iOffsetDays--;
        solar_date[0] = iSYear;
        solar_date[1] = iOffsetDays;
        solar_date[2] = iSDay;
        return solar_date;
    }

    private static int getLunarNewYearOffsetDays(int y, int m, int d) {
        int iOffsetDays = 0;
        int iLeapMonth = rMonth(y);
        if (iLeapMonth > 0 && iLeapMonth == m - 12) {
            m = iLeapMonth;
            iOffsetDays = 0 + mthDays(y, m);
        }
        for (int i = 1; i < m; i++) {
            iOffsetDays += mthDays(y, i);
            if (i == iLeapMonth) {
                iOffsetDays += rMthDays(y);
            }
        }
        return iOffsetDays + (d - 1);
    }

    public static final long[] calLunar(int y, int m, int d) {
        long[] lunar_date = new long[7];
        int temp = 0;
        long offset = (long) getDayOffset(y, m, d);
        lunar_date[5] = 40 + offset;
        lunar_date[4] = 14;
        int i = MIN_LUNAR_YEAR;
        while (i < MAX_LUNAR_YEAR && offset > 0) {
            temp = yrDays(i);
            offset -= (long) temp;
            lunar_date[4] = lunar_date[4] + 12;
            i++;
        }
        if (offset < 0) {
            offset += (long) temp;
            i--;
            lunar_date[4] = lunar_date[4] - 12;
        }
        lunar_date[0] = (long) i;
        lunar_date[3] = (long) (i - 1864);
        int leap = rMonth(i);
        lunar_date[6] = 0;
        i = 1;
        while (i < 13 && offset > 0) {
            if (leap > 0 && i == leap + 1 && lunar_date[6] == 0) {
                i--;
                lunar_date[6] = 1;
                temp = rMthDays((int) lunar_date[0]);
            } else {
                temp = mthDays((int) lunar_date[0], i);
            }
            if (lunar_date[6] == 1 && i == leap + 1) {
                lunar_date[6] = 0;
            }
            offset -= (long) temp;
            if (lunar_date[6] == 0) {
                lunar_date[4] = lunar_date[4] + 1;
            }
            i++;
        }
        if (offset == 0 && leap > 0 && i == leap + 1) {
            if (lunar_date[6] == 1) {
                lunar_date[6] = 0;
            } else {
                lunar_date[6] = 1;
                i--;
                lunar_date[4] = lunar_date[4] - 1;
            }
        }
        if (offset < 0) {
            offset += (long) temp;
            i--;
            lunar_date[4] = lunar_date[4] - 1;
        }
        lunar_date[1] = (long) i;
        lunar_date[2] = 1 + offset;
        return lunar_date;
    }

    private static final int getDayOffset(int y, int m, int d) {
        GregorianCalendar cal = (GregorianCalendar) Calendar.getInstance();
        cal.clear();
        int dayOffset = 0;
        for (int i = MIN_LUNAR_YEAR; i < y; i++) {
            if (cal.isLeapYear(i)) {
                dayOffset += 366;
            } else {
                dayOffset += 365;
            }
        }
        cal.set(y, m, d);
        dayOffset += cal.get(6);
        cal.set(MIN_LUNAR_YEAR, 0, 31);
        return dayOffset - cal.get(6);
    }

    public static final String getDayString(Resources res, int day) {
        String a = "";
        if (day == 10) {
            return res.getString(R.string.lunar_chu_shi);
        }
        if (day == 20) {
            return res.getString(R.string.lunar_er_shi);
        }
        if (day == 30) {
            return res.getString(R.string.lunar_san_shi);
        }
        int two = day / 10;
        if (two == 0) {
            a = res.getString(R.string.lunar_chu);
        }
        if (two == 1) {
            a = res.getString(R.string.lunar_shi);
        }
        if (two == 2) {
            a = res.getString(R.string.lunar_nian);
        }
        if (two == 3) {
            a = res.getString(R.string.lunar_san);
        }
        StringBuilder stringBuilder;
        switch (day % 10) {
            case 1:
                stringBuilder = new StringBuilder();
                stringBuilder.append(a);
                stringBuilder.append(res.getString(R.string.lunar_yi));
                a = stringBuilder.toString();
                break;
            case 2:
                stringBuilder = new StringBuilder();
                stringBuilder.append(a);
                stringBuilder.append(res.getString(R.string.lunar_er));
                a = stringBuilder.toString();
                break;
            case 3:
                stringBuilder = new StringBuilder();
                stringBuilder.append(a);
                stringBuilder.append(res.getString(R.string.lunar_san));
                a = stringBuilder.toString();
                break;
            case 4:
                stringBuilder = new StringBuilder();
                stringBuilder.append(a);
                stringBuilder.append(res.getString(R.string.lunar_si));
                a = stringBuilder.toString();
                break;
            case 5:
                stringBuilder = new StringBuilder();
                stringBuilder.append(a);
                stringBuilder.append(res.getString(R.string.lunar_wu));
                a = stringBuilder.toString();
                break;
            case 6:
                stringBuilder = new StringBuilder();
                stringBuilder.append(a);
                stringBuilder.append(res.getString(R.string.lunar_liu));
                a = stringBuilder.toString();
                break;
            case 7:
                stringBuilder = new StringBuilder();
                stringBuilder.append(a);
                stringBuilder.append(res.getString(R.string.lunar_qi));
                a = stringBuilder.toString();
                break;
            case 8:
                stringBuilder = new StringBuilder();
                stringBuilder.append(a);
                stringBuilder.append(res.getString(R.string.lunar_ba));
                a = stringBuilder.toString();
                break;
            case 9:
                stringBuilder = new StringBuilder();
                stringBuilder.append(a);
                stringBuilder.append(res.getString(R.string.lunar_jiu));
                a = stringBuilder.toString();
                break;
        }
        return a;
    }

    public static String getMonthString(Resources res, int k) {
        if (k > 12) {
            return null;
        }
        switch (k) {
            case 0:
                return "";
            case 1:
                return res.getString(R.string.lunar_zheng);
            case 2:
                return res.getString(R.string.lunar_er);
            case 3:
                return res.getString(R.string.lunar_san);
            case 4:
                return res.getString(R.string.lunar_si);
            case 5:
                return res.getString(R.string.lunar_wu);
            case 6:
                return res.getString(R.string.lunar_liu);
            case 7:
                return res.getString(R.string.lunar_qi);
            case 8:
                return res.getString(R.string.lunar_ba);
            case 9:
                return res.getString(R.string.lunar_jiu);
            case 10:
                return res.getString(R.string.lunar_shi);
            case 11:
                return res.getString(R.string.lunar_shi_yi);
            case 12:
                return res.getString(R.string.lunar_shi_er);
            default:
                return null;
        }
    }

    public static String getYearString(Resources res, int year) {
        StringBuffer sb = new StringBuffer();
        int i = 0;
        int k = year;
        do {
            i = k % 10;
            k /= 10;
            sb.insert(0, getDigitString(res, i));
        } while (k > 0);
        return sb.toString();
    }

    public static String getString(Resources res, Calendar c) {
        return solar2lunar(res, c.get(1), c.get(2), c.get(5));
    }

    public static String solar2lunar(Resources res, int year, int month, int day) {
        long[] l = calLunar(year, month, day);
        StringBuffer sLunar = new StringBuffer();
        try {
            if (l[6] == 1) {
                sLunar.append(res.getString(R.string.lunar_leap));
            }
            sLunar.append(getMonthString(res, (int) l[1]));
            sLunar.append(res.getString(R.string.lunar_yue));
            sLunar.append(getDayString(res, (int) l[2]));
            return sLunar.toString();
        } catch (Throwable th) {
        }
    }

    public static String getHoliday(Resources res, long[] lunar, Calendar c, String countryOfLocale) {
        Resources resources = res;
        Calendar calendar = c;
        try {
            int[] solarHolidayDates;
            int[] solarHolidayStrings;
            int solarMonth = calendar.get(2) + 1;
            int solarDay = calendar.get(5);
            if (C0015Build.checkRegion("TW")) {
                solarHolidayDates = solarHolidaysTable_TW;
                solarHolidayStrings = solarHolidays_TW;
            } else if (C0015Build.checkRegion("HK")) {
                solarHolidayDates = solarHolidaysTable_HK;
                solarHolidayStrings = solarHolidays_HK;
            } else {
                solarHolidayDates = solarHolidaysTable;
                solarHolidayStrings = solarHolidays;
            }
            int length = solarHolidayDates.length;
            int i = 0;
            int i2 = 0;
            while (i2 < length) {
                if (solarHolidayDates[i2] / 100 == solarMonth && solarHolidayDates[i2] % 100 == solarDay) {
                    return resources.getString(solarHolidayStrings[i2]);
                }
                i2++;
            }
            if (C0015Build.checkRegion("HK")) {
                String easter = isEasterDay(resources, calendar);
                if (!TextUtils.isEmpty(easter)) {
                    return easter;
                }
            }
            if (lunar[6] == 1) {
                return null;
            }
            int lunarMonth = (int) lunar[1];
            int lunarDay = (int) lunar[2];
            length = lunarHolidaysTable.length;
            while (i < length) {
                if (lunarHolidaysTable[i] / 100 == lunarMonth && lunarHolidaysTable[i] % 100 == lunarDay) {
                    return resources.getString(lunarHolidays[i]);
                }
                i++;
            }
            return null;
        } catch (Exception e) {
        }
    }

    private static String getDigitString(Resources res, int digit) {
        switch (digit) {
            case 0:
                return res.getString(R.string.lunar_ling);
            case 1:
                return res.getString(R.string.lunar_yi);
            case 2:
                return res.getString(R.string.lunar_er);
            case 3:
                return res.getString(R.string.lunar_san);
            case 4:
                return res.getString(R.string.lunar_si);
            case 5:
                return res.getString(R.string.lunar_wu);
            case 6:
                return res.getString(R.string.lunar_liu);
            case 7:
                return res.getString(R.string.lunar_qi);
            case 8:
                return res.getString(R.string.lunar_ba);
            case 9:
                return res.getString(R.string.lunar_jiu);
            default:
                return "";
        }
    }

    public static String getLunarString(Resources res, int year, int month, int day) {
        StringBuilder sb = new StringBuilder();
        if (year > 0) {
            sb.append(Integer.toString(year));
            sb.append(res.getString(R.string.lunar_year));
        }
        if (month >= 12) {
            sb.append(res.getString(R.string.lunar_leap));
            month -= 12;
        }
        sb.append(getMonthString(res, month + 1));
        sb.append(res.getString(R.string.lunar_yue));
        sb.append(getDayString(res, day));
        return sb.toString();
    }

    public static String formatLunarDate(int year, int monthOfYear, int dayOfMonth) {
        StringBuilder sb = new StringBuilder();
        if (year > 0) {
            sb.append(year);
            sb.append("-");
        }
        sb.append(monthOfYear + 1);
        sb.append("-");
        sb.append(dayOfMonth);
        return sb.toString();
    }

    public static int[] parseLunarDate(String lunarDate) {
        if (TextUtils.isEmpty(lunarDate)) {
            return null;
        }
        int[] result = new int[3];
        try {
            String[] date = lunarDate.split("-");
            if (date.length == 2) {
                result[0] = Integer.parseInt(date[1].trim());
                result[1] = Integer.parseInt(date[0].trim()) - 1;
                result[2] = 0;
            } else if (date.length == 3) {
                result[0] = Integer.parseInt(date[2].trim());
                result[1] = Integer.parseInt(date[1].trim()) - 1;
                result[2] = Integer.parseInt(date[0].trim());
            } else {
                result = null;
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            result = null;
        }
        return result;
    }

    public static int[][] getLunarBirthdays(int lunarYear, int lunarMonth, int lunarDay) {
        int[][] results;
        int day;
        int[] lunarParts;
        int i = 1;
        lunarMonth++;
        if (lunarMonth > 12) {
            if (lunarMonth - 12 == rMonth(lunarYear)) {
                results = new int[2][];
                day = Math.min(rMthDays(lunarYear), lunarDay);
                lunarParts = lunarToSolar(lunarYear, lunarMonth, day);
                int[] iArr = new int[4];
                iArr[0] = lunarParts[0];
                iArr[1] = lunarParts[1] - 1;
                iArr[2] = lunarParts[2];
                iArr[3] = day == lunarDay ? 0 : 1;
                results[0] = iArr;
            } else {
                results = new int[1][];
            }
            lunarMonth -= 12;
        } else {
            results = new int[1][];
        }
        day = Math.min(mthDays(lunarYear, lunarMonth), lunarDay);
        lunarParts = lunarToSolar(lunarYear, lunarMonth, day);
        int length = results.length - 1;
        int[] iArr2 = new int[4];
        iArr2[0] = lunarParts[0];
        iArr2[1] = lunarParts[1] - 1;
        iArr2[2] = lunarParts[2];
        if (day == lunarDay) {
            i = 0;
        }
        iArr2[3] = i;
        results[length] = iArr2;
        return results;
    }

    public static long getNextLunarBirthday(int lunarMonth, int lunarDay) {
        long[] lunarParts;
        Time time = new Time();
        time.setToNow();
        long[] lunarParts2 = calLunar(time.year, time.month, time.monthDay);
        int lunarYear = (int) lunarParts2[0];
        time.second = 0;
        time.minute = 0;
        time.hour = 0;
        long timeNow = time.normalize(false);
        long j = Long.MAX_VALUE;
        long timeResult = Long.MAX_VALUE;
        while (j == timeResult && lunarYear >= MIN_LUNAR_YEAR && lunarYear < MAX_LUNAR_YEAR) {
            int[][] birthdays = getLunarBirthdays(lunarYear, lunarMonth, lunarDay);
            int length = birthdays.length;
            long timeResult2 = timeResult;
            int timeResult3 = 0;
            while (timeResult3 < length) {
                int[] birthday = birthdays[timeResult3];
                lunarParts = lunarParts2;
                time.set(birthday[2], birthday[1], birthday[0]);
                j = time.normalize(false);
                if (j >= timeNow) {
                    timeResult2 = Math.min(timeResult2, j);
                }
                timeResult3++;
                lunarParts2 = lunarParts;
            }
            lunarYear++;
            timeResult = timeResult2;
            j = Long.MAX_VALUE;
        }
        int i = lunarMonth;
        int i2 = lunarDay;
        lunarParts = lunarParts2;
        if (Long.MAX_VALUE == timeResult) {
            return 0;
        }
        return timeResult;
    }

    private static String isEasterDay(Resources res, Calendar calendar) {
        int d;
        int n;
        int month;
        int y = calendar.get(1);
        if (sEasterCache.containsKey(Integer.valueOf(y))) {
            d = ((Integer) sEasterCache.get(Integer.valueOf(y))).intValue();
        } else {
            n = y - 1900;
            int a = n % 19;
            int m = (((11 * a) + 4) - ((int) Math.floor((double) (((7 * a) + 1) / 19)))) % 29;
            d = 25 - m;
            d -= (((n + ((int) Math.floor((double) (n / 4)))) + 31) - m) % 7;
            sEasterCache.put(Integer.valueOf(y), Integer.valueOf(d));
        }
        if (d == 0) {
            month = 3;
            n = 31;
        } else if (d > 0) {
            month = 4;
            n = d;
        } else {
            month = 3;
            n = 31 + d;
        }
        Date date1 = new Date();
        date1.setMonth(calendar.get(2));
        date1.setDate(calendar.get(5));
        Date date2 = new Date();
        date2.setMonth(month - 1);
        date2.setDate(n);
        int dayOffset = (int) ((date2.getTime() - date1.getTime()) / VipConstants.DAY);
        int resId = 0;
        if (dayOffset == 0) {
            resId = R.string.easter;
        } else if (dayOffset == 1) {
        }
        if (resId > 0) {
            return res.getString(resId);
        }
        return null;
    }
}
