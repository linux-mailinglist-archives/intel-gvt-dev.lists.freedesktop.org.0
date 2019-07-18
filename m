Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4DF6CA6B
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 18 Jul 2019 09:57:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87C4F6E33A;
	Thu, 18 Jul 2019 07:57:54 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B36846E33A
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 18 Jul 2019 07:57:53 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Jul 2019 00:57:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,276,1559545200"; d="scan'208";a="158713118"
Received: from gvt-optiplex-7060.bj.intel.com ([10.238.158.89])
 by orsmga007.jf.intel.com with ESMTP; 18 Jul 2019 00:57:51 -0700
From: Kechen Lu <kechen.lu@intel.com>
To: intel-gvt-dev@lists.freedesktop.org, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [RFC PATCH v4 5/6] drm/i915/gvt: Deliver async primary plane page
 flip events at vblank
Date: Thu, 18 Jul 2019 23:56:39 +0800
Message-Id: <20190718155640.25928-6-kechen.lu@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190718155640.25928-1-kechen.lu@intel.com>
References: <20190718155640.25928-1-kechen.lu@intel.com>
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
Cc: kevin.tian@intel.com, zhenyuw@linux.intel.com, hang.yuan@intel.com,
 alex.williamson@redhat.com, kraxel@redhat.com, Kechen Lu <kechen.lu@intel.com>,
 zhi.a.wang@intel.com, zhiyuan.lv@intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T25seSBzeW5jIHByaW1hcnkgcGxhbmUgcGFnZSBmbGlwIGV2ZW50cyBhcmUgY2hlY2tlZCBhbmQg
ZGVsaXZlcmVkCmFzIHRoZSBkaXNwbGF5IHJlZnJlc2ggZXZlbnRzIGJlZm9yZSwgdGhpcyBwYXRj
aCB0cmllcyB0byBkZWxpdmVyIGFzeW5jCnByaW1hcnkgcGFnZSBmbGlwIGV2ZW50cyBib3VuZGVk
IGJ5IHZibGFua3MuCgpUbyBkZWxpdmVyIGNvcnJlY3QgYXN5bmMgcGFnZSBmbGlwLCB0aGUgbmV3
IGFzeW5jIGZsaXAgYml0bWFwIGlzCmludHJvZHVjZWQgYW5kIGluIHZibGFuayBlbXVsYXRpb24g
aGFuZGxlciB0byBjaGVjayBiaXRzZXQuCgpTaWduZWQtb2ZmLWJ5OiBLZWNoZW4gTHUgPGtlY2hl
bi5sdUBpbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2NtZF9wYXJzZXIu
YyB8ICA1ICsrKy0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZGlzcGxheS5jICAgIHwgMTIg
KysrKysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3Z0LmggICAgICAgIHwgIDIg
KysKIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9oYW5kbGVycy5jICAgfCAgNSArKystLQogNCBm
aWxlcyBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9jbWRfcGFyc2VyLmMgYi9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9ndnQvY21kX3BhcnNlci5jCmluZGV4IDVjYjU5YzBiNGJiZS4uZTUwNGNjN2JlNTU5
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvY21kX3BhcnNlci5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9jbWRfcGFyc2VyLmMKQEAgLTEzMzQsOSArMTMzNCwx
MCBAQCBzdGF0aWMgaW50IGdlbjhfdXBkYXRlX3BsYW5lX21taW9fZnJvbV9taV9kaXNwbGF5X2Zs
aXAoCiAJaWYgKGluZm8tPnBsYW5lID09IFBMQU5FX1BSSU1BUlkpCiAJCXZncHVfdnJlZ190KHZn
cHUsIFBJUEVfRkxJUENPVU5UX0c0WChpbmZvLT5waXBlKSkrKzsKIAotCWlmIChpbmZvLT5hc3lu
Y19mbGlwKQorCWlmIChpbmZvLT5hc3luY19mbGlwKSB7CiAJCWludGVsX3ZncHVfdHJpZ2dlcl92
aXJ0dWFsX2V2ZW50KHZncHUsIGluZm8tPmV2ZW50KTsKLQllbHNlCisJCXNldF9iaXQoaW5mby0+
cGxhbmUsIHZncHUtPmRpc3BsYXkuYXN5bmNfZmxpcF9ldmVudFtpbmZvLT5waXBlXSk7CisJfSBl
bHNlCiAJCXNldF9iaXQoaW5mby0+ZXZlbnQsIHZncHUtPmlycS5mbGlwX2RvbmVfZXZlbnRbaW5m
by0+cGlwZV0pOwogCiAJcmV0dXJuIDA7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9ndnQvZGlzcGxheS5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2Rpc3BsYXkuYwppbmRl
eCAwMzZkYjgxOTk5ODMuLmRmNTJlNGI0YzFiMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ3Z0L2Rpc3BsYXkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZGlzcGxh
eS5jCkBAIC00MjAsNiArNDIwLDE4IEBAIHN0YXRpYyB2b2lkIGVtdWxhdGVfdmJsYW5rX29uX3Bp
cGUoc3RydWN0IGludGVsX3ZncHUgKnZncHUsIGludCBwaXBlKQogCQlpbnRlbF92Z3B1X3RyaWdn
ZXJfdmlydHVhbF9ldmVudCh2Z3B1LCBldmVudCk7CiAJfQogCisJZm9yX2VhY2hfc2V0X2JpdChl
dmVudCwgdmdwdS0+ZGlzcGxheS5hc3luY19mbGlwX2V2ZW50W3BpcGVdLAorCQkJSTkxNV9NQVhf
UExBTkVTKSB7CisJCWNsZWFyX2JpdChldmVudCwgdmdwdS0+ZGlzcGxheS5hc3luY19mbGlwX2V2
ZW50W3BpcGVdKTsKKwkJaWYgKCFwaXBlX2lzX2VuYWJsZWQodmdwdSwgcGlwZSkpCisJCQljb250
aW51ZTsKKworCQlpZiAoZXZlbnQgPT0gUExBTkVfUFJJTUFSWSkgeworCQkJZXZlbnRmZF9zaWdu
YWxfdmFsICs9IERJU1BMQVlfUFJJX1JFRlJFU0hfRVZFTlRfSU5DOworCQkJcGFnZWZsaXBfY291
bnQgKz0gUEFHRUZMSVBfSU5DX0NPVU5UOworCQl9CisJfQorCiAJaWYgKC0tcGFnZWZsaXBfY291
bnQgPCAwKSB7CiAJCWV2ZW50ZmRfc2lnbmFsX3ZhbCArPSBESVNQTEFZX1BSSV9SRUZSRVNIX0VW
RU5UX0lOQzsKIAkJcGFnZWZsaXBfY291bnQgPSAwOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZ3Z0L2d2dC5oIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d2dC5oCmluZGV4
IGI2NTRiNmZhMDY2My4uOThhM2RjMzA5YWNiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9ndnQvZ3Z0LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d2dC5oCkBAIC0x
MjgsNiArMTI4LDggQEAgc3RydWN0IGludGVsX3ZncHVfZGlzcGxheSB7CiAJc3RydWN0IGludGVs
X3ZncHVfaTJjX2VkaWQgaTJjX2VkaWQ7CiAJc3RydWN0IGludGVsX3ZncHVfcG9ydCBwb3J0c1tJ
OTE1X01BWF9QT1JUU107CiAJc3RydWN0IGludGVsX3ZncHVfc2JpIHNiaTsKKwlERUNMQVJFX0JJ
VE1BUChhc3luY19mbGlwX2V2ZW50W0k5MTVfTUFYX1BJUEVTXSwKKwkJICAgICAgIEk5MTVfTUFY
X1BMQU5FUyk7CiB9OwogCiBzdHJ1Y3QgdmdwdV9zY2hlZF9jdGwgewpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRsZXJzLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9n
dnQvaGFuZGxlcnMuYwppbmRleCBlMDliZDZlMGNjNGQuLjZhZDI5YzRmMDhlNSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRsZXJzLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZ3Z0L2hhbmRsZXJzLmMKQEAgLTc1OCw5ICs3NTgsMTAgQEAgc3RhdGljIGludCBw
cmlfc3VyZl9tbWlvX3dyaXRlKHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1LCB1bnNpZ25lZCBpbnQg
b2Zmc2V0LAogCiAJdmdwdV92cmVnX3QodmdwdSwgUElQRV9GTElQQ09VTlRfRzRYKHBpcGUpKSsr
OwogCi0JaWYgKHZncHVfdnJlZ190KHZncHUsIERTUENOVFIocGlwZSkpICYgUExBTkVfQ1RMX0FT
WU5DX0ZMSVApCisJaWYgKHZncHVfdnJlZ190KHZncHUsIERTUENOVFIocGlwZSkpICYgUExBTkVf
Q1RMX0FTWU5DX0ZMSVApIHsKIAkJaW50ZWxfdmdwdV90cmlnZ2VyX3ZpcnR1YWxfZXZlbnQodmdw
dSwgZXZlbnQpOwotCWVsc2UKKwkJc2V0X2JpdChQTEFORV9QUklNQVJZLCB2Z3B1LT5kaXNwbGF5
LmFzeW5jX2ZsaXBfZXZlbnRbcGlwZV0pOworCX0gZWxzZQogCQlzZXRfYml0KGV2ZW50LCB2Z3B1
LT5pcnEuZmxpcF9kb25lX2V2ZW50W3BpcGVdKTsKIAogCXJldHVybiAwOwotLSAKMi4xNy4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQt
ZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
