Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E31195402
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 27 Mar 2020 10:31:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEA4C6E9E8;
	Fri, 27 Mar 2020 09:31:43 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DC386E9E8
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 27 Mar 2020 09:31:41 +0000 (UTC)
IronPort-SDR: Kt85WvZ5X0e/xW2lih2tcP6ozu+YL2idSV/wQLvFzD7hZY3RlwhRPJhzLBK8Evqs0VqQrqgcQ8
 BRzOe0ZalXKg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2020 02:31:40 -0700
IronPort-SDR: +JnlIPZ27gPEXG7U99ML/TBH534/qa0mhzss5+NvEB866bsW3sK02Ts7bJwBZdH9ofoKfq7o2L
 VGqAD7Jo32Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,311,1580803200"; d="scan'208";a="247835315"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by orsmga003.jf.intel.com with ESMTP; 27 Mar 2020 02:31:40 -0700
Received: from fmsmsx124.amr.corp.intel.com (10.18.125.39) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 27 Mar 2020 02:31:39 -0700
Received: from shsmsx102.ccr.corp.intel.com (10.239.4.154) by
 fmsmsx124.amr.corp.intel.com (10.18.125.39) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 27 Mar 2020 02:31:40 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.206]) by
 shsmsx102.ccr.corp.intel.com ([169.254.2.50]) with mapi id 14.03.0439.000;
 Fri, 27 Mar 2020 17:31:36 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: RE: [PATCH v2 2/2] drm/i915/gvt: mdev aggregation type
Thread-Topic: [PATCH v2 2/2] drm/i915/gvt: mdev aggregation type
Thread-Index: AQHWAzE8uZfRrqms+UGN02f5QAMK/6hah5QggAEKxoCAAI40QP//frKAgACOdNA=
Date: Fri, 27 Mar 2020 09:31:35 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D7ED44B@SHSMSX104.ccr.corp.intel.com>
References: <20200326054136.2543-1-zhenyuw@linux.intel.com>
 <20200326054136.2543-3-zhenyuw@linux.intel.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D7ED10B@SHSMSX104.ccr.corp.intel.com>
 <20200327081215.GJ8880@zhen-hp.sh.intel.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D7ED38D@SHSMSX104.ccr.corp.intel.com>
 <20200327085825.GK8880@zhen-hp.sh.intel.com>
In-Reply-To: <20200327085825.GK8880@zhen-hp.sh.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: "Jiang, Dave" <dave.jiang@intel.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "Yuan,
 Hang" <hang.yuan@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

PiBGcm9tOiBaaGVueXUgV2FuZyA8emhlbnl1d0BsaW51eC5pbnRlbC5jb20+DQo+IFNlbnQ6IEZy
aWRheSwgTWFyY2ggMjcsIDIwMjAgNDo1OCBQTQ0KPiANCj4gT24gMjAyMC4wMy4yNyAwODo0NDo1
OSArMDAwMCwgVGlhbiwgS2V2aW4gd3JvdGU6DQo+ID4gPiBGcm9tOiBaaGVueXUgV2FuZyA8emhl
bnl1d0BsaW51eC5pbnRlbC5jb20+DQo+ID4gPiBTZW50OiBGcmlkYXksIE1hcmNoIDI3LCAyMDIw
IDQ6MTIgUE0NCj4gPiA+DQo+ID4gWy4uLl0NCj4gPiA+ID4gPiAraW50IGludGVsX3ZncHVfYWRq
dXN0X3Jlc291cmNlX2NvdW50KHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1KQ0KPiA+ID4gPiA+ICt7
DQo+ID4gPiA+ID4gKwlpZiAoKHZncHVfYXBlcnR1cmVfc3oodmdwdSkgIT0gdmdwdS0+cGFyYW0u
bG93X2dtX3N6ICoNCj4gPiA+ID4gPiArCSAgICAgdmdwdS0+cGFyYW0uYWdncmVnYXRpb24pIHx8
DQo+ID4gPiA+ID4gKwkgICAgKHZncHVfaGlkZGVuX3N6KHZncHUpICE9IHZncHUtPnBhcmFtLmhp
Z2hfZ21fc3ogKg0KPiA+ID4gPiA+ICsJICAgICB2Z3B1LT5wYXJhbS5hZ2dyZWdhdGlvbikpIHsN
Cj4gPiA+ID4gPiArCQkvKiBoYW5kbGUgYWdncmVnYXRpb24gY2hhbmdlICovDQo+ID4gPiA+ID4g
KwkJaW50ZWxfdmdwdV9mcmVlX3Jlc291cmNlX2NvdW50KHZncHUpOw0KPiA+ID4gPiA+ICsJCWlu
dGVsX3ZncHVfYWxsb2NfcmVzb3VyY2VfY291bnQodmdwdSk7DQo+ID4gPiA+DQo+ID4gPiA+IHRo
aXMgbG9naWMgc291bmRzIGxpa2UgZGlmZmVyZW50IGZyb20gdGhlIGNvbW1pdCBtc2cuIEVhcmxp
ZXIgeW91DQo+ID4gPiA+IHNhaWQgdGhlIHJlc291cmNlIGlzIG5vdCBhbGxvY2F0ZWQgdW50aWwg
bWRldiBvcGVuLCB3aGlsZSB0aGUNCj4gPiA+ID4gYWdncmVnYXRlZF9pbnRlcmZhY2VzIGlzIG9u
bHkgYWxsb3dlZCB0byBiZSB3cml0dGVuIGJlZm9yZQ0KPiA+ID4gPiBtZGV2IG9wZW4uIEluIHN1
Y2ggY2FzZSwgd2h5IHdvdWxkIGl0IHJlcXVpcmVkIHRvIGhhbmRsZSB0aGUNCj4gPiA+ID4gY2Fz
ZSB3aGVyZSBhIHZncHUgYWxyZWFkeSBoYXMgcmVzb3VyY2UgYWxsb2NhdGVkIHRoZW4gY29taW5n
DQo+ID4gPiA+IGEgbmV3IHJlcXVlc3QgdG8gYWRqdXN0IHRoZSBudW1iZXIgb2YgaW5zdGFuY2Vz
Pw0KPiA+ID4NCj4gPiA+IFRoaXMgaXMgdG8gaGFuZGxlIHJlc291cmNlIGFjY291bnRpbmcgYmVm
b3JlIG1kZXYgb3BlbiBieSBhZ2dyZWdhdGlvbg0KPiA+ID4gc2V0dGluZyBjaGFuZ2UuIFdoZW4g
dmdwdSBjcmVhdGUgZnJvbSBtZGV2IHR5cGUsIGRlZmF1bHQgcmVzb3VyY2UNCj4gPiA+IGNvdW50
IGFjY29yZGluZyB0byB0eXBlIGlzIHNldCBmb3IgdmdwdS4gU28gdGhpcyBmdW5jdGlvbiBpcyBq
dXN0IHRvDQo+ID4gPiBjaGFuZ2UgcmVzb3VyY2UgY291bnQgYnkgYWdncmVnYXRpb24uDQo+ID4N
Cj4gPiB0aGVuIGJldHRlciBjaGFuZ2UgdGhlIG5hbWUsIGUuZy4gLnh4eF9hZGp1c3RfcmVzb3Vy
Y2VfYWNjb3VudGluZywNCj4gPiBvdGhlcndpc2UgaXQncyBlYXN5IHRvIGJlIGNvbmZ1c2VkLg0K
PiA+DQo+IA0KPiBvaw0KPiANCj4gPiBbLi4uXQ0KPiA+ID4gPiA+ICAJaWYgKHJldCkNCj4gPiA+
ID4gPiAgCQlnb3RvIG91dF9jbGVhbl92Z3B1X21taW87DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiAt
CXBvcHVsYXRlX3B2aW5mb19wYWdlKHZncHUpOw0KPiA+ID4gPiA+ICsJaWYgKCFkZWxheV9yZXNf
YWxsb2MpIHsNCj4gPiA+ID4gPiArCQlyZXQgPSBpbnRlbF92Z3B1X3Jlc19hbGxvYyh2Z3B1KTsN
Cj4gPiA+ID4gPiArCQlpZiAocmV0KQ0KPiA+ID4gPiA+ICsJCQlnb3RvIG91dF9jbGVhbl92Z3B1
X21taW87DQo+ID4gPiA+ID4gKwl9DQo+ID4gPiA+DQo+ID4gPiA+IElmIGRlbGF5ZWQgcmVzb3Vy
Y2UgYWxsb2NhdGlvbiB3b3JrcyBjb3JyZWN0bHksIHdoeSBkbyB3ZSBzdGlsbA0KPiA+ID4gPiBu
ZWVkIHN1cHBvcnQgbm9uLWRlbGF5ZWQgZmxhdm9yPyBFdmVuIGEgdHlwZSBkb2Vzbid0IHN1cHBv
cnQNCj4gPiA+ID4gYWdncmVnYXRpb24sIGl0IGRvZXNuJ3QgaHVydCB0byBkbyBhbGxvY2F0aW9u
IHVudGlsIG1kZXYgb3Blbi4uLg0KPiA+ID4gPg0KPiA+ID4NCj4gPiA+IFRoZSBkaWZmZXJlbmNl
IGlzIHVzZXIgZXhwZWN0YXRpb24gSSB0aGluaywgaWYgdGhlcmUncyByZWFsbHkNCj4gPiA+IGF3
YXJlbmVzcyBvZiB0aGlzLiBBcyBvcmlnaW5hbCB3YXkgaXMgdG8gYWxsb2NhdGUgYXQgY3JlYXQg
dGltZSwgc28NCj4gPiA+IG9uY2UgY3JlYXRlZCBzdWNjZXNzLCByZXNvdXJjZSBpcyBndWFyYW50
ZWVkLiBCdXQgZm9yIGFnZ3JlZ2F0aW9uIHR5cGUNCj4gPiA+IHdoaWNoIGNvdWxkIGJlIGNoYW5n
ZWQgYmVmb3JlIG9wZW4sIGFsbG9jIGhhcHBlbnMgYXQgdGhhdCB0aW1lIHdoaWNoDQo+ID4gPiBt
YXkgaGF2ZSBkaWZmZXJlbnQgc2NlbmFyaW8sIGUuZyBtaWdodCBmYWlsIGNhdXNlZCBieSBvdGhl
ciBpbnN0YW5jZQ0KPiA+ID4gb3IgaG9zdC4gU28gb3JpZ2luYWwgaWRlYSBpcyB0byBrZWVwIG9s
ZCBiZWhhdmlvciBidXQgb25seSBjaGFuZ2UgZm9yDQo+ID4gPiBhZ2dyZWdhdGlvbiB0eXBlLg0K
PiA+DQo+ID4gYnV0IGhvdyBjb3VsZCBvbmUgZXhwZWN0IGFueSBkaWZmZXJlbmNlIGJldHdlZW4g
aW5zdGFudCBhbGxvY2F0aW9uDQo+ID4gYW5kIGRlbGF5ZWQgYWxsb2NhdGlvbj8gWW91IGFscmVh
ZHkgdXBkYXRlIHJlc291cmNlIGFjY291bnRpbmcgc28NCj4gPiB0aGUgcmVtYWluaW5nIGluc3Rh
bmNlcyBhcmUgYWNjdXJhdGUgYW55d2F5LiBUaGVuIHRoZSB1c2VyIG9ubHkga25vd3MNCj4gPiBo
b3cgdGhlIHZncHUgbG9va3MgbGlrZSB3aGVuIGl0IGlzIG9wZW5lZC4uLg0KPiA+DQo+ID4gPg0K
PiA+ID4gSWYgd2UgdGhpbmsgdGhpcyB1c2VyIGV4cGVjdGF0aW9uIGlzIG5vdCBpbXBvcnRhbnQs
IGRlbGF5ZWQgYWxsb2MNCj4gPiA+IGNvdWxkIGhlbHAgdG8gY3JlYXRlIHZncHUgcXVpY2tseSBi
dXQgbWF5IGhhdmUgbW9yZSBjaGFuY2UgdG8gZmFpbA0KPiA+ID4gbGF0ZXIuLg0KPiA+ID4NCj4g
Pg0KPiA+IHdoeT8gSWYgZGVsYXllZCBhbGxvY2F0aW9uIGhhcyBtb3JlIGNoYW5jZSB0byBmYWls
LCBpdCBtZWFucyBvdXINCj4gPiByZXNvdXJjZSBhY2NvdW50aW5nIGhhcyBwcm9ibGVtLiBFdmVu
IGZvciB0eXBlIHcvbyBhZ2dyZWdhdGlvbg0KPiA+IGNhcGFiaWxpdHksIHdlIHNob3VsZCByZXNl
cnZlIG9uZSBpbnN0YW5jZSByZXNvdXJjZSBieSBkZWZhdWx0IGFueXdheQ0KPiA+DQo+IA0KPiBJ
ZiB1bmRlciByZWFsbHkgaGVhdnkgbG9hZCBvZiBob3N0IGFuZCBtYW55IG90aGVyIHZncHUgcnVu
bmluZywgd2UNCj4gbWlnaHQgbm90IGhhdmUgbGVmdCBjb250aW51YWwgZ2Z4IG1lbSBzcGFjZS4u
VGhpcyBpcyBub3QgbmV3IHByb2JsZW0sDQo+IGp1c3QgdGhhdCBub3cgd2UgaGFuZGxlIGl0IGF0
IHZncHUgY3JlYXRlIHRpbWUgdG8gcmVzZXJ2ZSB0aGUNCj4gcmVzb3VyY2UuIE9uY2UgaG9zdCBz
aWRlIGNvdWxkIHByb21pc2Ugc29tZSBsaW1pdCwgdGhlbiBvdXIgdXNhZ2UNCj4gd2lsbCBiZSBn
dWFyYW50ZWVkLg0KPiANCg0KaGVhdnkgbG9hZCBkb2Vzbid0IG1lYW4gdGhhdCB5b3UgbWF5IGhh
dmUgaGlnaGVyIHBvc3NpYmlsaXR5IG9mDQpzZWN1cmluZyByZXNvdXJjZSBhdCBhIGVhcmxpZXIg
cG9pbnQuIEl0J3MgY29tcGxldGVseSBub25kZXRlcm1pbmlzdGljDQp3aGVuIHRoZSBzaXR1YXRp
b24gaXMgd29yc2Ugb3IgYmV0dGVyLiBJbiBzdWNoIGNhc2UgSSBkb24ndCB0aGluayANCnRoZXJl
IGlzIHN1YnRsZSBkaWZmZXJlbmNlIGJldHdlZW4gaW5zdGFudCBhbmQgZGVsYXllZCBhbGxvY2F0
aW9uLA0Kd2hpbGUgdW5pZnlpbmcgb24gZGVsYXllZCBhbGxvY2F0aW9uIGNvdWxkIHNpbXBsaWZ5
IG91ciBjb2RlLiDwn5iKDQoNClRoYW5rcw0KS2V2aW4NCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVs
LWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldgo=
