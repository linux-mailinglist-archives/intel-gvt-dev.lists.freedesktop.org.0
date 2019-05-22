Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B83A025DF5
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 22 May 2019 08:19:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D1E789760;
	Wed, 22 May 2019 06:19:57 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7573989760
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 22 May 2019 06:19:56 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 May 2019 23:19:56 -0700
X-ExtLoop1: 1
Received: from coxu-arch-shz.sh.intel.com ([10.239.160.22])
 by fmsmga001.fm.intel.com with ESMTP; 21 May 2019 23:19:55 -0700
From: Colin Xu <colin.xu@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH] drm/i915/gvt: Return -EINVAL when cmd parser access shadowed
 mmio
Date: Wed, 22 May 2019 14:19:52 +0800
Message-Id: <20190522061952.13821-1-colin.xu@intel.com>
X-Mailer: git-send-email 2.21.0
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
Cc: colin.xu@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Y21kX3JlZ19oYW5kbGVyKCkgZG9lc24ndCBhbGxvdyBhY2Nlc3Mgc2hhZG93ZWQgbW1pbyBidXQg
c3RpbGwgcmV0dXJucyAwLgpSZXR1cm4gLUVJTlZBTCBpbnN0ZWFkIHNvIHRoYXQgY2FsbGVyIGNh
biBoYW5kbGUgcHJvcGVybHkuCgpGaXhlczogYmUxZGE3MDcwYWVhICgiZHJtL2k5MTUvZ3Z0OiB2
R1BVIGNvbW1hbmQgc2Nhbm5lciIpCgpTaWduZWQtb2ZmLWJ5OiBDb2xpbiBYdSA8Y29saW4ueHVA
aW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9jbWRfcGFyc2VyLmMgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvY21kX3BhcnNlci5jIGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZ3Z0L2NtZF9wYXJzZXIuYwppbmRleCA1Y2I1OWMwYjRiYmUuLmM1MGVmMjA1
MzI1YyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2NtZF9wYXJzZXIuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvY21kX3BhcnNlci5jCkBAIC04NzgsNyArODc4
LDcgQEAgc3RhdGljIGludCBjbWRfcmVnX2hhbmRsZXIoc3RydWN0IHBhcnNlcl9leGVjX3N0YXRl
ICpzLAogCiAJaWYgKGlzX3NoYWRvd2VkX21taW8ob2Zmc2V0KSkgewogCQlndnRfdmdwdV9lcnIo
ImZvdW5kIGFjY2VzcyBvZiBzaGFkb3dlZCBNTUlPICV4XG4iLCBvZmZzZXQpOwotCQlyZXR1cm4g
MDsKKwkJcmV0dXJuIC1FSU5WQUw7CiAJfQogCiAJaWYgKGlzX21vY3NfbW1pbyhvZmZzZXQpICYm
Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
aW50ZWwtZ3Z0LWRldg==
