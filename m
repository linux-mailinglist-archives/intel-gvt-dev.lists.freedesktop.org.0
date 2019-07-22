Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E28996F8DD
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 22 Jul 2019 07:28:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89B7789948;
	Mon, 22 Jul 2019 05:28:40 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E89889948
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 22 Jul 2019 05:28:39 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Jul 2019 22:28:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,293,1559545200"; d="scan'208";a="163063514"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by orsmga008.jf.intel.com with ESMTP; 21 Jul 2019 22:28:38 -0700
Received: from fmsmsx120.amr.corp.intel.com (10.18.124.208) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sun, 21 Jul 2019 22:28:37 -0700
Received: from shsmsx154.ccr.corp.intel.com (10.239.6.54) by
 fmsmsx120.amr.corp.intel.com (10.18.124.208) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sun, 21 Jul 2019 22:28:37 -0700
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.3]) by
 SHSMSX154.ccr.corp.intel.com ([169.254.7.240]) with mapi id 14.03.0439.000;
 Mon, 22 Jul 2019 13:28:35 +0800
From: "Lu, Kechen" <kechen.lu@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: RE: [RFC PATCH v4 2/6] vfio: Introduce vGPU display irq type
Thread-Topic: [RFC PATCH v4 2/6] vfio: Introduce vGPU display irq type
Thread-Index: AQHVPk6Tjcq5grzPBEGxRHokEzi0nabV959w
Date: Mon, 22 Jul 2019 05:28:35 +0000
Message-ID: <31185F57AF7C4B4F87C41E735C23A6FE64E06F@shsmsx102.ccr.corp.intel.com>
References: <20190718155640.25928-1-kechen.lu@intel.com>
 <20190718155640.25928-3-kechen.lu@intel.com>
 <20190719102516.60af527f@x1.home>
In-Reply-To: <20190719102516.60af527f@x1.home>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZTQ3NTYyM2QtZWZmYy00Yzg5LTk3NWItM2E0OWRkNjc0YTAxIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoib0pcL0ttdkRHOW1FZGVHQlo4Tko2WEZKNWEyMWRBNm4zSVhncnJCSk92azViVWZXZkhNbHZzV2RZVXRac1JzT04ifQ==
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
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>, "Zhang,
 Tina" <tina.zhang@intel.com>, "kraxel@redhat.com" <kraxel@redhat.com>, "Yuan,
 Hang" <hang.yuan@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Wang, Zhi A" <zhi.a.wang@intel.com>, "Lv, Zhiyuan" <zhiyuan.lv@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

SGksIAoKPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEFsZXggV2lsbGlhbXNv
biBbbWFpbHRvOmFsZXgud2lsbGlhbXNvbkByZWRoYXQuY29tXQo+IFNlbnQ6IFNhdHVyZGF5LCBK
dWx5IDIwLCAyMDE5IDEyOjI1IEFNCj4gVG86IEx1LCBLZWNoZW4gPGtlY2hlbi5sdUBpbnRlbC5j
b20+Cj4gQ2M6IGludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBrdm1Admdlci5r
ZXJuZWwub3JnOyBsaW51eC0KPiBrZXJuZWxAdmdlci5rZXJuZWwub3JnOyBaaGFuZywgVGluYSA8
dGluYS56aGFuZ0BpbnRlbC5jb20+Owo+IGtyYXhlbEByZWRoYXQuY29tOyB6aGVueXV3QGxpbnV4
LmludGVsLmNvbTsgTHYsIFpoaXl1YW4KPiA8emhpeXVhbi5sdkBpbnRlbC5jb20+OyBXYW5nLCBa
aGkgQSA8emhpLmEud2FuZ0BpbnRlbC5jb20+OyBUaWFuLCBLZXZpbgo+IDxrZXZpbi50aWFuQGlu
dGVsLmNvbT47IFl1YW4sIEhhbmcgPGhhbmcueXVhbkBpbnRlbC5jb20+Cj4gU3ViamVjdDogUmU6
IFtSRkMgUEFUQ0ggdjQgMi82XSB2ZmlvOiBJbnRyb2R1Y2UgdkdQVSBkaXNwbGF5IGlycSB0eXBl
Cj4gCj4gT24gVGh1LCAxOCBKdWwgMjAxOSAyMzo1NjozNiArMDgwMAo+IEtlY2hlbiBMdSA8a2Vj
aGVuLmx1QGludGVsLmNvbT4gd3JvdGU6Cj4gCj4gPiBGcm9tOiBUaW5hIFpoYW5nIDx0aW5hLnpo
YW5nQGludGVsLmNvbT4KPiA+Cj4gPiBJbnRyb2R1Y2UgdkdQVSBzcGVjaWZpYyBpcnEgdHlwZSBW
RklPX0lSUV9UWVBFX0dGWCwgYW5kCj4gPiBWRklPX0lSUV9TVUJUWVBFX0dGWF9ESVNQTEFZX0lS
USBhcyB0aGUgc3VidHlwZSBmb3IgdkdQVSBkaXNwbGF5Cj4gPgo+ID4gU2lnbmVkLW9mZi1ieTog
VGluYSBaaGFuZyA8dGluYS56aGFuZ0BpbnRlbC5jb20+Cj4gPiAtLS0KPiA+ICBpbmNsdWRlL3Vh
cGkvbGludXgvdmZpby5oIHwgMyArKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25z
KCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9saW51eC92ZmlvLmggYi9pbmNs
dWRlL3VhcGkvbGludXgvdmZpby5oCj4gPiBpbmRleCBiZTZhZGFiNGY3NTkuLmRmMjhiMTdhNmUy
ZSAxMDA2NDQKPiA+IC0tLSBhL2luY2x1ZGUvdWFwaS9saW51eC92ZmlvLmgKPiA+ICsrKyBiL2lu
Y2x1ZGUvdWFwaS9saW51eC92ZmlvLmgKPiA+IEBAIC00NjksNiArNDY5LDkgQEAgc3RydWN0IHZm
aW9faXJxX2luZm9fY2FwX3R5cGUgewo+ID4gIAlfX3UzMiBzdWJ0eXBlOyAgLyogdHlwZSBzcGVj
aWZpYyAqLwo+ID4gIH07Cj4gPgo+ID4gKyNkZWZpbmUgVkZJT19JUlFfVFlQRV9HRlgJCQkJKDEp
Cj4gPiArI2RlZmluZSBWRklPX0lSUV9TVUJUWVBFX0dGWF9ESVNQTEFZX0lSUQkJKDEpCj4gPiAr
Cj4gCj4gUGxlYXNlIGluY2x1ZGUgYSBkZXNjcmlwdGlvbiBkZWZpbmluZyBleGFjdGx5IHdoYXQg
dGhpcyBJUlEgaXMgaW50ZW5kZWQgdG8gc2lnbmFsLgo+IEZvciBpbnN0YW5jZSwgaWYgYW5vdGhl
ciB2R1BVIHZlbmRvciB3YW50ZWQgdG8gaW1wbGVtZW50IHRoaXMgaW4gdGhlaXIgZHJpdmVyCj4g
YW5kIGRpZG4ndCBoYXZlIHRoZSBRRU1VIGNvZGUgZm9yIHJlZmVyZW5jZSB0byB3aGF0IGl0IGRv
ZXMgd2l0aCB0aGUgSVJRLCB3aGF0Cj4gd291bGQgdGhleSBuZWVkIHRvIGtub3c/ICBUaGFua3Ms
Cj4gCj4gQWxleAo+IAoKWWVzLCB0aGF0IG1ha2VzIG1vcmUgc2Vuc2UuIEknbGwgYWRkIHRoZSBk
ZXNjcmlwdGlvbiBmb3IgaXQgYXQgbmV4dCB2ZXJzaW9uIHBhdGNoLgoKQlRXLCBtYXkgSSBoYXZl
IG9uZSBtb3JlIHF1ZXN0aW9uPyBJbiB0aGUgY3VycmVudCBkZXNpZ24gaWRlYXMsIHdlIHBhcnRp
dGlvbmVkIAp0aGUgdkdQVSBkaXNwbGF5IGV2ZW50ZmQgY291bnRlZCA4LWJ5dGUgdmFsdWUgaW50
byBhdCBtb3N0IDggZXZlbnRzIHRvIGRlbGl2ZXIgCm11bHRpcGxlIGRpc3BsYXkgZXZlbnRzLCBz
byB3ZSBuZWVkIGRpZmZlcmVudCBpbmNyZWFzZW1lbnQgY291bnRlciB2YWx1ZSB0byAKZGlmZmVy
ZW50aWF0ZSB0aGUgZXZlbnRzLiBBcyB0aGlzIGlzIHRoZSBleHBvc2VkIHRoaW5nIHRoZSBRRU1V
IGhhcyB0byBrbm93LCB3ZQpwbGFuIGFkZHMgYSBtYWNybyBoZXJlIFZGSU9fSVJRX1NVQlRZUEVf
R0ZYX0RJU1BMQVlfRVZFTlRGRF9CQVNFX1NISUZUIHRvCm1ha2Ugc3VyZSB0aGUgcGFydGl0aW9u
cyBzaGlmdCBpbiAxIGJ5dGUsIGRvZXMgaXQgbWFrZSBzZW5zZSBwdXR0aW5nIGhlcmU/IExvb2tp
bmcgIApmb3J3YXJkIHRvIHlvdXIgYW5kIEdlcmQncyBjb21tZW50cy4gVGhhbmtzIQoKCkJlc3Qg
UmVnYXJkcywKS2VjaGVuCgo+ID4gIC8qKgo+ID4gICAqIFZGSU9fREVWSUNFX1NFVF9JUlFTIC0g
X0lPVyhWRklPX1RZUEUsIFZGSU9fQkFTRSArIDEwLCBzdHJ1Y3QKPiB2ZmlvX2lycV9zZXQpCj4g
PiAgICoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlu
dGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwt
Z3Z0LWRldg==
