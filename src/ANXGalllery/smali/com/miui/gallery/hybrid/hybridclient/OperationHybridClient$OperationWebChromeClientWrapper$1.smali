.class Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient$OperationWebChromeClientWrapper$1;
.super Ljava/lang/Object;
.source "OperationHybridClient.java"

# interfaces
.implements Lcom/miui/gallery/hybrid/hybridclient/GalleryHybridClient$ImageCountGotCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient$OperationWebChromeClientWrapper;->onShowFileChooser(Landroid/webkit/WebView;Landroid/webkit/ValueCallback;Landroid/webkit/WebChromeClient$FileChooserParams;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient$OperationWebChromeClientWrapper;


# direct methods
.method constructor <init>(Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient$OperationWebChromeClientWrapper;)V
    .locals 0
    .param p1, "this$1"    # Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient$OperationWebChromeClientWrapper;

    .prologue
    .line 153
    iput-object p1, p0, Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient$OperationWebChromeClientWrapper$1;->this$1:Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient$OperationWebChromeClientWrapper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGetMaxImageCount(I)V
    .locals 2
    .param p1, "count"    # I

    .prologue
    .line 156
    if-lez p1, :cond_0

    .line 157
    iget-object v0, p0, Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient$OperationWebChromeClientWrapper$1;->this$1:Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient$OperationWebChromeClientWrapper;

    iget-object v0, v0, Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient$OperationWebChromeClientWrapper;->this$0:Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient;

    const/16 v1, 0x14

    invoke-static {p1, v1}, Ljava/lang/Math;->min(II)I

    move-result v1

    invoke-static {v0, v1}, Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient;->access$102(Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient;I)I

    .line 159
    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient$OperationWebChromeClientWrapper$1;->this$1:Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient$OperationWebChromeClientWrapper;

    iget-object v1, p0, Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient$OperationWebChromeClientWrapper$1;->this$1:Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient$OperationWebChromeClientWrapper;

    iget-object v1, v1, Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient$OperationWebChromeClientWrapper;->this$0:Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient;

    invoke-static {v1}, Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient;->access$100(Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient;)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient$OperationWebChromeClientWrapper;->startPicker(I)V

    .line 160
    return-void
.end method
