Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 634F1980F8
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 21 Aug 2019 19:04:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2355D6E95E;
	Wed, 21 Aug 2019 17:04:37 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EAFF6E95E;
 Wed, 21 Aug 2019 17:04:35 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 18217451-1500050 for multiple; Wed, 21 Aug 2019 18:04:30 +0100
MIME-Version: 1.0
To: Xiong Zhang <xiong.y.zhang@intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190821033556.GA11927@zhen-hp.sh.intel.com>
References: <1566279978-9659-1-git-send-email-xiong.y.zhang@intel.com>
 <20190821033556.GA11927@zhen-hp.sh.intel.com>
Message-ID: <156640706795.20466.7242407780817145904@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [Intel-gfx] [PATCH 1/2] drm/i915: Don't deballoon unused ggtt
 drm_mm_node in linux guest
Date: Wed, 21 Aug 2019 18:04:27 +0100
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
Cc: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

UXVvdGluZyBaaGVueXUgV2FuZyAoMjAxOS0wOC0yMSAwNDozNTo1NikKPiBPbiAyMDE5LjA4LjIw
IDEzOjQ2OjE3ICswODAwLCBYaW9uZyBaaGFuZyB3cm90ZToKPiA+IFRoZSBmb2xsb3dpbmcgY2Fs
bCB0cmFjZSBtYXkgZXhpc3QgaW4gbGludXggZ3Vlc3QgZG1lc2cgd2hlbiBndWVzdCBpOTE1Cj4g
PiBkcml2ZXIgaXMgdW5sb2FkZWQuCj4gPiBbICAgOTAuNzc2NjEwXSBbZHJtOnZndF9kZWJhbGxv
b25fc3BhY2UuaXNyYS4wIFtpOTE1XV0gZGViYWxsb29uIHNwYWNlOiByYW5nZSBbMHgwIC0gMHgw
XSAwIEtpQi4KPiA+IFsgICA5MC43NzY2MjFdIEJVRzogdW5hYmxlIHRvIGhhbmRsZSBrZXJuZWwg
TlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlIGF0IDAwMDAwMDAwMDAwMDAwYzAKPiA+IFsgICA5MC43
NzY2OTFdIElQOiBkcm1fbW1fcmVtb3ZlX25vZGUrMHg0ZC8weDMyMCBbZHJtXQo+ID4gWyAgIDkw
Ljc3NjcxOF0gUEdEIDgwMDAwMDAxMmM3ZDAwNjcgUDREIDgwMDAwMDAxMmM3ZDAwNjcgUFVEIDEz
OGU0YzA2NyBQTUQgMAo+ID4gWyAgIDkwLjc3NzA5MV0gdGFzazogZmZmZjlhZGFiNjBmMmYwMCB0
YXNrLnN0YWNrOiBmZmZmYWYzOWMwZmUwMDAwCj4gPiBbICAgOTAuNzc3MTQyXSBSSVA6IDAwMTA6
ZHJtX21tX3JlbW92ZV9ub2RlKzB4NGQvMHgzMjAgW2RybV0KPiA+IFsgICA5MC43Nzc1NzNdIENh
bGwgVHJhY2U6Cj4gPiBbICAgOTAuNzc3NjUzXSAgaW50ZWxfdmd0X2RlYmFsbG9vbisweDRjLzB4
NjAgW2k5MTVdCj4gPiBbICAgOTAuNzc3NzI5XSAgaTkxNV9nZ3R0X2NsZWFudXBfaHcrMHgxMjEv
MHgxOTAgW2k5MTVdCj4gPiBbICAgOTAuNzc3NzkyXSAgaTkxNV9kcml2ZXJfdW5sb2FkKzB4MTQ1
LzB4MTgwIFtpOTE1XQo+ID4gWyAgIDkwLjc3Nzg1Nl0gIGk5MTVfcGNpX3JlbW92ZSsweDE1LzB4
MjAgW2k5MTVdCj4gPiBbICAgOTAuNzc3ODkwXSAgcGNpX2RldmljZV9yZW1vdmUrMHgzYi8weGMw
Cj4gPiBbICAgOTAuNzc3OTE2XSAgZGV2aWNlX3JlbGVhc2VfZHJpdmVyX2ludGVybmFsKzB4MTU3
LzB4MjIwCj4gPiBbICAgOTAuNzc3OTQ1XSAgZHJpdmVyX2RldGFjaCsweDM5LzB4NzAKPiA+IFsg
ICA5MC43Nzc5NjddICBidXNfcmVtb3ZlX2RyaXZlcisweDUxLzB4ZDAKPiA+IFsgICA5MC43Nzc5
OTBdICBwY2lfdW5yZWdpc3Rlcl9kcml2ZXIrMHgyMy8weDkwCj4gPiBbICAgOTAuNzc4MDE5XSAg
U3lTX2RlbGV0ZV9tb2R1bGUrMHgxZGEvMHgyNDAKPiA+IFsgICA5MC43NzgwNDVdICBlbnRyeV9T
WVNDQUxMXzY0X2Zhc3RwYXRoKzB4MjQvMHg4Nwo+ID4gWyAgIDkwLjc3ODA3Ml0gUklQOiAwMDMz
OjB4N2YzNDMxMmFmMDY3Cj4gPiBbICAgOTAuNzc4MDkyXSBSU1A6IDAwMmI6MDAwMDdmZmRlYTNk
YTBkOCBFRkxBR1M6IDAwMDAwMjA2Cj4gPiBbICAgOTAuNzc4Mjk3XSBSSVA6IGRybV9tbV9yZW1v
dmVfbm9kZSsweDRkLzB4MzIwIFtkcm1dIFJTUDogZmZmZmFmMzljMGZlM2RjMAo+ID4gWyAgIDkw
Ljc3ODM0NF0gLS0tWyBlbmQgdHJhY2UgZjRiMWJjODMwNWZjNTlkZCBdLS0tCj4gPiAKPiA+IEZv
dXIgZHJtX21tX25vZGUgYXJlIHVzZWQgdG8gcmVzZXJ2ZSBndWVzdCBnZ3R0IHNwYWNlLCBidXQg
c29tZSBvZiB0aGVtCj4gPiBtYXkgYmUgc2tpcHBlZCBhbmQgbm90IGluaXRpYWxpc2VkIGR1ZSB0
byBzcGFjZSBjb25zdHJhaW50cyBpbgo+ID4gaW50ZWxfdmd0X2JhbGxvb24oKS4gSWYgZHJtX21t
X3JlbW92ZV9ub2RlKCkgaXMgY2FsbGVkIHdpdGgKPiA+IHVuaW5pdGlhbGl6ZWQgZHJtX21tX25v
ZGUsIHRoZSBhYm92ZSBjYWxsIHRyYWNlIG9jY3Vycy4KPiA+IAo+ID4gVGhpcyBwYXRjaCBjaGVj
ayBkcm1fbW1fbm9kZSdzIHZhbGlkaXR5IGJlZm9yZSBjYWxsaW5nCj4gPiBkcm1fbW1fcmVtb3Zl
X25vZGUoKS4KPiA+IAo+ID4gRml4ZXM6IGZmOGY3OTc1NTdjNygiZHJtL2k5MTU6IHJldHVybiB0
aGUgY29ycmVjdCB1c2FibGUgYXBlcnR1cmUgc2l6ZSB1bmRlciBndnQgZW52aXJvbm1lbnQiKQo+
ID4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiA+IFNpZ25lZC1vZmYtYnk6IFhpb25nIFpo
YW5nIDx4aW9uZy55LnpoYW5nQGludGVsLmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2k5MTVfdmdwdS5jIHwgMyArKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3Zn
cHUuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfdmdwdS5jCj4gPiBpbmRleCBiZjJiODM3
Li5kMmZkNjZmIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV92Z3B1
LmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfdmdwdS5jCj4gPiBAQCAtMTE5
LDYgKzExOSw5IEBAIHN0YXRpYyBzdHJ1Y3QgX2JhbGxvb25faW5mb18gYmxfaW5mbzsKPiA+ICBz
dGF0aWMgdm9pZCB2Z3RfZGViYWxsb29uX3NwYWNlKHN0cnVjdCBpOTE1X2dndHQgKmdndHQsCj4g
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZHJtX21tX25vZGUgKm5vZGUp
Cj4gPiAgewo+ID4gKyAgICAgaWYgKCFub2RlLT5hbGxvY2F0ZWQpCj4gPiArICAgICAgICAgICAg
IHJldHVybjsKPiA+ICsKPiA+ICAgICAgIERSTV9ERUJVR19EUklWRVIoImRlYmFsbG9vbiBzcGFj
ZTogcmFuZ2UgWzB4JWxseCAtIDB4JWxseF0gJWxsdSBLaUIuXG4iLAo+ID4gICAgICAgICAgICAg
ICAgICAgICAgICBub2RlLT5zdGFydCwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgbm9kZS0+
c3RhcnQgKyBub2RlLT5zaXplLAo+IAo+IFNlYXJjaGluZyBzaG93cyB0aGlzIGlzIHByZXR0eSBv
bGQgb25lIGFuZCBhbHNvIHdpdGggci1iIGZyb20gQ2hyaXMsCj4gYnV0IGJlIGlnbm9yZWQgdGhh
dCBub2JvZHkgcGlja2VkIHRoaXMgdXAuLgo+IAo+IEkgdGhpbmsgSSBoaXQgdGhpcyBvbmNlIHRv
byBhbmQgdHJpZWQgdG8gZml4IGl0IGFub3RoZXIgd2F5LAo+IGJ1dCB0aGlzIGxvb2tzIHNpbXBs
ZXIgdG8gbWUuCj4gCj4gQWNrZWQtYnk6IFpoZW55dSBXYW5nIDx6aGVueXV3QGxpbnV4LmludGVs
LmNvbT4KCkJldHRlciBsYXRlIHRoYW4gbmV2ZXIsIEkgZ3Vlc3MuIFRoYW5rcyBmb3IgdGhlIHBh
dGNoIGFuZCBjaGVja2luZyBpdApvdmVyLCBwdXNoZWQuCi1DaHJpcwpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlz
dAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
