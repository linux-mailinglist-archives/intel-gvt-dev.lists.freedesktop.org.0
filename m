Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C3A109A18
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 26 Nov 2019 09:19:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98A1A89AAE;
	Tue, 26 Nov 2019 08:19:51 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A17CF89AAE
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 26 Nov 2019 08:19:50 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Nov 2019 00:19:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,245,1571727600"; d="scan'208";a="239844533"
Received: from cfl-host.sh.intel.com ([10.239.13.96])
 by fmsmga002.fm.intel.com with ESMTP; 26 Nov 2019 00:19:49 -0800
From: "Gao, Fred" <fred.gao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v1] drm/i915/gvt: Fix guest boot warning
Date: Wed, 27 Nov 2019 00:19:04 +0800
Message-Id: <20191126161904.25281-1-fred.gao@intel.com>
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

U2ltdWxhdGUgTUlBIGNvcmUgaW4gcmVzZXQgc3RhdHVzIG9uY2UgR1VDIGVuZ2luZSBpcyByZXNl
dC4KClNpZ25lZC1vZmYtYnk6IEdhbyBGcmVkIDxmcmVkLmdhb0BpbnRlbC5jb20+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRsZXJzLmMgfCA1ICsrKysrCiAxIGZpbGUgY2hhbmdl
ZCwgNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0
L2hhbmRsZXJzLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaGFuZGxlcnMuYwppbmRleCAz
ZGU2NjRkZWIyZjguLjc4ZjRkNDFiOTAwNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ3Z0L2hhbmRsZXJzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRsZXJz
LmMKQEAgLTM0MSw2ICszNDEsMTEgQEAgc3RhdGljIGludCBnZHJzdF9tbWlvX3dyaXRlKHN0cnVj
dCBpbnRlbF92Z3B1ICp2Z3B1LCB1bnNpZ25lZCBpbnQgb2Zmc2V0LAogCQkJZ3Z0X2RiZ19tbWlv
KCJ2Z3B1JWQ6IHJlcXVlc3QgVkNTMiBSZXNldFxuIiwgdmdwdS0+aWQpOwogCQkJZW5naW5lX21h
c2sgfD0gQklUKFZDUzEpOwogCQl9CisJCWlmIChkYXRhICYgR0VOOV9HUkRPTV9HVUMpIHsKKwkJ
CWd2dF9kYmdfbW1pbygidmdwdSVkOiByZXF1ZXN0IEdVQyBSZXNldFxuIiwgdmdwdS0+aWQpOwor
CQkJdmdwdV92cmVnKHZncHUsIGk5MTVfbW1pb19yZWdfb2Zmc2V0KEdVQ19TVEFUVVMpKQorCQkJ
CXw9IEdTX01JQV9JTl9SRVNFVDsKKwkJfQogCQllbmdpbmVfbWFzayAmPSBJTlRFTF9JTkZPKHZn
cHUtPmd2dC0+ZGV2X3ByaXYpLT5lbmdpbmVfbWFzazsKIAl9CiAKLS0gCjIuMTcuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBt
YWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
