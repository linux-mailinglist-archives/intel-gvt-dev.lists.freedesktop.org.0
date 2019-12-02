Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9F610E637
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  2 Dec 2019 08:01:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A41089F63;
	Mon,  2 Dec 2019 07:01:23 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB7BA89F63
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  2 Dec 2019 07:01:21 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Dec 2019 23:01:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,268,1571727600"; d="scan'208";a="208029728"
Received: from debian-nuc.sh.intel.com ([10.239.160.63])
 by fmsmga007.fm.intel.com with ESMTP; 01 Dec 2019 23:01:18 -0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH 1/3] drm/i915/gvt: remove unused type attributes
Date: Mon,  2 Dec 2019 15:01:07 +0800
Message-Id: <20191202070109.73924-1-zhenyuw@linux.intel.com>
X-Mailer: git-send-email 2.24.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T25seSBuZWVkIHRvIGdldCBhdHRyaWJ1dGUgZ3JvdXAgaW5zdGVhZCBvZiBhdHRyaWJ1dGVzIGFu
ZCBpdCBoYXMKbm8gdXNlLCBzbyByZW1vdmUgaXQuCgpTaWduZWQtb2ZmLWJ5OiBaaGVueXUgV2Fu
ZyA8emhlbnl1d0BsaW51eC5pbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0
L2d2dC5jICAgfCA0ICstLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndnQuaCAgIHwgMyAr
LS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9rdm1ndC5jIHwgNCArLS0tCiAzIGZpbGVzIGNo
YW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3Z0LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3Z0
LmMKaW5kZXggOGYzN2VlZmEwYTAyLi5jYjVmYTMwYjhlNjMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2d2dC9ndnQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3Z0
LmMKQEAgLTEyMCwxMCArMTIwLDggQEAgc3RhdGljIHN0cnVjdCBhdHRyaWJ1dGVfZ3JvdXAgKmd2
dF92Z3B1X3R5cGVfZ3JvdXBzW10gPSB7CiAJWzAgLi4uIE5SX01BWF9JTlRFTF9WR1BVX1RZUEVT
IC0gMV0gPSBOVUxMLAogfTsKIAotc3RhdGljIGJvb2wgaW50ZWxfZ2V0X2d2dF9hdHRycyhzdHJ1
Y3QgYXR0cmlidXRlICoqKnR5cGVfYXR0cnMsCi0JCXN0cnVjdCBhdHRyaWJ1dGVfZ3JvdXAgKioq
aW50ZWxfdmdwdV90eXBlX2dyb3VwcykKK3N0YXRpYyBib29sIGludGVsX2dldF9ndnRfYXR0cnMo
c3RydWN0IGF0dHJpYnV0ZV9ncm91cCAqKippbnRlbF92Z3B1X3R5cGVfZ3JvdXBzKQogewotCSp0
eXBlX2F0dHJzID0gZ3Z0X3R5cGVfYXR0cnM7CiAJKmludGVsX3ZncHVfdHlwZV9ncm91cHMgPSBn
dnRfdmdwdV90eXBlX2dyb3VwczsKIAlyZXR1cm4gdHJ1ZTsKIH0KZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2d2dC9ndnQuaCBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndnQu
aAppbmRleCBiNDdjNmFjYWY5YzAuLjAwODFiMDUxZDNlMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZ3Z0L2d2dC5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndnQu
aApAQCAtNTcwLDggKzU3MCw3IEBAIHN0cnVjdCBpbnRlbF9ndnRfb3BzIHsKIAl2b2lkICgqdmdw
dV9kZWFjdGl2YXRlKShzdHJ1Y3QgaW50ZWxfdmdwdSAqKTsKIAlzdHJ1Y3QgaW50ZWxfdmdwdV90
eXBlICooKmd2dF9maW5kX3ZncHVfdHlwZSkoc3RydWN0IGludGVsX2d2dCAqZ3Z0LAogCQkJY29u
c3QgY2hhciAqbmFtZSk7Ci0JYm9vbCAoKmdldF9ndnRfYXR0cnMpKHN0cnVjdCBhdHRyaWJ1dGUg
KioqdHlwZV9hdHRycywKLQkJCXN0cnVjdCBhdHRyaWJ1dGVfZ3JvdXAgKioqaW50ZWxfdmdwdV90
eXBlX2dyb3Vwcyk7CisJYm9vbCAoKmdldF9ndnRfYXR0cnMpKHN0cnVjdCBhdHRyaWJ1dGVfZ3Jv
dXAgKioqaW50ZWxfdmdwdV90eXBlX2dyb3Vwcyk7CiAJaW50ICgqdmdwdV9xdWVyeV9wbGFuZSko
c3RydWN0IGludGVsX3ZncHUgKnZncHUsIHZvaWQgKik7CiAJaW50ICgqdmdwdV9nZXRfZG1hYnVm
KShzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSwgdW5zaWduZWQgaW50KTsKIAlpbnQgKCp3cml0ZV9w
cm90ZWN0X2hhbmRsZXIpKHN0cnVjdCBpbnRlbF92Z3B1ICosIHU2NCwgdm9pZCAqLApkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2t2bWd0LmMgYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9ndnQva3ZtZ3QuYwppbmRleCAwNGE1YTBkOTA4MjMuLmE2OTllY2FkZTNmYyAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2t2bWd0LmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZ3Z0L2t2bWd0LmMKQEAgLTE1OTcsMTIgKzE1OTcsMTAgQEAgc3RhdGljIHN0cnVj
dCBtZGV2X3BhcmVudF9vcHMgaW50ZWxfdmdwdV9vcHMgPSB7CiAKIHN0YXRpYyBpbnQga3ZtZ3Rf
aG9zdF9pbml0KHN0cnVjdCBkZXZpY2UgKmRldiwgdm9pZCAqZ3Z0LCBjb25zdCB2b2lkICpvcHMp
CiB7Ci0Jc3RydWN0IGF0dHJpYnV0ZSAqKmt2bV90eXBlX2F0dHJzOwogCXN0cnVjdCBhdHRyaWJ1
dGVfZ3JvdXAgKiprdm1fdmdwdV90eXBlX2dyb3VwczsKIAogCWludGVsX2d2dF9vcHMgPSBvcHM7
Ci0JaWYgKCFpbnRlbF9ndnRfb3BzLT5nZXRfZ3Z0X2F0dHJzKCZrdm1fdHlwZV9hdHRycywKLQkJ
CSZrdm1fdmdwdV90eXBlX2dyb3VwcykpCisJaWYgKCFpbnRlbF9ndnRfb3BzLT5nZXRfZ3Z0X2F0
dHJzKCZrdm1fdmdwdV90eXBlX2dyb3VwcykpCiAJCXJldHVybiAtRUZBVUxUOwogCWludGVsX3Zn
cHVfb3BzLnN1cHBvcnRlZF90eXBlX2dyb3VwcyA9IGt2bV92Z3B1X3R5cGVfZ3JvdXBzOwogCi0t
IAoyLjI0LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50
ZWwtZ3Z0LWRldg==
