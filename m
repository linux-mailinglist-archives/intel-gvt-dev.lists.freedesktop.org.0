Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C23B16F9E3
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 22 Jul 2019 09:05:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 770AB89A7A;
	Mon, 22 Jul 2019 07:05:40 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B410989A7A;
 Mon, 22 Jul 2019 07:05:39 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jul 2019 00:05:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,294,1559545200"; d="scan'208";a="368426408"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by fmsmga006.fm.intel.com with ESMTP; 22 Jul 2019 00:05:18 -0700
Received: from shsmsx104.ccr.corp.intel.com (10.239.4.70) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 22 Jul 2019 00:05:18 -0700
Received: from shsmsx107.ccr.corp.intel.com ([169.254.9.162]) by
 SHSMSX104.ccr.corp.intel.com ([169.254.5.110]) with mapi id 14.03.0439.000;
 Mon, 22 Jul 2019 15:05:16 +0800
From: "Zhang, Xiaolin" <xiaolin.zhang@intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH v7 5/9] drm/i915: vgpu context submission pv
 optimization
Thread-Topic: [Intel-gfx] [PATCH v7 5/9] drm/i915: vgpu context submission
 pv optimization
Thread-Index: AQHVNS15ot0GzKLV302mhz5ylCHtpQ==
Date: Mon, 22 Jul 2019 07:05:15 +0000
Message-ID: <073732E20AE4C540AE91DBC3F07D4460876B53B4@SHSMSX107.ccr.corp.intel.com>
References: <1562549722-27046-1-git-send-email-xiaolin.zhang@intel.com>
 <1562549722-27046-6-git-send-email-xiaolin.zhang@intel.com>
 <156258245193.9375.12983936154899943549@skylake-alporthouse-com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.4.160]
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

T24gMDcvMDgvMjAxOSAwNjo0MSBQTSwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+IFF1b3RpbmcgWGlh
b2xpbiBaaGFuZyAoMjAxOS0wNy0wOCAwMjozNToxOCkKPj4gK3N0YXRpYyB2b2lkIHB2X3N1Ym1p
dChzdHJ1Y3QgaW50ZWxfZW5naW5lX2NzICplbmdpbmUsCj4+ICsgICAgICAgICAgICAgIHN0cnVj
dCBpOTE1X3JlcXVlc3QgKipvdXQsCj4+ICsgICAgICAgICAgICAgIHN0cnVjdCBpOTE1X3JlcXVl
c3QgKiplbmQpCj4+ICt7Cj4+ICsgICAgICAgc3RydWN0IGludGVsX2VuZ2luZV9leGVjbGlzdHMg
KiBjb25zdCBleGVjbGlzdHMgPSAmZW5naW5lLT5leGVjbGlzdHM7Cj4+ICsgICAgICAgc3RydWN0
IGk5MTVfdmlydHVhbF9ncHVfcHYgKnB2ID0gZW5naW5lLT5pOTE1LT52Z3B1LnB2Owo+PiArICAg
ICAgIHN0cnVjdCBwdl9zdWJtaXNzaW9uICpwdl9lbHNwID0gcHYtPnB2X2Vsc3BbZW5naW5lLT5o
d19pZF07Cj4+ICsgICAgICAgc3RydWN0IGk5MTVfcmVxdWVzdCAqcnE7Cj4+ICsKPj4gKyAgICAg
ICB1NjQgZGVzY3NbMl07Cj4+ICsgICAgICAgaW50IG4sIGVycjsKPj4gKwo+PiArICAgICAgIG1l
bXNldChkZXNjcywgMCwgc2l6ZW9mKGRlc2NzKSk7Cj4+ICsgICAgICAgbiA9IDA7Cj4+ICsgICAg
ICAgZG8gewo+PiArICAgICAgICAgICAgICAgcnEgPSAqb3V0Kys7Cj4+ICsgICAgICAgICAgICAg
ICBkZXNjc1tuKytdID0gZXhlY2xpc3RzX3VwZGF0ZV9jb250ZXh0KHJxKTsKPj4gKyAgICAgICB9
IHdoaWxlIChvdXQgIT0gZW5kKTsKPj4gKwo+PiArICAgICAgIGZvciAobiA9IDA7IG4gPCBleGVj
bGlzdHNfbnVtX3BvcnRzKGV4ZWNsaXN0cyk7IG4rKykKPj4gKyAgICAgICAgICAgICAgIHB2X2Vs
c3AtPmRlc2NzW25dID0gZGVzY3Nbbl07Cj4gWW91IGNhbiBwb2xpc2ggdGhpcyBhIGJpdCwgbWlu
b3Igbml0LgpTdXJlLgo+Cj4+ICsgICAgICAgd3JpdGVsKFBWX0FDVElPTl9FTFNQX1NVQk1JU1NJ
T04sIGV4ZWNsaXN0cy0+c3VibWl0X3JlZyk7Cj4+ICsKPj4gKyNkZWZpbmUgZG9uZSAoUkVBRF9P
TkNFKHB2X2Vsc3AtPnN1Ym1pdHRlZCkgPT0gdHJ1ZSkKPj4gKyAgICAgICBlcnIgPSB3YWl0X2Zv
cl91cyhkb25lLCAxKTsKPj4gKyAgICAgICBpZiAoZXJyKQo+PiArICAgICAgICAgICAgICAgZXJy
ID0gd2FpdF9mb3IoZG9uZSwgMSk7Cj4gU3RyaWN0bHksIHlvdSBuZWVkIHRvIHVzZSB3YWl0X2Zv
cl9hdG9taWNfdXMoKSBbdW5kZXIgYSBzcGlubG9jayBoZXJlXSwKPiBhbmQgdGhlcmUncyBubyBu
ZWVkIGZvciBhIHNlY29uZCBwYXNzIHNpbmNlIHlvdSBhcmUgbm90IGFsbG93ZWQgdG8gc2xlZXAK
PiBhbnl3YXkuIFNvIGp1c3Qgc2V0IHRoZSB0aW1lb3V0IHRvIDEwMDB1cy4KU3VyZS4KPj4gKyN1
bmRlZiBkb25lCj4+ICsKPj4gKyAgICAgICBpZiAodW5saWtlbHkoZXJyKSkKPj4gKyAgICAgICAg
ICAgICAgIERSTV9FUlJPUigiUFYgKCVzKSB3b3JrbG9hZCBzdWJtaXNzaW9uIGZhaWxlZFxuIiwg
ZW5naW5lLT5uYW1lKTsKPj4gKwo+PiArICAgICAgIHB2X2Vsc3AtPnN1Ym1pdHRlZCA9IGZhbHNl
Owo+IEhvd2V2ZXIsIHRoYXQgbG9va3Mgc29saWQgd3J0IHRvIHNlcmlhbGlzYXRpb24gb2YgdGhp
cyBlbmdpbmUgd2l0aCBpdHMKPiBwdiBob3N0LCB3aXRob3V0IGNyb3NzLWludGVyZmVyZW5jZSAo
YXQgbGVhc3QgaW4gdGhlIGNvbW1zIGNoYW5uZWwpLgo+Cj4gSWYgeW91IHdhbnQgdG8gZ2V0IGZh
bmN5LCB5b3Ugc2hvdWxkIGJlIGFibGUgdG8gc2ltcGx5IG5vdCBkZXF1ZXVlIHVudGlsCj4gIXB2
X2Vsc3AtPnN1Ym1pdHRlZCBzbyB0aGUgd2FpdC1mb3ItYWNrIG9jY3VycyBuYXR1cmFsbHkuIFNv
IGxvbmcgYXMgdGhlCj4gcHYgaG9zdCBwbGF5cyBuaWNlbHksIHdlIHNob3VsZCBhbHdheXMgc2Vl
IHN1Ym1pdHRlZCBhY2tlZCBiZWZvcmUgdGhlCj4gcmVxdWVzdCBpcyBzaWduYWxlZC4gR2l2ZSBv
ciB0YWtlIHByb2JsZW1zIHdpdGggcHJlZW1wdGlvbiBhbmQgdGhlIHB2Cj4gaG9zdCBiZWluZyBh
IGJsYWNrIGJveCB0aGF0IG1heSBhbGxvdyByZXF1ZXN0cyB0byBjb21wbGV0ZSBhbmQgc28gb3Vy
Cj4gc3VibWlzc2lvbiBiZSBhIG5vLW9wIChhbmQgc28gbm90IGdlbmVyYXRlIGFuIGludGVycnVw
dCB0byBhbGxvdyBmdXJ0aGVyCj4gc3VibWlzc2lvbikuIEluZGVlZCwgSSB3b3VsZCBzdHJvbmds
eSByZWNvbW1lbmQgeW91IHVzZSB0aGUgZGVsYXllZCBhY2sKPiBwbHVzIGppZmZpZSB0aW1lciB0
byBhdm9pZCB0aGUgbm8tb3Agc3VibWlzc2lvbiBwcm9ibGVtLgpJIHdpbGwgaW1wbGVtZW50IHRo
aXMgc3VnZ2VzdGlvbi4gdGhhbmtzIHlvdXIgZmVlZGJhY2ssIENocmlzLgotQlJzLCBYaWFvbGlu
Cj4gSWYgeW91IHdhbnQgdG8gcHJvdmUgdGhpcyBpbiBhIGJ1bmNoIG9mIG1vY2tlZCB1cCBzZWxm
dGVzdHMgdGhhdCBwcm92aWRlCj4gdGhlIHB2IGNoYW5uZWwgb250b3Agb2YgdGhlIGxvY2FsIGRy
aXZlci4uLi4KPiAtQ2hyaXMKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+IGludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0Cj4gaW50ZWwtZ3Z0LWRldkBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXYKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQt
ZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
