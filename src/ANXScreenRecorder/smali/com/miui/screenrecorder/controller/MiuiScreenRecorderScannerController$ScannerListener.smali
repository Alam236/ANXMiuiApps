.class public interface abstract Lcom/miui/screenrecorder/controller/MiuiScreenRecorderScannerController$ScannerListener;
.super Ljava/lang/Object;
.source "MiuiScreenRecorderScannerController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/screenrecorder/controller/MiuiScreenRecorderScannerController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "ScannerListener"
.end annotation


# virtual methods
.method public abstract beforeScanner()V
.end method

.method public abstract scannerComplete(Ljava/util/ArrayList;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/miui/screenrecorder/data/GridItem;",
            ">;)V"
        }
    .end annotation
.end method
