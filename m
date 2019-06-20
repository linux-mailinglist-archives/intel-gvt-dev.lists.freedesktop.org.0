Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E61DD4C661
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 20 Jun 2019 06:58:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB1B96E4A7;
	Thu, 20 Jun 2019 04:58:02 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 883FB6E4A7
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 20 Jun 2019 04:58:01 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Jun 2019 21:58:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,395,1557212400"; d="scan'208";a="170762536"
Received: from vca-bj120.bj.intel.com ([10.240.192.119])
 by orsmga002.jf.intel.com with ESMTP; 19 Jun 2019 21:58:00 -0700
From: Xiaolin Zhang <xiaolin.zhang@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v2] drm/i915/gvt: grab runtime pm first for forcewake use
Date: Thu, 20 Jun 2019 10:29:24 -0400
Message-Id: <1561040964-68211-1-git-send-email-xiaolin.zhang@intel.com>
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
NDJhMDJlMTJjIF0tLQoKdjI6IGFkYXB0ZWQgdG8gdXNlIHJwbSBzdHJ1Y3R1cmUuCgpTaWduZWQt
b2ZmLWJ5OiBYaWFvbGluIFpoYW5nIDx4aWFvbGluLnpoYW5nQGludGVsLmNvbT4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vaTkxNS9ndnQvc2NoZWR1bGVyLmMgfCA0ICsrKysKIDEgZmlsZSBjaGFuZ2Vk
LCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQv
c2NoZWR1bGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvc2NoZWR1bGVyLmMKaW5kZXgg
NjQ2OTM2Ni4uMTk2YjQxNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3Nj
aGVkdWxlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9zY2hlZHVsZXIuYwpAQCAt
OTkwLDYgKzk5MCw3IEBAIHN0YXRpYyBpbnQgd29ya2xvYWRfdGhyZWFkKHZvaWQgKnByaXYpCiAJ
aW50IHJldDsKIAlib29sIG5lZWRfZm9yY2Vfd2FrZSA9IChJTlRFTF9HRU4oZ3Z0LT5kZXZfcHJp
dikgPj0gOSk7CiAJREVGSU5FX1dBSVRfRlVOQyh3YWl0LCB3b2tlbl93YWtlX2Z1bmN0aW9uKTsK
KwlzdHJ1Y3QgaW50ZWxfcnVudGltZV9wbSAqcnBtID0gJmd2dC0+ZGV2X3ByaXYtPnJ1bnRpbWVf
cG07CiAKIAlrZnJlZShwKTsKIApAQCAtMTAxMyw2ICsxMDE0LDggQEAgc3RhdGljIGludCB3b3Jr
bG9hZF90aHJlYWQodm9pZCAqcHJpdikKIAkJCQl3b3JrbG9hZC0+cmluZ19pZCwgd29ya2xvYWQs
CiAJCQkJd29ya2xvYWQtPnZncHUtPmlkKTsKIAorCQlpbnRlbF9ydW50aW1lX3BtX2dldChycG0p
OworCiAJCWd2dF9kYmdfc2NoZWQoInJpbmcgaWQgJWQgd2lsbCBkaXNwYXRjaCB3b3JrbG9hZCAl
cFxuIiwKIAkJCQl3b3JrbG9hZC0+cmluZ19pZCwgd29ya2xvYWQpOwogCkBAIC0xMDQyLDYgKzEw
NDUsNyBAQCBzdGF0aWMgaW50IHdvcmtsb2FkX3RocmVhZCh2b2lkICpwcml2KQogCQkJaW50ZWxf
dW5jb3JlX2ZvcmNld2FrZV9wdXQoJmd2dC0+ZGV2X3ByaXYtPnVuY29yZSwKIAkJCQkJRk9SQ0VX
QUtFX0FMTCk7CiAKKwkJaW50ZWxfcnVudGltZV9wbV9wdXRfdW5jaGVja2VkKHJwbSk7CiAJCWlm
IChyZXQgJiYgKHZncHVfaXNfdm1fdW5oZWFsdGh5KHJldCkpKQogCQkJZW50ZXJfZmFpbHNhZmVf
bW9kZSh2Z3B1LCBHVlRfRkFJTFNBRkVfR1VFU1RfRVJSKTsKIAl9Ci0tIAoxLjguMy4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2
IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
