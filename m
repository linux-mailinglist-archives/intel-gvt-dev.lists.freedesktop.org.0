Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2468F3598B
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  5 Jun 2019 11:18:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3BA689711;
	Wed,  5 Jun 2019 09:18:56 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD96B89711
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  5 Jun 2019 09:18:55 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Jun 2019 02:18:55 -0700
X-ExtLoop1: 1
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by fmsmga008.fm.intel.com with ESMTP; 05 Jun 2019 02:18:55 -0700
Received: from fmsmsx155.amr.corp.intel.com (10.18.116.71) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Wed, 5 Jun 2019 02:18:54 -0700
Received: from shsmsx102.ccr.corp.intel.com (10.239.4.154) by
 FMSMSX155.amr.corp.intel.com (10.18.116.71) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Wed, 5 Jun 2019 02:18:54 -0700
Received: from shsmsx101.ccr.corp.intel.com ([169.254.1.10]) by
 shsmsx102.ccr.corp.intel.com ([169.254.2.134]) with mapi id 14.03.0415.000;
 Wed, 5 Jun 2019 17:18:52 +0800
From: "Zhang, Tina" <tina.zhang@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: RE: [RFC PATCH v2 1/3] vfio: Use capability chains to handle device
 specific irq
Thread-Topic: [RFC PATCH v2 1/3] vfio: Use capability chains to handle
 device specific irq
Thread-Index: AQHVGrx1sbtkzcdtCkGKiqXjrLufOqaL7AoAgADZGxA=
Date: Wed, 5 Jun 2019 09:18:52 +0000
Message-ID: <237F54289DF84E4997F34151298ABEBC87646B5C@SHSMSX101.ccr.corp.intel.com>
References: <20190604095534.10337-1-tina.zhang@intel.com>
 <20190604095534.10337-2-tina.zhang@intel.com>
 <20190605040446.GW9684@zhen-hp.sh.intel.com>
In-Reply-To: <20190605040446.GW9684@zhen-hp.sh.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNGRmZTQ5OGItMTlmNi00ZDk5LTgxMzMtYWE4NDdhYzYxMTc2IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoidmRQNDY1WE5uandSRmZ5SFI3RTlpUHFrQlVsdG5JN2NjY0c0OUJHMmlNTjhhNGN4aXV4bnBBNkMrdUp3VGwxRiJ9
x-ctpclassification: CTP_NT
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
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Yuan,
 Hang" <hang.yuan@intel.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>, "Lv,
 Zhiyuan" <zhiyuan.lv@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Wang, Zhi A" <zhi.a.wang@intel.com>, "kraxel@redhat.com" <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Cgo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gRnJvbTogWmhlbnl1IFdhbmcgW21haWx0
bzp6aGVueXV3QGxpbnV4LmludGVsLmNvbV0KPiBTZW50OiBXZWRuZXNkYXksIEp1bmUgNSwgMjAx
OSAxMjowNSBQTQo+IFRvOiBaaGFuZywgVGluYSA8dGluYS56aGFuZ0BpbnRlbC5jb20+Cj4gQ2M6
IGludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBrdm1Admdlci5rZXJuZWwub3Jn
OyBsaW51eC0KPiBrZXJuZWxAdmdlci5rZXJuZWwub3JnOyBrcmF4ZWxAcmVkaGF0LmNvbTsgemhl
bnl1d0BsaW51eC5pbnRlbC5jb207IEx2LAo+IFpoaXl1YW4gPHpoaXl1YW4ubHZAaW50ZWwuY29t
PjsgV2FuZywgWmhpIEEgPHpoaS5hLndhbmdAaW50ZWwuY29tPjsgVGlhbiwKPiBLZXZpbiA8a2V2
aW4udGlhbkBpbnRlbC5jb20+OyBZdWFuLCBIYW5nIDxoYW5nLnl1YW5AaW50ZWwuY29tPjsKPiBh
bGV4LndpbGxpYW1zb25AcmVkaGF0LmNvbQo+IFN1YmplY3Q6IFJlOiBbUkZDIFBBVENIIHYyIDEv
M10gdmZpbzogVXNlIGNhcGFiaWxpdHkgY2hhaW5zIHRvIGhhbmRsZSBkZXZpY2UKPiBzcGVjaWZp
YyBpcnEKPiAKPiBPbiAyMDE5LjA2LjA0IDE3OjU1OjMyICswODAwLCBUaW5hIFpoYW5nIHdyb3Rl
Ogo+ID4gQ2FwcyB0aGUgbnVtYmVyIG9mIGlycXMgd2l0aCBmaXhlZCBpbmRleGVzIGFuZCB1c2Vz
IGNhcGFiaWxpdHkgY2hhaW5zCj4gPiB0byBjaGFpbiBkZXZpY2Ugc3BlY2lmaWMgaXJxcy4KPiA+
Cj4gPiBWRklPIHZHUFUgbGV2ZXJhZ2VzIHRoaXMgbWVjaGFuaXNtIHRvIHRyaWdnZXIgcHJpbWFy
eSBwbGFuZSBhbmQgY3Vyc29yCj4gPiBwbGFuZSBwYWdlIGZsaXAgZXZlbnQgdG8gdGhlIHVzZXIg
c3BhY2UuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogVGluYSBaaGFuZyA8dGluYS56aGFuZ0BpbnRl
bC5jb20+Cj4gPiAtLS0KPiA+ICBpbmNsdWRlL3VhcGkvbGludXgvdmZpby5oIHwgMjMgKysrKysr
KysrKysrKysrKysrKysrKy0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvbGludXgvdmZp
by5oIGIvaW5jbHVkZS91YXBpL2xpbnV4L3ZmaW8uaAo+ID4gaW5kZXggMDJiYjdhZDZlOTg2Li45
YjVlMjU5MzdjN2QgMTAwNjQ0Cj4gPiAtLS0gYS9pbmNsdWRlL3VhcGkvbGludXgvdmZpby5oCj4g
PiArKysgYi9pbmNsdWRlL3VhcGkvbGludXgvdmZpby5oCj4gPiBAQCAtNDQ0LDExICs0NDQsMzEg
QEAgc3RydWN0IHZmaW9faXJxX2luZm8gewo+ID4gICNkZWZpbmUgVkZJT19JUlFfSU5GT19NQVNL
QUJMRQkJKDEgPDwgMSkKPiA+ICAjZGVmaW5lIFZGSU9fSVJRX0lORk9fQVVUT01BU0tFRAkoMSA8
PCAyKQo+ID4gICNkZWZpbmUgVkZJT19JUlFfSU5GT19OT1JFU0laRQkJKDEgPDwgMykKPiA+ICsj
ZGVmaW5lIFZGSU9fSVJRX0lORk9fRkxBR19DQVBTCQkoMSA8PCA0KSAvKiBJbmZvCj4gc3VwcG9y
dHMgY2FwcyAqLwo+ID4gIAlfX3UzMglpbmRleDsJCS8qIElSUSBpbmRleCAqLwo+ID4gKwlfX3Uz
MgljYXBfb2Zmc2V0OwkvKiBPZmZzZXQgd2l0aGluIGluZm8gc3RydWN0IG9mIGZpcnN0IGNhcCAq
Lwo+ID4gIAlfX3UzMgljb3VudDsJCS8qIE51bWJlciBvZiBJUlFzIHdpdGhpbiB0aGlzIGluZGV4
ICovCj4gCj4gVGhpcyB3b3VsZCBicmVhayBBQkkgZm9yIGdldCBpcnEgaW5mby4gSSB0aGluayBp
cnEgY2FwIGNoYWluIGNhbiBqdXN0IGZvbGxvdwo+IHZmaW9faXJxX2luZm8uCj4gCj4gPiAgfTsK
PiA+ICAjZGVmaW5lIFZGSU9fREVWSUNFX0dFVF9JUlFfSU5GTwlfSU8oVkZJT19UWVBFLCBWRklP
X0JBU0UgKwo+IDkpCj4gPgo+ID4gKy8qCj4gPiArICogVGhlIGlycSB0eXBlIGNhcGFiaWxpdHkg
YWxsb3dzIGlycXMgdW5pcXVlIHRvIGEgc3BlY2lmaWMgZGV2aWNlIG9yCj4gPiArICogY2xhc3Mg
b2YgZGV2aWNlcyB0byBiZSBleHBvc2VkLgo+ID4gKyAqCj4gPiArICogVGhlIHN0cnVjdHVyZXMg
YmVsb3cgZGVmaW5lIHZlcnNpb24gMSBvZiB0aGlzIGNhcGFiaWxpdHkuCj4gPiArICovCj4gPiAr
I2RlZmluZSBWRklPX0lSUV9JTkZPX0NBUF9UWVBFICAgICAgMwo+ID4gKwo+ID4gK3N0cnVjdCB2
ZmlvX2lycV9pbmZvX2NhcF90eXBlIHsKPiA+ICsJc3RydWN0IHZmaW9faW5mb19jYXBfaGVhZGVy
IGhlYWRlcjsKPiA+ICsJX191MzIgdHlwZTsgICAgIC8qIGdsb2JhbCBwZXIgYnVzIGRyaXZlciAq
Lwo+ID4gKwlfX3UzMiBzdWJ0eXBlOyAgLyogdHlwZSBzcGVjaWZpYyAqLwo+ID4gK307Cj4gPiAr
Cj4gPiArI2RlZmluZSBWRklPX0lSUV9UWVBFX0dGWAkJCQkoMSkKPiA+ICsjZGVmaW5lIFZGSU9f
SVJRX1NVQlRZUEVfR0ZYX1BSSV9QTEFORV9GTElQCQkoMSkKPiA+ICsjZGVmaW5lIFZGSU9fSVJR
X1NVQlRZUEVfR0ZYX0NVUl9QTEFORV9GTElQCQkoMikKPiA+ICsKPiAKPiBSZWFsbHkgbmVlZCB0
byBzcGxpdCBmb3IgZGlmZmVyZW50IHBsYW5lcz8gSSdkIGxpa2UgYQo+IFZGSU9fSVJRX1NVQlRZ
UEVfR0ZYX0RJU1BMQVlfRVZFTlQKPiBzbyB1c2VyIHNwYWNlIGNhbiBwcm9iZSBjaGFuZ2UgZm9y
IGFsbC4KVXNlciBzcGFjZSBjYW4gY2hvb3NlIHRvIHVzZXIgZGlmZmVyZW50IGhhbmRsZXJzIGFj
Y29yZGluZyB0byB0aGUgc3BlY2lmaWMgZXZlbnQuIEZvciBleGFtcGxlLCB1c2VyIHNwYWNlIG1p
Z2h0IG5vdCB3YW50IHRvIGhhbmRsZSBldmVyeSBjdXJzb3IgZXZlbnQgZHVlIHRvIHBlcmZvcm1h
bmNlIGNvbnNpZGVyYXRpb24uIEJlc2lkZXMsIGl0IGNhbiByZWR1Y2UgdGhlIHByb2JlIHRpbWVz
LCBhcyB3ZSBkb24ndCBuZWVkIHRvIHByb2JlIHR3aWNlIHRvIG1ha2Ugc3VyZSBpZiBib3RoIGN1
cnNvciBwbGFuZSBhbmQgcHJpbWFyeSBwbGFuZSBoYXZlIGJlZW4gdXBkYXRlZC4KVGhhbmtzLgoK
QlIsClRpbmEKCj4gCj4gPiAgLyoqCj4gPiAgICogVkZJT19ERVZJQ0VfU0VUX0lSUVMgLSBfSU9X
KFZGSU9fVFlQRSwgVkZJT19CQVNFICsgMTAsIHN0cnVjdAo+IHZmaW9faXJxX3NldCkKPiA+ICAg
Kgo+ID4gQEAgLTU1MCw3ICs1NzAsOCBAQCBlbnVtIHsKPiA+ICAJVkZJT19QQ0lfTVNJWF9JUlFf
SU5ERVgsCj4gPiAgCVZGSU9fUENJX0VSUl9JUlFfSU5ERVgsCj4gPiAgCVZGSU9fUENJX1JFUV9J
UlFfSU5ERVgsCj4gPiAtCVZGSU9fUENJX05VTV9JUlFTCj4gPiArCVZGSU9fUENJX05VTV9JUlFT
ID0gNQkvKiBGaXhlZCB1c2VyIEFCSSwgSVJRIGluZGV4ZXMgPj01Cj4gdXNlICAgKi8KPiA+ICsJ
CQkJLyogZGV2aWNlIHNwZWNpZmljIGNhcCB0byBkZWZpbmUgY29udGVudCAqLwo+ID4gIH07Cj4g
Pgo+ID4gIC8qCj4gPiAtLQo+ID4gMi4xNy4xCj4gPgo+IAo+IC0tCj4gT3BlbiBTb3VyY2UgVGVj
aG5vbG9neSBDZW50ZXIsIEludGVsIGx0ZC4KPiAKPiAkZ3BnIC0ta2V5c2VydmVyIHd3d2tleXMu
cGdwLm5ldCAtLXJlY3Yta2V5cyA0RDc4MTgyNwpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQt
ZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
