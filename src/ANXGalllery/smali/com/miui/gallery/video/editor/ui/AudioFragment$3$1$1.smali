.class Lcom/miui/gallery/video/editor/ui/AudioFragment$3$1$1;
.super Ljava/lang/Object;
.source "AudioFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/video/editor/ui/AudioFragment$3$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/miui/gallery/video/editor/ui/AudioFragment$3$1;


# direct methods
.method constructor <init>(Lcom/miui/gallery/video/editor/ui/AudioFragment$3$1;)V
    .locals 0
    .param p1, "this$2"    # Lcom/miui/gallery/video/editor/ui/AudioFragment$3$1;

    .prologue
    .line 144
    iput-object p1, p0, Lcom/miui/gallery/video/editor/ui/AudioFragment$3$1$1;->this$2:Lcom/miui/gallery/video/editor/ui/AudioFragment$3$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 147
    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/AudioFragment$3$1$1;->this$2:Lcom/miui/gallery/video/editor/ui/AudioFragment$3$1;

    iget-object v0, v0, Lcom/miui/gallery/video/editor/ui/AudioFragment$3$1;->this$1:Lcom/miui/gallery/video/editor/ui/AudioFragment$3;

    iget-object v0, v0, Lcom/miui/gallery/video/editor/ui/AudioFragment$3;->this$0:Lcom/miui/gallery/video/editor/ui/AudioFragment;

    iget-object v0, v0, Lcom/miui/gallery/video/editor/ui/AudioFragment;->mContext:Landroid/content/Context;

    const v1, 0x7f0c0528

    invoke-static {v0, v1}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;I)V

    .line 148
    return-void
.end method
