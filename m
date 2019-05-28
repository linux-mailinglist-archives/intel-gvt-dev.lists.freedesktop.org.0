Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9D62C359
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 28 May 2019 11:37:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 593586E0E1;
	Tue, 28 May 2019 09:37:53 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5900B6E0E1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 28 May 2019 09:37:51 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 May 2019 02:37:50 -0700
X-ExtLoop1: 1
Received: from cfl-host.sh.intel.com ([10.239.158.146])
 by orsmga004.jf.intel.com with ESMTP; 28 May 2019 02:37:49 -0700
From: fred gao <fred.gao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v3] drm/i915/gvt: Fix cmd length of VEB_DI_IECP
Date: Tue, 28 May 2019 09:36:15 +0800
Message-Id: <20190528013615.20552-1-fred.gao@intel.com>
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
Cc: Gao@freedesktop.org, "Gao, Fred" <fred.gao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

RnJvbTogIkdhbywgRnJlZCIgPGZyZWQuZ2FvQGludGVsLmNvbT4KCkZpeCB0aGUgbGVuZ3RoIHZh
bHVlIG9mIFZFQl9ESV9JRUNQLgoKUmV2aWV3ZWQtYnk6IFpoZW55dSBXYW5nIDx6aGVueXV3QGxp
bnV4LmludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogR2FvLCBGcmVkIDxmcmVkLmdhb0BpbnRlbC5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2NtZF9wYXJzZXIuYyB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9jbWRfcGFyc2VyLmMgYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9ndnQvY21kX3BhcnNlci5jCmluZGV4IGEyNWY1MGEwM2M2Yy4uMjc4MDRjZjVhMzk0IDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvY21kX3BhcnNlci5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9jbWRfcGFyc2VyLmMKQEAgLTI1MjYsNyArMjUyNiw3IEBA
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgY21kX2luZm8gY21kX2luZm9bXSA9IHsKIAkJMCwgMTIsIE5V
TEx9LAogCiAJeyJWRUJfRElfSUVDUCIsIE9QX1ZFQl9ETkRJX0lFQ1BfU1RBVEUsIEZfTEVOX1ZB
UiwgUl9WRUNTLCBEX0JEV19QTFVTLAotCQkwLCAyMCwgTlVMTH0sCisJCTAsIDEyLCBOVUxMfSwK
IH07CiAKIHN0YXRpYyB2b2lkIGFkZF9jbWRfZW50cnkoc3RydWN0IGludGVsX2d2dCAqZ3Z0LCBz
dHJ1Y3QgY21kX2VudHJ5ICplKQotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1n
dnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
