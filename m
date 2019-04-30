Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF31BEF63
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 30 Apr 2019 06:23:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30C0989385;
	Tue, 30 Apr 2019 04:23:43 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5960A89381
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 30 Apr 2019 04:23:41 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Apr 2019 21:23:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,412,1549958400"; d="scan'208";a="295675717"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga004.jf.intel.com with ESMTP; 29 Apr 2019 21:23:38 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1hLKIs-000II4-Bb; Tue, 30 Apr 2019 12:23:38 +0800
Date: Tue, 30 Apr 2019 12:23:23 +0800
From: kbuild test robot <lkp@intel.com>
To: Yulei Zhang <yulei.zhang@intel.com>
Subject: [RFC PATCH intel-gvt-linux] drm/i915/gvt: opregion_ops can be static
Message-ID: <20190430042323.GA30947@lkp-kbuild20>
References: <201904301258.oFCyWBze%lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <201904301258.oFCyWBze%lkp@intel.com>
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
Cc: zhenyu.z.wang@intel.com, Zhenyu Wang <zhenyuw@linux.intel.com>,
 terrence.xu@intel.com, kbuild-all@01.org, libo.zhu@intel.com,
 intel-gvt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

CkZpeGVzOiBkNmVhMGIzOTE0NjcgKCJkcm0vaTkxNS9ndnQ6IE1vZGlmeSB0aGUgdkdQVSBzYXZl
L3Jlc3RvcmUgbG9naWMgZm9yIFhFTkdUIikKU2lnbmVkLW9mZi1ieToga2J1aWxkIHRlc3Qgcm9i
b3QgPGxrcEBpbnRlbC5jb20+Ci0tLQogbWlncmF0ZS5jIHwgICAgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZ3Z0L21pZ3JhdGUuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9taWdy
YXRlLmMKaW5kZXggZWYyNTNkYS4uMWIyOWY3M2U5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9ndnQvbWlncmF0ZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9taWdy
YXRlLmMKQEAgLTEzMCw3ICsxMzAsNyBAQCBzdHJ1Y3QgZ3Z0X21pZ3JhdGlvbl9vcGVyYXRpb25f
dCBwcGd0dF9vcHMgPSB7CiAJLnBvc3RfbG9hZCA9IE5VTEwsCiB9OwogCi1zdHJ1Y3QgZ3Z0X21p
Z3JhdGlvbl9vcGVyYXRpb25fdCBvcHJlZ2lvbl9vcHMgPSB7CitzdGF0aWMgc3RydWN0IGd2dF9t
aWdyYXRpb25fb3BlcmF0aW9uX3Qgb3ByZWdpb25fb3BzID0gewogCS5wcmVfY29weSA9IE5VTEws
CiAJLnByZV9zYXZlID0gb3ByZWdpb25fc2F2ZSwKIAkucHJlX2xvYWQgPSBvcHJlZ2lvbl9sb2Fk
LApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1n
dnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1k
ZXY=
