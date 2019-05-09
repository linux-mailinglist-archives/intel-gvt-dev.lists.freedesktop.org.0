Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E64B18685
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  9 May 2019 10:06:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC6E389AC6;
	Thu,  9 May 2019 08:06:49 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4DC589AC6
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  9 May 2019 08:06:48 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 May 2019 01:06:47 -0700
X-ExtLoop1: 1
Received: from vgt-optiplex-9020.sh.intel.com ([10.239.160.51])
 by orsmga003.jf.intel.com with ESMTP; 09 May 2019 01:06:47 -0700
From: Weinan <weinan.z.li@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH] drm/i915/gvt: emit init breadcrumb for gvt request
Date: Thu,  9 May 2019 15:57:42 +0800
Message-Id: <20190509075742.6368-1-weinan.z.li@intel.com>
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
Cc: Weinan <weinan.z.li@intel.com>
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
dW1iCmZvciBhbGwgdGhlIHJlcXVlc3RzIGZyb20gZ3Z0LgoKRml4ZXM6IDg1NDc0NDQxMzdlYyAo
ImRybS9pOTE1OiBJZGVudGlmeSBhY3RpdmUgcmVxdWVzdHMiKQoKU2lnbmVkLW9mZi1ieTogV2Vp
bmFuIDx3ZWluYW4uei5saUBpbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0
L3NjaGVkdWxlci5jIHwgMTkgKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDE5
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvc2No
ZWR1bGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvc2NoZWR1bGVyLmMKaW5kZXggN2M5
OWJiYzNlMmI4Li5jY2Q3MTE1MmM5YmMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2d2dC9zY2hlZHVsZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvc2NoZWR1bGVy
LmMKQEAgLTI5OCwxMiArMjk4LDMxIEBAIHN0YXRpYyBpbnQgY29weV93b3JrbG9hZF90b19yaW5n
X2J1ZmZlcihzdHJ1Y3QgaW50ZWxfdmdwdV93b3JrbG9hZCAqd29ya2xvYWQpCiAJc3RydWN0IGk5
MTVfcmVxdWVzdCAqcmVxID0gd29ya2xvYWQtPnJlcTsKIAl2b2lkICpzaGFkb3dfcmluZ19idWZm
ZXJfdmE7CiAJdTMyICpjczsKKwlpbnQgZXJyOwogCiAJaWYgKChJU19LQUJZTEFLRShyZXEtPmk5
MTUpIHx8IElTX0JST1hUT04ocmVxLT5pOTE1KQogCQl8fCBJU19DT0ZGRUVMQUtFKHJlcS0+aTkx
NSkpCiAJCSYmIGlzX2luaGliaXRfY29udGV4dChyZXEtPmh3X2NvbnRleHQpKQogCQlpbnRlbF92
Z3B1X3Jlc3RvcmVfaW5oaWJpdF9jb250ZXh0KHZncHUsIHJlcSk7CiAKKwkvKgorCSAqIFRvIHRy
YWNrIHdoZXRoZXIgYSByZXF1ZXN0IGhhcyBzdGFydGVkIG9uIEhXLCB3ZSBjYW4gZW1pdCBhCisJ
ICogYnJlYWRjcnVtYiBhdCB0aGUgYmVnaW5uaW5nIG9mIHRoZSByZXF1ZXN0IGFuZCBjaGVjayBp
dHMKKwkgKiB0aW1lbGluZSdzIEhXU1AgdG8gc2VlIGlmIHRoZSBicmVhZGNydW1iIGhhcyBhZHZh
bmNlZCBwYXN0IHRoZQorCSAqIHN0YXJ0IG9mIHRoaXMgcmVxdWVzdC4gQWN0dWFsbHksIHRoZSBy
ZXF1ZXN0IG11c3QgaGF2ZSB0aGUKKwkgKiBpbml0X2JyZWFkY3J1bWIgaWYgaXRzIHRpbWVsaW5l
IHNldCBoYXNfaW5pdF9icmVhZF9jcnVtYiwgb3IgdGhlCisJICogc2NoZWR1bGVyIG1pZ2h0IGdl
dCBhIHdyb25nIHN0YXRlIG9mIGl0IGR1cmluZyByZXNldC4gU2luY2UgdGhlCisJICogcmVxdWVz
dHMgZnJvbSBndnQgYWx3YXlzIHNldCB0aGUgaGFzX2luaXRfYnJlYWRjcnVtYiBmbGFnLCBoZXJl
CisJICogbmVlZCB0byBkbyB0aGUgZW1pdF9pbml0X2JyZWFkY3J1bWIgZm9yIGFsbCB0aGUgcmVx
dWVzdHMuCisJICovCisJaWYgKHJlcS0+ZW5naW5lLT5lbWl0X2luaXRfYnJlYWRjcnVtYikgewor
CQllcnIgPSByZXEtPmVuZ2luZS0+ZW1pdF9pbml0X2JyZWFkY3J1bWIocmVxKTsKKwkJaWYgKGVy
cikgeworCQkJZ3Z0X3ZncHVfZXJyKCJmYWlsIHRvIGVtaXQgaW5pdCBicmVhZGNydW1iXG4iKTsK
KwkJCXJldHVybiBlcnI7CisJCX0KKwl9CisKIAkvKiBhbGxvY2F0ZSBzaGFkb3cgcmluZyBidWZm
ZXIgKi8KIAljcyA9IGludGVsX3JpbmdfYmVnaW4od29ya2xvYWQtPnJlcSwgd29ya2xvYWQtPnJi
X2xlbiAvIHNpemVvZih1MzIpKTsKIAlpZiAoSVNfRVJSKGNzKSkgewotLSAKMi4xNy4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2
IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
