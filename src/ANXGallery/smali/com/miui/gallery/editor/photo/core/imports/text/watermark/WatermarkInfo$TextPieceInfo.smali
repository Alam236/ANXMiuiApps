.class public Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo$TextPieceInfo;
.super Ljava/lang/Object;
.source "WatermarkInfo.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TextPieceInfo"
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo$TextPieceInfo;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public align:I

.field font:Ljava/lang/String;

.field public frameRect:[F

.field public isBold:Z

.field isVerticalText:I

.field public letterSpacing:F

.field public lines:I

.field public minSize:F

.field public size:F

.field public text:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 84
    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo$TextPieceInfo$1;

    invoke-direct {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo$TextPieceInfo$1;-><init>()V

    sput-object v0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo$TextPieceInfo;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 1
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 72
    invoke-virtual {p1}, Landroid/os/Parcel;->createFloatArray()[F

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo$TextPieceInfo;->frameRect:[F

    .line 73
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo$TextPieceInfo;->text:Ljava/lang/String;

    .line 74
    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo$TextPieceInfo;->size:F

    .line 75
    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo$TextPieceInfo;->minSize:F

    .line 76
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo$TextPieceInfo;->isVerticalText:I

    .line 77
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo$TextPieceInfo;->font:Ljava/lang/String;

    .line 78
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo$TextPieceInfo;->align:I

    .line 79
    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo$TextPieceInfo;->letterSpacing:F

    .line 80
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo$TextPieceInfo;->isBold:Z

    .line 81
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo$TextPieceInfo;->lines:I

    .line 82
    return-void

    .line 80
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    .line 51
    const/4 v0, 0x0

    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 56
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo$TextPieceInfo;->frameRect:[F

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeFloatArray([F)V

    .line 57
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo$TextPieceInfo;->text:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 58
    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo$TextPieceInfo;->size:F

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeFloat(F)V

    .line 59
    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo$TextPieceInfo;->minSize:F

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeFloat(F)V

    .line 60
    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo$TextPieceInfo;->isVerticalText:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 61
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo$TextPieceInfo;->font:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 62
    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo$TextPieceInfo;->align:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 63
    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo$TextPieceInfo;->letterSpacing:F

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeFloat(F)V

    .line 64
    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo$TextPieceInfo;->isBold:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 65
    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo$TextPieceInfo;->lines:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 66
    return-void

    .line 64
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
