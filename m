Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9C7ECDB
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 30 Apr 2019 00:40:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80E6289358;
	Mon, 29 Apr 2019 22:40:25 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A679E89358
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 29 Apr 2019 22:40:24 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Apr 2019 15:40:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,411,1549958400"; d="scan'208";a="166070697"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by fmsmga002.fm.intel.com with ESMTP; 29 Apr 2019 15:40:22 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1hLEwg-0001eO-CY; Tue, 30 Apr 2019 06:40:22 +0800
Date: Tue, 30 Apr 2019 06:40:20 +0800
From: kbuild test robot <lkp@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: [RFC PATCH intel-gvt-linux] drm/i915/gvt: vReg_ops can be static
Message-ID: <20190429224020.GA55215@lkp-kbuild20>
References: <201904300647.pJcPIc7o%lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <201904300647.pJcPIc7o%lkp@intel.com>
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.5.23 (2014-03-12)
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
 libo.zhu@intel.com, intel-gvt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

CkZpeGVzOiBmMDBlMTJhNzAzYTkgKCJkcm0vaTkxNS9ndnQ6IEltcGxlbWVudCB2R1BVIHN0YXR1
cyBzYXZlIGFuZCByZXN0b3JlIHRocm91Z2ggbmV3IFZGSU8gc3VicmVnaW9uIFZGSU9fUkVHSU9O
X1NVQlRZUEVfREVWSUNFX1NUQVRFIikKU2lnbmVkLW9mZi1ieToga2J1aWxkIHRlc3Qgcm9ib3Qg
PGxrcEBpbnRlbC5jb20+Ci0tLQogbWlncmF0ZS5jIHwgICAxMiArKysrKystLS0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L21pZ3JhdGUuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2d2dC9taWdyYXRlLmMKaW5kZXggNjhkNDM3OC4uYjcyMGRhNSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZ3Z0L21pZ3JhdGUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9n
dnQvbWlncmF0ZS5jCkBAIC03OCw3ICs3OCw3IEBAIHN0YXRpYyBpbnQgcHBndHRfc2F2ZShjb25z
dCBzdHJ1Y3QgZ3Z0X21pZ3JhdGlvbl9vYmpfdCAqb2JqKTsKIC8qKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKgogICogSW50ZXJuYWwgU3RhdGljIEZ1bmN0aW9u
cwogICoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqLwotc3Ry
dWN0IGd2dF9taWdyYXRpb25fb3BlcmF0aW9uX3QgdlJlZ19vcHMgPSB7CitzdGF0aWMgc3RydWN0
IGd2dF9taWdyYXRpb25fb3BlcmF0aW9uX3QgdlJlZ19vcHMgPSB7CiAJLnByZV9jb3B5ID0gTlVM
TCwKIAkucHJlX3NhdmUgPSB2cmVnX3NhdmUsCiAJLnByZV9sb2FkID0gdnJlZ19sb2FkLApAQCAt
OTIsMzUgKzkyLDM1IEBAIHN0cnVjdCBndnRfbWlncmF0aW9uX29wZXJhdGlvbl90IHNSZWdfb3Bz
ID0gewogCS5wb3N0X2xvYWQgPSBOVUxMLAogfTsKIAotc3RydWN0IGd2dF9taWdyYXRpb25fb3Bl
cmF0aW9uX3QgdmNmZ19zcGFjZV9vcHMgPSB7CitzdGF0aWMgc3RydWN0IGd2dF9taWdyYXRpb25f
b3BlcmF0aW9uX3QgdmNmZ19zcGFjZV9vcHMgPSB7CiAJLnByZV9jb3B5ID0gTlVMTCwKIAkucHJl
X3NhdmUgPSB2Y2ZnX3NwYWNlX3NhdmUsCiAJLnByZV9sb2FkID0gdmNmZ19zcGFjZV9sb2FkLAog
CS5wb3N0X2xvYWQgPSBOVUxMLAogfTsKIAotc3RydWN0IGd2dF9taWdyYXRpb25fb3BlcmF0aW9u
X3Qgdmd0dF9pbmZvX29wcyA9IHsKK3N0YXRpYyBzdHJ1Y3QgZ3Z0X21pZ3JhdGlvbl9vcGVyYXRp
b25fdCB2Z3R0X2luZm9fb3BzID0gewogCS5wcmVfY29weSA9IE5VTEwsCiAJLnByZV9zYXZlID0g
dmdndHRfc2F2ZSwKIAkucHJlX2xvYWQgPSB2Z2d0dF9sb2FkLAogCS5wb3N0X2xvYWQgPSBOVUxM
LAogfTsKIAotc3RydWN0IGd2dF9taWdyYXRpb25fb3BlcmF0aW9uX3QgaW1hZ2VfaGVhZGVyX29w
cyA9IHsKK3N0YXRpYyBzdHJ1Y3QgZ3Z0X21pZ3JhdGlvbl9vcGVyYXRpb25fdCBpbWFnZV9oZWFk
ZXJfb3BzID0gewogCS5wcmVfY29weSA9IE5VTEwsCiAJLnByZV9zYXZlID0gaW1hZ2VfaGVhZGVy
X3NhdmUsCiAJLnByZV9sb2FkID0gaW1hZ2VfaGVhZGVyX2xvYWQsCiAJLnBvc3RfbG9hZCA9IE5V
TEwsCiB9OwogCi1zdHJ1Y3QgZ3Z0X21pZ3JhdGlvbl9vcGVyYXRpb25fdCB3b3JrbG9hZF9vcHMg
PSB7CitzdGF0aWMgc3RydWN0IGd2dF9taWdyYXRpb25fb3BlcmF0aW9uX3Qgd29ya2xvYWRfb3Bz
ID0gewogCS5wcmVfY29weSA9IE5VTEwsCiAJLnByZV9zYXZlID0gd29ya2xvYWRfc2F2ZSwKIAku
cHJlX2xvYWQgPSB3b3JrbG9hZF9sb2FkLAogCS5wb3N0X2xvYWQgPSBOVUxMLAogfTsKIAotc3Ry
dWN0IGd2dF9taWdyYXRpb25fb3BlcmF0aW9uX3QgcHBndHRfb3BzID0geworc3RhdGljIHN0cnVj
dCBndnRfbWlncmF0aW9uX29wZXJhdGlvbl90IHBwZ3R0X29wcyA9IHsKIAkucHJlX2NvcHkgPSBO
VUxMLAogCS5wcmVfc2F2ZSA9IHBwZ3R0X3NhdmUsCiAJLnByZV9sb2FkID0gcHBndHRfbG9hZCwK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
