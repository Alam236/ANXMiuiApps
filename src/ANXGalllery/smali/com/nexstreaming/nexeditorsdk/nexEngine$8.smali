.class Lcom/nexstreaming/nexeditorsdk/nexEngine$8;
.super Ljava/lang/Object;
.source "nexEngine.java"

# interfaces
.implements Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$s;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nexstreaming/nexeditorsdk/nexEngine;->autoTrim(Ljava/lang/String;IILcom/nexstreaming/nexeditorsdk/nexEngine$OnAutoTrimRatioResultListener;)I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/nexstreaming/nexeditorsdk/nexEngine$OnAutoTrimRatioResultListener;

.field final synthetic b:Lcom/nexstreaming/nexeditorsdk/nexEngine;


# direct methods
.method constructor <init>(Lcom/nexstreaming/nexeditorsdk/nexEngine;Lcom/nexstreaming/nexeditorsdk/nexEngine$OnAutoTrimRatioResultListener;)V
    .locals 0

    .prologue
    .line 4787
    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$8;->b:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    iput-object p2, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$8;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine$OnAutoTrimRatioResultListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(I)I
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 4796
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$8;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine$OnAutoTrimRatioResultListener;

    invoke-virtual {v0, p1, v1, v1}, Lcom/nexstreaming/nexeditorsdk/nexEngine$OnAutoTrimRatioResultListener;->onAutoTrimRatioResult(I[I[I)V

    .line 4797
    const/4 v0, 0x0

    return v0
.end method

.method public a(I[I[I)I
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 4790
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$8;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine$OnAutoTrimRatioResultListener;

    invoke-virtual {v0, v1, p2, p3}, Lcom/nexstreaming/nexeditorsdk/nexEngine$OnAutoTrimRatioResultListener;->onAutoTrimRatioResult(I[I[I)V

    .line 4791
    return v1
.end method
