Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2783357F02
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 27 Jun 2019 11:11:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDD746E823;
	Thu, 27 Jun 2019 09:11:46 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C2E06E823
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 27 Jun 2019 09:11:45 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Jun 2019 02:11:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,423,1557212400"; d="scan'208";a="167366720"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by orsmga006.jf.intel.com with ESMTP; 27 Jun 2019 02:11:44 -0700
Received: from fmsmsx113.amr.corp.intel.com (10.18.116.7) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 27 Jun 2019 02:11:44 -0700
Received: from shsmsx154.ccr.corp.intel.com (10.239.6.54) by
 FMSMSX113.amr.corp.intel.com (10.18.116.7) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 27 Jun 2019 02:11:44 -0700
Received: from shsmsx101.ccr.corp.intel.com ([169.254.1.87]) by
 SHSMSX154.ccr.corp.intel.com ([169.254.7.156]) with mapi id 14.03.0439.000;
 Thu, 27 Jun 2019 17:11:41 +0800
From: "Zhang, Tina" <tina.zhang@intel.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: RE: [RFC PATCH v3 2/4] vfio: Introduce vGPU display irq type
Thread-Topic: [RFC PATCH v3 2/4] vfio: Introduce vGPU display irq type
Thread-Index: AQHVLJqW0JiZUS7UW0uPEvNgUIeas6augZSAgACxdSA=
Date: Thu, 27 Jun 2019 09:11:40 +0000
Message-ID: <237F54289DF84E4997F34151298ABEBC876836C6@SHSMSX101.ccr.corp.intel.com>
References: <20190627033802.1663-1-tina.zhang@intel.com>
 <20190627033802.1663-3-tina.zhang@intel.com>
 <20190627062043.63wpwgefbsnackbg@sirius.home.kraxel.org>
In-Reply-To: <20190627062043.63wpwgefbsnackbg@sirius.home.kraxel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZTZmZWE0MzgtODUyMi00ZDY4LWFlMTAtZjgxMzVlNzFkMTY0IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiVWttS050MFdHZ3c1VXFJdVpxeDgzWnNMNWVOQm1nNmEwMFpRYVJsXC9ZT2s1cU1pWnNubUJTOG1cL0RcL1REaE1EZSJ9
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
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
Cc: "Tian, Kevin" <kevin.tian@intel.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>, "Yuan,
 Hang" <hang.yuan@intel.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>, "Lv,
 Zhiyuan" <zhiyuan.lv@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Wang, Zhi A" <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogaW50ZWwtZ3Z0LWRldiBb
bWFpbHRvOmludGVsLWd2dC1kZXYtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmddIE9uDQo+
IEJlaGFsZiBPZiBHZXJkIEhvZmZtYW5uDQo+IFNlbnQ6IFRodXJzZGF5LCBKdW5lIDI3LCAyMDE5
IDI6MjEgUE0NCj4gVG86IFpoYW5nLCBUaW5hIDx0aW5hLnpoYW5nQGludGVsLmNvbT4NCj4gQ2M6
IFRpYW4sIEtldmluIDxrZXZpbi50aWFuQGludGVsLmNvbT47IGt2bUB2Z2VyLmtlcm5lbC5vcmc7
IGxpbnV4LQ0KPiBrZXJuZWxAdmdlci5rZXJuZWwub3JnOyB6aGVueXV3QGxpbnV4LmludGVsLmNv
bTsgWXVhbiwgSGFuZw0KPiA8aGFuZy55dWFuQGludGVsLmNvbT47IGFsZXgud2lsbGlhbXNvbkBy
ZWRoYXQuY29tOyBMdiwgWmhpeXVhbg0KPiA8emhpeXVhbi5sdkBpbnRlbC5jb20+OyBpbnRlbC1n
dnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgV2FuZywgWmhpIEENCj4gPHpoaS5hLndhbmdA
aW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW1JGQyBQQVRDSCB2MyAyLzRdIHZmaW86IEludHJv
ZHVjZSB2R1BVIGRpc3BsYXkgaXJxIHR5cGUNCj4gDQo+IE9uIFRodSwgSnVuIDI3LCAyMDE5IGF0
IDExOjM4OjAwQU0gKzA4MDAsIFRpbmEgWmhhbmcgd3JvdGU6DQo+ID4gSW50cm9kdWNlIHZHUFUg
c3BlY2lmaWMgaXJxIHR5cGUgVkZJT19JUlFfVFlQRV9HRlgsIGFuZA0KPiA+IFZGSU9fSVJRX1NV
QlRZUEVfR0ZYX0RJU1BMQVlfSVJRIGFzIHRoZSBzdWJ0eXBlIGZvciB2R1BVIGRpc3BsYXkNCj4g
Pg0KPiA+IFNpZ25lZC1vZmYtYnk6IFRpbmEgWmhhbmcgPHRpbmEuemhhbmdAaW50ZWwuY29tPg0K
PiA+IC0tLQ0KPiA+ICBpbmNsdWRlL3VhcGkvbGludXgvdmZpby5oIHwgMyArKysNCj4gPiAgMSBm
aWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2luY2x1
ZGUvdWFwaS9saW51eC92ZmlvLmggYi9pbmNsdWRlL3VhcGkvbGludXgvdmZpby5oDQo+ID4gaW5k
ZXggNjAwNzg0YWNjNGFjLi5jM2U5YzgyMWE1Y2IgMTAwNjQ0DQo+ID4gLS0tIGEvaW5jbHVkZS91
YXBpL2xpbnV4L3ZmaW8uaA0KPiA+ICsrKyBiL2luY2x1ZGUvdWFwaS9saW51eC92ZmlvLmgNCj4g
PiBAQCAtNDY1LDYgKzQ2NSw5IEBAIHN0cnVjdCB2ZmlvX2lycV9pbmZvX2NhcF90eXBlIHsNCj4g
PiAgCV9fdTMyIHN1YnR5cGU7ICAvKiB0eXBlIHNwZWNpZmljICovDQo+ID4gIH07DQo+ID4NCj4g
PiArI2RlZmluZSBWRklPX0lSUV9UWVBFX0dGWAkJCQkoMSkNCj4gPiArI2RlZmluZSBWRklPX0lS
UV9TVUJUWVBFX0dGWF9ESVNQTEFZX0lSUQkJKDEpDQo+IA0KPiBWRklPX0lSUV9UWVBFX0dGWF9W
QkxBTksgPw0KVkZJT19JUlFfU1VCVFlQRV9HRlhfRElTUExBWV9JUlEgaXMgcHJvcG9zZWQgdG8g
Y292ZXIgYWxsIHRoZSBkaXNwbGF5IHJlbGF0ZWQgZXZlbnRzLiBJbiB0aGlzIHZlcnNpb24sIHdl
IG9ubHkgdXNlIFZGSU9fSVJRX1NVQlRZUEVfR0ZYX0RJU1BMQVlfSVJRIHRvIGRlbGl2ZXIgdmJs
YW5rIGV2ZW50LiBIb3dldmVyLCB3ZSBtaWdodCBzdGlsbCB3YW50IHRvIHJlc2VydmUgc2VhdCBm
b3Igb3RoZXIgZGlzcGxheSBldmVudCwgbGlrZSBwYWdlIGZsaXAgZXZlbnQuDQpUaGFua3MuDQoN
CkJSLA0KVGluYQ0KPiANCj4gY2hlZXJzLA0KPiAgIEdlcmQNCj4gDQo+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IGludGVsLWd2dC1kZXYgbWFpbGlu
ZyBsaXN0DQo+IGludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IGh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRl
diBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
