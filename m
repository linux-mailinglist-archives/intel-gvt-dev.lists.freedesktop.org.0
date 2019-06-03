Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 285EF3283E
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  3 Jun 2019 08:03:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB89D89904;
	Mon,  3 Jun 2019 06:03:30 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B39018997E;
 Mon,  3 Jun 2019 06:03:28 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Jun 2019 23:03:28 -0700
X-ExtLoop1: 1
Received: from xzhan34-mobl3.bj.intel.com ([10.238.154.54])
 by orsmga003.jf.intel.com with ESMTP; 02 Jun 2019 23:03:26 -0700
From: Xiaolin Zhang <xiaolin.zhang@intel.com>
To: intel-gvt-dev@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v6 5/8] drm/i915/gvt: GVTg handle pv_caps PVINFO register
Date: Mon,  3 Jun 2019 14:02:46 +0800
Message-Id: <1559541769-25279-6-git-send-email-xiaolin.zhang@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559541769-25279-1-git-send-email-xiaolin.zhang@intel.com>
References: <1559541769-25279-1-git-send-email-xiaolin.zhang@intel.com>
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
Qy4KdjE6IHJlYmFzZS4KdjI6IHJlYmFzZS4KdjM6IHJlbmFtZWQgZW5hYmxlX3B2bW1pbyB0byBw
dm1taW9fY2FwcyB3aGljaCBpcyB1c2VkIGZvciBob3N0CnB2IGNhcHMuCnY0OiByZW5hbWVkIHB2
bW1pb19jYXBzIHRvIHB2X2NhcHMuCnY1OiByZWJhc2UuCnY2OiByZWJhc2UuCgpTaWduZWQtb2Zm
LWJ5OiBYaWFvbGluIFpoYW5nIDx4aWFvbGluLnpoYW5nQGludGVsLmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vaTkxNS9ndnQvaGFuZGxlcnMuYyB8IDQgKysrKwogZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ3Z0L3ZncHUuYyAgICAgfCAzICsrKwogMiBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaGFuZGxlcnMuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9oYW5kbGVycy5jCmluZGV4IDc3MzJjYWEuLmZkMmY3MmMg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9oYW5kbGVycy5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9oYW5kbGVycy5jCkBAIC0xMTk0LDYgKzExOTQsNyBAQCBz
dGF0aWMgaW50IHB2aW5mb19tbWlvX3JlYWQoc3RydWN0IGludGVsX3ZncHUgKnZncHUsIHVuc2ln
bmVkIGludCBvZmZzZXQsCiAJCWJyZWFrOwogCWNhc2UgMHg3ODAxMDoJLyogdmd0X2NhcHMgKi8K
IAljYXNlIDB4Nzg4MWM6CisJY2FzZSBfdmd0aWZfcmVnKHB2X2NhcHMpOgogCQlicmVhazsKIAlk
ZWZhdWx0OgogCQlpbnZhbGlkX3JlYWQgPSB0cnVlOwpAQCAtMTI2Nyw2ICsxMjY4LDkgQEAgc3Rh
dGljIGludCBwdmluZm9fbW1pb193cml0ZShzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSwgdW5zaWdu
ZWQgaW50IG9mZnNldCwKIAljYXNlIF92Z3RpZl9yZWcoZzJ2X25vdGlmeSk6CiAJCXJldCA9IGhh
bmRsZV9nMnZfbm90aWZpY2F0aW9uKHZncHUsIGRhdGEpOwogCQlicmVhazsKKwljYXNlIF92Z3Rp
Zl9yZWcocHZfY2Fwcyk6CisJCURSTV9JTkZPKCJ2Z3B1IGlkPSVkIHB2IGNhcHMgPTB4JXhcbiIs
IHZncHUtPmlkLCBkYXRhKTsKKwkJYnJlYWs7CiAJLyogYWRkIHhob3QgYW5kIHlob3QgdG8gaGFu
ZGxlZCBsaXN0IHRvIGF2b2lkIGVycm9yIGxvZyAqLwogCWNhc2UgX3ZndGlmX3JlZyhjdXJzb3Jf
eF9ob3QpOgogCWNhc2UgX3ZndGlmX3JlZyhjdXJzb3JfeV9ob3QpOgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3ZncHUuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC92
Z3B1LmMKaW5kZXggNDRjZTNjMi4uM2VjYzQ1YSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ3Z0L3ZncHUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvdmdwdS5jCkBA
IC00Nyw2ICs0Nyw3IEBAIHZvaWQgcG9wdWxhdGVfcHZpbmZvX3BhZ2Uoc3RydWN0IGludGVsX3Zn
cHUgKnZncHUpCiAJdmdwdV92cmVnX3QodmdwdSwgdmd0aWZfcmVnKHZndF9jYXBzKSkgPSBWR1Rf
Q0FQU19GVUxMX1BQR1RUOwogCXZncHVfdnJlZ190KHZncHUsIHZndGlmX3JlZyh2Z3RfY2Fwcykp
IHw9IFZHVF9DQVBTX0hXU1BfRU1VTEFUSU9OOwogCXZncHVfdnJlZ190KHZncHUsIHZndGlmX3Jl
Zyh2Z3RfY2FwcykpIHw9IFZHVF9DQVBTX0hVR0VfR1RUOworCXZncHVfdnJlZ190KHZncHUsIHZn
dGlmX3JlZyh2Z3RfY2FwcykpIHw9IFZHVF9DQVBTX1BWOwogCiAJdmdwdV92cmVnX3QodmdwdSwg
dmd0aWZfcmVnKGF2YWlsX3JzLm1hcHBhYmxlX2dtYWRyLmJhc2UpKSA9CiAJCXZncHVfYXBlcnR1
cmVfZ21hZHJfYmFzZSh2Z3B1KTsKQEAgLTUzMSw2ICs1MzIsNyBAQCB2b2lkIGludGVsX2d2dF9y
ZXNldF92Z3B1X2xvY2tlZChzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSwgYm9vbCBkbWxyLAogCXN0
cnVjdCBpbnRlbF9ndnQgKmd2dCA9IHZncHUtPmd2dDsKIAlzdHJ1Y3QgaW50ZWxfZ3Z0X3dvcmts
b2FkX3NjaGVkdWxlciAqc2NoZWR1bGVyID0gJmd2dC0+c2NoZWR1bGVyOwogCWludGVsX2VuZ2lu
ZV9tYXNrX3QgcmVzZXR0aW5nX2VuZyA9IGRtbHIgPyBBTExfRU5HSU5FUyA6IGVuZ2luZV9tYXNr
OworCWludCBwdl9jYXBzID0gdmdwdV92cmVnX3QodmdwdSwgdmd0aWZfcmVnKHB2X2NhcHMpKTsK
IAogCWd2dF9kYmdfY29yZSgiLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tXG4iKTsKIAlndnRfZGJnX2NvcmUoInJlc3NldGluZyB2Z3B1JWQsIGRtbHIgJWQsIGVuZ2lu
ZV9tYXNrICUwOHhcbiIsCkBAIC01NjIsNiArNTY0LDcgQEAgdm9pZCBpbnRlbF9ndnRfcmVzZXRf
dmdwdV9sb2NrZWQoc3RydWN0IGludGVsX3ZncHUgKnZncHUsIGJvb2wgZG1sciwKIAogCQlpbnRl
bF92Z3B1X3Jlc2V0X21taW8odmdwdSwgZG1scik7CiAJCXBvcHVsYXRlX3B2aW5mb19wYWdlKHZn
cHUpOworCQl2Z3B1X3ZyZWdfdCh2Z3B1LCB2Z3RpZl9yZWcocHZfY2FwcykpID0gcHZfY2FwczsK
IAkJaW50ZWxfdmdwdV9yZXNldF9kaXNwbGF5KHZncHUpOwogCiAJCWlmIChkbWxyKSB7Ci0tIAoy
LjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50
ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1n
dnQtZGV2
