Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8105A5ECE
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  3 Sep 2019 03:26:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79F5C89913;
	Tue,  3 Sep 2019 01:26:41 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACF8089913
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  3 Sep 2019 01:26:40 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Sep 2019 18:26:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,461,1559545200"; d="scan'208";a="181984609"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by fmsmga008.fm.intel.com with ESMTP; 02 Sep 2019 18:26:40 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 2 Sep 2019 18:26:40 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 2 Sep 2019 18:26:38 -0700
Received: from shsmsx106.ccr.corp.intel.com (10.239.4.159) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 2 Sep 2019 18:26:38 -0700
Received: from shsmsx101.ccr.corp.intel.com ([169.254.1.92]) by
 SHSMSX106.ccr.corp.intel.com ([169.254.10.86]) with mapi id 14.03.0439.000;
 Tue, 3 Sep 2019 09:26:37 +0800
From: "Zhang, Tina" <tina.zhang@intel.com>
To: "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>, "kraxel@redhat.com"
 <kraxel@redhat.com>, "alex.williamson@redhat.com"
 <alex.williamson@redhat.com>
Subject: RE: [PATCH v5 0/6] Deliver vGPU display refresh event to userspace
Thread-Topic: [PATCH v5 0/6] Deliver vGPU display refresh event to userspace
Thread-Index: AQHVU9tUM+mrk1EK3UW2FOPyJRIR1KcZNxag
Date: Tue, 3 Sep 2019 01:26:36 +0000
Message-ID: <237F54289DF84E4997F34151298ABEBC8771E7AE@SHSMSX101.ccr.corp.intel.com>
References: <20190816023528.30210-1-tina.zhang@intel.com>
In-Reply-To: <20190816023528.30210-1-tina.zhang@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMzMwZmIxMjYtMzQzMC00MjllLTk2MjItZjc5ZjJhMzNiNjFkIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoibUlvalB4MW1UUGIrSlwvSXZMV2VpdVV0VldVTXh4ZW40a00xM2NSNjExUWo2XC9sdEdPNjFkXC9UNFB4V3hqc1dSaiJ9
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
Cc: "Lv, Zhiyuan" <zhiyuan.lv@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "Yuan,
 Hang" <hang.yuan@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

SGksCgpTb21lIHBlb3BsZSBhcmUgYXNraW5nIHdoZXRoZXIgdGhlIGRpc3BsYXkgcmVmcmVzaCBp
cnEgY291bGQgYmUgcHJvdmlkZWQgYnkgcWVtdSB2ZmlvIGRpc3BsYXk/CgpTb21lIGJhY2tncm91
bmQ6IGN1cnJlbnRseSwgd2UgaGF2ZSB0d28gZGlzcGxheSB0aW1lcnMuIE9uZSBpcyBwcm92aWRl
ZCBieSBRRU1VIFVJIGFuZCB0aGUgb3RoZXIgb25lIGlzIHByb3ZpZGVkIGJ5IHRoZSB2Z3B1LiBU
aGUgdmdwdSBkaXNwbGF5IGZyYW1lYnVmZmVyIGNvbnN1bWVycyAoaS5lLiBRRU1VIFVJcykgZGVw
ZW5kIG9uIHRoZSBVSSB0aW1lciB0byBjb25zdW1lIHRoZSBjb250ZW50cyBpbiB0aGUgdmdwdSBk
aXNwbGF5IGZyYW1lYnVmZmVyLCBtZWFud2hpbGUgdGhlIGRpc3BsYXkgZnJhbWVidWZmZXIgcHJv
ZHVjZXIgKGUuZy4gZ3Z0LWcgZGlzcGxheSBtb2RlbCkgdXBkYXRlcyB0aGUgZnJhbWVidWZmZXIg
Y29udGVudCBhY2NvcmRpbmcgdG8gdGhlIHZibGFuayB0aW1lciBwcm92aWRlZCBieSBncHUgdmVu
ZG9yIGRyaXZlci4gU2luY2UgdGhlc2UgdHdvIHRpbWVycyBhcmUgbm90IHN5bmNlZCwgdGVhcmlu
ZyBjb3VsZCBiZSBub3RpY2VkLiAKClNvLCB0aGVvcmV0aWNhbGx5IHRvIHNvbHZlIHRoaXMgdGVh
cmluZyBwcm9ibGVtLCB3ZSBjb3VsZCBoYXZlIHR3byBvcHRpb25zOgoKT3B0aW9uIDE6IExpa2Ug
d2hhdCB3ZSBoYXZlIGluIHRoaXMgcGF0Y2ggc2V0OiBzdG9wIHRoZSBRRU1VIFVJIHRpbWVyIGFu
ZCBsZXQgYm90aCB0aGUgZnJhbWVidWZmZXIgY29uc3VtZXJzIGFuZCB0aGUgZnJhbWVidWZmZXIg
cHJvZHVjZXIgc3luYyB0byB0aGUgZGlzcGxheSByZWZyZXNoIGV2ZW50IHByb3ZpZGVkIGJ5IHZl
bmRvciBkcml2ZXIuIFNvLCBRRU1VIFVJIGNhbiBkbyB0aGUgcmVmcmVzaCBkZXBlbmRpbmcgb24g
dGhpcyBkaXNwbGF5IHJlZnJlc2ggZXZlbnQgdG8gbWFrZSBzdXJlIHRvIGhhdmUgYSB0ZWFyLWZy
ZWUgZnJhbWVidWZmZXIuCgpPcHRpb24gMjogUUVNVSBwcm92aWRlcyB0aGUgZW11bGF0ZWQgZGlz
cGxheSByZWZyZXNoIGV2ZW50IHRvIHRoZSB2Z3B1cyBwcm92aWRlZCBieSB2ZW5kb3IgZHJpdmVy
LiBGb3IgdmdwdXMsIHRoZSBkaXNwbGF5IHJlZnJlc2ggZXZlbnQgY2FuIGJlIGNvbnNpZGVyZWQg
YXMgdGhlIHZibGFuayBldmVudCB3aGljaCBpcyBsZXZlcmFnZWQgYnkgZ3Vlc3Qgd2luZG93IG1h
bmFnZXIgdG8gZG8gdGhlIHBsYW5lIHVwZGF0ZSBvciBtb2RlLXNldHRpbmcuCgpQZW9wbGUgYXJl
IGFza2luZyBpZiBvcHRpb24gMiBjb3VsZCBiZSBhIGJldHRlciBjaG9pY2UuCgpUaGFua3MuCgpC
UiwKVGluYQoKPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFpoYW5nLCBUaW5h
Cj4gU2VudDogRnJpZGF5LCBBdWd1c3QgMTYsIDIwMTkgMTA6MzUgQU0KPiBUbzogaW50ZWwtZ3Z0
LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogWmhhbmcsIFRpbmEgPHRpbmEuemhhbmdA
aW50ZWwuY29tPjsga3JheGVsQHJlZGhhdC5jb207Cj4gYWxleC53aWxsaWFtc29uQHJlZGhhdC5j
b207IGt2bUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LQo+IGtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7
IFl1YW4sIEhhbmcgPGhhbmcueXVhbkBpbnRlbC5jb20+OyBMdiwgWmhpeXVhbgo+IDx6aGl5dWFu
Lmx2QGludGVsLmNvbT4KPiBTdWJqZWN0OiBbUEFUQ0ggdjUgMC82XSBEZWxpdmVyIHZHUFUgZGlz
cGxheSByZWZyZXNoIGV2ZW50IHRvIHVzZXJzcGFjZQo+IAo+IFRoaXMgc2VyaWVzIHRyaWVzIHRv
IHNlbmQgdGhlIHZHUFUgZGlzcGxheSByZWZyZXNoIGV2ZW50IHRvIHVzZXIgbGFuZC4KPiAKPiBJ
bnN0ZWFkIG9mIGRlbGl2ZXJpbmcgcGFnZSBmbGlwIGV2ZW50cyBvbmx5IG9yIHZibGFuayBldmVu
dHMgb25seSwgd2UgY2hvb3NlCj4gdG8gY29tYmluZSB0d28gb2YgdGhlbSwgaS5lLiBwb3N0IGRp
c3BsYXkgcmVmcmVzaCBldmVudCBhdCB2YmxhbmtzIGFuZCBza2lwCj4gc29tZSBvZiB0aGVtIHdo
ZW4gbm8gcGFnZSBmbGlwIGhhcHBlbnMuIFZibGFua3MgYXMgdXBwZXIgYm91bmQgYXJlIHNhZmUK
PiBhbmQgc2tpcHBpbmcgbm8tcGFnZS1mbGlwIHZibGFua3MgZ3VhcmFudGVlcyBib3RoIHRyaXZp
YWwgcGVyZm9ybWFuY2UKPiBpbXBhY3RzIGFuZCBnb29kIHVzZXIgZXhwZXJpZW5jZSB3aXRob3V0
IHNjcmVlbiB0ZWFyaW5nLiBQbHVzLCB3ZSBoYXZlIHRoZQo+IG1hc2svdW5tYXNrIG1lY2hhbnNp
bSBwcm92aWRpbmcgdXNlciBzcGFjZSBmbGV4aWJpbGl0eSB0byBzd2l0Y2ggYmV0d2Vlbgo+IGV2
ZW50LW5vdGlmaWVkIHJlZnJlc2ggYW5kIGNsYXNzaWMgdGltZXItYmFzZWQgcmVmcmVzaC4KPiAK
PiBJbiBhZGRpdGlvbiwgdGhlcmUgYXJlIHNvbWUgY2FzZXMgdGhhdCBndWVzdCBhcHAgb25seSB1
c2VzIG9uZSBmcmFtZWJ1ZmZlcgo+IGZvciBib3RoIGRyYXdpbmcgYW5kIGRpc3BsYXkuIEluIHN1
Y2ggY2FzZSwgZ3Vlc3QgT1Mgd29uJ3QgZG8gdGhlIHBsYW5lIHBhZ2UKPiBmbGlwIHdoZW4gdGhl
IGZyYW1lYnVmZmVyIGlzIHVwZGF0ZWQsIHRodXMgdGhlIHVzZXIgbGFuZCB3b24ndCBiZSBub3Rp
ZmllZAo+IGFib3V0IHRoZSB1cGRhdGVkIGZyYW1lYnVmZmVyLiBIZW5jZSwgaW4gc2luZ2xlIGZy
YW1lYnVmZmVyIGNhc2UsIHdlIGFwcGx5Cj4gYSBoZXVyaXN0aWMgdG8gZGV0ZXJtaW5lIHdoZXRo
ZXIgaXQgaXMgdGhlIGNhc2Ugb3Igbm90LiBJZiBpdCBpcywgbm90aWZ5IHVzZXIgbGFuZAo+IHdo
ZW4gZWFjaCB2YmxhbmsgZXZlbnQgdHJpZ2dlcnMuCj4gCj4gdjU6Cj4gLSBJbnRyb2R1Y2UgYSB2
R1BVIGRpc3BsYXkgaXJxIGNhcCB3aGljaCBjYW4gbm90aWZ5IHVzZXIgc3BhY2Ugd2l0aAo+ICAg
Ym90aCBwcmltYXJ5IGFuZCBjdXJzb3IgcGxhbmUgdXBkYXRlIGV2ZW50cyB0aHJvdWdoIG9uZSBl
dmVudGZkLiAoR2VyZCAmCj4gQWxleCkKPiB2NDoKPiAtIERlbGl2ZXIgcGFnZSBmbGlwIGV2ZW50
IGFuZCBzaW5nbGUgZnJhbWVidWZmZXIgcmVmcmVzaCBldmVudCBib3VuZGVkIGJ5Cj4gZGlzcGxh
eSB2YmxhbmtzLiAoS2VjaGVuKQo+IHYzOgo+IC0gRGVsaXZlciBkaXNwbGF5IHZibGFuayBldmVu
dCBpbnN0ZWFkIG9mIHBhZ2UgZmxpcCBldmVudC4gKFpoZW55dSkKPiB2MjoKPiAtIFVzZSBWRklP
IGlycSBjaGFpbiB0byBnZXQgZXZlbnRmZHMgZnJvbSB1c2Vyc3BhY2UgaW5zdGVhZCBvZiBhZGRp
bmcgYSBuZXcKPiBBQkkuIChBbGV4KQo+IHYxOgo+IC0gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVs
Lm9yZy9jb3Zlci8xMDk2MjM0MS8KPiAKPiBLZWNoZW4gTHUgKDIpOgo+ICAgZHJtL2k5MTUvZ3Z0
OiBEZWxpdmVyIGFzeW5jIHByaW1hcnkgcGxhbmUgcGFnZSBmbGlwIGV2ZW50cyBhdCB2YmxhbmsK
PiAgIGRybS9pOTE1L2d2dDogQWRkIGN1cnNvciBwbGFuZSByZWcgdXBkYXRlIHRyYXAgZW11bGF0
aW9uIGhhbmRsZXIKPiAKPiBUaW5hIFpoYW5nICg0KToKPiAgIHZmaW86IERlZmluZSBkZXZpY2Ug
c3BlY2lmaWMgaXJxIHR5cGUgY2FwYWJpbGl0eQo+ICAgdmZpbzogSW50cm9kdWNlIHZHUFUgZGlz
cGxheSBpcnEgdHlwZQo+ICAgZHJtL2k5MTUvZ3Z0OiBSZWdpc3RlciB2R1BVIGRpc3BsYXkgZXZl
bnQgaXJxCj4gICBkcm0vaTkxNS9ndnQ6IERlbGl2ZXIgdkdQVSByZWZyZXNoIGV2ZW50IHRvIHVz
ZXJzcGFjZQo+IAo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvY21kX3BhcnNlci5jIHwgICA2
ICstCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9kaXNwbGF5LmMgICAgfCAgNDkgKysrKyst
Cj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9kaXNwbGF5LmggICAgfCAgIDMgKwo+ICBkcml2
ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3Z0LmggICAgICAgIHwgICA2ICsKPiAgZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZ3Z0L2hhbmRsZXJzLmMgICB8ICAzMiArKystCj4gIGRyaXZlcnMvZ3B1L2RybS9p
OTE1L2d2dC9oeXBlcmNhbGwuaCAgfCAgIDEgKwo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQv
aW50ZXJydXB0LmMgIHwgICA3ICsKPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2ludGVycnVw
dC5oICB8ICAgMyArCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9rdm1ndC5jICAgICAgfCAy
MzAgKysrKysrKysrKysrKysrKysrKysrKysrKy0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0
L21wdC5oICAgICAgICB8ICAxNyArKwo+ICBpbmNsdWRlL3VhcGkvbGludXgvdmZpby5oICAgICAg
ICAgICAgIHwgIDQwICsrKystCj4gIDExIGZpbGVzIGNoYW5nZWQsIDM3NSBpbnNlcnRpb25zKCsp
LCAxOSBkZWxldGlvbnMoLSkKPiAKPiAtLQo+IDIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50
ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
