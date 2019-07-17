Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4816B755
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 17 Jul 2019 09:21:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EC2E6E270;
	Wed, 17 Jul 2019 07:21:20 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44CC16E270
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 17 Jul 2019 07:21:19 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jul 2019 00:21:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,273,1559545200"; d="scan'208";a="172783189"
Received: from vca-bj102.bj.intel.com ([10.240.193.76])
 by orsmga006.jf.intel.com with ESMTP; 17 Jul 2019 00:21:17 -0700
From: Xiaolin Zhang <xiaolin.zhang@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH] drm/i915/gvt: fix incorrect cache entry for guest page mapping
Date: Wed, 17 Jul 2019 23:56:27 +0800
Message-Id: <1563378987-21880-1-git-send-email-xiaolin.zhang@intel.com>
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
IikKU2lnbmVkLW9mZi1ieTogWGlhb2xpbiBaaGFuZyA8eGlhb2xpbi56aGFuZ0BpbnRlbC5jb20+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2t2bWd0LmMgfCAxMiArKysrKysrKysrKysK
IDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZ3Z0L2t2bWd0LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQva3ZtZ3Qu
YwppbmRleCBhNjhhZGRmLi40YTdjZjg2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9ndnQva3ZtZ3QuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQva3ZtZ3QuYwpAQCAt
MTkxMSw2ICsxOTExLDE4IEBAIHN0YXRpYyBpbnQga3ZtZ3RfZG1hX21hcF9ndWVzdF9wYWdlKHVu
c2lnbmVkIGxvbmcgaGFuZGxlLCB1bnNpZ25lZCBsb25nIGdmbiwKIAkJcmV0ID0gX19ndnRfY2Fj
aGVfYWRkKGluZm8tPnZncHUsIGdmbiwgKmRtYV9hZGRyLCBzaXplKTsKIAkJaWYgKHJldCkKIAkJ
CWdvdG8gZXJyX3VubWFwOworCX0gZWxzZSBpZiAoZW50cnktPnNpemUgIT0gc2l6ZSkgeworCQkv
KiB0aGUgc2FtZSBnZm4gd2l0aCBkaWZmZXJlbnQgc2l6ZTogdW5tYXAgYW5kIHJlLW1hcCAqLwor
CQlndnRfZG1hX3VubWFwX3BhZ2UodmdwdSwgZ2ZuLCBlbnRyeS0+ZG1hX2FkZHIsIGVudHJ5LT5z
aXplKTsKKwkJX19ndnRfY2FjaGVfcmVtb3ZlX2VudHJ5KHZncHUsIGVudHJ5KTsKKworCQlyZXQg
PSBndnRfZG1hX21hcF9wYWdlKHZncHUsIGdmbiwgZG1hX2FkZHIsIHNpemUpOworCQlpZiAocmV0
KQorCQkJZ290byBlcnJfdW5sb2NrOworCisJCXJldCA9IF9fZ3Z0X2NhY2hlX2FkZChpbmZvLT52
Z3B1LCBnZm4sICpkbWFfYWRkciwgc2l6ZSk7CisJCWlmIChyZXQpCisJCQlnb3RvIGVycl91bm1h
cDsKIAl9IGVsc2UgewogCQlrcmVmX2dldCgmZW50cnktPnJlZik7CiAJCSpkbWFfYWRkciA9IGVu
dHJ5LT5kbWFfYWRkcjsKLS0gCjEuOC4zLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1k
ZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
