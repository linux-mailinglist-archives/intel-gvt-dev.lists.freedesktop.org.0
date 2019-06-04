Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC153439E
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  4 Jun 2019 12:01:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E15ED8972B;
	Tue,  4 Jun 2019 10:01:23 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FA2D89728
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  4 Jun 2019 10:01:22 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Jun 2019 03:01:22 -0700
X-ExtLoop1: 1
Received: from gvt.bj.intel.com ([10.238.158.187])
 by orsmga005.jf.intel.com with ESMTP; 04 Jun 2019 03:01:19 -0700
From: Tina Zhang <tina.zhang@intel.com>
To: intel-gvt-dev@lists.freedesktop.org, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 3/3] drm/i915/gvt: Send plane flip events to user space
Date: Tue,  4 Jun 2019 17:55:34 +0800
Message-Id: <20190604095534.10337-4-tina.zhang@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190604095534.10337-1-tina.zhang@intel.com>
References: <20190604095534.10337-1-tina.zhang@intel.com>
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
Cc: kevin.tian@intel.com, zhenyuw@linux.intel.com,
 Tina Zhang <tina.zhang@intel.com>, alex.williamson@redhat.com,
 zhiyuan.lv@intel.com, hang.yuan@intel.com, zhi.a.wang@intel.com,
 kraxel@redhat.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

U2VuZCB0aGUgcHJpbWFyeSBwbGFuZSBhbmQgdGhlIGN1cnNvciBwbGFuZSBmbGlwIGV2ZW50cyB0
byB1c2VyIHNwYWNlLgoKU2lnbmVkLW9mZi1ieTogVGluYSBaaGFuZyA8dGluYS56aGFuZ0BpbnRl
bC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRsZXJzLmMgfCAyMCArKysr
KysrKysrKysrKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDMgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRsZXJz
LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaGFuZGxlcnMuYwppbmRleCAxOGYwMWVlYjI1
MTAuLjY3MTI5ZGU4YmM0NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2hh
bmRsZXJzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRsZXJzLmMKQEAgLTc2
Myw2ICs3NjMsMjAgQEAgc3RhdGljIGludCBwcmlfc3VyZl9tbWlvX3dyaXRlKHN0cnVjdCBpbnRl
bF92Z3B1ICp2Z3B1LCB1bnNpZ25lZCBpbnQgb2Zmc2V0LAogCWVsc2UKIAkJc2V0X2JpdChldmVu
dCwgdmdwdS0+aXJxLmZsaXBfZG9uZV9ldmVudFtwaXBlXSk7CiAKKwlpZiAodmdwdS0+dmRldi5w
cmlfZmxpcF90cmlnZ2VyKQorCQlldmVudGZkX3NpZ25hbCh2Z3B1LT52ZGV2LnByaV9mbGlwX3Ry
aWdnZXIsIDEpOworCisJcmV0dXJuIDA7Cit9CisKK3N0YXRpYyBpbnQgY3VyX3N1cmZfbW1pb193
cml0ZShzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSwgdW5zaWduZWQgaW50IG9mZnNldCwKKwkJdm9p
ZCAqcF9kYXRhLCB1bnNpZ25lZCBpbnQgYnl0ZXMpCit7CisJd3JpdGVfdnJlZyh2Z3B1LCBvZmZz
ZXQsIHBfZGF0YSwgYnl0ZXMpOworCisJaWYgKHZncHUtPnZkZXYuY3VyX2ZsaXBfdHJpZ2dlcikK
KwkJZXZlbnRmZF9zaWduYWwodmdwdS0+dmRldi5jdXJfZmxpcF90cmlnZ2VyLCAxKTsKKwogCXJl
dHVybiAwOwogfQogCkBAIC0xOTY5LDkgKzE5ODMsOSBAQCBzdGF0aWMgaW50IGluaXRfZ2VuZXJp
Y19tbWlvX2luZm8oc3RydWN0IGludGVsX2d2dCAqZ3Z0KQogCU1NSU9fRChDVVJQT1MoUElQRV9C
KSwgRF9BTEwpOwogCU1NSU9fRChDVVJQT1MoUElQRV9DKSwgRF9BTEwpOwogCi0JTU1JT19EKENV
UkJBU0UoUElQRV9BKSwgRF9BTEwpOwotCU1NSU9fRChDVVJCQVNFKFBJUEVfQiksIERfQUxMKTsK
LQlNTUlPX0QoQ1VSQkFTRShQSVBFX0MpLCBEX0FMTCk7CisJTU1JT19ESChDVVJCQVNFKFBJUEVf
QSksIERfQUxMLCBOVUxMLCBjdXJfc3VyZl9tbWlvX3dyaXRlKTsKKwlNTUlPX0RIKENVUkJBU0Uo
UElQRV9CKSwgRF9BTEwsIE5VTEwsIGN1cl9zdXJmX21taW9fd3JpdGUpOworCU1NSU9fREgoQ1VS
QkFTRShQSVBFX0MpLCBEX0FMTCwgTlVMTCwgY3VyX3N1cmZfbW1pb193cml0ZSk7CiAKIAlNTUlP
X0QoQ1VSX0ZCQ19DVEwoUElQRV9BKSwgRF9BTEwpOwogCU1NSU9fRChDVVJfRkJDX0NUTChQSVBF
X0IpLCBEX0FMTCk7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
