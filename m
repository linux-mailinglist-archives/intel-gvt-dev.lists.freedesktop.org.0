Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81EF73ACAF
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 10 Jun 2019 03:32:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19C8388FC8;
	Mon, 10 Jun 2019 01:32:24 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B02188FC8;
 Mon, 10 Jun 2019 01:32:22 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Jun 2019 18:32:21 -0700
X-ExtLoop1: 1
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by orsmga006.jf.intel.com with ESMTP; 09 Jun 2019 18:32:21 -0700
Received: from fmsmsx152.amr.corp.intel.com (10.18.125.5) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Sun, 9 Jun 2019 18:32:21 -0700
Received: from shsmsx154.ccr.corp.intel.com (10.239.6.54) by
 FMSMSX152.amr.corp.intel.com (10.18.125.5) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Sun, 9 Jun 2019 18:32:20 -0700
Received: from shsmsx107.ccr.corp.intel.com ([169.254.9.98]) by
 SHSMSX154.ccr.corp.intel.com ([169.254.7.247]) with mapi id 14.03.0415.000;
 Mon, 10 Jun 2019 09:32:18 +0800
From: "Zhang, Xiaolin" <xiaolin.zhang@intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>
Subject: Re: [PATCH v6 3/8] drm/i915: vgpu ppgtt update pv optimization
Thread-Topic: [PATCH v6 3/8] drm/i915: vgpu ppgtt update pv optimization
Thread-Index: AQHVGdISlGFeH5q9bECULyNzt4PBqQ==
Date: Mon, 10 Jun 2019 01:32:18 +0000
Message-ID: <073732E20AE4C540AE91DBC3F07D44608767613C@SHSMSX107.ccr.corp.intel.com>
References: <1559541769-25279-1-git-send-email-xiaolin.zhang@intel.com>
 <1559541769-25279-4-git-send-email-xiaolin.zhang@intel.com>
 <155963882020.4471.1671907244294890584@skylake-alporthouse-com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.4.101]
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

T24gMDYvMDQvMjAxOSAwNTowMSBQTSwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+IFF1b3RpbmcgWGlh
b2xpbiBaaGFuZyAoMjAxOS0wNi0wMyAwNzowMjo0NCkKPj4gK3N0YXRpYyB2b2lkIGdlbjhfcHBn
dHRfY2xlYXJfNGx2bF9wdihzdHJ1Y3QgaTkxNV9hZGRyZXNzX3NwYWNlICp2bSwKPj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHU2NCBzdGFydCwgdTY0IGxlbmd0aCkKPj4gK3sK
Pj4gKyAgICAgICBzdHJ1Y3QgaTkxNV9od19wcGd0dCAqcHBndHQgPSBpOTE1X3ZtX3RvX3BwZ3R0
KHZtKTsKPj4gKyAgICAgICBzdHJ1Y3QgaTkxNV9wbWw0ICpwbWw0ID0gJnBwZ3R0LT5wbWw0Owo+
PiArICAgICAgIHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICpkZXZfcHJpdiA9IHZtLT5pOTE1Owo+
PiArICAgICAgIHN0cnVjdCBwdl9wcGd0dF91cGRhdGUgKnB2X3BwZ3R0ID0KPj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgJmRldl9wcml2LT52Z3B1LnNoYXJlZF9wYWdlLT5idWYucHZfcHBndHQ7
Cj4+ICsgICAgICAgdTY0IG9yaWdfc3RhcnQgPSBzdGFydDsKPj4gKyAgICAgICB1NjQgb3JpZ19s
ZW5ndGggPSBsZW5ndGg7Cj4+ICsKPj4gKyAgICAgICBnZW44X3BwZ3R0X2NsZWFyXzRsdmwodm0s
IHN0YXJ0LCBsZW5ndGgpOwo+PiArCj4+ICsgICAgICAgcHZfcHBndHQtPnBkcCA9IHB4X2RtYShw
bWw0KTsKPj4gKyAgICAgICBwdl9wcGd0dC0+c3RhcnQgPSBvcmlnX3N0YXJ0Owo+PiArICAgICAg
IHB2X3BwZ3R0LT5sZW5ndGggPSBvcmlnX2xlbmd0aDsKPj4gKyAgICAgICBJOTE1X1dSSVRFKHZn
dGlmX3JlZyhnMnZfbm90aWZ5KSwgVkdUX0cyVl9QUEdUVF9MNF9DTEVBUik7Cj4+ICt9Cj4+ICsK
Pj4gK3N0YXRpYyB2b2lkIGdlbjhfcHBndHRfaW5zZXJ0XzRsdmxfcHYoc3RydWN0IGk5MTVfYWRk
cmVzc19zcGFjZSAqdm0sCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3Ry
dWN0IGk5MTVfdm1hICp2bWEsCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ZW51bSBpOTE1X2NhY2hlX2xldmVsIGNhY2hlX2xldmVsLAo+PiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHUzMiBmbGFncykKPj4gK3sKPj4gKyAgICAgICBzdHJ1Y3QgaTkxNV9o
d19wcGd0dCAqcHBndHQgPSBpOTE1X3ZtX3RvX3BwZ3R0KHZtKTsKPj4gKyAgICAgICBzdHJ1Y3Qg
ZHJtX2k5MTVfcHJpdmF0ZSAqZGV2X3ByaXYgPSB2bS0+aTkxNTsKPj4gKyAgICAgICBzdHJ1Y3Qg
cHZfcHBndHRfdXBkYXRlICpwdl9wcGd0dCA9Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgICZk
ZXZfcHJpdi0+dmdwdS5zaGFyZWRfcGFnZS0+YnVmLnB2X3BwZ3R0Owo+PiArCj4+ICsgICAgICAg
Z2VuOF9wcGd0dF9pbnNlcnRfNGx2bCh2bSwgdm1hLCBjYWNoZV9sZXZlbCwgZmxhZ3MpOwo+PiAr
Cj4+ICsgICAgICAgcHZfcHBndHQtPnBkcCA9IHB4X2RtYSgmcHBndHQtPnBtbDQpOwo+PiArICAg
ICAgIHB2X3BwZ3R0LT5zdGFydCA9IHZtYS0+bm9kZS5zdGFydDsKPj4gKyAgICAgICBwdl9wcGd0
dC0+bGVuZ3RoID0gdm1hLT5ub2RlLnNpemU7Cj4+ICsgICAgICAgcHZfcHBndHQtPmNhY2hlX2xl
dmVsID0gY2FjaGVfbGV2ZWw7Cj4+ICsgICAgICAgSTkxNV9XUklURSh2Z3RpZl9yZWcoZzJ2X25v
dGlmeSksIFZHVF9HMlZfUFBHVFRfTDRfSU5TRVJUKTsKPj4gK30KPiBGb3IgdGhpcyB0byB3b3Jr
LCBhIHZncHUgbW1pbyB3cml0ZSBtdXN0IGJlIHRyYXBwZWQgYW5kIHN1c3BlbmQgdGhlCj4gY2xp
ZW50IHdoaWxlIHRoZSBob3N0IHByb2Nlc3NlcyB0aGUgdHJhcC4gT3RoZXJ3aXNlLCB3ZSB3b3Vs
ZCBiZQo+IG92ZXJ3cml0aW5nIHRoZSBzaWRlLWNoYW5uZWwgYmVmb3JlIHRoZSBob3N0IHByb2Nl
c3NlcyB0aGUgY29tbWFuZC4KPgo+IFRoYXQgc291bmRzIGhvcnJpYmxlLgo+IC1DaHJpcwpDaHJp
cywgdGhhbmtzIHlvdXIgY29tbWVudC4gZG8geW91IHRoaW5rIGlzIHRoZSBzcGluX2xvY2sgdG8g
cHJvdGVjdAp0aGlzIFZHUFUgTU1JTyB3cml0ZSBlbm91Z2ggdG8gZWxpbWluYXRlIHRoZSBzaWRl
LWNoYW5uZWwgZWZmZWN0PwpYaWFvbGluCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRl
dkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
