Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 534C16E30A
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 19 Jul 2019 11:02:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CBDE6E5D0;
	Fri, 19 Jul 2019 09:02:39 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0A506E5D0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 19 Jul 2019 09:02:37 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Jul 2019 02:02:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,281,1559545200"; d="scan'208";a="195888255"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by fmsmga002.fm.intel.com with ESMTP; 19 Jul 2019 02:02:36 -0700
Received: from fmsmsx155.amr.corp.intel.com (10.18.116.71) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 19 Jul 2019 02:02:36 -0700
Received: from shsmsx153.ccr.corp.intel.com (10.239.6.53) by
 FMSMSX155.amr.corp.intel.com (10.18.116.71) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 19 Jul 2019 02:02:36 -0700
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.3]) by
 SHSMSX153.ccr.corp.intel.com ([169.254.12.60]) with mapi id 14.03.0439.000;
 Fri, 19 Jul 2019 17:02:34 +0800
From: "Lu, Kechen" <kechen.lu@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>, "Zhang, Tina" <tina.zhang@intel.com>
Subject: RE: [RFC PATCH v4 1/6] vfio: Define device specific irq type
 capability
Thread-Topic: [RFC PATCH v4 1/6] vfio: Define device specific irq type
 capability
Thread-Index: AQHVPfh+laa+mTOUHUqdBIkmECCN6KbRmVnQ
Date: Fri, 19 Jul 2019 09:02:33 +0000
Message-ID: <31185F57AF7C4B4F87C41E735C23A6FE64DFC7@shsmsx102.ccr.corp.intel.com>
References: <20190718155640.25928-1-kechen.lu@intel.com>
 <20190718155640.25928-2-kechen.lu@intel.com>
 <20190719060540.GC28809@zhen-hp.sh.intel.com>
In-Reply-To: <20190719060540.GC28809@zhen-hp.sh.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiOTA2Nzc3ZWUtZDM0Ny00MDhmLTk3OWYtMjRlYWExMjQwYjEyIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoicEVwaUZEbVBtSzBnYUpWMnY4clwvV201N2c0MlNWQlZZOTlSM0FlN2NNMElKb1g2VzVFUGVtVlNxSEp4MWJcL0JTIn0=
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Yuan,
 Hang" <hang.yuan@intel.com>, Eric Auger <eric.auger@redhat.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>, "Lv,
 Zhiyuan" <zhiyuan.lv@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Wang, Zhi A" <zhi.a.wang@intel.com>, "kraxel@redhat.com" <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

SGksCgo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gRnJvbTogWmhlbnl1IFdhbmcgW21h
aWx0bzp6aGVueXV3QGxpbnV4LmludGVsLmNvbV0KPiBTZW50OiBGcmlkYXksIEp1bHkgMTksIDIw
MTkgMjowNiBQTQo+IFRvOiBMdSwgS2VjaGVuIDxrZWNoZW4ubHVAaW50ZWwuY29tPgo+IENjOiBp
bnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsga3ZtQHZnZXIua2VybmVsLm9yZzsg
bGludXgtIAo+IGtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IFpoYW5nLCBUaW5hIDx0aW5hLnpoYW5n
QGludGVsLmNvbT47IAo+IGtyYXhlbEByZWRoYXQuY29tOyB6aGVueXV3QGxpbnV4LmludGVsLmNv
bTsgTHYsIFpoaXl1YW4gCj4gPHpoaXl1YW4ubHZAaW50ZWwuY29tPjsgV2FuZywgWmhpIEEgPHpo
aS5hLndhbmdAaW50ZWwuY29tPjsgVGlhbiwgCj4gS2V2aW4gPGtldmluLnRpYW5AaW50ZWwuY29t
PjsgWXVhbiwgSGFuZyA8aGFuZy55dWFuQGludGVsLmNvbT47IAo+IGFsZXgud2lsbGlhbXNvbkBy
ZWRoYXQuY29tOyBFcmljIEF1Z2VyIDxlcmljLmF1Z2VyQHJlZGhhdC5jb20+Cj4gU3ViamVjdDog
UmU6IFtSRkMgUEFUQ0ggdjQgMS82XSB2ZmlvOiBEZWZpbmUgZGV2aWNlIHNwZWNpZmljIGlycSB0
eXBlIAo+IGNhcGFiaWxpdHkKPiAKPiBPbiAyMDE5LjA3LjE4IDIzOjU2OjM1ICswODAwLCBLZWNo
ZW4gTHUgd3JvdGU6Cj4gPiBGcm9tOiBUaW5hIFpoYW5nIDx0aW5hLnpoYW5nQGludGVsLmNvbT4K
PiA+Cj4gPiBDYXAgdGhlIG51bWJlciBvZiBpcnFzIHdpdGggZml4ZWQgaW5kZXhlcyBhbmQgdXNl
IGNhcGFiaWxpdHkgY2hhaW5zIAo+ID4gdG8gY2hhaW4gZGV2aWNlIHNwZWNpZmljIGlycXMuCj4g
Pgo+ID4gU2lnbmVkLW9mZi1ieTogVGluYSBaaGFuZyA8dGluYS56aGFuZ0BpbnRlbC5jb20+Cj4g
PiBTaWduZWQtb2ZmLWJ5OiBFcmljIEF1Z2VyIDxlcmljLmF1Z2VyQHJlZGhhdC5jb20+Cj4gPiAt
LS0KPiA+ICBpbmNsdWRlL3VhcGkvbGludXgvdmZpby5oIHwgMTkgKysrKysrKysrKysrKysrKysr
LQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4g
Pgo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9saW51eC92ZmlvLmggYi9pbmNsdWRlL3Vh
cGkvbGludXgvdmZpby5oIAo+ID4gaW5kZXggOGYxMDc0OGRhYzc5Li5iZTZhZGFiNGY3NTkgMTAw
NjQ0Cj4gPiAtLS0gYS9pbmNsdWRlL3VhcGkvbGludXgvdmZpby5oCj4gPiArKysgYi9pbmNsdWRl
L3VhcGkvbGludXgvdmZpby5oCj4gPiBAQCAtNDQ4LDExICs0NDgsMjcgQEAgc3RydWN0IHZmaW9f
aXJxX2luZm8gewo+ID4gICNkZWZpbmUgVkZJT19JUlFfSU5GT19NQVNLQUJMRQkJKDEgPDwgMSkK
PiA+ICAjZGVmaW5lIFZGSU9fSVJRX0lORk9fQVVUT01BU0tFRAkoMSA8PCAyKQo+ID4gICNkZWZp
bmUgVkZJT19JUlFfSU5GT19OT1JFU0laRQkJKDEgPDwgMykKPiA+ICsjZGVmaW5lIFZGSU9fSVJR
X0lORk9fRkxBR19DQVBTCQkoMSA8PCA0KSAvKiBJbmZvIHN1cHBvcnRzIGNhcHMKPiAqLwo+ID4g
IAlfX3UzMglpbmRleDsJCS8qIElSUSBpbmRleCAqLwo+ID4gIAlfX3UzMgljb3VudDsJCS8qIE51
bWJlciBvZiBJUlFzIHdpdGhpbiB0aGlzIGluZGV4ICovCj4gPiArCV9fdTMyCWNhcF9vZmZzZXQ7
CS8qIE9mZnNldCB3aXRoaW4gaW5mbyBzdHJ1Y3Qgb2YgZmlyc3QgY2FwICovCj4gCj4gVGhpcyBz
dGlsbCBicmVha3MgQUJJIGFzIGFyZ3N6IHdvdWxkIGJlIHVwZGF0ZWQgd2l0aCB0aGlzIG5ldyBm
aWVsZCwgCj4gc28gaXQgd291bGQgY2F1c2UgY29tcGF0IGlzc3VlLiBJIHRoaW5rIG15IGxhc3Qg
c3VnZ2VzdGlvbiB3YXMgdG8gCj4gYXNzdW1lIGNhcCBsaXN0IHN0YXJ0cyBhZnRlciB2ZmlvX2ly
cV9pbmZvLgo+CiAKSW4gdGhlIGNvbW1vbiBwcmFjdGljZSwgdGhlIGdlbmVyYWwgbG9naWMgaXMg
Zmlyc3QgdXNlIHRoZSAiY291bnQiIGFzIHRoZSAibWluc3oiIGJvdW5kYXJ5IHRvIHBlcmZvcm0g
Y29weSBmcm9tIHVzZXIsIGFuZCB0aGVuIHBlcmZvcm0gZm9sbG93aW5nIGxvZ2ljLCBzbyB0aGF0
IHRoZSBpbmNvbXBhdGliaWxpdHkgaXNzdWUgd291bGQgbm90IGhhcHBlbi4gQlRXLCB0aGlzIHBh
dGNoIGhhcyBiZWVuIGRvdWJsZSBjaGVja2VkIGJ5IEVyaWMgQXVnZXIgYmVmb3JlIGluY2x1ZGVk
IGluIGhpcyBwYXRjaC1zZXQuIAoKQmVzdCBSZWdhcmRzLApLZWNoZW4KCj4gPiAgfTsKPiA+ICAj
ZGVmaW5lIFZGSU9fREVWSUNFX0dFVF9JUlFfSU5GTwlfSU8oVkZJT19UWVBFLCBWRklPX0JBU0Ug
KyA5KQo+ID4KPiA+ICsvKgo+ID4gKyAqIFRoZSBpcnEgdHlwZSBjYXBhYmlsaXR5IGFsbG93cyBp
cnFzIHVuaXF1ZSB0byBhIHNwZWNpZmljIGRldmljZSAKPiA+ICtvcgo+ID4gKyAqIGNsYXNzIG9m
IGRldmljZXMgdG8gYmUgZXhwb3NlZC4KPiA+ICsgKgo+ID4gKyAqIFRoZSBzdHJ1Y3R1cmVzIGJl
bG93IGRlZmluZSB2ZXJzaW9uIDEgb2YgdGhpcyBjYXBhYmlsaXR5Lgo+ID4gKyAqLwo+ID4gKyNk
ZWZpbmUgVkZJT19JUlFfSU5GT19DQVBfVFlQRSAgICAgIDMKPiA+ICsKPiA+ICtzdHJ1Y3QgdmZp
b19pcnFfaW5mb19jYXBfdHlwZSB7Cj4gPiArCXN0cnVjdCB2ZmlvX2luZm9fY2FwX2hlYWRlciBo
ZWFkZXI7Cj4gPiArCV9fdTMyIHR5cGU7ICAgICAvKiBnbG9iYWwgcGVyIGJ1cyBkcml2ZXIgKi8K
PiA+ICsJX191MzIgc3VidHlwZTsgIC8qIHR5cGUgc3BlY2lmaWMgKi8gfTsKPiA+ICsKPiA+ICAv
KioKPiA+ICAgKiBWRklPX0RFVklDRV9TRVRfSVJRUyAtIF9JT1coVkZJT19UWVBFLCBWRklPX0JB
U0UgKyAxMCwgc3RydWN0Cj4gdmZpb19pcnFfc2V0KQo+ID4gICAqCj4gPiBAQCAtNTU0LDcgKzU3
MCw4IEBAIGVudW0gewo+ID4gIAlWRklPX1BDSV9NU0lYX0lSUV9JTkRFWCwKPiA+ICAJVkZJT19Q
Q0lfRVJSX0lSUV9JTkRFWCwKPiA+ICAJVkZJT19QQ0lfUkVRX0lSUV9JTkRFWCwKPiA+IC0JVkZJ
T19QQ0lfTlVNX0lSUVMKPiA+ICsJVkZJT19QQ0lfTlVNX0lSUVMgPSA1CS8qIEZpeGVkIHVzZXIg
QUJJLCBJUlEgaW5kZXhlcyA+PTUgdXNlCj4gKi8KPiA+ICsJCQkJLyogZGV2aWNlIHNwZWNpZmlj
IGNhcCB0byBkZWZpbmUgY29udGVudCAqLwo+ID4gIH07Cj4gPgo+ID4gIC8qCj4gPiAtLQo+ID4g
Mi4xNy4xCj4gPgo+IAo+IC0tCj4gT3BlbiBTb3VyY2UgVGVjaG5vbG9neSBDZW50ZXIsIEludGVs
IGx0ZC4KPiAKPiAkZ3BnIC0ta2V5c2VydmVyIHd3d2tleXMucGdwLm5ldCAtLXJlY3Yta2V5cyA0
RDc4MTgyNwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpp
bnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVs
LWd2dC1kZXY=
