.class Lcom/miui/internal/log/format/SimpleFormatter$1;
.super Ljava/lang/ThreadLocal;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/internal/log/format/SimpleFormatter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/ThreadLocal<",
        "Lcom/miui/internal/log/format/SimpleFormatter$ThreadCache;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic gQ:Lcom/miui/internal/log/format/SimpleFormatter;


# direct methods
.method constructor <init>(Lcom/miui/internal/log/format/SimpleFormatter;)V
    .locals 0

    .line 20
    iput-object p1, p0, Lcom/miui/internal/log/format/SimpleFormatter$1;->gQ:Lcom/miui/internal/log/format/SimpleFormatter;

    invoke-direct {p0}, Ljava/lang/ThreadLocal;-><init>()V

    return-void
.end method


# virtual methods
.method protected P()Lcom/miui/internal/log/format/SimpleFormatter$ThreadCache;
    .locals 1

    .line 23
    new-instance v0, Lcom/miui/internal/log/format/SimpleFormatter$ThreadCache;

    invoke-direct {v0}, Lcom/miui/internal/log/format/SimpleFormatter$ThreadCache;-><init>()V

    return-object v0
.end method

.method protected synthetic initialValue()Ljava/lang/Object;
    .locals 1

    .line 20
    invoke-virtual {p0}, Lcom/miui/internal/log/format/SimpleFormatter$1;->P()Lcom/miui/internal/log/format/SimpleFormatter$ThreadCache;

    move-result-object v0

    return-object v0
.end method
