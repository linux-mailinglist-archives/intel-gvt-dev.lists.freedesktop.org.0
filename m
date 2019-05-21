Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACAEA24A4E
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 21 May 2019 10:26:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54DBB89254;
	Tue, 21 May 2019 08:26:43 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76B1489248;
 Tue, 21 May 2019 08:26:42 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 May 2019 01:26:41 -0700
X-ExtLoop1: 1
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by fmsmga004.fm.intel.com with ESMTP; 21 May 2019 01:26:41 -0700
Received: from FMSMSX109.amr.corp.intel.com (10.18.116.9) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Tue, 21 May 2019 01:26:40 -0700
Received: from shsmsx108.ccr.corp.intel.com (10.239.4.97) by
 fmsmsx109.amr.corp.intel.com (10.18.116.9) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Tue, 21 May 2019 01:26:40 -0700
Received: from shsmsx107.ccr.corp.intel.com ([169.254.9.7]) by
 SHSMSX108.ccr.corp.intel.com ([169.254.8.126]) with mapi id 14.03.0415.000;
 Tue, 21 May 2019 16:26:39 +0800
From: "Zhang, Xiaolin" <xiaolin.zhang@intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>
Subject: Re: [PATCH v5 4/8] drm/i915: vgpu context submission pv optimization
Thread-Topic: [PATCH v5 4/8] drm/i915: vgpu context submission pv optimization
Thread-Index: AQHU/jlEg9hZVmsQ5kWB2SiNoes8uQ==
Date: Tue, 21 May 2019 08:26:39 +0000
Message-ID: <073732E20AE4C540AE91DBC3F07D4460876606C1@SHSMSX107.ccr.corp.intel.com>
References: <1556507458-24684-1-git-send-email-xiaolin.zhang@intel.com>
 <1556507458-24684-5-git-send-email-xiaolin.zhang@intel.com>
 <155653215521.27886.14694707069719603445@skylake-alporthouse-com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.4.80]
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
Cc: "Wang, Zhenyu Z" <zhenyu.z.wang@intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>, "Yuan,
 Hang" <hang.yuan@intel.com>, "He, Min" <min.he@intel.com>, "Lv,
 Zhiyuan" <zhiyuan.lv@intel.com>, "Wang, Zhi A" <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gMDQvMjkvMjAxOSAwNjowMyBQTSwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+IFF1b3RpbmcgWGlh
b2xpbiBaaGFuZyAoMjAxOS0wNC0yOSAwNDoxMDo1NCkKPj4gK3N0YXRpYyB2b2lkIHB2X3N1Ym1p
dChzdHJ1Y3QgaW50ZWxfZW5naW5lX2NzICplbmdpbmUpCj4+ICt7Cj4+ICsgICAgICAgc3RydWN0
IGludGVsX2VuZ2luZV9leGVjbGlzdHMgKiBjb25zdCBleGVjbGlzdHMgPSAmZW5naW5lLT5leGVj
bGlzdHM7Cj4+ICsgICAgICAgc3RydWN0IGV4ZWNsaXN0X3BvcnQgKnBvcnQgPSBleGVjbGlzdHMt
PnBvcnQ7Cj4+ICsgICAgICAgdW5zaWduZWQgaW50IG47Cj4+ICsgICAgICAgc3RydWN0IGd2dF9z
aGFyZWRfcGFnZSAqc2hhcmVkX3BhZ2UgPSBlbmdpbmUtPmk5MTUtPnZncHUuc2hhcmVkX3BhZ2U7
Cj4+ICsgICAgICAgdTY0IGRlc2NzWzJdOwo+PiArCj4+ICsgICAgICAgZm9yIChuID0gMDsgbiA8
IGV4ZWNsaXN0c19udW1fcG9ydHMoZXhlY2xpc3RzKTsgbisrKSB7Cj4+ICsgICAgICAgICAgICAg
ICBzdHJ1Y3QgaTkxNV9yZXF1ZXN0ICpycTsKPj4gKyAgICAgICAgICAgICAgIHVuc2lnbmVkIGlu
dCBjb3VudCA9IDA7Cj4+ICsKPj4gKyAgICAgICAgICAgICAgIGRlc2NzW25dID0gMDsKPj4gKyAg
ICAgICAgICAgICAgIHJxID0gcG9ydF91bnBhY2soJnBvcnRbbl0sICZjb3VudCk7Cj4+ICsgICAg
ICAgICAgICAgICBpZiAocnEgJiYgY291bnQgPT0gMCkgewo+PiArICAgICAgICAgICAgICAgICAg
ICAgICBwb3J0X3NldCgmcG9ydFtuXSwgcG9ydF9wYWNrKHJxLCArK2NvdW50KSk7Cj4+ICsgICAg
ICAgICAgICAgICAgICAgICAgIGRlc2NzW25dID0gZXhlY2xpc3RzX3VwZGF0ZV9jb250ZXh0KHJx
KTsKPj4gKyAgICAgICAgICAgICAgIH0KPj4gKyAgICAgICB9Cj4+ICsKPj4gKyAgICAgICBzcGlu
X2xvY2soJmVuZ2luZS0+aTkxNS0+dmdwdS5zaGFyZWRfcGFnZV9sb2NrW2VuZ2luZS0+aWRdKTsK
PiBPbmx5IG9uZSBlbmdpbmUgYXQgYSB0aW1lIG5vdyBhY2Nlc3NlcyB0aGF0IHBvcnRpb24gb2Yg
cHZfZWxzcCwgc28gdGhlCj4gc3BpbiBsb2NrIGlzIG5vdCByZXF1aXJlZCBwZXItc2UsIGFpdWku
Cj4KPiBUaGUgcHJvYmxlbSBpcyB0aGF0IHRoZXJlIGlzIG5vIGNvb3JkaW5hdGlvbiBiZXR3ZWVu
IHB2X3N1Ym1pdCBhbmQgdGhlCj4gb3RoZXIgc2lkZSBvZiB0aGUgcGlwZSwgYXMgZmFyIGFzIEkg
Y2FuIHNlZS4gU28gaXQgc2VlbXMgdmVyeSBwb3NzaWJsZQo+IGZvciB1cyB0byBvdmVyd3JpdGUg
ZW50cmllcyBiZWZvcmUgdGhleSBoYXZlIGJlZW4gcmVhZC4gSSBleHBlY3QgdG8gc2VlCj4gc29t
ZSBhY2sgbWVjaGFuaXNtIGZvciBWR1RfRzJWX1BWX1NVQk1JU1NJT04uCj4KPj4gKyAgICAgICBm
b3IgKG4gPSAwOyBuIDwgZXhlY2xpc3RzX251bV9wb3J0cyhleGVjbGlzdHMpOyBuKyspCj4+ICsg
ICAgICAgICAgICAgICBzaGFyZWRfcGFnZS0+cHZfZWxzcFtlbmdpbmUtPmlkXS5kZXNjc1tuXSA9
IGRlc2NzW25dOwo+IEknZCByZWNvbW1lbmQgbm90IHVzaW5nIGVuZ2luZS0+aWQsIHRoYXQncyBq
dXN0IG91ciBpbnRlcm5hbCBpZCBhbmQgbWF5Cj4gdmFyeSBiZXR3ZWVuIGhvc3QvZ3Vlc3QuIFVz
ZSBlbmdpbmUtPmh3X2lkPyBPciBuZWdvdGlhdGUgdXNpbmcgcHYgc2V0dXAKPiBhbmQgc3RvcmUg
cHZfaWQ/Cj4KPiBCdXQgc3RhcnRpbmcgdG8gbG9vayBtb3JlIHNvbGlkIG92ZXIgYWxsLiBXZSBq
dXN0IG5lZWQgdG8gZmluaXNoCj4gc3BsaXR0aW5nIG91dCB0aGUgdmFyaW91cyBzaW1pbGFyLWJ1
dC1xdWl0ZS1kaWZmZXJlbnQtcmVhbGx5IHN1Ym1pc3Npb24KPiBiYWNrZW5kcy4gOikKPiAtQ2hy
aXMKPgpDaHJpcywgVGhhbmtzIHlvdXIgZ3JlYXQgY29tbWVudHMgYW5kIHdpbGwgYmUgYWRkcmVz
c2VkIG5leHQgdmVyc2lvbgood2lsbCByZW1vdmUgc3BpbiBsb2NrLCB1c2UgaHdfaWQsICBhZGQg
YWNrIG1lY2hhbmlzbSBhbmQgcmVmaW5lIHBhdGNoZXMpLiAKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50
ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
