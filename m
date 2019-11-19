Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4CD10117A
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 19 Nov 2019 03:53:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6343A6E06E;
	Tue, 19 Nov 2019 02:53:40 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88E286E06E
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 19 Nov 2019 02:53:39 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Nov 2019 18:53:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,322,1569308400"; d="scan'208";a="218102016"
Received: from dp7efi.sh.intel.com ([10.239.153.14])
 by orsmga002.jf.intel.com with ESMTP; 18 Nov 2019 18:53:38 -0800
From: Liu Xinyun <xinyun.liu@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH] drm/i915/gvt: remove duplicated return
Date: Tue, 19 Nov 2019 18:51:50 +0800
Message-Id: <20191119105150.12308-1-xinyun.liu@intel.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Y2xlYW4gdXAgdW5uZWNlc3NhcnkgcmV0dXJuIGNhc2UKClNpZ25lZC1vZmYtYnk6IExpdSBYaW55
dW4gPHhpbnl1bi5saXVAaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9n
dHQuYyB8IDMgKy0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5jIGIvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5jCmluZGV4IDRiMDRhZjU2OWMwNS4uNDM1MmE0MTBhNGQw
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5jCkBAIC03ODgsOCArNzg4LDcgQEAgc3RhdGljIGludCBw
cGd0dF93cml0ZV9wcm90ZWN0aW9uX2hhbmRsZXIoCiAJCXJldHVybiAtRUlOVkFMOwogCiAJcmV0
ID0gcHBndHRfaGFuZGxlX2d1ZXN0X3dyaXRlX3BhZ2VfdGFibGVfYnl0ZXMoc3B0LCBncGEsIGRh
dGEsIGJ5dGVzKTsKLQlpZiAocmV0KQotCQlyZXR1cm4gcmV0OworCiAJcmV0dXJuIHJldDsKIH0K
IAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2ludGVsLWd2dC1kZXY=
