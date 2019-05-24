Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 004F829594
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 24 May 2019 12:18:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C41D16E0DD;
	Fri, 24 May 2019 10:18:49 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E59EF6E0DD
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 24 May 2019 10:18:48 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 May 2019 03:18:48 -0700
X-ExtLoop1: 1
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
 by orsmga005.jf.intel.com with ESMTP; 24 May 2019 03:18:48 -0700
Received: from fmsmsx119.amr.corp.intel.com (10.18.124.207) by
 FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Fri, 24 May 2019 03:18:47 -0700
Received: from shsmsx152.ccr.corp.intel.com (10.239.6.52) by
 FMSMSX119.amr.corp.intel.com (10.18.124.207) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Fri, 24 May 2019 03:18:47 -0700
Received: from shsmsx101.ccr.corp.intel.com ([169.254.1.129]) by
 SHSMSX152.ccr.corp.intel.com ([169.254.6.18]) with mapi id 14.03.0415.000;
 Fri, 24 May 2019 18:18:45 +0800
From: "Zhang, Tina" <tina.zhang@intel.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: RE: [RFC PATCH v2 0/3] drm/i915/gvt: Enable vGPU local display
 direct flip
Thread-Topic: [RFC PATCH v2 0/3] drm/i915/gvt: Enable vGPU local display
 direct flip
Thread-Index: AQHVBufBIkOTYLWO2ESEWO4fRMFghqZ0+AWAgACd6gD///AGAIABHkZA//++ZwCAAhGhcP//okwAAD/4rGA=
Date: Fri, 24 May 2019 10:18:45 +0000
Message-ID: <237F54289DF84E4997F34151298ABEBC8761EC48@SHSMSX101.ccr.corp.intel.com>
References: <1557461728-2831-1-git-send-email-tina.zhang@intel.com>
 <20190521111143.jdlh6ujnayetmlqw@sirius.home.kraxel.org>
 <237F54289DF84E4997F34151298ABEBC8761B311@SHSMSX101.ccr.corp.intel.com>
 <20190521193944.45cgchkcqqsv5jml@sirius.home.kraxel.org>
 <237F54289DF84E4997F34151298ABEBC8761BFC3@SHSMSX101.ccr.corp.intel.com>
 <20190522084933.nwbyyb6bbbg5pgk5@sirius.home.kraxel.org>
 <237F54289DF84E4997F34151298ABEBC8761D5E9@SHSMSX101.ccr.corp.intel.com>
 <20190523104948.i6kzvmpiziopsng2@sirius.home.kraxel.org>
In-Reply-To: <20190523104948.i6kzvmpiziopsng2@sirius.home.kraxel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNTRiZDFhZWUtMDcyZi00Y2FkLWE2ZTMtN2Y4YTcwYWNmOTdmIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiQW5qWVd0Sk8zcHpTazBCSDBOYjNOclZJTFRBV3NIc2lTVlV5aU9nOGJJT043Wm1tSkVSMmJnVDc5ZmVVUEpWNSJ9
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
Cc: "Tian, Kevin" <kevin.tian@intel.com>, "Wang, Zhi A" <zhi.a.wang@intel.com>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>, "Yuan,
 Hang" <hang.yuan@intel.com>, "Lv, 
 Zhiyuan" <zhiyuan.lv@intel.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "Kondapally, Kalyan" <kalyan.kondapally@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogaW50ZWwtZ3Z0LWRldiBb
bWFpbHRvOmludGVsLWd2dC1kZXYtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmddIE9uDQo+
IEJlaGFsZiBPZiBHZXJkIEhvZmZtYW5uDQo+IFNlbnQ6IFRodXJzZGF5LCBNYXkgMjMsIDIwMTkg
Njo1MCBQTQ0KPiBUbzogWmhhbmcsIFRpbmEgPHRpbmEuemhhbmdAaW50ZWwuY29tPg0KPiBDYzog
VGlhbiwgS2V2aW4gPGtldmluLnRpYW5AaW50ZWwuY29tPjsgemhlbnl1d0BsaW51eC5pbnRlbC5j
b207IFl1YW4sDQo+IEhhbmcgPGhhbmcueXVhbkBpbnRlbC5jb20+OyB2aWxsZS5zeXJqYWxhQGxp
bnV4LmludGVsLmNvbTsgTHYsIFpoaXl1YW4NCj4gPHpoaXl1YW4ubHZAaW50ZWwuY29tPjsgZGFu
aWVsQGZmd2xsLmNoOyBLb25kYXBhbGx5LCBLYWx5YW4NCj4gPGthbHlhbi5rb25kYXBhbGx5QGlu
dGVsLmNvbT47IGludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBXYW5nLA0KPiBa
aGkgQSA8emhpLmEud2FuZ0BpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUkZDIFBBVENIIHYy
IDAvM10gZHJtL2k5MTUvZ3Z0OiBFbmFibGUgdkdQVSBsb2NhbCBkaXNwbGF5DQo+IGRpcmVjdCBm
bGlwDQo+IA0KPiAgIEhpLA0KPiANCj4gPiA+IFNvLCBkbWFidWYgb2JqZWN0IHlvdSdsbCBnZXQg
aXMgdGhlIHNhbWUgdGhpbmcgbm8gbWF0dGVyIHdoZW5ldmVyDQo+ID4gPiB0aGUgc3dpdGNoIGlz
IG9uIG9yIG9mZj8gIEJ1dCB3aGVuIGltcG9ydGluZyB0aGUgZG1hYnVmIGFuZCBjcmVhdGluZw0K
PiA+ID4gYSBkcm1fZnJhbWVidWZmZXIgZnJvbSBpdCB5b3UgZ2V0IHRyYWRpdGlvbmFsIGZyYW1l
YnVmZmVyIHdpdGggdGhlDQo+ID4gPiBzd2l0Y2ggYmVpbmcgb2ZmIGFuZCBhIGZyYW1lYnVmZmVy
IHdpdGggaW4ta2VybmVsIHBhZ2UtZmxpcCBzdXBwb3J0DQo+ID4gPiBpbiBjYXNlIHRoZSBzd2l0
Y2ggaXMgb24/DQo+IA0KPiA+IFRoZSB1c2VyIHNwYWNlIGNhbiB1c2UgZG1hYnVmIGluIHRoZSB0
cmFkaXRpb25hbCB3YXksIG5vIG1hdHRlciB0aGUNCj4gPiBzd2l0Y2ggaXMgb24gb3Igb2ZmLiBU
aGUgZnJhbWVidWZmZXIgZnJvbSB0aGUgZHJtYnVmIGlzIGRpZmZlcmVudCB3aXRoDQo+ID4gdGhl
IG9uZSBpbiBndnQtZyBmb3IgImluLWtlcm5lbCIgZGlyZWN0IGZsaXAuDQo+IA0KPiBPSy4NCj4g
DQo+ID4gSWYgc3dpdGNoIGlzIG9mZiwgZG1hYnVmIHRocmVhZCBtaWdodCBiZSB0aGUgb25seSB0
aHJlYWQgd2hpY2ggY2FuDQo+ID4gdHJpZ2dlciB0aGUgcGFnZSBmaWxwIGluIHVzZXIgc3BhY2Uu
IElmIHRoZSBzd2l0Y2ggaXMgb24sIGJvdGggZG1hYnVmDQo+ID4gdGhyZWFkIGluIHVzZXIgc3Bh
Y2UgYW5kIGd2dC1nIGluIGtlcm5lbCBzcGFjZSBjYW4gdHJpZ2dlciB0aGUgcGFnZQ0KPiA+IGZs
aXAuIEhvd2V2ZXIsIGluIGNhc2Ugb2Ygc3dpdGNoPW9uLCBkbWFidWYgdGhyZWFkIGluIHVzZXIg
c3BhY2UgaXMNCj4gPiBleHBlY3RlZCB0byBzdG9wIGZsaXBwaW5nLCBhcyBndnQtZyBpcyBkb2lu
ZyBpdCBmYXN0ZXIgaW4ga2VybmVsLg0KPiANCj4gSGF2aW5nIHRoZSBzd2l0Y2ggaW4gc3lzZnMg
aXMgb2sgZm9yIHRoZSBwcm9vZi1vZi1jb25jZXB0LCBidXQgbG9uZy10ZXJtIHdlDQo+IG5lZWQg
c29tZXRoaW5nIGJldHRlci4gIEZpcnN0LCBzb21lIHdheSB0byBkZXRlY3Qgd2hlbmV2ZXIgdGhl
IGluLWtlcm5lbA0KPiBwYWdlLWZsaXAgaXMgc3VwcG9ydGVkIG9yIG5vdCB3b3VsZCBiZSBnb29k
LiAgQWxzbyBJIHRoaW5rIHVzZXJzcGFjZSBzaG91bGQNCj4gYmUgYWJsZSB0byByZXF1ZXN0IHRo
ZSBkZXNpcmVkIGJlaGF2aW9yIHdoZW4gY3JlYXRpbmcgdGhlIGZyYW1lYnVmZmVyLg0KPiBNYXli
ZSBhZGQgYSBmbGFnIGZvciBkcm1Nb2RlQWRkRkIyV2l0aE1vZGlmaWVycygpPw0KPiBPciB1c2Ug
YSBzcGVjaWFsIG1vZGlmaWVyPw0KTm90IHN1cmUuIEl0IHNlZW1zIHcvbyBpOTE1J3MgaGVscCwg
aXQncyBub3QgZWFzeSB0byBwcm92aWRlIGEgbmljZSBpbXBsZW1lbnRhdGlvbi4NCg0KPiANCj4g
PiA+IFllcy4gIGRybSBvdXRwdXQgc2hvdWxkbid0IGJlIGhhcmQgdG8gd2lyZSB1cC4gIEhhbmRs
aW5nIGlucHV0IHdpbGwNCj4gPiA+IGJlIGEgYml0IG1vcmUgdHJpY2t5IHRob3VnaC4NCj4gPiBI
b3cgYWJvdXQgcGFzc2luZyB0aHJvdWdoIHRoZSBpbnB1dCBkZXZpY2VzIHRvIGd1ZXN0cz8gSXQg
c2VlbXMgZWFzaWVyLg0KPiANCj4gZHJtIFVJIHVzZXMgbGliaW5wdXQuDQo+IA0KPiBXaGVuIHN0
YXJ0ZWQgZGlyZWN0bHkgZnJvbSB0aGUgY29uc29sZSBhbmQgb3BlcmF0aW5nIGluIGRybS1tYXN0
ZXIgbW9kZQ0KPiBxZW11IGNhbiBzaW1wbHkgZ3JhYiBhbGwgaW5wdXQgZGV2aWNlcyB3aGljaCBi
ZWxvbmcgdG8gdGhlIHNlYXQuDQo+IA0KPiBXaGVuIHJ1bm5pbmcgb24gYSBkcm0tbGVhc2UgdGhh
dCB3b3VsZCBiZSBhIGJpdCBydWRlLiAgQWxzbyBJIGRvbid0IHRoaW5rDQo+IGxvZ2luZCB3aWxs
IGhhbmQgb3V0IGlucHV0IGZpbGUgaGFuZGxlcyBpbiB0aGF0IGNhc2UuICBJbiBjYXNlIHRoZXJl
IGFyZQ0KPiBkZWRpY2F0ZWQgaW5wdXQgZGV2aWNlcyBmb3IgdGhlIGd1ZXN0IHlvdSBjYW4gdXNl
IGlucHV0LWxpbnV4IG9yIHVzYiBwYXNzLQ0KPiB0aHJvdWdoLiAgSWYgbm90LCB0aGVuLCBobW0s
IG5vIGlkZWEuDQpXZSBzZWUgbW9yZSBhbmQgbW9yZSBwZW9wbGUgd291bGQgbGlrZSB0byB1c2Ug
Z3Z0LWcgdG8gYnVpbGQgdGhlIGludGVsbGlnZW50IGRlc2t0b3AgdmlydHVhbGl6YXRpb24gKElE
VikgcHJvZHVjdHMsIHdoZXJlIDMgVk1zIGFyZSBydW5uaW5nIHdpdGggZWFjaCBvbmUgaGF2aW5n
IGEgZGVkaWNhdGVkIG1vbml0b3IsIGEgc2V0IG9mIFVTQiBrZXlib2FyZC9tb3VzZSBhbmQgb25l
IGF1ZGlvIGNhcmQuIFNpbmNlIHRoZSBpbnB1dHMgcHJvYmxlbSBjYW4gYmUgc29sdmVkIGJ5IHBh
c3NpbmcgdGhyb3VnaCB0aGUgaW5wdXQgZGV2aWNlcywgdGhlIG1vc3QgY2hhbGxlbmdlIHdvcmsg
aXMgaG93IHRvIGFzc2lnbiB0aGUgbW9uaXRvcnMuIEFsdGhvdWdoIHRoZXJlIGFyZSBzb21lIG9m
Zi10cmVlIHNvbHV0aW9ucyAoZS5nLiB0aGUgcHJvcG9zZWQgdGhlIGluLWtlcm5lbCBkaXJlY3Qg
ZmxpcCBpbiB0aGlzIHBhdGNoLXNldCBpcyBvbmUgb2YgdGhlbSksIHBlb3BsZSB3b3VsZCBsaWtl
IHRvIHNlZSB1cHN0cmVhbSBzb2x1dGlvbnMuIEkgc3VwcG9zZSAiZHJtIHVpICsgZHJtIGxlYXNl
ICsgcGFzcy10aHJvdWdoIGlucHV0IGRldmljZXMiIGNvdWxkIGJlIG9uZSBvcHRpb24uIA0KDQpB
bmQgYW5vdGhlciB3b3JrLCBhcyB3ZSBkaXNjdXNzZWQsIGNhbiBpbXByb3ZlIHRoZSB1c2VyIGV4
cGVyaWVuY2UgaXMgdG8gZGVsaXZlciB0aGUgcGFnZSBmbGlwIHRvIHVzZXIgc3BhY2Ugd2hlcmUg
cWVtdSB1aSBjb3VsZCBsZXZlcmFnZSB0byBjYWxsIHRoZSB1aSByZWZyZXNoLiANCkhlcmUgaXMg
dGhlIFJGQyB2ZXJzaW9uOiBodHRwczovL2dpdGh1Yi5jb20vaW50ZWwvZ3Z0LWxpbnV4L2NvbW1p
dC85ZWI1MGYwMzJkM2ViZWE4ZDhiZmE2MmUwNTQ2ZGJiOGFmM2I4NGQ5DQpDYW4geW91IHNoYXJl
IHlvdXIgY29tbWVudHMgYWJvdXQgaXQ/DQpUaGFua3MuDQoNCkJSLA0KVGluYQ0KDQo+IA0KPiA+
IEFuZCB0aGUgInRvcGljL2RybS11aS1kaXJlY3QtZmxpcCIgYnJhbmNoIGlzIHRyYWNraW5nIGRy
bSB1aSBicmFuY2guDQo+IA0KPiBDb29sLCB0aGFua3MsIEknbGwgcGxheSB3aXRoIHRoYXQuDQo+
IA0KPiBjaGVlcnMsDQo+ICAgR2VyZA0KPiANCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18NCj4gaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QNCj4gaW50
ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2DQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlz
dAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
