.class public Lorg/keyczar/AesKey;
.super Lorg/keyczar/KeyczarKey;
.source "AesKey.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/keyczar/AesKey$AesStream;
    }
.end annotation


# static fields
.field private static final AES_ALGORITHM:Ljava/lang/String; = "AES"

.field private static final BLOCK_SIZE:I = 0x10

.field private static final DEFAULT_MODE:Lorg/keyczar/enums/CipherMode;


# instance fields
.field private aesKey:Ljavax/crypto/SecretKey;

.field private final aesKeyString:Ljava/lang/String;
    .annotation runtime Lcom/google/gson_nex/annotations/Expose;
    .end annotation
.end field

.field private final hash:[B

.field private final hmacKey:Lorg/keyczar/HmacKey;
    .annotation runtime Lcom/google/gson_nex/annotations/Expose;
    .end annotation
.end field

.field private final mode:Lorg/keyczar/enums/CipherMode;
    .annotation runtime Lcom/google/gson_nex/annotations/Expose;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 52
    sget-object v0, Lorg/keyczar/enums/CipherMode;->CBC:Lorg/keyczar/enums/CipherMode;

    sput-object v0, Lorg/keyczar/AesKey;->DEFAULT_MODE:Lorg/keyczar/enums/CipherMode;

    return-void
.end method

.method private constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 75
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/keyczar/KeyczarKey;-><init>(I)V

    .line 59
    const/4 v0, 0x4

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/keyczar/AesKey;->hash:[B

    .line 76
    iput-object v1, p0, Lorg/keyczar/AesKey;->aesKeyString:Ljava/lang/String;

    .line 77
    iput-object v1, p0, Lorg/keyczar/AesKey;->hmacKey:Lorg/keyczar/HmacKey;

    .line 78
    iput-object v1, p0, Lorg/keyczar/AesKey;->mode:Lorg/keyczar/enums/CipherMode;

    .line 79
    return-void
.end method

.method public constructor <init>([BLorg/keyczar/HmacKey;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/keyczar/exceptions/KeyczarException;
        }
    .end annotation

    .prologue
    .line 66
    array-length v0, p1

    mul-int/lit8 v0, v0, 0x8

    invoke-direct {p0, v0}, Lorg/keyczar/KeyczarKey;-><init>(I)V

    .line 59
    const/4 v0, 0x4

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/keyczar/AesKey;->hash:[B

    .line 67
    invoke-static {p1}, Lorg/keyczar/util/Base64Coder;->encodeWebSafe([B)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/keyczar/AesKey;->aesKeyString:Ljava/lang/String;

    .line 68
    sget-object v0, Lorg/keyczar/AesKey;->DEFAULT_MODE:Lorg/keyczar/enums/CipherMode;

    iput-object v0, p0, Lorg/keyczar/AesKey;->mode:Lorg/keyczar/enums/CipherMode;

    .line 69
    iput-object p2, p0, Lorg/keyczar/AesKey;->hmacKey:Lorg/keyczar/HmacKey;

    .line 70
    invoke-direct {p0, p1}, Lorg/keyczar/AesKey;->initJceKey([B)V

    .line 71
    return-void
.end method

.method static synthetic access$000(Lorg/keyczar/AesKey;)Lorg/keyczar/enums/CipherMode;
    .locals 1

    .prologue
    .line 49
    iget-object v0, p0, Lorg/keyczar/AesKey;->mode:Lorg/keyczar/enums/CipherMode;

    return-object v0
.end method

.method static synthetic access$100(Lorg/keyczar/AesKey;)Ljavax/crypto/SecretKey;
    .locals 1

    .prologue
    .line 49
    iget-object v0, p0, Lorg/keyczar/AesKey;->aesKey:Ljavax/crypto/SecretKey;

    return-object v0
.end method

.method static synthetic access$200(Lorg/keyczar/AesKey;)Lorg/keyczar/HmacKey;
    .locals 1

    .prologue
    .line 49
    iget-object v0, p0, Lorg/keyczar/AesKey;->hmacKey:Lorg/keyczar/HmacKey;

    return-object v0
.end method

.method static fromPackedKey([B)Lorg/keyczar/AesKey;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/keyczar/exceptions/KeyczarException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 93
    invoke-static {p0}, Lorg/keyczar/util/Util;->lenPrefixUnpack([B)[[B

    move-result-object v0

    .line 94
    array-length v1, v0

    const/4 v2, 0x2

    if-eq v1, v2, :cond_0

    .line 95
    new-instance v0, Lorg/keyczar/exceptions/KeyczarException;

    const-string v1, "AesKey.InvalidPackedKey"

    new-array v2, v3, [Ljava/lang/Object;

    invoke-static {v1, v2}, Lorg/keyczar/i18n/Messages;->getString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/keyczar/exceptions/KeyczarException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 97
    :cond_0
    new-instance v1, Lorg/keyczar/AesKey;

    aget-object v2, v0, v3

    new-instance v3, Lorg/keyczar/HmacKey;

    const/4 v4, 0x1

    aget-object v0, v0, v4

    invoke-direct {v3, v0}, Lorg/keyczar/HmacKey;-><init>([B)V

    invoke-direct {v1, v2, v3}, Lorg/keyczar/AesKey;-><init>([BLorg/keyczar/HmacKey;)V

    return-object v1
.end method

.method static generate()Lorg/keyczar/AesKey;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/keyczar/exceptions/KeyczarException;
        }
    .end annotation

    .prologue
    .line 82
    sget-object v0, Lorg/keyczar/DefaultKeyType;->AES:Lorg/keyczar/DefaultKeyType;

    invoke-virtual {v0}, Lorg/keyczar/DefaultKeyType;->defaultSize()I

    move-result v0

    invoke-static {v0}, Lorg/keyczar/AesKey;->generate(I)Lorg/keyczar/AesKey;

    move-result-object v0

    return-object v0
.end method

.method static generate(I)Lorg/keyczar/AesKey;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/keyczar/exceptions/KeyczarException;
        }
    .end annotation

    .prologue
    .line 86
    new-instance v0, Lorg/keyczar/AesKey;

    div-int/lit8 v1, p0, 0x8

    invoke-static {v1}, Lorg/keyczar/util/Util;->rand(I)[B

    move-result-object v1

    invoke-static {}, Lorg/keyczar/HmacKey;->generate()Lorg/keyczar/HmacKey;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/keyczar/AesKey;-><init>([BLorg/keyczar/HmacKey;)V

    return-object v0
.end method

.method private initJceKey([B)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/keyczar/exceptions/KeyczarException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 118
    new-instance v0, Ljavax/crypto/spec/SecretKeySpec;

    const-string v1, "AES"

    invoke-direct {v0, p1, v1}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    iput-object v0, p0, Lorg/keyczar/AesKey;->aesKey:Ljavax/crypto/SecretKey;

    .line 119
    const/4 v0, 0x3

    new-array v0, v0, [[B

    const/16 v1, 0x10

    invoke-static {v1}, Lorg/keyczar/util/Util;->fromInt(I)[B

    move-result-object v1

    aput-object v1, v0, v3

    const/4 v1, 0x1

    aput-object p1, v0, v1

    const/4 v1, 0x2

    iget-object v2, p0, Lorg/keyczar/AesKey;->hmacKey:Lorg/keyczar/HmacKey;

    invoke-virtual {v2}, Lorg/keyczar/HmacKey;->getEncoded()[B

    move-result-object v2

    aput-object v2, v0, v1

    invoke-static {v0}, Lorg/keyczar/util/Util;->hash([[B)[B

    move-result-object v0

    .line 120
    iget-object v1, p0, Lorg/keyczar/AesKey;->hash:[B

    iget-object v2, p0, Lorg/keyczar/AesKey;->hash:[B

    array-length v2, v2

    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 121
    return-void
.end method

.method static read(Ljava/lang/String;)Lorg/keyczar/AesKey;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/keyczar/exceptions/KeyczarException;
        }
    .end annotation

    .prologue
    .line 111
    invoke-static {}, Lorg/keyczar/util/Util;->gson()Lcom/google/gson_nex/Gson;

    move-result-object v0

    const-class v1, Lorg/keyczar/AesKey;

    invoke-virtual {v0, p0, v1}, Lcom/google/gson_nex/Gson;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/keyczar/AesKey;

    .line 112
    iget-object v1, v0, Lorg/keyczar/AesKey;->hmacKey:Lorg/keyczar/HmacKey;

    invoke-virtual {v1}, Lorg/keyczar/HmacKey;->initFromJson()V

    .line 113
    iget-object v1, v0, Lorg/keyczar/AesKey;->aesKeyString:Ljava/lang/String;

    invoke-static {v1}, Lorg/keyczar/util/Base64Coder;->decodeWebSafe(Ljava/lang/String;)[B

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/keyczar/AesKey;->initJceKey([B)V

    .line 114
    return-object v0
.end method


# virtual methods
.method getEncoded()[B
    .locals 3

    .prologue
    .line 128
    const/4 v0, 0x2

    new-array v0, v0, [[B

    const/4 v1, 0x0

    iget-object v2, p0, Lorg/keyczar/AesKey;->aesKey:Ljavax/crypto/SecretKey;

    invoke-interface {v2}, Ljavax/crypto/SecretKey;->getEncoded()[B

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x1

    iget-object v2, p0, Lorg/keyczar/AesKey;->hmacKey:Lorg/keyczar/HmacKey;

    invoke-virtual {v2}, Lorg/keyczar/HmacKey;->getEncoded()[B

    move-result-object v2

    aput-object v2, v0, v1

    invoke-static {v0}, Lorg/keyczar/util/Util;->lenPrefixPack([[B)[B

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic getJceKey()Ljava/security/Key;
    .locals 1

    .prologue
    .line 49
    invoke-virtual {p0}, Lorg/keyczar/AesKey;->getJceKey()Ljavax/crypto/SecretKey;

    move-result-object v0

    return-object v0
.end method

.method protected getJceKey()Ljavax/crypto/SecretKey;
    .locals 1

    .prologue
    .line 138
    iget-object v0, p0, Lorg/keyczar/AesKey;->aesKey:Ljavax/crypto/SecretKey;

    return-object v0
.end method

.method protected getStream()Lorg/keyczar/interfaces/Stream;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/keyczar/exceptions/KeyczarException;
        }
    .end annotation

    .prologue
    .line 133
    new-instance v0, Lorg/keyczar/AesKey$AesStream;

    invoke-direct {v0, p0}, Lorg/keyczar/AesKey$AesStream;-><init>(Lorg/keyczar/AesKey;)V

    return-object v0
.end method

.method public getType()Lorg/keyczar/interfaces/KeyType;
    .locals 1

    .prologue
    .line 102
    sget-object v0, Lorg/keyczar/DefaultKeyType;->AES:Lorg/keyczar/DefaultKeyType;

    return-object v0
.end method

.method protected hash()[B
    .locals 1

    .prologue
    .line 107
    iget-object v0, p0, Lorg/keyczar/AesKey;->hash:[B

    return-object v0
.end method
