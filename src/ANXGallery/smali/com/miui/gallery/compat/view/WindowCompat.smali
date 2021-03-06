.class public Lcom/miui/gallery/compat/view/WindowCompat;
.super Ljava/lang/Object;
.source "WindowCompat.java"


# direct methods
.method public static requestActivityTransition(Landroid/view/Window;)Z
    .locals 2
    .param p0, "window"    # Landroid/view/Window;

    .prologue
    .line 9
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_0

    const/16 v0, 0xd

    invoke-virtual {p0, v0}, Landroid/view/Window;->requestFeature(I)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static setNavigationBarColor(Landroid/view/Window;I)V
    .locals 2
    .param p0, "window"    # Landroid/view/Window;
    .param p1, "color"    # I

    .prologue
    .line 30
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_0

    .line 31
    invoke-virtual {p0, p1}, Landroid/view/Window;->setNavigationBarColor(I)V

    .line 33
    :cond_0
    return-void
.end method

.method public static setSharedElementEnterTransition(Landroid/view/Window;Landroid/transition/Transition;)V
    .locals 2
    .param p0, "window"    # Landroid/view/Window;
    .param p1, "transition"    # Landroid/transition/Transition;

    .prologue
    .line 18
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_0

    .line 19
    invoke-virtual {p0, p1}, Landroid/view/Window;->setSharedElementEnterTransition(Landroid/transition/Transition;)V

    .line 21
    :cond_0
    return-void
.end method

.method public static setSharedElementReturnTransition(Landroid/view/Window;Landroid/transition/Transition;)V
    .locals 2
    .param p0, "window"    # Landroid/view/Window;
    .param p1, "transition"    # Landroid/transition/Transition;

    .prologue
    .line 24
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_0

    .line 25
    invoke-virtual {p0, p1}, Landroid/view/Window;->setSharedElementReturnTransition(Landroid/transition/Transition;)V

    .line 27
    :cond_0
    return-void
.end method

.method public static supportActivityTransitions(Landroid/view/Window;)Z
    .locals 2
    .param p0, "window"    # Landroid/view/Window;

    .prologue
    .line 14
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_0

    const/16 v0, 0xd

    invoke-virtual {p0, v0}, Landroid/view/Window;->hasFeature(I)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
