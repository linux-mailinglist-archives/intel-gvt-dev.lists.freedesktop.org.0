Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3D770F6F
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 23 Jul 2019 04:57:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EDC989E2B;
	Tue, 23 Jul 2019 02:57:54 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4039689E2B;
 Tue, 23 Jul 2019 02:57:54 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jul 2019 19:57:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,297,1559545200"; d="scan'208";a="171040508"
Received: from vca-bj102.bj.intel.com ([10.240.193.76])
 by fmsmga007.fm.intel.com with ESMTP; 22 Jul 2019 19:57:52 -0700
From: Xiaolin Zhang <xiaolin.zhang@intel.com>
To: intel-gvt-dev@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v8 9/9] drm/i915/gvt: GVTg support context submission pv
 optimization
Date: Tue, 23 Jul 2019 19:32:04 +0800
Message-Id: <1563881524-147440-10-git-send-email-xiaolin.zhang@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1563881524-147440-1-git-send-email-xiaolin.zhang@intel.com>
References: <1563881524-147440-1-git-send-email-xiaolin.zhang@intel.com>
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
Cc: Xiaolin Zhang <xiaolin.zhang@intel.com>, zhenyu.z.wang@intel.com,
 joonas.lahtinen@linux.intel.com, hang.yuan@intel.com, min.he@intel.com,
 zhiyuan.lv@intel.com, chris@chris-wilson.co.uk, zhi.a.wang@intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

aW1wbGVtZW50ZWQgY29udGV4dCBzdWJtaXNzaW9uIHB2IG9wdGltaXphaXRvbiB3aXRoaW4gR1ZU
Zy4KCkdWVGcgdG8gcmVhZCBjb250ZXh0IHN1Ym1pc3Npb24gZGF0YSAoZWxzcF9kYXRhKSBmcm9t
IHRoZSBzaGFyZWRfcGFnZQpkaXJlY3RseSB3aXRob3V0IHRyYXAgY29zdCBhbmQgZWxpbWluYXRl
IGV4ZWNsaXN0IEhXIGJlaGF2aW9yIGVtdWxhdGlvbgp3aXRob3V0IGluamVjdGluZyBjb250ZXh0
IHN3aXRjaCBpbnRlcnJ1cHQgdG8gZ3Vlc3QgdW5kZXIgUFYKc3VibWlzaXNvbiBtZWNoYW5pc20u
Cgp2MDogUkZDLgp2MTogcmViYXNlLgp2MjogcmViYXNlLgp2MzogcmVwb3J0IHB2IGNvbnRleHQg
c3VibWlzc2lvbiBjYXAgYW5kIGhhbmRsZSBWR1RfRzJWX0VMU1BfU1VCTUlUCmcydiBwdiBub3Rp
ZmljYXRpb24uCnY0OiBlbGltaW5hdGUgZXhlY2xpc3QgSFcgZW11bGF0aW9uIGFuZCBkb24ndCBp
bmplY3QgY29udGV4dCBzd2l0Y2gKaW50ZXJydXB0IHRvIGd1ZXN0IHVuZGVyIFBWIHN1Ym1pc2lz
b24gbWVjaGFuaXNtLgp2NTogcmViYXNlLgp2NjogcmViYXNlLgp2NzogcmViYXNlLgp2ODogYWRk
cmVzc2VkIHY3IHB2IHN1Ym1pc3Npb24gY29tbWVudHMuCgpTaWduZWQtb2ZmLWJ5OiBYaWFvbGlu
IFpoYW5nIDx4aWFvbGluLnpoYW5nQGludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkx
NS9ndnQvZXhlY2xpc3QuYyB8ICA2ICsrKysrKwogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2hh
bmRsZXJzLmMgfCAzMCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0KIGRyaXZlcnMvZ3B1
L2RybS9pOTE1L2d2dC92Z3B1LmMgICAgIHwgIDIgKysKIDMgZmlsZXMgY2hhbmdlZCwgMzcgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2d2dC9leGVjbGlzdC5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2V4ZWNsaXN0LmMK
aW5kZXggZjIxYjhmYi4uZTUyYmZkNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUv
Z3Z0L2V4ZWNsaXN0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2V4ZWNsaXN0LmMK
QEAgLTM4Miw2ICszODIsOSBAQCBzdGF0aWMgaW50IHByZXBhcmVfZXhlY2xpc3Rfd29ya2xvYWQo
c3RydWN0IGludGVsX3ZncHVfd29ya2xvYWQgKndvcmtsb2FkKQogCWludCByaW5nX2lkID0gd29y
a2xvYWQtPnJpbmdfaWQ7CiAJaW50IHJldDsKIAorCWlmIChWR1BVX1BWQ0FQKHZncHUsIFBWX1NV
Qk1JU1NJT04pKQorCQlyZXR1cm4gMDsKKwogCWlmICghd29ya2xvYWQtPmVtdWxhdGVfc2NoZWR1
bGVfaW4pCiAJCXJldHVybiAwOwogCkBAIC00MjksNiArNDMyLDkgQEAgc3RhdGljIGludCBjb21w
bGV0ZV9leGVjbGlzdF93b3JrbG9hZChzdHJ1Y3QgaW50ZWxfdmdwdV93b3JrbG9hZCAqd29ya2xv
YWQpCiAJCWdvdG8gb3V0OwogCX0KIAorCWlmIChWR1BVX1BWQ0FQKHZncHUsIFBWX1NVQk1JU1NJ
T04pKQorCQlnb3RvIG91dDsKKwogCXJldCA9IGVtdWxhdGVfZXhlY2xpc3RfY3R4X3NjaGVkdWxl
X291dChleGVjbGlzdCwgJndvcmtsb2FkLT5jdHhfZGVzYyk7CiBvdXQ6CiAJaW50ZWxfdmdwdV91
bnBpbl9tbSh3b3JrbG9hZC0+c2hhZG93X21tKTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2d2dC9oYW5kbGVycy5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRsZXJz
LmMKaW5kZXggODViNDM0Ni4uZDVkYzQ4MCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ3Z0L2hhbmRsZXJzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRsZXJz
LmMKQEAgLTE4MTAsNiArMTgxMCwzMSBAQCBzdGF0aWMgaW50IG1taW9fcmVhZF9mcm9tX2h3KHN0
cnVjdCBpbnRlbF92Z3B1ICp2Z3B1LAogCXJldHVybiBpbnRlbF92Z3B1X2RlZmF1bHRfbW1pb19y
ZWFkKHZncHUsIG9mZnNldCwgcF9kYXRhLCBieXRlcyk7CiB9CiAKK3N0YXRpYyBpbnQgaGFuZGxl
X3B2X3N1Ym1pc3Npb24oc3RydWN0IGludGVsX3ZncHUgKnZncHUsIGludCByaW5nX2lkKQorewor
CXN0cnVjdCBpbnRlbF92Z3B1X2V4ZWNsaXN0ICpleGVjbGlzdDsKKwl1MzIgaHdfaWQgPSB2Z3B1
LT5ndnQtPmRldl9wcml2LT5lbmdpbmVbcmluZ19pZF0tPmh3X2lkOworCXUzMiBiYXNlID0gUFZf
RUxTUF9PRkYgKyBod19pZCAqIHNpemVvZihzdHJ1Y3QgcHZfc3VibWlzc2lvbik7CisJdTMyIGRl
c2Nfb2ZmID0gb2Zmc2V0b2Yoc3RydWN0IHB2X3N1Ym1pc3Npb24sIGRlc2NzKTsKKwl1MzIgc3Vi
bWl0dGVkX29mZiA9IG9mZnNldG9mKHN0cnVjdCBwdl9zdWJtaXNzaW9uLCBzdWJtaXR0ZWQpOwor
CWJvb2wgc3VibWl0dGVkID0gZmFsc2U7CisJaW50IHJldDsKKworCWV4ZWNsaXN0ID0gJnZncHUt
PnN1Ym1pc3Npb24uZXhlY2xpc3RbcmluZ19pZF07CisJZGVzY19vZmYgKz0gYmFzZTsKKwlpZiAo
aW50ZWxfZ3Z0X3JlYWRfc2hhcmVkX3BhZ2UodmdwdSwgZGVzY19vZmYsCisJCQkmZXhlY2xpc3Qt
PmVsc3BfZHdvcmRzLmRhdGEsIDE2KSkKKwkJcmV0dXJuIC1FSU5WQUw7CisKKwlyZXQgPSBpbnRl
bF92Z3B1X3N1Ym1pdF9leGVjbGlzdCh2Z3B1LCByaW5nX2lkKTsKKwlpZiAocmV0KQorCQlndnRf
dmdwdV9lcnIoImZhaWwgc3VibWl0IHdvcmtsb2FkIG9uIHJpbmcgJWRcbiIsIHJpbmdfaWQpOwor
CisJc3VibWl0dGVkX29mZiArPSBiYXNlOworCXJldCA9IGludGVsX2d2dF93cml0ZV9zaGFyZWRf
cGFnZSh2Z3B1LCBzdWJtaXR0ZWRfb2ZmLCAmc3VibWl0dGVkLCAxKTsKKwlyZXR1cm4gcmV0Owor
fQorCiBzdGF0aWMgaW50IGVsc3BfbW1pb193cml0ZShzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSwg
dW5zaWduZWQgaW50IG9mZnNldCwKIAkJdm9pZCAqcF9kYXRhLCB1bnNpZ25lZCBpbnQgYnl0ZXMp
CiB7CkBAIC0xODIxLDggKzE4NDYsMTEgQEAgc3RhdGljIGludCBlbHNwX21taW9fd3JpdGUoc3Ry
dWN0IGludGVsX3ZncHUgKnZncHUsIHVuc2lnbmVkIGludCBvZmZzZXQsCiAJaWYgKFdBUk5fT04o
cmluZ19pZCA8IDAgfHwgcmluZ19pZCA+PSBJOTE1X05VTV9FTkdJTkVTKSkKIAkJcmV0dXJuIC1F
SU5WQUw7CiAKLQlleGVjbGlzdCA9ICZ2Z3B1LT5zdWJtaXNzaW9uLmV4ZWNsaXN0W3JpbmdfaWRd
OworCWlmIChWR1BVX1BWQ0FQKHZncHUsIFBWX1NVQk1JU1NJT04pICYmCisJCQlkYXRhID09IFBW
X0FDVElPTl9FTFNQX1NVQk1JU1NJT04pCisJCXJldHVybiBoYW5kbGVfcHZfc3VibWlzc2lvbih2
Z3B1LCByaW5nX2lkKTsKIAorCWV4ZWNsaXN0ID0gJnZncHUtPnN1Ym1pc3Npb24uZXhlY2xpc3Rb
cmluZ19pZF07CiAJZXhlY2xpc3QtPmVsc3BfZHdvcmRzLmRhdGFbMyAtIGV4ZWNsaXN0LT5lbHNw
X2R3b3Jkcy5pbmRleF0gPSBkYXRhOwogCWlmIChleGVjbGlzdC0+ZWxzcF9kd29yZHMuaW5kZXgg
PT0gMykgewogCQlyZXQgPSBpbnRlbF92Z3B1X3N1Ym1pdF9leGVjbGlzdCh2Z3B1LCByaW5nX2lk
KTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC92Z3B1LmMgYi9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9ndnQvdmdwdS5jCmluZGV4IGY5ODJhMjMuLmNiMDg4YTAgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC92Z3B1LmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ3Z0L3ZncHUuYwpAQCAtNTEsNiArNTEsOCBAQCB2b2lkIHBvcHVsYXRlX3B2aW5mb19w
YWdlKHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1KQogCiAJaWYgKCFpbnRlbF92dGRfYWN0aXZlKCkp
CiAJCXZncHVfdnJlZ190KHZncHUsIHZndGlmX3JlZyhwdl9jYXBzKSkgPSBQVl9QUEdUVF9VUERB
VEU7CisJdmdwdV92cmVnX3QodmdwdSwgdmd0aWZfcmVnKHB2X2NhcHMpKSB8PSBQVl9TVUJNSVNT
SU9OOworCiAJdmdwdV92cmVnX3QodmdwdSwgdmd0aWZfcmVnKGF2YWlsX3JzLm1hcHBhYmxlX2dt
YWRyLmJhc2UpKSA9CiAJCXZncHVfYXBlcnR1cmVfZ21hZHJfYmFzZSh2Z3B1KTsKIAl2Z3B1X3Zy
ZWdfdCh2Z3B1LCB2Z3RpZl9yZWcoYXZhaWxfcnMubWFwcGFibGVfZ21hZHIuc2l6ZSkpID0KLS0g
CjEuOC4zLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50
ZWwtZ3Z0LWRldg==
