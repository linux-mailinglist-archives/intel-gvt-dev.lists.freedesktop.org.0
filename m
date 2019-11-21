Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 408191047D4
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 21 Nov 2019 02:03:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E890D6EAA6;
	Thu, 21 Nov 2019 01:03:46 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 694D86EAA6
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 21 Nov 2019 01:03:45 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Nov 2019 17:03:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,223,1571727600"; d="scan'208";a="200938850"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by orsmga008.jf.intel.com with ESMTP; 20 Nov 2019 17:03:44 -0800
Received: from shsmsx102.ccr.corp.intel.com (10.239.4.154) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 20 Nov 2019 17:03:44 -0800
Received: from shsmsx101.ccr.corp.intel.com ([169.254.1.213]) by
 shsmsx102.ccr.corp.intel.com ([169.254.2.108]) with mapi id 14.03.0439.000;
 Thu, 21 Nov 2019 09:03:42 +0800
From: "Zhang, Tina" <tina.zhang@intel.com>
To: "Liu, Xinyun" <xinyun.liu@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Subject: RE: [PATCH] drm/i915/gvt: remove duplicated return
Thread-Topic: [PATCH] drm/i915/gvt: remove duplicated return
Thread-Index: AQHVnoSdcAdvYKKGi0y6CiQBRkz4HqeU0Plw
Date: Thu, 21 Nov 2019 01:03:42 +0000
Message-ID: <237F54289DF84E4997F34151298ABEBC877ABF9F@SHSMSX101.ccr.corp.intel.com>
References: <20191119105150.12308-1-xinyun.liu@intel.com>
In-Reply-To: <20191119105150.12308-1-xinyun.liu@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNGI4NjQ2NjQtMzY3ZC00NjA4LWFlZjktZjZkZjE4ZmE3ZGJmIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoianZBUVlwWUJCTUh4aEFwaGdVZHZ5YnJwZ3dpRkFqS1hTQTJjNTkxcGpMTGZuU2IrZ2dRZVY0Nlh4YXJxbHZpWSJ9
x-ctpclassification: CTP_NT
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogaW50ZWwtZ3Z0LWRldiA8
aW50ZWwtZ3Z0LWRldi1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmDQo+
IE9mIExpdSBYaW55dW4NCj4gU2VudDogVHVlc2RheSwgTm92ZW1iZXIgMTksIDIwMTkgNjo1MiBQ
TQ0KPiBUbzogaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gU3ViamVjdDog
W1BBVENIXSBkcm0vaTkxNS9ndnQ6IHJlbW92ZSBkdXBsaWNhdGVkIHJldHVybg0KPiANCj4gY2xl
YW4gdXAgdW5uZWNlc3NhcnkgcmV0dXJuIGNhc2UNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IExpdSBY
aW55dW4gPHhpbnl1bi5saXVAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9p
OTE1L2d2dC9ndHQuYyB8IDMgKy0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUv
Z3Z0L2d0dC5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5jDQo+IGluZGV4IDRiMDRh
ZjU2OWMwNS4uNDM1MmE0MTBhNGQwIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9ndnQvZ3R0LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5jDQo+IEBA
IC03ODgsOCArNzg4LDcgQEAgc3RhdGljIGludCBwcGd0dF93cml0ZV9wcm90ZWN0aW9uX2hhbmRs
ZXIoDQo+ICAJCXJldHVybiAtRUlOVkFMOw0KPiANCj4gIAlyZXQgPSBwcGd0dF9oYW5kbGVfZ3Vl
c3Rfd3JpdGVfcGFnZV90YWJsZV9ieXRlcyhzcHQsIGdwYSwgZGF0YSwNCj4gYnl0ZXMpOw0KPiAt
CWlmIChyZXQpDQo+IC0JCXJldHVybiByZXQ7DQo+ICsNCj4gIAlyZXR1cm4gcmV0Ow0KVGhlbiwg
d2UgZG9uJ3QgbmVlZCAicmV0IiBpbiB0aGlzIGZ1bmN0aW9uIGFueSBtb3JlLiBCZXR0ZXIgYmUg
InJldHVybiBwcGd0dF9oYW5kbGVfZ3Vlc3Rfd3JpdGVfcGFnZV90YWJsZV9ieXRlcygiIGluc3Rl
YWQgb2YgdXNpbmcgcmV0IGFzIHRoZSAibWlkZGxlIG1hbiIuDQpUaGFua3MuDQoNCg0KQlIsDQpU
aW5hIA0KDQo+ICB9DQo+IA0KPiAtLQ0KPiAyLjE3LjENCj4gDQo+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IGludGVsLWd2dC1kZXYgbWFpbGluZyBs
aXN0DQo+IGludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IGh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBt
YWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
