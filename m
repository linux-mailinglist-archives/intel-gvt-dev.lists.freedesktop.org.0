Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E1C3AFE7
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 10 Jun 2019 09:47:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE48789105;
	Mon, 10 Jun 2019 07:47:40 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0F5689101;
 Mon, 10 Jun 2019 07:47:38 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Jun 2019 00:47:38 -0700
X-ExtLoop1: 1
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by FMSMGA003.fm.intel.com with ESMTP; 10 Jun 2019 00:47:38 -0700
Received: from fmsmsx118.amr.corp.intel.com (10.18.116.18) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Mon, 10 Jun 2019 00:47:38 -0700
Received: from shsmsx152.ccr.corp.intel.com (10.239.6.52) by
 fmsmsx118.amr.corp.intel.com (10.18.116.18) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Mon, 10 Jun 2019 00:47:37 -0700
Received: from shsmsx107.ccr.corp.intel.com ([169.254.9.98]) by
 SHSMSX152.ccr.corp.intel.com ([169.254.6.187]) with mapi id 14.03.0415.000;
 Mon, 10 Jun 2019 15:47:35 +0800
From: "Zhang, Xiaolin" <xiaolin.zhang@intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>
Subject: Re: [PATCH v6 3/8] drm/i915: vgpu ppgtt update pv optimization
Thread-Topic: [PATCH v6 3/8] drm/i915: vgpu ppgtt update pv optimization
Thread-Index: AQHVGdISlGFeH5q9bECULyNzt4PBqQ==
Date: Mon, 10 Jun 2019 07:47:35 +0000
Message-ID: <073732E20AE4C540AE91DBC3F07D4460876764D2@SHSMSX107.ccr.corp.intel.com>
References: <1559541769-25279-1-git-send-email-xiaolin.zhang@intel.com>
 <1559541769-25279-4-git-send-email-xiaolin.zhang@intel.com>
 <155963882020.4471.1671907244294890584@skylake-alporthouse-com>
 <073732E20AE4C540AE91DBC3F07D44608767613C@SHSMSX107.ccr.corp.intel.com>
 <156015268201.2149.9122895262702363636@skylake-alporthouse-com>
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

T24gMDYvMTAvMjAxOSAwMzo0NCBQTSwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+IFF1b3RpbmcgWmhh
bmcsIFhpYW9saW4gKDIwMTktMDYtMTAgMDI6MzI6MTgpCj4+IE9uIDA2LzA0LzIwMTkgMDU6MDEg
UE0sIENocmlzIFdpbHNvbiB3cm90ZToKPj4+IFF1b3RpbmcgWGlhb2xpbiBaaGFuZyAoMjAxOS0w
Ni0wMyAwNzowMjo0NCkKPj4+PiArc3RhdGljIHZvaWQgZ2VuOF9wcGd0dF9jbGVhcl80bHZsX3B2
KHN0cnVjdCBpOTE1X2FkZHJlc3Nfc3BhY2UgKnZtLAo+Pj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB1NjQgc3RhcnQsIHU2NCBsZW5ndGgpCj4+Pj4gK3sKPj4+PiArICAgICAg
IHN0cnVjdCBpOTE1X2h3X3BwZ3R0ICpwcGd0dCA9IGk5MTVfdm1fdG9fcHBndHQodm0pOwo+Pj4+
ICsgICAgICAgc3RydWN0IGk5MTVfcG1sNCAqcG1sNCA9ICZwcGd0dC0+cG1sNDsKPj4+PiArICAg
ICAgIHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICpkZXZfcHJpdiA9IHZtLT5pOTE1Owo+Pj4+ICsg
ICAgICAgc3RydWN0IHB2X3BwZ3R0X3VwZGF0ZSAqcHZfcHBndHQgPQo+Pj4+ICsgICAgICAgICAg
ICAgICAgICAgICAgICZkZXZfcHJpdi0+dmdwdS5zaGFyZWRfcGFnZS0+YnVmLnB2X3BwZ3R0Owo+
Pj4+ICsgICAgICAgdTY0IG9yaWdfc3RhcnQgPSBzdGFydDsKPj4+PiArICAgICAgIHU2NCBvcmln
X2xlbmd0aCA9IGxlbmd0aDsKPj4+PiArCj4+Pj4gKyAgICAgICBnZW44X3BwZ3R0X2NsZWFyXzRs
dmwodm0sIHN0YXJ0LCBsZW5ndGgpOwo+Pj4+ICsKPj4+PiArICAgICAgIHB2X3BwZ3R0LT5wZHAg
PSBweF9kbWEocG1sNCk7Cj4+Pj4gKyAgICAgICBwdl9wcGd0dC0+c3RhcnQgPSBvcmlnX3N0YXJ0
Owo+Pj4+ICsgICAgICAgcHZfcHBndHQtPmxlbmd0aCA9IG9yaWdfbGVuZ3RoOwo+Pj4+ICsgICAg
ICAgSTkxNV9XUklURSh2Z3RpZl9yZWcoZzJ2X25vdGlmeSksIFZHVF9HMlZfUFBHVFRfTDRfQ0xF
QVIpOwo+Pj4+ICt9Cj4+Pj4gKwo+Pj4+ICtzdGF0aWMgdm9pZCBnZW44X3BwZ3R0X2luc2VydF80
bHZsX3B2KHN0cnVjdCBpOTE1X2FkZHJlc3Nfc3BhY2UgKnZtLAo+Pj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGk5MTVfdm1hICp2bWEsCj4+Pj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBlbnVtIGk5MTVfY2FjaGVfbGV2ZWwgY2FjaGVfbGV2
ZWwsCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1MzIgZmxhZ3MpCj4+
Pj4gK3sKPj4+PiArICAgICAgIHN0cnVjdCBpOTE1X2h3X3BwZ3R0ICpwcGd0dCA9IGk5MTVfdm1f
dG9fcHBndHQodm0pOwo+Pj4+ICsgICAgICAgc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmRldl9w
cml2ID0gdm0tPmk5MTU7Cj4+Pj4gKyAgICAgICBzdHJ1Y3QgcHZfcHBndHRfdXBkYXRlICpwdl9w
cGd0dCA9Cj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgJmRldl9wcml2LT52Z3B1LnNoYXJl
ZF9wYWdlLT5idWYucHZfcHBndHQ7Cj4+Pj4gKwo+Pj4+ICsgICAgICAgZ2VuOF9wcGd0dF9pbnNl
cnRfNGx2bCh2bSwgdm1hLCBjYWNoZV9sZXZlbCwgZmxhZ3MpOwo+Pj4+ICsKPj4+PiArICAgICAg
IHB2X3BwZ3R0LT5wZHAgPSBweF9kbWEoJnBwZ3R0LT5wbWw0KTsKPj4+PiArICAgICAgIHB2X3Bw
Z3R0LT5zdGFydCA9IHZtYS0+bm9kZS5zdGFydDsKPj4+PiArICAgICAgIHB2X3BwZ3R0LT5sZW5n
dGggPSB2bWEtPm5vZGUuc2l6ZTsKPj4+PiArICAgICAgIHB2X3BwZ3R0LT5jYWNoZV9sZXZlbCA9
IGNhY2hlX2xldmVsOwo+Pj4+ICsgICAgICAgSTkxNV9XUklURSh2Z3RpZl9yZWcoZzJ2X25vdGlm
eSksIFZHVF9HMlZfUFBHVFRfTDRfSU5TRVJUKTsKPj4+PiArfQo+Pj4gRm9yIHRoaXMgdG8gd29y
aywgYSB2Z3B1IG1taW8gd3JpdGUgbXVzdCBiZSB0cmFwcGVkIGFuZCBzdXNwZW5kIHRoZQo+Pj4g
Y2xpZW50IHdoaWxlIHRoZSBob3N0IHByb2Nlc3NlcyB0aGUgdHJhcC4gT3RoZXJ3aXNlLCB3ZSB3
b3VsZCBiZQo+Pj4gb3ZlcndyaXRpbmcgdGhlIHNpZGUtY2hhbm5lbCBiZWZvcmUgdGhlIGhvc3Qg
cHJvY2Vzc2VzIHRoZSBjb21tYW5kLgo+Pj4KPj4+IFRoYXQgc291bmRzIGhvcnJpYmxlLgo+Pj4g
LUNocmlzCj4+IENocmlzLCB0aGFua3MgeW91ciBjb21tZW50LiBkbyB5b3UgdGhpbmsgaXMgdGhl
IHNwaW5fbG9jayB0byBwcm90ZWN0Cj4+IHRoaXMgVkdQVSBNTUlPIHdyaXRlIGVub3VnaCB0byBl
bGltaW5hdGUgdGhlIHNpZGUtY2hhbm5lbCBlZmZlY3Q/Cj4gSSB3b3VsZCBzdWdnZXN0IHlvdSBj
b25zaWRlciB1c2luZyBhIHBhaXIgb2YgY29tbWFuZC9yZXNwb25zZSByaW5ncy4KPiAtQ2hyaXMK
PgpDaHJpcywgVGhhbmtzIHlvdXIgc3VnZ2VzdGlvbiBhbmQgcHJvbXB0IHJlc3BvbnNlLiBJIHdp
bGwgcmV3b3JrIHRoZW0KZm9yIHRoYXQgZGlyZWN0aW9uLgpCUnMsIFhpYW9saW4KCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1h
aWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
