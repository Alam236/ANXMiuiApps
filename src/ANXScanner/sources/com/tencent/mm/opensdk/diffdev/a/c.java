package com.tencent.mm.opensdk.diffdev.a;

import com.tencent.mm.opensdk.diffdev.OAuthListener;
import java.util.ArrayList;
import java.util.List;

final class c implements Runnable {
    final /* synthetic */ b g;

    c(b bVar) {
        this.g = bVar;
    }

    public final void run() {
        List<OAuthListener> arrayList = new ArrayList();
        arrayList.addAll(this.g.f.c);
        for (OAuthListener onQrcodeScanned : arrayList) {
            onQrcodeScanned.onQrcodeScanned();
        }
    }
}
