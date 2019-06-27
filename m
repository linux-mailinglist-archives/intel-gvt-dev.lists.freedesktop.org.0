Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B29C057D6C
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 27 Jun 2019 09:45:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 780C26E418;
	Thu, 27 Jun 2019 07:45:54 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BDFF6E418
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 27 Jun 2019 07:45:53 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Jun 2019 00:45:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,423,1557212400"; d="scan'208";a="185181699"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by fmsmga004.fm.intel.com with ESMTP; 27 Jun 2019 00:45:51 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1hgP6M-000Bcs-Vf; Thu, 27 Jun 2019 15:45:50 +0800
Date: Thu, 27 Jun 2019 15:45:39 +0800
From: kbuild test robot <lkp@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: [intel-gvt-linux:gvt-staging 2084/2117]
 drivers/gpu/drm/i915/i915_irq.c:3385:6: sparse: sparse: symbol
 'i945gm_vblank_work_func' was not declared. Should it be static?
Message-ID: <201906271523.1L2N7EVY%lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
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

dHJlZTogICBodHRwczovL2dpdGh1Yi5jb20vaW50ZWwvZ3Z0LWxpbnV4IGd2dC1zdGFnaW5nCmhl
YWQ6ICAgNzdlOGRkMWQ2NjEyMDI5N2EzYjY4Yzg0ZTM2MDg0NDEyN2Q1MDU0Mgpjb21taXQ6IDA4
ZmE4ZmQwZmFhNTcxNmVkMTgwZTEwOWEwMjJlMmMwZjQyYzJlNGEgWzIwODQvMjExN10gZHJtL2k5
MTU6IFN3aXRjaCB0byBwZXItY3J0YyB2YmxhbmsgdmZ1bmNzCnJlcHJvZHVjZToKICAgICAgICAj
IGFwdC1nZXQgaW5zdGFsbCBzcGFyc2UKICAgICAgICAjIHNwYXJzZSB2ZXJzaW9uOiB2MC42LjEt
cmMxLTctZzJiOTZjZDgtZGlydHkKICAgICAgICBnaXQgY2hlY2tvdXQgMDhmYThmZDBmYWE1NzE2
ZWQxODBlMTA5YTAyMmUyYzBmNDJjMmU0YQogICAgICAgIG1ha2UgQVJDSD14ODZfNjQgYWxsbW9k
Y29uZmlnCiAgICAgICAgbWFrZSBDPTEgQ0Y9Jy1mZGlhZ25vc3RpYy1wcmVmaXggLURfX0NIRUNL
X0VORElBTl9fJwoKSWYgeW91IGZpeCB0aGUgaXNzdWUsIGtpbmRseSBhZGQgZm9sbG93aW5nIHRh
ZwpSZXBvcnRlZC1ieToga2J1aWxkIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+CgoKc3BhcnNl
IHdhcm5pbmdzOiAobmV3IG9uZXMgcHJlZml4ZWQgYnkgPj4pCgo+PiBkcml2ZXJzL2dwdS9kcm0v
aTkxNS9pOTE1X2lycS5jOjMzODU6Njogc3BhcnNlOiBzcGFyc2U6IHN5bWJvbCAnaTk0NWdtX3Zi
bGFua193b3JrX2Z1bmMnIHdhcyBub3QgZGVjbGFyZWQuIFNob3VsZCBpdCBiZSBzdGF0aWM/CgpQ
bGVhc2UgcmV2aWV3IGFuZCBwb3NzaWJseSBmb2xkIHRoZSBmb2xsb3d1cCBwYXRjaC4KCi0tLQow
LURBWSBrZXJuZWwgdGVzdCBpbmZyYXN0cnVjdHVyZSAgICAgICAgICAgICAgICBPcGVuIFNvdXJj
ZSBUZWNobm9sb2d5IENlbnRlcgpodHRwczovL2xpc3RzLjAxLm9yZy9waXBlcm1haWwva2J1aWxk
LWFsbCAgICAgICAgICAgICAgICAgICBJbnRlbCBDb3Jwb3JhdGlvbgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlz
dAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
