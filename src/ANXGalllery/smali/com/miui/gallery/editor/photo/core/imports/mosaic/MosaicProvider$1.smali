.class Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicProvider$1;
.super Ljava/lang/Object;
.source "MosaicProvider.java"

# interfaces
.implements Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicProvider$ResourceListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicProvider;->initialize()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicProvider;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicProvider;)V
    .locals 0
    .param p1, "this$0"    # Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicProvider;

    .prologue
    .line 70
    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicProvider$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicProvider;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLoadFinish(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLEntity;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 73
    .local p1, "mosaicEntities":Ljava/util/List;, "Ljava/util/List<Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLEntity;>;"
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicProvider$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicProvider;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicProvider;->access$000(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicProvider;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 74
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicProvider$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicProvider;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicProvider;->access$000(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicProvider;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 75
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicProvider$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicProvider;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicProvider;->access$100(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicProvider;)V

    .line 76
    return-void
.end method
