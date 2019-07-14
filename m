Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A25867F25
	for <lists+intel-gvt-dev@lfdr.de>; Sun, 14 Jul 2019 15:46:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1303B895E7;
	Sun, 14 Jul 2019 13:46:21 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39FCB895E7
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sun, 14 Jul 2019 13:46:20 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Jul 2019 06:45:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,490,1557212400"; d="scan'208";a="157584267"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga007.jf.intel.com with ESMTP; 14 Jul 2019 06:45:53 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1hmep6-0005gx-Nc; Sun, 14 Jul 2019 21:45:52 +0800
Date: Sun, 14 Jul 2019 21:45:43 +0800
From: kbuild test robot <lkp@intel.com>
To: Tina Zhang <tina.zhang@intel.com>
Subject: [RFC PATCH intel-gvt-linux] drm/i915/gvt: intel_vgpu_set_irqs() can
 be static
Message-ID: <20190714134543.36uiqjxkjo7fhn5r@3334de2dbac0>
References: <201907142149.ojOcV39e%lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <201907142149.ojOcV39e%lkp@intel.com>
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
Cc: zhenyu.z.wang@intel.com, terrence.xu@intel.com, kbuild-all@01.org,
 Kechen Lu <kechen.lu@intel.com>, libo.zhu@intel.com,
 intel-gvt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

CkZpeGVzOiBkM2EyNDBjNmQwYWYgKCJkcm0vaTkxNS9ndnQ6IERlbGl2ZXIgdkdQVSBmbGlwIGV2
ZW50IHRvIHVzZXJzcGFjZSIpClNpZ25lZC1vZmYtYnk6IGtidWlsZCB0ZXN0IHJvYm90IDxsa3BA
aW50ZWwuY29tPgotLS0KIGt2bWd0LmMgfCAgICAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9ndnQva3ZtZ3QuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9rdm1ndC5jCmluZGV4IGQx
NTYwZjBkN2EyNTBkLi42ZTk3NzRmMGNkN2ZjMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ3Z0L2t2bWd0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2t2bWd0LmMK
QEAgLTEzMjYsNyArMTMyNiw3IEBAIHN0YXRpYyBpbnQgaW50ZWxfdmdwdV9zZXRfZGlzcGxheV9l
dmVudF90cmlnZ2VyKHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1LAogCXJldHVybiAwOwogfQogCi1p
bnQgaW50ZWxfdmdwdV9zZXRfaXJxcyhzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSwgdTMyIGZsYWdz
LAorc3RhdGljIGludCBpbnRlbF92Z3B1X3NldF9pcnFzKHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1
LCB1MzIgZmxhZ3MsCiAJCXVuc2lnbmVkIGludCBpbmRleCwgdW5zaWduZWQgaW50IHN0YXJ0LCB1
bnNpZ25lZCBpbnQgY291bnQsCiAJCXZvaWQgKmRhdGEpCiB7Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0Cmlu
dGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
