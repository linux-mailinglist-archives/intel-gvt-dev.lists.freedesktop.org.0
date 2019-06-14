Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E13A745149
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 14 Jun 2019 03:45:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69B39892DE;
	Fri, 14 Jun 2019 01:45:04 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF66C892DE
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 14 Jun 2019 01:45:02 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Jun 2019 18:45:02 -0700
X-ExtLoop1: 1
Received: from vgt-optiplex-9020.sh.intel.com ([10.239.160.51])
 by orsmga008.jf.intel.com with ESMTP; 13 Jun 2019 18:45:01 -0700
From: Weinan Li <weinan.z.li@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v2] drm/i915/gvt: ignore unexpected pvinfo write
Date: Fri, 14 Jun 2019 09:35:19 +0800
Message-Id: <20190614013519.13672-1-weinan.z.li@intel.com>
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
Cc: Zhenyu Wang <zhenyuw@linux.intel.com>, Weinan Li <weinan.z.li@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

VGhlcmUgaXMgcHZpbmZvIHdyaXRpbmcgY29tZSBmcm9tIHZncHUgbWlnaHQgYmUgdW5leHBlY3Rl
ZCwgbGlrZSB3cml0aW5nCnRvIG9uZSB1bmtub3duIGFkZHJlc3MsIG5vdyBHVlQtZyBsZXRzIGl0
IHdyaXRlIHRvIHRoZSB2cmVnIHdpdGggcHJvbXB0CmVycm9yIG1lc3NhZ2UuIEl0J3MgYmV0dGVy
IHRvIGlnbm9yZSB0aGUgdW5leHBlY3RlZCBwdmluZm8gd3JpdGUgYWNjZXNzCmFuZCBsZWF2ZSB0
aGUgdnJlZyBhcyB0aGUgZGVmYXVsdCB2YWx1ZS4KCnYyOiBpZ25vcmUgdW5leHBlY3RlZCBwdmlu
Zm8gd3JpdGUgaW5zdGVhZCBvZiByZXR1cm4gcHJlZGVmaW5lZCB2YWx1ZQoKQ2M6IFpoZW55dSBX
YW5nIDx6aGVueXV3QGxpbnV4LmludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogV2VpbmFuIExpIDx3
ZWluYW4uei5saUBpbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRs
ZXJzLmMgfCAxNSArKysrKysrKystLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMo
KyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0
L2hhbmRsZXJzLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaGFuZGxlcnMuYwppbmRleCBh
NmFkZTY2MzQ5YmQuLjI1Zjc4MTk2Yjk2NCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ3Z0L2hhbmRsZXJzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRsZXJz
LmMKQEAgLTEyNTQsMTggKzEyNTQsMTUgQEAgc3RhdGljIGludCBzZW5kX2Rpc3BsYXlfcmVhZHlf
dWV2ZW50KHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1LCBpbnQgcmVhZHkpCiBzdGF0aWMgaW50IHB2
aW5mb19tbWlvX3dyaXRlKHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1LCB1bnNpZ25lZCBpbnQgb2Zm
c2V0LAogCQl2b2lkICpwX2RhdGEsIHVuc2lnbmVkIGludCBieXRlcykKIHsKLQl1MzIgZGF0YTsK
LQlpbnQgcmV0OwotCi0Jd3JpdGVfdnJlZyh2Z3B1LCBvZmZzZXQsIHBfZGF0YSwgYnl0ZXMpOwot
CWRhdGEgPSB2Z3B1X3ZyZWcodmdwdSwgb2Zmc2V0KTsKKwl1MzIgZGF0YSA9ICoodTMyICopcF9k
YXRhOworCWJvb2wgaW52YWxpZF93cml0ZSA9IGZhbHNlOwogCiAJc3dpdGNoIChvZmZzZXQpIHsK
IAljYXNlIF92Z3RpZl9yZWcoZGlzcGxheV9yZWFkeSk6CiAJCXNlbmRfZGlzcGxheV9yZWFkeV91
ZXZlbnQodmdwdSwgZGF0YSA/IDEgOiAwKTsKIAkJYnJlYWs7CiAJY2FzZSBfdmd0aWZfcmVnKGcy
dl9ub3RpZnkpOgotCQlyZXQgPSBoYW5kbGVfZzJ2X25vdGlmaWNhdGlvbih2Z3B1LCBkYXRhKTsK
KwkJaGFuZGxlX2cydl9ub3RpZmljYXRpb24odmdwdSwgZGF0YSk7CiAJCWJyZWFrOwogCS8qIGFk
ZCB4aG90IGFuZCB5aG90IHRvIGhhbmRsZWQgbGlzdCB0byBhdm9pZCBlcnJvciBsb2cgKi8KIAlj
YXNlIF92Z3RpZl9yZWcoY3Vyc29yX3hfaG90KToKQEAgLTEyODIsMTMgKzEyNzksMTkgQEAgc3Rh
dGljIGludCBwdmluZm9fbW1pb193cml0ZShzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSwgdW5zaWdu
ZWQgaW50IG9mZnNldCwKIAljYXNlIF92Z3RpZl9yZWcoZXhlY2xpc3RfY29udGV4dF9kZXNjcmlw
dG9yX2hpKToKIAkJYnJlYWs7CiAJY2FzZSBfdmd0aWZfcmVnKHJzdjVbMF0pLi4uX3ZndGlmX3Jl
Zyhyc3Y1WzNdKToKKwkJaW52YWxpZF93cml0ZSA9IHRydWU7CiAJCWVudGVyX2ZhaWxzYWZlX21v
ZGUodmdwdSwgR1ZUX0ZBSUxTQUZFX0lOU1VGRklDSUVOVF9SRVNPVVJDRSk7CiAJCWJyZWFrOwog
CWRlZmF1bHQ6CisJCWludmFsaWRfd3JpdGUgPSB0cnVlOwogCQlndnRfdmdwdV9lcnIoImludmFs
aWQgcHZpbmZvIHdyaXRlIG9mZnNldCAleCBieXRlcyAleCBkYXRhICV4XG4iLAogCQkJCW9mZnNl
dCwgYnl0ZXMsIGRhdGEpOwogCQlicmVhazsKIAl9CisKKwlpZiAoIWludmFsaWRfd3JpdGUpCisJ
CXdyaXRlX3ZyZWcodmdwdSwgb2Zmc2V0LCBwX2RhdGEsIGJ5dGVzKTsKKwogCXJldHVybiAwOwog
fQogCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vaW50ZWwtZ3Z0LWRldg==
