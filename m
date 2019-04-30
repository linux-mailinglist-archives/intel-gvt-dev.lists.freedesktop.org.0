Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8989F26B
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 30 Apr 2019 11:03:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EB1D8901F;
	Tue, 30 Apr 2019 09:03:34 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCEDF8901F
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 30 Apr 2019 09:03:33 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Apr 2019 02:03:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,413,1549958400"; d="scan'208";a="169233136"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by fmsmga001.fm.intel.com with ESMTP; 30 Apr 2019 02:03:31 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1hLOfi-0001pw-TB; Tue, 30 Apr 2019 17:03:30 +0800
Date: Tue, 30 Apr 2019 17:02:40 +0800
From: kbuild test robot <lkp@intel.com>
To: Yulei Zhang <yulei.zhang@intel.com>
Subject: [RFC PATCH intel-gvt-linux] drm/i915/gvt: execlist_ops can be static
Message-ID: <20190430090240.GA34480@lkp-kbuild20>
References: <201904301707.PQusEVZI%lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <201904301707.PQusEVZI%lkp@intel.com>
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

CkZpeGVzOiAzYTlmZTJlMDY4Y2EgKCJkcm0vaTkxNS9ndnQ6IEFkZCB2Z3B1IGV4ZWNsaXN0IGlu
Zm8gaW50byBtaWdyYXRpb24gZGV2aWNlIHN0YXR1cyIpClNpZ25lZC1vZmYtYnk6IGtidWlsZCB0
ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPgotLS0KIG1pZ3JhdGUuYyB8ICAgIDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9taWdyYXRlLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9n
dnQvbWlncmF0ZS5jCmluZGV4IGNmOGU3MjAuLjBlYTgwNDcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2d2dC9taWdyYXRlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0
L21pZ3JhdGUuYwpAQCAtMTM5LDcgKzEzOSw3IEBAIHN0cnVjdCBndnRfbWlncmF0aW9uX29wZXJh
dGlvbl90IG9wcmVnaW9uX29wcyA9IHsKIAkucG9zdF9sb2FkID0gTlVMTCwKIH07CiAKLXN0cnVj
dCBndnRfbWlncmF0aW9uX29wZXJhdGlvbl90IGV4ZWNsaXN0X29wcyA9IHsKK3N0YXRpYyBzdHJ1
Y3QgZ3Z0X21pZ3JhdGlvbl9vcGVyYXRpb25fdCBleGVjbGlzdF9vcHMgPSB7CiAJLnByZV9jb3B5
ID0gTlVMTCwKIAkucHJlX3NhdmUgPSBleGVjbGlzdF9zYXZlLAogCS5wcmVfbG9hZCA9IGV4ZWNs
aXN0X2xvYWQsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50
ZWwtZ3Z0LWRldg==
