.class public Lcom/meicam/sdk/NvsVideoStreamInfo;
.super Ljava/lang/Object;
.source "NvsVideoStreamInfo.java"


# static fields
.field public static final VIDEO_ROTATION_0:I = 0x0

.field public static final VIDEO_ROTATION_180:I = 0x2

.field public static final VIDEO_ROTATION_270:I = 0x3

.field public static final VIDEO_ROTATION_90:I = 0x1


# instance fields
.field public displayRotation:I

.field public duration:J

.field public frameRate:Lcom/meicam/sdk/NvsRational;

.field public imageHeight:I

.field public imageWidth:I

.field public pixelAspectRatio:Lcom/meicam/sdk/NvsRational;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
