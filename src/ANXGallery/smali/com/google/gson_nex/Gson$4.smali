.class Lcom/google/gson_nex/Gson$4;
.super Lcom/google/gson_nex/TypeAdapter;
.source "Gson.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/gson_nex/Gson;->floatAdapter(Z)Lcom/google/gson_nex/TypeAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/gson_nex/TypeAdapter",
        "<",
        "Ljava/lang/Number;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/gson_nex/Gson;


# direct methods
.method constructor <init>(Lcom/google/gson_nex/Gson;)V
    .locals 0

    .prologue
    .line 274
    iput-object p1, p0, Lcom/google/gson_nex/Gson$4;->this$0:Lcom/google/gson_nex/Gson;

    invoke-direct {p0}, Lcom/google/gson_nex/TypeAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public read(Lcom/google/gson_nex/stream/JsonReader;)Ljava/lang/Float;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 276
    invoke-virtual {p1}, Lcom/google/gson_nex/stream/JsonReader;->peek()Lcom/google/gson_nex/stream/JsonToken;

    move-result-object v0

    sget-object v1, Lcom/google/gson_nex/stream/JsonToken;->NULL:Lcom/google/gson_nex/stream/JsonToken;

    if-ne v0, v1, :cond_0

    .line 277
    invoke-virtual {p1}, Lcom/google/gson_nex/stream/JsonReader;->nextNull()V

    .line 278
    const/4 v0, 0x0

    .line 280
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p1}, Lcom/google/gson_nex/stream/JsonReader;->nextDouble()D

    move-result-wide v0

    double-to-float v0, v0

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    goto :goto_0
.end method

.method public bridge synthetic read(Lcom/google/gson_nex/stream/JsonReader;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 274
    invoke-virtual {p0, p1}, Lcom/google/gson_nex/Gson$4;->read(Lcom/google/gson_nex/stream/JsonReader;)Ljava/lang/Float;

    move-result-object v0

    return-object v0
.end method

.method public write(Lcom/google/gson_nex/stream/JsonWriter;Ljava/lang/Number;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 283
    if-nez p2, :cond_0

    .line 284
    invoke-virtual {p1}, Lcom/google/gson_nex/stream/JsonWriter;->nullValue()Lcom/google/gson_nex/stream/JsonWriter;

    .line 290
    :goto_0
    return-void

    .line 287
    :cond_0
    invoke-virtual {p2}, Ljava/lang/Number;->floatValue()F

    move-result v0

    .line 288
    iget-object v1, p0, Lcom/google/gson_nex/Gson$4;->this$0:Lcom/google/gson_nex/Gson;

    float-to-double v2, v0

    invoke-static {v1, v2, v3}, Lcom/google/gson_nex/Gson;->access$000(Lcom/google/gson_nex/Gson;D)V

    .line 289
    invoke-virtual {p1, p2}, Lcom/google/gson_nex/stream/JsonWriter;->value(Ljava/lang/Number;)Lcom/google/gson_nex/stream/JsonWriter;

    goto :goto_0
.end method

.method public bridge synthetic write(Lcom/google/gson_nex/stream/JsonWriter;Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 274
    check-cast p2, Ljava/lang/Number;

    invoke-virtual {p0, p1, p2}, Lcom/google/gson_nex/Gson$4;->write(Lcom/google/gson_nex/stream/JsonWriter;Ljava/lang/Number;)V

    return-void
.end method
