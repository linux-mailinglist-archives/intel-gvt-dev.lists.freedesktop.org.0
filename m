Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0C41099ED
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 26 Nov 2019 09:09:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E32296E225;
	Tue, 26 Nov 2019 08:09:02 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C5BB6E225
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 26 Nov 2019 08:09:01 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Nov 2019 00:09:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,244,1571727600"; d="scan'208";a="239841911"
Received: from cfl-host.sh.intel.com ([10.239.13.96])
 by fmsmga002.fm.intel.com with ESMTP; 26 Nov 2019 00:08:59 -0800
From: "Gao, Fred" <fred.gao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v2 1/2] drm/i915/gvt: Refine non privilege register address
 calucation
Date: Wed, 27 Nov 2019 00:07:35 +0800
Message-Id: <20191126160735.1026-1-fred.gao@intel.com>
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
Cc: "Gao, Fred" <fred.gao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

VGhlIEJpdEZpZWxkIG9mIG5vbiBwcml2aWxlZ2UgcmVnaXN0ZXIgYWRkcmVzcyBpcyBvbmx5IGZy
b20gYml0IDIgdG8gMjUuCgp2MjogdXNlIFJFR19HRU5NQVNLIGluc3RlYWQuIChaaGVueXUpCgpT
aWduZWQtb2ZmLWJ5OiBHYW8gRnJlZCA8ZnJlZC5nYW9AaW50ZWwuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9pOTE1L2d2dC9oYW5kbGVycy5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2d2dC9oYW5kbGVycy5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRsZXJz
LmMKaW5kZXggNDVhOTEyNGU1M2I2Li5mMzQ2YmRkMjY2YWIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2d2dC9oYW5kbGVycy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2
dC9oYW5kbGVycy5jCkBAIC01MDgsNyArNTA4LDcgQEAgc3RhdGljIGlubGluZSBib29sIGluX3do
aXRlbGlzdCh1bnNpZ25lZCBpbnQgcmVnKQogc3RhdGljIGludCBmb3JjZV9ub25wcml2X3dyaXRl
KHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1LAogCXVuc2lnbmVkIGludCBvZmZzZXQsIHZvaWQgKnBf
ZGF0YSwgdW5zaWduZWQgaW50IGJ5dGVzKQogewotCXUzMiByZWdfbm9ucHJpdiA9ICoodTMyICop
cF9kYXRhOworCXUzMiByZWdfbm9ucHJpdiA9ICgqKHUzMiAqKXBfZGF0YSkgJiBSRUdfR0VOTUFT
SygyNSwgMik7CiAJaW50IHJpbmdfaWQgPSBpbnRlbF9ndnRfcmVuZGVyX21taW9fdG9fcmluZ19p
ZCh2Z3B1LT5ndnQsIG9mZnNldCk7CiAJdTMyIHJpbmdfYmFzZTsKIAlzdHJ1Y3QgZHJtX2k5MTVf
cHJpdmF0ZSAqZGV2X3ByaXYgPSB2Z3B1LT5ndnQtPmRldl9wcml2OwpAQCAtNTI4LDcgKzUyOCw3
IEBAIHN0YXRpYyBpbnQgZm9yY2Vfbm9ucHJpdl93cml0ZShzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdw
dSwKIAkJCWJ5dGVzKTsKIAl9IGVsc2UKIAkJZ3Z0X2VycigidmdwdSglZCkgSW52YWxpZCBGT1JD
RV9OT05QUklWIHdyaXRlICV4IGF0IG9mZnNldCAleFxuIiwKLQkJCXZncHUtPmlkLCByZWdfbm9u
cHJpdiwgb2Zmc2V0KTsKKwkJCXZncHUtPmlkLCAqKHUzMiAqKXBfZGF0YSwgb2Zmc2V0KTsKIAog
CXJldHVybiAwOwogfQotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
