Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40220EF70A
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  5 Nov 2019 09:14:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F29626E91E;
	Tue,  5 Nov 2019 08:14:29 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF3296E920
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  5 Nov 2019 08:14:28 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Nov 2019 00:14:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,270,1569308400"; d="scan'208";a="285237388"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga001.jf.intel.com with ESMTP; 05 Nov 2019 00:14:25 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1iRtyr-000Bgd-2v; Tue, 05 Nov 2019 16:14:25 +0800
Date: Tue, 5 Nov 2019 16:13:20 +0800
From: kbuild test robot <lkp@intel.com>
To: Yulei Zhang <yulei.zhang@intel.com>
Subject: [RFC PATCH intel-gvt-linux] drm/i915/gvt: opregion_ops can be static
Message-ID: <20191105081320.eskpq46s5742qrca@4978f4969bb8>
References: <201911051533.jlPYogcp%lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <201911051533.jlPYogcp%lkp@intel.com>
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
 Zhenyu Wang <zhenyuw@linux.intel.com>, terrence.xu@intel.com,
 libo.zhu@intel.com, intel-gvt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

CkZpeGVzOiAxMDM0ODJmN2I5ZjQgKCJkcm0vaTkxNS9ndnQ6IE1vZGlmeSB0aGUgdkdQVSBzYXZl
L3Jlc3RvcmUgbG9naWMgZm9yIFhFTkdUIikKU2lnbmVkLW9mZi1ieToga2J1aWxkIHRlc3Qgcm9i
b3QgPGxrcEBpbnRlbC5jb20+Ci0tLQogbWlncmF0ZS5jIHwgICAgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZ3Z0L21pZ3JhdGUuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9taWdy
YXRlLmMKaW5kZXggZWYyNTNkYTMzOWNmMS4uMWIyOWY3M2U5ZTQzMyAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZ3Z0L21pZ3JhdGUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9ndnQvbWlncmF0ZS5jCkBAIC0xMzAsNyArMTMwLDcgQEAgc3RydWN0IGd2dF9taWdyYXRpb25f
b3BlcmF0aW9uX3QgcHBndHRfb3BzID0gewogCS5wb3N0X2xvYWQgPSBOVUxMLAogfTsKIAotc3Ry
dWN0IGd2dF9taWdyYXRpb25fb3BlcmF0aW9uX3Qgb3ByZWdpb25fb3BzID0geworc3RhdGljIHN0
cnVjdCBndnRfbWlncmF0aW9uX29wZXJhdGlvbl90IG9wcmVnaW9uX29wcyA9IHsKIAkucHJlX2Nv
cHkgPSBOVUxMLAogCS5wcmVfc2F2ZSA9IG9wcmVnaW9uX3NhdmUsCiAJLnByZV9sb2FkID0gb3By
ZWdpb25fbG9hZCwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9p
bnRlbC1ndnQtZGV2
