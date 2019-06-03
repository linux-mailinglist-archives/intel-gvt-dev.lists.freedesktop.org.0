Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6F5328C1
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  3 Jun 2019 08:47:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A94F0892D2;
	Mon,  3 Jun 2019 06:47:48 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64DA4892D2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  3 Jun 2019 06:47:48 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Jun 2019 23:47:47 -0700
X-ExtLoop1: 1
Received: from coxu-arch-shz.sh.intel.com ([10.239.160.22])
 by fmsmga004.fm.intel.com with ESMTP; 02 Jun 2019 23:47:46 -0700
From: Colin Xu <colin.xu@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH] drm/i915/gvt: Set up-limit of BB size to 2GB.
Date: Mon,  3 Jun 2019 14:47:44 +0800
Message-Id: <20190603064744.7298-1-colin.xu@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
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
Cc: colin.xu@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

U2V0IGRlZmF1bHQgbWF4aW11bSBiYXRjaCBidWZmZXIgc2l6ZSB0byAyR0IgdG8gcHJldmVudCBv
dmVyZmxvdy4KClNpZ25lZC1vZmYtYnk6IENvbGluIFh1IDxjb2xpbi54dUBpbnRlbC5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2NtZF9wYXJzZXIuYyB8IDYgKysrKysrCiBkcml2
ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3Z0LmggICAgICAgIHwgMiArKwogMiBmaWxlcyBjaGFuZ2Vk
LCA4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQv
Y21kX3BhcnNlci5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2NtZF9wYXJzZXIuYwppbmRl
eCA3YzdiNzExOTQyY2QuLjAyY2VkYjM0Yjg1OSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ3Z0L2NtZF9wYXJzZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvY21k
X3BhcnNlci5jCkBAIC0xNzEwLDYgKzE3MTAsMTIgQEAgc3RhdGljIGludCBmaW5kX2JiX3NpemUo
c3RydWN0IHBhcnNlcl9leGVjX3N0YXRlICpzLCB1bnNpZ25lZCBsb25nICpiYl9zaXplKQogCQl9
CiAJCWNtZF9sZW4gPSBnZXRfY21kX2xlbmd0aChpbmZvLCBjbWQpIDw8IDI7CiAJCSpiYl9zaXpl
ICs9IGNtZF9sZW47CisJCWlmICgqYmJfc2l6ZSA+IElOVEVMX0dWVF9NQVhfQkJfTEVOR1RIX0RF
RkFVTFQpIHsKKwkJCWd2dF92Z3B1X2VycigiQkIgbGVuIGV4Y2VlZHMgbWF4IGxpbWl0IDB4JWxs
eFxuIiwKKwkJCQkgICAgIElOVEVMX0dWVF9NQVhfQkJfTEVOR1RIX0RFRkFVTFQpOworCQkJKmJi
X3NpemUgPSAwOworCQkJcmV0dXJuIC1FT1ZFUkZMT1c7CisJCX0KIAkJZ21hICs9IGNtZF9sZW47
CiAJfSB3aGlsZSAoIWJiX2VuZCk7CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2d2dC9ndnQuaCBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndnQuaAppbmRleCBiNTRmMmJk
YzEzYTQuLmE1ZTNlYzk3OTkzYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0
L2d2dC5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndnQuaApAQCAtMjMxLDYgKzIz
MSw4IEBAIHN0cnVjdCBpbnRlbF92Z3B1IHsKIAl1MzIgc2Nhbl9ub25wcml2YmI7CiB9OwogCisj
ZGVmaW5lIElOVEVMX0dWVF9NQVhfQkJfTEVOR1RIX0RFRkFVTFQJMHg4MDAwMDAwMAorCiAvKiB2
YWxpZGF0aW5nIEdNIGhlYWx0aHkgc3RhdHVzKi8KICNkZWZpbmUgdmdwdV9pc192bV91bmhlYWx0
aHkocmV0X3ZhbCkgXAogCSgoKHJldF92YWwpID09IC1FQkFEUlFDKSB8fCAoKHJldF92YWwpID09
IC1FRkFVTFQpKQotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
