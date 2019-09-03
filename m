Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CEBA62E6
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  3 Sep 2019 09:43:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 466DF896A3;
	Tue,  3 Sep 2019 07:43:22 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13B70896A3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  3 Sep 2019 07:43:21 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Sep 2019 00:43:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,462,1559545200"; d="scan'208";a="382990308"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
 by fmsmga006.fm.intel.com with ESMTP; 03 Sep 2019 00:43:20 -0700
Received: from fmsmsx119.amr.corp.intel.com (10.18.124.207) by
 FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 3 Sep 2019 00:43:20 -0700
Received: from shsmsx102.ccr.corp.intel.com (10.239.4.154) by
 FMSMSX119.amr.corp.intel.com (10.18.124.207) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 3 Sep 2019 00:43:20 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.32]) by
 shsmsx102.ccr.corp.intel.com ([169.254.2.113]) with mapi id 14.03.0439.000;
 Tue, 3 Sep 2019 15:43:18 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Zhang, Tina" <tina.zhang@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "kraxel@redhat.com" <kraxel@redhat.com>, "alex.williamson@redhat.com"
 <alex.williamson@redhat.com>
Subject: RE: [PATCH v5 0/6] Deliver vGPU display refresh event to userspace
Thread-Topic: [PATCH v5 0/6] Deliver vGPU display refresh event to userspace
Thread-Index: AQHVU9to+4gNt2b3FUamU8p730xOLqcYv20AgADjiYA=
Date: Tue, 3 Sep 2019 07:43:17 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D560E0C@SHSMSX104.ccr.corp.intel.com>
References: <20190816023528.30210-1-tina.zhang@intel.com>
 <237F54289DF84E4997F34151298ABEBC8771E7AE@SHSMSX101.ccr.corp.intel.com>
In-Reply-To: <237F54289DF84E4997F34151298ABEBC8771E7AE@SHSMSX101.ccr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMzMwZmIxMjYtMzQzMC00MjllLTk2MjItZjc5ZjJhMzNiNjFkIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoibUlvalB4MW1UUGIrSlwvSXZMV2VpdVV0VldVTXh4ZW40a00xM2NSNjExUWo2XC9sdEdPNjFkXC9UNFB4V3hqc1dSaiJ9
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
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
Cc: "Yuan, Hang" <hang.yuan@intel.com>, "Lv, Zhiyuan" <zhiyuan.lv@intel.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

PiBGcm9tOiBaaGFuZywgVGluYQ0KPiBTZW50OiBUdWVzZGF5LCBTZXB0ZW1iZXIgMywgMjAxOSA5
OjI3IEFNDQo+IA0KPiBIaSwNCj4gDQo+IFNvbWUgcGVvcGxlIGFyZSBhc2tpbmcgd2hldGhlciB0
aGUgZGlzcGxheSByZWZyZXNoIGlycSBjb3VsZCBiZSBwcm92aWRlZCBieQ0KPiBxZW11IHZmaW8g
ZGlzcGxheT8NCj4gDQo+IFNvbWUgYmFja2dyb3VuZDogY3VycmVudGx5LCB3ZSBoYXZlIHR3byBk
aXNwbGF5IHRpbWVycy4gT25lIGlzIHByb3ZpZGVkIGJ5DQo+IFFFTVUgVUkgYW5kIHRoZSBvdGhl
ciBvbmUgaXMgcHJvdmlkZWQgYnkgdGhlIHZncHUuIFRoZSB2Z3B1IGRpc3BsYXkNCj4gZnJhbWVi
dWZmZXIgY29uc3VtZXJzIChpLmUuIFFFTVUgVUlzKSBkZXBlbmQgb24gdGhlIFVJIHRpbWVyIHRv
IGNvbnN1bWUNCj4gdGhlIGNvbnRlbnRzIGluIHRoZSB2Z3B1IGRpc3BsYXkgZnJhbWVidWZmZXIs
IG1lYW53aGlsZSB0aGUgZGlzcGxheQ0KPiBmcmFtZWJ1ZmZlciBwcm9kdWNlciAoZS5nLiBndnQt
ZyBkaXNwbGF5IG1vZGVsKSB1cGRhdGVzIHRoZSBmcmFtZWJ1ZmZlcg0KPiBjb250ZW50IGFjY29y
ZGluZyB0byB0aGUgdmJsYW5rIHRpbWVyIHByb3ZpZGVkIGJ5IGdwdSB2ZW5kb3IgZHJpdmVyLiBT
aW5jZQ0KPiB0aGVzZSB0d28gdGltZXJzIGFyZSBub3Qgc3luY2VkLCB0ZWFyaW5nIGNvdWxkIGJl
IG5vdGljZWQuDQo+IA0KPiBTbywgdGhlb3JldGljYWxseSB0byBzb2x2ZSB0aGlzIHRlYXJpbmcg
cHJvYmxlbSwgd2UgY291bGQgaGF2ZSB0d28gb3B0aW9uczoNCj4gDQo+IE9wdGlvbiAxOiBMaWtl
IHdoYXQgd2UgaGF2ZSBpbiB0aGlzIHBhdGNoIHNldDogc3RvcCB0aGUgUUVNVSBVSSB0aW1lciBh
bmQgbGV0DQo+IGJvdGggdGhlIGZyYW1lYnVmZmVyIGNvbnN1bWVycyBhbmQgdGhlIGZyYW1lYnVm
ZmVyIHByb2R1Y2VyIHN5bmMgdG8gdGhlDQo+IGRpc3BsYXkgcmVmcmVzaCBldmVudCBwcm92aWRl
ZCBieSB2ZW5kb3IgZHJpdmVyLiBTbywgUUVNVSBVSSBjYW4gZG8gdGhlDQo+IHJlZnJlc2ggZGVw
ZW5kaW5nIG9uIHRoaXMgZGlzcGxheSByZWZyZXNoIGV2ZW50IHRvIG1ha2Ugc3VyZSB0byBoYXZl
IGEgdGVhci0NCj4gZnJlZSBmcmFtZWJ1ZmZlci4NCj4gDQo+IE9wdGlvbiAyOiBRRU1VIHByb3Zp
ZGVzIHRoZSBlbXVsYXRlZCBkaXNwbGF5IHJlZnJlc2ggZXZlbnQgdG8gdGhlIHZncHVzDQo+IHBy
b3ZpZGVkIGJ5IHZlbmRvciBkcml2ZXIuIEZvciB2Z3B1cywgdGhlIGRpc3BsYXkgcmVmcmVzaCBl
dmVudCBjYW4gYmUNCj4gY29uc2lkZXJlZCBhcyB0aGUgdmJsYW5rIGV2ZW50IHdoaWNoIGlzIGxl
dmVyYWdlZCBieSBndWVzdCB3aW5kb3cgbWFuYWdlcg0KPiB0byBkbyB0aGUgcGxhbmUgdXBkYXRl
IG9yIG1vZGUtc2V0dGluZy4NCj4gDQo+IFBlb3BsZSBhcmUgYXNraW5nIGlmIG9wdGlvbiAyIGNv
dWxkIGJlIGEgYmV0dGVyIGNob2ljZS4NCj4gDQoNCkkgdGhpbmsgdGhlIGFuc3dlciBpcyBzcGVj
aWZpYyB0byBkaWZmZXJlbnQgdXNhZ2VzLiBOb25lIGlzIHBlcmZlY3QgaW4gYWxsDQpzY2VuYXJp
b3MuIFRoZSBrZXkgaXMgdG8gZmluZCBvdXQgd2hvIGlzIHRoZSBwcmltYXJ5IGRpc3BsYXkgdG8g
c2hvdyB0aGUgDQpndWVzdCBmcmFtZWJ1ZmZlciwgdGhlbiB0aGF0IGd1eSBpcyBjYXJlZCBhYm91
dCB0ZWFyaW5nIHRodXMgc2hvdWxkIGJlIA0KdGhlIHNvdXJjZSBvZiB2YmxhbmsgZXZlbnQ6DQoN
CjEpIEd1ZXN0IGZyYW1lYnVmZmVyIGlzIGRpcmVjdGx5IHByb2dyYW1tZWQgdG8sIGFuZCBzaG93
biBpbiB0aGUgbG9jYWwNCmRpc3BsYXkuIEluIHN1Y2ggY2FzZSwgdGhlIHBoeXNpY2FsIHZibGFu
ayBldmVudCBzaG91bGQgYmUgdGhlIHNvdXJjZSBvZg0KdmlydHVhbCB2YmxhbmsgZXZlbnQsIGku
ZS4ga2VybmVsIEdWVC1nIGRyaXZlciBzaG91bGQgZW11bGF0ZSB0aGUgZXZlbnQNCmluIGhvc3Qg
dmJsYW5rIGV2ZW50IGhhbmRsZXIuDQoNCjIpIEd1ZXN0IGZyYW1lYnVmZmVyIGlzIHNob3duIGlu
IHRoZSBRZW11IFVJLiBUaGVuLCBuYXR1cmFsbHkgUWVtdSBVSQ0Kc2hvdWxkIGJlIHRoZSBzb3Vy
Y2Ugb2YgdmlydHVhbCB2YmxhbmsgZXZlbnQsIGJhc2VkIG9uIGl0cyBvd24gdGVhcmluZw0KcmVx
dWlyZW1lbnQ6DQoNCglhKSBHdWVzdCBmcmFtZWJ1ZmZlciBpcyBzaG93biBpbiB0aGUgbG9jYWwg
YXBwbGljYXRpb24gd2luZG93LA0Kd2hpY2ggaXMgdXBkYXRlZCBieSB0aGUgUWVtdSBVSSB0aW1l
ci4gVGhlbiB2aXJ0dWFsIHZibGFuayBzaG91bGQgYmUNCnNlbnQgYXQgZW5kIG9mIHRoZSBVSSB0
aW1lciBoYW5kbGVyLCB0byBtYWtlIHN1cmUgbm8gY2hhbmdlIGhhcHBlbmVkDQp3aGVuIHRoZSBn
dWVzdCBmcmFtZWJ1ZmZlciBpcyBjb21wb3NpdGVkIGFzIHRoZSBzb3VyY2UgdGV4dHVyZS4NCg0K
CWIpIFFlbXUgVUkgbWF5IHByb2dyYW0gZ3Vlc3QgZnJhbWVidWZmZXIgZGlyZWN0bHkgdG8gdGhl
DQpwaHlzaWNhbCBwbGFuZSwgdGhyb3VnaCB3aGF0ZXZlciBpbnRlcmZhY2UgdGhhdCBrZXJuZWwg
Z2Z4IGRyaXZlciBwcm92aWRlcy4NCkluIHN1Y2ggY2FzZSwgUWVtdSBVSSBzaG91bGQgd2FpdCBm
b3IgdmJsYW5rIG5vdGlmaWNhdGlvbiBmcm9tIGtlcm5lbCwgDQphbmQgdGhlbiB0cmlnZ2VyIHRo
ZSB2aXJ0dWFsIHZibGFuayBldmVudC4NCg0KCWMpIFFlbXUgVUkgbWF5IGZ1cnRoZXIgcm91dGUg
dGhlIGd1ZXN0IGZyYW1lYnVmZmVyIHRvIHJlbW90ZQ0KY2xpZW50LCBlLmcuIHRocm91Z2ggdm5j
LiBUaGVuIHZpcnR1YWwgdmJsYW5rIGV2ZW50IHNob3VsZCBiZSBlbXVsYXRlZA0KYWNjb3JkaW5n
IHRvIHRlYXJpbmcgcmVxdWlyZW1lbnQgaW4gdm5jIHByb3RvY29sLg0KDQozKSBjb21iaW5hdGlv
biBvZiAxKSBhbmQgMiksIHdoZXJlIGVpdGhlciBsb2NhbCBkaXNwbGF5IG9yIFFlbXUgVUkgaXMN
CmNvbnNpZGVyZWQgYXMgcHJpbWFyeSBkaXNwbGF5IHdpdGggdGhlIG90aGVyIGZvciBkaWFnbm9z
dGljIHB1cnBvc2UuDQpUaGVuIHRoZSB0ZWFyaW5nIG9mIHRoZSBwcmltYXJ5IGRpc3BsYXkgc2hv
dWxkIGRyaXZlIHRoZSBlbXVsYXRpb24gb2YNCnZpcnR1YWwgdmJsYW5rLCB3aGlsZSB0aGUgb3Ro
ZXIgb25lIG1heSBzdWZmZXIgZnJvbSB0ZWFyaW5nIGlzc3VlLg0KDQpBY2NvcmRpbmdseSwgd2Ug
bWF5IHdhbnQgYSBrZXJuZWwgaW50ZXJmYWNlIGFsbG93aW5nIHVzZXIgc3BhY2UNCnRvIHNwZWNp
ZnkgdGhlIHNvdXJjZSBvZiB2YmxhbmsgZW11bGF0aW9uOiBpbiBrZXJuZWwgb3IgZnJvbSB1c2Vy
DQpzcGFjZS4gSWYgdGhlIGZvcm1lciBpcyBzcGVjaWZpZWQsIHRoZW4gdmlydHVhbCB2Ymxhbmsg
aXMgZHJpdmVuIGJ5IA0KcGh5c2ljYWwgdmJsYW5rIGV2ZW50LiBPdGhlcndpc2UsIHVzZXIgc3Bh
Y2Ugc2hvdWxkIHRyaWdnZXIgdGhlDQp2aXJ0dWFsIHZibGFuayBpbmplY3Rpb24uIEp1c3QgbGVh
dmUgYWxsIHRoZSBkZWNpc2lvbnMgdG8gdXNlciBzcGFjZS4gOi0pDQoNClRoYW5rcw0KS2V2aW4N
CiANCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVs
LWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0
LWRldg==
