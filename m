Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D66B2B028
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 27 May 2019 10:27:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4744C89956;
	Mon, 27 May 2019 08:27:16 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5807289956
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 27 May 2019 08:27:15 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 May 2019 01:27:14 -0700
X-ExtLoop1: 1
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by fmsmga004.fm.intel.com with ESMTP; 27 May 2019 01:27:13 -0700
Received: from fmsmsx157.amr.corp.intel.com (10.18.116.73) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Mon, 27 May 2019 01:27:13 -0700
Received: from shsmsx152.ccr.corp.intel.com (10.239.6.52) by
 FMSMSX157.amr.corp.intel.com (10.18.116.73) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Mon, 27 May 2019 01:27:13 -0700
Received: from shsmsx101.ccr.corp.intel.com ([169.254.1.129]) by
 SHSMSX152.ccr.corp.intel.com ([169.254.6.18]) with mapi id 14.03.0415.000;
 Mon, 27 May 2019 16:27:11 +0800
From: "Zhang, Tina" <tina.zhang@intel.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: RE: [RFC PATCH v2 0/3] drm/i915/gvt: Enable vGPU local display
 direct flip
Thread-Topic: [RFC PATCH v2 0/3] drm/i915/gvt: Enable vGPU local display
 direct flip
Thread-Index: AQHVBufBIkOTYLWO2ESEWO4fRMFghqZ0+AWAgACd6gD///AGAIABHkZA//++ZwCAAhGhcIAFuxwAgACJelA=
Date: Mon, 27 May 2019 08:27:10 +0000
Message-ID: <237F54289DF84E4997F34151298ABEBC87620729@SHSMSX101.ccr.corp.intel.com>
References: <1557461728-2831-1-git-send-email-tina.zhang@intel.com>
 <20190521111143.jdlh6ujnayetmlqw@sirius.home.kraxel.org>
 <237F54289DF84E4997F34151298ABEBC8761B311@SHSMSX101.ccr.corp.intel.com>
 <20190521193944.45cgchkcqqsv5jml@sirius.home.kraxel.org>
 <237F54289DF84E4997F34151298ABEBC8761BFC3@SHSMSX101.ccr.corp.intel.com>
 <20190522084933.nwbyyb6bbbg5pgk5@sirius.home.kraxel.org>
 <237F54289DF84E4997F34151298ABEBC8761D5E9@SHSMSX101.ccr.corp.intel.com>
 <20190527075610.rkfmhpacfjde2obj@sirius.home.kraxel.org>
In-Reply-To: <20190527075610.rkfmhpacfjde2obj@sirius.home.kraxel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiODVmNzY0MTAtNTc2OC00ZGE0LTgwNWMtZTEzOTc1NzM2Yzg5IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiUlVDNld0WVl2Q2JjallRXC9hYkFEZHFhZW1Bd0hyelpiXC9MYXhGdXAwanMrcWExTUJiTEZKeUlsWUVLWUlzTkZyIn0=
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

Cgo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gRnJvbTogR2VyZCBIb2ZmbWFubiBbbWFp
bHRvOmtyYXhlbEByZWRoYXQuY29tXQo+IFNlbnQ6IE1vbmRheSwgTWF5IDI3LCAyMDE5IDM6NTYg
UE0KPiBUbzogWmhhbmcsIFRpbmEgPHRpbmEuemhhbmdAaW50ZWwuY29tPgo+IENjOiBUaWFuLCBL
ZXZpbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+OyB6aGVueXV3QGxpbnV4LmludGVsLmNvbTsgWXVh
biwKPiBIYW5nIDxoYW5nLnl1YW5AaW50ZWwuY29tPjsgdmlsbGUuc3lyamFsYUBsaW51eC5pbnRl
bC5jb207IEx2LCBaaGl5dWFuCj4gPHpoaXl1YW4ubHZAaW50ZWwuY29tPjsgZGFuaWVsQGZmd2xs
LmNoOyBLb25kYXBhbGx5LCBLYWx5YW4KPiA8a2FseWFuLmtvbmRhcGFsbHlAaW50ZWwuY29tPjsg
aW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IFdhbmcsCj4gWmhpIEEgPHpoaS5h
LndhbmdAaW50ZWwuY29tPgo+IFN1YmplY3Q6IFJlOiBbUkZDIFBBVENIIHYyIDAvM10gZHJtL2k5
MTUvZ3Z0OiBFbmFibGUgdkdQVSBsb2NhbCBkaXNwbGF5Cj4gZGlyZWN0IGZsaXAKPiAKPiAgIEhp
LAo+IAo+ID4gPiBDYW4geW91IGp1c3QgcHVzaCB5b3VyIGRybSBsZWFzZSBicmFuY2ggc29tZXdo
ZXJlPwo+IAo+ID4gSSBhcHBsaWVkIG91ciB3b3JrIGFnYWluc3QgeW91ciBkcm0gdWkgdGlwLiBZ
b3UgY2FuIHJ1biBpdCB3aXRoIHhvcmcKPiA+IG5vdy4gV2UgdHJpZWQgdHdvIFZNcyB3aXRoIHR3
byBkaXNwbGF5IG1vbml0b3JzIGFuZCBpdCBjYW4gd29yayBqdXN0Cj4gPiBhcyBleHBlY3RlZC4g
IEJUVywgeW91IG1pZ2h0IG5lZWQgdG8gdXBkYXRlIHNvbWUgcGFja2FnZXMgdG8gdGhlCj4gPiBs
YXRlc3QgdmVyc2lvbiwgZS5nLiB4b3JnLCBpbiBvcmRlciB0byB1c2UgdGhlIGRybSBsZWFzZS4g
SWYgeW91IGhhdmUKPiA+IGFueSBwcm9ibGVtLCBwbGVhc2UgbGV0IG1lIGtub3cuCj4gCj4gQ3Jl
YXRpbmcgYSBsZWFzZSBkb2Vzbid0IHdvcmsgaGVyZS4KPiAKPiBrZXJuZWwgaXMgNS4xLjUuICB4
b3JnIHNlcnZlciBpcyBpcyAxLjIwLjQsIHJlcG9ydGluZyB4cmFuZHIgdmVyc2lvbiAxLjYuICBX
aGljaAo+IHNob3VsZCBiZSBuZXcgZW5vdWdoLgpUaGlzIGlzIG91ciByZWZlcmVuY2VkIHZlcnNp
b25zOgpLZXJuZWw6IDUuMi4wIChob3dldmVyIDUuMS41IHNob3VsZCBhbHNvIHdvcmspIApYb3Jn
OiAxLjIwLjQgcmVwb3J0aW5nIHhyYW5kciB2ZXJzaW9uIDEuNgpMaWJ4Y2I6IDEuMTMKWGNiLXBy
b3RvOiAxLjEzClhvcmdwcm90bzogMjAxOC40LTQKTGliZHJtOiAyLjQuOTUKCkFsc28sIHlvdSBj
YW4gcmVmZXJlbmNlIHRoZSBzdGF0dXMgb2YgZHJtIGxlYXNlcyBzdXBwb3J0OgpodHRwczovL2hh
YWdjaC5mcmlja2VsLmNsdWIvIyFkcm1sZWFzZS5tZAoKCj4gCj4gRG8gSSBoYXZlIHRvIHNwZWNp
ZmljYWxseSBlbmFibGUgdGhpcyBzb21ld2hlcmU/CldoZW4geW91IHRyaWVkIHRoaXMgd29yayBo
dHRwczovL2dpdGh1Yi5jb20vaW50ZWwvSWd2dGctcWVtdS9jb21taXQvMjg4MWQ5YTY1YmViMzE5
YzQyYjk0N2QyM2ViMWQyNjAyMjRiY2RkYywgZGlkIHlvdSBhZGQgImVuYWJsZS1kcm1sZWFzZT1v
biIgbWVudGlvbmVkIGluIHRoZSBjb21taXQgbWVzc2FnZT8KCkJSLApUaW5hCgo+IAo+IHRoYW5r
cywKPiAgIEdlcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
aW50ZWwtZ3Z0LWRldg==
