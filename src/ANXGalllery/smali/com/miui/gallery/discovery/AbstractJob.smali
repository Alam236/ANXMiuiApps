.class public abstract Lcom/miui/gallery/discovery/AbstractJob;
.super Ljava/lang/Object;
.source "AbstractJob.java"


# instance fields
.field protected mJobId:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    const/4 v0, -0x1

    iput v0, p0, Lcom/miui/gallery/discovery/AbstractJob;->mJobId:I

    .line 19
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/discovery/AbstractJob;->mJobId:I

    .line 20
    return-void
.end method

.method private static isJobExtrasEquals(Landroid/os/PersistableBundle;Landroid/os/PersistableBundle;)Z
    .locals 2
    .param p0, "first"    # Landroid/os/PersistableBundle;
    .param p1, "second"    # Landroid/os/PersistableBundle;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    .line 68
    invoke-virtual {p0}, Landroid/os/PersistableBundle;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Landroid/os/PersistableBundle;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 69
    :cond_0
    invoke-virtual {p0}, Landroid/os/PersistableBundle;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Landroid/os/PersistableBundle;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_1
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public equals(Landroid/app/job/JobInfo;Landroid/app/job/JobInfo;)Z
    .locals 4
    .param p1, "self"    # Landroid/app/job/JobInfo;
    .param p2, "other"    # Landroid/app/job/JobInfo;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    .line 50
    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    .line 51
    invoke-virtual {p1}, Landroid/app/job/JobInfo;->getId()I

    move-result v0

    invoke-virtual {p2}, Landroid/app/job/JobInfo;->getId()I

    move-result v1

    if-ne v0, v1, :cond_0

    .line 52
    invoke-virtual {p1}, Landroid/app/job/JobInfo;->getService()Landroid/content/ComponentName;

    move-result-object v0

    invoke-virtual {p2}, Landroid/app/job/JobInfo;->getService()Landroid/content/ComponentName;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/ComponentName;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 53
    invoke-virtual {p1}, Landroid/app/job/JobInfo;->isPeriodic()Z

    move-result v0

    invoke-virtual {p2}, Landroid/app/job/JobInfo;->isPeriodic()Z

    move-result v1

    if-ne v0, v1, :cond_0

    .line 54
    invoke-virtual {p1}, Landroid/app/job/JobInfo;->getIntervalMillis()J

    move-result-wide v0

    invoke-virtual {p2}, Landroid/app/job/JobInfo;->getIntervalMillis()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 55
    invoke-virtual {p1}, Landroid/app/job/JobInfo;->getInitialBackoffMillis()J

    move-result-wide v0

    invoke-virtual {p2}, Landroid/app/job/JobInfo;->getInitialBackoffMillis()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 56
    invoke-virtual {p1}, Landroid/app/job/JobInfo;->getBackoffPolicy()I

    move-result v0

    invoke-virtual {p2}, Landroid/app/job/JobInfo;->getBackoffPolicy()I

    move-result v1

    if-ne v0, v1, :cond_0

    .line 57
    invoke-virtual {p1}, Landroid/app/job/JobInfo;->getNetworkType()I

    move-result v0

    invoke-virtual {p2}, Landroid/app/job/JobInfo;->getNetworkType()I

    move-result v1

    if-ne v0, v1, :cond_0

    .line 58
    invoke-virtual {p1}, Landroid/app/job/JobInfo;->isRequireCharging()Z

    move-result v0

    invoke-virtual {p2}, Landroid/app/job/JobInfo;->isRequireCharging()Z

    move-result v1

    if-ne v0, v1, :cond_0

    .line 59
    invoke-virtual {p1}, Landroid/app/job/JobInfo;->isRequireDeviceIdle()Z

    move-result v0

    invoke-virtual {p2}, Landroid/app/job/JobInfo;->isRequireDeviceIdle()Z

    move-result v1

    if-ne v0, v1, :cond_0

    .line 63
    invoke-virtual {p1}, Landroid/app/job/JobInfo;->getExtras()Landroid/os/PersistableBundle;

    move-result-object v0

    invoke-virtual {p2}, Landroid/app/job/JobInfo;->getExtras()Landroid/os/PersistableBundle;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/discovery/AbstractJob;->isJobExtrasEquals(Landroid/os/PersistableBundle;Landroid/os/PersistableBundle;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public abstract execJob()Ljava/lang/Object;
.end method

.method public getJobId()I
    .locals 1

    .prologue
    .line 27
    iget v0, p0, Lcom/miui/gallery/discovery/AbstractJob;->mJobId:I

    return v0
.end method

.method public abstract getJobInfo(Landroid/content/Context;Landroid/content/ComponentName;)Landroid/app/job/JobInfo;
.end method

.method public needsReschedule()Z
    .locals 1

    .prologue
    .line 31
    const/4 v0, 0x0

    return v0
.end method

.method public setJobId(I)V
    .locals 0
    .param p1, "jobId"    # I

    .prologue
    .line 23
    iput p1, p0, Lcom/miui/gallery/discovery/AbstractJob;->mJobId:I

    .line 24
    return-void
.end method
