Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFADEEFD9C
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  5 Nov 2019 13:48:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A44E96EA3D;
	Tue,  5 Nov 2019 12:48:55 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16A7A6EA3D
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  5 Nov 2019 12:48:55 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Nov 2019 04:48:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,271,1569308400"; d="scan'208";a="376672254"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga005.jf.intel.com with ESMTP; 05 Nov 2019 04:48:52 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1iRyGS-0003DZ-G1; Tue, 05 Nov 2019 20:48:52 +0800
Date: Tue, 5 Nov 2019 20:48:06 +0800
From: kbuild test robot <lkp@intel.com>
To: Yulei Zhang <yulei.zhang@intel.com>
Subject: [RFC PATCH intel-gvt-linux] drm/i915/gvt: execlist_ops can be static
Message-ID: <20191105124806.z52rn4webqhxcfki@4978f4969bb8>
References: <201911052029.BAT5wRf8%lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <201911052029.BAT5wRf8%lkp@intel.com>
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

CkZpeGVzOiA1NDBlMDM3MjQ0NzcgKCJkcm0vaTkxNS9ndnQ6IEFkZCB2Z3B1IGV4ZWNsaXN0IGlu
Zm8gaW50byBtaWdyYXRpb24gZGV2aWNlIHN0YXR1cyIpClNpZ25lZC1vZmYtYnk6IGtidWlsZCB0
ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPgotLS0KIG1pZ3JhdGUuYyB8ICAgIDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9taWdyYXRlLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9n
dnQvbWlncmF0ZS5jCmluZGV4IGNmOGU3MjBmNzQwYmYuLjBlYTgwNDcwNWJkZjggMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9taWdyYXRlLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZ3Z0L21pZ3JhdGUuYwpAQCAtMTM5LDcgKzEzOSw3IEBAIHN0cnVjdCBndnRfbWln
cmF0aW9uX29wZXJhdGlvbl90IG9wcmVnaW9uX29wcyA9IHsKIAkucG9zdF9sb2FkID0gTlVMTCwK
IH07CiAKLXN0cnVjdCBndnRfbWlncmF0aW9uX29wZXJhdGlvbl90IGV4ZWNsaXN0X29wcyA9IHsK
K3N0YXRpYyBzdHJ1Y3QgZ3Z0X21pZ3JhdGlvbl9vcGVyYXRpb25fdCBleGVjbGlzdF9vcHMgPSB7
CiAJLnByZV9jb3B5ID0gTlVMTCwKIAkucHJlX3NhdmUgPSBleGVjbGlzdF9zYXZlLAogCS5wcmVf
bG9hZCA9IGV4ZWNsaXN0X2xvYWQsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
