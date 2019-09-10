Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2592AF28B
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 10 Sep 2019 23:24:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72E7F6E9B7;
	Tue, 10 Sep 2019 21:24:08 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AA036E9B7;
 Tue, 10 Sep 2019 21:24:07 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Sep 2019 14:24:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,490,1559545200"; d="scan'208";a="268539247"
Received: from irsmsx110.ger.corp.intel.com ([163.33.3.25])
 by orsmga001.jf.intel.com with ESMTP; 10 Sep 2019 14:24:04 -0700
Received: from irsmsx112.ger.corp.intel.com (10.108.20.5) by
 irsmsx110.ger.corp.intel.com (163.33.3.25) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 10 Sep 2019 22:24:03 +0100
Received: from irsmsx111.ger.corp.intel.com ([169.254.2.112]) by
 irsmsx112.ger.corp.intel.com ([169.254.1.33]) with mapi id 14.03.0439.000;
 Tue, 10 Sep 2019 22:24:03 +0100
From: "Vetter, Daniel" <daniel.vetter@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: Re: [PULL] gvt-next-fixes
Thread-Topic: [PULL] gvt-next-fixes
Thread-Index: AQHVZzNWqww5xc4VTk+Liu+gmZma06cj00cAgAALOwCAAX51AA==
Date: Tue, 10 Sep 2019 21:24:03 +0000
Message-ID: <d5706aa9361540d70687c419894810cfe1b612b3.camel@intel.com>
References: <20190906054255.GC3458@zhen-hp.sh.intel.com>
 <20190909172416.GB20172@intel.com>
 <f631f702240c0ecb99e94171f26e951f4e76911a.camel@intel.com>
 <20190909223510.GA19671@intel.com>
In-Reply-To: <20190909223510.GA19671@intel.com>
Accept-Language: de-CH, en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.32.4 (3.32.4-1.fc30) 
x-originating-ip: [10.252.37.62]
Content-ID: <B95E3BC8838A6D45B05D7AA5B20E4D6A@intel.com>
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>, "Yuan,
 Hang" <hang.yuan@intel.com>, "Lv, Zhiyuan" <zhiyuan.lv@intel.com>,
 "airlied@redhat.com" <airlied@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Wang, Zhi A" <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDE5LTA5LTA5IGF0IDE1OjM1IC0wNzAwLCBSb2RyaWdvIFZpdmkgd3JvdGU6DQo+
IE9uIE1vbiwgU2VwIDA5LCAyMDE5IGF0IDAyOjU0OjU5UE0gLTA3MDAsIFZldHRlciwgRGFuaWVs
IHdyb3RlOg0KPiA+IE9uIE1vbiwgMjAxOS0wOS0wOSBhdCAxMDoyNCAtMDcwMCwgUm9kcmlnbyBW
aXZpIHdyb3RlOg0KPiA+ID4gSGkgZ3V5cywNCj4gPiA+IA0KPiA+ID4gT24gRnJpLCBTZXAgMDYs
IDIwMTkgYXQgMDE6NDI6NTVQTSArMDgwMCwgWmhlbnl1IFdhbmcgd3JvdGU6DQo+ID4gPiA+IEhp
LA0KPiA+ID4gPiANCj4gPiA+ID4gSGVyZSdzIGd2dC1uZXh0LWZpeGVzIHdpdGggdHdvIHJlY2Vu
dCBmaXhlcywgb25lIGZvciByZWNlbnQNCj4gPiA+ID4gZ3Vlc3QgaGFuZyByZWdyZXNzaW9uIGFu
ZCBhbm90aGVyIGZvciBndWVzdCByZXNldCBmaXguDQo+ID4gPiA+IA0KPiA+ID4gPiBUaGFua3Mu
DQo+ID4gPiA+IC0tDQo+ID4gPiA+IFRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQN
Cj4gPiA+ID4gYzM2YmViYTZiMjk2YjNjMDVhMGYyOTc1M2IwNDc3NWU1YWUyMzg4NjoNCj4gPiA+
ID4gDQo+ID4gPiA+ICAgZHJtL2k5MTU6IFNlYWwgcmFjZXMgYmV0d2VlbiBhc3luYyBHUFUgY2Fu
Y2VsbGF0aW9uLA0KPiA+ID4gPiByZXRpcmVtZW50DQo+ID4gPiA+IGFuZCBzaWduYWxpbmcgKDIw
MTktMDUtMTMgMTM6NTM6MzUgKzAzMDApDQo+ID4gPiA+IA0KPiA+ID4gPiBhcmUgYXZhaWxhYmxl
IGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoNCj4gPiA+ID4gDQo+ID4gPiA+ICAgaHR0cHM6Ly9n
aXRodWIuY29tL2ludGVsL2d2dC1saW51eC5naXQgdGFncy9ndnQtbmV4dC1maXhlcy0NCj4gPiA+
ID4gMjAxOS0NCj4gPiA+ID4gMDktMDYNCj4gPiA+ID4gDQo+ID4gPiA+IGZvciB5b3UgdG8gZmV0
Y2ggY2hhbmdlcyB1cCB0bw0KPiA+ID4gPiA0YTUzMjI1NjBhYTIzNWVmYTg0YzBhYTM0YzAwZTU3
NDlhMDc5MmZkOg0KPiA+ID4gPiANCj4gPiA+ID4gICBkcm0vaTkxNS9ndnQ6IHVwZGF0ZSBSSU5H
X1NUQVJUIHJlZyBvZiB2R1BVIHdoZW4gdGhlIGNvbnRleHQNCj4gPiA+ID4gaXMNCj4gPiA+ID4g
c3VibWl0dGVkIHRvIGk5MTUgKDIwMTktMDktMDYgMTM6Mzk6MDkgKzA4MDApDQo+ID4gPiANCj4g
PiA+ICQgZGltIHB1bGwtcmVxdWVzdC1uZXh0LWZpeGVzDQo+ID4gPiBVc2luZyBkcm0vZHJtLW5l
eHQgYXMgdGhlIHVwc3RyZWFtDQo+ID4gPiBkaW06IDRhNTMyMjU2MGFhMiAoImRybS9pOTE1L2d2
dDogdXBkYXRlIFJJTkdfU1RBUlQgcmVnIG9mIHZHUFUNCj4gPiA+IHdoZW4NCj4gPiA+IHRoZSBj
b250ZXh0IGlzIHN1Ym1pdHRlZCB0byBpOTE1Iik6IExpbmsgdGFnIG1pc3NpbmcuDQo+ID4gPiBk
aW06IDBhMzI0MmJkYjQ3NyAoImRybS9pOTE1L2d2dDogdXBkYXRlIHZncHUgd29ya2xvYWQgaGVh
ZA0KPiA+ID4gcG9pbnRlcg0KPiA+ID4gY29ycmVjdGx5Iik6IExpbmsgdGFnIG1pc3NpbmcuDQo+
ID4gPiBkaW06IEVSUk9SOiBpc3N1ZXMgaW4gY29tbWl0cyBkZXRlY3RlZCwgYWJvcnRpbmcNCj4g
PiA+IA0KPiA+ID4gSSB3b25kZXIgaG93IEkgc2hvdWxkIHByb2NlZWQgaGVyZS4gSW4gdGhlIHBh
c3QgSSB3YXMgYWx3YXlzDQo+ID4gPiBieXBhc3NzaW5nIGRpbSwNCj4gPiA+IGJ1dCBub3cgdGhh
dCBkcm0gbWFpbnRhaW5lcnMgYWxzbyB1c2UgZGltIEknbSBzdXJlIHRoaXMgd2lsbCBibG93DQo+
ID4gPiB1cA0KPiA+ID4gdGhlcmUgYW55d2F5cy4NCj4gPiA+IA0KPiA+ID4gQnV0IGd2dCBwYXRj
aGVzIGFyZSBub3QgdHJhY2tlZCBvbiBvdXIgQ0kgaW5kaXZpZHVhbGx5IGhlbmNlIHRoZXkNCj4g
PiA+IGRvbid0DQo+ID4gPiBoYXZlIExpbmtzLg0KPiA+ID4gDQo+ID4gPiBKYW5pLCBKb29uYXMs
IGhvdyBhcmUgeW91IGd1eXMgaGFuZGxpbmcgdGhpcz8NCj4gPiA+IA0KPiA+ID4gRGFuaWVsLCBE
YXZlLCBpZGVhcz8NCj4gPiANCj4gPiBkaW0gZG9lc24ndCByZXF1aXJlIExpbms6IHRhZ3MgeWV0
IGZvciBwdWxsIHJlcXVlc3RzIChiZWNhdXNlIG1vc3QNCj4gPiBkcm0NCj4gPiB0cmVlcyBhcmVu
J3QgbWFuYWdlZCBieSBkaW0gYW5kIHNvIGxhY2sgdGhlbSkuDQo+IA0KPiBJJ20gY29uZnVzZWQg
bm93Lg0KPiANCj4gZnVuY3Rpb24gZGltX3B1bGxfcmVxdWVzdA0KPiBjYWxscw0KPiBjaGVja3Bh
dGNoX2NvbW1pdF9wdXNoX3JhbmdlIDEgIiR1cHN0cmVhbS4uJGJyYW5jaCINCj4gKGV4Y2VwdCBm
b3IgZHJtLWludGVsLW5leHQpDQo+IA0KPiBhbmQgY2hlY2twYXRjaF9jb21taXRfcHVzaCBjaGVj
a3MgZm9yIHRoZSBsaW5rLg0KPiANCj4gU28gaWYgeW91IGFsc28gdXNlIGRpbSBmb3IgeW91ciBw
dWxsIHJlcXVlc3QgSSdtIHdvbmRlcmluZyBob3cgeW91DQo+IGFyZSBub3QgZ2V0dGluZyB0aGF0
Li4uLg0KDQpPbiB0aGUgcHVzaCBzaWRlIHdlIHNldCBkaW1fbWFuYWdlZF9icmFuY2ggKG9yIHdo
YXRldmVyIGl0J3MgY2FsbGVkKSB0bw0KMSwgb24gdGhlIHB1bGwgc2lkZSBpdCdzIHNpZGUgMC4g
VGhhdCBkaXNhYmxlcyBjZXJ0YWluIGNoZWNrcyBsaWtlIHRoZQ0KTGluazogdGFnIGNoZWNrLiBB
bHNvIHB1c2ggc2hvdWxkIG9ubHkgY2hlY2sgY29tbWl0cyBhdXRob3JlZCBieSB5b3UsDQpzbyB0
aGlzIGlzIG9ubHkgcmVhbGx5IGFuIGlzc3VlIHdpdGggY2hlcnJ5LXBpY2tzLg0KDQpUaGF0IHdh
cyBhdCBsZWFzdCB0aGUgaWRlYSBiZWhpbmQgYWxsIHRoaXMsIG1heWJlIGl0IHN0b3BwZWQgd29y
a2luZy4NCi1EYW5pZWwNCg0KPiANCj4gSW4gdGhlIHBhc3Qgd2hlbmV2ZXIgSSBoYWQgdGhpcyBw
cm9ibGVtIG9uIGRpbmYgSSBjb21tZW50ZWQgb3V0IHRoZQ0KPiBsaW5rIGNoZWNrIGJ1dCBlbmQg
dXAgbmV2ZXIgY29taW5nIGJhY2sgdG8gc29sdmUgdGhlIHByb2JsZW0NCj4gcHJvcGVybHkuDQo+
IEkganVzdCB3b25kZXJpbmcgdGhhdCBub3cgdGhhdCBkaW0gaXMgaW4gdXNlIG9uIGRybSBsZXZl
bCBpZiBJIGJ5cGFzcw0KPiBoZXJlIGl0IGJlY29tZXMgYSBwcm9ibGVtIGZvciB5b3UuDQo+IA0K
PiB0aG91Z2h0cz8NCj4gDQo+ID4gVW50aWwgd2UgY2hhbmdlIHRoYXQsDQo+ID4gd2l0aCBzb21l
IGRvYyBwYXRjaGVzIGFuZCBwcm9wZXIgYmlrZXNoZWQgb24gZHJpLWRldmVsIEkgdGhpbmsgaXQn
cw0KPiA+IGZpbmUgaWYgZ3Z0IGlzIG1pc3NpbmcgdGhlbS4gQXQgbGVhc3QgZnJvbSBhIGRybS5n
aXQgcG92Lg0KPiA+IA0KPiA+IFdoYXQgeW91IGd1eXMgd2FudCB0byBkbyBmb3IgZHJtLWludGVs
LmdpdCBpcyBlbnRpcmVseSB1cCB0byB5b3UuDQo+ID4gLURhbmllbA0KPiA+ID4gVGhhbmtzLA0K
PiA+ID4gUm9kcmlnby4NCj4gPiA+IA0KPiA+ID4gPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gPiA+IC0tLQ0KPiA+ID4g
PiBndnQtbmV4dC1maXhlcy0yMDE5LTA5LTA2DQo+ID4gPiA+IA0KPiA+ID4gPiAtIEZpeCBndWVz
dCBjb250ZXh0IGhlYWQgcG9pbnRlciB1cGRhdGUgZm9yIGhhbmcgKFhpYW9saW4pDQo+ID4gPiA+
IC0gRml4IGd1ZXN0IGNvbnRleHQgcmluZyBzdGF0ZSBmb3IgcmVzZXQgKFdlaW5hbikNCj4gPiA+
ID4gDQo+ID4gPiA+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0NCj4gPiA+ID4gLS0tDQo+ID4gPiA+IFdlaW5hbiBMaSAoMSk6DQo+
ID4gPiA+ICAgICAgIGRybS9pOTE1L2d2dDogdXBkYXRlIFJJTkdfU1RBUlQgcmVnIG9mIHZHUFUg
d2hlbiB0aGUNCj4gPiA+ID4gY29udGV4dA0KPiA+ID4gPiBpcyBzdWJtaXR0ZWQgdG8gaTkxNQ0K
PiA+ID4gPiANCj4gPiA+ID4gWGlhb2xpbiBaaGFuZyAoMSk6DQo+ID4gPiA+ICAgICAgIGRybS9p
OTE1L2d2dDogdXBkYXRlIHZncHUgd29ya2xvYWQgaGVhZCBwb2ludGVyIGNvcnJlY3RseQ0KPiA+
ID4gPiANCj4gPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9zY2hlZHVsZXIuYyB8IDQ1
DQo+ID4gPiA+ICsrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLQ0KPiA+ID4gPiAg
MSBmaWxlIGNoYW5nZWQsIDMyIGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQ0KPiA+ID4g
PiANCj4gPiA+ID4gDQo+ID4gPiA+IC0tIA0KPiA+ID4gPiBPcGVuIFNvdXJjZSBUZWNobm9sb2d5
IENlbnRlciwgSW50ZWwgbHRkLg0KPiA+ID4gPiANCj4gPiA+ID4gJGdwZyAtLWtleXNlcnZlciB3
d3drZXlzLnBncC5uZXQgLS1yZWN2LWtleXMgNEQ3ODE4MjcNCkludGVsIFNlbWljb25kdWN0b3Ig
QUcKUmVnaXN0ZXJlZCBOby4gMDIwLjMwLjkxMy43ODYtNwpSZWdpc3RlcmVkIE9mZmljZTogQmFk
ZW5lcnN0cmFzc2UgNTQ5LCA4MDQ4IFp1cmljaCwgU3dpdHplcmxhbmQKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxp
c3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
