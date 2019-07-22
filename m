Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D52C70CEB
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 23 Jul 2019 01:03:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C42F089E98;
	Mon, 22 Jul 2019 23:03:14 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6245589E98
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 22 Jul 2019 23:03:13 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jul 2019 16:01:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,296,1559545200"; d="scan'208";a="180547418"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga002.jf.intel.com with ESMTP; 22 Jul 2019 16:01:43 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1hphJO-0007c9-Qt; Tue, 23 Jul 2019 07:01:42 +0800
Date: Tue, 23 Jul 2019 07:01:22 +0800
From: kbuild test robot <lkp@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: [RFC PATCH intel-gvt-linux] drm/i915/xengt: gvt_ctrl_kobj can be
 static
Message-ID: <20190722230122.rnk37nvni6vhgc62@3334de2dbac0>
References: <201907230621.AwpnivXP%lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <201907230621.AwpnivXP%lkp@intel.com>
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
Cc: zhenyu.z.wang@intel.com, Pei Zhang <pei.zhang@intel.com>,
 terrence.xu@intel.com, kbuild-all@01.org,
 Xiong Zhang <xiong.y.zhang@intel.com>, libo.zhu@intel.com,
 intel-gvt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

CkZpeGVzOiA4NTY4YzEyYzMwOGMgKCJkcm0vaTkxNS94ZW5ndDogeGVuZ3QgbW91ZHVsZSBpbml0
aWFsIGZpbGVzIikKU2lnbmVkLW9mZi1ieToga2J1aWxkIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5j
b20+Ci0tLQogeGVuZ3QuYyB8ICAgMTAgKysrKystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5z
ZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9ndnQveGVuZ3QuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC94ZW5ndC5jCmluZGV4
IDI1MDAyN2UwNGJiMzM4Li44NjY5OWE2MTU4NzA4MSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZ3Z0L3hlbmd0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3hlbmd0
LmMKQEAgLTU2LDExICs1NiwxMSBAQCBNT0RVTEVfREVTQ1JJUFRJT04oIlhlbkdUIG1lZGlhdGVk
IHBhc3N0aHJvdWdoIGRyaXZlciIpOwogTU9EVUxFX0xJQ0VOU0UoIkdQTCIpOwogTU9EVUxFX1ZF
UlNJT04oIjAuMSIpOwogCi1zdHJ1Y3Qga29iamVjdCAqZ3Z0X2N0cmxfa29iajsKK3N0YXRpYyBz
dHJ1Y3Qga29iamVjdCAqZ3Z0X2N0cmxfa29iajsKIHN0YXRpYyBzdHJ1Y3Qga3NldCAqZ3Z0X2tz
ZXQ7CiBzdGF0aWMgREVGSU5FX01VVEVYKGd2dF9zeXNmc19sb2NrKTsKIAotc3RydWN0IHhlbmd0
X3N0cnVjdCB4ZW5ndF9wcml2Oworc3RhdGljIHN0cnVjdCB4ZW5ndF9zdHJ1Y3QgeGVuZ3RfcHJp
djsKIGNvbnN0IHN0cnVjdCBpbnRlbF9ndnRfb3BzICppbnRlbF9ndnRfb3BzOwogCiBzdGF0aWMg
c3NpemVfdCBrb2JqX2F0dHJfc2hvdyhzdHJ1Y3Qga29iamVjdCAqa29iaiwgc3RydWN0IGF0dHJp
YnV0ZSAqYXR0ciwKQEAgLTEwOSw3ICsxMDksNyBAQCBzdGF0aWMgc3RydWN0IGF0dHJpYnV0ZSAq
eGVuZ3Rfdm1fYXR0cnNbXSA9IHsKIAlOVUxMLCAgIC8qIG5lZWQgdG8gTlVMTCB0ZXJtaW5hdGUg
dGhlIGxpc3Qgb2YgYXR0cmlidXRlcyAqLwogfTsKIAotY29uc3Qgc3RydWN0IHN5c2ZzX29wcyB4
ZW5ndF9rb2JqX3N5c2ZzX29wcyA9IHsKK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgc3lzZnNfb3BzIHhl
bmd0X2tvYmpfc3lzZnNfb3BzID0gewogCS5zaG93ICAgPSBrb2JqX2F0dHJfc2hvdywKIAkuc3Rv
cmUgID0ga29ial9hdHRyX3N0b3JlLAogfTsKQEAgLTI3MSw3ICsyNzEsNyBAQCBzdGF0aWMgc3Np
emVfdCB4ZW5ndF9zeXNmc19pbnN0YW5jZV9tYW5hZ2Uoc3RydWN0IGtvYmplY3QgKmtvYmosCiAJ
cmV0dXJuIHJjIDwgMCA/IHJjIDogY291bnQ7CiB9CiAKLWludCB4ZW5ndF9zeXNmc19pbml0KHN0
cnVjdCBpbnRlbF9ndnQgKmd2dCkKK3N0YXRpYyBpbnQgeGVuZ3Rfc3lzZnNfaW5pdChzdHJ1Y3Qg
aW50ZWxfZ3Z0ICpndnQpCiB7CiAJaW50IHJldDsKIApAQCAtMzEwLDcgKzMxMCw3IEBAIGludCB4
ZW5ndF9zeXNmc19pbml0KHN0cnVjdCBpbnRlbF9ndnQgKmd2dCkKIAlyZXR1cm4gcmV0OwogfQog
Ci12b2lkIHhlbmd0X3N5c2ZzX2RlbCh2b2lkKQorc3RhdGljIHZvaWQgeGVuZ3Rfc3lzZnNfZGVs
KHZvaWQpCiB7CiAJa29iamVjdF9wdXQoZ3Z0X2N0cmxfa29iaik7CiAJa3NldF91bnJlZ2lzdGVy
KGd2dF9rc2V0KTsKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9p
bnRlbC1ndnQtZGV2
