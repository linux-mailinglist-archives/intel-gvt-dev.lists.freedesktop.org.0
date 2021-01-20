Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1392FD49F
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 20 Jan 2021 16:55:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09B646E32F;
	Wed, 20 Jan 2021 15:55:51 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 705F66E090;
 Wed, 20 Jan 2021 15:55:49 +0000 (UTC)
IronPort-SDR: jZvqU9uxuwDRkdimID5hDsBOvHIZZRhna4BGPmV6Kk8r7J3qecgNpgVznD8uKWQSoG26Nz4wic
 WxXkzFxKAokQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9870"; a="179274804"
X-IronPort-AV: E=Sophos;i="5.79,361,1602572400"; d="scan'208";a="179274804"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2021 07:55:47 -0800
IronPort-SDR: vekdUt8wl7JQFiNqVrVPD+QkbulLjwIw+2vpCD7MqqKkYLL0t7sIpZdJbeFHkTjmPzEkXG+Z6B
 r7SABxBCG4Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,361,1602572400"; d="scan'208";a="384886530"
Received: from irsmsx605.ger.corp.intel.com ([163.33.146.138])
 by orsmga008.jf.intel.com with ESMTP; 20 Jan 2021 07:55:45 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 IRSMSX605.ger.corp.intel.com (163.33.146.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 20 Jan 2021 15:55:43 +0000
Received: from fmsmsx610.amr.corp.intel.com ([10.18.126.90]) by
 fmsmsx610.amr.corp.intel.com ([10.18.126.90]) with mapi id 15.01.1713.004;
 Wed, 20 Jan 2021 07:55:42 -0800
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "Nikula, Jani" <jani.nikula@intel.com>, "zhenyuw@linux.intel.com"
 <zhenyuw@linux.intel.com>
Subject: Re: [PULL] gvt-gt-next
Thread-Topic: [PULL] gvt-gt-next
Thread-Index: AQHW7VoyeicBdLdU906BboKFDGEqi6ow+ROAgAA7uwA=
Date: Wed, 20 Jan 2021 15:55:42 +0000
Message-ID: <d44c32c969692a6b09568aa296abf980b8690ef5.camel@intel.com>
References: <20210118050739.GY15982@zhen-hp.sh.intel.com>
 <161114531233.12022.4976651928998688735@jlahtine-mobl.ger.corp.intel.com>
In-Reply-To: <161114531233.12022.4976651928998688735@jlahtine-mobl.ger.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.38.3 (3.38.3-1.fc33) 
x-originating-ip: [10.22.254.132]
Content-ID: <77D51CA47ECC9748811AE8BD459316EA@intel.com>
MIME-Version: 1.0
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>, "Lv, Zhiyuan" <zhiyuan.lv@intel.com>,
 "Wang, Zhi A" <zhi.a.wang@intel.com>, "Yuan, Hang" <hang.yuan@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIxLTAxLTIwIGF0IDE0OjIxICswMjAwLCBKb29uYXMgTGFodGluZW4gd3JvdGU6
DQo+IFF1b3RpbmcgWmhlbnl1IFdhbmcgKDIwMjEtMDEtMTggMDc6MDc6MzkpDQo+ID4gDQo+ID4g
SGksDQo+ID4gDQo+ID4gVGhpcyBpcyBHVlQgbmV4dCBmb3IgNS4xMiBhZ2FpbnN0IGRybS1pbnRl
bC1ndC1uZXh0IHdoaWNoIGlzIG1vc3RseQ0KPiA+IGZvciBjbWQgcGFyc2VyIGVuaGFuY2VtZW50
IHdoaWNoIGFkZHMgZXh0cmEgY2hlY2sgb24gcmVnaXN0ZXIgbG9hZA0KPiA+IGRlcGVuZGluZyBv
biBpbml0aWFsIGNvbnRleHQgYW5kIGhhbmRsZXMgdkdQVSByZWdpc3RlciBzdGF0ZQ0KPiA+IGFj
Y29yZGluZ2x5Lg0KPiANCj4gSSB0aGluayB3ZSB3ZXJlIGJpdCBpbmNvbmNsdXNpdmUgb24gdGhp
cyBsYXN0IHRpbWUuDQo+IA0KPiBFdmVuIGlmIHRoaXMgZG9lcyBub3QgaGF2ZSBhbnkgZGVwZW5k
ZW5jeSB0byBkcm0taW50ZWwtZ3QtbmV4dCBJIGNhbg0KPiBwdWxsIHRoaXMgdG8gZHJtLWludGVs
LWd0LW5leHQuIFRoZSBvbmx5IGNhdmVhdCBpcyB0aGF0IGZvciBhbnkgLQ0KPiBmaXhlcywNCj4g
dGhlcmUgbmVlZHMgdG8gYmUgYSBiYWNrbWVyZ2UgdG8gZHJtLWludGVsLW5leHQuDQo+IA0KPiBO
b3Qgc3VyZSBpZiB0aGlzIGlzIGEgcHJvYmxlbS4gRG8gd2Ugd2FudCB0byBtYWtlIGl0IGEgcmVj
dXJyaW5nDQo+IHByYWN0aWNlDQo+IHRvIGJhY2ttZXJnZSBkcm0taW50ZWwtZ3QtbmV4dCBpbnRv
IGRybS1pbnRlbC1uZXh0IGFmdGVyIGl0IGxhbmRzIGluDQo+IGRybS1uZXh0Pw0KPiANCj4gU28g
dG8gcmVjYXA6IERvIHdlIHdhbnQgdG8gcHVsbCB0byBkcm0taW50ZWwtbmV4dCB3aGVuZXZlciB0
aGVyZSBhcmUNCj4gbm8NCj4gZGVwZW5kZW5jaWVzIHRvIGRybS1pbnRlbC1ndC1uZXh0LCB0byBh
dm9pZCBhIGJhY2ttZXJnZT8NCg0KSXQgbG9va3MgYmV0dGVyIGluZGVlZC4uLg0KDQpidXQgaG93
IHRvIHByb2NlZWQgd2hlbiB3ZSBoYXZlIGRlcGVuZGVuY2llcz8gbWVyZ2Ugb24gYm90aCBzaWRl
cyBsaWtlDQp0aGUgdG9waWMgYnJhbmNoZXM/DQoNCj4gIE9yIGRvIHdlIHdhbnQNCj4gdG8gYWx3
YXlzIGRvIGEgYmFja21lcmdlIGluIGFudGljaXBhdGlvbiBvZiAtZml4ZXMuDQo+IA0KPiBSZWdh
cmRzLCBKb29uYXMNCj4gDQo+ID4gVGhhbmtzLg0KPiA+IC0tDQo+ID4gVGhlIGZvbGxvd2luZyBj
aGFuZ2VzIHNpbmNlIGNvbW1pdA0KPiA+IGZlN2JjZmFlYjJiNzc1ZjI1NzM0OGRjN2I5MzVmOGU4
MGVlZjNlN2Q6DQo+ID4gDQo+ID4gwqAgZHJtL2k5MTUvZ3Q6IFJlZmFjdG9yIGhlYXJ0YmVhdCBy
ZXF1ZXN0IGNvbnN0cnVjdGlvbiBhbmQNCj4gPiBzdWJtaXNzaW9uICgyMDIwLTEyLTI0IDE4OjA3
OjI2ICswMDAwKQ0KPiA+IA0KPiA+IGFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5
IGF0Og0KPiA+IA0KPiA+IMKgIGh0dHBzOi8vZ2l0aHViLmNvbS9pbnRlbC9ndnQtbGludXjCoHRh
Z3MvZ3Z0LWd0LW5leHQtMjAyMS0wMS0xOA0KPiA+IA0KPiA+IGZvciB5b3UgdG8gZmV0Y2ggY2hh
bmdlcyB1cCB0bw0KPiA+IDAyZGQyYjEyYTY4NTk0NGM0ZDUyYzU2OWQwNWY2MzYzNzJhN2I2Yzc6
DQo+ID4gDQo+ID4gwqAgZHJtL2k5MTUvZ3Z0OiB1bmlmeSBscmkgY21kIGhhbmRsZXIgYW5kIG1t
aW8gaGFuZGxlcnMgKDIwMjAtMTItMjUNCj4gPiAxMToxNjozMiArMDgwMCkNCj4gPiANCj4gPiAt
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tDQo+ID4gZ3Z0LWd0LW5leHQtMjAyMS0wMS0xOA0KPiA+IA0KPiA+IC0gR1ZUIGNtZCBw
YXJzZXIgZW5oYW5jZW1lbnQgYWdhaW5zdCBndWVzdCBjb250ZXh0IChZYW4pDQo+ID4gDQo+ID4g
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQ0KPiA+IFlhbiBaaGFvICgxMSk6DQo+ID4gwqDCoMKgwqDCoCBkcm0vaTkxNS9ndnQ6
IHBhcnNlIGluaXQgY29udGV4dCB0byB1cGRhdGUgY21kIGFjY2Vzc2libGUgcmVnDQo+ID4gd2hp
dGVsaXN0DQo+ID4gwqDCoMKgwqDCoCBkcm0vaTkxNS9ndnQ6IHNjYW4gVk0gY3R4IHBhZ2VzDQo+
ID4gwqDCoMKgwqDCoCBkcm0vaTkxNS9ndnQ6IGZpbHRlciBjbWRzICJzcm0iIGFuZCAibHJtIiBp
biBjbWRfaGFuZGxlcg0KPiA+IMKgwqDCoMKgwqAgZHJtL2k5MTUvZ3Z0OiBmaWx0ZXIgY21kcyAi
bHJyLXNyYyIgYW5kICJscnItZHN0IiBpbg0KPiA+IGNtZF9oYW5kbGVyDQo+ID4gwqDCoMKgwqDC
oCBkcm0vaTkxNS9ndnQ6IGZpbHRlciBjbWQgInBpcGUtY3RybCIgaW4gY21kX2hhbmRsZXINCj4g
PiDCoMKgwqDCoMKgIGRybS9pOTE1L2d2dDogZXhwb3J0IGZpbmRfbW1pb19pbmZvDQo+ID4gwqDC
oMKgwqDCoCBkcm0vaTkxNS9ndnQ6IG1ha2Ugd2lkdGggb2YgbW1pb19hdHRyaWJ1dGUgYmlnZ2Vy
DQo+ID4gwqDCoMKgwqDCoCBkcm0vaTkxNS9ndnQ6IGludHJvZHVjZSBhIG5ldyBmbGFnIEZfQ01E
X1dSSVRFX1BBVENIDQo+ID4gwqDCoMKgwqDCoCBkcm0vaTkxNS9ndnQ6IHN0YXRpY2FsbHkgc2V0
IEZfQ01EX1dSSVRFX1BBVENIIGZsYWcNCj4gPiDCoMKgwqDCoMKgIGRybS9pOTE1L2d2dDogdXBk
YXRlIEZfQ01EX1dSSVRFX1BBVENIIGZsYWcgd2hlbiBwYXJzaW5nIGluaXQNCj4gPiBjdHgNCj4g
PiDCoMKgwqDCoMKgIGRybS9pOTE1L2d2dDogdW5pZnkgbHJpIGNtZCBoYW5kbGVyIGFuZCBtbWlv
IGhhbmRsZXJzDQo+ID4gDQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvY21kX3BhcnNl
ci5jIHwgMzM1DQo+ID4gKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLQ0KPiA+IMKg
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2NtZF9wYXJzZXIuaCB8wqDCoCA0ICsNCj4gPiDCoGRy
aXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndnQuaMKgwqDCoMKgwqDCoMKgIHzCoCAzNyArKystDQo+
ID4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaGFuZGxlcnMuY8KgwqAgfMKgIDE1ICstDQo+
ID4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvbW1pby5owqDCoMKgwqDCoMKgIHzCoMKgIDMg
Kw0KPiA+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3JlZy5owqDCoMKgwqDCoMKgwqAgfMKg
wqAgMiArDQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvc2NoZWR1bGVyLmPCoCB8wqAg
MjIgKystDQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvdmdwdS5jwqDCoMKgwqDCoMKg
IHzCoMKgIDQgKy0NCj4gPiDCoDggZmlsZXMgY2hhbmdlZCwgMzM5IGluc2VydGlvbnMoKyksIDgz
IGRlbGV0aW9ucygtKQ0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2ludGVsLWd2dC1kZXYK
