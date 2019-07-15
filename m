Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C61A68223
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 15 Jul 2019 04:05:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 124DB897FB;
	Mon, 15 Jul 2019 02:05:51 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67B7F897FB
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 15 Jul 2019 02:05:49 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Jul 2019 19:05:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,492,1557212400"; d="scan'208";a="190417373"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by fmsmga004.fm.intel.com with ESMTP; 14 Jul 2019 19:05:48 -0700
Received: from fmsmsx101.amr.corp.intel.com (10.18.124.199) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sun, 14 Jul 2019 19:05:48 -0700
Received: from shsmsx151.ccr.corp.intel.com (10.239.6.50) by
 fmsmsx101.amr.corp.intel.com (10.18.124.199) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sun, 14 Jul 2019 19:05:48 -0700
Received: from shsmsx101.ccr.corp.intel.com ([169.254.1.134]) by
 SHSMSX151.ccr.corp.intel.com ([169.254.3.55]) with mapi id 14.03.0439.000;
 Mon, 15 Jul 2019 10:05:46 +0800
From: "Zhang, Tina" <tina.zhang@intel.com>
To: lkp <lkp@intel.com>
Subject: RE: [RFC PATCH intel-gvt-linux] drm/i915/gvt: intel_vgpu_set_irqs()
 can be static
Thread-Topic: [RFC PATCH intel-gvt-linux] drm/i915/gvt:
 intel_vgpu_set_irqs() can be static
Thread-Index: AQHVOkp2Xh5jtaUgak2fztWvJUhnHKbK7ZdA
Date: Mon, 15 Jul 2019 02:05:46 +0000
Message-ID: <237F54289DF84E4997F34151298ABEBC876B2B78@SHSMSX101.ccr.corp.intel.com>
References: <201907142149.ojOcV39e%lkp@intel.com>
 <20190714134543.36uiqjxkjo7fhn5r@3334de2dbac0>
In-Reply-To: <20190714134543.36uiqjxkjo7fhn5r@3334de2dbac0>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiY2E3NmEzOTgtOGY4Mi00MTMxLWEwOTctYjZiMWIxNDBlMThjIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiNVR4OU9YVHRHUmpMOHZHejhHTGJwU2gzYkdEVHhDNTIrSTRHckxuOExaZWxzbmlkb3pHVk9YYk1EeElEWE5xYiJ9
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
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
Cc: "Wang, Zhenyu Z" <zhenyu.z.wang@intel.com>, "Xu,
 Terrence" <terrence.xu@intel.com>, "kbuild-all@01.org" <kbuild-all@01.org>,
 "Lu, Kechen" <kechen.lu@intel.com>, "Zhu, Libo" <libo.zhu@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

VGhpcyBoYXMgYWxyZWFkeSBiZWVuIGZpeGVkIGJ5IGNvbW1pdCAiMmU2NzlkNDhmMzgiLCBtZXJn
ZWQgaW4gSmFudWFyeS4gV2h5IHdlIHN0aWxsIGhhdmUgdGhlIHJlcG9ydD8KCkJSLApUaW5hCgo+
IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gRnJvbTogbGtwCj4gU2VudDogU3VuZGF5LCBK
dWx5IDE0LCAyMDE5IDk6NDYgUE0KPiBUbzogWmhhbmcsIFRpbmEgPHRpbmEuemhhbmdAaW50ZWwu
Y29tPgo+IENjOiBrYnVpbGQtYWxsQDAxLm9yZzsgV2FuZywgWmhlbnl1IFogPHpoZW55dS56Lndh
bmdAaW50ZWwuY29tPjsgWmh1LAo+IExpYm8gPGxpYm8uemh1QGludGVsLmNvbT47IFh1LCBUZXJy
ZW5jZSA8dGVycmVuY2UueHVAaW50ZWwuY29tPjsgaW50ZWwtCj4gZ3Z0LWRldkBsaXN0cy5mcmVl
ZGVza3RvcC5vcmc7IEx1LCBLZWNoZW4gPGtlY2hlbi5sdUBpbnRlbC5jb20+Cj4gU3ViamVjdDog
W1JGQyBQQVRDSCBpbnRlbC1ndnQtbGludXhdIGRybS9pOTE1L2d2dDogaW50ZWxfdmdwdV9zZXRf
aXJxcygpIGNhbgo+IGJlIHN0YXRpYwo+IAo+IAo+IEZpeGVzOiBkM2EyNDBjNmQwYWYgKCJkcm0v
aTkxNS9ndnQ6IERlbGl2ZXIgdkdQVSBmbGlwIGV2ZW50IHRvIHVzZXJzcGFjZSIpCj4gU2lnbmVk
LW9mZi1ieToga2J1aWxkIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+Cj4gLS0tCj4gIGt2bWd0
LmMgfCAgICAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQva3ZtZ3QuYwo+
IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2t2bWd0LmMKPiBpbmRleCBkMTU2MGYwZDdhMjUw
ZC4uNmU5Nzc0ZjBjZDdmYzMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0
L2t2bWd0LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQva3ZtZ3QuYwo+IEBAIC0x
MzI2LDcgKzEzMjYsNyBAQCBzdGF0aWMgaW50Cj4gaW50ZWxfdmdwdV9zZXRfZGlzcGxheV9ldmVu
dF90cmlnZ2VyKHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1LAo+ICAJcmV0dXJuIDA7Cj4gIH0KPiAK
PiAtaW50IGludGVsX3ZncHVfc2V0X2lycXMoc3RydWN0IGludGVsX3ZncHUgKnZncHUsIHUzMiBm
bGFncywKPiArc3RhdGljIGludCBpbnRlbF92Z3B1X3NldF9pcnFzKHN0cnVjdCBpbnRlbF92Z3B1
ICp2Z3B1LCB1MzIgZmxhZ3MsCj4gIAkJdW5zaWduZWQgaW50IGluZGV4LCB1bnNpZ25lZCBpbnQg
c3RhcnQsIHVuc2lnbmVkIGludCBjb3VudCwKPiAgCQl2b2lkICpkYXRhKQo+ICB7Cl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFp
bGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
