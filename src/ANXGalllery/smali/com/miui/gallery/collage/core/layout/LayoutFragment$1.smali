.class Lcom/miui/gallery/collage/core/layout/LayoutFragment$1;
.super Ljava/lang/Object;
.source "LayoutFragment.java"

# interfaces
.implements Lcom/miui/gallery/collage/widget/CollageLayout$BitmapExchangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/collage/core/layout/LayoutFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/collage/core/layout/LayoutFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/collage/core/layout/LayoutFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/miui/gallery/collage/core/layout/LayoutFragment;

    .prologue
    .line 147
    iput-object p1, p0, Lcom/miui/gallery/collage/core/layout/LayoutFragment$1;->this$0:Lcom/miui/gallery/collage/core/layout/LayoutFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onBitmapExchange(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V
    .locals 3
    .param p1, "from"    # Landroid/graphics/Bitmap;
    .param p2, "to"    # Landroid/graphics/Bitmap;

    .prologue
    .line 150
    iget-object v2, p0, Lcom/miui/gallery/collage/core/layout/LayoutFragment$1;->this$0:Lcom/miui/gallery/collage/core/layout/LayoutFragment;

    invoke-static {v2}, Lcom/miui/gallery/collage/core/layout/LayoutFragment;->access$000(Lcom/miui/gallery/collage/core/layout/LayoutFragment;)Ljava/util/Map;

    move-result-object v2

    invoke-interface {v2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/collage/widget/CollageImageView;

    .line 151
    .local v0, "fromView":Lcom/miui/gallery/collage/widget/CollageImageView;
    iget-object v2, p0, Lcom/miui/gallery/collage/core/layout/LayoutFragment$1;->this$0:Lcom/miui/gallery/collage/core/layout/LayoutFragment;

    invoke-static {v2}, Lcom/miui/gallery/collage/core/layout/LayoutFragment;->access$000(Lcom/miui/gallery/collage/core/layout/LayoutFragment;)Ljava/util/Map;

    move-result-object v2

    invoke-interface {v2, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/collage/widget/CollageImageView;

    .line 152
    .local v1, "toView":Lcom/miui/gallery/collage/widget/CollageImageView;
    iget-object v2, p0, Lcom/miui/gallery/collage/core/layout/LayoutFragment$1;->this$0:Lcom/miui/gallery/collage/core/layout/LayoutFragment;

    invoke-static {v2}, Lcom/miui/gallery/collage/core/layout/LayoutFragment;->access$000(Lcom/miui/gallery/collage/core/layout/LayoutFragment;)Ljava/util/Map;

    move-result-object v2

    invoke-interface {v2, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 153
    iget-object v2, p0, Lcom/miui/gallery/collage/core/layout/LayoutFragment$1;->this$0:Lcom/miui/gallery/collage/core/layout/LayoutFragment;

    invoke-static {v2}, Lcom/miui/gallery/collage/core/layout/LayoutFragment;->access$000(Lcom/miui/gallery/collage/core/layout/LayoutFragment;)Ljava/util/Map;

    move-result-object v2

    invoke-interface {v2, p2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 154
    return-void
.end method
