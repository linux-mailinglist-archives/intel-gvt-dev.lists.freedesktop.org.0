Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 240621AB791
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 16 Apr 2020 07:58:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C39F86E2B6;
	Thu, 16 Apr 2020 05:58:30 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C95D6E2B6
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 16 Apr 2020 05:58:29 +0000 (UTC)
IronPort-SDR: fJqMnNk5/rTAXAZ0b6YdGIc0YUe4TWGphI5kknHXiAn9QRYCm+uUmhSbDLa/v69OpbNQzmlv/f
 uqRzOQoAB4lQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2020 22:58:29 -0700
IronPort-SDR: QY5L9RKlTE46MUK/RWk7Ogz6cN0HnSlRvEbWKV1QLyaLhX6GwUl+8Uh3X6Ky8FjsE2TNW3U1xw
 13WAOOSPd7Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,388,1580803200"; d="scan'208";a="271965281"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by orsmga002.jf.intel.com with ESMTP; 15 Apr 2020 22:58:28 -0700
Received: from shsmsx104.ccr.corp.intel.com (10.239.4.70) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 15 Apr 2020 22:58:28 -0700
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.138]) by
 SHSMSX104.ccr.corp.intel.com ([169.254.5.225]) with mapi id 14.03.0439.000;
 Thu, 16 Apr 2020 13:58:26 +0800
From: "Zhao, Yan Y" <yan.y.zhao@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: RE: [PATCH v4 0/3] drm/i915/gvt: optimizaton on shadow context
 population
Thread-Topic: [PATCH v4 0/3] drm/i915/gvt: optimizaton on shadow context
 population
Thread-Index: AQHWEvxyRFSujJLmRkCIwB5ENtiQpqh6quSAgACW82A=
Date: Thu, 16 Apr 2020 05:58:25 +0000
Message-ID: <F22B14EC3CFBB843AD3E03B6B78F2C6A4C4D35CB@shsmsx102.ccr.corp.intel.com>
References: <20200415075355.23308-1-yan.y.zhao@intel.com>
 <20200416045711.GT11247@zhen-hp.sh.intel.com>
In-Reply-To: <20200416045711.GT11247@zhen-hp.sh.intel.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
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
Cc: "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBpbnRlbC1ndnQtZGV2IDxpbnRl
bC1ndnQtZGV2LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYNCj4gT2Yg
Wmhlbnl1IFdhbmcNCj4gU2VudDogVGh1cnNkYXksIEFwcmlsIDE2LCAyMDIwIDEyOjU3IFBNDQo+
IFRvOiBaaGFvLCBZYW4gWSA8eWFuLnkuemhhb0BpbnRlbC5jb20+DQo+IENjOiBpbnRlbC1ndnQt
ZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY0IDAvM10g
ZHJtL2k5MTUvZ3Z0OiBvcHRpbWl6YXRvbiBvbiBzaGFkb3cgY29udGV4dA0KPiBwb3B1bGF0aW9u
DQo+IA0KPiBPbiAyMDIwLjA0LjE1IDAzOjUzOjU1IC0wNDAwLCBZYW4gWmhhbyB3cm90ZToNCj4g
PiBUaGlzIHBhdGNoc2V0IHNraXBzIHBvcHVsYXRpb24gb2Ygc2hhZG93IGNvbnRleHRzIGlmIHRo
ZWlyDQo+ID4gY29ycmVzcG9uZGluZyBndWVzdCBjb250ZXh0cyBhcmUga25vd24gbm90IGNoYW5n
ZWQuDQo+ID4NCj4gPiBwYXRjaCAxIGltcGxlbWVudHMgdGhlIHNraXBwaW5nIGxvZ2ljLCB0aG91
Z2ggaW50ZW50aW9uYWxseSBkaXNhYmxlZA0KPiA+IHRoZSBza2lwLg0KPiA+IHBhdGNoIDIgY2hl
Y2tzIGdndHQgZW50cnkgdG8gdmVyaWZ5IGd1ZXN0IGNvbnRleHRzIGFyZSBub3QgY2hhbmdlZC4N
Cj4gPiBwYXRjaCAzIHR1cm5zIG9uIHRoZSBza2lwcGluZyBsb2dpYw0KPiA+DQo+ID4gWWFuIFpo
YW8gKDMpOg0KPiA+ICAgZHJtL2k5MTUvZ3Z0OiBza2lwIHBvcHVsYXRlIHNoYWRvdyBjb250ZXh0
IGlmIGd1ZXN0IGNvbnRleHQgbm90DQo+ID4gICAgIGNoYW5nZWQNCj4gPiAgIGRybS9pOTE1L2d2
dDogY2hlY2sgZ2d0dCBlbnRyeSBtb2RpZmljYXRpb24gc3RhdHVzIGZvciBndWVzdCBjdHhzDQo+
ID4gICBkcm0vaTkxNS9ndnQ6IHR1cm4gb24gc2hhZG93IGNvbnRleHQgc2tpcHBpbmcNCj4gPg0K
PiA+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmMgICAgICAgfCAxNyArKysrKysrKysr
KysrKw0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3Z0LmggICAgICAgfCAgNSArKysr
DQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9zY2hlZHVsZXIuYyB8IDM1DQo+ID4gKysr
KysrKysrKysrKysrKysrKysrKysrLS0tLQ0KPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDUyIGluc2Vy
dGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQo+ID4NCj4gDQo+IFRoZSBwYXRjaCBvcmRlciBsb29r
cyBzdHJhbmdlIHRvIG1lLi4uIGVpdGhlciBvcmRlciBpdCBhcyAxKSBuZXcgdHJhY2sgc3RydWN0
OyAyKQ0KPiBnZ3R0IHVwZGF0ZSB0cmFjazsgMykgYWN0dWFsIG9wdGltaXphdGlvbiBvciBqdXN0
IGluIG9uZSBwYXRjaC4NCj4gDQoNCk9rLiBJIHByZWZlciBvbmUgc2luZ2xlIHBhdGNoIPCfmIoN
Cg0KDQo+IC0tDQo+IE9wZW4gU291cmNlIFRlY2hub2xvZ3kgQ2VudGVyLCBJbnRlbCBsdGQuDQo+
IA0KPiAkZ3BnIC0ta2V5c2VydmVyIHd3d2tleXMucGdwLm5ldCAtLXJlY3Yta2V5cyA0RDc4MTgy
Nw0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwt
Z3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQt
ZGV2Cg==
