.class Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleRenderData;
.super Lcom/miui/gallery/editor/photo/core/RenderData;
.source "DoodleRenderData.java"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleRenderData;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field mDoodleEntry:Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView$DoodleEntry;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 30
    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleRenderData$1;

    invoke-direct {v0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleRenderData$1;-><init>()V

    sput-object v0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleRenderData;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 1
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 26
    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/RenderData;-><init>(Landroid/os/Parcel;)V

    .line 27
    const-class v0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView$DoodleEntry;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView$DoodleEntry;

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleRenderData;->mDoodleEntry:Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView$DoodleEntry;

    .line 28
    return-void
.end method

.method constructor <init>(Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView$DoodleEntry;)V
    .locals 0
    .param p1, "doodleEntry"    # Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView$DoodleEntry;

    .prologue
    .line 10
    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/RenderData;-><init>()V

    .line 11
    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleRenderData;->mDoodleEntry:Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView$DoodleEntry;

    .line 12
    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    .line 16
    const/4 v0, 0x0

    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 21
    invoke-super {p0, p1, p2}, Lcom/miui/gallery/editor/photo/core/RenderData;->writeToParcel(Landroid/os/Parcel;I)V

    .line 22
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleRenderData;->mDoodleEntry:Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView$DoodleEntry;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 23
    return-void
.end method
