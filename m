Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD731DD93
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 29 Apr 2019 10:19:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B3AE89070;
	Mon, 29 Apr 2019 08:19:28 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99D5789070
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 29 Apr 2019 08:19:26 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Apr 2019 01:19:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,409,1549958400"; d="scan'208";a="139703489"
Received: from joy-optiplex-7040.sh.intel.com ([10.239.13.9])
 by orsmga006.jf.intel.com with ESMTP; 29 Apr 2019 01:19:25 -0700
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v3 3/4] drm/i915/gvt: add 0x4dfc to gen9 save-restore list
Date: Mon, 29 Apr 2019 04:13:49 -0400
Message-Id: <20190429081349.15523-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190429081309.15428-1-yan.y.zhao@intel.com>
References: <20190429081309.15428-1-yan.y.zhao@intel.com>
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
Cc: Yan Zhao <yan.y.zhao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

MHg0ZGZjIGlzIGluLWNvbnRleHQgbW1pbyBmb3IgZ2VuOSssIGJ1dCBlYWNoIHZtIGhhdmUgZGlm
ZmVyZW50IHNldHRpbmdzCm5lZWQgdG8gYWRkIGl0IHRvIHNhdmUtcmVzdG9yZSBsaXN0IGFsb25n
IHdpdGggb3RoZXIgdHJ0dCByZWdpc3RlcnMKCnYzOiBhZGQgZml4ZXMgdGFnICh6aGVueXUpCgpG
aXhlczogMTc4NjU3MTM5MzA3ICgiZHJtL2k5MTUvZ3Z0OiB2R1BVIGNvbnRleHQgc3dpdGNoIikK
U2lnbmVkLW9mZi1ieTogWWFuIFpoYW8gPHlhbi55LnpoYW9AaW50ZWwuY29tPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9pOTE1L2d2dC9tbWlvX2NvbnRleHQuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L21t
aW9fY29udGV4dC5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L21taW9fY29udGV4dC5jCmlu
ZGV4IGRhYWU1ODE5MmMyOC4uOGNmNzI2NDlmNjhiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9ndnQvbW1pb19jb250ZXh0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0
L21taW9fY29udGV4dC5jCkBAIC0xMTQsNiArMTE0LDcgQEAgc3RhdGljIHN0cnVjdCBlbmdpbmVf
bW1pbyBnZW45X2VuZ2luZV9tbWlvX2xpc3RbXSBfX2NhY2hlbGluZV9hbGlnbmVkID0gewogCXtS
Q1MwLCBUUklOVlRJTEVERVRDVCwgMCwgdHJ1ZX0sIC8qIDB4NGRlYyAqLwogCXtSQ1MwLCBUUlZB
RFIsIDAsIHRydWV9LCAvKiAweDRkZjAgKi8KIAl7UkNTMCwgVFJUVEUsIDAsIHRydWV9LCAvKiAw
eDRkZjQgKi8KKwl7UkNTMCwgX01NSU8oMHg0ZGZjKSwgMCwgdHJ1ZX0sCiAKIAl7QkNTMCwgUklO
R19HRlhfTU9ERShCTFRfUklOR19CQVNFKSwgMHhmZmZmLCBmYWxzZX0sIC8qIDB4MjIyOWMgKi8K
IAl7QkNTMCwgUklOR19NSV9NT0RFKEJMVF9SSU5HX0JBU0UpLCAweGZmZmYsIGZhbHNlfSwgLyog
MHgyMjA5YyAqLwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
