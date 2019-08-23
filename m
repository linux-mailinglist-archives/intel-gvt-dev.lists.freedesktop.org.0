Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BA09A967
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 23 Aug 2019 09:58:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56B886EBDC;
	Fri, 23 Aug 2019 07:58:52 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FA0F6EBDC;
 Fri, 23 Aug 2019 07:58:51 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 18235769-1500050 for multiple; Fri, 23 Aug 2019 08:58:38 +0100
MIME-Version: 1.0
To: Xiaolin Zhang <xiaolin.zhang@intel.com>, intel-gfx@lists.freedesktop.org, 
 intel-gvt-dev@lists.freedesktop.org
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <1566543451-13955-1-git-send-email-xiaolin.zhang@intel.com>
References: <1566543451-13955-1-git-send-email-xiaolin.zhang@intel.com>
Message-ID: <156654711627.27716.4474982727513548344@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915: to make vgpu ppgtt notificaiton
 as atomic operation
Date: Fri, 23 Aug 2019 08:58:36 +0100
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
Cc: zhenyu.z.wang@intel.com, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

UXVvdGluZyBYaWFvbGluIFpoYW5nICgyMDE5LTA4LTIzIDA3OjU3OjMxKQo+IHZncHUgcHBndHQg
bm90aWZpY2F0aW9uIHdhcyBzcGxpdCBpbnRvIDIgc3RlcHMsIHRoZSBmaXJzdCBzdGVwIGlzIHRv
Cj4gdXBkYXRlIFBWSU5GTydzIHBkcCByZWdpc3RlciBhbmQgdGhlbiB3cml0ZSBQVklORk8ncyBn
MnZfbm90aWZ5IHJlZ2lzdGVyCj4gd2l0aCBhY3Rpb24gY29kZSB0byB0aXJnZ2VyIHBwZ3R0IG5v
dGlmaWNhdGlvbiB0byBHVlQgc2lkZS4KPiAKPiBjdXJyZW50bHkgdGhlc2Ugc3RlcHMgd2VyZSBu
b3QgYXRvbWljIG9wZXJhdGlvbnMgZHVlIHRvIG5vIGFueSBwcm90ZWN0aW9uLAo+IHNvIGl0IGlz
IGVhc3kgdG8gZW50ZXIgcmFjZSBjb25kaXRpb24gc3RhdGUgZHVyaW5nIHRoZSBNVEJGLCBzdHJl
c3MgYW5kCj4gSUdUIHRlc3QgdG8gY2F1c2UgR1BVIGhhbmcuCj4gCj4gdGhlIHNvbHV0aW9uIGlz
IHRvIGFkZCBhIGxvY2sgdG8gbWFrZSB2Z3B1IHBwZ3R0IG5vdGljYXRpb24gYXMgYXRvbWljCj4g
b3BlcmF0aW9uLgo+IAo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4gU2lnbmVkLW9mZi1i
eTogWGlhb2xpbiBaaGFuZyA8eGlhb2xpbi56aGFuZ0BpbnRlbC5jb20+Cj4gLS0tCj4gIGRyaXZl
cnMvZ3B1L2RybS9pOTE1L2k5MTVfZHJ2LmggICAgIHwgMSArCj4gIGRyaXZlcnMvZ3B1L2RybS9p
OTE1L2k5MTVfZ2VtX2d0dC5jIHwgNCArKysrCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVf
dmdwdS5jICAgIHwgMSArCj4gIDMgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCj4gCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZHJ2LmggYi9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9pOTE1X2Rydi5oCj4gaW5kZXggZWIzMWMxNi4uMzJlMTdjNCAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2Rydi5oCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvaTkxNV9kcnYuaAo+IEBAIC05NjEsNiArOTYxLDcgQEAgc3RydWN0IGk5MTVfZnJv
bnRidWZmZXJfdHJhY2tpbmcgewo+ICB9Owo+ICAKPiAgc3RydWN0IGk5MTVfdmlydHVhbF9ncHUg
ewo+ICsgICAgICAgc3RydWN0IG11dGV4IGxvY2s7Cj4gICAgICAgICBib29sIGFjdGl2ZTsKPiAg
ICAgICAgIHUzMiBjYXBzOwo+ICB9Owo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9pOTE1X2dlbV9ndHQuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZ2VtX2d0dC5jCj4g
aW5kZXggMmNkMmRhYi4uZmYwYjE3OCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9pOTE1X2dlbV9ndHQuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZ2VtX2d0
dC5jCj4gQEAgLTgzMyw2ICs4MzMsOCBAQCBzdGF0aWMgaW50IGdlbjhfcHBndHRfbm90aWZ5X3Zn
dChzdHJ1Y3QgaTkxNV9wcGd0dCAqcHBndHQsIGJvb2wgY3JlYXRlKQo+ICAgICAgICAgZW51bSB2
Z3RfZzJ2X3R5cGUgbXNnOwo+ICAgICAgICAgaW50IGk7Cj4gIAo+ICsgICAgICAgbXV0ZXhfbG9j
aygmZGV2X3ByaXYtPnZncHUubG9jayk7Cj4gKwo+ICAgICAgICAgaWYgKGNyZWF0ZSkKPiAgICAg
ICAgICAgICAgICAgYXRvbWljX2luYyhweF91c2VkKHBwZ3R0LT5wZCkpOyAvKiBuZXZlciByZW1v
dmUgKi8KPiAgICAgICAgIGVsc2UKPiBAQCAtODYwLDYgKzg2Miw4IEBAIHN0YXRpYyBpbnQgZ2Vu
OF9wcGd0dF9ub3RpZnlfdmd0KHN0cnVjdCBpOTE1X3BwZ3R0ICpwcGd0dCwgYm9vbCBjcmVhdGUp
Cj4gIAo+ICAgICAgICAgSTkxNV9XUklURSh2Z3RpZl9yZWcoZzJ2X25vdGlmeSksIG1zZyk7Cj4g
IAoKSG93IGRvIHlvdSBrbm93IHRoZSBvcGVyYXRpb24gaXMgY29tcGxldGUgYW5kIGl0IGlzIG5v
dyBzYWZlIHRvCm92ZXJ3cml0ZSB0aGUgZGF0YSByZWdzPwotQ2hyaXMKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxp
c3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
