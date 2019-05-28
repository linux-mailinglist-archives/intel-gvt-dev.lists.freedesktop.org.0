Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C86402BF74
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 28 May 2019 08:29:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77CA189B98;
	Tue, 28 May 2019 06:29:57 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A428489B98
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 28 May 2019 06:29:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 05137300DA2B;
 Tue, 28 May 2019 06:29:55 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-59.ams2.redhat.com
 [10.36.116.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 90A2A6F43F;
 Tue, 28 May 2019 06:29:54 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B450A16E1A; Tue, 28 May 2019 08:29:53 +0200 (CEST)
Date: Tue, 28 May 2019 08:29:53 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Zhang, Tina" <tina.zhang@intel.com>
Subject: Re: [RFC PATCH v2 0/3] drm/i915/gvt: Enable vGPU local display
 direct flip
Message-ID: <20190528062953.f27phwicpigbz7e2@sirius.home.kraxel.org>
References: <1557461728-2831-1-git-send-email-tina.zhang@intel.com>
 <20190521111143.jdlh6ujnayetmlqw@sirius.home.kraxel.org>
 <237F54289DF84E4997F34151298ABEBC8761B311@SHSMSX101.ccr.corp.intel.com>
 <20190521193944.45cgchkcqqsv5jml@sirius.home.kraxel.org>
 <237F54289DF84E4997F34151298ABEBC8761BFC3@SHSMSX101.ccr.corp.intel.com>
 <20190522084933.nwbyyb6bbbg5pgk5@sirius.home.kraxel.org>
 <237F54289DF84E4997F34151298ABEBC8761D5E9@SHSMSX101.ccr.corp.intel.com>
 <20190527075610.rkfmhpacfjde2obj@sirius.home.kraxel.org>
 <237F54289DF84E4997F34151298ABEBC87620729@SHSMSX101.ccr.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <237F54289DF84E4997F34151298ABEBC87620729@SHSMSX101.ccr.corp.intel.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Tue, 28 May 2019 06:29:55 +0000 (UTC)
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: "Intel GVT \(Graphics Virtualization\) development list"
 <intel-gvt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gvt-dev>
List-Post: <mailto:intel-gvt-dev@lists.freedesktop.org>
List-Help: <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Tian, Kevin" <kevin.tian@intel.com>, "Wang, Zhi A" <zhi.a.wang@intel.com>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>, "Yuan,
 Hang" <hang.yuan@intel.com>, "Lv, Zhiyuan" <zhiyuan.lv@intel.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "Kondapally,
 Kalyan" <kalyan.kondapally@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

ICBIaSwKCj4gPiBDcmVhdGluZyBhIGxlYXNlIGRvZXNuJ3Qgd29yayBoZXJlLgo+ID4gCj4gPiBr
ZXJuZWwgaXMgNS4xLjUuICB4b3JnIHNlcnZlciBpcyBpcyAxLjIwLjQsIHJlcG9ydGluZyB4cmFu
ZHIgdmVyc2lvbiAxLjYuICBXaGljaAo+ID4gc2hvdWxkIGJlIG5ldyBlbm91Z2guCj4gVGhpcyBp
cyBvdXIgcmVmZXJlbmNlZCB2ZXJzaW9uczoKPiBLZXJuZWw6IDUuMi4wIChob3dldmVyIDUuMS41
IHNob3VsZCBhbHNvIHdvcmspIAo+IFhvcmc6IDEuMjAuNCByZXBvcnRpbmcgeHJhbmRyIHZlcnNp
b24gMS42Cj4gTGlieGNiOiAxLjEzCj4gWGNiLXByb3RvOiAxLjEzCj4gWG9yZ3Byb3RvOiAyMDE4
LjQtNAo+IExpYmRybTogMi40Ljk1Cj4gCj4gQWxzbywgeW91IGNhbiByZWZlcmVuY2UgdGhlIHN0
YXR1cyBvZiBkcm0gbGVhc2VzIHN1cHBvcnQ6Cj4gaHR0cHM6Ly9oYWFnY2guZnJpY2tlbC5jbHVi
LyMhZHJtbGVhc2UubWQKCkFoLCB0aGUgbm9uLWRlc2t0b3AgcHJvcGVydHkgbG9va3MgaW1wb3J0
YW50LgoKVHVybmVkIG91dHB1dCBvZmYgKHhyYW5kciAtLW91dHB1dCBIRE1JLTIgLS1vZmYpLgpT
ZXQgbm9uLWRlc2t0b3AgcHJvcGVydHkgKHhyYW5kciAtLW91dHB1dCBIRE1JLTIgLS1zZXQgbm9u
LWRlc2t0b3AgMSkuClVwZGF0ZWQgcWVtdSBjb2RlIHRvIGxvb2sgZm9yIG5vbi1kZXNrdG9wIG91
dHB1dHMuCgpTdGlsbCBub3Qgd29ya2luZyA6LSgKCj4gV2hlbiB5b3UgdHJpZWQgdGhpcyB3b3Jr
Cj4gaHR0cHM6Ly9naXRodWIuY29tL2ludGVsL0lndnRnLXFlbXUvY29tbWl0LzI4ODFkOWE2NWJl
YjMxOWM0MmI5NDdkMjNlYjFkMjYwMjI0YmNkZGMsCj4gZGlkIHlvdSBhZGQgImVuYWJsZS1kcm1s
ZWFzZT1vbiIgbWVudGlvbmVkIGluIHRoZSBjb21taXQgbWVzc2FnZT8KClVzaW5nIGh0dHBzOi8v
Z2l0LmtyYXhlbC5vcmcvY2dpdC9xZW11L2xvZy8/aD1zaXJpdXMvZGlzcGxheS1kcm0sIEkgZ2V0
IHRoaXM6CgojIHFlbXUtc3lzdGVtLXg4Nl82NCAtZGlzcGxheSBkcm0sZW5hYmxlLWRybWxlYXNl
PW9uCnFlbXUtc3lzdGVtLXg4Nl82NDogaW5mbzogZHJtLWxlYXNlOiBzY3JlZW4gaXMgMApxZW11
LXN5c3RlbS14ODZfNjQ6IGluZm86IGRybS1sZWFzZTogcm9vdCB3aW5kb3cgaXMgMHgxNWQKcWVt
dS1zeXN0ZW0teDg2XzY0OiBpbmZvOiBkcm0tbGVhc2U6IHhyYW5kcjogbWFqb3Itb3Bjb2RlIDE0
MCwgZmlyc3QtZXJyb3IgMTQ3LCBmaXJzdC1ldmVudCA4OQpxZW11LXN5c3RlbS14ODZfNjQ6IGlu
Zm86IGRybS1sZWFzZTogeHJhbmRyOiBjbGllbnQgdjEuNiwgc2VydmVyIHYxLjYKcWVtdS1zeXN0
ZW0teDg2XzY0OiBpbmZvOiBkcm0tbGVhc2U6IHhyYW5kcjogICBvdXRwdXQgMHg0MjogbmFtZSBI
RE1JLTEsIG5vbi1kZXNrdG9wIDAKcWVtdS1zeXN0ZW0teDg2XzY0OiBpbmZvOiBkcm0tbGVhc2U6
IHhyYW5kcjogICBvdXRwdXQgMHg0MzogbmFtZSBIRE1JLTIsIG5vbi1kZXNrdG9wIDEKcWVtdS1z
eXN0ZW0teDg2XzY0OiBpbmZvOiBkcm0tbGVhc2U6IHhyYW5kcjogICBvdXRwdXQgMHg0NDogbmFt
ZSBEUC0xLCBub24tZGVza3RvcCAwCnFlbXUtc3lzdGVtLXg4Nl82NDogaW5mbzogZHJtLWxlYXNl
OiB4cmFuZHI6IHVzaW5nIG91dHB1dCAweDQzCnFlbXUtc3lzdGVtLXg4Nl82NDogaW5mbzogZHJt
LWxlYXNlOiB4cmFuZHI6IHVzaW5nIGNydGMgMHg0MApxZW11LXN5c3RlbS14ODZfNjQ6IGRybS1s
ZWFzZTogeHJhbmRyOiBjcmVhdGUgbGVhc2UgZmFpbGVkOiBCYWRNYXRjaCAoY29kZSA4LCBvcCAx
NDA6NDUpCgpIbW0uCgpjaGVlcnMsCiAgR2VyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0
LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
