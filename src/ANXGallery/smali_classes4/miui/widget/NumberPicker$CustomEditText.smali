.class public Lmiui/widget/NumberPicker$CustomEditText;
.super Landroid/widget/EditText;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lmiui/widget/NumberPicker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CustomEditText"
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 2200
    invoke-direct {p0, p1, p2}, Landroid/widget/EditText;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2201
    return-void
.end method


# virtual methods
.method public onEditorAction(I)V
    .locals 1

    .line 2205
    invoke-super {p0, p1}, Landroid/widget/EditText;->onEditorAction(I)V

    .line 2206
    const/4 v0, 0x6

    if-ne p1, v0, :cond_0

    .line 2207
    invoke-virtual {p0}, Lmiui/widget/NumberPicker$CustomEditText;->clearFocus()V

    .line 2209
    :cond_0
    return-void
.end method
