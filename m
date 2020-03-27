Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 661CF1950F2
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 27 Mar 2020 07:16:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D0046E987;
	Fri, 27 Mar 2020 06:16:18 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C10A6E987
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 27 Mar 2020 06:16:17 +0000 (UTC)
IronPort-SDR: KklZvP1qzh8QSVfrSf/oBKhnr+IWacVjHu+bJbuW8IJofpCh1mNDYd3sIxmYMHNusW49mPXW83
 9vQlqrnAu6jQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2020 23:16:16 -0700
IronPort-SDR: 3nwpznhnlEM7qHTva6alpAIqwcGSldGqiN3saz2y03gn/UTfq4tNddTFqtEvkYjdFzJ2ePZde6
 C8+kDZOGvyiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,311,1580803200"; d="scan'208";a="420988226"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by orsmga005.jf.intel.com with ESMTP; 26 Mar 2020 23:16:16 -0700
Received: from fmsmsx162.amr.corp.intel.com (10.18.125.71) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 26 Mar 2020 23:16:15 -0700
Received: from shsmsx103.ccr.corp.intel.com (10.239.4.69) by
 fmsmsx162.amr.corp.intel.com (10.18.125.71) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 26 Mar 2020 23:16:15 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.206]) by
 SHSMSX103.ccr.corp.intel.com ([169.254.4.137]) with mapi id 14.03.0439.000;
 Fri, 27 Mar 2020 14:16:11 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: RE: [PATCH v2 1/2]
 Documentation/driver-api/vfio-mediated-device.rst: update for aggregation
 support
Thread-Topic: [PATCH v2 1/2]
 Documentation/driver-api/vfio-mediated-device.rst: update for aggregation
 support
Thread-Index: AQHWAzE7mTmt3EWoYkGUa0oLcK4XDahahH9g//9+KgCAAfNFoA==
Date: Fri, 27 Mar 2020 06:16:11 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D7ECF0E@SHSMSX104.ccr.corp.intel.com>
References: <20200326054136.2543-1-zhenyuw@linux.intel.com>
 <20200326054136.2543-2-zhenyuw@linux.intel.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D7EAB69@SHSMSX104.ccr.corp.intel.com>
 <20200326082142.GC8880@zhen-hp.sh.intel.com>
In-Reply-To: <20200326082142.GC8880@zhen-hp.sh.intel.com>
Accept-Language: en-US
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
Cc: "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>, "Jiang,
 Dave" <dave.jiang@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

PiBGcm9tOiBaaGVueXUgV2FuZw0KPiBTZW50OiBUaHVyc2RheSwgTWFyY2ggMjYsIDIwMjAgNDoy
MiBQTQ0KPiANCj4gT24gMjAyMC4wMy4yNiAwODoxNzoyMCArMDAwMCwgVGlhbiwgS2V2aW4gd3Jv
dGU6DQo+ID4gPiBGcm9tOiBaaGVueXUgV2FuZyA8emhlbnl1d0BsaW51eC5pbnRlbC5jb20+DQo+
ID4gPiBTZW50OiBUaHVyc2RheSwgTWFyY2ggMjYsIDIwMjAgMTo0MiBQTQ0KPiA+ID4NCj4gPiA+
IFVwZGF0ZSBkb2MgZm9yIG1kZXYgYWdncmVnYXRpb24gc3VwcG9ydC4gRGVzY3JpYmUgbWRldiBn
ZW5lcmljDQo+ID4gPiBwYXJhbWV0ZXIgZGlyZWN0b3J5IHVuZGVyIG1kZXYgZGV2aWNlIGRpcmVj
dG9yeS4NCj4gPiA+DQo+ID4gPiBDYzogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+
DQo+ID4gPiBDYzogIkppYW5nLCBEYXZlIiA8ZGF2ZS5qaWFuZ0BpbnRlbC5jb20+DQo+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBaaGVueXUgV2FuZyA8emhlbnl1d0BsaW51eC5pbnRlbC5jb20+DQo+ID4g
PiAtLS0NCj4gPiA+ICAuLi4vZHJpdmVyLWFwaS92ZmlvLW1lZGlhdGVkLWRldmljZS5yc3QgICAg
ICAgfCAxOSArKysrKysrKysrKysrKysrKysrDQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDE5IGlu
c2VydGlvbnMoKykNCj4gPiA+DQo+ID4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kcml2
ZXItYXBpL3ZmaW8tbWVkaWF0ZWQtZGV2aWNlLnJzdA0KPiA+ID4gYi9Eb2N1bWVudGF0aW9uL2Ry
aXZlci1hcGkvdmZpby1tZWRpYXRlZC1kZXZpY2UucnN0DQo+ID4gPiBpbmRleCAyNWViN2Q1Yjgz
NGIuLjI5YzI5NDMyYTg0NyAxMDA2NDQNCj4gPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZHJpdmVy
LWFwaS92ZmlvLW1lZGlhdGVkLWRldmljZS5yc3QNCj4gPiA+ICsrKyBiL0RvY3VtZW50YXRpb24v
ZHJpdmVyLWFwaS92ZmlvLW1lZGlhdGVkLWRldmljZS5yc3QNCj4gPiA+IEBAIC0yNjksNiArMjY5
LDkgQEAgRGlyZWN0b3JpZXMgYW5kIEZpbGVzIFVuZGVyIHRoZSBzeXNmcyBmb3IgRWFjaA0KPiBt
ZGV2DQo+ID4gPiBEZXZpY2UNCj4gPiA+ICAgIHwtLS0gWyRNREVWX1VVSURdDQo+ID4gPiAgICAg
ICAgICAgfC0tLSByZW1vdmUNCj4gPiA+ICAgICAgICAgICB8LS0tIG1kZXZfdHlwZSB7bGluayB0
byBpdHMgdHlwZX0NCj4gPiA+ICsgICAgICAgICB8LS0tIG1kZXYgW29wdGlvbmFsXQ0KPiA+ID4g
KwkgICAgIHwtLS0gYWdncmVnYXRlZF9pbnN0YW5jZXMgW29wdGlvbmFsXQ0KPiA+ID4gKwkgICAg
IHwtLS0gbWF4X2FnZ3JlZ2F0aW9uIFtvcHRpb25hbF0NCj4gPiA+ICAgICAgICAgICB8LS0tIHZl
bmRvci1zcGVjaWZpYy1hdHRyaWJ1dGVzIFtvcHRpb25hbF0NCj4gPiA+DQo+ID4gPiAgKiByZW1v
dmUgKHdyaXRlIG9ubHkpDQo+ID4gPiBAQCAtMjgxLDYgKzI4NCwyMiBAQCBFeGFtcGxlOjoNCj4g
PiA+DQo+ID4gPiAgCSMgZWNobyAxID4gL3N5cy9idXMvbWRldi9kZXZpY2VzLyRtZGV2X1VVSUQv
cmVtb3ZlDQo+ID4gPg0KPiA+ID4gKyogbWRldiBkaXJlY3RvcnkgKG9wdGlvbmFsKQ0KPiA+DQo+
ID4gSXQgc291bmRzIGNvbmZ1c2luZyB0byBtZSB3aGVuIHNlZWluZyBhICdtZGV2JyBkaXJlY3Rv
cnkgdW5kZXIgYQ0KPiA+IG1kZXYgaW5zdGFuY2UuIEhvdyBjb3VsZCBvbmUgdGVsbCB3aGljaCBh
dHRyaWJ1dGUgc2hvdWxkIHB1dCBpbnNpZGUNCj4gPiBvciBvdXRzaWRlIG9mICdtZGV2Jz8NCj4g
Pg0KPiANCj4gQWZ0ZXIgbWRldiBjcmVhdGUgeW91IGdldCB1dWlkIGRpcmVjdG9yeSB1bmRlciBu
b3JtYWwgZGV2aWNlIHBhdGgsIHNvDQo+IGZyb20gdGhhdCBwb2ludCBhICdtZGV2JyBkaXJlY3Rv
cnkgY2FuIGp1c3QgdGVsbCB0aGlzIGlzIGEgbWRldg0KPiBkZXZpY2UuIEFuZCBpdCdzIHByb3Bv
c2VkIGJ5IEFsZXggYmVmb3JlLg0KDQpJIGRpZG4ndCBxdWl0ZSBnZXQuIElzbid0ICRNREVWX1VV
SUQgcGx1cyBtZGV2X3R5cGUgYWxyZWFkeSB0ZWxsIHRoaXMgaXMNCmEgbWRldiBkZXZpY2U/IElm
IGl0IGlzIGluc3VmZmljaWVudCwgdGhlbiB3ZSdyZSBicm9rZW4gYWxyZWFkeSBzaW5jZSB0aGVy
ZQ0KaXMgbm8gc3VjaCAnbWRldicgc3ViLWRpcmVjdG9yeSBiZWZvcmUuDQoNCkFsZXg/DQoNCj4g
DQo+IEN1cnJlbnRseSBvbmx5IG1kZXYgY29yZSBjb3VsZCBjcmVhdGUgYXR0cmlidXRlIGUuZyAn
cmVtb3ZlJyB1bmRlcg0KPiBkZXZpY2UgZGlyLCB2ZW5kb3Igc3BlY2lmaWMgYXR0cnMgbmVlZCB0
byBiZSBpbiBhdHRycyBncm91cC4gU28gJ21kZXYnDQo+IGRpcmVjdG9yeSBoZXJlIHRyaWVzIHRv
IGJlIG9wdGlvbmFsIGdlbmVyaWMgaW50ZXJmYWNlLg0KDQpJJ20gYSBiaXQgY29uZnVzZWQuIFRo
ZW4gd2h5IGNhbm5vdCB0aGUgbmV3IG5vZGVzIGV4cG9zZWQgdGhyb3VnaA0KdmVuZG9yIHNwZWNp
ZmljIGF0dHJpYnV0ZXM/IEkgbWF5IG92ZXJsb29rIHByZXZpb3VzIGRpc2N1c3Npb24gd2h5IHVz
aW5nDQphdHRycyBncm91cCBkb2Vzbid0IHdvcmsgaGVyZS4g8J+Yig0KDQo+IA0KPiA+ID4gKw0K
PiA+ID4gK1ZlbmRvciBkcml2ZXIgY291bGQgY3JlYXRlIG1kZXYgZGlyZWN0b3J5IHRvIHNwZWNp
ZnkgZXh0cmEgZ2VuZXJpYw0KPiA+ID4gcGFyYW1ldGVycw0KPiA+ID4gK29uIG1kZXYgZGV2aWNl
IGJ5IGl0cyB0eXBlLiBDdXJyZW50bHkgYWdncmVnYXRpb24gcGFyYW1ldGVycyBhcmUNCj4gZGVm
aW5lZC4NCj4gPiA+ICtWZW5kb3IgZHJpdmVyIHNob3VsZCBwcm92aWRlIGJvdGggaXRlbXMgdG8g
c3VwcG9ydC4NCj4gPiA+ICsNCj4gPiA+ICsxKSBhZ2dyZWdhdGVkX2luc3RhbmNlcyAocmVhZC93
cml0ZSkNCj4gPiA+ICsNCj4gPiA+ICtTZXQgdGFyZ2V0IGFnZ3JlZ2F0ZWQgaW5zdGFuY2VzIGZv
ciBkZXZpY2UuIFJlYWRpbmcgd2lsbCBzaG93IGN1cnJlbnQNCj4gPiA+ICtjb3VudCBvZiBhZ2dy
ZWdhdGVkIGluc3RhbmNlcy4gV3JpdGluZyB2YWx1ZSBsYXJnZXIgdGhhbg0KPiBtYXhfYWdncmVn
YXRpb24NCj4gPiA+ICt3b3VsZCBmYWlsIGFuZCByZXR1cm4gZXJyb3IuDQo+ID4NCj4gPiBDYW4g
b25lIHdyaXRlIGEgdmFsdWUgbXVsdGlwbGUtdGltZXMgYW5kIGF0IGFueSB0aW1lPw0KPiA+DQo+
IA0KPiB5ZWFoLCBvZiBjb3ogbXVsdGlwbGUgdGltZXMsIGJ1dCBub3JtYWxseSB3b24ndCBzdWNj
ZWVkIGFmdGVyIG9wZW4uDQo+IA0KPiA+ID4gKw0KPiA+ID4gKzIpIG1heF9hZ2dyZWdhdGlvbiAo
cmVhZCBvbmx5KQ0KPiA+ID4gKw0KPiA+ID4gK1Nob3cgbWF4aXVtIGluc3RhbmNlcyBmb3IgYWdn
cmVnYXRpb24uDQo+ID4gPiArDQo+ID4NCj4gPiAic2hvdyBtYXhpbXVtLWFsbG93ZWQgaW5zdGFu
Y2VzIHdoaWNoIGNhbiBiZSBhZ2dyZWdhdGVkIGZvciB0aGlzDQo+IGRldmljZSIuIGlzDQo+ID4g
dGhpcyB2YWx1ZSBzdGF0aWMgb3IgZHluYW1pYz8gaWYgZHluYW1pYyB0aGVuIHRoZSB1c2VyIGlz
IGV4cGVjdGVkIHRvIHJlYWQNCj4gdGhpcw0KPiA+IGZpZWxkIGJlZm9yZSBldmVyeSB3cml0ZS4g
d29ydGh5IG9mIHNvbWUgY2xhcmlmaWNhdGlvbiBoZXJlLg0KPiANCj4geWVhaCwgdXNlciBuZWVk
cyB0byByZWFkIHRoaXMgYmVmb3JlIHNldHRpbmcgYWN0dWFsIG51bWJlciwgZWl0aGVyIHN0YXRp
YyBvcg0KPiBkeW5hbWljDQo+IGRlcGVuZHMgb24gdmVuZG9yIHJlc291cmNlIHR5cGUuDQoNClRo
ZW4gYWRkaW5nIGFib3ZlIGluZm9ybWF0aW9uIG1pZ2h0IG1ha2UgdGhlIGRlc2NyaXB0aW9uIGNs
ZWFyZXIuDQoNClRoYW5rcw0KS2V2aW4NCg0KPiANCj4gVGhhbmtzDQo+IA0KPiA+DQo+ID4gPiAg
TWVkaWF0ZWQgZGV2aWNlIEhvdCBwbHVnDQo+ID4gPiAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
DQo+ID4gPg0KPiA+ID4gLS0NCj4gPiA+IDIuMjUuMQ0KPiA+DQo+IA0KPiAtLQ0KPiBPcGVuIFNv
dXJjZSBUZWNobm9sb2d5IENlbnRlciwgSW50ZWwgbHRkLg0KPiANCj4gJGdwZyAtLWtleXNlcnZl
ciB3d3drZXlzLnBncC5uZXQgLS1yZWN2LWtleXMgNEQ3ODE4MjcNCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0
CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldgo=
