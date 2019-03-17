.class final Lcom/miui/gallery/cloud/GalleryErrorCode$6;
.super Ljava/lang/Object;
.source "GalleryErrorCode.java"

# interfaces
.implements Lcom/miui/gallery/cloud/GalleryErrorCode$GalleryErrorHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/cloud/GalleryErrorCode;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 239
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(Lorg/json/JSONObject;Lcom/miui/gallery/cloud/RequestItemBase;Lcom/miui/gallery/cloud/SpaceFullHandler$SpaceFullListener;)V
    .locals 4
    .param p1, "json"    # Lorg/json/JSONObject;
    .param p2, "requestItem"    # Lcom/miui/gallery/cloud/RequestItemBase;
    .param p3, "spaceFullListener"    # Lcom/miui/gallery/cloud/SpaceFullHandler$SpaceFullListener;

    .prologue
    .line 244
    const-string v2, "GalleryErrorCode"

    const-string/jumbo v3, "special error, album not exist: %s"

    if-nez p1, :cond_1

    const-string v1, ""

    :goto_0
    invoke-static {v2, v3, v1}, Lcom/miui/gallery/util/SyncLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 245
    if-eqz p2, :cond_0

    instance-of v1, p2, Lcom/miui/gallery/cloud/RequestCloudItem;

    if-nez v1, :cond_2

    .line 279
    .end local p2    # "requestItem":Lcom/miui/gallery/cloud/RequestItemBase;
    :cond_0
    :goto_1
    return-void

    .line 244
    .restart local p2    # "requestItem":Lcom/miui/gallery/cloud/RequestItemBase;
    :cond_1
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 248
    :cond_2
    check-cast p2, Lcom/miui/gallery/cloud/RequestCloudItem;

    .end local p2    # "requestItem":Lcom/miui/gallery/cloud/RequestItemBase;
    iget-object v0, p2, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    .line 249
    .local v0, "dbCloud":Lcom/miui/gallery/data/DBImage;
    invoke-virtual {v0}, Lcom/miui/gallery/data/DBImage;->isItemType()Z

    move-result v1

    if-nez v1, :cond_3

    .line 250
    invoke-virtual {v0}, Lcom/miui/gallery/data/DBImage;->getLocalFlag()I

    move-result v1

    const/4 v2, 0x2

    if-eq v1, v2, :cond_0

    .line 256
    :cond_3
    invoke-virtual {v0}, Lcom/miui/gallery/data/DBImage;->isShareItem()Z

    move-result v1

    if-nez v1, :cond_0

    .line 261
    invoke-virtual {v0}, Lcom/miui/gallery/data/DBImage;->isItemType()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 262
    invoke-virtual {v0}, Lcom/miui/gallery/data/DBImage;->getLocalFlag()I

    move-result v1

    const/4 v2, 0x6

    if-eq v1, v2, :cond_4

    .line 263
    invoke-virtual {v0}, Lcom/miui/gallery/data/DBImage;->getLocalFlag()I

    move-result v1

    const/16 v2, 0x9

    if-eq v1, v2, :cond_4

    .line 264
    invoke-virtual {v0}, Lcom/miui/gallery/data/DBImage;->getLocalFlag()I

    move-result v1

    const/16 v2, 0x8

    if-eq v1, v2, :cond_4

    .line 265
    invoke-virtual {v0}, Lcom/miui/gallery/data/DBImage;->getLocalFlag()I

    move-result v1

    const/4 v2, 0x5

    if-ne v1, v2, :cond_0

    .line 268
    :cond_4
    invoke-virtual {v0}, Lcom/miui/gallery/data/DBImage;->getLocalGroupId()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/miui/gallery/cloud/GalleryErrorCode;->access$000(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 274
    const-string v1, "GalleryErrorCode"

    const-string/jumbo v2, "this album is need to recreate later %d"

    .line 275
    invoke-virtual {v0}, Lcom/miui/gallery/data/DBImage;->getLocalGroupId()Ljava/lang/String;

    move-result-object v3

    .line 274
    invoke-static {v1, v2, v3}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 276
    invoke-virtual {v0}, Lcom/miui/gallery/data/DBImage;->getLocalGroupId()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/miui/gallery/cloud/CreateGroupItem;->recreateGroup(Ljava/lang/String;)V

    goto :goto_1
.end method
