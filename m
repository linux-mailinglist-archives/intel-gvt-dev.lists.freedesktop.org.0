Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F81F8B4A1
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 13 Aug 2019 11:52:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D39696E0DC;
	Tue, 13 Aug 2019 09:52:16 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 359A96E0DC
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 13 Aug 2019 09:52:15 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Aug 2019 02:52:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,381,1559545200"; d="scan'208";a="167007369"
Received: from fmsmsx104.amr.corp.intel.com ([10.18.124.202])
 by orsmga007.jf.intel.com with ESMTP; 13 Aug 2019 02:52:14 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx104.amr.corp.intel.com (10.18.124.202) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 13 Aug 2019 02:52:13 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 13 Aug 2019 02:52:12 -0700
Received: from shsmsx107.ccr.corp.intel.com (10.239.4.96) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 13 Aug 2019 02:52:12 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.112]) by
 SHSMSX107.ccr.corp.intel.com ([169.254.9.65]) with mapi id 14.03.0439.000;
 Tue, 13 Aug 2019 17:52:11 +0800
From: "Zhang, Xiong Y" <xiong.y.zhang@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>, intel-gvt-dev
 <intel-gvt-dev@lists.freedesktop.org>
Subject: RE: [PATCH] drm/i915/gvt: Fix typo of VBLANK_TIMER_PERIOD
Thread-Topic: [PATCH] drm/i915/gvt: Fix typo of VBLANK_TIMER_PERIOD
Thread-Index: AQHVUbySk7LyIr2V90OiWyJ1lq60Kab41cCg
Date: Tue, 13 Aug 2019 09:52:11 +0000
Message-ID: <8082FF9BCB2B054996454E47167FF4EC276B792D@SHSMSX104.ccr.corp.intel.com>
References: <20190610092750.11307-1-zhenyuw@linux.intel.com>
 <20190813094518.GD19140@zhen-hp.sh.intel.com>
In-Reply-To: <20190813094518.GD19140@zhen-hp.sh.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMWJjNTY5ZTktNzk4OC00OGRhLTgxOGQtMDEzZGIxYTE0NjcwIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiMzdKdE9rSmdBeVFrbmNONHR6ek5HSVZRTmVPRGpacXRpMDBIelBheklVaFwvendDbXRWeW13UXRlSTRwQVVFY1AifQ==
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
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
Cc: "Zhang, Xiong Y" <xiong.y.zhang@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IFhpb25nIFpoYW5nIDx4aW9uZy55LnpoYW5nQGludGVsLmNvbT4KCnRoYW5r
cwo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gRnJvbTogaW50ZWwtZ3Z0LWRldiBbbWFp
bHRvOmludGVsLWd2dC1kZXYtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmddIE9uCj4gQmVo
YWxmIE9mIFpoZW55dSBXYW5nCj4gU2VudDogVHVlc2RheSwgQXVndXN0IDEzLCAyMDE5IDU6NDUg
UE0KPiBUbzogaW50ZWwtZ3Z0LWRldiA8aW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5v
cmc+Cj4gU3ViamVjdDogUmU6IFtQQVRDSF0gZHJtL2k5MTUvZ3Z0OiBGaXggdHlwbyBvZiBWQkxB
TktfVElNRVJfUEVSSU9ECj4gCj4gCj4gQW55b25lIGhlbHAgZm9yIHJldmlldz8KPiAKPiBPbiAy
MDE5LjA2LjEwIDE3OjI3OjUwICswODAwLCBaaGVueXUgV2FuZyB3cm90ZToKPiA+IFRoaXMgZml4
ZXMgdHlwbyBmb3IgVkJMQU5LX1RJTUVSX1BFUklPRC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBa
aGVueXUgV2FuZyA8emhlbnl1d0BsaW51eC5pbnRlbC5jb20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJz
L2dwdS9kcm0vaTkxNS9ndnQvaW50ZXJydXB0LmMgfCA0ICsrLS0KPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaW50ZXJydXB0LmMKPiA+IGIvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ3Z0L2ludGVycnVwdC5jCj4gPiBpbmRleCA5NTE2ODE4MTMyMzAuLjExYWNjZDNlMTAy
MyAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9pbnRlcnJ1cHQuYwo+
ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2ludGVycnVwdC5jCj4gPiBAQCAtNjcy
LDcgKzY3Miw3IEBAIHZvaWQgaW50ZWxfZ3Z0X2NsZWFuX2lycShzdHJ1Y3QgaW50ZWxfZ3Z0ICpn
dnQpCj4gPiAgCWhydGltZXJfY2FuY2VsKCZpcnEtPnZibGFua190aW1lci50aW1lcik7Cj4gPiAg
fQo+ID4KPiA+IC0jZGVmaW5lIFZCTE5BS19USU1FUl9QRVJJT0QgMTYwMDAwMDAKPiA+ICsjZGVm
aW5lIFZCTEFOS19USU1FUl9QRVJJT0QgMTYwMDAwMDAKPiA+Cj4gPiAgLyoqCj4gPiAgICogaW50
ZWxfZ3Z0X2luaXRfaXJxIC0gaW5pdGlhbGl6ZSBHVlQtZyBJUlEgZW11bGF0aW9uIHN1YnN5c3Rl
bSBAQAo+ID4gLTcwNCw3ICs3MDQsNyBAQCBpbnQgaW50ZWxfZ3Z0X2luaXRfaXJxKHN0cnVjdCBp
bnRlbF9ndnQgKmd2dCkKPiA+Cj4gPiAgCWhydGltZXJfaW5pdCgmdmJsYW5rX3RpbWVyLT50aW1l
ciwgQ0xPQ0tfTU9OT1RPTklDLAo+IEhSVElNRVJfTU9ERV9BQlMpOwo+ID4gIAl2YmxhbmtfdGlt
ZXItPnRpbWVyLmZ1bmN0aW9uID0gdmJsYW5rX3RpbWVyX2ZuOwo+ID4gLQl2YmxhbmtfdGltZXIt
PnBlcmlvZCA9IFZCTE5BS19USU1FUl9QRVJJT0Q7Cj4gPiArCXZibGFua190aW1lci0+cGVyaW9k
ID0gVkJMQU5LX1RJTUVSX1BFUklPRDsKPiA+Cj4gPiAgCXJldHVybiAwOwo+ID4gIH0KPiA+IC0t
Cj4gPiAyLjIwLjEKPiA+Cj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+ID4gaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKPiA+IGludGVsLWd2dC1k
ZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXYKPiAKPiAtLQo+IE9wZW4gU291cmNlIFRl
Y2hub2xvZ3kgQ2VudGVyLCBJbnRlbCBsdGQuCj4gCj4gJGdwZyAtLWtleXNlcnZlciB3d3drZXlz
LnBncC5uZXQgLS1yZWN2LWtleXMgNEQ3ODE4MjcKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0
LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
