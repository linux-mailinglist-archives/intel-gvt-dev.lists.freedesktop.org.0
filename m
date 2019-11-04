Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C97EE724
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  4 Nov 2019 19:16:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D5036E7E2;
	Mon,  4 Nov 2019 18:16:04 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E86D6E7E2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  4 Nov 2019 18:16:02 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Nov 2019 10:16:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,267,1569308400"; d="scan'208";a="213614319"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga002.jf.intel.com with ESMTP; 04 Nov 2019 10:16:00 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1iRgtT-0009FR-IK; Tue, 05 Nov 2019 02:15:59 +0800
Date: Tue, 5 Nov 2019 02:15:35 +0800
From: kbuild test robot <lkp@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: [RFC PATCH intel-gvt-linux] drm/i915/xengt: gvt_ctrl_kobj can be
 static
Message-ID: <20191104181535.57gxgsvctmygoqsy@4978f4969bb8>
References: <201911050136.WkzQxVzM%lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <201911050136.WkzQxVzM%lkp@intel.com>
X-Patchwork-Hint: ignore
User-Agent: NeoMutt/20170113 (1.7.2)
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
Cc: kbuild-all@lists.01.org, zhenyu.z.wang@intel.com,
 Pei Zhang <pei.zhang@intel.com>, terrence.xu@intel.com, libo.zhu@intel.com,
 intel-gvt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

CkZpeGVzOiBiYzgyYzBlNjk4MmEgKCJkcm0vaTkxNS94ZW5ndDogeGVuZ3QgbW91ZHVsZSBpbml0
aWFsIGZpbGVzIikKU2lnbmVkLW9mZi1ieToga2J1aWxkIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5j
b20+Ci0tLQogeGVuZ3QuYyB8ICAgMTAgKysrKystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5z
ZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9ndnQveGVuZ3QuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC94ZW5ndC5jCmluZGV4
IDI1MDAyN2UwNGJiMzMuLjg2Njk5YTYxNTg3MDggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2d2dC94ZW5ndC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC94ZW5ndC5j
CkBAIC01NiwxMSArNTYsMTEgQEAgTU9EVUxFX0RFU0NSSVBUSU9OKCJYZW5HVCBtZWRpYXRlZCBw
YXNzdGhyb3VnaCBkcml2ZXIiKTsKIE1PRFVMRV9MSUNFTlNFKCJHUEwiKTsKIE1PRFVMRV9WRVJT
SU9OKCIwLjEiKTsKIAotc3RydWN0IGtvYmplY3QgKmd2dF9jdHJsX2tvYmo7CitzdGF0aWMgc3Ry
dWN0IGtvYmplY3QgKmd2dF9jdHJsX2tvYmo7CiBzdGF0aWMgc3RydWN0IGtzZXQgKmd2dF9rc2V0
Owogc3RhdGljIERFRklORV9NVVRFWChndnRfc3lzZnNfbG9jayk7CiAKLXN0cnVjdCB4ZW5ndF9z
dHJ1Y3QgeGVuZ3RfcHJpdjsKK3N0YXRpYyBzdHJ1Y3QgeGVuZ3Rfc3RydWN0IHhlbmd0X3ByaXY7
CiBjb25zdCBzdHJ1Y3QgaW50ZWxfZ3Z0X29wcyAqaW50ZWxfZ3Z0X29wczsKIAogc3RhdGljIHNz
aXplX3Qga29ial9hdHRyX3Nob3coc3RydWN0IGtvYmplY3QgKmtvYmosIHN0cnVjdCBhdHRyaWJ1
dGUgKmF0dHIsCkBAIC0xMDksNyArMTA5LDcgQEAgc3RhdGljIHN0cnVjdCBhdHRyaWJ1dGUgKnhl
bmd0X3ZtX2F0dHJzW10gPSB7CiAJTlVMTCwgICAvKiBuZWVkIHRvIE5VTEwgdGVybWluYXRlIHRo
ZSBsaXN0IG9mIGF0dHJpYnV0ZXMgKi8KIH07CiAKLWNvbnN0IHN0cnVjdCBzeXNmc19vcHMgeGVu
Z3Rfa29ial9zeXNmc19vcHMgPSB7CitzdGF0aWMgY29uc3Qgc3RydWN0IHN5c2ZzX29wcyB4ZW5n
dF9rb2JqX3N5c2ZzX29wcyA9IHsKIAkuc2hvdyAgID0ga29ial9hdHRyX3Nob3csCiAJLnN0b3Jl
ICA9IGtvYmpfYXR0cl9zdG9yZSwKIH07CkBAIC0yNzEsNyArMjcxLDcgQEAgc3RhdGljIHNzaXpl
X3QgeGVuZ3Rfc3lzZnNfaW5zdGFuY2VfbWFuYWdlKHN0cnVjdCBrb2JqZWN0ICprb2JqLAogCXJl
dHVybiByYyA8IDAgPyByYyA6IGNvdW50OwogfQogCi1pbnQgeGVuZ3Rfc3lzZnNfaW5pdChzdHJ1
Y3QgaW50ZWxfZ3Z0ICpndnQpCitzdGF0aWMgaW50IHhlbmd0X3N5c2ZzX2luaXQoc3RydWN0IGlu
dGVsX2d2dCAqZ3Z0KQogewogCWludCByZXQ7CiAKQEAgLTMxMCw3ICszMTAsNyBAQCBpbnQgeGVu
Z3Rfc3lzZnNfaW5pdChzdHJ1Y3QgaW50ZWxfZ3Z0ICpndnQpCiAJcmV0dXJuIHJldDsKIH0KIAot
dm9pZCB4ZW5ndF9zeXNmc19kZWwodm9pZCkKK3N0YXRpYyB2b2lkIHhlbmd0X3N5c2ZzX2RlbCh2
b2lkKQogewogCWtvYmplY3RfcHV0KGd2dF9jdHJsX2tvYmopOwogCWtzZXRfdW5yZWdpc3Rlcihn
dnRfa3NldCk7Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50
ZWwtZ3Z0LWRldg==
