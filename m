Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5C057E63
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 27 Jun 2019 10:40:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C37F96E836;
	Thu, 27 Jun 2019 08:40:07 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D105B6E836
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 27 Jun 2019 08:40:06 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Jun 2019 01:40:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,423,1557212400"; d="scan'208";a="245743492"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by orsmga001.jf.intel.com with ESMTP; 27 Jun 2019 01:40:05 -0700
Received: from fmsmsx111.amr.corp.intel.com (10.18.116.5) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 27 Jun 2019 01:40:05 -0700
Received: from shsmsx152.ccr.corp.intel.com (10.239.6.52) by
 fmsmsx111.amr.corp.intel.com (10.18.116.5) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 27 Jun 2019 01:40:05 -0700
Received: from shsmsx101.ccr.corp.intel.com ([169.254.1.87]) by
 SHSMSX152.ccr.corp.intel.com ([169.254.6.225]) with mapi id 14.03.0439.000;
 Thu, 27 Jun 2019 16:40:03 +0800
From: "Zhang, Tina" <tina.zhang@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: RE: [RFC PATCH v3 1/4] vfio: Define device specific irq type
 capability
Thread-Topic: [RFC PATCH v3 1/4] vfio: Define device specific irq type
 capability
Thread-Index: AQHVLJqY892xL/jYXUCHg0oNNo51Q6auXGaAgADSDfA=
Date: Thu, 27 Jun 2019 08:40:03 +0000
Message-ID: <237F54289DF84E4997F34151298ABEBC876835C6@SHSMSX101.ccr.corp.intel.com>
References: <20190627033802.1663-1-tina.zhang@intel.com>
 <20190627033802.1663-2-tina.zhang@intel.com>
 <20190626220739.578c518b@x1.home>
In-Reply-To: <20190626220739.578c518b@x1.home>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiOTAyNTlkNDctMGNhZC00Y2Q4LWI3OGUtODYyODM4MzBkZDkyIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiQThXNStVZE1cL2ViRzJFRXVRa0pwbVZSVjdXY2Z5bTQ3UEhlUmVPdUU1MVczWmlCTEVRZmJ1dnpEcmh0bFZvdEgifQ==
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
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>, "Yuan,
 Hang" <hang.yuan@intel.com>, "Lv, Zhiyuan" <zhiyuan.lv@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Wang, Zhi A" <zhi.a.wang@intel.com>, "kraxel@redhat.com" <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Cgo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gRnJvbTogQWxleCBXaWxsaWFtc29uIFtt
YWlsdG86YWxleC53aWxsaWFtc29uQHJlZGhhdC5jb21dCj4gU2VudDogVGh1cnNkYXksIEp1bmUg
MjcsIDIwMTkgMTI6MDggUE0KPiBUbzogWmhhbmcsIFRpbmEgPHRpbmEuemhhbmdAaW50ZWwuY29t
Pgo+IENjOiBpbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsga3ZtQHZnZXIua2Vy
bmVsLm9yZzsgbGludXgtCj4ga2VybmVsQHZnZXIua2VybmVsLm9yZzsga3JheGVsQHJlZGhhdC5j
b207IHpoZW55dXdAbGludXguaW50ZWwuY29tOyBMdiwKPiBaaGl5dWFuIDx6aGl5dWFuLmx2QGlu
dGVsLmNvbT47IFdhbmcsIFpoaSBBIDx6aGkuYS53YW5nQGludGVsLmNvbT47IFRpYW4sCj4gS2V2
aW4gPGtldmluLnRpYW5AaW50ZWwuY29tPjsgWXVhbiwgSGFuZyA8aGFuZy55dWFuQGludGVsLmNv
bT4KPiBTdWJqZWN0OiBSZTogW1JGQyBQQVRDSCB2MyAxLzRdIHZmaW86IERlZmluZSBkZXZpY2Ug
c3BlY2lmaWMgaXJxIHR5cGUKPiBjYXBhYmlsaXR5Cj4gCj4gT24gVGh1LCAyNyBKdW4gMjAxOSAx
MTozNzo1OSArMDgwMAo+IFRpbmEgWmhhbmcgPHRpbmEuemhhbmdAaW50ZWwuY29tPiB3cm90ZToK
PiAKPiA+IENhcCB0aGUgbnVtYmVyIG9mIGlycXMgd2l0aCBmaXhlZCBpbmRleGVzIGFuZCB1c2Ug
Y2FwYWJpbGl0eSBjaGFpbnMgdG8KPiA+IGNoYWluIGRldmljZSBzcGVjaWZpYyBpcnFzLgo+ID4K
PiA+IFNpZ25lZC1vZmYtYnk6IFRpbmEgWmhhbmcgPHRpbmEuemhhbmdAaW50ZWwuY29tPgo+ID4g
LS0tCj4gPiAgaW5jbHVkZS91YXBpL2xpbnV4L3ZmaW8uaCB8IDE5ICsrKysrKysrKysrKysrKysr
Ky0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+
ID4KPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvbGludXgvdmZpby5oIGIvaW5jbHVkZS91
YXBpL2xpbnV4L3ZmaW8uaAo+ID4gaW5kZXggMDJiYjdhZDZlOTg2Li42MDA3ODRhY2M0YWMgMTAw
NjQ0Cj4gPiAtLS0gYS9pbmNsdWRlL3VhcGkvbGludXgvdmZpby5oCj4gPiArKysgYi9pbmNsdWRl
L3VhcGkvbGludXgvdmZpby5oCj4gPiBAQCAtNDQ0LDExICs0NDQsMjcgQEAgc3RydWN0IHZmaW9f
aXJxX2luZm8gewo+ID4gICNkZWZpbmUgVkZJT19JUlFfSU5GT19NQVNLQUJMRQkJKDEgPDwgMSkK
PiA+ICAjZGVmaW5lIFZGSU9fSVJRX0lORk9fQVVUT01BU0tFRAkoMSA8PCAyKQo+ID4gICNkZWZp
bmUgVkZJT19JUlFfSU5GT19OT1JFU0laRQkJKDEgPDwgMykKPiA+ICsjZGVmaW5lIFZGSU9fSVJR
X0lORk9fRkxBR19DQVBTCQkoMSA8PCA0KSAvKiBJbmZvCj4gc3VwcG9ydHMgY2FwcyAqLwo+ID4g
IAlfX3UzMglpbmRleDsJCS8qIElSUSBpbmRleCAqLwo+ID4gKwlfX3UzMgljYXBfb2Zmc2V0Owkv
KiBPZmZzZXQgd2l0aGluIGluZm8gc3RydWN0IG9mIGZpcnN0IGNhcCAqLwo+ID4gIAlfX3UzMglj
b3VudDsJCS8qIE51bWJlciBvZiBJUlFzIHdpdGhpbiB0aGlzIGluZGV4ICovCj4gPiAgfTsKPiAK
PiAKPiBUaGlzIGNhbm5vdCBiZSBpbnNlcnRlZCBpbnRvIHRoZSBtaWRkbGUgb2YgdGhlIHN0cnVj
dHVyZSwgaXQgYnJlYWtzCj4gY29tcGF0aWJpbGl0eSB3aXRoIGFsbCBleGlzdGluZyB1c2Vyc3Bh
Y2UgYmluYXJpZXMuICBJIG11c3QgYmUgYWRkZWQgdG8gdGhlIGVuZAo+IG9mIHRoZSBzdHJ1Y3R1
cmUuCkluZGVlZC4gVGhhbmtzLgoKQlIsClRpbmEKPiAKPiA+ICAjZGVmaW5lIFZGSU9fREVWSUNF
X0dFVF9JUlFfSU5GTwlfSU8oVkZJT19UWVBFLCBWRklPX0JBU0UgKwo+IDkpCj4gPgo+ID4gKy8q
Cj4gPiArICogVGhlIGlycSB0eXBlIGNhcGFiaWxpdHkgYWxsb3dzIGlycXMgdW5pcXVlIHRvIGEg
c3BlY2lmaWMgZGV2aWNlIG9yCj4gPiArICogY2xhc3Mgb2YgZGV2aWNlcyB0byBiZSBleHBvc2Vk
Lgo+ID4gKyAqCj4gPiArICogVGhlIHN0cnVjdHVyZXMgYmVsb3cgZGVmaW5lIHZlcnNpb24gMSBv
ZiB0aGlzIGNhcGFiaWxpdHkuCj4gPiArICovCj4gPiArI2RlZmluZSBWRklPX0lSUV9JTkZPX0NB
UF9UWVBFICAgICAgMwo+ID4gKwo+ID4gK3N0cnVjdCB2ZmlvX2lycV9pbmZvX2NhcF90eXBlIHsK
PiA+ICsJc3RydWN0IHZmaW9faW5mb19jYXBfaGVhZGVyIGhlYWRlcjsKPiA+ICsJX191MzIgdHlw
ZTsgICAgIC8qIGdsb2JhbCBwZXIgYnVzIGRyaXZlciAqLwo+ID4gKwlfX3UzMiBzdWJ0eXBlOyAg
LyogdHlwZSBzcGVjaWZpYyAqLwo+ID4gK307Cj4gPiArCj4gPiAgLyoqCj4gPiAgICogVkZJT19E
RVZJQ0VfU0VUX0lSUVMgLSBfSU9XKFZGSU9fVFlQRSwgVkZJT19CQVNFICsgMTAsIHN0cnVjdAo+
IHZmaW9faXJxX3NldCkKPiA+ICAgKgo+ID4gQEAgLTU1MCw3ICs1NjYsOCBAQCBlbnVtIHsKPiA+
ICAJVkZJT19QQ0lfTVNJWF9JUlFfSU5ERVgsCj4gPiAgCVZGSU9fUENJX0VSUl9JUlFfSU5ERVgs
Cj4gPiAgCVZGSU9fUENJX1JFUV9JUlFfSU5ERVgsCj4gPiAtCVZGSU9fUENJX05VTV9JUlFTCj4g
PiArCVZGSU9fUENJX05VTV9JUlFTID0gNQkvKiBGaXhlZCB1c2VyIEFCSSwgSVJRIGluZGV4ZXMg
Pj01Cj4gdXNlICAgKi8KPiA+ICsJCQkJLyogZGV2aWNlIHNwZWNpZmljIGNhcCB0byBkZWZpbmUg
Y29udGVudCAqLwo+ID4gIH07Cj4gPgo+ID4gIC8qCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1n
dnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
