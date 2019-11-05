Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6697CEF3CA
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  5 Nov 2019 04:07:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29AFD6E8DD;
	Tue,  5 Nov 2019 03:07:16 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF8A26E8DD
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  5 Nov 2019 03:07:14 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Nov 2019 19:07:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,269,1569308400"; d="scan'208";a="212445335"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by fmsmga001.fm.intel.com with ESMTP; 04 Nov 2019 19:07:12 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1iRpBY-00010U-0o; Tue, 05 Nov 2019 11:07:12 +0800
Date: Tue, 5 Nov 2019 11:06:15 +0800
From: kbuild test robot <lkp@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: [RFC PATCH intel-gvt-linux] drm/i915/gvt: vReg_ops can be static
Message-ID: <20191105030615.rqt4qclalwspranc@4978f4969bb8>
References: <201911051044.9vooUGHu%lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <201911051044.9vooUGHu%lkp@intel.com>
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
 Xiao Zheng <xiao.zheng@intel.com>, Yulei Zhang <yulei.zhang@intel.com>,
 terrence.xu@intel.com, libo.zhu@intel.com, intel-gvt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

CkZpeGVzOiA0MGU5NTA4MWJjNGMgKCJkcm0vaTkxNS9ndnQ6IEltcGxlbWVudCB2R1BVIHN0YXR1
cyBzYXZlIGFuZCByZXN0b3JlIHRocm91Z2ggbmV3IFZGSU8gc3VicmVnaW9uIFZGSU9fUkVHSU9O
X1NVQlRZUEVfREVWSUNFX1NUQVRFIikKU2lnbmVkLW9mZi1ieToga2J1aWxkIHRlc3Qgcm9ib3Qg
PGxrcEBpbnRlbC5jb20+Ci0tLQogbWlncmF0ZS5jIHwgICAxMiArKysrKystLS0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L21pZ3JhdGUuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2d2dC9taWdyYXRlLmMKaW5kZXggNjhkNDM3ODhkNTZmZS4uYjcyMGRhNTQ2Y2QwNiAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L21pZ3JhdGUuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9ndnQvbWlncmF0ZS5jCkBAIC03OCw3ICs3OCw3IEBAIHN0YXRpYyBpbnQgcHBn
dHRfc2F2ZShjb25zdCBzdHJ1Y3QgZ3Z0X21pZ3JhdGlvbl9vYmpfdCAqb2JqKTsKIC8qKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKgogICogSW50ZXJuYWwgU3Rh
dGljIEZ1bmN0aW9ucwogICoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqLwotc3RydWN0IGd2dF9taWdyYXRpb25fb3BlcmF0aW9uX3QgdlJlZ19vcHMgPSB7Citz
dGF0aWMgc3RydWN0IGd2dF9taWdyYXRpb25fb3BlcmF0aW9uX3QgdlJlZ19vcHMgPSB7CiAJLnBy
ZV9jb3B5ID0gTlVMTCwKIAkucHJlX3NhdmUgPSB2cmVnX3NhdmUsCiAJLnByZV9sb2FkID0gdnJl
Z19sb2FkLApAQCAtOTIsMzUgKzkyLDM1IEBAIHN0cnVjdCBndnRfbWlncmF0aW9uX29wZXJhdGlv
bl90IHNSZWdfb3BzID0gewogCS5wb3N0X2xvYWQgPSBOVUxMLAogfTsKIAotc3RydWN0IGd2dF9t
aWdyYXRpb25fb3BlcmF0aW9uX3QgdmNmZ19zcGFjZV9vcHMgPSB7CitzdGF0aWMgc3RydWN0IGd2
dF9taWdyYXRpb25fb3BlcmF0aW9uX3QgdmNmZ19zcGFjZV9vcHMgPSB7CiAJLnByZV9jb3B5ID0g
TlVMTCwKIAkucHJlX3NhdmUgPSB2Y2ZnX3NwYWNlX3NhdmUsCiAJLnByZV9sb2FkID0gdmNmZ19z
cGFjZV9sb2FkLAogCS5wb3N0X2xvYWQgPSBOVUxMLAogfTsKIAotc3RydWN0IGd2dF9taWdyYXRp
b25fb3BlcmF0aW9uX3Qgdmd0dF9pbmZvX29wcyA9IHsKK3N0YXRpYyBzdHJ1Y3QgZ3Z0X21pZ3Jh
dGlvbl9vcGVyYXRpb25fdCB2Z3R0X2luZm9fb3BzID0gewogCS5wcmVfY29weSA9IE5VTEwsCiAJ
LnByZV9zYXZlID0gdmdndHRfc2F2ZSwKIAkucHJlX2xvYWQgPSB2Z2d0dF9sb2FkLAogCS5wb3N0
X2xvYWQgPSBOVUxMLAogfTsKIAotc3RydWN0IGd2dF9taWdyYXRpb25fb3BlcmF0aW9uX3QgaW1h
Z2VfaGVhZGVyX29wcyA9IHsKK3N0YXRpYyBzdHJ1Y3QgZ3Z0X21pZ3JhdGlvbl9vcGVyYXRpb25f
dCBpbWFnZV9oZWFkZXJfb3BzID0gewogCS5wcmVfY29weSA9IE5VTEwsCiAJLnByZV9zYXZlID0g
aW1hZ2VfaGVhZGVyX3NhdmUsCiAJLnByZV9sb2FkID0gaW1hZ2VfaGVhZGVyX2xvYWQsCiAJLnBv
c3RfbG9hZCA9IE5VTEwsCiB9OwogCi1zdHJ1Y3QgZ3Z0X21pZ3JhdGlvbl9vcGVyYXRpb25fdCB3
b3JrbG9hZF9vcHMgPSB7CitzdGF0aWMgc3RydWN0IGd2dF9taWdyYXRpb25fb3BlcmF0aW9uX3Qg
d29ya2xvYWRfb3BzID0gewogCS5wcmVfY29weSA9IE5VTEwsCiAJLnByZV9zYXZlID0gd29ya2xv
YWRfc2F2ZSwKIAkucHJlX2xvYWQgPSB3b3JrbG9hZF9sb2FkLAogCS5wb3N0X2xvYWQgPSBOVUxM
LAogfTsKIAotc3RydWN0IGd2dF9taWdyYXRpb25fb3BlcmF0aW9uX3QgcHBndHRfb3BzID0gewor
c3RhdGljIHN0cnVjdCBndnRfbWlncmF0aW9uX29wZXJhdGlvbl90IHBwZ3R0X29wcyA9IHsKIAku
cHJlX2NvcHkgPSBOVUxMLAogCS5wcmVfc2F2ZSA9IHBwZ3R0X3NhdmUsCiAJLnByZV9sb2FkID0g
cHBndHRfbG9hZCwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9p
bnRlbC1ndnQtZGV2
