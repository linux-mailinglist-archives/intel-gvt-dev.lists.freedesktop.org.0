Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A209AA70
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 23 Aug 2019 10:35:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B7826EC1E;
	Fri, 23 Aug 2019 08:35:36 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 168F96EC1E;
 Fri, 23 Aug 2019 08:35:34 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 18236459-1500050 for multiple; Fri, 23 Aug 2019 09:35:24 +0100
MIME-Version: 1.0
To: "Zhang, Xiaolin" <xiaolin.zhang@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <073732E20AE4C540AE91DBC3F07D4460876D3410@SHSMSX107.ccr.corp.intel.com>
References: <1566543451-13955-1-git-send-email-xiaolin.zhang@intel.com>
 <156654711627.27716.4474982727513548344@skylake-alporthouse-com>
 <073732E20AE4C540AE91DBC3F07D4460876D3410@SHSMSX107.ccr.corp.intel.com>
Message-ID: <156654932243.27716.13325423141754929364@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915: to make vgpu ppgtt notificaiton
 as atomic operation
Date: Fri, 23 Aug 2019 09:35:22 +0100
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
Cc: "Wang, Zhenyu Z" <zhenyu.z.wang@intel.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

UXVvdGluZyBaaGFuZywgWGlhb2xpbiAoMjAxOS0wOC0yMyAwOTowNzowMSkKPiBPbiAwOC8yMy8y
MDE5IDAzOjU4IFBNLCBDaHJpcyBXaWxzb24gd3JvdGU6Cj4gPiBRdW90aW5nIFhpYW9saW4gWmhh
bmcgKDIwMTktMDgtMjMgMDc6NTc6MzEpCj4gPj4gdmdwdSBwcGd0dCBub3RpZmljYXRpb24gd2Fz
IHNwbGl0IGludG8gMiBzdGVwcywgdGhlIGZpcnN0IHN0ZXAgaXMgdG8KPiA+PiB1cGRhdGUgUFZJ
TkZPJ3MgcGRwIHJlZ2lzdGVyIGFuZCB0aGVuIHdyaXRlIFBWSU5GTydzIGcydl9ub3RpZnkgcmVn
aXN0ZXIKPiA+PiB3aXRoIGFjdGlvbiBjb2RlIHRvIHRpcmdnZXIgcHBndHQgbm90aWZpY2F0aW9u
IHRvIEdWVCBzaWRlLgo+ID4+Cj4gPj4gY3VycmVudGx5IHRoZXNlIHN0ZXBzIHdlcmUgbm90IGF0
b21pYyBvcGVyYXRpb25zIGR1ZSB0byBubyBhbnkgcHJvdGVjdGlvbiwKPiA+PiBzbyBpdCBpcyBl
YXN5IHRvIGVudGVyIHJhY2UgY29uZGl0aW9uIHN0YXRlIGR1cmluZyB0aGUgTVRCRiwgc3RyZXNz
IGFuZAo+ID4+IElHVCB0ZXN0IHRvIGNhdXNlIEdQVSBoYW5nLgo+ID4+Cj4gPj4gdGhlIHNvbHV0
aW9uIGlzIHRvIGFkZCBhIGxvY2sgdG8gbWFrZSB2Z3B1IHBwZ3R0IG5vdGljYXRpb24gYXMgYXRv
bWljCj4gPj4gb3BlcmF0aW9uLgo+ID4+Cj4gPj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcK
PiA+PiBTaWduZWQtb2ZmLWJ5OiBYaWFvbGluIFpoYW5nIDx4aWFvbGluLnpoYW5nQGludGVsLmNv
bT4KPiA+PiAtLS0KPiA+PiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9kcnYuaCAgICAgfCAx
ICsKPiA+PiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9nZW1fZ3R0LmMgfCA0ICsrKysKPiA+
PiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV92Z3B1LmMgICAgfCAxICsKPiA+PiAgMyBmaWxl
cyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKPiA+Pgo+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9pOTE1X2Rydi5oIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9kcnYu
aAo+ID4+IGluZGV4IGViMzFjMTYuLjMyZTE3YzQgMTAwNjQ0Cj4gPj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2k5MTUvaTkxNV9kcnYuaAo+ID4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5
MTVfZHJ2LmgKPiA+PiBAQCAtOTYxLDYgKzk2MSw3IEBAIHN0cnVjdCBpOTE1X2Zyb250YnVmZmVy
X3RyYWNraW5nIHsKPiA+PiAgfTsKPiA+PiAgCj4gPj4gIHN0cnVjdCBpOTE1X3ZpcnR1YWxfZ3B1
IHsKPiA+PiArICAgICAgIHN0cnVjdCBtdXRleCBsb2NrOwo+ID4+ICAgICAgICAgYm9vbCBhY3Rp
dmU7Cj4gPj4gICAgICAgICB1MzIgY2FwczsKPiA+PiAgfTsKPiA+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2k5MTUvaTkxNV9nZW1fZ3R0LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9p
OTE1X2dlbV9ndHQuYwo+ID4+IGluZGV4IDJjZDJkYWIuLmZmMGIxNzggMTAwNjQ0Cj4gPj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9nZW1fZ3R0LmMKPiA+PiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9pOTE1X2dlbV9ndHQuYwo+ID4+IEBAIC04MzMsNiArODMzLDggQEAgc3Rh
dGljIGludCBnZW44X3BwZ3R0X25vdGlmeV92Z3Qoc3RydWN0IGk5MTVfcHBndHQgKnBwZ3R0LCBi
b29sIGNyZWF0ZSkKPiA+PiAgICAgICAgIGVudW0gdmd0X2cydl90eXBlIG1zZzsKPiA+PiAgICAg
ICAgIGludCBpOwo+ID4+ICAKPiA+PiArICAgICAgIG11dGV4X2xvY2soJmRldl9wcml2LT52Z3B1
LmxvY2spOwo+ID4+ICsKPiA+PiAgICAgICAgIGlmIChjcmVhdGUpCj4gPj4gICAgICAgICAgICAg
ICAgIGF0b21pY19pbmMocHhfdXNlZChwcGd0dC0+cGQpKTsgLyogbmV2ZXIgcmVtb3ZlICovCj4g
Pj4gICAgICAgICBlbHNlCj4gPj4gQEAgLTg2MCw2ICs4NjIsOCBAQCBzdGF0aWMgaW50IGdlbjhf
cHBndHRfbm90aWZ5X3ZndChzdHJ1Y3QgaTkxNV9wcGd0dCAqcHBndHQsIGJvb2wgY3JlYXRlKQo+
ID4+ICAKPiA+PiAgICAgICAgIEk5MTVfV1JJVEUodmd0aWZfcmVnKGcydl9ub3RpZnkpLCBtc2cp
Owo+ID4+ICAKPiA+IEhvdyBkbyB5b3Uga25vdyB0aGUgb3BlcmF0aW9uIGlzIGNvbXBsZXRlIGFu
ZCBpdCBpcyBub3cgc2FmZSB0bwo+ID4gb3ZlcndyaXRlIHRoZSBkYXRhIHJlZ3M/Cj4gPiAtQ2hy
aXMKPiA+Cj4gYnkgZGVzaWduLCB0aGUgZGF0YSByZWcgdmFsdWUgaXMgY29waWVkIG91dCB0byB1
c2UsIHNvIGFzIGxvbmcgYXMgdGhlCj4gYWN0aW9uIGFuZCBkYXRhIGlzIG9wZXJhdGVkIHRvZ2V0
aGVyLCBob3cgbG9uZyB0aGUgb3BlcmF0aW9uIGlzIG5vdCBhCj4gaXNzdWUgYW5kICBpdCBpcyBz
YWZlIHRvIG92ZXJ3cml0ZSB0aGUgZGF0YSByZWdzIHdpdGggbmV3IGFjdGlvbiBuZXh0IHRpbWUu
CgpXaGVuIGFuZCBob3cgcXVpY2tseSBpcyBpdCBjb3BpZWQ/IENvbnNpZGVyIHRoYXQgaXQgd2ls
bCBiZSBpbW1lZGlhdGVseQpvdmVyd3JpdHRlbiBieSB0aGUgbmV4dCBwYWNrZXQuIERvZXMgdGhl
IHZncHUgbW1pbyB3cml0ZSBjYXVzZSB0aGUKY2FsbGluZyBDUFUgdG8gYmUgdHJhcHBlZD8KLUNo
cmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVs
LWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0
LWRldg==
