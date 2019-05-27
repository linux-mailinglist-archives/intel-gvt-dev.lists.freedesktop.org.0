Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D7B2AE3F
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 27 May 2019 07:41:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B661689745;
	Mon, 27 May 2019 05:41:58 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3046889745
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 27 May 2019 05:41:58 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 May 2019 22:41:57 -0700
X-ExtLoop1: 1
Received: from test-optiplex-7040.bj.intel.com ([10.238.154.166])
 by orsmga004.jf.intel.com with ESMTP; 26 May 2019 22:41:56 -0700
From: Xiong Zhang <xiong.y.zhang@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH 1/4] drm/i915/gvt: refine ggtt range validation
Date: Mon, 27 May 2019 13:45:50 +0800
Message-Id: <1558935953-3944-1-git-send-email-xiong.y.zhang@intel.com>
X-Mailer: git-send-email 2.7.4
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
Cc: Xiong Zhang <xiong.y.zhang@intel.com>, zhenyuw@linux.intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

VGhlIHZncHUgZ2d0dCByYW5nZSBzaG91bGQgYmUgaW4gdmdwdSBhcGVydHVyZSBvciBoaWRkZW4g
cmFuZ2UuIFRoaXMKcGF0Y2ggZW5mb3JjZSBiZWdpbiBhbmQgZW5kIGFkZHJlc3MgY2hlY2sgYW5k
IGd1YXJhbnRlZSBib3RoIG9mIHRoZW0gYXJlCmluIHRoZSB2YWxpZCByYW5nZS4KCkZvciBzaXpl
PTAsIGl0IHdpbGwgcmVncmVzcyB0byB2Z3B1X2dtYWRyX2lzX3ZhbGlkKCksIHdpbGwgcmVmaW5l
CnRoaXMgdXNhZ2UgaW4gYSBsYXRlciBmaXguCgpGaXhlczogMjcwN2U0NDQ2Njg4ICgiZHJtL2k5
MTUvZ3Z0OiB2R1BVIGdyYXBoaWNzIG1lbW9yeSB2aXJ0dWFsaXphdGlvbiIpClNpZ25lZC1vZmYt
Ynk6IFhpb25nIFpoYW5nIDx4aW9uZy55LnpoYW5nQGludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vaTkxNS9ndnQvZ3R0LmMgfCAyMCArKysrKysrKysrKysrLS0tLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0
dC5jCmluZGV4IGYzYTc1YmIuLmQ3NjdjNDUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2d2dC9ndHQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmMKQEAgLTUz
LDEzICs1MywxOSBAQCBzdGF0aWMgaW50IHByZWFsbG9jYXRlZF9vb3NfcGFnZXMgPSA4MTkyOwog
ICovCiBib29sIGludGVsX2d2dF9nZ3R0X3ZhbGlkYXRlX3JhbmdlKHN0cnVjdCBpbnRlbF92Z3B1
ICp2Z3B1LCB1NjQgYWRkciwgdTMyIHNpemUpCiB7Ci0JaWYgKCghdmdwdV9nbWFkcl9pc192YWxp
ZCh2Z3B1LCBhZGRyKSkgfHwgKHNpemUKLQkJCSYmICF2Z3B1X2dtYWRyX2lzX3ZhbGlkKHZncHUs
IGFkZHIgKyBzaXplIC0gMSkpKSB7Ci0JCWd2dF92Z3B1X2VycigiaW52YWxpZCByYW5nZSBnbWFk
ciAweCVsbHggc2l6ZSAweCV4XG4iLAotCQkJCWFkZHIsIHNpemUpOwotCQlyZXR1cm4gZmFsc2U7
Ci0JfQotCXJldHVybiB0cnVlOworCWlmIChzaXplID09IDApCisJCXJldHVybiB2Z3B1X2dtYWRy
X2lzX3ZhbGlkKHZncHUsIGFkZHIpOworCisJaWYgKHZncHVfZ21hZHJfaXNfYXBlcnR1cmUodmdw
dSwgYWRkcikgJiYKKwkgICAgdmdwdV9nbWFkcl9pc19hcGVydHVyZSh2Z3B1LCBhZGRyICsgc2l6
ZSAtIDEpKQorCQlyZXR1cm4gdHJ1ZTsKKwllbHNlIGlmICh2Z3B1X2dtYWRyX2lzX2hpZGRlbih2
Z3B1LCBhZGRyKSAmJgorCQkgdmdwdV9nbWFkcl9pc19oaWRkZW4odmdwdSwgYWRkciArIHNpemUg
LSAxKSkKKwkJcmV0dXJuIHRydWU7CisKKwlndnRfZGJnX21tKCJJbnZhbGlkIGdndHQgcmFuZ2Ug
YXQgMHglbGx4LCBzaXplOiAweCV4XG4iLAorCQkgICAgIGFkZHIsIHNpemUpOworCXJldHVybiBm
YWxzZTsKIH0KIAogLyogdHJhbnNsYXRlIGEgZ3Vlc3QgZ21hZHIgdG8gaG9zdCBnbWFkciAqLwot
LSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50
ZWwtZ3Z0LWRldg==
