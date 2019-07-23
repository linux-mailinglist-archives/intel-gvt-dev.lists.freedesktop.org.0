Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FAF7100B
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 23 Jul 2019 05:25:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1D8989D63;
	Tue, 23 Jul 2019 03:25:21 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E163089D63
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 23 Jul 2019 03:25:20 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jul 2019 20:25:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,297,1559545200"; d="scan'208";a="196968586"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by fmsmga002.fm.intel.com with ESMTP; 22 Jul 2019 20:25:18 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1hplQU-000BKr-AZ; Tue, 23 Jul 2019 11:25:18 +0800
Date: Tue, 23 Jul 2019 11:24:38 +0800
From: kbuild test robot <lkp@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: [RFC PATCH intel-gvt-linux] drm/i915/gvt: vReg_ops can be static
Message-ID: <20190723032438.ugwtbzqk34ercin6@3334de2dbac0>
References: <201907231140.vvkJxsTH%lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <201907231140.vvkJxsTH%lkp@intel.com>
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
Cc: zhenyu.z.wang@intel.com, Xiao Zheng <xiao.zheng@intel.com>,
 Yulei Zhang <yulei.zhang@intel.com>, terrence.xu@intel.com, kbuild-all@01.org,
 Xiong Zhang <xiong.y.zhang@intel.com>, libo.zhu@intel.com,
 intel-gvt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

CkZpeGVzOiBlOWMxNmY5ZTc2YTcgKCJkcm0vaTkxNS9ndnQ6IEltcGxlbWVudCB2R1BVIHN0YXR1
cyBzYXZlIGFuZCByZXN0b3JlIHRocm91Z2ggbmV3IFZGSU8gc3VicmVnaW9uIFZGSU9fUkVHSU9O
X1NVQlRZUEVfREVWSUNFX1NUQVRFIikKU2lnbmVkLW9mZi1ieToga2J1aWxkIHRlc3Qgcm9ib3Qg
PGxrcEBpbnRlbC5jb20+Ci0tLQogbWlncmF0ZS5jIHwgICAxMiArKysrKystLS0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L21pZ3JhdGUuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2d2dC9taWdyYXRlLmMKaW5kZXggNjhkNDM3ODhkNTZmZTkuLmI3MjBkYTU0NmNkMDY2IDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvbWlncmF0ZS5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2d2dC9taWdyYXRlLmMKQEAgLTc4LDcgKzc4LDcgQEAgc3RhdGljIGludCBw
cGd0dF9zYXZlKGNvbnN0IHN0cnVjdCBndnRfbWlncmF0aW9uX29ial90ICpvYmopOwogLyoqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqCiAgKiBJbnRlcm5hbCBT
dGF0aWMgRnVuY3Rpb25zCiAgKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKiovCi1zdHJ1Y3QgZ3Z0X21pZ3JhdGlvbl9vcGVyYXRpb25fdCB2UmVnX29wcyA9IHsK
K3N0YXRpYyBzdHJ1Y3QgZ3Z0X21pZ3JhdGlvbl9vcGVyYXRpb25fdCB2UmVnX29wcyA9IHsKIAku
cHJlX2NvcHkgPSBOVUxMLAogCS5wcmVfc2F2ZSA9IHZyZWdfc2F2ZSwKIAkucHJlX2xvYWQgPSB2
cmVnX2xvYWQsCkBAIC05MiwzNSArOTIsMzUgQEAgc3RydWN0IGd2dF9taWdyYXRpb25fb3BlcmF0
aW9uX3Qgc1JlZ19vcHMgPSB7CiAJLnBvc3RfbG9hZCA9IE5VTEwsCiB9OwogCi1zdHJ1Y3QgZ3Z0
X21pZ3JhdGlvbl9vcGVyYXRpb25fdCB2Y2ZnX3NwYWNlX29wcyA9IHsKK3N0YXRpYyBzdHJ1Y3Qg
Z3Z0X21pZ3JhdGlvbl9vcGVyYXRpb25fdCB2Y2ZnX3NwYWNlX29wcyA9IHsKIAkucHJlX2NvcHkg
PSBOVUxMLAogCS5wcmVfc2F2ZSA9IHZjZmdfc3BhY2Vfc2F2ZSwKIAkucHJlX2xvYWQgPSB2Y2Zn
X3NwYWNlX2xvYWQsCiAJLnBvc3RfbG9hZCA9IE5VTEwsCiB9OwogCi1zdHJ1Y3QgZ3Z0X21pZ3Jh
dGlvbl9vcGVyYXRpb25fdCB2Z3R0X2luZm9fb3BzID0geworc3RhdGljIHN0cnVjdCBndnRfbWln
cmF0aW9uX29wZXJhdGlvbl90IHZndHRfaW5mb19vcHMgPSB7CiAJLnByZV9jb3B5ID0gTlVMTCwK
IAkucHJlX3NhdmUgPSB2Z2d0dF9zYXZlLAogCS5wcmVfbG9hZCA9IHZnZ3R0X2xvYWQsCiAJLnBv
c3RfbG9hZCA9IE5VTEwsCiB9OwogCi1zdHJ1Y3QgZ3Z0X21pZ3JhdGlvbl9vcGVyYXRpb25fdCBp
bWFnZV9oZWFkZXJfb3BzID0geworc3RhdGljIHN0cnVjdCBndnRfbWlncmF0aW9uX29wZXJhdGlv
bl90IGltYWdlX2hlYWRlcl9vcHMgPSB7CiAJLnByZV9jb3B5ID0gTlVMTCwKIAkucHJlX3NhdmUg
PSBpbWFnZV9oZWFkZXJfc2F2ZSwKIAkucHJlX2xvYWQgPSBpbWFnZV9oZWFkZXJfbG9hZCwKIAku
cG9zdF9sb2FkID0gTlVMTCwKIH07CiAKLXN0cnVjdCBndnRfbWlncmF0aW9uX29wZXJhdGlvbl90
IHdvcmtsb2FkX29wcyA9IHsKK3N0YXRpYyBzdHJ1Y3QgZ3Z0X21pZ3JhdGlvbl9vcGVyYXRpb25f
dCB3b3JrbG9hZF9vcHMgPSB7CiAJLnByZV9jb3B5ID0gTlVMTCwKIAkucHJlX3NhdmUgPSB3b3Jr
bG9hZF9zYXZlLAogCS5wcmVfbG9hZCA9IHdvcmtsb2FkX2xvYWQsCiAJLnBvc3RfbG9hZCA9IE5V
TEwsCiB9OwogCi1zdHJ1Y3QgZ3Z0X21pZ3JhdGlvbl9vcGVyYXRpb25fdCBwcGd0dF9vcHMgPSB7
CitzdGF0aWMgc3RydWN0IGd2dF9taWdyYXRpb25fb3BlcmF0aW9uX3QgcHBndHRfb3BzID0gewog
CS5wcmVfY29weSA9IE5VTEwsCiAJLnByZV9zYXZlID0gcHBndHRfc2F2ZSwKIAkucHJlX2xvYWQg
PSBwcGd0dF9sb2FkLApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2ludGVsLWd2dC1kZXY=
