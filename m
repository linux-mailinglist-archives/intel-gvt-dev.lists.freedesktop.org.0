Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 536402ADE3
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 27 May 2019 07:07:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEB2389700;
	Mon, 27 May 2019 05:07:25 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59EA289700
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 27 May 2019 05:07:24 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 May 2019 22:07:24 -0700
X-ExtLoop1: 1
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by fmsmga007.fm.intel.com with ESMTP; 26 May 2019 22:07:23 -0700
Received: from fmsmsx156.amr.corp.intel.com (10.18.116.74) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Sun, 26 May 2019 22:07:23 -0700
Received: from shsmsx154.ccr.corp.intel.com (10.239.6.54) by
 fmsmsx156.amr.corp.intel.com (10.18.116.74) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Sun, 26 May 2019 22:07:23 -0700
Received: from shsmsx101.ccr.corp.intel.com ([169.254.1.129]) by
 SHSMSX154.ccr.corp.intel.com ([169.254.7.136]) with mapi id 14.03.0415.000;
 Mon, 27 May 2019 13:07:22 +0800
From: "Zhang, Tina" <tina.zhang@intel.com>
To: "Zhao, Yan Y" <yan.y.zhao@intel.com>
Subject: RE: [PATCH] drm/i915/gvt: Double check batch buffer size after copy
Thread-Topic: [PATCH] drm/i915/gvt: Double check batch buffer size after copy
Thread-Index: AQHVEfxL/F6cJs0arEO/7O6RJeypVqZ5ZPsAgAULGJA=
Date: Mon, 27 May 2019 05:07:21 +0000
Message-ID: <237F54289DF84E4997F34151298ABEBC876204AC@SHSMSX101.ccr.corp.intel.com>
References: <20190524063954.3468-1-tina.zhang@intel.com>
 <20190524080604.GA27438@joy-OptiPlex-7040>
In-Reply-To: <20190524080604.GA27438@joy-OptiPlex-7040>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiOTEzMTVlOTEtOTE1MC00YjUyLThiZDktMTYzY2EzYmFiZjBhIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiTGFJRVBDd0hGZEx1Nm85TzROVG12MGE1c1IxSHk1QmZoUVl2NzlMbFlRcWJsNnNyVTZIc3BpeXpPdEM2YXRJOSJ9
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
Cc: "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>, "Yuan,
 Hang" <hang.yuan@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Cgo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gRnJvbTogWmhhbywgWWFuIFkKPiBTZW50
OiBGcmlkYXksIE1heSAyNCwgMjAxOSA0OjA2IFBNCj4gVG86IFpoYW5nLCBUaW5hIDx0aW5hLnpo
YW5nQGludGVsLmNvbT4KPiBDYzogemhlbnl1d0BsaW51eC5pbnRlbC5jb207IFl1YW4sIEhhbmcg
PGhhbmcueXVhbkBpbnRlbC5jb20+OyBpbnRlbC0KPiBndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGRybS9pOTE1L2d2dDogRG91YmxlIGNoZWNrIGJh
dGNoIGJ1ZmZlciBzaXplIGFmdGVyIGNvcHkKPiAKPiBPbiBGcmksIE1heSAyNCwgMjAxOSBhdCAw
MjozOTo1NFBNICswODAwLCBUaW5hIFpoYW5nIHdyb3RlOgo+ID4gRG91YmxlIGNoZWNrIHRoZSBz
aXplIG9mIHRoZSBwcml2aWxlZ2UgYnVmZmVyIHRvIG1ha2Ugc3VyZSB0aGUgc2l6ZQo+ID4gcmVt
YWlucyB1bmNoYW5nZWQgYWZ0ZXIgY29weS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBUaW5hIFpo
YW5nIDx0aW5hLnpoYW5nQGludGVsLmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9p
OTE1L2d2dC9jbWRfcGFyc2VyLmMgfCAxMiArKysrKysrKysrKy0KPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgMTEgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvY21kX3BhcnNlci5jCj4gPiBiL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2d2dC9jbWRfcGFyc2VyLmMKPiA+IGluZGV4IGFiMDAyY2ZkM2NhYi4uOTZkYWRlMzJh
MzNjIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2NtZF9wYXJzZXIu
Ywo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2NtZF9wYXJzZXIuYwo+ID4gQEAg
LTE3MTcsNyArMTcxNyw3IEBAIHN0YXRpYyBpbnQgcGVyZm9ybV9iYl9zaGFkb3coc3RydWN0Cj4g
cGFyc2VyX2V4ZWNfc3RhdGUgKnMpCj4gPiAgCXN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1ID0gcy0+
dmdwdTsKPiA+ICAJc3RydWN0IGludGVsX3ZncHVfc2hhZG93X2JiICpiYjsKPiA+ICAJdW5zaWdu
ZWQgbG9uZyBnbWEgPSAwOwo+ID4gLQl1bnNpZ25lZCBsb25nIGJiX3NpemU7Cj4gPiArCXVuc2ln
bmVkIGxvbmcgYmJfc2l6ZSwgY2hlY2tfYmJfc2l6ZTsKPiA+ICAJaW50IHJldCA9IDA7Cj4gPiAg
CXN0cnVjdCBpbnRlbF92Z3B1X21tICptbSA9IChzLT5idWZfYWRkcl90eXBlID09IEdUVF9CVUZG
RVIpID8KPiA+ICAJCXMtPnZncHUtPmd0dC5nZ3R0X21tIDogcy0+d29ya2xvYWQtPnNoYWRvd19t
bTsgQEAgLQo+IDE3ODMsNiArMTc4MywxNgo+ID4gQEAgc3RhdGljIGludCBwZXJmb3JtX2JiX3No
YWRvdyhzdHJ1Y3QgcGFyc2VyX2V4ZWNfc3RhdGUgKnMpCj4gPiAgCQlnb3RvIGVycl91bm1hcDsK
PiA+ICAJfQo+ID4KPiA+ICsJcmV0ID0gZmluZF9iYl9zaXplKHMsICZjaGVja19iYl9zaXplKTsK
PiA+ICsJaWYgKHJldCkKPiA+ICsJCWdvdG8gZXJyX3VubWFwOwo+ID4gKwo+IGNhbiBqdXN0IGNo
ZWNrIHdoZXRoZXIgdGhlIGJhdGNoIGJ1ZmZlciBpcyBlbmRlZCB3aXRoIGJiIHN0YXJ0IG9yIGJi
IGVuZCB0bwo+IGF2b2lkIGNhbGxpbmcgZmluZF9iYl9zaXplKCkgdHdpY2UsIHdoaWNoIGlzIGEg
cmF0aGVyIGhlYXZ5IGNhbGwgYW5kIG1heSBjYXVzZQo+IGVuZGxlc3MgbG9vcCBpbiBpdHNlbGYg
aWYgbWF4IHNpemUgbGltaXQgaXMgbm90IGltcG9zZWQuCk1ha2Ugc2Vuc2UuIFRoYW5rcy4KCkJS
LApUaW5hCj4gCj4gCj4gPiArCWlmIChjaGVja19iYl9zaXplICE9IGJiX3NpemUpIHsKPiA+ICsJ
CWd2dF92Z3B1X2VycigiZ3Vlc3QgcmluZyBidWZmZXIgaGFzIGJlZW4gY2hhbmdlZFxuIik7Cj4g
PiArCQlyZXQgPSAtRUlOVkFMOwo+ID4gKwkJZ290byBlcnJfdW5tYXA7Cj4gPiArCX0KPiA+ICsK
PiA+ICAJSU5JVF9MSVNUX0hFQUQoJmJiLT5saXN0KTsKPiA+ICAJbGlzdF9hZGQoJmJiLT5saXN0
LCAmcy0+d29ya2xvYWQtPnNoYWRvd19iYik7Cj4gPgo+ID4gLS0KPiA+IDIuMTcuMQo+ID4KPiA+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiBpbnRl
bC1ndnQtZGV2IG1haWxpbmcgbGlzdAo+ID4gaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKPiA+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
aW50ZWwtZ3Z0LWRldgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2ludGVsLWd2dC1kZXY=
