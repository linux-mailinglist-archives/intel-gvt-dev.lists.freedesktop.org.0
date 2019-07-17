Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2CB6B5F0
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 17 Jul 2019 07:30:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25A806E228;
	Wed, 17 Jul 2019 05:30:47 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00A896E228
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 17 Jul 2019 05:30:45 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Jul 2019 22:30:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,273,1559545200"; d="scan'208";a="342931274"
Received: from vca-bj102.bj.intel.com ([10.240.193.76])
 by orsmga005.jf.intel.com with ESMTP; 16 Jul 2019 22:30:44 -0700
From: Xiaolin Zhang <xiaolin.zhang@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH] drm/i915/gvt: addressed vGPU hang during OCL conformance test
Date: Wed, 17 Jul 2019 22:06:00 +0800
Message-Id: <1563372360-38030-1-git-send-email-xiaolin.zhang@intel.com>
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

R1BVIGhhbmcgb2JzZXJ2ZWQgZHVyaW5nIHRoZSBndWVzdCBPQ0wgY29uZm9ybWFuY2UgdGVzdCB3
aGljaCBpcyBjYXVzZWQKYnkgVEhQIEdUVCBmZWF0dXJlIHVzZWQgZHVybmluZyB0aGUgdGVzdC4K
Cml0IHdhcyBvYnNlcnZlZCB0aGUgc2FtZSBHRk4gd2l0aCBkaWZmZXJlbnQgc2l6ZSAoNEsgYW5k
IDJNKSByZXF1ZXN0ZWQKZnJvbSB0aGUgcXVlc3QgaW4gR1ZULiBzbyBkdXJpbmcgdGhlIGd1ZXN0
IHBhZ2UgZG1hIG1hcCBzdGFnZSwgaXQgaXMKcmVxdWlyZWQgdG8gdW5tYXAgZmlyc3Qgd2l0aCBv
cmdpbmFsIHNpemUgYW5kIHRoZW4gcmVtYXAgYWdhaW4gd2l0aApyZXF1ZXN0ZWQgc2l6ZS4KClNp
Z25lZC1vZmYtYnk6IFhpYW9saW4gWmhhbmcgPHhpYW9saW4uemhhbmdAaW50ZWwuY29tPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9rdm1ndC5jIHwgMTIgKysrKysrKysrKysrCiAxIGZp
bGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2d2dC9rdm1ndC5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2t2bWd0LmMKaW5k
ZXggYTY4YWRkZi4uNGE3Y2Y4NiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0
L2t2bWd0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2t2bWd0LmMKQEAgLTE5MTEs
NiArMTkxMSwxOCBAQCBzdGF0aWMgaW50IGt2bWd0X2RtYV9tYXBfZ3Vlc3RfcGFnZSh1bnNpZ25l
ZCBsb25nIGhhbmRsZSwgdW5zaWduZWQgbG9uZyBnZm4sCiAJCXJldCA9IF9fZ3Z0X2NhY2hlX2Fk
ZChpbmZvLT52Z3B1LCBnZm4sICpkbWFfYWRkciwgc2l6ZSk7CiAJCWlmIChyZXQpCiAJCQlnb3Rv
IGVycl91bm1hcDsKKwl9IGVsc2UgaWYgKGVudHJ5LT5zaXplICE9IHNpemUpIHsKKwkJLyogdGhl
IHNhbWUgZ2ZuIHdpdGggZGlmZmVyZW50IHNpemU6IHVubWFwIGFuZCByZS1tYXAgKi8KKwkJZ3Z0
X2RtYV91bm1hcF9wYWdlKHZncHUsIGdmbiwgZW50cnktPmRtYV9hZGRyLCBlbnRyeS0+c2l6ZSk7
CisJCV9fZ3Z0X2NhY2hlX3JlbW92ZV9lbnRyeSh2Z3B1LCBlbnRyeSk7CisKKwkJcmV0ID0gZ3Z0
X2RtYV9tYXBfcGFnZSh2Z3B1LCBnZm4sIGRtYV9hZGRyLCBzaXplKTsKKwkJaWYgKHJldCkKKwkJ
CWdvdG8gZXJyX3VubG9jazsKKworCQlyZXQgPSBfX2d2dF9jYWNoZV9hZGQoaW5mby0+dmdwdSwg
Z2ZuLCAqZG1hX2FkZHIsIHNpemUpOworCQlpZiAocmV0KQorCQkJZ290byBlcnJfdW5tYXA7CiAJ
fSBlbHNlIHsKIAkJa3JlZl9nZXQoJmVudHJ5LT5yZWYpOwogCQkqZG1hX2FkZHIgPSBlbnRyeS0+
ZG1hX2FkZHI7Ci0tIAoxLjguMy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
