.class public Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;
.super Ljava/lang/Object;
.source "ServerSearchRequest.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/search/core/source/server/ServerSearchRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private mMethod:I

.field private mQueryAppendPath:Ljava/lang/String;

.field private mQueryParams:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mQueryPathPrefix:Ljava/lang/String;

.field private mReportError:Z

.field private mResponseListener:Lcom/miui/gallery/net/base/ResponseListener;

.field private mResultDataType:Ljava/lang/reflect/Type;

.field private mUseCache:Z

.field private mUserId:Ljava/lang/String;

.field private mUserPath:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 179
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 188
    invoke-static {}, Lcom/miui/gallery/cloud/HostManager$Search;->getSearchUrlHost()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->mQueryPathPrefix:Ljava/lang/String;

    .line 189
    const-class v0, Lcom/google/gson/JsonObject;

    iput-object v0, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->mResultDataType:Ljava/lang/reflect/Type;

    .line 190
    const/16 v0, 0x3e9

    iput v0, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->mMethod:I

    .line 191
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->mUseCache:Z

    .line 192
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->mReportError:Z

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;)Lcom/miui/gallery/net/base/ResponseListener;
    .locals 1
    .param p0, "x0"    # Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;

    .prologue
    .line 179
    iget-object v0, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->mResponseListener:Lcom/miui/gallery/net/base/ResponseListener;

    return-object v0
.end method

.method static synthetic access$100(Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;)Z
    .locals 1
    .param p0, "x0"    # Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;

    .prologue
    .line 179
    iget-boolean v0, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->mUseCache:Z

    return v0
.end method

.method static synthetic access$200(Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;)Ljava/lang/reflect/Type;
    .locals 1
    .param p0, "x0"    # Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;

    .prologue
    .line 179
    iget-object v0, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->mResultDataType:Ljava/lang/reflect/Type;

    return-object v0
.end method

.method public static getDefaultUserPath(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "userId"    # Ljava/lang/String;

    .prologue
    .line 234
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 236
    const-string/jumbo v0, "user"

    .line 238
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public addQueryParam(Ljava/lang/String;Ljava/lang/String;)Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 257
    if-eqz p1, :cond_1

    .line 258
    iget-object v0, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->mQueryParams:Ljava/util/Map;

    if-nez v0, :cond_0

    .line 259
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->mQueryParams:Ljava/util/Map;

    .line 261
    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->mQueryParams:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 263
    :cond_1
    return-object p0
.end method

.method public addQueryParams(Ljava/util/Map;)Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;"
        }
    .end annotation

    .prologue
    .line 247
    .local p1, "queryParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz p1, :cond_1

    .line 248
    iget-object v0, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->mQueryParams:Ljava/util/Map;

    if-nez v0, :cond_0

    .line 249
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->mQueryParams:Ljava/util/Map;

    .line 251
    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->mQueryParams:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 253
    :cond_1
    return-object p0
.end method

.method public build()Lcom/miui/gallery/search/core/source/server/ServerSearchRequest;
    .locals 2

    .prologue
    .line 295
    new-instance v0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest;-><init>(Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$1;)V

    return-object v0
.end method

.method public getMethod()I
    .locals 1

    .prologue
    .line 277
    iget v0, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->mMethod:I

    return v0
.end method

.method public getQueryParams()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 195
    iget-object v0, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->mQueryParams:Ljava/util/Map;

    return-object v0
.end method

.method public getQueryPath()Ljava/lang/String;
    .locals 3

    .prologue
    .line 199
    new-instance v0, Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->mQueryPathPrefix:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 200
    .local v0, "stringBuilder":Ljava/lang/StringBuilder;
    iget-object v1, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->mUserPath:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 201
    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->mUserPath:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 203
    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->mQueryAppendPath:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 204
    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->mQueryAppendPath:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 206
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getUserId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 230
    iget-object v0, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->mUserId:Ljava/lang/String;

    return-object v0
.end method

.method public reportError()Z
    .locals 1

    .prologue
    .line 291
    iget-boolean v0, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->mReportError:Z

    return v0
.end method

.method public setMethod(I)Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;
    .locals 0
    .param p1, "method"    # I

    .prologue
    .line 272
    iput p1, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->mMethod:I

    .line 273
    return-object p0
.end method

.method public setQueryAppendPath(Ljava/lang/String;)Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;
    .locals 0
    .param p1, "queryAppendPath"    # Ljava/lang/String;

    .prologue
    .line 215
    iput-object p1, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->mQueryAppendPath:Ljava/lang/String;

    .line 216
    return-object p0
.end method

.method public setQueryPathPrefix(Ljava/lang/String;)Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;
    .locals 0
    .param p1, "queryPathPrefix"    # Ljava/lang/String;

    .prologue
    .line 242
    iput-object p1, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->mQueryPathPrefix:Ljava/lang/String;

    .line 243
    return-object p0
.end method

.method public setReportError(Z)Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;
    .locals 0
    .param p1, "reportError"    # Z

    .prologue
    .line 286
    iput-boolean p1, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->mReportError:Z

    .line 287
    return-object p0
.end method

.method public setResultDataType(Ljava/lang/reflect/Type;)Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;
    .locals 0
    .param p1, "resultDataType"    # Ljava/lang/reflect/Type;

    .prologue
    .line 267
    iput-object p1, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->mResultDataType:Ljava/lang/reflect/Type;

    .line 268
    return-object p0
.end method

.method public setUseCache(Z)Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;
    .locals 0
    .param p1, "useCache"    # Z

    .prologue
    .line 281
    iput-boolean p1, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->mUseCache:Z

    .line 282
    return-object p0
.end method

.method public setUserId(Ljava/lang/String;)Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;
    .locals 0
    .param p1, "userId"    # Ljava/lang/String;

    .prologue
    .line 225
    iput-object p1, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->mUserId:Ljava/lang/String;

    .line 226
    return-object p0
.end method

.method public setUserPath(Ljava/lang/String;)Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;
    .locals 0
    .param p1, "userPath"    # Ljava/lang/String;

    .prologue
    .line 220
    iput-object p1, p0, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->mUserPath:Ljava/lang/String;

    .line 221
    return-object p0
.end method
