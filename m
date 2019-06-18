Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FF74969D
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 18 Jun 2019 03:20:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CF466E0C6;
	Tue, 18 Jun 2019 01:20:02 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 516C16E0C6
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 18 Jun 2019 01:20:01 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jun 2019 18:20:00 -0700
X-ExtLoop1: 1
Received: from vca-bj120.bj.intel.com ([10.240.192.119])
 by fmsmga008.fm.intel.com with ESMTP; 17 Jun 2019 18:20:00 -0700
From: Xiaolin Zhang <xiaolin.zhang@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH] drm/i915/gvt: grab runtime pm first for forcewake use
Date: Tue, 18 Jun 2019 06:51:38 -0400
Message-Id: <1560855098-70079-1-git-send-email-xiaolin.zhang@intel.com>
X-Mailer: git-send-email 1.8.3.1
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

aW4gd29ya2xvYWRfdGhyZWFkLCBpdCBzaG91bGQgZ3JhYiBydW50aW1lIHBtIHdha2Vsb2NrIGFu
ZCBsYXRlcgp1bmNvcmUgZm9yY2V3YWtlIGdldCB3aWxsIGNoZWNrIHJwbSB3YWtlbG9jayBoZWxk
IHN1Y2Nlc3NmdWxseS4Kb3RoZXJ3aXNlLCBzb21ldGltZXMsIHJwbSB3YWtlbG9jayBub3QgaG9s
ZCBhbmQgcHJpbnQgY2FsbCB0cmFjZSBiZWxvdzoKCiBDYWxsIFRyYWNlOgogIGludGVsX3VuY29y
ZV9mb3JjZXdha2VfZ2V0KzB4MTUvMHgyMCBbaTkxNV0KICB3b3JrbG9hZF90aHJlYWQrMHg1Zjkv
MHgxNmYwIFtpOTE1XQogID8gX19zd2l0Y2hfdG9fYXNtKzB4MzQvMHg3MAogID8gX19zd2l0Y2hf
dG9fYXNtKzB4NDAvMHg3MAogID8gX19zd2l0Y2hfdG9fYXNtKzB4MzQvMHg3MAogID8gX19zd2l0
Y2hfdG9fYXNtKzB4NDAvMHg3MAogID8gX19zd2l0Y2hfdG9fYXNtKzB4MzQvMHg3MAogID8gX19z
d2l0Y2hfdG8rMHg4NS8weDNmMAogID8gX19zd2l0Y2hfdG9fYXNtKzB4NDAvMHg3MAogID8gZG9f
d2FpdF9pbnRyX2lycSsweDkwLzB4OTAKICBrdGhyZWFkKzB4MTIxLzB4MTQwCiAgPyBpbnRlbF92
Z3B1X2NsZWFuX3dvcmtsb2FkcysweDEwMC8weDEwMCBbaTkxNV0KICA/IGt0aHJlYWRfcGFyaysw
eDkwLzB4OTAKICByZXRfZnJvbV9mb3JrKzB4MzUvMHg0MAogLS1bIGVuZCB0cmFjZSA4NjUyNWY3
NDJhMDJlMTJjIF0tLQoKU2lnbmVkLW9mZi1ieTogWGlhb2xpbiBaaGFuZyA8eGlhb2xpbi56aGFu
Z0BpbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3NjaGVkdWxlci5jIHwg
MyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9ndnQvc2NoZWR1bGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9n
dnQvc2NoZWR1bGVyLmMKaW5kZXggYTE1ODBkZi4uN2NmY2FmNSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZ3Z0L3NjaGVkdWxlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2d2dC9zY2hlZHVsZXIuYwpAQCAtMTAxMiw2ICsxMDEyLDggQEAgc3RhdGljIGludCB3b3JrbG9h
ZF90aHJlYWQodm9pZCAqcHJpdikKIAkJCQl3b3JrbG9hZC0+cmluZ19pZCwgd29ya2xvYWQsCiAJ
CQkJd29ya2xvYWQtPnZncHUtPmlkKTsKIAorCQlpbnRlbF9ydW50aW1lX3BtX2dldChndnQtPmRl
dl9wcml2KTsKKwogCQlndnRfZGJnX3NjaGVkKCJyaW5nIGlkICVkIHdpbGwgZGlzcGF0Y2ggd29y
a2xvYWQgJXBcbiIsCiAJCQkJd29ya2xvYWQtPnJpbmdfaWQsIHdvcmtsb2FkKTsKIApAQCAtMTA0
MSw2ICsxMDQzLDcgQEAgc3RhdGljIGludCB3b3JrbG9hZF90aHJlYWQodm9pZCAqcHJpdikKIAkJ
CWludGVsX3VuY29yZV9mb3JjZXdha2VfcHV0KCZndnQtPmRldl9wcml2LT51bmNvcmUsCiAJCQkJ
CUZPUkNFV0FLRV9BTEwpOwogCisJCWludGVsX3J1bnRpbWVfcG1fcHV0X3VuY2hlY2tlZChndnQt
PmRldl9wcml2KTsKIAkJaWYgKHJldCAmJiAodmdwdV9pc192bV91bmhlYWx0aHkocmV0KSkpCiAJ
CQllbnRlcl9mYWlsc2FmZV9tb2RlKHZncHUsIEdWVF9GQUlMU0FGRV9HVUVTVF9FUlIpOwogCX0K
LS0gCjEuOC4zLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
aW50ZWwtZ3Z0LWRldg==
