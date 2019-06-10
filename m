Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 477203AEEB
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 10 Jun 2019 08:15:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D042C890EA;
	Mon, 10 Jun 2019 06:15:01 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C843890EF
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 10 Jun 2019 06:15:01 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Jun 2019 23:15:00 -0700
X-ExtLoop1: 1
Received: from gvt.bj.intel.com ([10.238.158.187])
 by orsmga004.jf.intel.com with ESMTP; 09 Jun 2019 23:14:59 -0700
From: Tina Zhang <tina.zhang@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v2] drm/i915/gvt: Double check batch buffer size after copy
Date: Mon, 10 Jun 2019 14:09:16 +0800
Message-Id: <20190610060916.609-1-tina.zhang@intel.com>
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
Cc: hang.yuan@intel.com, Yan Zhao <yan.y.zhao@intel.com>,
 zhenyuw@linux.intel.com, Tina Zhang <tina.zhang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

RG91YmxlIGNoZWNrIHRoZSBzaXplIG9mIHRoZSBwcml2aWxlZ2UgYnVmZmVyIHRvIG1ha2Ugc3Vy
ZSB0aGUgc2l6ZQpyZW1haW5zIHVuY2hhbmdlZCBhZnRlciBjb3B5LgoKdjI6Ci0gVXNlIGxpZ2h0
d2VpZ2h0IHdheSB0byBhdWRpdCBiYXRjaCBidWZmZXIgZW5kLiAoWWFuKQoKQ2M6IFlhbiBaaGFv
IDx5YW4ueS56aGFvQGludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogVGluYSBaaGFuZyA8dGluYS56
aGFuZ0BpbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2NtZF9wYXJzZXIu
YyB8IDI3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDI3IGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvY21kX3Bh
cnNlci5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2NtZF9wYXJzZXIuYwppbmRleCA2ZWE4
ODI3MGM4MTguLjU2YThhZGEwMDg5ZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUv
Z3Z0L2NtZF9wYXJzZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvY21kX3BhcnNl
ci5jCkBAIC0xNzE2LDYgKzE3MTYsMjkgQEAgc3RhdGljIGludCBmaW5kX2JiX3NpemUoc3RydWN0
IHBhcnNlcl9leGVjX3N0YXRlICpzLCB1bnNpZ25lZCBsb25nICpiYl9zaXplKQogCXJldHVybiAw
OwogfQogCitzdGF0aWMgaW50IGF1ZGl0X2JiX2VuZChzdHJ1Y3QgcGFyc2VyX2V4ZWNfc3RhdGUg
KnMsIHZvaWQgKnZhKQoreworCXN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1ID0gcy0+dmdwdTsKKwl1
MzIgY21kID0gKih1MzIgKil2YTsKKwljb25zdCBzdHJ1Y3QgY21kX2luZm8gKmluZm87CisKKwlp
bmZvID0gZ2V0X2NtZF9pbmZvKHMtPnZncHUtPmd2dCwgY21kLCBzLT5yaW5nX2lkKTsKKwlpZiAo
aW5mbyA9PSBOVUxMKSB7CisJCWd2dF92Z3B1X2VycigidW5rbm93biBjbWQgMHgleCwgb3Bjb2Rl
PTB4JXgsIGFkZHJfdHlwZT0lcywgcmluZyAlZCwgd29ya2xvYWQ9JXBcbiIsCisJCQljbWQsIGdl
dF9vcGNvZGUoY21kLCBzLT5yaW5nX2lkKSwKKwkJCShzLT5idWZfYWRkcl90eXBlID09IFBQR1RU
X0JVRkZFUikgPworCQkJInBwZ3R0IiA6ICJnZ3R0Iiwgcy0+cmluZ19pZCwgcy0+d29ya2xvYWQp
OworCQlyZXR1cm4gLUVCQURSUUM7CisJfQorCisJaWYgKChpbmZvLT5vcGNvZGUgPT0gT1BfTUlf
QkFUQ0hfQlVGRkVSX0VORCkgfHwKKwkgICAgKChpbmZvLT5vcGNvZGUgPT0gT1BfTUlfQkFUQ0hf
QlVGRkVSX1NUQVJUKSAmJgorCSAgICAgKEJBVENIX0JVRkZFUl8yTkRfTEVWRUxfQklUKGNtZCkg
PT0gMCkpKQorCQlyZXR1cm4gMDsKKworCXJldHVybiAtRUJBRFJRQzsKK30KKwogc3RhdGljIGlu
dCBwZXJmb3JtX2JiX3NoYWRvdyhzdHJ1Y3QgcGFyc2VyX2V4ZWNfc3RhdGUgKnMpCiB7CiAJc3Ry
dWN0IGludGVsX3ZncHUgKnZncHUgPSBzLT52Z3B1OwpAQCAtMTc4OCw2ICsxODExLDEwIEBAIHN0
YXRpYyBpbnQgcGVyZm9ybV9iYl9zaGFkb3coc3RydWN0IHBhcnNlcl9leGVjX3N0YXRlICpzKQog
CQlnb3RvIGVycl91bm1hcDsKIAl9CiAKKwlyZXQgPSBhdWRpdF9iYl9lbmQocywgYmItPnZhICsg
c3RhcnRfb2Zmc2V0ICsgYmJfc2l6ZSAtIDQpOworCWlmIChyZXQpCisJCWdvdG8gZXJyX3VubWFw
OworCiAJSU5JVF9MSVNUX0hFQUQoJmJiLT5saXN0KTsKIAlsaXN0X2FkZCgmYmItPmxpc3QsICZz
LT53b3JrbG9hZC0+c2hhZG93X2JiKTsKIAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdApp
bnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
