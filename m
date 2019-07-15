Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E43685D0
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 15 Jul 2019 10:56:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97EE989686;
	Mon, 15 Jul 2019 08:56:38 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36A8089686
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 15 Jul 2019 08:56:37 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Jul 2019 01:56:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,493,1557212400"; d="scan'208";a="187077189"
Received: from pl-dbox.sh.intel.com (HELO intel.com) ([10.239.13.128])
 by fmsmga001.fm.intel.com with ESMTP; 15 Jul 2019 01:56:35 -0700
Date: Mon, 15 Jul 2019 16:59:37 +0800
From: Philip Li <philip.li@intel.com>
To: "Zhang, Tina" <tina.zhang@intel.com>, rong.a.chen@intel.com
Subject: Re: [kbuild-all] [RFC PATCH intel-gvt-linux] drm/i915/gvt:
 intel_vgpu_set_irqs() can be static
Message-ID: <20190715085937.GB15104@intel.com>
References: <201907142149.ojOcV39e%lkp@intel.com>
 <20190714134543.36uiqjxkjo7fhn5r@3334de2dbac0>
 <237F54289DF84E4997F34151298ABEBC876B2B78@SHSMSX101.ccr.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <237F54289DF84E4997F34151298ABEBC876B2B78@SHSMSX101.ccr.corp.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: lkp <lkp@intel.com>, "Wang, Zhenyu Z" <zhenyu.z.wang@intel.com>, "Xu,
 Terrence" <terrence.xu@intel.com>, "kbuild-all@01.org" <kbuild-all@01.org>,
 "Lu, Kechen" <kechen.lu@intel.com>, "Zhu, Libo" <libo.zhu@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMTUsIDIwMTkgYXQgMDI6MDU6NDZBTSArMDAwMCwgWmhhbmcsIFRpbmEgd3Jv
dGU6Cj4gVGhpcyBoYXMgYWxyZWFkeSBiZWVuIGZpeGVkIGJ5IGNvbW1pdCAiMmU2NzlkNDhmMzgi
LCBtZXJnZWQgaW4gSmFudWFyeS4gV2h5IHdlIHN0aWxsIGhhdmUgdGhlIHJlcG9ydD8KdGhhbmtz
IGZvciB0aGUgZmVlZGJhY2ssIGFkZCBSb25nIHRvIGNoZWNrIHRoaXMuIEZvciBub3csIGtpbmRs
eSBpZ25vcmUgdGhlIHByb3Bvc2VkIHBhdGNoIGhlcmUuCgo+IAo+IEJSLAo+IFRpbmEKPiAKPiA+
IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gPiBGcm9tOiBsa3AKPiA+IFNlbnQ6IFN1bmRh
eSwgSnVseSAxNCwgMjAxOSA5OjQ2IFBNCj4gPiBUbzogWmhhbmcsIFRpbmEgPHRpbmEuemhhbmdA
aW50ZWwuY29tPgo+ID4gQ2M6IGtidWlsZC1hbGxAMDEub3JnOyBXYW5nLCBaaGVueXUgWiA8emhl
bnl1Lnoud2FuZ0BpbnRlbC5jb20+OyBaaHUsCj4gPiBMaWJvIDxsaWJvLnpodUBpbnRlbC5jb20+
OyBYdSwgVGVycmVuY2UgPHRlcnJlbmNlLnh1QGludGVsLmNvbT47IGludGVsLQo+ID4gZ3Z0LWRl
dkBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IEx1LCBLZWNoZW4gPGtlY2hlbi5sdUBpbnRlbC5jb20+
Cj4gPiBTdWJqZWN0OiBbUkZDIFBBVENIIGludGVsLWd2dC1saW51eF0gZHJtL2k5MTUvZ3Z0OiBp
bnRlbF92Z3B1X3NldF9pcnFzKCkgY2FuCj4gPiBiZSBzdGF0aWMKPiA+IAo+ID4gCj4gPiBGaXhl
czogZDNhMjQwYzZkMGFmICgiZHJtL2k5MTUvZ3Z0OiBEZWxpdmVyIHZHUFUgZmxpcCBldmVudCB0
byB1c2Vyc3BhY2UiKQo+ID4gU2lnbmVkLW9mZi1ieToga2J1aWxkIHRlc3Qgcm9ib3QgPGxrcEBp
bnRlbC5jb20+Cj4gPiAtLS0KPiA+ICBrdm1ndC5jIHwgICAgMiArLQo+ID4gIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2t2bWd0LmMKPiA+IGIvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ3Z0L2t2bWd0LmMKPiA+IGluZGV4IGQxNTYwZjBkN2EyNTBkLi42ZTk3NzRmMGNkN2ZjMyAx
MDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9rdm1ndC5jCj4gPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQva3ZtZ3QuYwo+ID4gQEAgLTEzMjYsNyArMTMyNiw3
IEBAIHN0YXRpYyBpbnQKPiA+IGludGVsX3ZncHVfc2V0X2Rpc3BsYXlfZXZlbnRfdHJpZ2dlcihz
dHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSwKPiA+ICAJcmV0dXJuIDA7Cj4gPiAgfQo+ID4gCj4gPiAt
aW50IGludGVsX3ZncHVfc2V0X2lycXMoc3RydWN0IGludGVsX3ZncHUgKnZncHUsIHUzMiBmbGFn
cywKPiA+ICtzdGF0aWMgaW50IGludGVsX3ZncHVfc2V0X2lycXMoc3RydWN0IGludGVsX3ZncHUg
KnZncHUsIHUzMiBmbGFncywKPiA+ICAJCXVuc2lnbmVkIGludCBpbmRleCwgdW5zaWduZWQgaW50
IHN0YXJ0LCB1bnNpZ25lZCBpbnQgY291bnQsCj4gPiAgCQl2b2lkICpkYXRhKQo+ID4gIHsKPiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGtidWlsZC1h
bGwgbWFpbGluZyBsaXN0Cj4ga2J1aWxkLWFsbEBsaXN0cy4wMS5vcmcKPiBodHRwczovL2xpc3Rz
LjAxLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2tidWlsZC1hbGwKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50
ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
