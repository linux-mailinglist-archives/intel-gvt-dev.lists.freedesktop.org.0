Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED202912F
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 24 May 2019 08:45:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26B7E6E08E;
	Fri, 24 May 2019 06:45:29 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1333B6E08E
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 24 May 2019 06:45:27 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 May 2019 23:45:26 -0700
X-ExtLoop1: 1
Received: from gvt.bj.intel.com ([10.238.158.187])
 by orsmga008.jf.intel.com with ESMTP; 23 May 2019 23:45:23 -0700
From: Tina Zhang <tina.zhang@intel.com>
To: zhenyuw@linux.intel.com,
	hang.yuan@intel.com
Subject: [PATCH] drm/i915/gvt: Double check batch buffer size after copy
Date: Fri, 24 May 2019 14:39:54 +0800
Message-Id: <20190524063954.3468-1-tina.zhang@intel.com>
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
Cc: intel-gvt-dev@lists.freedesktop.org, Tina Zhang <tina.zhang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

RG91YmxlIGNoZWNrIHRoZSBzaXplIG9mIHRoZSBwcml2aWxlZ2UgYnVmZmVyIHRvIG1ha2Ugc3Vy
ZSB0aGUgc2l6ZQpyZW1haW5zIHVuY2hhbmdlZCBhZnRlciBjb3B5LgoKU2lnbmVkLW9mZi1ieTog
VGluYSBaaGFuZyA8dGluYS56aGFuZ0BpbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ3Z0L2NtZF9wYXJzZXIuYyB8IDEyICsrKysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDEx
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9ndnQvY21kX3BhcnNlci5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2NtZF9w
YXJzZXIuYwppbmRleCBhYjAwMmNmZDNjYWIuLjk2ZGFkZTMyYTMzYyAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2NtZF9wYXJzZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9ndnQvY21kX3BhcnNlci5jCkBAIC0xNzE3LDcgKzE3MTcsNyBAQCBzdGF0aWMgaW50IHBl
cmZvcm1fYmJfc2hhZG93KHN0cnVjdCBwYXJzZXJfZXhlY19zdGF0ZSAqcykKIAlzdHJ1Y3QgaW50
ZWxfdmdwdSAqdmdwdSA9IHMtPnZncHU7CiAJc3RydWN0IGludGVsX3ZncHVfc2hhZG93X2JiICpi
YjsKIAl1bnNpZ25lZCBsb25nIGdtYSA9IDA7Ci0JdW5zaWduZWQgbG9uZyBiYl9zaXplOworCXVu
c2lnbmVkIGxvbmcgYmJfc2l6ZSwgY2hlY2tfYmJfc2l6ZTsKIAlpbnQgcmV0ID0gMDsKIAlzdHJ1
Y3QgaW50ZWxfdmdwdV9tbSAqbW0gPSAocy0+YnVmX2FkZHJfdHlwZSA9PSBHVFRfQlVGRkVSKSA/
CiAJCXMtPnZncHUtPmd0dC5nZ3R0X21tIDogcy0+d29ya2xvYWQtPnNoYWRvd19tbTsKQEAgLTE3
ODMsNiArMTc4MywxNiBAQCBzdGF0aWMgaW50IHBlcmZvcm1fYmJfc2hhZG93KHN0cnVjdCBwYXJz
ZXJfZXhlY19zdGF0ZSAqcykKIAkJZ290byBlcnJfdW5tYXA7CiAJfQogCisJcmV0ID0gZmluZF9i
Yl9zaXplKHMsICZjaGVja19iYl9zaXplKTsKKwlpZiAocmV0KQorCQlnb3RvIGVycl91bm1hcDsK
KworCWlmIChjaGVja19iYl9zaXplICE9IGJiX3NpemUpIHsKKwkJZ3Z0X3ZncHVfZXJyKCJndWVz
dCByaW5nIGJ1ZmZlciBoYXMgYmVlbiBjaGFuZ2VkXG4iKTsKKwkJcmV0ID0gLUVJTlZBTDsKKwkJ
Z290byBlcnJfdW5tYXA7CisJfQorCiAJSU5JVF9MSVNUX0hFQUQoJmJiLT5saXN0KTsKIAlsaXN0
X2FkZCgmYmItPmxpc3QsICZzLT53b3JrbG9hZC0+c2hhZG93X2JiKTsKIAotLSAKMi4xNy4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQt
ZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
