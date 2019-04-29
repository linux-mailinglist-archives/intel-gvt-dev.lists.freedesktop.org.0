Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7889EDAA7
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 29 Apr 2019 05:11:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D79289143;
	Mon, 29 Apr 2019 03:11:43 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92D3389141;
 Mon, 29 Apr 2019 03:11:41 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Apr 2019 20:11:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,408,1549958400"; d="scan'208";a="146648244"
Received: from xzhan34-mobl3.bj.intel.com ([10.238.154.121])
 by fmsmga007.fm.intel.com with ESMTP; 28 Apr 2019 20:11:38 -0700
From: Xiaolin Zhang <xiaolin.zhang@intel.com>
To: intel-gvt-dev@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 5/8] drm/i915/gvt: GVTg handle pv_caps PVINFO register
Date: Mon, 29 Apr 2019 11:10:55 +0800
Message-Id: <1556507458-24684-6-git-send-email-xiaolin.zhang@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1556507458-24684-1-git-send-email-xiaolin.zhang@intel.com>
References: <1556507458-24684-1-git-send-email-xiaolin.zhang@intel.com>
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

aW1wbGVtZW50IHB2X2NhcHMgUFZJTkZPIHJlZ2lzdGVyIGhhbmRsZXIgaW4gR1ZUZyB0bwpjb250
cm9sIGRpZmZlcmVudCBsZXZlbCBwdiBvcHRpbWl6YXRpb24gd2l0aGluIGd1ZXN0LgoKcmVwb3J0
IFZHVF9DQVBTX1BWIGNhcGFiaWxpdHkgaW4gcHZpbmZvIHBhZ2UgZm9yIGd1ZXN0LgoKdjA6IFJG
Qwp2MTogcmViYXNlCnYyOiByZWJhc2UKdjM6IHJlbmFtZWQgZW5hYmxlX3B2bW1pbyB0byBwdm1t
aW9fY2FwcyB3aGljaCBpcyB1c2VkIGZvciBob3N0CnB2IGNhcHMuCnY0OiByZW5hbWVkIHB2bW1p
b19jYXBzIHRvIHB2X2NhcHMKdjU6IHJlYmFzZQoKU2lnbmVkLW9mZi1ieTogWGlhb2xpbiBaaGFu
ZyA8eGlhb2xpbi56aGFuZ0BpbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0
L2hhbmRsZXJzLmMgfCA0ICsrKysKIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC92Z3B1LmMgICAg
IHwgMyArKysKIDIgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRsZXJzLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9ndnQvaGFuZGxlcnMuYwppbmRleCAxOGYwMWVlLi5mN2VjZDRlIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaGFuZGxlcnMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9ndnQvaGFuZGxlcnMuYwpAQCAtMTE5Miw2ICsxMTkyLDcgQEAgc3RhdGljIGludCBwdmluZm9f
bW1pb19yZWFkKHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1LCB1bnNpZ25lZCBpbnQgb2Zmc2V0LAog
CQlicmVhazsKIAljYXNlIDB4NzgwMTA6CS8qIHZndF9jYXBzICovCiAJY2FzZSAweDc4ODFjOgor
CWNhc2UgX3ZndGlmX3JlZyhwdl9jYXBzKToKIAkJYnJlYWs7CiAJZGVmYXVsdDoKIAkJaW52YWxp
ZF9yZWFkID0gdHJ1ZTsKQEAgLTEyNjUsNiArMTI2Niw5IEBAIHN0YXRpYyBpbnQgcHZpbmZvX21t
aW9fd3JpdGUoc3RydWN0IGludGVsX3ZncHUgKnZncHUsIHVuc2lnbmVkIGludCBvZmZzZXQsCiAJ
Y2FzZSBfdmd0aWZfcmVnKGcydl9ub3RpZnkpOgogCQlyZXQgPSBoYW5kbGVfZzJ2X25vdGlmaWNh
dGlvbih2Z3B1LCBkYXRhKTsKIAkJYnJlYWs7CisJY2FzZSBfdmd0aWZfcmVnKHB2X2NhcHMpOgor
CQlEUk1fSU5GTygidmdwdSBpZD0lZCBwdiBjYXBzID0weCV4XG4iLCB2Z3B1LT5pZCwgZGF0YSk7
CisJCWJyZWFrOwogCS8qIGFkZCB4aG90IGFuZCB5aG90IHRvIGhhbmRsZWQgbGlzdCB0byBhdm9p
ZCBlcnJvciBsb2cgKi8KIAljYXNlIF92Z3RpZl9yZWcoY3Vyc29yX3hfaG90KToKIAljYXNlIF92
Z3RpZl9yZWcoY3Vyc29yX3lfaG90KToKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2d2dC92Z3B1LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvdmdwdS5jCmluZGV4IDQ0Y2Uz
YzIuLjNlY2M0NWEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC92Z3B1LmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3ZncHUuYwpAQCAtNDcsNiArNDcsNyBAQCB2
b2lkIHBvcHVsYXRlX3B2aW5mb19wYWdlKHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1KQogCXZncHVf
dnJlZ190KHZncHUsIHZndGlmX3JlZyh2Z3RfY2FwcykpID0gVkdUX0NBUFNfRlVMTF9QUEdUVDsK
IAl2Z3B1X3ZyZWdfdCh2Z3B1LCB2Z3RpZl9yZWcodmd0X2NhcHMpKSB8PSBWR1RfQ0FQU19IV1NQ
X0VNVUxBVElPTjsKIAl2Z3B1X3ZyZWdfdCh2Z3B1LCB2Z3RpZl9yZWcodmd0X2NhcHMpKSB8PSBW
R1RfQ0FQU19IVUdFX0dUVDsKKwl2Z3B1X3ZyZWdfdCh2Z3B1LCB2Z3RpZl9yZWcodmd0X2NhcHMp
KSB8PSBWR1RfQ0FQU19QVjsKIAogCXZncHVfdnJlZ190KHZncHUsIHZndGlmX3JlZyhhdmFpbF9y
cy5tYXBwYWJsZV9nbWFkci5iYXNlKSkgPQogCQl2Z3B1X2FwZXJ0dXJlX2dtYWRyX2Jhc2Uodmdw
dSk7CkBAIC01MzEsNiArNTMyLDcgQEAgdm9pZCBpbnRlbF9ndnRfcmVzZXRfdmdwdV9sb2NrZWQo
c3RydWN0IGludGVsX3ZncHUgKnZncHUsIGJvb2wgZG1sciwKIAlzdHJ1Y3QgaW50ZWxfZ3Z0ICpn
dnQgPSB2Z3B1LT5ndnQ7CiAJc3RydWN0IGludGVsX2d2dF93b3JrbG9hZF9zY2hlZHVsZXIgKnNj
aGVkdWxlciA9ICZndnQtPnNjaGVkdWxlcjsKIAlpbnRlbF9lbmdpbmVfbWFza190IHJlc2V0dGlu
Z19lbmcgPSBkbWxyID8gQUxMX0VOR0lORVMgOiBlbmdpbmVfbWFzazsKKwlpbnQgcHZfY2FwcyA9
IHZncHVfdnJlZ190KHZncHUsIHZndGlmX3JlZyhwdl9jYXBzKSk7CiAKIAlndnRfZGJnX2NvcmUo
Ii0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLVxuIik7CiAJZ3Z0X2Ri
Z19jb3JlKCJyZXNzZXRpbmcgdmdwdSVkLCBkbWxyICVkLCBlbmdpbmVfbWFzayAlMDh4XG4iLApA
QCAtNTYyLDYgKzU2NCw3IEBAIHZvaWQgaW50ZWxfZ3Z0X3Jlc2V0X3ZncHVfbG9ja2VkKHN0cnVj
dCBpbnRlbF92Z3B1ICp2Z3B1LCBib29sIGRtbHIsCiAKIAkJaW50ZWxfdmdwdV9yZXNldF9tbWlv
KHZncHUsIGRtbHIpOwogCQlwb3B1bGF0ZV9wdmluZm9fcGFnZSh2Z3B1KTsKKwkJdmdwdV92cmVn
X3QodmdwdSwgdmd0aWZfcmVnKHB2X2NhcHMpKSA9IHB2X2NhcHM7CiAJCWludGVsX3ZncHVfcmVz
ZXRfZGlzcGxheSh2Z3B1KTsKIAogCQlpZiAoZG1scikgewotLSAKMi43LjQKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGlu
ZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
