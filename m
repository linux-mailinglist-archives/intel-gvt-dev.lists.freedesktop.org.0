Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 053EB2794A
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 23 May 2019 11:33:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D3D889831;
	Thu, 23 May 2019 09:33:22 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 542E689831
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 23 May 2019 09:33:21 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 May 2019 02:33:21 -0700
X-ExtLoop1: 1
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by fmsmga005.fm.intel.com with ESMTP; 23 May 2019 02:33:21 -0700
Received: from fmsmsx120.amr.corp.intel.com (10.18.124.208) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Thu, 23 May 2019 02:33:20 -0700
Received: from shsmsx103.ccr.corp.intel.com (10.239.4.69) by
 fmsmsx120.amr.corp.intel.com (10.18.124.208) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Thu, 23 May 2019 02:33:20 -0700
Received: from shsmsx101.ccr.corp.intel.com ([169.254.1.129]) by
 SHSMSX103.ccr.corp.intel.com ([169.254.4.70]) with mapi id 14.03.0415.000;
 Thu, 23 May 2019 17:33:19 +0800
From: "Zhang, Tina" <tina.zhang@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: RE: [PATCH v2] drm/i915/gvt: Add set_ggtt_entry tracing event
Thread-Topic: [PATCH v2] drm/i915/gvt: Add set_ggtt_entry tracing event
Thread-Index: AQHVEOwMiBZLoP7AbUesO8JmGwcy4KZ3e3wAgAD3adA=
Date: Thu, 23 May 2019 09:33:18 +0000
Message-ID: <237F54289DF84E4997F34151298ABEBC8761D637@SHSMSX101.ccr.corp.intel.com>
References: <20190522221114.3548-1-tina.zhang@intel.com>
 <20190523024628.GM12913@zhen-hp.sh.intel.com>
In-Reply-To: <20190523024628.GM12913@zhen-hp.sh.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNWEyZDc4YmItZWRiNS00NTU3LTk4MWEtZTVlNTcwNDU4YjQ1IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoid0J5dEZZQTlscmMyYVBDWHhZa2VhS0FxTE1TRFNobGNNTVZja3VpUkpSWW1TSDFIaDBPekhvdGZsVzlLaEJhMSJ9
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
Cc: "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Cgo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gRnJvbTogWmhlbnl1IFdhbmcgW21haWx0
bzp6aGVueXV3QGxpbnV4LmludGVsLmNvbV0KPiBTZW50OiBUaHVyc2RheSwgTWF5IDIzLCAyMDE5
IDEwOjQ2IEFNCj4gVG86IFpoYW5nLCBUaW5hIDx0aW5hLnpoYW5nQGludGVsLmNvbT4KPiBDYzog
aW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBTdWJqZWN0OiBSZTogW1BBVENI
IHYyXSBkcm0vaTkxNS9ndnQ6IEFkZCBzZXRfZ2d0dF9lbnRyeSB0cmFjaW5nIGV2ZW50Cj4gCj4g
T24gMjAxOS4wNS4yMyAwNjoxMToxNCArMDgwMCwgVGluYSBaaGFuZyB3cm90ZToKPiA+IEFkZCBz
ZXRfZ2d0dF9lbnRyeSB0cmFjaW5nIGV2ZW50Lgo+ID4KPiA+IHYyOgo+ID4gLSBBZGQgaW5kZXgg
ZmllbGQuIChaaGVueXUpCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogVGluYSBaaGFuZyA8dGluYS56
aGFuZ0BpbnRlbC5jb20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0
LmMgICB8ICAxICsKPiA+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvdHJhY2UuaCB8IDIyICsr
KysrKysrKysrKysrKysrKysrKysKPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDIzIGluc2VydGlvbnMo
KykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5jCj4g
PiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuYyBpbmRleCBjMmY3ZDIwZjYzNDYuLjE1
MjE2YzViNDBhYQo+ID4gMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQv
Z3R0LmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuYwo+ID4gQEAgLTYy
OSw2ICs2MjksNyBAQCBzdGF0aWMgdm9pZCBnZ3R0X3NldF9ob3N0X2VudHJ5KHN0cnVjdAo+IGlu
dGVsX3ZncHVfbW0gKm1tLAo+ID4gIAlzdHJ1Y3QgaW50ZWxfZ3Z0X2d0dF9wdGVfb3BzICpwdGVf
b3BzID0gbW0tPnZncHUtPmd2dC0KPiA+Z3R0LnB0ZV9vcHM7Cj4gPgo+ID4gIAlHRU1fQlVHX09O
KG1tLT50eXBlICE9IElOVEVMX0dWVF9NTV9HR1RUKTsKPiA+ICsJdHJhY2Vfc2V0X2dndHRfZW50
cnkobW0tPnZncHUtPmlkLCBlbnRyeS0+dmFsNjQsIGluZGV4KTsKPiA+Cj4gPiAgCXB0ZV9vcHMt
PnNldF9lbnRyeShOVUxMLCBlbnRyeSwgaW5kZXgsIGZhbHNlLCAwLCBtbS0+dmdwdSk7ICB9IGRp
ZmYKPiA+IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3RyYWNlLmgKPiA+IGIvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3RyYWNlLmgKPiA+IGluZGV4IDZkNzg3NzUwZDI3OS4uOTgx
Y2MzNmViNTBmIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3RyYWNl
LmgKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC90cmFjZS5oCj4gPiBAQCAtMzcz
LDYgKzM3MywyOCBAQCBUUkFDRV9FVkVOVChyZW5kZXJfbW1pbywKPiA+ICAJCSAgX19lbnRyeS0+
b2xkX3ZhbCwgX19lbnRyeS0+bmV3X3ZhbCkgICk7Cj4gPgo+ID4gK1RSQUNFX0VWRU5UKHNldF9n
Z3R0X2VudHJ5LAo+ID4gKwlUUF9QUk9UTyhpbnQgaWQsIHVuc2lnbmVkIGxvbmcgYWRkcmVzcywK
PiA+ICsJCSAgICB1bnNpZ25lZCBsb25nIGluZGV4KSwKPiA+ICsKPiAKPiBCZXR0ZXIgc3RpY2sg
d2l0aCB1NjQgZm9yIGFkZHJlc3MgdHlwZSBhbmQgdXNlIHByb3BlciAweCVsbHggYmVsb3cgZm9y
IHByaW50ay4KQWJvdXQgdHlwZSwgZG8geW91IG1lYW4gZ2d0dCBvciBwcGd0dD8gV2Ugb25seSB0
cmFjZSBnZ3R0IGhlcmUuIFRoYW5rcy4KCkJSLApUaW5hCj4gCj4gPiArCVRQX0FSR1MoaWQsIGFk
ZHJlc3MsIGluZGV4KSwKPiA+ICsKPiA+ICsJVFBfU1RSVUNUX19lbnRyeSgKPiA+ICsJCV9fZmll
bGQoaW50LCBpZCkKPiA+ICsJCV9fZmllbGQodW5zaWduZWQgbG9uZywgYWRkcmVzcykKPiA+ICsJ
CV9fZmllbGQodW5zaWduZWQgbG9uZywgaW5kZXgpCj4gPiArCSksCj4gPiArCj4gPiArCVRQX2Zh
c3RfYXNzaWduKAo+ID4gKwkJX19lbnRyeS0+aWQgPSBpZDsKPiA+ICsJCV9fZW50cnktPmFkZHJl
c3MgPSBhZGRyZXNzOwo+ID4gKwkJX19lbnRyeS0+aW5kZXggPSBpbmRleDsKPiA+ICsJKSwKPiA+
ICsKPiA+ICsJVFBfcHJpbnRrKCJ2Z3B1JWQ6c2V0IGdndHQgZW50cnkgMHglbHgsIGluZGV4IDB4
JWx4XG4iLAo+ID4gKwkJICBfX2VudHJ5LT5pZCwgX19lbnRyeS0+YWRkcmVzcywgX19lbnRyeS0+
aW5kZXgpICk7Cj4gPiArCj4gPiAgI2VuZGlmIC8qIF9HVlRfVFJBQ0VfSF8gKi8KPiA+Cj4gPiAg
LyogVGhpcyBwYXJ0IG11c3QgYmUgb3V0IG9mIHByb3RlY3Rpb24gKi8KPiA+IC0tCj4gPiAyLjE3
LjEKPiA+Cj4gCj4gLS0KPiBPcGVuIFNvdXJjZSBUZWNobm9sb2d5IENlbnRlciwgSW50ZWwgbHRk
Lgo+IAo+ICRncGcgLS1rZXlzZXJ2ZXIgd3d3a2V5cy5wZ3AubmV0IC0tcmVjdi1rZXlzIDRENzgx
ODI3Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVs
LWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0
LWRldg==
