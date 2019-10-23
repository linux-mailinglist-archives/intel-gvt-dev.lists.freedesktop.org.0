Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD78E1678
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 23 Oct 2019 11:43:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 722626EA14;
	Wed, 23 Oct 2019 09:43:33 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AB4A6EA14
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 23 Oct 2019 09:43:31 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Oct 2019 02:43:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,220,1569308400"; d="scan'208";a="197382699"
Received: from debian-nuc.sh.intel.com ([10.239.160.37])
 by fmsmga007.fm.intel.com with ESMTP; 23 Oct 2019 02:43:30 -0700
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH] drm/i915/gvt: fix dead locking in early workload shadow
Date: Wed, 23 Oct 2019 17:43:27 +0800
Message-Id: <20191023094327.2176-1-zhenyuw@linux.intel.com>
X-Mailer: git-send-email 2.24.0.rc0
MIME-Version: 1.0
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
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

QXMgZWFybHkgd29ya2xvYWQgc2NhbiBhbmQgc2hhZG93IGhhcHBlbnMgaW4gZXhlY2xpc3QgbW1p
byBoYW5kbGVyLAp3aGljaCBoYXMgYWxyZWFkeSB0YWtlbiB2Z3B1X2xvY2suIFNvIHJlbW92ZSBl
eHRyYSBsb2NrIHRha2luZyBoZXJlLgoKRml4ZXM6IDk1MmY4OWYwOThjNyAoImRybS9pOTE1L2d2
dDogV2VhbiBvZmYgc3RydWN0X211dGV4IikKQ2M6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMt
d2lsc29uLmNvLnVrPgpTaWduZWQtb2ZmLWJ5OiBaaGVueXUgV2FuZyA8emhlbnl1d0BsaW51eC5p
bnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3NjaGVkdWxlci5jIHwgMiAt
LQogMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZ3Z0L3NjaGVkdWxlci5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3Nj
aGVkdWxlci5jCmluZGV4IDM2YmI3NjM5ZTgyZi4uYTViOTQyZWUzY2ViIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvc2NoZWR1bGVyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ3Z0L3NjaGVkdWxlci5jCkBAIC0xNTg0LDkgKzE1ODQsNyBAQCBpbnRlbF92Z3B1X2Ny
ZWF0ZV93b3JrbG9hZChzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSwgaW50IHJpbmdfaWQsCiAJICov
CiAJaWYgKGxpc3RfZW1wdHkod29ya2xvYWRfcV9oZWFkKHZncHUsIHJpbmdfaWQpKSkgewogCQlp
bnRlbF9ydW50aW1lX3BtX2dldCgmZGV2X3ByaXYtPnJ1bnRpbWVfcG0pOwotCQltdXRleF9sb2Nr
KCZ2Z3B1LT52Z3B1X2xvY2spOwogCQlyZXQgPSBpbnRlbF9ndnRfc2Nhbl9hbmRfc2hhZG93X3dv
cmtsb2FkKHdvcmtsb2FkKTsKLQkJbXV0ZXhfdW5sb2NrKCZ2Z3B1LT52Z3B1X2xvY2spOwogCQlp
bnRlbF9ydW50aW1lX3BtX3B1dF91bmNoZWNrZWQoJmRldl9wcml2LT5ydW50aW1lX3BtKTsKIAl9
CiAKLS0gCjIuMjQuMC5yYzAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vaW50ZWwtZ3Z0LWRldg==
