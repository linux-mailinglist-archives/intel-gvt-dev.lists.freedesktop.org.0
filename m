Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8DFE311
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 29 Apr 2019 14:52:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8D05892ED;
	Mon, 29 Apr 2019 12:52:04 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B592892ED
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 29 Apr 2019 12:52:03 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Apr 2019 05:52:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,409,1549958400"; d="scan'208";a="154710697"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga002.jf.intel.com with ESMTP; 29 Apr 2019 05:52:01 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1hL5lI-000Euz-HY; Mon, 29 Apr 2019 20:52:00 +0800
Date: Mon, 29 Apr 2019 20:51:43 +0800
From: kbuild test robot <lkp@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: [RFC PATCH intel-gvt-linux] drm/i915/xengt: gvt_ctrl_kobj can be
 static
Message-ID: <20190429125143.GA3698@lkp-kbuild20>
References: <201904292008.WTbJI3pG%lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <201904292008.WTbJI3pG%lkp@intel.com>
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
Cc: zhenyu.z.wang@intel.com, intel-gvt-dev@lists.freedesktop.org,
 terrence.xu@intel.com, kbuild-all@01.org, libo.zhu@intel.com,
 Pei Zhang <pei.zhang@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

CkZpeGVzOiA1YzUzYmY3MmYyYmEgKCJkcm0vaTkxNS94ZW5ndDogeGVuZ3QgbW91ZHVsZSBpbml0
aWFsIGZpbGVzIikKU2lnbmVkLW9mZi1ieToga2J1aWxkIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5j
b20+Ci0tLQogeGVuZ3QuYyB8ICAgMTAgKysrKystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5z
ZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9ndnQveGVuZ3QuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC94ZW5ndC5jCmluZGV4
IDI1MDAyN2UwLi44NjY5OWE2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQv
eGVuZ3QuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQveGVuZ3QuYwpAQCAtNTYsMTEg
KzU2LDExIEBAIE1PRFVMRV9ERVNDUklQVElPTigiWGVuR1QgbWVkaWF0ZWQgcGFzc3Rocm91Z2gg
ZHJpdmVyIik7CiBNT0RVTEVfTElDRU5TRSgiR1BMIik7CiBNT0RVTEVfVkVSU0lPTigiMC4xIik7
CiAKLXN0cnVjdCBrb2JqZWN0ICpndnRfY3RybF9rb2JqOworc3RhdGljIHN0cnVjdCBrb2JqZWN0
ICpndnRfY3RybF9rb2JqOwogc3RhdGljIHN0cnVjdCBrc2V0ICpndnRfa3NldDsKIHN0YXRpYyBE
RUZJTkVfTVVURVgoZ3Z0X3N5c2ZzX2xvY2spOwogCi1zdHJ1Y3QgeGVuZ3Rfc3RydWN0IHhlbmd0
X3ByaXY7CitzdGF0aWMgc3RydWN0IHhlbmd0X3N0cnVjdCB4ZW5ndF9wcml2OwogY29uc3Qgc3Ry
dWN0IGludGVsX2d2dF9vcHMgKmludGVsX2d2dF9vcHM7CiAKIHN0YXRpYyBzc2l6ZV90IGtvYmpf
YXR0cl9zaG93KHN0cnVjdCBrb2JqZWN0ICprb2JqLCBzdHJ1Y3QgYXR0cmlidXRlICphdHRyLApA
QCAtMTA5LDcgKzEwOSw3IEBAIHN0YXRpYyBzdHJ1Y3QgYXR0cmlidXRlICp4ZW5ndF92bV9hdHRy
c1tdID0gewogCU5VTEwsICAgLyogbmVlZCB0byBOVUxMIHRlcm1pbmF0ZSB0aGUgbGlzdCBvZiBh
dHRyaWJ1dGVzICovCiB9OwogCi1jb25zdCBzdHJ1Y3Qgc3lzZnNfb3BzIHhlbmd0X2tvYmpfc3lz
ZnNfb3BzID0geworc3RhdGljIGNvbnN0IHN0cnVjdCBzeXNmc19vcHMgeGVuZ3Rfa29ial9zeXNm
c19vcHMgPSB7CiAJLnNob3cgICA9IGtvYmpfYXR0cl9zaG93LAogCS5zdG9yZSAgPSBrb2JqX2F0
dHJfc3RvcmUsCiB9OwpAQCAtMjcxLDcgKzI3MSw3IEBAIHN0YXRpYyBzc2l6ZV90IHhlbmd0X3N5
c2ZzX2luc3RhbmNlX21hbmFnZShzdHJ1Y3Qga29iamVjdCAqa29iaiwKIAlyZXR1cm4gcmMgPCAw
ID8gcmMgOiBjb3VudDsKIH0KIAotaW50IHhlbmd0X3N5c2ZzX2luaXQoc3RydWN0IGludGVsX2d2
dCAqZ3Z0KQorc3RhdGljIGludCB4ZW5ndF9zeXNmc19pbml0KHN0cnVjdCBpbnRlbF9ndnQgKmd2
dCkKIHsKIAlpbnQgcmV0OwogCkBAIC0zMTAsNyArMzEwLDcgQEAgaW50IHhlbmd0X3N5c2ZzX2lu
aXQoc3RydWN0IGludGVsX2d2dCAqZ3Z0KQogCXJldHVybiByZXQ7CiB9CiAKLXZvaWQgeGVuZ3Rf
c3lzZnNfZGVsKHZvaWQpCitzdGF0aWMgdm9pZCB4ZW5ndF9zeXNmc19kZWwodm9pZCkKIHsKIAlr
b2JqZWN0X3B1dChndnRfY3RybF9rb2JqKTsKIAlrc2V0X3VucmVnaXN0ZXIoZ3Z0X2tzZXQpOwpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQt
ZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
