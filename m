Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC5F2AE40
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 27 May 2019 07:42:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8249589745;
	Mon, 27 May 2019 05:42:19 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C52289745
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 27 May 2019 05:42:18 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 May 2019 22:42:18 -0700
X-ExtLoop1: 1
Received: from test-optiplex-7040.bj.intel.com ([10.238.154.166])
 by orsmga004.jf.intel.com with ESMTP; 26 May 2019 22:42:17 -0700
From: Xiong Zhang <xiong.y.zhang@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH 2/4] drm/i915/gvt: Warning for invalid ggtt access
Date: Mon, 27 May 2019 13:45:51 +0800
Message-Id: <1558935953-3944-2-git-send-email-xiong.y.zhang@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558935953-3944-1-git-send-email-xiong.y.zhang@intel.com>
References: <1558935953-3944-1-git-send-email-xiong.y.zhang@intel.com>
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

SW5zdGVhZCBvZiBzaWxlbnRseSByZXR1cm4gdmlydHVhbCBnZ3R0IGVudHJpZXMgdGhhdCBndWVz
dCBpcyBhbGxvd2VkCnRvIGFjY2VzcywgdGhpcyBwYXRjaCBhZGQgZXh0cmEgcmFuZ2UgY2hlY2su
IElmIGd1ZXN0IHJlYWQgb3V0IG9mCnJhbmdlLCBpdCB3aWxsIHByaW50IGEgd2FybmluZyBhbmQg
cmV0dXJuIDAuIElmIGd1ZXN0IHdyaXRlIG91dApvZiByYW5nZSwgdGhlIHdyaXRlIHdpbGwgYmUg
ZHJvcHBlZCB3aXRob3V0IGFueSBtZXNzYWdlLgoKU2lnbmVkLW9mZi1ieTogWGlvbmcgWmhhbmcg
PHhpb25nLnkuemhhbmdAaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9n
dHQuYyB8IDkgKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5jIGIvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ3Z0L2d0dC5jCmluZGV4IGQ3NjdjNDUuLjY4MDYyZWUgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQv
Z3R0LmMKQEAgLTIxMzEsMTEgKzIxMzEsMjAgQEAgc3RhdGljIGludCBlbXVsYXRlX2dndHRfbW1p
b19yZWFkKHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1LAogCXN0cnVjdCBpbnRlbF92Z3B1X21tICpn
Z3R0X21tID0gdmdwdS0+Z3R0LmdndHRfbW07CiAJY29uc3Qgc3RydWN0IGludGVsX2d2dF9kZXZp
Y2VfaW5mbyAqaW5mbyA9ICZ2Z3B1LT5ndnQtPmRldmljZV9pbmZvOwogCXVuc2lnbmVkIGxvbmcg
aW5kZXggPSBvZmYgPj4gaW5mby0+Z3R0X2VudHJ5X3NpemVfc2hpZnQ7CisJdW5zaWduZWQgbG9u
ZyBnbWE7CiAJc3RydWN0IGludGVsX2d2dF9ndHRfZW50cnkgZTsKIAogCWlmIChieXRlcyAhPSA0
ICYmIGJ5dGVzICE9IDgpCiAJCXJldHVybiAtRUlOVkFMOwogCisJZ21hID0gaW5kZXggPDwgSTkx
NV9HVFRfUEFHRV9TSElGVDsKKwlpZiAoIWludGVsX2d2dF9nZ3R0X3ZhbGlkYXRlX3JhbmdlKHZn
cHUsCisJCQkJCSAgIGdtYSwgMSA8PCBJOTE1X0dUVF9QQUdFX1NISUZUKSkgeworCQlndnRfZGJn
X21tKCJyZWFkIGludmFsaWQgZ2d0dCBhdCAweCVseFxuIiwgZ21hKTsKKwkJbWVtc2V0KHBfZGF0
YSwgMCwgYnl0ZXMpOworCQlyZXR1cm4gMDsKKwl9CisKIAlnZ3R0X2dldF9ndWVzdF9lbnRyeShn
Z3R0X21tLCAmZSwgaW5kZXgpOwogCW1lbWNweShwX2RhdGEsICh2b2lkICopJmUudmFsNjQgKyAo
b2ZmICYgKGluZm8tPmd0dF9lbnRyeV9zaXplIC0gMSkpLAogCQkJYnl0ZXMpOwotLSAKMi43LjQK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2
dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRl
dg==
