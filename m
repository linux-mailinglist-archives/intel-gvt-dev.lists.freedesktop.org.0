Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F222F82B
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 30 May 2019 10:00:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5703D6E2C7;
	Thu, 30 May 2019 08:00:07 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E483F6E32C
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 30 May 2019 08:00:03 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 May 2019 01:00:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,530,1549958400"; d="scan'208";a="179863740"
Received: from xzhan34-mobl3.bj.intel.com ([10.238.154.54])
 by fmsmga002.fm.intel.com with ESMTP; 30 May 2019 01:00:02 -0700
From: Xiaolin Zhang <xiaolin.zhang@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v4] drm/i915/gvt: save RING_HEAD into vreg when vgpu switched
 out
Date: Thu, 30 May 2019 16:00:00 +0800
Message-Id: <1559203200-14780-1-git-send-email-xiaolin.zhang@intel.com>
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
Cc: Xiaolin Zhang <xiaolin.zhang@intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

U2F2ZSBSSU5HX0hFQUQgaW50byB2Z3B1IHJlZyB3aGVuIHZncHUgc3dpdGNoZWQgb3V0IGFuZCBy
ZXBvcnQKaXQncyB2YWx1ZSBiYWNrIHRvIGd1ZXN0LgoKdjQ6IHVwZGF0ZWQgSEVBRC9UQUlMIHdp
dGggZ3Vlc3QgdmFsdWUsIG5vdCBob3N0IHZhbHVlLiAoWWFuIFpoYW8pCnYzOiBzYXZlIFJJTkcg
SEVBRC9UQUlMIHZncHUgcmVnIGluIHNhdmVfcmluZ19od19zdGF0ZS4gKFpoZW55dSBXYW5nKQp2
Mjogc2F2ZSBSSU5HX1RBSUwgYXMgd2VsbCBkdXJpbmcgdmdwdSBtbWlvIHN3aXRjaCB0byBtZWV0
IHJpbmdfaXNfaWRsZQpjb25kaXRpb24uIChGcmVkIEdhbykKdjE6IGJhc2VkIG9uIGlucHV0IGZy
b20gV2VpbmFuLiAoV2VpbmFuIExpKQoKW3poZW55dXc6IEluY2x1ZGUgdGhpcyBmaXggZm9yIHBv
c3NpYmxlIGZ1dHVyZSBndWVzdCBrZXJuZWwgdGhhdAp3b3VsZCB1dGlsaXplIFJJTkdfSEVBRCBm
b3IgaGFuZ2NoZWNrLl0KClJldmlld2VkLWJ5OiBaaGVueXUgV2FuZyA8emhlbnl1d0BsaW51eC5p
bnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IFhpYW9saW4gWmhhbmcgPHhpYW9saW4uemhhbmdAaW50
ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBaaGVueXUgV2FuZyA8emhlbnl1d0BsaW51eC5pbnRlbC5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3NjaGVkdWxlci5jIHwgOSArKysrKysr
KysKIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9ndnQvc2NoZWR1bGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQv
c2NoZWR1bGVyLmMKaW5kZXggMzg4OTdkMi4uNDlmNjYwNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZ3Z0L3NjaGVkdWxlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2
dC9zY2hlZHVsZXIuYwpAQCAtNzkzLDEwICs3OTMsMTkgQEAgc3RhdGljIHZvaWQgdXBkYXRlX2d1
ZXN0X2NvbnRleHQoc3RydWN0IGludGVsX3ZncHVfd29ya2xvYWQgKndvcmtsb2FkKQogCXZvaWQg
KnNyYzsKIAl1bnNpZ25lZCBsb25nIGNvbnRleHRfZ3BhLCBjb250ZXh0X3BhZ2VfbnVtOwogCWlu
dCBpOworCXN0cnVjdCBkcm1faTkxNV9wcml2YXRlICpkZXZfcHJpdiA9IGd2dC0+ZGV2X3ByaXY7
CisJaTkxNV9yZWdfdCByZWc7CisJdTMyIHJpbmdfYmFzZTsKIAogCWd2dF9kYmdfc2NoZWQoInJp
bmcgaWQgJWQgd29ya2xvYWQgbHJjYSAleFxuIiwgcnEtPmVuZ2luZS0+aWQsCiAJCSAgICAgIHdv
cmtsb2FkLT5jdHhfZGVzYy5scmNhKTsKIAorCXJpbmdfYmFzZSA9IGRldl9wcml2LT5lbmdpbmVb
d29ya2xvYWQtPnJpbmdfaWRdLT5tbWlvX2Jhc2U7CisJcmVnID0gUklOR19UQUlMKHJpbmdfYmFz
ZSk7CisJdmdwdV92cmVnKHZncHUsIGk5MTVfbW1pb19yZWdfb2Zmc2V0KHJlZykpID0gd29ya2xv
YWQtPnJiX3RhaWw7CisJcmVnID0gUklOR19IRUFEKHJpbmdfYmFzZSk7CisJdmdwdV92cmVnKHZn
cHUsIGk5MTVfbW1pb19yZWdfb2Zmc2V0KHJlZykpID0gd29ya2xvYWQtPnJiX3RhaWw7CisKIAlj
b250ZXh0X3BhZ2VfbnVtID0gcnEtPmVuZ2luZS0+Y29udGV4dF9zaXplOwogCWNvbnRleHRfcGFn
ZV9udW0gPSBjb250ZXh0X3BhZ2VfbnVtID4+IFBBR0VfU0hJRlQ7CiAKLS0gCjIuNy40CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2
IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
