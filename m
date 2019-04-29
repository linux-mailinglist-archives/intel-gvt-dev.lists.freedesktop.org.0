Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72553E240
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 29 Apr 2019 14:23:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 303FA892CD;
	Mon, 29 Apr 2019 12:23:39 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81648892CD
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 29 Apr 2019 12:23:38 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Apr 2019 05:23:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,409,1549958400"; d="scan'208";a="144513693"
Received: from irsmsx154.ger.corp.intel.com ([163.33.192.96])
 by fmsmga008.fm.intel.com with ESMTP; 29 Apr 2019 05:23:37 -0700
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.31]) by
 IRSMSX154.ger.corp.intel.com ([169.254.12.101]) with mapi id 14.03.0415.000;
 Mon, 29 Apr 2019 13:23:36 +0100
From: "Gimbitskii, Aleksei" <aleksei.gimbitskii@intel.com>
To: "Xu, Colin" <colin.xu@intel.com>, "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>
Subject: RE: [PATCH v3 4/6] drm/i915/gvt: Check if cur_pt_type is valid
Thread-Topic: [PATCH v3 4/6] drm/i915/gvt: Check if cur_pt_type is valid
Thread-Index: AQHU+czm1Yy6UlOeFkG+9r3KdbIWN6ZMTxaAgAbJt9A=
Date: Mon, 29 Apr 2019 12:23:35 +0000
Message-ID: <1EB9BA72F2F5144BB1A5812E11248EAD18E1344B@irsmsx105.ger.corp.intel.com>
References: <20190423120413.30929-1-aleksei.gimbitskii@intel.com>
 <20190423120413.30929-5-aleksei.gimbitskii@intel.com>
 <4561c51c-239a-baf2-da53-3a6a6d463c09@intel.com>
In-Reply-To: <4561c51c-239a-baf2-da53-3a6a6d463c09@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiN2ZmY2E4YWMtYmNkNC00M2RhLWFkZDktYjM3MzdkZmQxOGRjIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiWVdaTlI0TElKcFU3UGRIVzc2WnpDZmJWbGM2M3Zzb3lKYkJCOUU2dEdBYWdKYlpuczAxcUIyM2ZpTU9MN1hDOSJ9
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
x-originating-ip: [163.33.239.182]
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
Cc: Zhenyu Wang <zhenyuw@linux.intel.com>, "Wang, Zhi A" <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

VGhhbmtzIGZvciByZW1pbmRpbmcgYW5kIHNvcnJ5IGZvciBsYXRlIHJlc3BvbnNlLg0KSSB3aWxs
IGFkZCBjdXJfcHRfdHlwZSB2YWx1ZSB0byB0aGUgV0FSTiBtZXNzYWdlLg0KDQotLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogaW50ZWwtZ3Z0LWRldiBbbWFpbHRvOmludGVsLWd2dC1k
ZXYtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmddIE9uIEJlaGFsZiBPZiBDb2xpbiBYdQ0K
U2VudDogVGh1cnNkYXksIEFwcmlsIDI1LCAyMDE5IDg6NDMgQU0NClRvOiBHaW1iaXRza2lpLCBB
bGVrc2VpIDxhbGVrc2VpLmdpbWJpdHNraWlAaW50ZWwuY29tPjsgaW50ZWwtZ3Z0LWRldkBsaXN0
cy5mcmVlZGVza3RvcC5vcmcNCkNjOiBXYW5nLCBaaGkgQSA8emhpLmEud2FuZ0BpbnRlbC5jb20+
OyBaaGVueXUgV2FuZyA8emhlbnl1d0BsaW51eC5pbnRlbC5jb20+DQpTdWJqZWN0OiBSZTogW1BB
VENIIHYzIDQvNl0gZHJtL2k5MTUvZ3Z0OiBDaGVjayBpZiBjdXJfcHRfdHlwZSBpcyB2YWxpZA0K
DQoNCk9uIDIwMTktMDQtMjMgMjA6MDQsIEFsZWtzZWkgR2ltYml0c2tpaSB3cm90ZToNCj4gU3Rh
dGljIGNvZGUgYW5hbHl6ZXIgd2FybnMgdGhhdCBpbmRleCB2YWx1ZSBmb3Igc2NyYXRjaF9wdCBt
YXkgYmUgDQo+IGVxdWFsIHRvIC0xLiBJbmRleCB2YWx1ZSB0eXBlIGlzIGludGVsX2d2dF9ndHRf
dHlwZV90LCBzbyBpdCBtYXkgYmUgDQo+IGFueSBudW1iZXIgYXQgcmFuZ2UgLTEgdG8gMTcuIENo
ZWNrIGZpcnN0IGlmIGN1cl9wdF90eXBlIGFuZCANCj4gY3VyX3B0X3R5cGUrMSBpcyB2YWxpZCB2
YWx1ZXMuDQo+DQo+IHYyOg0KPiAgIC0gUHJpbnQgc29tZSBlcnJvciBtZXNzYWdlcyBpZiBwYWdl
IHRhYmxlIHR5cGUgaXMgaW52YWxpZC4gKENvbGluIA0KPiBYdSkNCj4NCj4gVGhpcyBwYXRjaCBm
aXhlZCB0aGUgY3JpdGlhbCBpc3N1ZSAjNDIyIHJlcG9ydGVkIGJ5IGtsb2N3b3JrLg0KPg0KPiBT
aWduZWQtb2ZmLWJ5OiBBbGVrc2VpIEdpbWJpdHNraWkgPGFsZWtzZWkuZ2ltYml0c2tpaUBpbnRl
bC5jb20+DQo+IENjOiBaaGVueXUgV2FuZyA8emhlbnl1d0BsaW51eC5pbnRlbC5jb20+DQo+IENj
OiBaaGkgV2FuZyA8emhpLmEud2FuZ0BpbnRlbC5jb20+DQo+IENjOiBDb2xpbiBYdSA8Y29saW4u
eHVAaW50ZWwuY29tPg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmMg
fCAxMSArKysrKysrKysrLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQv
Z3R0LmMgDQo+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5jIGluZGV4IDc2MDA0MTZk
YjkwOC4uMDYxNDk5YTM4ZjRkIA0KPiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ3Z0L2d0dC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuYw0KPiBA
QCAtOTQyLDcgKzk0MiwxNiBAQCBzdGF0aWMgaW50IA0KPiBwcGd0dF9pbnZhbGlkYXRlX3NwdF9i
eV9zaGFkb3dfZW50cnkoc3RydWN0IGludGVsX3ZncHUgKnZncHUsDQo+ICAgDQo+ICAgCWlmIChl
LT50eXBlICE9IEdUVF9UWVBFX1BQR1RUX1JPT1RfTDNfRU5UUlkNCj4gICAJCSYmIGUtPnR5cGUg
IT0gR1RUX1RZUEVfUFBHVFRfUk9PVF9MNF9FTlRSWSkgew0KPiAtCQljdXJfcHRfdHlwZSA9IGdl
dF9uZXh0X3B0X3R5cGUoZS0+dHlwZSkgKyAxOw0KPiArCQljdXJfcHRfdHlwZSA9IGdldF9uZXh0
X3B0X3R5cGUoZS0+dHlwZSk7DQo+ICsNCj4gKwkJaWYgKCFndHRfdHlwZV9pc19wdChjdXJfcHRf
dHlwZSkgfHwNCj4gKwkJCQkhZ3R0X3R5cGVfaXNfcHQoY3VyX3B0X3R5cGUgKyAxKSkgew0KPiAr
CQkJV0FSTigxLCAiSW52YWxpZCBwYWdlIHRhYmxlIHR5cGVcbiIpOw0KDQpPaCBsb29rcyB0aGUg
Y29tbWVudHMgaW4gdjIgYWxzbyBtaXNzZWQuDQpXb3VsZCB5b3UgYWRkIHRoZSBhY3R1YWwgaW52
YWxpZCB0eXBlIGl0IGhpdHMgaW50byB0aGUgd2FybmluZyBhcyB3ZWxsPw0KDQo+ICsJCQlyZXR1
cm4gLUVJTlZBTDsNCj4gKwkJfQ0KPiArDQo+ICsJCWN1cl9wdF90eXBlICs9IDE7DQo+ICsNCj4g
ICAJCWlmIChvcHMtPmdldF9wZm4oZSkgPT0NCj4gICAJCQl2Z3B1LT5ndHQuc2NyYXRjaF9wdFtj
dXJfcHRfdHlwZV0ucGFnZV9tZm4pDQo+ICAgCQkJcmV0dXJuIDA7DQoNCi0tDQpCZXN0IFJlZ2Fy
ZHMsDQpDb2xpbiBYdQ0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXw0KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QNCmludGVsLWd2dC1kZXZAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnDQpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2ludGVsLWd2dC1kZXYNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpJbnRlbCBGaW5sYW5kIE95ClJlZ2lz
dGVyZWQgQWRkcmVzczogUEwgMjgxLCAwMDE4MSBIZWxzaW5raSAKQnVzaW5lc3MgSWRlbnRpdHkg
Q29kZTogMDM1NzYwNiAtIDQgCkRvbWljaWxlZCBpbiBIZWxzaW5raSAKClRoaXMgZS1tYWlsIGFu
ZCBhbnkgYXR0YWNobWVudHMgbWF5IGNvbnRhaW4gY29uZmlkZW50aWFsIG1hdGVyaWFsIGZvcgp0
aGUgc29sZSB1c2Ugb2YgdGhlIGludGVuZGVkIHJlY2lwaWVudChzKS4gQW55IHJldmlldyBvciBk
aXN0cmlidXRpb24KYnkgb3RoZXJzIGlzIHN0cmljdGx5IHByb2hpYml0ZWQuIElmIHlvdSBhcmUg
bm90IHRoZSBpbnRlbmRlZApyZWNpcGllbnQsIHBsZWFzZSBjb250YWN0IHRoZSBzZW5kZXIgYW5k
IGRlbGV0ZSBhbGwgY29waWVzLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2ludGVsLWd2dC1kZXY=
