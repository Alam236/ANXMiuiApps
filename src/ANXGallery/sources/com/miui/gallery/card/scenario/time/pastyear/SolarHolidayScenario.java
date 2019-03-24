package com.miui.gallery.card.scenario.time.pastyear;

import com.miui.gallery.assistant.model.MediaFeatureItem;
import com.miui.gallery.card.Card;
import com.miui.gallery.card.scenario.DateUtils;
import com.miui.gallery.card.scenario.Record;
import com.miui.gallery.card.scenario.time.HolidayConfig;
import com.miui.gallery.card.scenario.time.HolidayScenario;
import com.miui.gallery.util.assistant.HolidaysUtil;
import java.util.LinkedList;
import java.util.List;
import miui.date.Calendar;
import miui.hybrid.Response;

public class SolarHolidayScenario extends HolidayScenario {
    private final List<HolidayConfig> mHolidayConfig = new LinkedList();

    public SolarHolidayScenario() {
        super(102, 1, 7);
        this.mHolidayConfig.add(new HolidayConfig(Response.CODE_GENERIC_ERROR, Integer.MAX_VALUE, 1));
        this.mHolidayConfig.add(new HolidayConfig(Response.CODE_CONFIG_ERROR, Integer.MAX_VALUE, 1));
        this.mHolidayConfig.add(new HolidayConfig(Response.CODE_SIGNATURE_ERROR, Integer.MAX_VALUE, 3));
        this.mHolidayConfig.add(new HolidayConfig(Response.CODE_PERMISSION_ERROR, Integer.MAX_VALUE, 1));
        this.mHolidayConfig.add(new HolidayConfig(Response.CODE_FEATURE_ERROR, 2, 7));
        this.mHolidayConfig.add(new HolidayConfig(Response.CODE_ACTION_ERROR, Integer.MAX_VALUE, 1));
    }

    public boolean onPrepare(List<Record> records, List<Card> cards) {
        long now = DateUtils.getCurrentTimeMillis();
        Calendar calendar = new Calendar();
        calendar.setTimeInMillis(now);
        List<Long> recordTargetTimes = getRecordTargetTimesFromRecordAndCards(records, cards);
        for (int i = 1; i <= 8; i++) {
            this.mYear = i;
            if (HolidaysUtil.getHoliday(calendar) == -1) {
                return false;
            }
            long lastYearDateTime = DateUtils.getLastNYearDateTime(this.mYear, now);
            long[] startEndTime = getStartEndTime(lastYearDateTime, this.mHolidayConfig, false);
            if (!recordTargetTimes.contains(Long.valueOf(lastYearDateTime))) {
                setStartTime(startEndTime[0]);
                setEndTime(startEndTime[1]);
                setTargetTime(lastYearDateTime);
                List<Long> list = loadMediaItem();
                if (list != null && list.size() >= getMinImageCount()) {
                    return true;
                }
            }
        }
        return false;
    }

    public String generateTitle(Record record, List<MediaFeatureItem> list) {
        int holiday = getHolidayFromRecord(record, false);
        int year = getYearFromRecord(record);
        if (holiday != -1) {
            return HolidaysUtil.getHolidayNameForStory(year, holiday);
        }
        return "";
    }

    protected String getPrimaryKey() {
        return Integer.toString(getHolidayFromTargetTime(getTargetTime(), false));
    }
}
