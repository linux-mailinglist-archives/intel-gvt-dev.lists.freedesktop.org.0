Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F356113CE2
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  5 Dec 2019 09:12:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF2A56F5F3;
	Thu,  5 Dec 2019 08:12:40 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FFDD6F5F0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  5 Dec 2019 08:12:40 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Dec 2019 00:12:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,280,1571727600"; d="scan'208";a="361850248"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by orsmga004.jf.intel.com with ESMTP; 05 Dec 2019 00:12:39 -0800
Received: from fmsmsx156.amr.corp.intel.com (10.18.116.74) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 5 Dec 2019 00:12:38 -0800
Received: from shsmsx108.ccr.corp.intel.com (10.239.4.97) by
 fmsmsx156.amr.corp.intel.com (10.18.116.74) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 5 Dec 2019 00:12:38 -0800
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.90]) by
 SHSMSX108.ccr.corp.intel.com ([169.254.8.46]) with mapi id 14.03.0439.000;
 Thu, 5 Dec 2019 16:12:36 +0800
From: "Yuan, Hang" <hang.yuan@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Subject: RE: [RFC PATCH] drm/i915/gvt: aggregation type support
Thread-Topic: [RFC PATCH] drm/i915/gvt: aggregation type support
Thread-Index: AQHVqopWnXur0DUKCEWRwyPxSNzenqerLndQ
Date: Thu, 5 Dec 2019 08:12:36 +0000
Message-ID: <C294FBAE55175941838A8D362DCD8AA225F85A1A@SHSMSX104.ccr.corp.intel.com>
References: <20191204100456.1757-1-zhenyuw@linux.intel.com>
In-Reply-To: <20191204100456.1757-1-zhenyuw@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiY2EyYTI2M2MtNTAwNC00OWZjLTgyY2YtODg2MWVhNzViY2NlIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoieWF6aVJHd1hFbWRSYzJyMjArMU5Mb3NCcTFNZ0RDSXVyZFVjK3VhS0UrMVora1hwZlwvMDJXOVVBeW9hTmJpTUgifQ==
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
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
Cc: "Tian, Kevin" <kevin.tian@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBpbnRlbC1ndnQtZGV2IDxpbnRl
bC1ndnQtZGV2LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YNCj4g
Wmhlbnl1IFdhbmcNCj4gU2VudDogV2VkbmVzZGF5LCBEZWNlbWJlciA0LCAyMDE5IDY6MDUgUE0N
Cj4gVG86IGludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBUaWFuLCBL
ZXZpbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFtSRkMgUEFUQ0hdIGRybS9p
OTE1L2d2dDogYWdncmVnYXRpb24gdHlwZSBzdXBwb3J0DQo+IA0KPiBUbyBpbmNyZWFzZSB0aGUg
ZmxleGliaWxpdHkgZm9yIHJlc291cmNlIGFsbG9jYXRpb24gb24gdHlwZSwgdGhpcyB0cnlzIHRv
IGFkZA0KPiBhZ2dyZWdhdGlvbiBhdHRyaWJ1dGUgZm9yIG1kZXYgdHlwZSB0aGF0IGNhbiBhZ2dy
ZWdhdGUgZ2Z4IG1lbW9yeSByZXNvdXJjZXMNCj4gaW4gR1ZUIGNhc2UuDQo+IA0KPiBBcyBBbGV4
IHN1Z2dlc3RlZCB0byB1c2Ugc3lzZnMgbWV0aG9kIGZvciB0aGlzIGF0dHJpYnV0ZSwgdGhlIG1v
c3QgZGlmZmVyZW5jZSBmb3INCj4gR1ZUIGlzIHRoYXQgdGhlIGdmeCByZXNvdXJjZSBhbGxvY2F0
aW9uIHdpbGwgYmUgZGVsYXllZCB1bnRpbCBtZGV2IG9wZW4gaW5zdGVhZA0KPiBvZiBtZGV2IGNy
ZWF0ZSB0byBhbGxvdyBhZ2dyZWdhdGlvbiBzZXR0aW5nIGJlZm9yZSBWTSBzdGFydC4NCj4gDQo+
IEZvciBWRklPL21kZXYgY29yZSBwYXJ0LCBvbmx5IGZvcm1hbCBpbnRlcmZhY2UgZGVmaW5pdGlv
biB3b3VsZCBiZSBwcm92aWRlZC4NCj4gVGhpcyBvbmUgdHJ5cyB0byBwcm92aWRlIHRoZSBzdWdn
ZXN0ZWQgc3lzZnMgYXR0cmlidXRlcyBhbmQgZHJpdmVyIGNoYW5nZSBmb3IgR1ZUDQo+IHJldmll
dy4NCj4gDQo+IENjOiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4NCj4gU2lnbmVk
LW9mZi1ieTogWmhlbnl1IFdhbmcgPHpoZW55dXdAbGludXguaW50ZWwuY29tPg0KPiAtLS0NCj4g
IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9hcGVydHVyZV9nbS5jIHwgIDE3ICsrLQ0KPiAgZHJp
dmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d2dC5jICAgICAgICAgfCAgIDYgKy0NCj4gIGRyaXZlcnMv
Z3B1L2RybS9pOTE1L2d2dC9ndnQuaCAgICAgICAgIHwgIDM1ICsrKy0tLQ0KPiAgZHJpdmVycy9n
cHUvZHJtL2k5MTUvZ3Z0L2t2bWd0LmMgICAgICAgfCAxMDggKysrKysrKysrKysrKysrKysrLQ0K
PiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3ZncHUuYyAgICAgICAgfCAxNDEgKysrKysrKysr
KysrKysrLS0tLS0tLS0tLQ0KPiAgNSBmaWxlcyBjaGFuZ2VkLCAyMjIgaW5zZXJ0aW9ucygrKSwg
ODUgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUv
Z3Z0L2FwZXJ0dXJlX2dtLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvYXBlcnR1cmVf
Z20uYw0KPiBpbmRleCA3NzE0MjA0NTNmODIuLmI3NGQxZjlmMDdiOCAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2FwZXJ0dXJlX2dtLmMNCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZ3Z0L2FwZXJ0dXJlX2dtLmMNCj4gQEAgLTIzNCwxMCArMjM0LDEwIEBAIHN0
YXRpYyB2b2lkIGZyZWVfcmVzb3VyY2Uoc3RydWN0IGludGVsX3ZncHUgKnZncHUpDQo+ICAJZ3Z0
LT5mZW5jZS52Z3B1X2FsbG9jYXRlZF9mZW5jZV9udW0gLT0gdmdwdV9mZW5jZV9zeih2Z3B1KTsg
IH0NCj4gDQo+IC1zdGF0aWMgaW50IGFsbG9jX3Jlc291cmNlKHN0cnVjdCBpbnRlbF92Z3B1ICp2
Z3B1LA0KPiAtCQlzdHJ1Y3QgaW50ZWxfdmdwdV9jcmVhdGlvbl9wYXJhbXMgKnBhcmFtKQ0KPiAr
c3RhdGljIGludCBhbGxvY19yZXNvdXJjZShzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSkNCj4gIHsN
Cj4gIAlzdHJ1Y3QgaW50ZWxfZ3Z0ICpndnQgPSB2Z3B1LT5ndnQ7DQo+ICsJc3RydWN0IGludGVs
X3ZncHVfY3JlYXRpb25fcGFyYW1zICpwYXJhbSA9ICZ2Z3B1LT5wYXJhbTsNCj4gIAl1bnNpZ25l
ZCBsb25nIHJlcXVlc3QsIGF2YWlsLCBtYXgsIHRha2VuOw0KPiAgCWNvbnN0IGNoYXIgKml0ZW07
DQo+IA0KPiBAQCAtMjUwLDcgKzI1MCw3IEBAIHN0YXRpYyBpbnQgYWxsb2NfcmVzb3VyY2Uoc3Ry
dWN0IGludGVsX3ZncHUgKnZncHUsDQo+ICAJbWF4ID0gZ3Z0X2FwZXJ0dXJlX3N6KGd2dCkgLSBI
T1NUX0xPV19HTV9TSVpFOw0KPiAgCXRha2VuID0gZ3Z0LT5nbS52Z3B1X2FsbG9jYXRlZF9sb3df
Z21fc2l6ZTsNCj4gIAlhdmFpbCA9IG1heCAtIHRha2VuOw0KPiAtCXJlcXVlc3QgPSBNQl9UT19C
WVRFUyhwYXJhbS0+bG93X2dtX3N6KTsNCj4gKwlyZXF1ZXN0ID0gcGFyYW0tPmxvd19nbV9zeiAq
IHBhcmFtLT5hZ2dyZWdhdGlvbjsNCj4gDQo+ICAJaWYgKHJlcXVlc3QgPiBhdmFpbCkNCj4gIAkJ
Z290byBub19lbm91Z2hfcmVzb3VyY2U7DQo+IEBAIC0yNjEsNyArMjYxLDcgQEAgc3RhdGljIGlu
dCBhbGxvY19yZXNvdXJjZShzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSwNCj4gIAltYXggPSBndnRf
aGlkZGVuX3N6KGd2dCkgLSBIT1NUX0hJR0hfR01fU0laRTsNCj4gIAl0YWtlbiA9IGd2dC0+Z20u
dmdwdV9hbGxvY2F0ZWRfaGlnaF9nbV9zaXplOw0KPiAgCWF2YWlsID0gbWF4IC0gdGFrZW47DQo+
IC0JcmVxdWVzdCA9IE1CX1RPX0JZVEVTKHBhcmFtLT5oaWdoX2dtX3N6KTsNCj4gKwlyZXF1ZXN0
ID0gcGFyYW0tPmhpZ2hfZ21fc3ogKiBwYXJhbS0+YWdncmVnYXRpb247DQpbWXVhbiwgSGFuZ10g
Rm9yIHZncHUgd2l0aCBhZ2dyZWdhdGVkIHJlc291cmNlLCBzaGFsbCBpdCBnZXQgbW9yZSBmZW5j
ZSwgbW9yZSBzY2hlZHVsaW5nIHdlaWdodCBhbmQgc3VwcG9ydCBiaWdnZXIgcmVzb2x1dGlvbj8N
Cg0KPiANCj4gIAlpZiAocmVxdWVzdCA+IGF2YWlsKQ0KPiAgCQlnb3RvIG5vX2Vub3VnaF9yZXNv
dXJjZTsNCj4gQEAgLTI3OSw4ICsyNzksOCBAQCBzdGF0aWMgaW50IGFsbG9jX3Jlc291cmNlKHN0
cnVjdCBpbnRlbF92Z3B1ICp2Z3B1LA0KPiANCj4gIAl2Z3B1X2ZlbmNlX3N6KHZncHUpID0gcmVx
dWVzdDsNCj4gDQo+IC0JZ3Z0LT5nbS52Z3B1X2FsbG9jYXRlZF9sb3dfZ21fc2l6ZSArPSBNQl9U
T19CWVRFUyhwYXJhbS0NCj4gPmxvd19nbV9zeik7DQo+IC0JZ3Z0LT5nbS52Z3B1X2FsbG9jYXRl
ZF9oaWdoX2dtX3NpemUgKz0gTUJfVE9fQllURVMocGFyYW0tDQo+ID5oaWdoX2dtX3N6KTsNCj4g
KwlndnQtPmdtLnZncHVfYWxsb2NhdGVkX2xvd19nbV9zaXplICs9IHBhcmFtLT5sb3dfZ21fc3o7
DQo+ICsJZ3Z0LT5nbS52Z3B1X2FsbG9jYXRlZF9oaWdoX2dtX3NpemUgKz0gcGFyYW0tPmhpZ2hf
Z21fc3o7DQpbWXVhbiwgSGFuZ10gbXVsdGlwbHkgcGFyYW0tPmFnZ3JlZ2F0aW9uPw0KDQo+ICAJ
Z3Z0LT5mZW5jZS52Z3B1X2FsbG9jYXRlZF9mZW5jZV9udW0gKz0gcGFyYW0tPmZlbmNlX3N6Ow0K
PiAgCXJldHVybiAwOw0KPiANCj4gQEAgLTMzNCwxMiArMzM0LDExIEBAIHZvaWQgaW50ZWxfdmdw
dV9yZXNldF9yZXNvdXJjZShzdHJ1Y3QgaW50ZWxfdmdwdQ0KPiAqdmdwdSkNCj4gICAqIHplcm8g
b24gc3VjY2VzcywgbmVnYXRpdmUgZXJyb3IgY29kZSBpZiBmYWlsZWQuDQo+ICAgKg0KPiAgICov
DQo+IC1pbnQgaW50ZWxfdmdwdV9hbGxvY19yZXNvdXJjZShzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdw
dSwNCj4gLQkJc3RydWN0IGludGVsX3ZncHVfY3JlYXRpb25fcGFyYW1zICpwYXJhbSkNCj4gK2lu
dCBpbnRlbF92Z3B1X2FsbG9jX3Jlc291cmNlKHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1KQ0KPiAg
ew0KPiAgCWludCByZXQ7DQo+IA0KPiAtCXJldCA9IGFsbG9jX3Jlc291cmNlKHZncHUsIHBhcmFt
KTsNCj4gKwlyZXQgPSBhbGxvY19yZXNvdXJjZSh2Z3B1KTsNCj4gIAlpZiAocmV0KQ0KPiAgCQly
ZXR1cm4gcmV0Ow0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9n
dnQuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndnQuYw0KPiBpbmRleCBjYjVmYTMwYjhl
NjMuLjAxM2U2Y2EwYjE4MCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0
L2d2dC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndnQuYw0KPiBAQCAtOTgs
MTEgKzk4LDExIEBAIHN0YXRpYyBzc2l6ZV90IGRlc2NyaXB0aW9uX3Nob3coc3RydWN0IGtvYmpl
Y3QgKmtvYmosDQo+IHN0cnVjdCBkZXZpY2UgKmRldiwNCj4gDQo+ICAJcmV0dXJuIHNwcmludGYo
YnVmLCAibG93X2dtX3NpemU6ICVkTUJcbmhpZ2hfZ21fc2l6ZTogJWRNQlxuIg0KPiAgCQkgICAg
ICAgImZlbmNlOiAlZFxucmVzb2x1dGlvbjogJXNcbiINCj4gLQkJICAgICAgICJ3ZWlnaHQ6ICVk
XG4iLA0KPiArCQkgICAgICAgIndlaWdodDogJWRcbmFnZ3JlZ2F0aW9uOiAlc1xuIiwNCj4gIAkJ
ICAgICAgIEJZVEVTX1RPX01CKHR5cGUtPmxvd19nbV9zaXplKSwNCj4gIAkJICAgICAgIEJZVEVT
X1RPX01CKHR5cGUtPmhpZ2hfZ21fc2l6ZSksDQo+ICAJCSAgICAgICB0eXBlLT5mZW5jZSwgdmdw
dV9lZGlkX3N0cih0eXBlLT5yZXNvbHV0aW9uKSwNCj4gLQkJICAgICAgIHR5cGUtPndlaWdodCk7
DQo+ICsJCSAgICAgICB0eXBlLT53ZWlnaHQsIHR5cGUtPmFnZ3JlZ2F0aW9uID8gInllcyIgOiAi
bm8iKTsNCj4gIH0NCj4gDQo+ICBzdGF0aWMgTURFVl9UWVBFX0FUVFJfUk8oYXZhaWxhYmxlX2lu
c3RhbmNlcyk7DQo+IEBAIC0xODQsNiArMTg0LDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBpbnRl
bF9ndnRfb3BzIGludGVsX2d2dF9vcHMgPSB7DQo+ICAJLnZncHVfZ2V0X2RtYWJ1ZiA9IGludGVs
X3ZncHVfZ2V0X2RtYWJ1ZiwNCj4gIAkud3JpdGVfcHJvdGVjdF9oYW5kbGVyID0gaW50ZWxfdmdw
dV9wYWdlX3RyYWNrX2hhbmRsZXIsDQo+ICAJLmVtdWxhdGVfaG90cGx1ZyA9IGludGVsX3ZncHVf
ZW11bGF0ZV9ob3RwbHVnLA0KPiArCS52Z3B1X3Jlc19hbGxvYyA9IGludGVsX3ZncHVfcmVzX2Fs
bG9jLA0KPiArCS52Z3B1X3Jlc19mcmVlID0gaW50ZWxfdmdwdV9yZXNfZnJlZSwNCj4gIH07DQo+
IA0KPiAgc3RhdGljIHZvaWQgaW5pdF9kZXZpY2VfaW5mbyhzdHJ1Y3QgaW50ZWxfZ3Z0ICpndnQp
IGRpZmYgLS1naXQNCj4gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3Z0LmggYi9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9ndnQvZ3Z0LmggaW5kZXgNCj4gMDA4MWIwNTFkM2UwLi4yMGVlMWQ1YWVi
MTcgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndnQuaA0KPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3Z0LmgNCj4gQEAgLTE2NSw2ICsxNjUsMTggQEAg
c3RydWN0IGludGVsX3ZncHVfc3VibWlzc2lvbiB7DQo+ICAJYm9vbCBhY3RpdmU7DQo+ICB9Ow0K
PiANCj4gK3N0cnVjdCBpbnRlbF92Z3B1X2NyZWF0aW9uX3BhcmFtcyB7DQo+ICsJX191NjQgaGFu
ZGxlOw0KPiArCV9fdTY0IGxvd19nbV9zejsNCj4gKwlfX3U2NCBoaWdoX2dtX3N6Ow0KPiArCV9f
dTY0IGZlbmNlX3N6Ow0KPiArCV9fdTY0IHJlc29sdXRpb247DQo+ICsJX19zMzIgcHJpbWFyeTsN
Cj4gKwlfX3U2NCB2Z3B1X2lkOw0KPiArCV9fdTMyIHdlaWdodDsNCj4gKwlfX3UzMiBhZ2dyZWdh
dGlvbjsgLyogcmVxdWVzdGVkIGFnZ3JlZ2F0aW9uIG51bWJlciBpZiB0eXBlIHN1cHBvcnRzDQo+
ICovDQo+ICt9Ow0KPiArDQo+ICBzdHJ1Y3QgaW50ZWxfdmdwdSB7DQo+ICAJc3RydWN0IGludGVs
X2d2dCAqZ3Z0Ow0KPiAgCXN0cnVjdCBtdXRleCB2Z3B1X2xvY2s7DQo+IEBAIC0xNzQsNiArMTg2
LDggQEAgc3RydWN0IGludGVsX3ZncHUgew0KPiAgCWJvb2wgcHZfbm90aWZpZWQ7DQo+ICAJYm9v
bCBmYWlsc2FmZTsNCj4gIAl1bnNpZ25lZCBpbnQgcmVzZXR0aW5nX2VuZzsNCj4gKwlzdHJ1Y3Qg
aW50ZWxfdmdwdV9jcmVhdGlvbl9wYXJhbXMgcGFyYW07DQo+ICsJc3RydWN0IGludGVsX3ZncHVf
dHlwZSAqdHlwZTsNCj4gDQo+ICAJLyogQm90aCBzY2hlZF9kYXRhIGFuZCBzY2hlZF9jdGwgY2Fu
IGJlIHNlZW4gYSBwYXJ0IG9mIHRoZSBnbG9iYWwgZ3Z0DQo+ICAJICogc2NoZWR1bGVyIHN0cnVj
dHVyZS4gU28gYmVsb3cgMiB2Z3B1IGRhdGEgYXJlIHByb3RlY3RlZCBAQCAtMjk2LDYNCj4gKzMx
MCw3IEBAIHN0cnVjdCBpbnRlbF92Z3B1X3R5cGUgew0KPiAgCXVuc2lnbmVkIGludCBmZW5jZTsN
Cj4gIAl1bnNpZ25lZCBpbnQgd2VpZ2h0Ow0KPiAgCWVudW0gaW50ZWxfdmdwdV9lZGlkIHJlc29s
dXRpb247DQo+ICsJYm9vbCBhZ2dyZWdhdGlvbjsNCj4gIH07DQo+IA0KPiAgc3RydWN0IGludGVs
X2d2dCB7DQo+IEBAIC00MjEsMjAgKzQzNiw3IEBAIGludCBpbnRlbF9ndnRfbG9hZF9maXJtd2Fy
ZShzdHJ1Y3QgaW50ZWxfZ3Z0ICpndnQpOw0KPiAjZGVmaW5lIHZncHVfZmVuY2VfYmFzZSh2Z3B1
KSAodmdwdS0+ZmVuY2UuYmFzZSkgICNkZWZpbmUNCj4gdmdwdV9mZW5jZV9zeih2Z3B1KSAodmdw
dS0+ZmVuY2Uuc2l6ZSkNCj4gDQo+IC1zdHJ1Y3QgaW50ZWxfdmdwdV9jcmVhdGlvbl9wYXJhbXMg
ew0KPiAtCV9fdTY0IGhhbmRsZTsNCj4gLQlfX3U2NCBsb3dfZ21fc3o7ICAvKiBpbiBNQiAqLw0K
PiAtCV9fdTY0IGhpZ2hfZ21fc3o7IC8qIGluIE1CICovDQo+IC0JX191NjQgZmVuY2Vfc3o7DQo+
IC0JX191NjQgcmVzb2x1dGlvbjsNCj4gLQlfX3MzMiBwcmltYXJ5Ow0KPiAtCV9fdTY0IHZncHVf
aWQ7DQo+IC0NCj4gLQlfX3UzMiB3ZWlnaHQ7DQo+IC19Ow0KPiAtDQo+IC1pbnQgaW50ZWxfdmdw
dV9hbGxvY19yZXNvdXJjZShzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSwNCj4gLQkJCSAgICAgIHN0
cnVjdCBpbnRlbF92Z3B1X2NyZWF0aW9uX3BhcmFtcyAqcGFyYW0pOw0KPiAraW50IGludGVsX3Zn
cHVfYWxsb2NfcmVzb3VyY2Uoc3RydWN0IGludGVsX3ZncHUgKnZncHUpOw0KPiAgdm9pZCBpbnRl
bF92Z3B1X3Jlc2V0X3Jlc291cmNlKHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1KTsgIHZvaWQNCj4g
aW50ZWxfdmdwdV9mcmVlX3Jlc291cmNlKHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1KTsgIHZvaWQN
Cj4gaW50ZWxfdmdwdV93cml0ZV9mZW5jZShzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSwgQEAgLTU0
Miw2ICs1NDQsOSBAQCBzdGF0aWMNCj4gaW5saW5lIHU2NCBpbnRlbF92Z3B1X2dldF9iYXJfZ3Bh
KHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1LCBpbnQgYmFyKQ0KPiAgCQkJUENJX0JBU0VfQUREUkVT
U19NRU1fTUFTSzsNCj4gIH0NCj4gDQo+ICtpbnQgaW50ZWxfdmdwdV9yZXNfYWxsb2Moc3RydWN0
IGludGVsX3ZncHUgKnZncHUpOyB2b2lkDQo+ICtpbnRlbF92Z3B1X3Jlc19mcmVlKHN0cnVjdCBp
bnRlbF92Z3B1ICp2Z3B1KTsNCj4gKw0KPiAgdm9pZCBpbnRlbF92Z3B1X2NsZWFuX29wcmVnaW9u
KHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1KTsgIGludA0KPiBpbnRlbF92Z3B1X2luaXRfb3ByZWdp
b24oc3RydWN0IGludGVsX3ZncHUgKnZncHUpOyAgaW50DQo+IGludGVsX3ZncHVfb3ByZWdpb25f
YmFzZV93cml0ZV9oYW5kbGVyKHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1LCB1MzIgZ3BhKTsNCj4g
QEAgLTU3Niw2ICs1ODEsOCBAQCBzdHJ1Y3QgaW50ZWxfZ3Z0X29wcyB7DQo+ICAJaW50ICgqd3Jp
dGVfcHJvdGVjdF9oYW5kbGVyKShzdHJ1Y3QgaW50ZWxfdmdwdSAqLCB1NjQsIHZvaWQgKiwNCj4g
IAkJCQkgICAgIHVuc2lnbmVkIGludCk7DQo+ICAJdm9pZCAoKmVtdWxhdGVfaG90cGx1Zykoc3Ry
dWN0IGludGVsX3ZncHUgKnZncHUsIGJvb2wgY29ubmVjdGVkKTsNCj4gKwlpbnQgKCp2Z3B1X3Jl
c19hbGxvYykoc3RydWN0IGludGVsX3ZncHUgKnZncHUpOw0KPiArCXZvaWQgKCp2Z3B1X3Jlc19m
cmVlKShzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSk7DQo+ICB9Ow0KPiANCj4gDQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQva3ZtZ3QuYw0KPiBiL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2d2dC9rdm1ndC5jDQo+IGluZGV4IGE2OTllY2FkZTNmYy4uMDAxYWU1ZDAxYjRlIDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQva3ZtZ3QuYw0KPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQva3ZtZ3QuYw0KPiBAQCAtNjY4LDcgKzY2OCw4IEBAIHN0
YXRpYyBpbnQgaW50ZWxfdmdwdV9jcmVhdGUoc3RydWN0IGtvYmplY3QgKmtvYmosIHN0cnVjdA0K
PiBtZGV2X2RldmljZSAqbWRldikNCj4gIAkJZ3Z0X2VycigiZmFpbGVkIHRvIGNyZWF0ZSBpbnRl
bCB2Z3B1OiAlZFxuIiwgcmV0KTsNCj4gIAkJZ290byBvdXQ7DQo+ICAJfQ0KPiAtDQo+ICsJdmdw
dS0+dHlwZSA9IHR5cGU7DQo+ICsNCj4gIAlJTklUX1dPUksoJnZncHUtPnZkZXYucmVsZWFzZV93
b3JrLCBpbnRlbF92Z3B1X3JlbGVhc2Vfd29yayk7DQo+IA0KPiAgCXZncHUtPnZkZXYubWRldiA9
IG1kZXY7DQo+IEBAIC03NDgsNiArNzQ5LDggQEAgc3RhdGljIGludCBpbnRlbF92Z3B1X29wZW4o
c3RydWN0IG1kZXZfZGV2aWNlICptZGV2KQ0KPiAgCXVuc2lnbmVkIGxvbmcgZXZlbnRzOw0KPiAg
CWludCByZXQ7DQo+IA0KPiArCW11dGV4X2xvY2soJnZncHUtPnZncHVfbG9jayk7DQo+ICsNCj4g
IAl2Z3B1LT52ZGV2LmlvbW11X25vdGlmaWVyLm5vdGlmaWVyX2NhbGwgPSBpbnRlbF92Z3B1X2lv
bW11X25vdGlmaWVyOw0KPiAgCXZncHUtPnZkZXYuZ3JvdXBfbm90aWZpZXIubm90aWZpZXJfY2Fs
bCA9IGludGVsX3ZncHVfZ3JvdXBfbm90aWZpZXI7DQo+IA0KPiBAQCAtNzY5LDIxICs3NzIsMzIg
QEAgc3RhdGljIGludCBpbnRlbF92Z3B1X29wZW4oc3RydWN0IG1kZXZfZGV2aWNlICptZGV2KQ0K
PiAgCQlnb3RvIHVuZG9faW9tbXU7DQo+ICAJfQ0KPiANCj4gKwlpZiAodmdwdS0+dHlwZS0+YWdn
cmVnYXRpb24gJiYgdmdwdS0+cGFyYW0uYWdncmVnYXRpb24pIHsNCj4gKwkJcmV0ID0gaW50ZWxf
Z3Z0X29wcy0+dmdwdV9yZXNfYWxsb2ModmdwdSk7DQo+ICsJCWlmIChyZXQpDQo+ICsJCQlnb3Rv
IHVuZG9fZ3JvdXA7DQo+ICsJfQ0KPiArDQpbWXVhbiwgSGFuZ10gSWYgZmlyc3RseSBjcmVhdGUg
b25lIGFnZ3JlZ2F0ZWQgdmdwdSB3aXRoIG1heGltdW0gYWdncmVnYXRpb24gbnVtYmVyLCBzZWNv
bmRseSBjcmVhdGUgbm9uLWFnZ3JlZ2F0ZWQgdmdwdSwgbGF0ZXIgd2hlbiBvcGVuIHRoZSBhZ2dy
ZWdhdGVkIHZncHUsIHJlc291cmNlIGFsbG9jYXRpb24gd2lsbCBiZSBmYWlsZWQuIElzIGl0IGEg
a25vd24gdW5zdXBwb3J0ZWQgdXNhZ2U/DQoNCj4gIAkvKiBUYWtlIGEgbW9kdWxlIHJlZmVyZW5j
ZSBhcyBtZGV2IGNvcmUgZG9lc24ndCB0YWtlDQo+ICAJICogYSByZWZlcmVuY2UgZm9yIHZlbmRv
ciBkcml2ZXIuDQo+ICAJICovDQo+ICAJaWYgKCF0cnlfbW9kdWxlX2dldChUSElTX01PRFVMRSkp
DQo+IC0JCWdvdG8gdW5kb19ncm91cDsNCj4gKwkJZ290byBmcmVlX3JlczsNCj4gDQo+ICAJcmV0
ID0ga3ZtZ3RfZ3Vlc3RfaW5pdChtZGV2KTsNCj4gLQlpZiAocmV0KQ0KPiAtCQlnb3RvIHVuZG9f
Z3JvdXA7DQo+ICsJaWYgKHJldCkgew0KPiArCQltb2R1bGVfcHV0KFRISVNfTU9EVUxFKTsNCj4g
KwkJZ290byBmcmVlX3JlczsNCj4gKwl9DQo+IA0KPiAgCWludGVsX2d2dF9vcHMtPnZncHVfYWN0
aXZhdGUodmdwdSk7DQo+IA0KPiAgCWF0b21pY19zZXQoJnZncHUtPnZkZXYucmVsZWFzZWQsIDAp
Ow0KPiAtCXJldHVybiByZXQ7DQo+ICsJZ290byBvdXQ7DQo+IA0KPiArZnJlZV9yZXM6DQo+ICsJ
aWYgKHZncHUtPnR5cGUtPmFnZ3JlZ2F0aW9uICYmIHZncHUtPnBhcmFtLmFnZ3JlZ2F0aW9uKQ0K
PiArCQlpbnRlbF9ndnRfb3BzLT52Z3B1X3Jlc19mcmVlKHZncHUpOw0KPiAgdW5kb19ncm91cDoN
Cj4gIAl2ZmlvX3VucmVnaXN0ZXJfbm90aWZpZXIobWRldl9kZXYobWRldiksIFZGSU9fR1JPVVBf
Tk9USUZZLA0KPiAgCQkJCQkmdmdwdS0+dmRldi5ncm91cF9ub3RpZmllcik7DQo+IEBAIC03OTIs
NiArODA2LDcgQEAgc3RhdGljIGludCBpbnRlbF92Z3B1X29wZW4oc3RydWN0IG1kZXZfZGV2aWNl
ICptZGV2KQ0KPiAgCXZmaW9fdW5yZWdpc3Rlcl9ub3RpZmllcihtZGV2X2RldihtZGV2KSwgVkZJ
T19JT01NVV9OT1RJRlksDQo+ICAJCQkJCSZ2Z3B1LT52ZGV2LmlvbW11X25vdGlmaWVyKTsNCj4g
IG91dDoNCj4gKwltdXRleF91bmxvY2soJnZncHUtPnZncHVfbG9jayk7DQo+ICAJcmV0dXJuIHJl
dDsNCj4gIH0NCj4gDQo+IEBAIC0xNTc2LDggKzE1OTEsOTEgQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCBhdHRyaWJ1dGVfZ3JvdXAgaW50ZWxfdmdwdV9ncm91cA0KPiA9IHsNCj4gIAkuYXR0cnMgPSBp
bnRlbF92Z3B1X2F0dHJzLA0KPiAgfTsNCj4gDQo+ICsvKg0KPiArICogImFnZ3JlZ2F0aW9uIiBk
aXNwbGF5IGN1cnJlbnQgbWF4aXVtIGluc3RhbmNlcyBmb3IgYWdncmVnYXRpb24sDQo+ICsgKiBp
ZiB0eXBlIGRvZXNuJ3Qgc3VwcG9ydCBhZ2dyZWdhdGlvbiwgaXQgZGlzcGxheXMgMCAgKi8gc3Rh
dGljDQo+ICtzc2l6ZV90IGFnZ3JlZ2F0aW9uX3Nob3coc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1
Y3QgZGV2aWNlX2F0dHJpYnV0ZQ0KPiArKmF0dHIsDQo+ICsJCSBjaGFyICpidWYpDQo+ICt7DQo+
ICsJc3RydWN0IG1kZXZfZGV2aWNlICptZGV2ID0gbWRldl9mcm9tX2RldihkZXYpOw0KPiArDQo+
ICsJaWYgKG1kZXYpIHsNCj4gKwkJc3RydWN0IGludGVsX3ZncHUgKnZncHUgPSAoc3RydWN0IGlu
dGVsX3ZncHUgKikNCj4gKwkJCW1kZXZfZ2V0X2RydmRhdGEobWRldik7DQo+ICsJCXN0cnVjdCBp
bnRlbF92Z3B1X3R5cGUgKnR5cGUgPSB2Z3B1LT50eXBlOw0KPiArCQlpZiAodHlwZS0+YWdncmVn
YXRpb24pDQo+ICsJCQlyZXR1cm4gc3ByaW50ZihidWYsICIldVxuIiwgdHlwZS0+YXZhaWxfaW5z
dGFuY2UpOw0KPiArCX0NCj4gKwlyZXR1cm4gc3ByaW50ZihidWYsICIwXG4iKTsNCj4gK30NCj4g
Kw0KPiArc3RhdGljIHNzaXplX3QNCj4gK2FnZ3JlZ2F0aW9uX3N0b3JlKHN0cnVjdCBkZXZpY2Ug
KmRldiwgc3RydWN0IGRldmljZV9hdHRyaWJ1dGUgKmF0dHIsDQo+ICsJCSAgY29uc3QgY2hhciAq
YnVmLCBzaXplX3QgY291bnQpDQo+ICt7DQo+ICsJc3RydWN0IG1kZXZfZGV2aWNlICptZGV2ID0g
bWRldl9mcm9tX2RldihkZXYpOw0KPiArCXVuc2lnbmVkIGxvbmcgdmFsOw0KPiArDQo+ICsJaWYg
KGtzdHJ0b3VsKGJ1ZiwgMCwgJnZhbCkgPCAwKQ0KPiArCQlyZXR1cm4gLUVJTlZBTDsNCj4gKw0K
PiArCWlmICh2YWwgJiYgbWRldikgew0KPiArCQlzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSA9IChz
dHJ1Y3QgaW50ZWxfdmdwdSAqKQ0KPiArCQkJbWRldl9nZXRfZHJ2ZGF0YShtZGV2KTsNCj4gKwkJ
c3RydWN0IGludGVsX3ZncHVfdHlwZSAqdHlwZSA9IHZncHUtPnR5cGU7DQo+ICsNCj4gKwkJbXV0
ZXhfbG9jaygmdmdwdS0+dmdwdV9sb2NrKTsNCj4gKwkJaWYgKHZncHUtPmFjdGl2ZSkgew0KPiAr
CQkJbXV0ZXhfdW5sb2NrKCZ2Z3B1LT52Z3B1X2xvY2spOw0KPiArCQkJZ290byBvdXQ7DQo+ICsJ
CX0NCj4gKwkJaWYgKHR5cGUtPmFnZ3JlZ2F0aW9uICYmIHZhbCA8PSB0eXBlLT5hdmFpbF9pbnN0
YW5jZSkgew0KPiArCQkJLyogY2hlY2sgdmFsIGFnYWluc3QgbWF4aXVtIGFnZ3JlZ2F0aW9uIGlu
c3RhbmNlDQo+IG51bWJlciAqLw0KPiArCQkJLyogc2V0IHZncHUncyBhZ2dyZWdhdGlvbiBwYXJh
bWV0ZXIgYXMgdmFsICovDQo+ICsJCQl2Z3B1LT5wYXJhbS5hZ2dyZWdhdGlvbiA9IHZhbDsNCj4g
KwkJCW11dGV4X3VubG9jaygmdmdwdS0+dmdwdV9sb2NrKTsNCj4gKwkJCXJldHVybiBjb3VudDsN
Cj4gKwkJfQ0KPiArCQltdXRleF91bmxvY2soJnZncHUtPnZncHVfbG9jayk7DQo+ICsJfQ0KPiAr
b3V0Og0KPiArCXJldHVybiAtRUlOVkFMOw0KPiArfQ0KPiArc3RhdGljIERFVklDRV9BVFRSX1JX
KGFnZ3JlZ2F0aW9uKTsNCj4gKw0KPiArc3RhdGljIHNzaXplX3QNCj4gK2FnZ3JlZ2F0ZWRfaW5z
dGFuY2VzX3Nob3coc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSAq
YXR0ciwNCj4gKwkJIGNoYXIgKmJ1ZikNCj4gK3sNCj4gKwlzdHJ1Y3QgbWRldl9kZXZpY2UgKm1k
ZXYgPSBtZGV2X2Zyb21fZGV2KGRldik7DQo+ICsNCj4gKwlpZiAobWRldikgew0KPiArCQlzdHJ1
Y3QgaW50ZWxfdmdwdSAqdmdwdSA9IChzdHJ1Y3QgaW50ZWxfdmdwdSAqKQ0KPiArCQkJbWRldl9n
ZXRfZHJ2ZGF0YShtZGV2KTsNCj4gKwkJc3RydWN0IGludGVsX3ZncHVfdHlwZSAqdHlwZSA9IHZn
cHUtPnR5cGU7DQo+ICsJCWlmICh0eXBlLT5hZ2dyZWdhdGlvbikNCj4gKwkJCXJldHVybiBzcHJp
bnRmKGJ1ZiwgIiV1XG4iLCB2Z3B1LT5wYXJhbS5hZ2dyZWdhdGlvbik7DQo+ICsJfQ0KPiArCXJl
dHVybiBzcHJpbnRmKGJ1ZiwgIjBcbiIpOw0KPiArfQ0KPiArc3RhdGljIERFVklDRV9BVFRSX1JP
KGFnZ3JlZ2F0ZWRfaW5zdGFuY2VzKTsNCj4gKw0KPiArc3RhdGljIHN0cnVjdCBhdHRyaWJ1dGUg
Km1kZXZfYXR0cnNbXSA9IHsNCj4gKwkmZGV2X2F0dHJfYWdncmVnYXRpb24uYXR0ciwNCj4gKwkm
ZGV2X2F0dHJfYWdncmVnYXRlZF9pbnN0YW5jZXMuYXR0ciwNCj4gKwlOVUxMDQo+ICt9Ow0KPiAr
DQo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGF0dHJpYnV0ZV9ncm91cCBtZGV2X2dyb3VwID0gew0K
PiArCS5uYW1lID0gIm1kZXYiLA0KPiArCS5hdHRycyA9IG1kZXZfYXR0cnMsDQo+ICt9Ow0KPiAr
DQo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGF0dHJpYnV0ZV9ncm91cCAqaW50ZWxfdmdwdV9ncm91
cHNbXSA9IHsNCj4gIAkmaW50ZWxfdmdwdV9ncm91cCwNCj4gKwkmbWRldl9ncm91cCwNCj4gIAlO
VUxMLA0KPiAgfTsNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQv
dmdwdS5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3ZncHUuYw0KPiBpbmRleCAxZTA4NjU5
MDUxMzYuLjZhOWFkN2VjM2RkOCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUv
Z3Z0L3ZncHUuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvdmdwdS5jDQo+IEBA
IC04OCwxMiArODgsMTMgQEAgc3RhdGljIHN0cnVjdCB7DQo+ICAJdW5zaWduZWQgaW50IHdlaWdo
dDsNCj4gIAllbnVtIGludGVsX3ZncHVfZWRpZCBlZGlkOw0KPiAgCWNoYXIgKm5hbWU7DQo+ICsJ
Ym9vbCBhZ2dyZWdhdGlvbjsNCj4gIH0gdmdwdV90eXBlc1tdID0gew0KPiAgLyogRml4ZWQgdkdQ
VSB0eXBlIHRhYmxlICovDQo+IC0JeyBNQl9UT19CWVRFUyg2NCksIE1CX1RPX0JZVEVTKDM4NCks
IDQsIFZHUFVfV0VJR0hUKDgpLA0KPiBHVlRfRURJRF8xMDI0Xzc2OCwgIjgiIH0sDQo+IC0JeyBN
Ql9UT19CWVRFUygxMjgpLCBNQl9UT19CWVRFUyg1MTIpLCA0LCBWR1BVX1dFSUdIVCg0KSwNCj4g
R1ZUX0VESURfMTkyMF8xMjAwLCAiNCIgfSwNCj4gLQl7IE1CX1RPX0JZVEVTKDI1NiksIE1CX1RP
X0JZVEVTKDEwMjQpLCA0LCBWR1BVX1dFSUdIVCgyKSwNCj4gR1ZUX0VESURfMTkyMF8xMjAwLCAi
MiIgfSwNCj4gLQl7IE1CX1RPX0JZVEVTKDUxMiksIE1CX1RPX0JZVEVTKDIwNDgpLCA0LCBWR1BV
X1dFSUdIVCgxKSwNCj4gR1ZUX0VESURfMTkyMF8xMjAwLCAiMSIgfSwNCj4gKwl7IE1CX1RPX0JZ
VEVTKDY0KSwgTUJfVE9fQllURVMoMzg0KSwgNCwgVkdQVV9XRUlHSFQoOCksDQo+IEdWVF9FRElE
XzEwMjRfNzY4LCAiOCIsIHRydWUgfSwNCj4gKwl7IE1CX1RPX0JZVEVTKDEyOCksIE1CX1RPX0JZ
VEVTKDUxMiksIDQsIFZHUFVfV0VJR0hUKDQpLA0KPiBHVlRfRURJRF8xOTIwXzEyMDAsICI0Iiwg
ZmFsc2UgfSwNCj4gKwl7IE1CX1RPX0JZVEVTKDI1NiksIE1CX1RPX0JZVEVTKDEwMjQpLCA0LCBW
R1BVX1dFSUdIVCgyKSwNCj4gR1ZUX0VESURfMTkyMF8xMjAwLCAiMiIsIGZhbHNlIH0sDQo+ICsJ
eyBNQl9UT19CWVRFUyg1MTIpLCBNQl9UT19CWVRFUygyMDQ4KSwgNCwgVkdQVV9XRUlHSFQoMSks
DQo+ICtHVlRfRURJRF8xOTIwXzEyMDAsICIxIiwgZmFsc2UgfSwNCj4gIH07DQo+IA0KPiAgLyoq
DQo+IEBAIC0xNDcsNiArMTQ4LDcgQEAgaW50IGludGVsX2d2dF9pbml0X3ZncHVfdHlwZXMoc3Ry
dWN0IGludGVsX2d2dCAqZ3Z0KQ0KPiAgCQlndnQtPnR5cGVzW2ldLnJlc29sdXRpb24gPSB2Z3B1
X3R5cGVzW2ldLmVkaWQ7DQo+ICAJCWd2dC0+dHlwZXNbaV0uYXZhaWxfaW5zdGFuY2UgPSBtaW4o
bG93X2F2YWlsIC8NCj4gdmdwdV90eXBlc1tpXS5sb3dfbW0sDQo+ICAJCQkJCQkgICBoaWdoX2F2
YWlsIC8NCj4gdmdwdV90eXBlc1tpXS5oaWdoX21tKTsNCj4gKwkJZ3Z0LT50eXBlc1tpXS5hZ2dy
ZWdhdGlvbiA9IHZncHVfdHlwZXNbaV0uYWdncmVnYXRpb247DQo+IA0KPiAgCQlpZiAoSVNfR0VO
KGd2dC0+ZGV2X3ByaXYsIDgpKQ0KPiAgCQkJc3ByaW50ZihndnQtPnR5cGVzW2ldLm5hbWUsICJH
VlRnX1Y0XyVzIiwgQEAgLTIxMiw5DQo+ICsyMTQsNyBAQCBzdGF0aWMgdm9pZCBpbnRlbF9ndnRf
dXBkYXRlX3ZncHVfdHlwZXMoc3RydWN0IGludGVsX2d2dCAqZ3Z0KQ0KPiAgICovDQo+ICB2b2lk
IGludGVsX2d2dF9hY3RpdmF0ZV92Z3B1KHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1KSAgew0KPiAt
CW11dGV4X2xvY2soJnZncHUtPnZncHVfbG9jayk7DQo+ICAJdmdwdS0+YWN0aXZlID0gdHJ1ZTsN
Cj4gLQltdXRleF91bmxvY2soJnZncHUtPnZncHVfbG9jayk7DQo+ICB9DQo+IA0KPiAgLyoqDQo+
IEBAIC0yNTgsNiArMjU4LDggQEAgdm9pZCBpbnRlbF9ndnRfcmVsZWFzZV92Z3B1KHN0cnVjdCBp
bnRlbF92Z3B1ICp2Z3B1KQ0KPiAgCW11dGV4X2xvY2soJnZncHUtPnZncHVfbG9jayk7DQo+ICAJ
aW50ZWxfdmdwdV9jbGVhbl93b3JrbG9hZHModmdwdSwgQUxMX0VOR0lORVMpOw0KPiAgCWludGVs
X3ZncHVfZG1hYnVmX2NsZWFudXAodmdwdSk7DQo+ICsJaWYgKHZncHUtPnR5cGUtPmFnZ3JlZ2F0
aW9uKQ0KPiArCQlpbnRlbF92Z3B1X3Jlc19mcmVlKHZncHUpOw0KPiAgCW11dGV4X3VubG9jaygm
dmdwdS0+dmdwdV9sb2NrKTsNCj4gIH0NCj4gDQo+IEBAIC0zNTYsNTkgKzM1OCw3NyBAQCB2b2lk
IGludGVsX2d2dF9kZXN0cm95X2lkbGVfdmdwdShzdHJ1Y3QgaW50ZWxfdmdwdQ0KPiAqdmdwdSkN
Cj4gIAl2ZnJlZSh2Z3B1KTsNCj4gIH0NCj4gDQo+IC1zdGF0aWMgc3RydWN0IGludGVsX3ZncHUg
Kl9faW50ZWxfZ3Z0X2NyZWF0ZV92Z3B1KHN0cnVjdCBpbnRlbF9ndnQgKmd2dCwNCj4gLQkJc3Ry
dWN0IGludGVsX3ZncHVfY3JlYXRpb25fcGFyYW1zICpwYXJhbSkNCj4gK2ludCBpbnRlbF92Z3B1
X3Jlc19hbGxvYyhzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSkNCj4gIHsNCj4gLQlzdHJ1Y3QgaW50
ZWxfdmdwdSAqdmdwdTsNCj4gIAlpbnQgcmV0Ow0KPiArDQo+ICsJcmV0ID0gaW50ZWxfdmdwdV9h
bGxvY19yZXNvdXJjZSh2Z3B1KTsNCj4gKwlpZiAocmV0KQ0KPiArCQlyZXR1cm4gcmV0Ow0KPiAN
Cj4gLQlndnRfZGJnX2NvcmUoImhhbmRsZSAlbGx1IGxvdyAlbGx1IE1CIGhpZ2ggJWxsdSBNQiBm
ZW5jZSAlbGx1XG4iLA0KPiAtCQkJcGFyYW0tPmhhbmRsZSwgcGFyYW0tPmxvd19nbV9zeiwgcGFy
YW0tDQo+ID5oaWdoX2dtX3N6LA0KPiAtCQkJcGFyYW0tPmZlbmNlX3N6KTsNCj4gKwlwb3B1bGF0
ZV9wdmluZm9fcGFnZSh2Z3B1KTsNCj4gDQo+IC0JdmdwdSA9IHZ6YWxsb2Moc2l6ZW9mKCp2Z3B1
KSk7DQo+IC0JaWYgKCF2Z3B1KQ0KPiAtCQlyZXR1cm4gRVJSX1BUUigtRU5PTUVNKTsNCj4gKwly
ZXQgPSBpbnRlbF92Z3B1X2luaXRfZ3R0KHZncHUpOw0KPiArCWlmIChyZXQpIHsNCj4gKwkJaW50
ZWxfdmdwdV9mcmVlX3Jlc291cmNlKHZncHUpOw0KPiArCQlyZXR1cm4gcmV0Ow0KPiArCX0NCj4g
KwkvKiBjYWxjdWxhdGUgbGVmdCBpbnN0YW5jZSBjaGFuZ2UgZm9yIHR5cGVzICovDQo+ICsJbXV0
ZXhfbG9jaygmdmdwdS0+Z3Z0LT5sb2NrKTsNCj4gKwlpbnRlbF9ndnRfdXBkYXRlX3ZncHVfdHlw
ZXModmdwdS0+Z3Z0KTsNCj4gKwltdXRleF91bmxvY2soJnZncHUtPmd2dC0+bG9jayk7DQo+ICsJ
cmV0dXJuIDA7DQo+ICt9DQo+ICsNCj4gK3ZvaWQgaW50ZWxfdmdwdV9yZXNfZnJlZShzdHJ1Y3Qg
aW50ZWxfdmdwdSAqdmdwdSkgew0KPiArCWludGVsX3ZncHVfY2xlYW5fZ3R0KHZncHUpOw0KPiAr
CWludGVsX3ZncHVfZnJlZV9yZXNvdXJjZSh2Z3B1KTsNCj4gKwltdXRleF9sb2NrKCZ2Z3B1LT5n
dnQtPmxvY2spOw0KPiArCWludGVsX2d2dF91cGRhdGVfdmdwdV90eXBlcyh2Z3B1LT5ndnQpOw0K
PiArCW11dGV4X3VubG9jaygmdmdwdS0+Z3Z0LT5sb2NrKTsNCj4gK30NCj4gKw0KPiArc3RhdGlj
IGludA0KPiArX19pbnRlbF9ndnRfY3JlYXRlX3ZncHUoc3RydWN0IGludGVsX3ZncHUgKnZncHUs
DQo+ICsJCQlib29sIGRlbGF5X3Jlc19hbGxvYykNCj4gK3sNCj4gKwlzdHJ1Y3QgaW50ZWxfZ3Z0
ICpndnQgPSB2Z3B1LT5ndnQ7DQo+ICsJaW50IHJldDsNCj4gDQo+ICAJcmV0ID0gaWRyX2FsbG9j
KCZndnQtPnZncHVfaWRyLCB2Z3B1LCBJRExFX1ZHUFVfSURSICsgMSwNCj4gR1ZUX01BWF9WR1BV
LA0KPiAtCQlHRlBfS0VSTkVMKTsNCj4gKwkJCUdGUF9LRVJORUwpOw0KPiAgCWlmIChyZXQgPCAw
KQ0KPiAtCQlnb3RvIG91dF9mcmVlX3ZncHU7DQo+IC0NCj4gKwkJcmV0dXJuIHJldDsNCj4gIAl2
Z3B1LT5pZCA9IHJldDsNCj4gLQl2Z3B1LT5oYW5kbGUgPSBwYXJhbS0+aGFuZGxlOw0KPiAtCXZn
cHUtPmd2dCA9IGd2dDsNCj4gLQl2Z3B1LT5zY2hlZF9jdGwud2VpZ2h0ID0gcGFyYW0tPndlaWdo
dDsNCj4gKw0KPiAgCW11dGV4X2luaXQoJnZncHUtPnZncHVfbG9jayk7DQo+ICAJbXV0ZXhfaW5p
dCgmdmdwdS0+ZG1hYnVmX2xvY2spOw0KPiAgCUlOSVRfTElTVF9IRUFEKCZ2Z3B1LT5kbWFidWZf
b2JqX2xpc3RfaGVhZCk7DQo+ICAJSU5JVF9SQURJWF9UUkVFKCZ2Z3B1LT5wYWdlX3RyYWNrX3Ry
ZWUsIEdGUF9LRVJORUwpOw0KPiAgCWlkcl9pbml0KCZ2Z3B1LT5vYmplY3RfaWRyKTsNCj4gLQlp
bnRlbF92Z3B1X2luaXRfY2ZnX3NwYWNlKHZncHUsIHBhcmFtLT5wcmltYXJ5KTsNCj4gKw0KPiAr
CWludGVsX3ZncHVfaW5pdF9jZmdfc3BhY2UodmdwdSwgdmdwdS0+cGFyYW0ucHJpbWFyeSk7DQo+
IA0KPiAgCXJldCA9IGludGVsX3ZncHVfaW5pdF9tbWlvKHZncHUpOw0KPiAgCWlmIChyZXQpDQo+
ICAJCWdvdG8gb3V0X2NsZWFuX2lkcjsNCj4gDQo+IC0JcmV0ID0gaW50ZWxfdmdwdV9hbGxvY19y
ZXNvdXJjZSh2Z3B1LCBwYXJhbSk7DQo+IC0JaWYgKHJldCkNCj4gLQkJZ290byBvdXRfY2xlYW5f
dmdwdV9tbWlvOw0KPiAtDQo+IC0JcG9wdWxhdGVfcHZpbmZvX3BhZ2UodmdwdSk7DQo+ICsJaWYg
KCFkZWxheV9yZXNfYWxsb2MpIHsNCj4gKwkJcmV0ID0gaW50ZWxfdmdwdV9yZXNfYWxsb2Modmdw
dSk7DQo+ICsJCWlmIChyZXQpDQo+ICsJCQlnb3RvIG91dF9jbGVhbl92Z3B1X21taW87DQo+ICsJ
fQ0KPiANCj4gIAlyZXQgPSBpbnRlbF9ndnRfaHlwZXJ2aXNvcl9hdHRhY2hfdmdwdSh2Z3B1KTsN
Cj4gIAlpZiAocmV0KQ0KPiAgCQlnb3RvIG91dF9jbGVhbl92Z3B1X3Jlc291cmNlOw0KPiANCj4g
LQlyZXQgPSBpbnRlbF92Z3B1X2luaXRfZ3R0KHZncHUpOw0KPiAtCWlmIChyZXQpDQo+IC0JCWdv
dG8gb3V0X2RldGFjaF9oeXBlcnZpc29yX3ZncHU7DQo+IC0NCj4gIAlyZXQgPSBpbnRlbF92Z3B1
X2luaXRfb3ByZWdpb24odmdwdSk7DQo+ICAJaWYgKHJldCkNCj4gLQkJZ290byBvdXRfY2xlYW5f
Z3R0Ow0KPiArCQlnb3RvIG91dF9kZXRhY2hfaHlwZXJ2aXNvcl92Z3B1Ow0KPiANCj4gLQlyZXQg
PSBpbnRlbF92Z3B1X2luaXRfZGlzcGxheSh2Z3B1LCBwYXJhbS0+cmVzb2x1dGlvbik7DQo+ICsJ
cmV0ID0gaW50ZWxfdmdwdV9pbml0X2Rpc3BsYXkodmdwdSwgdmdwdS0+cGFyYW0ucmVzb2x1dGlv
bik7DQo+ICAJaWYgKHJldCkNCj4gIAkJZ290byBvdXRfY2xlYW5fb3ByZWdpb247DQo+IA0KPiBA
QCAtNDMwLDcgKzQ1MCw3IEBAIHN0YXRpYyBzdHJ1Y3QgaW50ZWxfdmdwdSAqX19pbnRlbF9ndnRf
Y3JlYXRlX3ZncHUoc3RydWN0DQo+IGludGVsX2d2dCAqZ3Z0LA0KPiAgCWlmIChyZXQpDQo+ICAJ
CWdvdG8gb3V0X2NsZWFuX3NjaGVkX3BvbGljeTsNCj4gDQo+IC0JcmV0dXJuIHZncHU7DQo+ICsJ
cmV0dXJuIDA7DQo+IA0KPiAgb3V0X2NsZWFuX3NjaGVkX3BvbGljeToNCj4gIAlpbnRlbF92Z3B1
X2NsZWFuX3NjaGVkX3BvbGljeSh2Z3B1KTsNCj4gQEAgLTQ0MCwxOSArNDYwLDE3IEBAIHN0YXRp
YyBzdHJ1Y3QgaW50ZWxfdmdwdQ0KPiAqX19pbnRlbF9ndnRfY3JlYXRlX3ZncHUoc3RydWN0IGlu
dGVsX2d2dCAqZ3Z0LA0KPiAgCWludGVsX3ZncHVfY2xlYW5fZGlzcGxheSh2Z3B1KTsNCj4gIG91
dF9jbGVhbl9vcHJlZ2lvbjoNCj4gIAlpbnRlbF92Z3B1X2NsZWFuX29wcmVnaW9uKHZncHUpOw0K
PiAtb3V0X2NsZWFuX2d0dDoNCj4gLQlpbnRlbF92Z3B1X2NsZWFuX2d0dCh2Z3B1KTsNCj4gIG91
dF9kZXRhY2hfaHlwZXJ2aXNvcl92Z3B1Og0KPiAgCWludGVsX2d2dF9oeXBlcnZpc29yX2RldGFj
aF92Z3B1KHZncHUpOw0KPiAgb3V0X2NsZWFuX3ZncHVfcmVzb3VyY2U6DQo+ICsJaW50ZWxfdmdw
dV9jbGVhbl9ndHQodmdwdSk7DQo+ICAJaW50ZWxfdmdwdV9mcmVlX3Jlc291cmNlKHZncHUpOw0K
PiArCWludGVsX2d2dF91cGRhdGVfdmdwdV90eXBlcyh2Z3B1LT5ndnQpOw0KPiAgb3V0X2NsZWFu
X3ZncHVfbW1pbzoNCj4gIAlpbnRlbF92Z3B1X2NsZWFuX21taW8odmdwdSk7DQo+ICBvdXRfY2xl
YW5faWRyOg0KPiAgCWlkcl9yZW1vdmUoJmd2dC0+dmdwdV9pZHIsIHZncHUtPmlkKTsNCj4gLW91
dF9mcmVlX3ZncHU6DQo+IC0JdmZyZWUodmdwdSk7DQo+IC0JcmV0dXJuIEVSUl9QVFIocmV0KTsN
Cj4gKwlyZXR1cm4gcmV0Ow0KPiAgfQ0KPiANCj4gIC8qKg0KPiBAQCAtNDY2LDMwICs0ODQsNDMg
QEAgc3RhdGljIHN0cnVjdCBpbnRlbF92Z3B1DQo+ICpfX2ludGVsX2d2dF9jcmVhdGVfdmdwdShz
dHJ1Y3QgaW50ZWxfZ3Z0ICpndnQsDQo+ICAgKiBwb2ludGVyIHRvIGludGVsX3ZncHUsIGVycm9y
IHBvaW50ZXIgaWYgZmFpbGVkLg0KPiAgICovDQo+ICBzdHJ1Y3QgaW50ZWxfdmdwdSAqaW50ZWxf
Z3Z0X2NyZWF0ZV92Z3B1KHN0cnVjdCBpbnRlbF9ndnQgKmd2dCwNCj4gLQkJCQlzdHJ1Y3QgaW50
ZWxfdmdwdV90eXBlICp0eXBlKQ0KPiArCQkJCQkgc3RydWN0IGludGVsX3ZncHVfdHlwZSAqdHlw
ZSkNCj4gIHsNCj4gLQlzdHJ1Y3QgaW50ZWxfdmdwdV9jcmVhdGlvbl9wYXJhbXMgcGFyYW07DQo+
ICAJc3RydWN0IGludGVsX3ZncHUgKnZncHU7DQo+ICsJc3RydWN0IGludGVsX3ZncHVfY3JlYXRp
b25fcGFyYW1zICpwYXJhbTsNCj4gKwlpbnQgcmV0Ow0KPiANCj4gLQlwYXJhbS5oYW5kbGUgPSAw
Ow0KPiAtCXBhcmFtLnByaW1hcnkgPSAxOw0KPiAtCXBhcmFtLmxvd19nbV9zeiA9IHR5cGUtPmxv
d19nbV9zaXplOw0KPiAtCXBhcmFtLmhpZ2hfZ21fc3ogPSB0eXBlLT5oaWdoX2dtX3NpemU7DQo+
IC0JcGFyYW0uZmVuY2Vfc3ogPSB0eXBlLT5mZW5jZTsNCj4gLQlwYXJhbS53ZWlnaHQgPSB0eXBl
LT53ZWlnaHQ7DQo+IC0JcGFyYW0ucmVzb2x1dGlvbiA9IHR5cGUtPnJlc29sdXRpb247DQo+ICsJ
dmdwdSA9IHZ6YWxsb2Moc2l6ZW9mKCp2Z3B1KSk7DQo+ICsJaWYgKCF2Z3B1KQ0KPiArCQlyZXR1
cm4gRVJSX1BUUigtRU5PTUVNKTsNCj4gDQo+IC0JLyogWFhYIGN1cnJlbnQgcGFyYW0gYmFzZWQg
b24gTUIgKi8NCj4gLQlwYXJhbS5sb3dfZ21fc3ogPSBCWVRFU19UT19NQihwYXJhbS5sb3dfZ21f
c3opOw0KPiAtCXBhcmFtLmhpZ2hfZ21fc3ogPSBCWVRFU19UT19NQihwYXJhbS5oaWdoX2dtX3N6
KTsNCj4gKwlwYXJhbSA9ICZ2Z3B1LT5wYXJhbTsNCj4gKwlwYXJhbS0+aGFuZGxlID0gMDsNCj4g
KwlwYXJhbS0+cHJpbWFyeSA9IDE7DQo+ICsJcGFyYW0tPmxvd19nbV9zeiA9IHR5cGUtPmxvd19n
bV9zaXplOw0KPiArCXBhcmFtLT5oaWdoX2dtX3N6ID0gdHlwZS0+aGlnaF9nbV9zaXplOw0KPiAr
CXBhcmFtLT5mZW5jZV9zeiA9IHR5cGUtPmZlbmNlOw0KPiArCXBhcmFtLT53ZWlnaHQgPSB0eXBl
LT53ZWlnaHQ7DQo+ICsJcGFyYW0tPnJlc29sdXRpb24gPSB0eXBlLT5yZXNvbHV0aW9uOw0KPiAN
Cj4gKwlndnRfZGJnX2NvcmUoImhhbmRsZSAlbGx1IGxvdyAlbGx1IE1CIGhpZ2ggJWxsdSBNQiBm
ZW5jZSAlbGx1XG4iLA0KPiArCQkgICAgIHBhcmFtLT5oYW5kbGUsIEJZVEVTX1RPX01CKHBhcmFt
LT5sb3dfZ21fc3opLA0KPiArCQkgICAgIEJZVEVTX1RPX01CKHBhcmFtLT5oaWdoX2dtX3N6KSwN
Cj4gKwkJICAgICBwYXJhbS0+ZmVuY2Vfc3opOw0KPiArDQo+ICsJdmdwdS0+aGFuZGxlID0gcGFy
YW0tPmhhbmRsZTsNCj4gKwl2Z3B1LT5ndnQgPSBndnQ7DQo+ICsJdmdwdS0+c2NoZWRfY3RsLndl
aWdodCA9IHBhcmFtLT53ZWlnaHQ7DQo+ICsJcGFyYW0tPmFnZ3JlZ2F0aW9uID0gMTsNCj4gKw0K
PiAgCW11dGV4X2xvY2soJmd2dC0+bG9jayk7DQo+IC0JdmdwdSA9IF9faW50ZWxfZ3Z0X2NyZWF0
ZV92Z3B1KGd2dCwgJnBhcmFtKTsNCj4gLQlpZiAoIUlTX0VSUih2Z3B1KSkNCj4gLQkJLyogY2Fs
Y3VsYXRlIGxlZnQgaW5zdGFuY2UgY2hhbmdlIGZvciB0eXBlcyAqLw0KPiAtCQlpbnRlbF9ndnRf
dXBkYXRlX3ZncHVfdHlwZXMoZ3Z0KTsNCj4gKwlyZXQgPSBfX2ludGVsX2d2dF9jcmVhdGVfdmdw
dSh2Z3B1LCB0eXBlLT5hZ2dyZWdhdGlvbiA/IHRydWUgOiBmYWxzZSk7DQo+ICAJbXV0ZXhfdW5s
b2NrKCZndnQtPmxvY2spOw0KPiANCj4gKwlpZiAocmV0KSB7DQo+ICsJCXZmcmVlKHZncHUpOw0K
PiArCQlyZXR1cm4gRVJSX1BUUihyZXQpOw0KPiArCX0NCj4gIAlyZXR1cm4gdmdwdTsNCj4gIH0N
Cj4gDQo+IC0tDQo+IDIuMjQuMA0KPiANCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18NCj4gaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QNCj4gaW50ZWwt
Z3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2DQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdApp
bnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
