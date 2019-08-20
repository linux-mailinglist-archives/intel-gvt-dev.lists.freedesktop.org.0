Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DFA952E2
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 20 Aug 2019 02:57:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 796BE6E4A0;
	Tue, 20 Aug 2019 00:57:17 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 953096E4A0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 20 Aug 2019 00:57:15 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Aug 2019 17:57:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,407,1559545200"; d="scan'208";a="189698451"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by orsmga002.jf.intel.com with ESMTP; 19 Aug 2019 17:57:01 -0700
Received: from fmsmsx102.amr.corp.intel.com (10.18.124.200) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 19 Aug 2019 17:57:00 -0700
Received: from shsmsx154.ccr.corp.intel.com (10.239.6.54) by
 FMSMSX102.amr.corp.intel.com (10.18.124.200) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 19 Aug 2019 17:57:00 -0700
Received: from shsmsx101.ccr.corp.intel.com ([169.254.1.80]) by
 SHSMSX154.ccr.corp.intel.com ([169.254.7.249]) with mapi id 14.03.0439.000;
 Tue, 20 Aug 2019 08:56:58 +0800
From: "Zhang, Tina" <tina.zhang@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: RE: [PATCH v5 1/6] vfio: Define device specific irq type capability
Thread-Topic: [PATCH v5 1/6] vfio: Define device specific irq type capability
Thread-Index: AQHVU9tUIz4Q7mJ8IEmdvE8aJrot1ab9uvyAgAV/ddA=
Date: Tue, 20 Aug 2019 00:56:58 +0000
Message-ID: <237F54289DF84E4997F34151298ABEBC876F9935@SHSMSX101.ccr.corp.intel.com>
References: <20190816023528.30210-1-tina.zhang@intel.com>
 <20190816023528.30210-2-tina.zhang@intel.com>
 <20190816145141.6e56c6cb@x1.home>
In-Reply-To: <20190816145141.6e56c6cb@x1.home>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYWNmMmMzZWItMDVkNC00OTJiLTgxZTAtZDNjYjU4MDgwYTI0IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiUW91RGRwMHR6Y1lXeGtJUEE0M2szUDNxVWllUEJOTmI4Qkx1djlqSFkzejdHcGk2bFV0QmlnOXFsTWdFZDFrZSJ9
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
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Yuan,
 Hang" <hang.yuan@intel.com>, Eric Auger <eric.auger@redhat.com>, "Lv,
 Zhiyuan" <zhiyuan.lv@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "kraxel@redhat.com" <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Cgo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gRnJvbTogQWxleCBXaWxsaWFtc29uIFtt
YWlsdG86YWxleC53aWxsaWFtc29uQHJlZGhhdC5jb21dCj4gU2VudDogU2F0dXJkYXksIEF1Z3Vz
dCAxNywgMjAxOSA0OjUyIEFNCj4gVG86IFpoYW5nLCBUaW5hIDx0aW5hLnpoYW5nQGludGVsLmNv
bT4KPiBDYzogaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGtyYXhlbEByZWRo
YXQuY29tOwo+IGt2bUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5v
cmc7IFl1YW4sIEhhbmcKPiA8aGFuZy55dWFuQGludGVsLmNvbT47IEx2LCBaaGl5dWFuIDx6aGl5
dWFuLmx2QGludGVsLmNvbT47IEVyaWMgQXVnZXIKPiA8ZXJpYy5hdWdlckByZWRoYXQuY29tPgo+
IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjUgMS82XSB2ZmlvOiBEZWZpbmUgZGV2aWNlIHNwZWNpZmlj
IGlycSB0eXBlIGNhcGFiaWxpdHkKPiAKPiBPbiBGcmksIDE2IEF1ZyAyMDE5IDEwOjM1OjIzICsw
ODAwCj4gVGluYSBaaGFuZyA8dGluYS56aGFuZ0BpbnRlbC5jb20+IHdyb3RlOgo+IAo+ID4gQ2Fw
IHRoZSBudW1iZXIgb2YgaXJxcyB3aXRoIGZpeGVkIGluZGV4ZXMgYW5kIHVzZSBjYXBhYmlsaXR5
IGNoYWlucyB0bwo+ID4gY2hhaW4gZGV2aWNlIHNwZWNpZmljIGlycXMuCj4gPgo+ID4gU2lnbmVk
LW9mZi1ieTogVGluYSBaaGFuZyA8dGluYS56aGFuZ0BpbnRlbC5jb20+Cj4gPiBTaWduZWQtb2Zm
LWJ5OiBFcmljIEF1Z2VyIDxlcmljLmF1Z2VyQHJlZGhhdC5jb20+Cj4gPiAtLS0KPiA+ICBpbmNs
dWRlL3VhcGkvbGludXgvdmZpby5oIHwgMTkgKysrKysrKysrKysrKysrKysrLQo+ID4gIDEgZmls
ZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAt
LWdpdCBhL2luY2x1ZGUvdWFwaS9saW51eC92ZmlvLmggYi9pbmNsdWRlL3VhcGkvbGludXgvdmZp
by5oCj4gPiBpbmRleCAwMmJiN2FkNmU5ODYuLmQ4M2M5ZjEzNmE1YiAxMDA2NDQKPiA+IC0tLSBh
L2luY2x1ZGUvdWFwaS9saW51eC92ZmlvLmgKPiA+ICsrKyBiL2luY2x1ZGUvdWFwaS9saW51eC92
ZmlvLmgKPiA+IEBAIC00NDQsMTEgKzQ0NCwyNyBAQCBzdHJ1Y3QgdmZpb19pcnFfaW5mbyB7Cj4g
PiAgI2RlZmluZSBWRklPX0lSUV9JTkZPX01BU0tBQkxFCQkoMSA8PCAxKQo+ID4gICNkZWZpbmUg
VkZJT19JUlFfSU5GT19BVVRPTUFTS0VECSgxIDw8IDIpCj4gPiAgI2RlZmluZSBWRklPX0lSUV9J
TkZPX05PUkVTSVpFCQkoMSA8PCAzKQo+ID4gKyNkZWZpbmUgVkZJT19JUlFfSU5GT19GTEFHX0NB
UFMJCSgxIDw8IDQpIC8qIEluZm8KPiBzdXBwb3J0cyBjYXBzICovCj4gPiAgCV9fdTMyCWluZGV4
OwkJLyogSVJRIGluZGV4ICovCj4gPiAgCV9fdTMyCWNvdW50OwkJLyogTnVtYmVyIG9mIElSUXMg
d2l0aGluIHRoaXMgaW5kZXggKi8KPiA+ICsJX191MzIJY2FwX29mZnNldDsJLyogT2Zmc2V0IHdp
dGhpbiBpbmZvIHN0cnVjdCBvZiBmaXJzdCBjYXAgKi8KPiA+ICB9Owo+ID4gICNkZWZpbmUgVkZJ
T19ERVZJQ0VfR0VUX0lSUV9JTkZPCV9JTyhWRklPX1RZUEUsIFZGSU9fQkFTRSArCj4gOSkKPiA+
Cj4gPiArLyoKPiA+ICsgKiBUaGUgaXJxIHR5cGUgY2FwYWJpbGl0eSBhbGxvd3MgaXJxcyB1bmlx
dWUgdG8gYSBzcGVjaWZpYyBkZXZpY2Ugb3IKPiA+ICsgKiBjbGFzcyBvZiBkZXZpY2VzIHRvIGJl
IGV4cG9zZWQuCj4gPiArICoKPiA+ICsgKiBUaGUgc3RydWN0dXJlcyBiZWxvdyBkZWZpbmUgdmVy
c2lvbiAxIG9mIHRoaXMgY2FwYWJpbGl0eS4KPiA+ICsgKi8KPiA+ICsjZGVmaW5lIFZGSU9fSVJR
X0lORk9fQ0FQX1RZUEUgICAgICAzCj4gCj4gV2h5IDM/ICBXaGF0J3MgdXNpbmcgMSBhbmQgMiBv
ZiB0aGlzIG5ld2x5IGRlZmluZWQgaW5mbyBjYXAgSUQ/ICBUaGFua3MsClRoZXJlIHdhcyBhbiBh
c3N1bXB0aW9uIHRoYXQgdGhlcmUgd2VyZSB0d28ga2luZHMgb2YgQ0FQX1RZUEU6IFZGSU9fUkVH
SU9OX0lORk9fQ0FQX1RZUEUgYW5kIFZGSU9fSVJRX0lORk9fQ0FQX1RZUEUuIFNpbmNlIFZGSU9f
UkVHSU9OX0lORk9fQ0FQX1RZUEUgd2FzIGRlZmluZWQgYXMgMSwgVkZJT19JUlFfSU5GT19DQVBf
VFlQRSB3YXMgZGVmaW5lZCBhZnRlciBpdC4KT0suIEkgc2VlIHRoaXMgaXNuJ3QgYSBnb29kIGlk
ZWEuIExldCdzIGdpdmUgVkZJT19SRUdJT05fSU5GT19DQVBfVFlQRSBhIG5ldyBzcGFjZS4gVGhh
bmtzLgoKQlIsClRpbmEKPiAKPiBBbGV4Cj4gCj4gPiArCj4gPiArc3RydWN0IHZmaW9faXJxX2lu
Zm9fY2FwX3R5cGUgewo+ID4gKwlzdHJ1Y3QgdmZpb19pbmZvX2NhcF9oZWFkZXIgaGVhZGVyOwo+
ID4gKwlfX3UzMiB0eXBlOyAgICAgLyogZ2xvYmFsIHBlciBidXMgZHJpdmVyICovCj4gPiArCV9f
dTMyIHN1YnR5cGU7ICAvKiB0eXBlIHNwZWNpZmljICovCj4gPiArfTsKPiA+ICsKPiA+ICAvKioK
PiA+ICAgKiBWRklPX0RFVklDRV9TRVRfSVJRUyAtIF9JT1coVkZJT19UWVBFLCBWRklPX0JBU0Ug
KyAxMCwgc3RydWN0Cj4gdmZpb19pcnFfc2V0KQo+ID4gICAqCj4gPiBAQCAtNTUwLDcgKzU2Niw4
IEBAIGVudW0gewo+ID4gIAlWRklPX1BDSV9NU0lYX0lSUV9JTkRFWCwKPiA+ICAJVkZJT19QQ0lf
RVJSX0lSUV9JTkRFWCwKPiA+ICAJVkZJT19QQ0lfUkVRX0lSUV9JTkRFWCwKPiA+IC0JVkZJT19Q
Q0lfTlVNX0lSUVMKPiA+ICsJVkZJT19QQ0lfTlVNX0lSUVMgPSA1CS8qIEZpeGVkIHVzZXIgQUJJ
LCBJUlEgaW5kZXhlcyA+PTUKPiB1c2UgICAqLwo+ID4gKwkJCQkvKiBkZXZpY2Ugc3BlY2lmaWMg
Y2FwIHRvIGRlZmluZSBjb250ZW50ICovCj4gPiAgfTsKPiA+Cj4gPiAgLyoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGlu
ZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
