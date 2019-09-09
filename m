Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDB7AE06C
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  9 Sep 2019 23:55:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C03E89202;
	Mon,  9 Sep 2019 21:55:04 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F36E589202;
 Mon,  9 Sep 2019 21:55:02 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Sep 2019 14:55:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,487,1559545200"; d="scan'208";a="189147132"
Received: from irsmsx104.ger.corp.intel.com ([163.33.3.159])
 by orsmga006.jf.intel.com with ESMTP; 09 Sep 2019 14:55:00 -0700
Received: from irsmsx111.ger.corp.intel.com ([169.254.2.112]) by
 IRSMSX104.ger.corp.intel.com ([169.254.5.103]) with mapi id 14.03.0439.000;
 Mon, 9 Sep 2019 22:55:00 +0100
From: "Vetter, Daniel" <daniel.vetter@intel.com>
To: "airlied@redhat.com" <airlied@redhat.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "Nikula, Jani" <jani.nikula@intel.com>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>
Subject: Re: [PULL] gvt-next-fixes
Thread-Topic: [PULL] gvt-next-fixes
Thread-Index: AQHVZzNWqww5xc4VTk+Liu+gmZma06cj00cA
Date: Mon, 9 Sep 2019 21:54:59 +0000
Message-ID: <f631f702240c0ecb99e94171f26e951f4e76911a.camel@intel.com>
References: <20190906054255.GC3458@zhen-hp.sh.intel.com>
 <20190909172416.GB20172@intel.com>
In-Reply-To: <20190909172416.GB20172@intel.com>
Accept-Language: de-CH, en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.32.4 (3.32.4-1.fc30) 
x-originating-ip: [10.252.54.36]
Content-ID: <5958FB300500424EBE9A912B73D61B41@intel.com>
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>, "Lv, Zhiyuan" <zhiyuan.lv@intel.com>,
 "Wang, Zhi A" <zhi.a.wang@intel.com>, "Yuan, Hang" <hang.yuan@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDE5LTA5LTA5IGF0IDEwOjI0IC0wNzAwLCBSb2RyaWdvIFZpdmkgd3JvdGU6DQo+
IEhpIGd1eXMsDQo+IA0KPiBPbiBGcmksIFNlcCAwNiwgMjAxOSBhdCAwMTo0Mjo1NVBNICswODAw
LCBaaGVueXUgV2FuZyB3cm90ZToNCj4gPiBIaSwNCj4gPiANCj4gPiBIZXJlJ3MgZ3Z0LW5leHQt
Zml4ZXMgd2l0aCB0d28gcmVjZW50IGZpeGVzLCBvbmUgZm9yIHJlY2VudA0KPiA+IGd1ZXN0IGhh
bmcgcmVncmVzc2lvbiBhbmQgYW5vdGhlciBmb3IgZ3Vlc3QgcmVzZXQgZml4Lg0KPiA+IA0KPiA+
IFRoYW5rcy4NCj4gPiAtLQ0KPiA+IFRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQN
Cj4gPiBjMzZiZWJhNmIyOTZiM2MwNWEwZjI5NzUzYjA0Nzc1ZTVhZTIzODg2Og0KPiA+IA0KPiA+
ICAgZHJtL2k5MTU6IFNlYWwgcmFjZXMgYmV0d2VlbiBhc3luYyBHUFUgY2FuY2VsbGF0aW9uLCBy
ZXRpcmVtZW50DQo+ID4gYW5kIHNpZ25hbGluZyAoMjAxOS0wNS0xMyAxMzo1MzozNSArMDMwMCkN
Cj4gPiANCj4gPiBhcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoNCj4gPiAN
Cj4gPiAgIGh0dHBzOi8vZ2l0aHViLmNvbS9pbnRlbC9ndnQtbGludXguZ2l0IHRhZ3MvZ3Z0LW5l
eHQtZml4ZXMtMjAxOS0NCj4gPiAwOS0wNg0KPiA+IA0KPiA+IGZvciB5b3UgdG8gZmV0Y2ggY2hh
bmdlcyB1cCB0bw0KPiA+IDRhNTMyMjU2MGFhMjM1ZWZhODRjMGFhMzRjMDBlNTc0OWEwNzkyZmQ6
DQo+ID4gDQo+ID4gICBkcm0vaTkxNS9ndnQ6IHVwZGF0ZSBSSU5HX1NUQVJUIHJlZyBvZiB2R1BV
IHdoZW4gdGhlIGNvbnRleHQgaXMNCj4gPiBzdWJtaXR0ZWQgdG8gaTkxNSAoMjAxOS0wOS0wNiAx
MzozOTowOSArMDgwMCkNCj4gDQo+ICQgZGltIHB1bGwtcmVxdWVzdC1uZXh0LWZpeGVzDQo+IFVz
aW5nIGRybS9kcm0tbmV4dCBhcyB0aGUgdXBzdHJlYW0NCj4gZGltOiA0YTUzMjI1NjBhYTIgKCJk
cm0vaTkxNS9ndnQ6IHVwZGF0ZSBSSU5HX1NUQVJUIHJlZyBvZiB2R1BVIHdoZW4NCj4gdGhlIGNv
bnRleHQgaXMgc3VibWl0dGVkIHRvIGk5MTUiKTogTGluayB0YWcgbWlzc2luZy4NCj4gZGltOiAw
YTMyNDJiZGI0NzcgKCJkcm0vaTkxNS9ndnQ6IHVwZGF0ZSB2Z3B1IHdvcmtsb2FkIGhlYWQgcG9p
bnRlcg0KPiBjb3JyZWN0bHkiKTogTGluayB0YWcgbWlzc2luZy4NCj4gZGltOiBFUlJPUjogaXNz
dWVzIGluIGNvbW1pdHMgZGV0ZWN0ZWQsIGFib3J0aW5nDQo+IA0KPiBJIHdvbmRlciBob3cgSSBz
aG91bGQgcHJvY2VlZCBoZXJlLiBJbiB0aGUgcGFzdCBJIHdhcyBhbHdheXMNCj4gYnlwYXNzc2lu
ZyBkaW0sDQo+IGJ1dCBub3cgdGhhdCBkcm0gbWFpbnRhaW5lcnMgYWxzbyB1c2UgZGltIEknbSBz
dXJlIHRoaXMgd2lsbCBibG93IHVwDQo+IHRoZXJlIGFueXdheXMuDQo+IA0KPiBCdXQgZ3Z0IHBh
dGNoZXMgYXJlIG5vdCB0cmFja2VkIG9uIG91ciBDSSBpbmRpdmlkdWFsbHkgaGVuY2UgdGhleQ0K
PiBkb24ndA0KPiBoYXZlIExpbmtzLg0KPiANCj4gSmFuaSwgSm9vbmFzLCBob3cgYXJlIHlvdSBn
dXlzIGhhbmRsaW5nIHRoaXM/DQo+IA0KPiBEYW5pZWwsIERhdmUsIGlkZWFzPw0KDQpkaW0gZG9l
c24ndCByZXF1aXJlIExpbms6IHRhZ3MgeWV0IGZvciBwdWxsIHJlcXVlc3RzIChiZWNhdXNlIG1v
c3QgZHJtDQp0cmVlcyBhcmVuJ3QgbWFuYWdlZCBieSBkaW0gYW5kIHNvIGxhY2sgdGhlbSkuIFVu
dGlsIHdlIGNoYW5nZSB0aGF0LA0Kd2l0aCBzb21lIGRvYyBwYXRjaGVzIGFuZCBwcm9wZXIgYmlr
ZXNoZWQgb24gZHJpLWRldmVsIEkgdGhpbmsgaXQncw0KZmluZSBpZiBndnQgaXMgbWlzc2luZyB0
aGVtLiBBdCBsZWFzdCBmcm9tIGEgZHJtLmdpdCBwb3YuDQoNCldoYXQgeW91IGd1eXMgd2FudCB0
byBkbyBmb3IgZHJtLWludGVsLmdpdCBpcyBlbnRpcmVseSB1cCB0byB5b3UuDQotRGFuaWVsDQo+
IA0KPiBUaGFua3MsDQo+IFJvZHJpZ28uDQo+IA0KPiA+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gPiBndnQtbmV4dC1m
aXhlcy0yMDE5LTA5LTA2DQo+ID4gDQo+ID4gLSBGaXggZ3Vlc3QgY29udGV4dCBoZWFkIHBvaW50
ZXIgdXBkYXRlIGZvciBoYW5nIChYaWFvbGluKQ0KPiA+IC0gRml4IGd1ZXN0IGNvbnRleHQgcmlu
ZyBzdGF0ZSBmb3IgcmVzZXQgKFdlaW5hbikNCj4gPiANCj4gPiAtLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gV2VpbmFu
IExpICgxKToNCj4gPiAgICAgICBkcm0vaTkxNS9ndnQ6IHVwZGF0ZSBSSU5HX1NUQVJUIHJlZyBv
ZiB2R1BVIHdoZW4gdGhlIGNvbnRleHQNCj4gPiBpcyBzdWJtaXR0ZWQgdG8gaTkxNQ0KPiA+IA0K
PiA+IFhpYW9saW4gWmhhbmcgKDEpOg0KPiA+ICAgICAgIGRybS9pOTE1L2d2dDogdXBkYXRlIHZn
cHUgd29ya2xvYWQgaGVhZCBwb2ludGVyIGNvcnJlY3RseQ0KPiA+IA0KPiA+ICBkcml2ZXJzL2dw
dS9kcm0vaTkxNS9ndnQvc2NoZWR1bGVyLmMgfCA0NQ0KPiA+ICsrKysrKysrKysrKysrKysrKysr
KysrKystLS0tLS0tLS0tLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMzIgaW5zZXJ0aW9ucygrKSwg
MTMgZGVsZXRpb25zKC0pDQo+ID4gDQo+ID4gDQo+ID4gLS0gDQo+ID4gT3BlbiBTb3VyY2UgVGVj
aG5vbG9neSBDZW50ZXIsIEludGVsIGx0ZC4NCj4gPiANCj4gPiAkZ3BnIC0ta2V5c2VydmVyIHd3
d2tleXMucGdwLm5ldCAtLXJlY3Yta2V5cyA0RDc4MTgyNw0KPiANCj4gDQpJbnRlbCBTZW1pY29u
ZHVjdG9yIEFHClJlZ2lzdGVyZWQgTm8uIDAyMC4zMC45MTMuNzg2LTcKUmVnaXN0ZXJlZCBPZmZp
Y2U6IEJhZGVuZXJzdHJhc3NlIDU0OSwgODA0OCBadXJpY2gsIFN3aXR6ZXJsYW5kCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFp
bGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
