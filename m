Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8ED10AC42
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 27 Nov 2019 09:51:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C81116E277;
	Wed, 27 Nov 2019 08:51:54 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EBB76E277
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 27 Nov 2019 08:51:53 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Nov 2019 00:51:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,248,1571727600"; d="scan'208";a="383434465"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by orsmga005.jf.intel.com with ESMTP; 27 Nov 2019 00:51:51 -0800
Received: from fmsmsx113.amr.corp.intel.com (10.18.116.7) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 27 Nov 2019 00:51:51 -0800
Received: from shsmsx103.ccr.corp.intel.com (10.239.4.69) by
 FMSMSX113.amr.corp.intel.com (10.18.116.7) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 27 Nov 2019 00:51:51 -0800
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.127]) by
 SHSMSX103.ccr.corp.intel.com ([169.254.4.60]) with mapi id 14.03.0439.000;
 Wed, 27 Nov 2019 16:51:49 +0800
From: "Gao, Fred" <fred.gao@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: RE: [PATCH v1] drm/i915/gvt: Fix guest boot warning
Thread-Topic: [PATCH v1] drm/i915/gvt: Fix guest boot warning
Thread-Index: AQHVpDJHggXuZ00+P0a5syCWUK9lKaed7reAgADH9mA=
Date: Wed, 27 Nov 2019 08:51:49 +0000
Message-ID: <12E1D2244F454645A164A13EDCBDDB3B42A5247E@SHSMSX104.ccr.corp.intel.com>
References: <20191126161904.25281-1-fred.gao@intel.com>
 <20191127045329.GM4196@zhen-hp.sh.intel.com>
In-Reply-To: <20191127045329.GM4196@zhen-hp.sh.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiN2QwMmY4ZTAtOWI1NS00Yjg3LTlkOWUtOWI0NGEzOTI1MGU3IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiXC9PZHA1cHlSMkFSakFuRFJDMkw4ZkNwcUJLaUVpaUVxQkRmQzdtZkQyeDZoeGNnNU1oK0xWeXZnVzIxaFwvZ1ZGIn0=
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
Cc: "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

VGhhbmtzLCBjb21tZW50cyBpbiBsaW5lLg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
RnJvbTogWmhlbnl1IFdhbmcgPHpoZW55dXdAbGludXguaW50ZWwuY29tPiANClNlbnQ6IDIwMTnl
ubQxMeaciDI35pelIDEyOjUzDQpUbzogR2FvLCBGcmVkIDxmcmVkLmdhb0BpbnRlbC5jb20+DQpD
YzogaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNClN1YmplY3Q6IFJlOiBbUEFU
Q0ggdjFdIGRybS9pOTE1L2d2dDogRml4IGd1ZXN0IGJvb3Qgd2FybmluZw0KDQpPbiAyMDE5LjEx
LjI3IDAwOjE5OjA0ICswODAwLCBHYW8sIEZyZWQgd3JvdGU6DQo+IFNpbXVsYXRlIE1JQSBjb3Jl
IGluIHJlc2V0IHN0YXR1cyBvbmNlIEdVQyBlbmdpbmUgaXMgcmVzZXQuDQo+IA0KPiBTaWduZWQt
b2ZmLWJ5OiBHYW8gRnJlZCA8ZnJlZC5nYW9AaW50ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMv
Z3B1L2RybS9pOTE1L2d2dC9oYW5kbGVycy5jIHwgNSArKysrKw0KPiAgMSBmaWxlIGNoYW5nZWQs
IDUgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2d2dC9oYW5kbGVycy5jIA0KPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9oYW5kbGVycy5j
DQo+IGluZGV4IDNkZTY2NGRlYjJmOC4uNzhmNGQ0MWI5MDA1IDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaGFuZGxlcnMuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9ndnQvaGFuZGxlcnMuYw0KPiBAQCAtMzQxLDYgKzM0MSwxMSBAQCBzdGF0aWMgaW50IGdk
cnN0X21taW9fd3JpdGUoc3RydWN0IGludGVsX3ZncHUgKnZncHUsIHVuc2lnbmVkIGludCBvZmZz
ZXQsDQo+ICAJCQlndnRfZGJnX21taW8oInZncHUlZDogcmVxdWVzdCBWQ1MyIFJlc2V0XG4iLCB2
Z3B1LT5pZCk7DQo+ICAJCQllbmdpbmVfbWFzayB8PSBCSVQoVkNTMSk7DQo+ICAJCX0NCj4gKwkJ
aWYgKGRhdGEgJiBHRU45X0dSRE9NX0dVQykgew0KPiArCQkJZ3Z0X2RiZ19tbWlvKCJ2Z3B1JWQ6
IHJlcXVlc3QgR1VDIFJlc2V0XG4iLCB2Z3B1LT5pZCk7DQo+ICsJCQl2Z3B1X3ZyZWcodmdwdSwg
aTkxNV9tbWlvX3JlZ19vZmZzZXQoR1VDX1NUQVRVUykpDQo+ICsJCQkJfD0gR1NfTUlBX0lOX1JF
U0VUOw0KPiArCQl9DQoNCkNhbiB3cml0ZSBhcyB2Z3B1X3ZyZWdfdCh2Z3B1LCBHVUNfU1RBVFVT
KSA9IC4uLg0KW2ZyZWRdIG9rDQpMb29rcyB3ZSBjYW4gZG8gdGhpcyBiZXR0ZXIgaW4gR1VDX1NU
QVRVUyBoYW5kbGVyIHRoYXQgd2UgY2FuIGNsZWFyIElOX1JFU0VUIHZhbHVlIGFmdGVyIHJlYWRp
bmcuDQpbRnJlZF0gc2luY2UgdGhlIHZhbHVlIGlzIGFsd2F5cyAxIGFmdGVyIGd1Y19yZXNldCBp
biBuYXRpdmUgaTkxNSwgc28gSSBkbyBub3QgZG8gdGhlIGNoYW5nZSBhcyB3ZWxsLg0KKDB4MDAw
MGMwMDApOiAweDAwMDAwMDAxDQoNCj4gIAkJZW5naW5lX21hc2sgJj0gSU5URUxfSU5GTyh2Z3B1
LT5ndnQtPmRldl9wcml2KS0+ZW5naW5lX21hc2s7DQo+ICAJfQ0KPiAgDQo+IC0tDQo+IDIuMTcu
MQ0KPiANCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18N
Cj4gaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QNCj4gaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcNCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9pbnRlbC1ndnQtZGV2DQoNCi0tDQpPcGVuIFNvdXJjZSBUZWNobm9sb2d5IENlbnRlciwg
SW50ZWwgbHRkLg0KDQokZ3BnIC0ta2V5c2VydmVyIHd3d2tleXMucGdwLm5ldCAtLXJlY3Yta2V5
cyA0RDc4MTgyNw0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9p
bnRlbC1ndnQtZGV2
