.class public Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexEffectOf;
.super Ljava/lang/Object;
.source "nexSaveDataFormat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "nexEffectOf"
.end annotation


# instance fields
.field public itemMethodType:Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$ItemMethodType;

.field public mAutoID:Ljava/lang/String;

.field public mDuration:I

.field public mEffectOffset:I

.field public mEffectOverlap:I

.field public mID:Ljava/lang/String;

.field public mIsResolveOptions:Z

.field public mMaxDuration:I

.field public mMinDuration:I

.field public mName:Ljava/lang/String;

.field public mOptionsUpdate:Z

.field public mShowEndTime:I

.field public mShowStartTime:I

.field public mTitles:[Ljava/lang/String;

.field public mType:I

.field public m_effectOptions:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 195
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 205
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexEffectOf;->mTitles:[Ljava/lang/String;

    .line 207
    iput-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexEffectOf;->mIsResolveOptions:Z

    .line 212
    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexEffectOf;->mShowStartTime:I

    .line 213
    const/16 v0, 0x2710

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexEffectOf;->mShowEndTime:I

    return-void
.end method
