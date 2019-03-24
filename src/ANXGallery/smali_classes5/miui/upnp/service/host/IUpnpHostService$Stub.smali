.class public abstract Lmiui/upnp/service/host/IUpnpHostService$Stub;
.super Landroid/os/Binder;
.source "IUpnpHostService.java"

# interfaces
.implements Lmiui/upnp/service/host/IUpnpHostService;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lmiui/upnp/service/host/IUpnpHostService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Stub"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lmiui/upnp/service/host/IUpnpHostService$Stub$Proxy;
    }
.end annotation


# static fields
.field private static final DESCRIPTOR:Ljava/lang/String; = "miui.upnp.service.host.IUpnpHostService"

.field static final TRANSACTION_register:I = 0x3

.field static final TRANSACTION_sendEvents:I = 0x5

.field static final TRANSACTION_start:I = 0x1

.field static final TRANSACTION_stop:I = 0x2

.field static final TRANSACTION_unregister:I = 0x4


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 17
    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    .line 18
    const-string v0, "miui.upnp.service.host.IUpnpHostService"

    invoke-virtual {p0, p0, v0}, Lmiui/upnp/service/host/IUpnpHostService$Stub;->attachInterface(Landroid/os/IInterface;Ljava/lang/String;)V

    .line 19
    return-void
.end method

.method public static asInterface(Landroid/os/IBinder;)Lmiui/upnp/service/host/IUpnpHostService;
    .locals 2
    .param p0, "obj"    # Landroid/os/IBinder;

    .line 26
    if-nez p0, :cond_0

    .line 27
    const/4 v0, 0x0

    return-object v0

    .line 29
    :cond_0
    const-string v0, "miui.upnp.service.host.IUpnpHostService"

    invoke-interface {p0, v0}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object v0

    .line 30
    .local v0, "iin":Landroid/os/IInterface;
    if-eqz v0, :cond_1

    instance-of v1, v0, Lmiui/upnp/service/host/IUpnpHostService;

    if-eqz v1, :cond_1

    .line 31
    move-object v1, v0

    check-cast v1, Lmiui/upnp/service/host/IUpnpHostService;

    return-object v1

    .line 33
    :cond_1
    new-instance v1, Lmiui/upnp/service/host/IUpnpHostService$Stub$Proxy;

    invoke-direct {v1, p0}, Lmiui/upnp/service/host/IUpnpHostService$Stub$Proxy;-><init>(Landroid/os/IBinder;)V

    return-object v1
.end method


# virtual methods
.method public asBinder()Landroid/os/IBinder;
    .locals 0

    .line 37
    return-object p0
.end method

.method public onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    .locals 5
    .param p1, "code"    # I
    .param p2, "data"    # Landroid/os/Parcel;
    .param p3, "reply"    # Landroid/os/Parcel;
    .param p4, "flags"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 41
    const-string v0, "miui.upnp.service.host.IUpnpHostService"

    .line 42
    .local v0, "descriptor":Ljava/lang/String;
    const v1, 0x5f4e5446

    const/4 v2, 0x1

    if-eq p1, v1, :cond_3

    const/4 v1, 0x0

    packed-switch p1, :pswitch_data_0

    .line 113
    invoke-super {p0, p1, p2, p3, p4}, Landroid/os/Binder;->onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    move-result v1

    return v1

    .line 99
    :pswitch_0
    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 101
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v3

    if-eqz v3, :cond_0

    .line 102
    sget-object v1, Lmiui/upnp/typedef/device/invocation/EventInfo;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v1, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lmiui/upnp/typedef/device/invocation/EventInfo;

    .local v1, "_arg0":Lmiui/upnp/typedef/device/invocation/EventInfo;
    goto :goto_0

    .line 105
    .end local v1    # "_arg0":Lmiui/upnp/typedef/device/invocation/EventInfo;
    :cond_0
    nop

    .line 107
    .restart local v1    # "_arg0":Lmiui/upnp/typedef/device/invocation/EventInfo;
    :goto_0
    invoke-virtual {p0, v1}, Lmiui/upnp/service/host/IUpnpHostService$Stub;->sendEvents(Lmiui/upnp/typedef/device/invocation/EventInfo;)V

    .line 108
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 109
    return v2

    .line 83
    .end local v1    # "_arg0":Lmiui/upnp/typedef/device/invocation/EventInfo;
    :pswitch_1
    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 85
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v3

    if-eqz v3, :cond_1

    .line 86
    sget-object v1, Lmiui/upnp/typedef/device/Device;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v1, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lmiui/upnp/typedef/device/Device;

    .local v1, "_arg0":Lmiui/upnp/typedef/device/Device;
    goto :goto_1

    .line 89
    .end local v1    # "_arg0":Lmiui/upnp/typedef/device/Device;
    :cond_1
    nop

    .line 92
    .restart local v1    # "_arg0":Lmiui/upnp/typedef/device/Device;
    :goto_1
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v3

    invoke-static {v3}, Lmiui/upnp/service/handler/ICompletionHandler$Stub;->asInterface(Landroid/os/IBinder;)Lmiui/upnp/service/handler/ICompletionHandler;

    move-result-object v3

    .line 93
    .local v3, "_arg1":Lmiui/upnp/service/handler/ICompletionHandler;
    invoke-virtual {p0, v1, v3}, Lmiui/upnp/service/host/IUpnpHostService$Stub;->unregister(Lmiui/upnp/typedef/device/Device;Lmiui/upnp/service/handler/ICompletionHandler;)V

    .line 94
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 95
    return v2

    .line 65
    .end local v1    # "_arg0":Lmiui/upnp/typedef/device/Device;
    .end local v3    # "_arg1":Lmiui/upnp/service/handler/ICompletionHandler;
    :pswitch_2
    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 67
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v3

    if-eqz v3, :cond_2

    .line 68
    sget-object v1, Lmiui/upnp/typedef/device/Device;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v1, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lmiui/upnp/typedef/device/Device;

    .restart local v1    # "_arg0":Lmiui/upnp/typedef/device/Device;
    goto :goto_2

    .line 71
    .end local v1    # "_arg0":Lmiui/upnp/typedef/device/Device;
    :cond_2
    nop

    .line 74
    .restart local v1    # "_arg0":Lmiui/upnp/typedef/device/Device;
    :goto_2
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v3

    invoke-static {v3}, Lmiui/upnp/service/handler/ICompletionHandler$Stub;->asInterface(Landroid/os/IBinder;)Lmiui/upnp/service/handler/ICompletionHandler;

    move-result-object v3

    .line 76
    .restart local v3    # "_arg1":Lmiui/upnp/service/handler/ICompletionHandler;
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v4

    invoke-static {v4}, Lmiui/upnp/service/handler/IActionListener$Stub;->asInterface(Landroid/os/IBinder;)Lmiui/upnp/service/handler/IActionListener;

    move-result-object v4

    .line 77
    .local v4, "_arg2":Lmiui/upnp/service/handler/IActionListener;
    invoke-virtual {p0, v1, v3, v4}, Lmiui/upnp/service/host/IUpnpHostService$Stub;->register(Lmiui/upnp/typedef/device/Device;Lmiui/upnp/service/handler/ICompletionHandler;Lmiui/upnp/service/handler/IActionListener;)V

    .line 78
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 79
    return v2

    .line 58
    .end local v1    # "_arg0":Lmiui/upnp/typedef/device/Device;
    .end local v3    # "_arg1":Lmiui/upnp/service/handler/ICompletionHandler;
    .end local v4    # "_arg2":Lmiui/upnp/service/handler/IActionListener;
    :pswitch_3
    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 59
    invoke-virtual {p0}, Lmiui/upnp/service/host/IUpnpHostService$Stub;->stop()V

    .line 60
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 61
    return v2

    .line 51
    :pswitch_4
    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 52
    invoke-virtual {p0}, Lmiui/upnp/service/host/IUpnpHostService$Stub;->start()V

    .line 53
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 54
    return v2

    .line 46
    :cond_3
    invoke-virtual {p3, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 47
    return v2

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
