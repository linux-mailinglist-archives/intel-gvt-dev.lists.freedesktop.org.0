Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6A870E75
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 23 Jul 2019 03:08:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBECB89F6D;
	Tue, 23 Jul 2019 01:08:23 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A60E889F6D
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 23 Jul 2019 01:08:22 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jul 2019 18:08:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,297,1559545200"; d="scan'208";a="196941132"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by fmsmga002.fm.intel.com with ESMTP; 22 Jul 2019 18:08:22 -0700
Received: from fmsmsx154.amr.corp.intel.com (10.18.116.70) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 22 Jul 2019 18:08:22 -0700
Received: from shsmsx105.ccr.corp.intel.com (10.239.4.158) by
 FMSMSX154.amr.corp.intel.com (10.18.116.70) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 22 Jul 2019 18:08:21 -0700
Received: from shsmsx101.ccr.corp.intel.com ([169.254.1.134]) by
 SHSMSX105.ccr.corp.intel.com ([169.254.11.232]) with mapi id 14.03.0439.000;
 Tue, 23 Jul 2019 09:08:20 +0800
From: "Zhang, Tina" <tina.zhang@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>, "Lu, Kechen"
 <kechen.lu@intel.com>
Subject: RE: [RFC PATCH v4 2/6] vfio: Introduce vGPU display irq type
Thread-Topic: [RFC PATCH v4 2/6] vfio: Introduce vGPU display irq type
Thread-Index: AQHVPT54hV4tNMEB+k2gOpC4yrLztKbRnH8AgAP/hYCAAO5GAIAA1wdg
Date: Tue, 23 Jul 2019 01:08:19 +0000
Message-ID: <237F54289DF84E4997F34151298ABEBC876BC9AD@SHSMSX101.ccr.corp.intel.com>
References: <20190718155640.25928-1-kechen.lu@intel.com>
 <20190718155640.25928-3-kechen.lu@intel.com>
 <20190719102516.60af527f@x1.home>
 <31185F57AF7C4B4F87C41E735C23A6FE64E06F@shsmsx102.ccr.corp.intel.com>
 <20190722134124.16c55c2f@x1.home>
In-Reply-To: <20190722134124.16c55c2f@x1.home>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiOWUxMTJiZjQtN2I4Ni00MmFlLWE5YjctOGU2MjM4NmQyZDhhIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiWkYxNmlpN2I2dzg1blk0VXVNRWt6K1JnRkdIZnRVcWxtZUhDc1o3ZVc4bEYrK3BZTUowdVoyVVNhaHJZNHFGeiJ9
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
YWlsdG86YWxleC53aWxsaWFtc29uQHJlZGhhdC5jb21dCj4gU2VudDogVHVlc2RheSwgSnVseSAy
MywgMjAxOSAzOjQxIEFNCj4gVG86IEx1LCBLZWNoZW4gPGtlY2hlbi5sdUBpbnRlbC5jb20+Cj4g
Q2M6IGludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBrdm1Admdlci5rZXJuZWwu
b3JnOyBsaW51eC0KPiBrZXJuZWxAdmdlci5rZXJuZWwub3JnOyBaaGFuZywgVGluYSA8dGluYS56
aGFuZ0BpbnRlbC5jb20+Owo+IGtyYXhlbEByZWRoYXQuY29tOyB6aGVueXV3QGxpbnV4LmludGVs
LmNvbTsgTHYsIFpoaXl1YW4KPiA8emhpeXVhbi5sdkBpbnRlbC5jb20+OyBXYW5nLCBaaGkgQSA8
emhpLmEud2FuZ0BpbnRlbC5jb20+OyBUaWFuLCBLZXZpbgo+IDxrZXZpbi50aWFuQGludGVsLmNv
bT47IFl1YW4sIEhhbmcgPGhhbmcueXVhbkBpbnRlbC5jb20+Cj4gU3ViamVjdDogUmU6IFtSRkMg
UEFUQ0ggdjQgMi82XSB2ZmlvOiBJbnRyb2R1Y2UgdkdQVSBkaXNwbGF5IGlycSB0eXBlCj4gCj4g
T24gTW9uLCAyMiBKdWwgMjAxOSAwNToyODozNSArMDAwMAo+ICJMdSwgS2VjaGVuIiA8a2VjaGVu
Lmx1QGludGVsLmNvbT4gd3JvdGU6Cj4gCj4gPiBIaSwKPiA+Cj4gPiA+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tCj4gPiA+IEZyb206IEFsZXggV2lsbGlhbXNvbiBbbWFpbHRvOmFsZXgud2ls
bGlhbXNvbkByZWRoYXQuY29tXQo+ID4gPiBTZW50OiBTYXR1cmRheSwgSnVseSAyMCwgMjAxOSAx
MjoyNSBBTQo+ID4gPiBUbzogTHUsIEtlY2hlbiA8a2VjaGVuLmx1QGludGVsLmNvbT4KPiA+ID4g
Q2M6IGludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBrdm1Admdlci5rZXJuZWwu
b3JnOyBsaW51eC0KPiA+ID4ga2VybmVsQHZnZXIua2VybmVsLm9yZzsgWmhhbmcsIFRpbmEgPHRp
bmEuemhhbmdAaW50ZWwuY29tPjsKPiA+ID4ga3JheGVsQHJlZGhhdC5jb207IHpoZW55dXdAbGlu
dXguaW50ZWwuY29tOyBMdiwgWmhpeXVhbgo+ID4gPiA8emhpeXVhbi5sdkBpbnRlbC5jb20+OyBX
YW5nLCBaaGkgQSA8emhpLmEud2FuZ0BpbnRlbC5jb20+OyBUaWFuLAo+ID4gPiBLZXZpbiA8a2V2
aW4udGlhbkBpbnRlbC5jb20+OyBZdWFuLCBIYW5nIDxoYW5nLnl1YW5AaW50ZWwuY29tPgo+ID4g
PiBTdWJqZWN0OiBSZTogW1JGQyBQQVRDSCB2NCAyLzZdIHZmaW86IEludHJvZHVjZSB2R1BVIGRp
c3BsYXkgaXJxCj4gPiA+IHR5cGUKPiA+ID4KPiA+ID4gT24gVGh1LCAxOCBKdWwgMjAxOSAyMzo1
NjozNiArMDgwMAo+ID4gPiBLZWNoZW4gTHUgPGtlY2hlbi5sdUBpbnRlbC5jb20+IHdyb3RlOgo+
ID4gPgo+ID4gPiA+IEZyb206IFRpbmEgWmhhbmcgPHRpbmEuemhhbmdAaW50ZWwuY29tPgo+ID4g
PiA+Cj4gPiA+ID4gSW50cm9kdWNlIHZHUFUgc3BlY2lmaWMgaXJxIHR5cGUgVkZJT19JUlFfVFlQ
RV9HRlgsIGFuZAo+ID4gPiA+IFZGSU9fSVJRX1NVQlRZUEVfR0ZYX0RJU1BMQVlfSVJRIGFzIHRo
ZSBzdWJ0eXBlIGZvciB2R1BVIGRpc3BsYXkKPiA+ID4gPgo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6
IFRpbmEgWmhhbmcgPHRpbmEuemhhbmdAaW50ZWwuY29tPgo+ID4gPiA+IC0tLQo+ID4gPiA+ICBp
bmNsdWRlL3VhcGkvbGludXgvdmZpby5oIHwgMyArKysKPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQs
IDMgaW5zZXJ0aW9ucygrKQo+ID4gPiA+Cj4gPiA+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFw
aS9saW51eC92ZmlvLmggYi9pbmNsdWRlL3VhcGkvbGludXgvdmZpby5oCj4gPiA+ID4gaW5kZXgg
YmU2YWRhYjRmNzU5Li5kZjI4YjE3YTZlMmUgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvaW5jbHVkZS91
YXBpL2xpbnV4L3ZmaW8uaAo+ID4gPiA+ICsrKyBiL2luY2x1ZGUvdWFwaS9saW51eC92ZmlvLmgK
PiA+ID4gPiBAQCAtNDY5LDYgKzQ2OSw5IEBAIHN0cnVjdCB2ZmlvX2lycV9pbmZvX2NhcF90eXBl
IHsKPiA+ID4gPiAgCV9fdTMyIHN1YnR5cGU7ICAvKiB0eXBlIHNwZWNpZmljICovICB9Owo+ID4g
PiA+Cj4gPiA+ID4gKyNkZWZpbmUgVkZJT19JUlFfVFlQRV9HRlgJCQkJKDEpCj4gPiA+ID4gKyNk
ZWZpbmUgVkZJT19JUlFfU1VCVFlQRV9HRlhfRElTUExBWV9JUlEJCSgxKQo+ID4gPiA+ICsKPiA+
ID4KPiA+ID4gUGxlYXNlIGluY2x1ZGUgYSBkZXNjcmlwdGlvbiBkZWZpbmluZyBleGFjdGx5IHdo
YXQgdGhpcyBJUlEgaXMgaW50ZW5kZWQgdG8KPiBzaWduYWwuCj4gPiA+IEZvciBpbnN0YW5jZSwg
aWYgYW5vdGhlciB2R1BVIHZlbmRvciB3YW50ZWQgdG8gaW1wbGVtZW50IHRoaXMgaW4KPiA+ID4g
dGhlaXIgZHJpdmVyIGFuZCBkaWRuJ3QgaGF2ZSB0aGUgUUVNVSBjb2RlIGZvciByZWZlcmVuY2Ug
dG8gd2hhdCBpdAo+ID4gPiBkb2VzIHdpdGggdGhlIElSUSwgd2hhdCB3b3VsZCB0aGV5IG5lZWQg
dG8ga25vdz8gIFRoYW5rcywKPiA+ID4KPiA+ID4gQWxleAo+ID4gPgo+ID4KPiA+IFllcywgdGhh
dCBtYWtlcyBtb3JlIHNlbnNlLiBJJ2xsIGFkZCB0aGUgZGVzY3JpcHRpb24gZm9yIGl0IGF0IG5l
eHQgdmVyc2lvbgo+IHBhdGNoLgo+ID4KPiA+IEJUVywgbWF5IEkgaGF2ZSBvbmUgbW9yZSBxdWVz
dGlvbj8gSW4gdGhlIGN1cnJlbnQgZGVzaWduIGlkZWFzLCB3ZQo+ID4gcGFydGl0aW9uZWQgdGhl
IHZHUFUgZGlzcGxheSBldmVudGZkIGNvdW50ZWQgOC1ieXRlIHZhbHVlIGludG8gYXQgbW9zdAo+
ID4gOCBldmVudHMgdG8gZGVsaXZlciBtdWx0aXBsZSBkaXNwbGF5IGV2ZW50cywgc28gd2UgbmVl
ZCBkaWZmZXJlbnQKPiA+IGluY3JlYXNlbWVudCBjb3VudGVyIHZhbHVlIHRvIGRpZmZlcmVudGlh
dGUgdGhlIGV2ZW50cy4gQXMgdGhpcyBpcyB0aGUKPiA+IGV4cG9zZWQgdGhpbmcgdGhlIFFFTVUg
aGFzIHRvIGtub3csIHdlIHBsYW4gYWRkcyBhIG1hY3JvIGhlcmUKPiA+IFZGSU9fSVJRX1NVQlRZ
UEVfR0ZYX0RJU1BMQVlfRVZFTlRGRF9CQVNFX1NISUZUIHRvIG1ha2Ugc3VyZQo+IHRoZQo+ID4g
cGFydGl0aW9ucyBzaGlmdCBpbiAxIGJ5dGUsIGRvZXMgaXQgbWFrZSBzZW5zZSBwdXR0aW5nIGhl
cmU/IExvb2tpbmcgZm9yd2FyZAo+IHRvIHlvdXIgYW5kIEdlcmQncyBjb21tZW50cy4gVGhhbmtz
IQo+IAo+IENvdWxkbid0IHlvdSBleHBvc2UgdGhpcyBhcyBhbm90aGVyIGNhcGFiaWxpdHkgd2l0
aGluIHRoZSBJUlFfSU5GTyByZXR1cm4KPiBkYXRhPyAgSWYgeW91IHdlcmUgdG8gZGVmaW5lIGl0
IGFzIGEgbWFjcm8sIEkgYXNzdW1lIHRoYXQgbWVhbnMgaXQgd291bGQgYmUKPiBoYXJkIGNvZGVk
LCBpbiB3aGljaCBjYXNlIHRoaXMgcHJvYmFibHkgYmVjb21lcyBhbiBJbnRlbCBzcGVjaWZpYyBJ
UlEsIHJhdGhlcgo+IHRoYW4gd2hhdCBhcHBlYXJzIHRvIGJlIGZyYW1lZCBhcyBhIGdlbmVyaWMg
Z3JhcGhpY3MgSVJRIGV4dGVuc2lvbi4gIEEgbmV3Cj4gY2FwYWJpbGl0eSBjb3VsZCBpbnN0ZWFk
IGFsbG93IHRoZSB2ZW5kb3IgdG8gc3BlY2lmeSB0aGVpciBvd24gdmFsdWUsIHdoZXJlCj4gd2Ug
Y291bGQgZGVmaW5lIGhvdyB1c2Vyc3BhY2Ugc2hvdWxkIGludGVycHJldCBhbmQgbWFrZSB1c2Ug
b2YgdGhpcyB2YWx1ZS4KPiBUaGFua3MsCkdvb2Qgc3VnZ2VzdGlvbi4gQ3VycmVudGx5LCB2Zmlv
X2lycV9pbmZvIGlzIHVzZWQgdG8gc2F2ZSBvbmUgaXJxIGluZm8uIFdoYXQgd2UgbmVlZCBoZXJl
IGlzIHRvIHVzZSBpdCB0byBzYXZlIHNldmVyYWwgZXZlbnRzIGluZm8uIE1heWJlIHdlIGNvdWxk
IGZpZ3VyZSBvdXQgYSBnZW5lcmFsIGxheW91dCBvZiB0aGlzIGNhcGFiaWxpdHkgc28gdGhhdCBp
dCBjYW4gYmUgbGV2ZXJhZ2VkIGJ5IG90aGVycywgbm90IG9ubHkgZm9yIGRpc3BsYXkgaXJxL2V2
ZW50cy4KVGhhbmtzLgoKQlIsClRpbmEKCj4gCj4gQWxleApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRl
bC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
