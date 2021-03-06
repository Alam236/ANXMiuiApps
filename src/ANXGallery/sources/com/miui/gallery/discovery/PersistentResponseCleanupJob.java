package com.miui.gallery.discovery;

import android.app.job.JobInfo;
import android.app.job.JobInfo.Builder;
import android.content.ComponentName;
import android.content.Context;
import com.miui.gallery.util.PersistentResponseHelper;
import miui.mipub.MipubStat;

public class PersistentResponseCleanupJob extends AbstractJob {
    public Object execJob() {
        PersistentResponseHelper.cleanupInvalidRecords();
        return null;
    }

    public JobInfo getJobInfo(Context context, ComponentName cn) {
        return new Builder(this.mJobId, cn).setRequiredNetworkType(0).setRequiresCharging(false).setRequiresDeviceIdle(false).setPeriodic(MipubStat.STAT_EXPIRY_DATA).build();
    }
}
