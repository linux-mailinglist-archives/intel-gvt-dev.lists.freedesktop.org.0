Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4786B84E
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 17 Jul 2019 10:35:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01AE26E123;
	Wed, 17 Jul 2019 08:35:24 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F258F6E123
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 17 Jul 2019 08:35:22 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jul 2019 01:35:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,273,1559545200"; d="scan'208";a="342970661"
Received: from vca-bj102.bj.intel.com ([10.240.193.76])
 by orsmga005.jf.intel.com with ESMTP; 17 Jul 2019 01:35:21 -0700
From: Xiaolin Zhang <xiaolin.zhang@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH] drm/i915/gvt: fix incorrect cache entry for guest page mapping
Date: Thu, 18 Jul 2019 01:10:24 +0800
Message-Id: <1563383424-23315-1-git-send-email-xiaolin.zhang@intel.com>
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
Cc: Xiaolin Zhang <xiaolin.zhang@intel.com>, stable@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

R1BVIGhhbmcgb2JzZXJ2ZWQgZHVyaW5nIHRoZSBndWVzdCBPQ0wgY29uZm9ybWFuY2UgdGVzdCB3
aGljaCBpcyBjYXVzZWQKYnkgVEhQIEdUVCBmZWF0dXJlIHVzZWQgZHVybmluZyB0aGUgdGVzdC4K
Ckl0IHdhcyBvYnNlcnZlZCB0aGUgc2FtZSBHRk4gd2l0aCBkaWZmZXJlbnQgc2l6ZSAoNEsgYW5k
IDJNKSByZXF1ZXN0ZWQKZnJvbSB0aGUgZ3Vlc3QgaW4gR1ZULiBTbyBkdXJpbmcgdGhlIGd1ZXN0
IHBhZ2UgZG1hIG1hcCBzdGFnZSwgaXQgaXMKcmVxdWlyZWQgdG8gdW5tYXAgZmlyc3Qgd2l0aCBv
cmdpbmFsIHNpemUgYW5kIHRoZW4gcmVtYXAgYWdhaW4gd2l0aApyZXF1ZXN0ZWQgc2l6ZS4KCkZp
eGVzOiBiOTAxYjI1MmI2Y2YgKCJkcm0vaTkxNS9ndnQ6IEFkZCAyTSBodWdlIGd0dCBzdXBwb3J0
IikKQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKU2lnbmVkLW9mZi1ieTogWGlhb2xpbiBaaGFu
ZyA8eGlhb2xpbi56aGFuZ0BpbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0
L2t2bWd0LmMgfCAxMiArKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2t2bWd0LmMgYi9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9ndnQva3ZtZ3QuYwppbmRleCBhNjhhZGRmLi40YTdjZjg2IDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQva3ZtZ3QuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9ndnQva3ZtZ3QuYwpAQCAtMTkxMSw2ICsxOTExLDE4IEBAIHN0YXRpYyBpbnQg
a3ZtZ3RfZG1hX21hcF9ndWVzdF9wYWdlKHVuc2lnbmVkIGxvbmcgaGFuZGxlLCB1bnNpZ25lZCBs
b25nIGdmbiwKIAkJcmV0ID0gX19ndnRfY2FjaGVfYWRkKGluZm8tPnZncHUsIGdmbiwgKmRtYV9h
ZGRyLCBzaXplKTsKIAkJaWYgKHJldCkKIAkJCWdvdG8gZXJyX3VubWFwOworCX0gZWxzZSBpZiAo
ZW50cnktPnNpemUgIT0gc2l6ZSkgeworCQkvKiB0aGUgc2FtZSBnZm4gd2l0aCBkaWZmZXJlbnQg
c2l6ZTogdW5tYXAgYW5kIHJlLW1hcCAqLworCQlndnRfZG1hX3VubWFwX3BhZ2UodmdwdSwgZ2Zu
LCBlbnRyeS0+ZG1hX2FkZHIsIGVudHJ5LT5zaXplKTsKKwkJX19ndnRfY2FjaGVfcmVtb3ZlX2Vu
dHJ5KHZncHUsIGVudHJ5KTsKKworCQlyZXQgPSBndnRfZG1hX21hcF9wYWdlKHZncHUsIGdmbiwg
ZG1hX2FkZHIsIHNpemUpOworCQlpZiAocmV0KQorCQkJZ290byBlcnJfdW5sb2NrOworCisJCXJl
dCA9IF9fZ3Z0X2NhY2hlX2FkZChpbmZvLT52Z3B1LCBnZm4sICpkbWFfYWRkciwgc2l6ZSk7CisJ
CWlmIChyZXQpCisJCQlnb3RvIGVycl91bm1hcDsKIAl9IGVsc2UgewogCQlrcmVmX2dldCgmZW50
cnktPnJlZik7CiAJCSpkbWFfYWRkciA9IGVudHJ5LT5kbWFfYWRkcjsKLS0gCjEuOC4zLjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1k
ZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
