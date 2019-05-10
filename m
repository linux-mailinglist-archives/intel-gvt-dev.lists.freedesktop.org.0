Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF35619949
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 10 May 2019 10:06:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 703648961D;
	Fri, 10 May 2019 08:06:29 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2635E8961D
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 10 May 2019 08:06:28 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 May 2019 01:06:27 -0700
X-ExtLoop1: 1
Received: from vgt-optiplex-9020.sh.intel.com ([10.239.160.51])
 by fmsmga007.fm.intel.com with ESMTP; 10 May 2019 01:06:26 -0700
From: Weinan <weinan.z.li@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v2] drm/i915/gvt: emit init breadcrumb for gvt request
Date: Fri, 10 May 2019 15:57:20 +0800
Message-Id: <20190510075720.8206-1-weinan.z.li@intel.com>
X-Mailer: git-send-email 2.17.1
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
Cc: stable@vger.kernel.org, Weinan <weinan.z.li@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

IlRvIHRyYWNrIHdoZXRoZXIgYSByZXF1ZXN0IGhhcyBzdGFydGVkIG9uIEhXLCB3ZSBjYW4gZW1p
dCBhIGJyZWFkY3J1bWIgYXQKdGhlIGJlZ2lubmluZyBvZiB0aGUgcmVxdWVzdCBhbmQgY2hlY2sg
aXRzIHRpbWVsaW5lJ3MgSFdTUCB0byBzZWUgaWYgdGhlCmJyZWFkY3J1bWIgaGFzIGFkdmFuY2Vk
IHBhc3QgdGhlIHN0YXJ0IG9mIHRoaXMgcmVxdWVzdC4iIEl0IG1lYW5zIGFsbCB0aGUKcmVxdWVz
dCB3aGljaCB0aW1lbGluZSdzIGhhc19pbml0X2JyZWFkY3J1bWIgaXMgdHJ1ZSwgdGhlbiB0aGUK
ZW1pdF9pbml0X2JyZWFkY3J1bWIgcHJvY2VzcyBtdXN0IGhhdmUgYmVmb3JlIGVtaXR0aW5nIHRo
ZSByZWFsIGNvbW1hbmRzLApvdGhlcndpc2UsIHRoZSBzY2hlZHVsZXIgbWlnaHQgZ2V0IGEgd3Jv
bmcgc3RhdGUgb2YgdGhpcyByZXF1ZXN0IGR1cmluZwpyZXNldC4gSWYgdGhlIHJlcXVlc3QgaXMg
ZXhhY3RseSB0aGUgZ3VpbHR5IG9uZSwgdGhlIHNjaGVkdWxlciB3b24ndAp0ZXJtaW5hdGUgaXQg
d2l0aCB0aGUgd3Jvbmcgc3RhdGUuIFRvIGF2b2lkIHRoaXMsIGRvIGVtaXRfaW5pdF9icmVhZGNy
dW1iCmZvciBhbGwgdGhlIHJlcXVlc3RzIGZyb20gZ3Z0LgoKdjI6IGNjIHRvIHN0YWJsZSBrZXJu
ZWwKCkZpeGVzOiA4NTQ3NDQ0MTM3ZWMgKCJkcm0vaTkxNTogSWRlbnRpZnkgYWN0aXZlIHJlcXVl
c3RzIikKQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKU2lnbmVkLW9mZi1ieTogV2VpbmFuIDx3
ZWluYW4uei5saUBpbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3NjaGVk
dWxlci5jIHwgMTkgKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDE5IGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvc2NoZWR1bGVy
LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvc2NoZWR1bGVyLmMKaW5kZXggN2M5OWJiYzNl
MmI4Li5jY2Q3MTE1MmM5YmMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9z
Y2hlZHVsZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvc2NoZWR1bGVyLmMKQEAg
LTI5OCwxMiArMjk4LDMxIEBAIHN0YXRpYyBpbnQgY29weV93b3JrbG9hZF90b19yaW5nX2J1ZmZl
cihzdHJ1Y3QgaW50ZWxfdmdwdV93b3JrbG9hZCAqd29ya2xvYWQpCiAJc3RydWN0IGk5MTVfcmVx
dWVzdCAqcmVxID0gd29ya2xvYWQtPnJlcTsKIAl2b2lkICpzaGFkb3dfcmluZ19idWZmZXJfdmE7
CiAJdTMyICpjczsKKwlpbnQgZXJyOwogCiAJaWYgKChJU19LQUJZTEFLRShyZXEtPmk5MTUpIHx8
IElTX0JST1hUT04ocmVxLT5pOTE1KQogCQl8fCBJU19DT0ZGRUVMQUtFKHJlcS0+aTkxNSkpCiAJ
CSYmIGlzX2luaGliaXRfY29udGV4dChyZXEtPmh3X2NvbnRleHQpKQogCQlpbnRlbF92Z3B1X3Jl
c3RvcmVfaW5oaWJpdF9jb250ZXh0KHZncHUsIHJlcSk7CiAKKwkvKgorCSAqIFRvIHRyYWNrIHdo
ZXRoZXIgYSByZXF1ZXN0IGhhcyBzdGFydGVkIG9uIEhXLCB3ZSBjYW4gZW1pdCBhCisJICogYnJl
YWRjcnVtYiBhdCB0aGUgYmVnaW5uaW5nIG9mIHRoZSByZXF1ZXN0IGFuZCBjaGVjayBpdHMKKwkg
KiB0aW1lbGluZSdzIEhXU1AgdG8gc2VlIGlmIHRoZSBicmVhZGNydW1iIGhhcyBhZHZhbmNlZCBw
YXN0IHRoZQorCSAqIHN0YXJ0IG9mIHRoaXMgcmVxdWVzdC4gQWN0dWFsbHksIHRoZSByZXF1ZXN0
IG11c3QgaGF2ZSB0aGUKKwkgKiBpbml0X2JyZWFkY3J1bWIgaWYgaXRzIHRpbWVsaW5lIHNldCBo
YXNfaW5pdF9icmVhZF9jcnVtYiwgb3IgdGhlCisJICogc2NoZWR1bGVyIG1pZ2h0IGdldCBhIHdy
b25nIHN0YXRlIG9mIGl0IGR1cmluZyByZXNldC4gU2luY2UgdGhlCisJICogcmVxdWVzdHMgZnJv
bSBndnQgYWx3YXlzIHNldCB0aGUgaGFzX2luaXRfYnJlYWRjcnVtYiBmbGFnLCBoZXJlCisJICog
bmVlZCB0byBkbyB0aGUgZW1pdF9pbml0X2JyZWFkY3J1bWIgZm9yIGFsbCB0aGUgcmVxdWVzdHMu
CisJICovCisJaWYgKHJlcS0+ZW5naW5lLT5lbWl0X2luaXRfYnJlYWRjcnVtYikgeworCQllcnIg
PSByZXEtPmVuZ2luZS0+ZW1pdF9pbml0X2JyZWFkY3J1bWIocmVxKTsKKwkJaWYgKGVycikgewor
CQkJZ3Z0X3ZncHVfZXJyKCJmYWlsIHRvIGVtaXQgaW5pdCBicmVhZGNydW1iXG4iKTsKKwkJCXJl
dHVybiBlcnI7CisJCX0KKwl9CisKIAkvKiBhbGxvY2F0ZSBzaGFkb3cgcmluZyBidWZmZXIgKi8K
IAljcyA9IGludGVsX3JpbmdfYmVnaW4od29ya2xvYWQtPnJlcSwgd29ya2xvYWQtPnJiX2xlbiAv
IHNpemVvZih1MzIpKTsKIAlpZiAoSVNfRVJSKGNzKSkgewotLSAKMi4xNy4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxp
bmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
