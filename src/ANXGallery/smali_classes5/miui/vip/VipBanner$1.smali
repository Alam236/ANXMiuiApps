.class Lmiui/vip/VipBanner$1;
.super Ljava/lang/Object;
.source "VipBanner.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lmiui/vip/VipBanner;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator<",
        "Lmiui/vip/VipBanner;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 0

    .line 11
    invoke-virtual {p0, p1}, Lmiui/vip/VipBanner$1;->createFromParcel(Landroid/os/Parcel;)Lmiui/vip/VipBanner;

    move-result-object p1

    return-object p1
.end method

.method public createFromParcel(Landroid/os/Parcel;)Lmiui/vip/VipBanner;
    .locals 1
    .param p1, "source"    # Landroid/os/Parcel;

    .line 14
    invoke-static {p1}, Lmiui/vip/VipBanner;->readFromParcel(Landroid/os/Parcel;)Lmiui/vip/VipBanner;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 0

    .line 11
    invoke-virtual {p0, p1}, Lmiui/vip/VipBanner$1;->newArray(I)[Lmiui/vip/VipBanner;

    move-result-object p1

    return-object p1
.end method

.method public newArray(I)[Lmiui/vip/VipBanner;
    .locals 1
    .param p1, "size"    # I

    .line 19
    new-array v0, p1, [Lmiui/vip/VipBanner;

    return-object v0
.end method
