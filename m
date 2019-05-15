Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FF61E7CC
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 15 May 2019 07:04:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86C26893D5;
	Wed, 15 May 2019 05:04:40 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D66D5893D5
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 15 May 2019 05:04:38 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 May 2019 22:04:38 -0700
X-ExtLoop1: 1
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by fmsmga007.fm.intel.com with ESMTP; 14 May 2019 22:04:38 -0700
Received: from fmsmsx112.amr.corp.intel.com (10.18.116.6) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Tue, 14 May 2019 22:04:35 -0700
Received: from shsmsx107.ccr.corp.intel.com (10.239.4.96) by
 FMSMSX112.amr.corp.intel.com (10.18.116.6) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Tue, 14 May 2019 22:04:35 -0700
Received: from shsmsx101.ccr.corp.intel.com ([169.254.1.129]) by
 SHSMSX107.ccr.corp.intel.com ([169.254.9.7]) with mapi id 14.03.0415.000;
 Wed, 15 May 2019 13:04:34 +0800
From: "Zhang, Tina" <tina.zhang@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: RE: [RFC PATCH v2 2/3] drm/i915/gvt: Introduce enable_direct_flip
 attribute
Thread-Topic: [RFC PATCH v2 2/3] drm/i915/gvt: Introduce enable_direct_flip
 attribute
Thread-Index: AQHVBufEpK4eSmzHM0KrfPWHlcKBEKZn5CcAgAPElYA=
Date: Wed, 15 May 2019 05:04:33 +0000
Message-ID: <237F54289DF84E4997F34151298ABEBC8761276A@SHSMSX101.ccr.corp.intel.com>
References: <1557461728-2831-1-git-send-email-tina.zhang@intel.com>
 <1557461728-2831-3-git-send-email-tina.zhang@intel.com>
 <20190513032914.GZ12913@zhen-hp.sh.intel.com>
In-Reply-To: <20190513032914.GZ12913@zhen-hp.sh.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMDZhYjRlZWItNjExMy00MDcxLTg1ODUtNDUwYWZhYTJhZDE1IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoieVwvc3ptakpFd2FBcTZCYzBkMitRSk05ajQ1dDExWXdvR1N3MW5LZlZUVjNiSTd2WDg3cVBjMkRYVmhsUEJGN0sifQ==
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
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "Yuan,
 Hang" <hang.yuan@intel.com>, "kraxel@redhat.com" <kraxel@redhat.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "Kondapally, 
 Kalyan" <kalyan.kondapally@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Wang, Zhi A" <zhi.a.wang@intel.com>, "Lv, Zhiyuan" <zhiyuan.lv@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Cgo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gRnJvbTogWmhlbnl1IFdhbmcgW21haWx0
bzp6aGVueXV3QGxpbnV4LmludGVsLmNvbV0KPiBTZW50OiBNb25kYXksIE1heSAxMywgMjAxOSAx
MToyOSBBTQo+IFRvOiBaaGFuZywgVGluYSA8dGluYS56aGFuZ0BpbnRlbC5jb20+Cj4gQ2M6IGty
YXhlbEByZWRoYXQuY29tOyB6aGVueXV3QGxpbnV4LmludGVsLmNvbTsgTHYsIFpoaXl1YW4KPiA8
emhpeXVhbi5sdkBpbnRlbC5jb20+OyBXYW5nLCBaaGkgQSA8emhpLmEud2FuZ0BpbnRlbC5jb20+
OyBUaWFuLCBLZXZpbgo+IDxrZXZpbi50aWFuQGludGVsLmNvbT47IGRhbmllbEBmZndsbC5jaDsg
S29uZGFwYWxseSwgS2FseWFuCj4gPGthbHlhbi5rb25kYXBhbGx5QGludGVsLmNvbT47IFl1YW4s
IEhhbmcgPGhhbmcueXVhbkBpbnRlbC5jb20+Owo+IHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwu
Y29tOyBpbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IFN1YmplY3Q6IFJlOiBb
UkZDIFBBVENIIHYyIDIvM10gZHJtL2k5MTUvZ3Z0OiBJbnRyb2R1Y2UgZW5hYmxlX2RpcmVjdF9m
bGlwCj4gYXR0cmlidXRlCj4gCj4gT24gMjAxOS4wNS4xMCAxMjoxNToyNyArMDgwMCwgVGluYSBa
aGFuZyB3cm90ZToKPiA+IFRoaXMgYXR0cmlidXRlIGlzIGludHJvZHVjZWQgdG8gd29yayBhcyBh
IHN3aXRjaCBvZiB0aGUgZ3Z0LWcgdkdQVQo+ID4gZGlyZWN0IGZsaXAgZnVuY3Rpb24uIFVzZXJz
cGFjZSBjYW4gc2ltcGx5IHN3aXRjaCBvbi9vZmYgdGhlIGRpcmVjdAo+ID4gZmxpcCBmdW5jdGlv
biBieSBlY2hvaW5nIDEvMCB0byB0aGlzIGF0dHJpYnV0dGUuCj4gPgo+ID4gU2lnbmVkLW9mZi1i
eTogVGluYSBaaGFuZyA8dGluYS56aGFuZ0BpbnRlbC5jb20+Cj4gPiAtLS0KPiAKPiBJIGRvIG5v
dCB0aGluayB0aGlzIGlzIGFwcHJvcHJpYXRlIGludGVyZmFjZSB3aGljaCBkb2Vzbid0IGFsaWdu
IHdpdGggdkdQVQo+IGxpZmVjeWNsZSBhbmQgYWxzbyBkb2Vzbid0IHdvcmsgdG9nZXRoZXIgd2l0
aCBjb250cm9sIHN0YXRlIG9mIHZmaW8gZ2Z4IGlvY3RsLgo+IFdoeSB0aGlzPwpJdCB0ZWxscyB3
aGV0aGVyIHRvIGVuYWJsZSBrZXJuZWwgZGlyZWN0IGZsaXAgb3Igbm90IGFuZCB3b24ndCBibG9j
ayB2ZmlvIGdmeCBpb2N0bC4KVGhhbmtzCgpCUiwKVGluYQoKPiAKPiA+ICBkcml2ZXJzL2dwdS9k
cm0vaTkxNS9ndnQva3ZtZ3QuYyB8IDM4Cj4gPiArKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzOCBpbnNlcnRpb25zKCspCj4gPgo+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9rdm1ndC5jCj4gPiBiL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2d2dC9rdm1ndC5jCj4gPiBpbmRleCBhNjhhZGRmLi4yOTExODE4IDEw
MDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2t2bWd0LmMKPiA+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9rdm1ndC5jCj4gPiBAQCAtMTU4MSwxMiArMTU4MSw1
MCBAQCBod19pZF9zaG93KHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0Cj4gZGV2aWNlX2F0dHJp
YnV0ZSAqYXR0ciwKPiA+ICAJcmV0dXJuIHNwcmludGYoYnVmLCAiXG4iKTsKPiA+ICB9Cj4gPgo+
ID4gK3N0YXRpYyBzc2l6ZV90Cj4gPiArZW5hYmxlX2RpcmVjdF9mbGlwX3Nob3coc3RydWN0IGRl
dmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSAqYXR0ciwKPiA+ICsJIGNoYXIgKmJ1
ZikKPiA+ICt7Cj4gPiArCXN0cnVjdCBtZGV2X2RldmljZSAqbWRldiA9IG1kZXZfZnJvbV9kZXYo
ZGV2KTsKPiA+ICsKPiA+ICsJaWYgKG1kZXYpIHsKPiA+ICsJCXN0cnVjdCBpbnRlbF92Z3B1ICp2
Z3B1ID0gKHN0cnVjdCBpbnRlbF92Z3B1ICopCj4gPiArCQkJbWRldl9nZXRfZHJ2ZGF0YShtZGV2
KTsKPiA+ICsJCXJldHVybiBzcHJpbnRmKGJ1ZiwgIiV1XG4iLAo+ID4gKwkJCSAgICAgICB2Z3B1
LT5kaXNwbGF5LnNoYWRvd19mYnMuZW5hYmxlX2RpcmVjdF9mbGlwKTsKPiA+ICsJfQo+ID4gKwly
ZXR1cm4gc3ByaW50ZihidWYsICJcbiIpOwo+ID4gK30KPiA+ICsKPiA+ICtzdGF0aWMgc3NpemVf
dAo+ID4gK2VuYWJsZV9kaXJlY3RfZmxpcF9zdG9yZShzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVj
dCBkZXZpY2VfYXR0cmlidXRlICphdHRyLAo+ID4gKwkJCSAgICAgY29uc3QgY2hhciAqYnVmLCBz
aXplX3QgbikKPiA+ICt7Cj4gPiArCXN0cnVjdCBtZGV2X2RldmljZSAqbWRldiA9IG1kZXZfZnJv
bV9kZXYoZGV2KTsKPiA+ICsJc3NpemVfdCByZXQ7Cj4gPiArCXUzMiB2YWw7Cj4gPiArCj4gPiAr
CXJldCA9IGtzdHJ0b3UzMihidWYsIDAsICZ2YWwpOwo+ID4gKwlpZiAocmV0KQo+ID4gKwkJcmV0
dXJuIHJldDsKPiA+ICsKPiA+ICsJaWYgKG1kZXYpIHsKPiA+ICsJCXN0cnVjdCBpbnRlbF92Z3B1
ICp2Z3B1ID0gKHN0cnVjdCBpbnRlbF92Z3B1ICopCj4gPiArCQkJbWRldl9nZXRfZHJ2ZGF0YSht
ZGV2KTsKPiA+ICsJCXZncHUtPmRpc3BsYXkuc2hhZG93X2Zicy5lbmFibGVfZGlyZWN0X2ZsaXAg
PSAhIXZhbDsKPiA+ICsJfQo+ID4gKwo+ID4gKwlyZXR1cm4gbjsKPiA+ICt9Cj4gPiArCj4gPiAg
c3RhdGljIERFVklDRV9BVFRSX1JPKHZncHVfaWQpOwo+ID4gIHN0YXRpYyBERVZJQ0VfQVRUUl9S
Tyhod19pZCk7Cj4gPiArc3RhdGljIERFVklDRV9BVFRSX1JXKGVuYWJsZV9kaXJlY3RfZmxpcCk7
Cj4gPgo+ID4gIHN0YXRpYyBzdHJ1Y3QgYXR0cmlidXRlICppbnRlbF92Z3B1X2F0dHJzW10gPSB7
Cj4gPiAgCSZkZXZfYXR0cl92Z3B1X2lkLmF0dHIsCj4gPiAgCSZkZXZfYXR0cl9od19pZC5hdHRy
LAo+ID4gKwkmZGV2X2F0dHJfZW5hYmxlX2RpcmVjdF9mbGlwLmF0dHIsCj4gPiAgCU5VTEwKPiA+
ICB9Owo+ID4KPiA+IC0tCj4gPiAyLjcuNAo+ID4KPiA+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4gPiBpbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAo+
ID4gaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+IGh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldgo+IAo+IC0tCj4g
T3BlbiBTb3VyY2UgVGVjaG5vbG9neSBDZW50ZXIsIEludGVsIGx0ZC4KPiAKPiAkZ3BnIC0ta2V5
c2VydmVyIHd3d2tleXMucGdwLm5ldCAtLXJlY3Yta2V5cyA0RDc4MTgyNwpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcg
bGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
