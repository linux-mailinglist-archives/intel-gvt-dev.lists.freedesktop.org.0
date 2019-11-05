Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6739EF3DA
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  5 Nov 2019 04:16:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9546A6E8DD;
	Tue,  5 Nov 2019 03:16:21 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E31FC6E8DD
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  5 Nov 2019 03:16:20 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Nov 2019 19:16:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,269,1569308400"; d="scan'208";a="204831464"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by orsmga003.jf.intel.com with ESMTP; 04 Nov 2019 19:16:20 -0800
Received: from fmsmsx152.amr.corp.intel.com (10.18.125.5) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 4 Nov 2019 19:16:19 -0800
Received: from shsmsx153.ccr.corp.intel.com (10.239.6.53) by
 FMSMSX152.amr.corp.intel.com (10.18.125.5) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 4 Nov 2019 19:16:19 -0800
Received: from shsmsx101.ccr.corp.intel.com ([169.254.1.213]) by
 SHSMSX153.ccr.corp.intel.com ([169.254.12.215]) with mapi id 14.03.0439.000;
 Tue, 5 Nov 2019 11:16:17 +0800
From: "Zhang, Tina" <tina.zhang@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: RE: [PATCH] drm/i915/gvt: Stop initializing pvinfo through reading
 mmio
Thread-Topic: [PATCH] drm/i915/gvt: Stop initializing pvinfo through reading
 mmio
Thread-Index: AQHVktF+KjaG6B25lEadg0I5IZ0itqd7XNWAgACK32A=
Date: Tue, 5 Nov 2019 03:16:16 +0000
Message-ID: <237F54289DF84E4997F34151298ABEBC87799F55@SHSMSX101.ccr.corp.intel.com>
References: <20191104053148.7161-1-tina.zhang@intel.com>
 <20191105025407.GC1769@zhen-hp.sh.intel.com>
In-Reply-To: <20191105025407.GC1769@zhen-hp.sh.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNzJmMDc1ODQtNWVhOC00M2JlLThmN2ItZmQ0NzMzM2IxMjU4IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoidzV2bDBqOEVtRTl1SW1yWlNcL0t3NlVZSFdVWEJ3ZjBUV1RmbHZ2RUp2RHUxTjNMcnVvdXZ6SW5qZDF2UEJVd3IifQ==
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
Cc: "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Cgo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gRnJvbTogWmhlbnl1IFdhbmcgPHpoZW55
dXdAbGludXguaW50ZWwuY29tPgo+IFNlbnQ6IFR1ZXNkYXksIE5vdmVtYmVyIDUsIDIwMTkgMTA6
NTQgQU0KPiBUbzogWmhhbmcsIFRpbmEgPHRpbmEuemhhbmdAaW50ZWwuY29tPgo+IENjOiBpbnRl
bC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGRy
bS9pOTE1L2d2dDogU3RvcCBpbml0aWFsaXppbmcgcHZpbmZvIHRocm91Z2ggcmVhZGluZwo+IG1t
aW8KPiAKPiBPbiAyMDE5LjExLjA0IDEzOjMxOjQ4ICswODAwLCBUaW5hIFpoYW5nIHdyb3RlOgo+
ID4gVGhlIHJlZ2lvbiBvZiBwdmluZm8gaXMgcmVzZXJ2ZWQgZm9yIGNvbW11bmljYXRpb24gYmV0
d2VlbiBhIFZNTSBhbmQKPiA+IHRoZSBHUFUgZHJpdmVyIGV4ZWN1dGluZyBvbiBhIHZpcnR1YWwg
bWFjaGluZS4gSFcgZG9lc24ndCBoYXZlIGFueQo+ID4gYmFja2luZyBtbWlvIHN0b3JlIHN1cHBv
cnQgZm9yIHRoZSBwdmluZm8gcmVnaW9uLCB0aHVzIGFjY2Vzc2luZyB0bwo+ID4gdGhpcyByYW5n
ZSB0aHJvdWdoIE1NSU8gcmVhZC93cml0ZSBmcm9tIGhvc3Qgc2lkZSBpcyBmb3JiaWRkZW4gd2hp
Y2gKPiA+IGlzIHJlZ2FyZGVkIGFzIHVuY2xhaW1lZCByZWdpc3RlciBhY2Nlc3MuCj4gPgo+ID4g
VGhpcyBwYXRjaCBsZWF2ZXMgcHZpbmZvIHJhbmdlIGJlIGluaXRpYWxpemVkIHdpdGggemVyby4K
PiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBUaW5hIFpoYW5nIDx0aW5hLnpoYW5nQGludGVsLmNvbT4K
PiA+IC0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9oYW5kbGVycy5jIHwgNCArKysr
Cj4gPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaGFuZGxlcnMuYwo+ID4gYi9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9ndnQvaGFuZGxlcnMuYwo+ID4gaW5kZXggYWZkN2Y2NmJkYzJkLi5iZDEyYWYzNDkx
MjMgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaGFuZGxlcnMuYwo+
ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRsZXJzLmMKPiA+IEBAIC0zNDIw
LDYgKzM0MjAsMTAgQEAgaW50IGludGVsX2d2dF9mb3JfZWFjaF90cmFja2VkX21taW8oc3RydWN0
Cj4gaW50ZWxfZ3Z0ICpndnQsCj4gPiAgCX0KPiA+Cj4gPiAgCWZvciAoaSA9IDA7IGkgPCBndnQt
Pm1taW8ubnVtX21taW9fYmxvY2s7IGkrKywgYmxvY2srKykgewo+ID4gKwkJLyogcHZpbmZvIGRh
dGEgZG9lc24ndCBjb21lIGZyb20gaHcgbW1pbyAqLwo+ID4gKwkJaWYgKGk5MTVfbW1pb19yZWdf
b2Zmc2V0KGJsb2NrLT5vZmZzZXQpID09Cj4gVkdUX1BWSU5GT19QQUdFKQo+ID4gKwkJCWNvbnRp
bnVlOwo+IAo+IEVxdWFsIHRvIHJlbW92ZSBQVklORk8gaW4gbW1pb19ibG9jayBsaXN0PyBDb3Vs
ZCB3ZSBqdXN0IHJlbW92ZSBpdCB0aGVyZQo+IGluc3RlYWQgb2YgdGhpcyBzcGVjaWFsIGNhc2U/
CkNvbW1pdCA2NWY5ZjZmZWIgd2FudGVkIGl0IHRvIGJlIGtlcHQgaW4gaW4gbW1pb19ibG9jayBm
b3IgcGVyZm9ybWFuY2UgY29uc2lkZXJhdGlvbi4gVGhhbmtzLgoKQlIsClRpbmEKPiA+ICsKPiA+
ICAJCWZvciAoaiA9IDA7IGogPCBibG9jay0+c2l6ZTsgaiArPSA0KSB7Cj4gPiAgCQkJcmV0ID0g
aGFuZGxlcihndnQsCj4gPiAgCQkJCSAgICAgIGk5MTVfbW1pb19yZWdfb2Zmc2V0KGJsb2NrLT5v
ZmZzZXQpICsgaiwKPiA+IC0tCj4gPiAyLjE3LjEKPiA+Cj4gCj4gLS0KPiBPcGVuIFNvdXJjZSBU
ZWNobm9sb2d5IENlbnRlciwgSW50ZWwgbHRkLgo+IAo+ICRncGcgLS1rZXlzZXJ2ZXIgd3d3a2V5
cy5wZ3AubmV0IC0tcmVjdi1rZXlzIDRENzgxODI3Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
