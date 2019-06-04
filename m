Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5D634345
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  4 Jun 2019 11:35:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B797C8914D;
	Tue,  4 Jun 2019 09:35:44 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A82B48914D
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  4 Jun 2019 09:35:43 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Jun 2019 02:35:42 -0700
X-ExtLoop1: 1
Received: from aleksei-desktop.tm.intel.com ([10.237.55.101])
 by FMSMGA003.fm.intel.com with ESMTP; 04 Jun 2019 02:35:41 -0700
From: Aleksei Gimbitskii <aleksei.gimbitskii@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH] drm/i915/gvt: Check if "pipe" is valid value.
Date: Tue,  4 Jun 2019 12:32:50 +0300
Message-Id: <20190604093250.19086-1-aleksei.gimbitskii@intel.com>
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
Cc: Aleksei Gimbitskii <aleksei.gimbitskii@intel.com>,
 Zhi Wang <zhi.a.wang@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Colin Xu <colin.xu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

U3RhdGljIGNvZGUgYW5hbHl6ZXIgcmVwb3J0ZWQgdGhhdCBhcnJheSAiaXJxLT5ldmVudHMiIG1h
eSB1c2UgaW5kZXgKdmFsdWUgYmlnZ2VyIHRoYW4gaXRzIHNpemUuIElmICJwaXBlIiBpcyBlcXVh
bCB0byBJOTE1X01BWF9QSVBFUyB0aGlzCnByb2JsZW0gbWF5IGFyaXNlLiBUbyBlbnN1cmUgdGhh
dCAicGlwZSIgYXJlIHZhbGlkIGluc2VydCBhZGRpdGlvbmFsCmNoZWNrIGJlZm9yZSBwYXNzaW5n
ICJwaXBlIiB0byBTS0xfRkxJUF9FVkVOVCgpLgoKVGhpcyBwYXRjaCBmaXhlZCB0aGUgY3JpdGlh
bCBpc3N1ZXMgIzc2NSwjNzc3IHJlcG9ydGVkIGJ5IGtsb2N3b3JrLgoKU2lnbmVkLW9mZi1ieTog
QWxla3NlaSBHaW1iaXRza2lpIDxhbGVrc2VpLmdpbWJpdHNraWlAaW50ZWwuY29tPgpDYzogWmhl
bnl1IFdhbmcgPHpoZW55dXdAbGludXguaW50ZWwuY29tPgpDYzogWmhpIFdhbmcgPHpoaS5hLndh
bmdAaW50ZWwuY29tPgpDYzogQ29saW4gWHUgPGNvbGluLnh1QGludGVsLmNvbT4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaGFuZGxlcnMuYyB8IDIxICsrKysrKysrKysrKysrKysrKyst
LQogMSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRsZXJzLmMgYi9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9ndnQvaGFuZGxlcnMuYwppbmRleCA3NzMyY2FhMWE1NDYuLjVhNjUyY2E3MzJj
MiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRsZXJzLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRsZXJzLmMKQEAgLTc0OCwxMiArNzQ4LDIyIEBA
IHN0YXRpYyBpbnQgc291dGhfY2hpY2tlbjJfbW1pb193cml0ZShzdHJ1Y3QgaW50ZWxfdmdwdSAq
dmdwdSwKICNkZWZpbmUgRFNQU1VSRl9UT19QSVBFKG9mZnNldCkgXAogCWNhbGNfaW5kZXgob2Zm
c2V0LCBfRFNQQVNVUkYsIF9EU1BCU1VSRiwgMCwgRFNQU1VSRihQSVBFX0MpKQogCisjZGVmaW5l
IHZhbGlkX3BpcGUocGlwZSkgXAorCShwaXBlID49IFBJUEVfQSAmJiBwaXBlIDwgSTkxNV9NQVhf
UElQRVMpCisKIHN0YXRpYyBpbnQgcHJpX3N1cmZfbW1pb193cml0ZShzdHJ1Y3QgaW50ZWxfdmdw
dSAqdmdwdSwgdW5zaWduZWQgaW50IG9mZnNldCwKIAkJdm9pZCAqcF9kYXRhLCB1bnNpZ25lZCBp
bnQgYnl0ZXMpCiB7CiAJc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmRldl9wcml2ID0gdmdwdS0+
Z3Z0LT5kZXZfcHJpdjsKIAl1MzIgcGlwZSA9IERTUFNVUkZfVE9fUElQRShvZmZzZXQpOwotCWlu
dCBldmVudCA9IFNLTF9GTElQX0VWRU5UKHBpcGUsIFBMQU5FX1BSSU1BUlkpOworCWludCBldmVu
dDsKKworCWlmICghdmFsaWRfcGlwZShwaXBlKSkgeworCQlXQVJOX09OKHRydWUpOworCQlyZXR1
cm4gLUVJTlZBTDsKKwl9CisKKwlldmVudCA9IFNLTF9GTElQX0VWRU5UKHBpcGUsIFBMQU5FX1BS
SU1BUlkpOwogCiAJd3JpdGVfdnJlZyh2Z3B1LCBvZmZzZXQsIHBfZGF0YSwgYnl0ZXMpOwogCXZn
cHVfdnJlZ190KHZncHUsIERTUFNVUkZMSVZFKHBpcGUpKSA9IHZncHVfdnJlZyh2Z3B1LCBvZmZz
ZXQpOwpAQCAtNzc1LDcgKzc4NSwxNCBAQCBzdGF0aWMgaW50IHNwcl9zdXJmX21taW9fd3JpdGUo
c3RydWN0IGludGVsX3ZncHUgKnZncHUsIHVuc2lnbmVkIGludCBvZmZzZXQsCiAJCXZvaWQgKnBf
ZGF0YSwgdW5zaWduZWQgaW50IGJ5dGVzKQogewogCXUzMiBwaXBlID0gU1BSU1VSRl9UT19QSVBF
KG9mZnNldCk7Ci0JaW50IGV2ZW50ID0gU0tMX0ZMSVBfRVZFTlQocGlwZSwgUExBTkVfU1BSSVRF
MCk7CisJaW50IGV2ZW50OworCisJaWYgKCF2YWxpZF9waXBlKHBpcGUpKSB7CisJCVdBUk5fT04o
dHJ1ZSk7CisJCXJldHVybiAtRUlOVkFMOworCX0KKworCWV2ZW50ID0gU0tMX0ZMSVBfRVZFTlQo
cGlwZSwgUExBTkVfU1BSSVRFMCk7CiAKIAl3cml0ZV92cmVnKHZncHUsIG9mZnNldCwgcF9kYXRh
LCBieXRlcyk7CiAJdmdwdV92cmVnX3QodmdwdSwgU1BSU1VSRkxJVkUocGlwZSkpID0gdmdwdV92
cmVnKHZncHUsIG9mZnNldCk7Ci0tIAoyLjE3LjEKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpJbnRlbCBGaW5sYW5k
IE95ClJlZ2lzdGVyZWQgQWRkcmVzczogUEwgMjgxLCAwMDE4MSBIZWxzaW5raSAKQnVzaW5lc3Mg
SWRlbnRpdHkgQ29kZTogMDM1NzYwNiAtIDQgCkRvbWljaWxlZCBpbiBIZWxzaW5raSAKClRoaXMg
ZS1tYWlsIGFuZCBhbnkgYXR0YWNobWVudHMgbWF5IGNvbnRhaW4gY29uZmlkZW50aWFsIG1hdGVy
aWFsIGZvcgp0aGUgc29sZSB1c2Ugb2YgdGhlIGludGVuZGVkIHJlY2lwaWVudChzKS4gQW55IHJl
dmlldyBvciBkaXN0cmlidXRpb24KYnkgb3RoZXJzIGlzIHN0cmljdGx5IHByb2hpYml0ZWQuIElm
IHlvdSBhcmUgbm90IHRoZSBpbnRlbmRlZApyZWNpcGllbnQsIHBsZWFzZSBjb250YWN0IHRoZSBz
ZW5kZXIgYW5kIGRlbGV0ZSBhbGwgY29waWVzLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0
LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
