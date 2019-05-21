Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 757132586B
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 21 May 2019 21:39:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3633C89664;
	Tue, 21 May 2019 19:39:57 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BCB089664
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 21 May 2019 19:39:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6701959474;
 Tue, 21 May 2019 19:39:50 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-74.ams2.redhat.com
 [10.36.117.74])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DBE3F5C269;
 Tue, 21 May 2019 19:39:45 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 04DCE11AB7; Tue, 21 May 2019 21:39:45 +0200 (CEST)
Date: Tue, 21 May 2019 21:39:44 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Zhang, Tina" <tina.zhang@intel.com>
Subject: Re: [RFC PATCH v2 0/3] drm/i915/gvt: Enable vGPU local display
 direct flip
Message-ID: <20190521193944.45cgchkcqqsv5jml@sirius.home.kraxel.org>
References: <1557461728-2831-1-git-send-email-tina.zhang@intel.com>
 <20190521111143.jdlh6ujnayetmlqw@sirius.home.kraxel.org>
 <237F54289DF84E4997F34151298ABEBC8761B311@SHSMSX101.ccr.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <237F54289DF84E4997F34151298ABEBC8761B311@SHSMSX101.ccr.corp.intel.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Tue, 21 May 2019 19:39:55 +0000 (UTC)
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
Cc: "Tian, Kevin" <kevin.tian@intel.com>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>, "Yuan,
 Hang" <hang.yuan@intel.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "Lv,
 Zhiyuan" <zhiyuan.lv@intel.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "Kondapally, Kalyan" <kalyan.kondapally@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Wang, Zhi A" <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

ICBIaSwKCj4gSW4gdGhlIGZpcnN0IHZlcnNpb24sIHdlIHByb3Bvc2VkIHRvIHVzZSBkcm1fZnJh
bWVidWZmZXIgc3RhbmRpbmcgZm9yCj4gYSB2aXJ0dWFsIHBsYW5lLiAgSG9zdCB1c2VzIHRoZSBk
cm1fZnJhbWVidWZmZXIgdG8gZG8gdGhlIGFzc2lnbm1lbnQKPiBhbmQgZ3Z0LWcgZGlyZWN0bHkg
Y29tbWl0cyB0aGUgZ3Vlc3QgZnJhbWVidWZmZXIgdG8gdGhlIGFzc2lnbmVkCj4gcGxhbmUsIHdo
aWNoIGlzIGNhbGxlZCBpbi1rZXJuZWwgZGlyZWN0IGZsaXAuIEluIHRoYXQgcHJvcG9zYWwgd2UK
PiBsZXZlcmFnZWQgaTkxNSBBUElzIHRvIGRvIHRoZSBwbGFuZSBhc3NpZ25tZW50IGFuZCBkaXJl
Y3QgZmxpcC4KPiBIb3dldmVyLCB3ZSBnb3QgYW4gb3BlbiBhYm91dCBob3cgdG8gZGVsaXZlciB0
aGUgZHJtX2ZyYW1lYnVmZmVyIGlkIHRvCj4gdGhlIGhvc3QgdXNlciBzcGFjZSBhbmQgdGhlIGlk
ZWEgb2YgYWRkaW5nIG5ldyBpb2N0bHMgaXMgcmVqZWN0ZWQgYnkKPiB1cHN0cmVhbS4gU2luY2Ug
dGhlIC9zeXMgd2F5IHdhcyBhbHNvIHJlamVjdGVkIGJ5IGd2dC1nLCB3ZSBiZWdhbiB0bwo+IHRo
aW5rIGFib3V0IHJldXNpbmcgdmZpbyBkaXNwbGF5IGRtYS1idWYgaW50ZXJmYWNlIGZvciBwbGFu
ZQo+IGFzc2lnbm1lbnQuCgpJIHJlbWVtYmVyIHRob3NlIGRpc2N1c3Npb25zLiAgU28gdGhpcyBh
cHByb2FjaCBpc24ndCB1c2VkIGFueSBtb3JlLgpUaGF0IGNsYXJpZmllcyB0aGluZ3MgYSBiaXQu
Cgo+IEluIHRoaXMgc2Vjb25kIHZlcnNpb24sIGhvc3QgdXNlcyB0aGUgZG1hLWJ1ZiBpbnRlcmZh
Y2UgdG8gZG8gdGhlCj4gYXNzaWdubWVudCBhbmQgZ3Z0LWcgZGlyZWN0IGNvbW1pdHMgdGhlIGd1
ZXN0IGZyYW1lYnVmZmVyIHRvIHRoZQo+IGFzc2lnbmVkIHBsYW5lLiBXZSBkaWRuJ3QgaW50cm9k
dWNlIGFueSBuZXcgZG1hLWJ1ZiBpb2N0bCBmb3IgdGhpcy4KPiBIb3dldmVyIGd2dC1nIGluIGtl
cm5lbCBkb2VzIG5lZWQgdG8ga25vdyB3aGVuIHRvIHN0YXJ0IGluLWtlcm5lbAo+IGRpcmVjdCBm
bGlwIGFuZCB3aGVuIHRvIHN0b3AuIEluIHRoaXMgcHJvcG9zYWwsIGEgc3dpdGNoIGlzIGFkZGVk
IHRvCj4gdmdwdSBzeXMuIFVzZXIgc3BhY2UgY2FuIGVuYWJsZSBvciBkaXNhYmxlIHRoZSBpbi1r
ZXJuZWwgZGlyZWN0IGZsaXAKPiBieSBlY2hvIDEgb3IgMCB0byB0aGF0IGF0dHJpYnV0ZS4gQW5k
IHdlIHdvdWxkIGxpa2UgdG8gZGlzY3VzcyB3aXRoCj4gdXNlciBzcGFjZSBhYm91dCB0aGlzLgoK
U28sIHdoYXQgaGFwcGVucyBleGFjdGx5PyAgV2l0aCB0aGUgc3lzZnMgc3dpdGNoIGRpc2FibGVk
IHlvdSdsbApwcm9iYWJseSBnZXQgdHJhZGl0aW9uYWwgYmVoYXZpb3IsIGkuZS4gZG1hYnVmcyBh
cmUgZXhwb3J0ZWQgdmlhCnZmaW8gQVBJLCBhbmQgaXQgY2hhbmdlcyBvbiBlYWNoIHBhZ2UgZmxp
cC4KCk5vdyB3aXRoIHRoZSBzd2l0Y2ggZW5hYmxlZCwgd2hhdCBjaGFuZ2VzPyAgVXNlcnNwYWNl
IHdpbGwgc3RpbGwKZ2V0IGEgZG1hYnVmIEkgZ3Vlc3MsIGJ1dCBwcm9iYWJseSBub3QgYSBuZXcg
b25lIG9uIGVhY2ggcGFnZSBmbGlwLgoKQ2FuIHVzZXJzcGFjZSBtbWFwKCkgdGhlIGRtYWJ1Zj8K
CkNhbiB1c2Vyc3BhY2UgaW1wb3J0IHRoZSBkbWFidWYgYXMgZWdsIGltYWdlLCB0aGVuIHVzZSBp
dCBhcyB0ZXh0dXJlIG9yCmZyYW1lYnVmZmVyPwoKQ2FuIHVzZXJzcGFjZSBpbXBvcnQgdGhlIGRt
YWJ1ZiBhcyBibyAodXNpbmcgZ2JtX2ltcG9ydF9ibygpIGZvcgpleGFtcGxlKSwgY3JlYXRlIGEg
ZHJtIGZyYW1lYnVmZmVyIGFuZCBtYXAgaXQgdG8gYSBjcnRjPwoKV2lsbCB0aGUgY29udGVudCB1
cGRhdGUgYXV0b21hdGljYWxseSBvbiBwYWdlZmxpcHM/Cgo+IEJlc2lkZXMsIHRoZXJlIGlzIGFs
c28gYW5vdGhlciBvcHRpb246IHRoZSBndWVzdCBwYWdlIGZsaXAgZXZlbnQgaXMKPiBkZWxpdmVy
ZWQgdG8gdXNlciBzcGFjZSB3aGVyZSBxZW11IHVpIGNhbiBxdWVyeSB0aGUgZG1hLWJ1ZiBpbmZv
IGFuZAo+IGNvbW1pdCB0aGUgZnJhbWVidWZmZXIgYmFzZWQgb24gZG1hLWJ1ZiB0byB0aGUgSFcg
cGxhbmUuIEluIHRoaXMKPiBzY2VuYXJpbywgZ3Z0LWcgZG9lc24ndCBkbyB0aGUgaW4ta2VybmVs
IGRpcmVjdCBmbGlwLiBFdmVyeXRoaW5nIGlzCj4gaGFuZGxlZCBieSBob3N0IHVzZXIgc3BhY2Ug
KGkuZS4gcWVtdSB1aSkuCgpJbml0aWFsIHNrZXRjaCBvZiBhIGRybSB1aToKICBodHRwczovL2dp
dC5rcmF4ZWwub3JnL2NnaXQvcWVtdS9sb2cvP2g9c2lyaXVzL2Rpc3BsYXktZHJtCgpEb2VzIGV4
YWN0bHkgdGhpcy4gIEluIHBvbGxpbmcgbW9kZSB0aG91Z2guICBUaGUga2VybmVsIGRlbGl2ZXJp
bmcgYQpndWVzdCBwYWdlLWZsaXAgbm90aWZpY2F0aW9uIHRvIHFlbXUgc29tZWhvdyB3b3VsZCBi
ZSB1c2VmdWwgZm9yIGEKdGltZWx5IGhvc3QgcGFnZS1mbGlwLgoKPiBXaXRoIHRoZSBoZWxwIGZv
ciBkcm0gbGVhc2luZywgcWVtdSB1aSBjYW4gZnVsbHkgY29udHJvbCB0aGUgbGVhc2VkCj4gcGlw
ZSBhbmQgcGxhbmUgcmVzb3VyY2UuICBBbmQgdGhlIHR5cGljYWwgdXNlIGNhc2UgaXMgcGlwZSBh
c3NpZ25tZW50Cj4gKGkuZS4gZWFjaCBWTSBpcyBzaG93biBvbiBvbmUgcGlwZS9tb25pdG9yKS4g
Q29tbWVudHMgYXJlIHdlbGNvbWUuIAoKR29vZ2xpbmcgZm9yIGRybSBsZWFzZXMgZG9lc24ndCB0
dXJuIHVwIG11Y2guICBTZWVtcyByYXJlbHkgdXNlZC4KS2VybmVsIGdvdCBzdXBwb3J0LiAgU2Vl
bXMgWG9yZyBoYXMgc3VwcG9ydCAob3IgcGF0Y2hlcyBleGlzdCksCmkuZS4gSSBjYW4gYXNrIHRo
ZSBYIHNlcnZlciBmb3IgYSBsZWFzZS4KCkRvZXMgYW55dGhpbmcgZWxzZSBleGlzdD8KCkEgZHJt
IGxlYXNlIGhhbmRsZSBjYW4gYmUgdXNlZCBsaWtlIGEgZHJtIG1hc3RlciBoYW5kbGUsIGV4Y2Vw
dCB0aGF0Cm9ubHkgdGhlIGxlYXNlZCByZXNzb3VyY2VzIGFyZSB2aXNpYmxlIGFuZCB1c2FibGUs
IGNvcnJlY3Q/CgpjaGVlcnMsCiAgR2VyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRl
dkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
