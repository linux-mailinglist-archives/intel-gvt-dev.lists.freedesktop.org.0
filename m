Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 292CB57D6D
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 27 Jun 2019 09:45:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDB3B6E419;
	Thu, 27 Jun 2019 07:45:55 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DC3A6E418
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 27 Jun 2019 07:45:54 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Jun 2019 00:45:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,423,1557212400"; d="scan'208";a="245729298"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga001.jf.intel.com with ESMTP; 27 Jun 2019 00:45:51 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1hgP6N-000BdY-0Z; Thu, 27 Jun 2019 15:45:51 +0800
Date: Thu, 27 Jun 2019 15:45:40 +0800
From: kbuild test robot <lkp@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: [RFC PATCH intel-gvt-linux] drm/i915: i945gm_vblank_work_func() can
 be static
Message-ID: <20190627074540.GA18638@lkp-kbuild03>
References: <201906271523.1L2N7EVY%lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <201906271523.1L2N7EVY%lkp@intel.com>
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
Cc: zhenyu.z.wang@intel.com, Chris Wilson <chris@chris-wilson.co.uk>,
 terrence.xu@intel.com, kbuild-all@01.org, libo.zhu@intel.com,
 intel-gvt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

CkZpeGVzOiAwOGZhOGZkMGZhYTUgKCJkcm0vaTkxNTogU3dpdGNoIHRvIHBlci1jcnRjIHZibGFu
ayB2ZnVuY3MiKQpTaWduZWQtb2ZmLWJ5OiBrYnVpbGQgdGVzdCByb2JvdCA8bGtwQGludGVsLmNv
bT4KLS0tCiBpOTE1X2lycS5jIHwgICAgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkx
NV9pcnEuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfaXJxLmMKaW5kZXggNGZiZThkOTA5
Li44ZTFhZDIwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2lycS5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfaXJxLmMKQEAgLTMzODIsNyArMzM4Miw3IEBA
IHZvaWQgYmR3X2Rpc2FibGVfdmJsYW5rKHN0cnVjdCBkcm1fY3J0YyAqY3J0YykKIAlzcGluX3Vu
bG9ja19pcnFyZXN0b3JlKCZkZXZfcHJpdi0+aXJxX2xvY2ssIGlycWZsYWdzKTsKIH0KIAotdm9p
ZCBpOTQ1Z21fdmJsYW5rX3dvcmtfZnVuYyhzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspCitzdGF0
aWMgdm9pZCBpOTQ1Z21fdmJsYW5rX3dvcmtfZnVuYyhzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmsp
CiB7CiAJc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmRldl9wcml2ID0KIAkJY29udGFpbmVyX29m
KHdvcmssIHN0cnVjdCBkcm1faTkxNV9wcml2YXRlLCBpOTQ1Z21fdmJsYW5rLndvcmspOwpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2
IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
