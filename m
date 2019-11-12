Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D32F9AD2
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 12 Nov 2019 21:36:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 961156E4FF;
	Tue, 12 Nov 2019 20:36:24 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 012AF6E4FF;
 Tue, 12 Nov 2019 20:36:22 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Nov 2019 12:36:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,297,1569308400"; d="scan'208";a="229522290"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by fmsmga004.fm.intel.com with ESMTP; 12 Nov 2019 12:36:22 -0800
Received: from fmsmsx124.amr.corp.intel.com (10.18.125.39) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 12 Nov 2019 12:36:21 -0800
Received: from fmsmsx116.amr.corp.intel.com ([169.254.2.87]) by
 fmsmsx124.amr.corp.intel.com ([169.254.8.188]) with mapi id 14.03.0439.000;
 Tue, 12 Nov 2019 12:36:21 -0800
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [PULL] gvt-fixes
Thread-Topic: [PULL] gvt-fixes
Thread-Index: AQHVmSEdO8aks9+iSk2OYokH7lFc0aeIhYgA
Date: Tue, 12 Nov 2019 20:36:20 +0000
Message-ID: <56F0C65E-1CA5-4B16-90E8-A32AF967BD0C@intel.com>
References: <20191112061834.GN4196@zhen-hp.sh.intel.com>
In-Reply-To: <20191112061834.GN4196@zhen-hp.sh.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.7.196.61]
Content-ID: <5398D109B87A3E41A01686E26B25E38D@intel.com>
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
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, "Yuan,
 Hang" <hang.yuan@intel.com>, "Lv, Zhiyuan" <zhiyuan.lv@intel.com>,
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

cHVsbGVkLCB0aGFua3MKCj4gT24gTm92IDExLCAyMDE5LCBhdCAxMDoxOCBQTSwgWmhlbnl1IFdh
bmcgPHpoZW55dXdAbGludXguaW50ZWwuY29tPiB3cm90ZToKPiAKPiAKPiBIaSwKPiAKPiBIZXJl
J3Mgb25lIEdWVCBkbWFidWYgcmVmZXJlbmNlIGRyb3AgZml4IGZyb20gUGFuIEJpYW4uCj4gCj4g
VGhhbmtzCj4gLS0KPiBUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IGVlMmM1ZWY4
YTlkNjQwZWUxNjE3ZWM5N2I4NGZlMmY2MzQyODRlNTE6Cj4gCj4gIGRybS9pOTE1L2RwOiBEbyBu
b3Qgc3dpdGNoIGF1eCB0byBUQlQgbW9kZSBmb3Igbm9uLVRDIHBvcnRzICgyMDE5LTExLTA0IDEz
OjI0OjE0IC0wODAwKQo+IAo+IGFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0
Ogo+IAo+ICBodHRwczovL2dpdGh1Yi5jb20vaW50ZWwvZ3Z0LWxpbnV4LmdpdCB0YWdzL2d2dC1m
aXhlcy0yMDE5LTExLTEyCj4gCj4gZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDQxZDkz
MTQ1OWI1M2UzMmM2N2ExZjg4MzhkMWU2ODI2YTY5ZWU3NDU6Cj4gCj4gIGRybS9pOTE1L2d2dDog
Zml4IGRyb3BwaW5nIG9iaiByZWZlcmVuY2UgdHdpY2UgKDIwMTktMTEtMDggMTE6MDQ6MDcgKzA4
MDApCj4gCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQo+IGd2dC1maXhlcy0yMDE5LTExLTEyCj4gCj4gLSBGaXggZG1hYnVm
IHJlZmVyZW5jZSBkcm9wIChQYW4pCj4gCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IFBhbiBCaWFuICgxKToKPiAgICAg
IGRybS9pOTE1L2d2dDogZml4IGRyb3BwaW5nIG9iaiByZWZlcmVuY2UgdHdpY2UKPiAKPiBkcml2
ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZG1hYnVmLmMgfCA0ICsrLS0KPiAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IC0tIAo+IE9wZW4gU291cmNlIFRl
Y2hub2xvZ3kgQ2VudGVyLCBJbnRlbCBsdGQuCj4gCj4gJGdwZyAtLWtleXNlcnZlciB3d3drZXlz
LnBncC5uZXQgLS1yZWN2LWtleXMgNEQ3ODE4MjcKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
