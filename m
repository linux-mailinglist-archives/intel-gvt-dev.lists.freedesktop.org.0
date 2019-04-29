Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43486E22A
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 29 Apr 2019 14:22:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0350D892DB;
	Mon, 29 Apr 2019 12:22:09 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70595892DB
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 29 Apr 2019 12:22:08 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Apr 2019 05:22:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,409,1549958400"; d="scan'208";a="144513536"
Received: from irsmsx154.ger.corp.intel.com ([163.33.192.96])
 by fmsmga008.fm.intel.com with ESMTP; 29 Apr 2019 05:22:07 -0700
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.31]) by
 IRSMSX154.ger.corp.intel.com ([169.254.12.101]) with mapi id 14.03.0415.000;
 Mon, 29 Apr 2019 13:22:06 +0100
From: "Gimbitskii, Aleksei" <aleksei.gimbitskii@intel.com>
To: "Xu, Colin" <colin.xu@intel.com>
Subject: RE: [PATCH v3 5/6] drm/i915/gvt: Assign NULL to the pointer after
 memory free.
Thread-Topic: [PATCH v3 5/6] drm/i915/gvt: Assign NULL to the pointer after
 memory free.
Thread-Index: AQHU+czmDAOHU7og8E+OVV8NOMocB6ZMJYQAgAAmbwCABswvMA==
Date: Mon, 29 Apr 2019 12:22:06 +0000
Message-ID: <1EB9BA72F2F5144BB1A5812E11248EAD18E13437@irsmsx105.ger.corp.intel.com>
References: <20190423120413.30929-1-aleksei.gimbitskii@intel.com>
 <20190423120413.30929-6-aleksei.gimbitskii@intel.com>
 <20190425031406.GX17995@zhen-hp.sh.intel.com>
 <40634fbc-3569-e5c4-2741-3a40ab67e198@intel.com>
In-Reply-To: <40634fbc-3569-e5c4-2741-3a40ab67e198@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNGY2YzYzMTAtMGUyZS00YTcwLTllMjUtZTU5OGVlMmNhZDVkIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoidWxjVUtSXC9sMk5XSHlBR0VGUzRNYzRHajdEblNTTUpPQTY3UzlqdWVaTWswbWg4REJuOEZzOTVSbnh5bXNSWEkifQ==
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
Cc: "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>, "Wang, Zhi A" <zhi.a.wang@intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

VGhhbmtzIGZvciB0aGUgcmVtaW5kaW5nIGFuZCBzb3JyeSB0aGF0IEkgZm9yZ2V0IHRvIG1lbnRp
b24gdGhhdC4gIEJ1dCB3ZSB0aGluayB0aGF0IGlmIHdlIGFkZCB0aGlzIGVycm9yIG1lc3NhZ2Ug
aGVyZSwgcHJvYmFibHkgd2UgYWxzbyBuZWVkIHRvIGFkZCB0aGUgZXJyb3IgbWVzc2FnZSBpbiBv
dGhlciBzaW1pbGFyIHBsYWNlcywgd2hpY2ggc2VlbXMgYSBiaXQgb3ZlciB0b28gbXVjaC4gSG93
IGFib3V0IHdlIHN0aWxsIGZvbGxvdyB0aGUgZXhpc3Rpbmcgc3R5bGU/DQoNCi0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBYdSwgQ29saW4gDQpTZW50OiBUaHVyc2RheSwgQXByaWwg
MjUsIDIwMTkgODozMiBBTQ0KVG86IEdpbWJpdHNraWksIEFsZWtzZWkgPGFsZWtzZWkuZ2ltYml0
c2tpaUBpbnRlbC5jb20+DQpDYzogWmhlbnl1IFdhbmcgPHpoZW55dXdAbGludXguaW50ZWwuY29t
PjsgaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IFdhbmcsIFpoaSBBIDx6aGku
YS53YW5nQGludGVsLmNvbT4NClN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgNS82XSBkcm0vaTkxNS9n
dnQ6IEFzc2lnbiBOVUxMIHRvIHRoZSBwb2ludGVyIGFmdGVyIG1lbW9yeSBmcmVlLg0KDQoNCk9u
IDIwMTktMDQtMjUgMTE6MTQsIFpoZW55dSBXYW5nIHdyb3RlOg0KPiBPbiAyMDE5LjA0LjIzIDE1
OjA0OjEyICswMzAwLCBBbGVrc2VpIEdpbWJpdHNraWkgd3JvdGU6DQo+PiBUaGUga2xvY3dvcmsg
c3RhdGljIGNvZGUgYW5hbHl6ZXIgY29tcGxhaW5zIGFib3V0IHVzaW5nIHBvaW50ZXIgYWZ0ZXIg
DQo+PiBiZWluZyBmcmVlZCwgYmVjYXVzZSBmdXJ0aGVyIHdlIHBhc3MgaXQgdG8gdGhlIGd2dF92
Z3B1X2VycigpIGZ1bmN0aW9uLg0KPj4gQXNzaWduIHBvaW50ZXIgdG8gYmUgTlVMTCBpbnRlbnRp
b25hbHksIHRvIG1lZXQgcmVxdWlyZW1lbnRzIG9mIHRoZSANCj4+IGNvZGUgYW5hbHl6ZXIuDQo+
Pg0KPj4gVGhpcyBwYXRjaCBmaXhlZCB0aGUgaXNzdWUgIzY0OCByZXBvcnRlZCBhcyBlcnJvciBi
eSBrbG9jd29yay4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBBbGVrc2VpIEdpbWJpdHNraWkgPGFs
ZWtzZWkuZ2ltYml0c2tpaUBpbnRlbC5jb20+DQo+PiBDYzogWmhlbnl1IFdhbmcgPHpoZW55dXdA
bGludXguaW50ZWwuY29tPg0KPj4gQ2M6IFpoaSBXYW5nIDx6aGkuYS53YW5nQGludGVsLmNvbT4N
Cj4+IC0tLQ0KPj4gICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmMgfCAxICsNCj4+ICAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuYyANCj4+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0
L2d0dC5jIGluZGV4IDA2MTQ5OWEzOGY0ZC4uOTI3NzUzYTU5YTFlIA0KPj4gMTAwNjQ0DQo+PiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2d2dC9ndHQuYw0KPj4gQEAgLTExMDYsNiArMTEwNiw3IEBAIHN0YXRpYyBzdHJ1
Y3QgaW50ZWxfdmdwdV9wcGd0dF9zcHQgDQo+PiAqcHBndHRfcG9wdWxhdGVfc3B0X2J5X2d1ZXN0
X2VudHJ5KA0KPj4gICANCj4+ICAgZXJyX2ZyZWVfc3B0Og0KPj4gICAJcHBndHRfZnJlZV9zcHQo
c3B0KTsNCj4+ICsJc3B0ID0gTlVMTDsNCj4+ICAgZXJyOg0KPj4gICAJZ3Z0X3ZncHVfZXJyKCJm
YWlsOiBzaGFkb3cgcGFnZSAlcCBndWVzdCBlbnRyeSAweCVsbHggdHlwZSAlZFxuIiwNCj4+ICAg
CQkgICAgIHNwdCwgd2UtPnZhbDY0LCB3ZS0+dHlwZSk7DQo+IEkgdGhpbmsgd2UgY2FuIHJlbW92
ZSB0aGlzIGVycm9yIG1lc3NhZ2Ugd2hpY2ggZG9lc24ndCB0ZWxsIHRoZSByZWFzb24gDQo+IHRv
IGZhaWwgYXQgYWxsLCBidXQgaGF2ZSBlcnIgbWVzc2FnZSBpbiBlYXJsaWVyIHBhdGggd2hlcmUg
d2UgY2FuIA0KPiBpbmRpY2F0ZSB0aGUgcmVhc29uLg0KDQpTZWVtIGxpa2UgbWlzcyBteSBjb21t
ZW50IGluIHYyLg0KDQpJIHdvdWxkIHN1Z2dlc3QgYWRkIGRpZmZlcmVudCBtc2cgYmVmb3JlIHRo
ZSB0d28gImdvdG8gZXJyX2ZyZWVfc3B0IiwNCg0KdGhlbiBpbiB0aGlzIGVycl9mcmVlX3N0cCBs
YWJlbCB5b3UgY291bGQganVzdCByZXR1cm4gd2l0aG91dCBwcmludCB0aGUNCg0Kc2FtZSBtc2cg
YXMgZXJyLiBPdGhlcndpc2UgeW91IGNhbid0IHRlbGwgdGhlIHJlYXNvbiBmcm9tIHRoZSBzYW1l
IGVyci4NCg0KPg0KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXw0KPiBpbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdA0KPiBpbnRlbC1ndnQtZGV2QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZw0KPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2ludGVsLWd2dC1kZXYNCg0KLS0NCkJlc3QgUmVnYXJkcywNCkNvbGluIFh1DQoN
Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQpJbnRlbCBGaW5sYW5kIE95ClJlZ2lzdGVyZWQgQWRkcmVzczogUEwgMjgx
LCAwMDE4MSBIZWxzaW5raSAKQnVzaW5lc3MgSWRlbnRpdHkgQ29kZTogMDM1NzYwNiAtIDQgCkRv
bWljaWxlZCBpbiBIZWxzaW5raSAKClRoaXMgZS1tYWlsIGFuZCBhbnkgYXR0YWNobWVudHMgbWF5
IGNvbnRhaW4gY29uZmlkZW50aWFsIG1hdGVyaWFsIGZvcgp0aGUgc29sZSB1c2Ugb2YgdGhlIGlu
dGVuZGVkIHJlY2lwaWVudChzKS4gQW55IHJldmlldyBvciBkaXN0cmlidXRpb24KYnkgb3RoZXJz
IGlzIHN0cmljdGx5IHByb2hpYml0ZWQuIElmIHlvdSBhcmUgbm90IHRoZSBpbnRlbmRlZApyZWNp
cGllbnQsIHBsZWFzZSBjb250YWN0IHRoZSBzZW5kZXIgYW5kIGRlbGV0ZSBhbGwgY29waWVzLgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQt
ZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
