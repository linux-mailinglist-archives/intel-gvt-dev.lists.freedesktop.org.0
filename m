Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 466DA112305
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  4 Dec 2019 07:43:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E22AE6E23B;
	Wed,  4 Dec 2019 06:43:20 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 601786E23B
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  4 Dec 2019 06:43:19 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Dec 2019 22:43:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,276,1571727600"; d="scan'208";a="361461256"
Received: from joy-optiplex-7040.sh.intel.com (HELO joy-OptiPlex-7040)
 ([10.239.13.9])
 by orsmga004.jf.intel.com with ESMTP; 03 Dec 2019 22:43:17 -0800
Date: Wed, 4 Dec 2019 01:35:08 -0500
From: Yan Zhao <yan.y.zhao@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [PATCH 1/3] drm/i915/gvt: remove unused type attributes
Message-ID: <20191204063508.GA31791@joy-OptiPlex-7040>
References: <20191202070109.73924-1-zhenyuw@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191202070109.73924-1-zhenyuw@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Reply-To: Yan Zhao <yan.y.zhao@intel.com>
Cc: intel-gvt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IFlhbiBaaGFvIDx5YW4ueS56aGFvQGludGVsLmNvbT4KCk9uIE1vbiwgRGVj
IDAyLCAyMDE5IGF0IDAzOjAxOjA3UE0gKzA4MDAsIFpoZW55dSBXYW5nIHdyb3RlOgo+IE9ubHkg
bmVlZCB0byBnZXQgYXR0cmlidXRlIGdyb3VwIGluc3RlYWQgb2YgYXR0cmlidXRlcyBhbmQgaXQg
aGFzCj4gbm8gdXNlLCBzbyByZW1vdmUgaXQuCj4gCj4gU2lnbmVkLW9mZi1ieTogWmhlbnl1IFdh
bmcgPHpoZW55dXdAbGludXguaW50ZWwuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkx
NS9ndnQvZ3Z0LmMgICB8IDQgKy0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3Z0Lmgg
ICB8IDMgKy0tCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9rdm1ndC5jIHwgNCArLS0tCj4g
IDMgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+IAo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3Z0LmMgYi9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9ndnQvZ3Z0LmMKPiBpbmRleCA4ZjM3ZWVmYTBhMDIuLmNiNWZhMzBiOGU2MyAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3Z0LmMKPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9ndnQvZ3Z0LmMKPiBAQCAtMTIwLDEwICsxMjAsOCBAQCBzdGF0aWMgc3Ry
dWN0IGF0dHJpYnV0ZV9ncm91cCAqZ3Z0X3ZncHVfdHlwZV9ncm91cHNbXSA9IHsKPiAgCVswIC4u
LiBOUl9NQVhfSU5URUxfVkdQVV9UWVBFUyAtIDFdID0gTlVMTCwKPiAgfTsKPiAgCj4gLXN0YXRp
YyBib29sIGludGVsX2dldF9ndnRfYXR0cnMoc3RydWN0IGF0dHJpYnV0ZSAqKip0eXBlX2F0dHJz
LAo+IC0JCXN0cnVjdCBhdHRyaWJ1dGVfZ3JvdXAgKioqaW50ZWxfdmdwdV90eXBlX2dyb3VwcykK
PiArc3RhdGljIGJvb2wgaW50ZWxfZ2V0X2d2dF9hdHRycyhzdHJ1Y3QgYXR0cmlidXRlX2dyb3Vw
ICoqKmludGVsX3ZncHVfdHlwZV9ncm91cHMpCj4gIHsKPiAtCSp0eXBlX2F0dHJzID0gZ3Z0X3R5
cGVfYXR0cnM7Cj4gIAkqaW50ZWxfdmdwdV90eXBlX2dyb3VwcyA9IGd2dF92Z3B1X3R5cGVfZ3Jv
dXBzOwo+ICAJcmV0dXJuIHRydWU7Cj4gIH0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ3Z0L2d2dC5oIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d2dC5oCj4gaW5kZXgg
YjQ3YzZhY2FmOWMwLi4wMDgxYjA1MWQzZTAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ3Z0L2d2dC5oCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d2dC5oCj4g
QEAgLTU3MCw4ICs1NzAsNyBAQCBzdHJ1Y3QgaW50ZWxfZ3Z0X29wcyB7Cj4gIAl2b2lkICgqdmdw
dV9kZWFjdGl2YXRlKShzdHJ1Y3QgaW50ZWxfdmdwdSAqKTsKPiAgCXN0cnVjdCBpbnRlbF92Z3B1
X3R5cGUgKigqZ3Z0X2ZpbmRfdmdwdV90eXBlKShzdHJ1Y3QgaW50ZWxfZ3Z0ICpndnQsCj4gIAkJ
CWNvbnN0IGNoYXIgKm5hbWUpOwo+IC0JYm9vbCAoKmdldF9ndnRfYXR0cnMpKHN0cnVjdCBhdHRy
aWJ1dGUgKioqdHlwZV9hdHRycywKPiAtCQkJc3RydWN0IGF0dHJpYnV0ZV9ncm91cCAqKippbnRl
bF92Z3B1X3R5cGVfZ3JvdXBzKTsKPiArCWJvb2wgKCpnZXRfZ3Z0X2F0dHJzKShzdHJ1Y3QgYXR0
cmlidXRlX2dyb3VwICoqKmludGVsX3ZncHVfdHlwZV9ncm91cHMpOwo+ICAJaW50ICgqdmdwdV9x
dWVyeV9wbGFuZSkoc3RydWN0IGludGVsX3ZncHUgKnZncHUsIHZvaWQgKik7Cj4gIAlpbnQgKCp2
Z3B1X2dldF9kbWFidWYpKHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1LCB1bnNpZ25lZCBpbnQpOwo+
ICAJaW50ICgqd3JpdGVfcHJvdGVjdF9oYW5kbGVyKShzdHJ1Y3QgaW50ZWxfdmdwdSAqLCB1NjQs
IHZvaWQgKiwKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2t2bWd0LmMg
Yi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQva3ZtZ3QuYwo+IGluZGV4IDA0YTVhMGQ5MDgyMy4u
YTY5OWVjYWRlM2ZjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9rdm1n
dC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2t2bWd0LmMKPiBAQCAtMTU5Nywx
MiArMTU5NywxMCBAQCBzdGF0aWMgc3RydWN0IG1kZXZfcGFyZW50X29wcyBpbnRlbF92Z3B1X29w
cyA9IHsKPiAgCj4gIHN0YXRpYyBpbnQga3ZtZ3RfaG9zdF9pbml0KHN0cnVjdCBkZXZpY2UgKmRl
diwgdm9pZCAqZ3Z0LCBjb25zdCB2b2lkICpvcHMpCj4gIHsKPiAtCXN0cnVjdCBhdHRyaWJ1dGUg
Kiprdm1fdHlwZV9hdHRyczsKPiAgCXN0cnVjdCBhdHRyaWJ1dGVfZ3JvdXAgKiprdm1fdmdwdV90
eXBlX2dyb3VwczsKPiAgCj4gIAlpbnRlbF9ndnRfb3BzID0gb3BzOwo+IC0JaWYgKCFpbnRlbF9n
dnRfb3BzLT5nZXRfZ3Z0X2F0dHJzKCZrdm1fdHlwZV9hdHRycywKPiAtCQkJJmt2bV92Z3B1X3R5
cGVfZ3JvdXBzKSkKPiArCWlmICghaW50ZWxfZ3Z0X29wcy0+Z2V0X2d2dF9hdHRycygma3ZtX3Zn
cHVfdHlwZV9ncm91cHMpKQo+ICAJCXJldHVybiAtRUZBVUxUOwo+ICAJaW50ZWxfdmdwdV9vcHMu
c3VwcG9ydGVkX3R5cGVfZ3JvdXBzID0ga3ZtX3ZncHVfdHlwZV9ncm91cHM7Cj4gIAo+IC0tIAo+
IDIuMjQuMAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKPiBpbnRlbC1ndnQtZGV2QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vaW50ZWwtZ3Z0LWRldgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2ludGVsLWd2dC1kZXY=
