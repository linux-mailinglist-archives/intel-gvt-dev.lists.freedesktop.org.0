Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F084625D57
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 22 May 2019 07:08:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9687F89733;
	Wed, 22 May 2019 05:08:10 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAFCA89733
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 22 May 2019 05:08:08 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 May 2019 22:08:08 -0700
X-ExtLoop1: 1
Received: from xzhan34-mobl3.bj.intel.com ([10.238.154.54])
 by orsmga003.jf.intel.com with ESMTP; 21 May 2019 22:08:08 -0700
From: Xiaolin Zhang <xiaolin.zhang@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH V2] drm/i915/gvt: save RING_HEAD into vreg when vgpu switched
 out
Date: Wed, 22 May 2019 13:08:00 +0800
Message-Id: <1558501680-15920-1-git-send-email-xiaolin.zhang@intel.com>
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
Cc: Xiaolin Zhang <xiaolin.zhang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

dG8gc2F2ZSBSSU5HX0hFQUQgaW50byB2Z3B1IHJlZyB3aGVuIHZncHUgc3dpdGNoZWQgb3V0IGFu
ZCByZXBvcnQKaXQncyB2YWx1ZSBiYWNrIHRvIGd1ZXN0LgoKdjI6IHNhdmUgUklOR19UQUlMIGFz
IHdlbGwgZHVyaW5nIHZncHUgbW1pbyBzd2l0Y2ggdG8gbWVldCByaW5nX2lzX2lkbGUKY29uZGl0
aW9uLiAoRnJlZCBHYW8pCnYxOiBiYXNlZCBvbiBpbnB1dCBmcm9tIFdlaW5hbi4gKFdlaW5hbiBM
aSkKCkZpeGVzOiA1MTlhMDE5NDkxYjggKCJkcm0vaTkxNS9oYW5nY2hlY2s6IFJlcGxhY2UgaGFu
Z2NoZWNrLnNlcW5vIHdpdGggUklOR19IRUFEIikKClNpZ25lZC1vZmYtYnk6IFhpYW9saW4gWmhh
bmcgPHhpYW9saW4uemhhbmdAaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2
dC9tbWlvX2NvbnRleHQuYyB8IDkgKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L21taW9fY29udGV4
dC5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L21taW9fY29udGV4dC5jCmluZGV4IDk2ZTFl
ZGYuLjc1OGE4YjMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9tbWlvX2Nv
bnRleHQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvbW1pb19jb250ZXh0LmMKQEAg
LTQ1Nyw2ICs0NTcsNyBAQCBzdGF0aWMgdm9pZCBzd2l0Y2hfbW1pbyhzdHJ1Y3QgaW50ZWxfdmdw
dSAqcHJlLAogCXN0cnVjdCBpbnRlbF92Z3B1X3N1Ym1pc3Npb24gKnM7CiAJc3RydWN0IGVuZ2lu
ZV9tbWlvICptbWlvOwogCXUzMiBvbGRfdiwgbmV3X3Y7CisJdTMyIHJpbmdfYmFzZTsKIAogCWRl
dl9wcml2ID0gcHJlID8gcHJlLT5ndnQtPmRldl9wcml2IDogbmV4dC0+Z3Z0LT5kZXZfcHJpdjsK
IAlpZiAoSU5URUxfR0VOKGRldl9wcml2KSA+PSA5KQpAQCAtNTE5LDYgKzUyMCwxNCBAQCBzdGF0
aWMgdm9pZCBzd2l0Y2hfbW1pbyhzdHJ1Y3QgaW50ZWxfdmdwdSAqcHJlLAogCQkJCSAgb2xkX3Ys
IG5ld192KTsKIAl9CiAKKwlpZiAocHJlKSB7CisJCXJpbmdfYmFzZSA9IGRldl9wcml2LT5lbmdp
bmVbcmluZ19pZF0tPm1taW9fYmFzZTsKKwkJdmdwdV92cmVnX3QocHJlLCBSSU5HX0hFQUQocmlu
Z19iYXNlKSkgPQorCQkJCUk5MTVfUkVBRF9GVyhSSU5HX0hFQUQocmluZ19iYXNlKSk7CisJCXZn
cHVfdnJlZ190KHByZSwgUklOR19UQUlMKHJpbmdfYmFzZSkpID0KKwkJCQlJOTE1X1JFQURfRlco
UklOR19UQUlMKHJpbmdfYmFzZSkpOworCX0KKwogCWlmIChuZXh0KQogCQloYW5kbGVfdGxiX3Bl
bmRpbmdfZXZlbnQobmV4dCwgcmluZ19pZCk7CiB9Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxp
c3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
