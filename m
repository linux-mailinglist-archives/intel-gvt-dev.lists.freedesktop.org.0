Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C743C10E638
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  2 Dec 2019 08:01:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A33C89F85;
	Mon,  2 Dec 2019 07:01:24 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29FB789F63
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  2 Dec 2019 07:01:22 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Dec 2019 23:01:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,268,1571727600"; d="scan'208";a="208029739"
Received: from debian-nuc.sh.intel.com ([10.239.160.63])
 by fmsmga007.fm.intel.com with ESMTP; 01 Dec 2019 23:01:19 -0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH 3/3] drm/i915/gvt: Enable vfio edid for all GVT supported
 platform
Date: Mon,  2 Dec 2019 15:01:09 +0800
Message-Id: <20191202070109.73924-3-zhenyuw@linux.intel.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191202070109.73924-1-zhenyuw@linux.intel.com>
References: <20191202070109.73924-1-zhenyuw@linux.intel.com>
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
Cc: Hang Yuan <hang.yuan@linux.intel.com>, Fred Gao <fred.gao@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

QWxsIEdWVCBzdXBwb3J0ZWQgcGxhdGZvcm0gaGFzIHZpcnR1YWwgZGlzcGxheSB3aGljaCBzaG91
bGQgYmUKYWJsZSB0byBoYW5kbGUgVkZJTyBlZGlkIHJlZ2lvbi4gRW5hYmxlIHRoaXMgZm9yIGFs
bCBzdXBwb3J0ZWQgcGxhdGZvcm0uCgpDYzogSGFuZyBZdWFuIDxoYW5nLnl1YW5AbGludXguaW50
ZWwuY29tPgpDYzogRnJlZCBHYW8gPGZyZWQuZ2FvQGludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTog
Wmhlbnl1IFdhbmcgPHpoZW55dXdAbGludXguaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2d2dC92Z3B1LmMgfCA0ICstLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQv
dmdwdS5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3ZncHUuYwppbmRleCA4NWJkOWJmNGY2
ZWUuLjFlMDg2NTkwNTEzNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3Zn
cHUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvdmdwdS5jCkBAIC00MjYsOSArNDI2
LDcgQEAgc3RhdGljIHN0cnVjdCBpbnRlbF92Z3B1ICpfX2ludGVsX2d2dF9jcmVhdGVfdmdwdShz
dHJ1Y3QgaW50ZWxfZ3Z0ICpndnQsCiAJaWYgKHJldCkKIAkJZ290byBvdXRfY2xlYW5fc2NoZWRf
cG9saWN5OwogCi0JLypUT0RPOiBhZGQgbW9yZSBwbGF0Zm9ybXMgc3VwcG9ydCAqLwotCWlmIChJ
U19TS1lMQUtFKGd2dC0+ZGV2X3ByaXYpIHx8IElTX0tBQllMQUtFKGd2dC0+ZGV2X3ByaXYpKQot
CQlyZXQgPSBpbnRlbF9ndnRfaHlwZXJ2aXNvcl9zZXRfZWRpZCh2Z3B1LCBQT1JUX0QpOworCXJl
dCA9IGludGVsX2d2dF9oeXBlcnZpc29yX3NldF9lZGlkKHZncHUsIFBPUlRfRCk7CiAJaWYgKHJl
dCkKIAkJZ290byBvdXRfY2xlYW5fc2NoZWRfcG9saWN5OwogCi0tIAoyLjI0LjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFp
bGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
