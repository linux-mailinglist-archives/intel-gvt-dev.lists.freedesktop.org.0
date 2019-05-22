Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDD027220
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 23 May 2019 00:16:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6698A89C86;
	Wed, 22 May 2019 22:16:43 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E38489C18
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 22 May 2019 22:16:42 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 May 2019 15:16:42 -0700
X-ExtLoop1: 1
Received: from gvt.bj.intel.com ([10.238.158.187])
 by fmsmga007.fm.intel.com with ESMTP; 22 May 2019 15:16:41 -0700
From: Tina Zhang <tina.zhang@intel.com>
To: zhenyuw@linux.intel.com
Subject: [PATCH v2] drm/i915/gvt: Add set_ggtt_entry tracing event
Date: Thu, 23 May 2019 06:11:14 +0800
Message-Id: <20190522221114.3548-1-tina.zhang@intel.com>
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
Cc: intel-gvt-dev@lists.freedesktop.org, Tina Zhang <tina.zhang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

QWRkIHNldF9nZ3R0X2VudHJ5IHRyYWNpbmcgZXZlbnQuCgp2MjoKLSBBZGQgaW5kZXggZmllbGQu
IChaaGVueXUpCgpTaWduZWQtb2ZmLWJ5OiBUaW5hIFpoYW5nIDx0aW5hLnpoYW5nQGludGVsLmNv
bT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmMgICB8ICAxICsKIGRyaXZlcnMv
Z3B1L2RybS9pOTE1L2d2dC90cmFjZS5oIHwgMjIgKysrKysrKysrKysrKysrKysrKysrKwogMiBm
aWxlcyBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZ3Z0L2d0dC5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5jCmluZGV4
IGMyZjdkMjBmNjM0Ni4uMTUyMTZjNWI0MGFhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9ndnQvZ3R0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5jCkBAIC02
MjksNiArNjI5LDcgQEAgc3RhdGljIHZvaWQgZ2d0dF9zZXRfaG9zdF9lbnRyeShzdHJ1Y3QgaW50
ZWxfdmdwdV9tbSAqbW0sCiAJc3RydWN0IGludGVsX2d2dF9ndHRfcHRlX29wcyAqcHRlX29wcyA9
IG1tLT52Z3B1LT5ndnQtPmd0dC5wdGVfb3BzOwogCiAJR0VNX0JVR19PTihtbS0+dHlwZSAhPSBJ
TlRFTF9HVlRfTU1fR0dUVCk7CisJdHJhY2Vfc2V0X2dndHRfZW50cnkobW0tPnZncHUtPmlkLCBl
bnRyeS0+dmFsNjQsIGluZGV4KTsKIAogCXB0ZV9vcHMtPnNldF9lbnRyeShOVUxMLCBlbnRyeSwg
aW5kZXgsIGZhbHNlLCAwLCBtbS0+dmdwdSk7CiB9CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9ndnQvdHJhY2UuaCBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC90cmFjZS5oCmlu
ZGV4IDZkNzg3NzUwZDI3OS4uOTgxY2MzNmViNTBmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9ndnQvdHJhY2UuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvdHJhY2Uu
aApAQCAtMzczLDYgKzM3MywyOCBAQCBUUkFDRV9FVkVOVChyZW5kZXJfbW1pbywKIAkJICBfX2Vu
dHJ5LT5vbGRfdmFsLCBfX2VudHJ5LT5uZXdfdmFsKQogKTsKIAorVFJBQ0VfRVZFTlQoc2V0X2dn
dHRfZW50cnksCisJVFBfUFJPVE8oaW50IGlkLCB1bnNpZ25lZCBsb25nIGFkZHJlc3MsCisJCSAg
ICB1bnNpZ25lZCBsb25nIGluZGV4KSwKKworCVRQX0FSR1MoaWQsIGFkZHJlc3MsIGluZGV4KSwK
KworCVRQX1NUUlVDVF9fZW50cnkoCisJCV9fZmllbGQoaW50LCBpZCkKKwkJX19maWVsZCh1bnNp
Z25lZCBsb25nLCBhZGRyZXNzKQorCQlfX2ZpZWxkKHVuc2lnbmVkIGxvbmcsIGluZGV4KQorCSks
CisKKwlUUF9mYXN0X2Fzc2lnbigKKwkJX19lbnRyeS0+aWQgPSBpZDsKKwkJX19lbnRyeS0+YWRk
cmVzcyA9IGFkZHJlc3M7CisJCV9fZW50cnktPmluZGV4ID0gaW5kZXg7CisJKSwKKworCVRQX3By
aW50aygidmdwdSVkOnNldCBnZ3R0IGVudHJ5IDB4JWx4LCBpbmRleCAweCVseFxuIiwKKwkJICBf
X2VudHJ5LT5pZCwgX19lbnRyeS0+YWRkcmVzcywgX19lbnRyeS0+aW5kZXgpCispOworCiAjZW5k
aWYgLyogX0dWVF9UUkFDRV9IXyAqLwogCiAvKiBUaGlzIHBhcnQgbXVzdCBiZSBvdXQgb2YgcHJv
dGVjdGlvbiAqLwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
