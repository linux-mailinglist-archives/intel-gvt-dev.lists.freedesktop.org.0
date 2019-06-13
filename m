Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4739A43450
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 13 Jun 2019 10:45:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F290E897F9;
	Thu, 13 Jun 2019 08:45:11 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FBF2897F9
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 13 Jun 2019 08:45:10 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Jun 2019 01:45:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,369,1557212400"; d="scan'208";a="184542864"
Received: from fmsmsx104.amr.corp.intel.com ([10.18.124.202])
 by fmsmga002.fm.intel.com with ESMTP; 13 Jun 2019 01:45:10 -0700
Received: from fmsmsx158.amr.corp.intel.com (10.18.116.75) by
 fmsmsx104.amr.corp.intel.com (10.18.124.202) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Thu, 13 Jun 2019 01:45:09 -0700
Received: from shsmsx107.ccr.corp.intel.com (10.239.4.96) by
 fmsmsx158.amr.corp.intel.com (10.18.116.75) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Thu, 13 Jun 2019 01:45:09 -0700
Received: from shsmsx101.ccr.corp.intel.com ([169.254.1.104]) by
 SHSMSX107.ccr.corp.intel.com ([169.254.9.173]) with mapi id 14.03.0439.000;
 Thu, 13 Jun 2019 16:45:03 +0800
From: "Li, Weinan Z" <weinan.z.li@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: RE: [PATCH] drm/i915/gvt: always return zero if read pvinfo failed
Thread-Topic: [PATCH] drm/i915/gvt: always return zero if read pvinfo failed
Thread-Index: AQHVIZYwi8Hcks20DEmeFRPReut4SqaYtvMAgACLRSD//3rAgIAAhtqw
Date: Thu, 13 Jun 2019 08:45:02 +0000
Message-ID: <9BD218709B5F2A4F96F08B4A3B98A89773451292@SHSMSX101.ccr.corp.intel.com>
References: <20190613030517.30539-1-weinan.z.li@intel.com>
 <20190613081510.GN9684@zhen-hp.sh.intel.com>
 <9BD218709B5F2A4F96F08B4A3B98A89773451256@SHSMSX101.ccr.corp.intel.com>
 <20190613083643.GO9684@zhen-hp.sh.intel.com>
In-Reply-To: <20190613083643.GO9684@zhen-hp.sh.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNzYyOTkzM2QtZmIzZC00N2Y5LWJlZWYtMGI0N2RmMmQyNjg0IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjIuNS4xOCIsIlRydXN0ZWRMYWJlbEhhc2giOiJGbFlNSXdNb2hYRlBSbXY2YklONU1TdlhTRGhJTU5Kem9WVWp4dzB4VHZsc2lVempGNDhzVHFzSFN4RVpxSjJaIn0=
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
Cc: "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFpoZW55dSBXYW5nIFttYWlsdG86
emhlbnl1d0BsaW51eC5pbnRlbC5jb21dCj4gU2VudDogVGh1cnNkYXksIEp1bmUgMTMsIDIwMTkg
NDozNyBQTQo+IFRvOiBMaSwgV2VpbmFuIFogPHdlaW5hbi56LmxpQGludGVsLmNvbT4KPiBDYzog
aW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBTdWJqZWN0OiBSZTogW1BBVENI
XSBkcm0vaTkxNS9ndnQ6IGFsd2F5cyByZXR1cm4gemVybyBpZiByZWFkIHB2aW5mbyBmYWlsZWQK
PiAKPiBPbiAyMDE5LjA2LjEzIDA4OjM0OjM3ICswMDAwLCBMaSwgV2VpbmFuIFogd3JvdGU6Cj4g
PiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gPiA+IEZyb206IFpoZW55dSBXYW5nIFtt
YWlsdG86emhlbnl1d0BsaW51eC5pbnRlbC5jb21dCj4gPiA+IFNlbnQ6IFRodXJzZGF5LCBKdW5l
IDEzLCAyMDE5IDQ6MTUgUE0KPiA+ID4gVG86IExpLCBXZWluYW4gWiA8d2VpbmFuLnoubGlAaW50
ZWwuY29tPgo+ID4gPiBDYzogaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+
ID4gU3ViamVjdDogUmU6IFtQQVRDSF0gZHJtL2k5MTUvZ3Z0OiBhbHdheXMgcmV0dXJuIHplcm8g
aWYgcmVhZCBwdmluZm8KPiA+ID4gZmFpbGVkCj4gPiA+Cj4gPiA+IE9uIDIwMTkuMDYuMTMgMTE6
MDU6MTcgKzA4MDAsIFdlaW5hbiBMaSB3cm90ZToKPiA+ID4gPiBUaGVyZSBpcyBwdmluZm8gcmVh
ZGluZyBjb21lIGZyb20gdmdwdSBtaWdodCBiZSBmYWlsZWQsIGxpa2UKPiA+ID4gPiByZWFkaW5n
IGZyb20gb25lIHVua25vd24gYWRkcmVzcywgbm93IEdWVC1nIHJldHVybnMgdGhlIHZyZWcgd2hp
Y2gKPiA+ID4gPiBpcyBvbmUgdW5jZXJ0YWluIHZhbHVlLiBUbyBhdm9pZCBtaXN1bmRlcnN0YW5k
aW5nLCBHVlQtZyB3aWxsCj4gPiA+ID4gYWx3YXlzIHJldHVybiB6ZXJvIGlmIHJlYWRpbmcgZmFp
bGVkIG9jY3VycmVkLgo+ID4gPiA+Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogV2VpbmFuIExpIDx3
ZWluYW4uei5saUBpbnRlbC5jb20+Cj4gPiA+ID4gLS0tCj4gPiA+ID4gIGRyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2d2dC9oYW5kbGVycy5jIHwgNyArKysrKy0tCj4gPiA+ID4gIDEgZmlsZSBjaGFuZ2Vk
LCA1IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPiA+ID4KPiA+ID4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRsZXJzLmMKPiA+ID4gPiBiL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2d2dC9oYW5kbGVycy5jCj4gPiA+ID4gaW5kZXggYTZhZGU2NjM0OWJk
Li5lYWI2NTdkNjUyNzYgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUv
Z3Z0L2hhbmRsZXJzLmMKPiA+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaGFu
ZGxlcnMuYwo+ID4gPiA+IEBAIC0xMTk5LDkgKzExOTksMTIgQEAgc3RhdGljIGludCBwdmluZm9f
bW1pb19yZWFkKHN0cnVjdAo+ID4gPiA+IGludGVsX3ZncHUKPiA+ID4gKnZncHUsIHVuc2lnbmVk
IGludCBvZmZzZXQsCj4gPiA+ID4gIAkJaW52YWxpZF9yZWFkID0gdHJ1ZTsKPiA+ID4gPiAgCQli
cmVhazsKPiA+ID4gPiAgCX0KPiA+ID4gPiAtCWlmIChpbnZhbGlkX3JlYWQpCj4gPiA+ID4gLQkJ
Z3Z0X3ZncHVfZXJyKCJpbnZhbGlkIHB2aW5mbyByZWFkOiBbJXg6JXhdID0gJXhcbiIsCj4gPiA+
ID4gKwlpZiAoaW52YWxpZF9yZWFkKSB7Cj4gPiA+ID4gKwkJZ3Z0X3ZncHVfZXJyKCJpbnZhbGlk
IHB2aW5mbyByZWFkOiBbMHgleDoweCV4XSA9IDB4MCBpbnN0ZWFkCj4gb2YKPiA+ID4gPiArMHgl
eFxuIiwKPiA+ID4gPiAgCQkJCW9mZnNldCwgYnl0ZXMsICoodTMyICopcF9kYXRhKTsKPiA+ID4g
PiArCQltZW1zZXQocF9kYXRhLCAwLCBieXRlcyk7Cj4gPiA+ID4gKwl9Cj4gPiA+ID4gKwo+ID4g
Pgo+ID4gPiBTaG91bGRuJ3Qgd2UgbWFrZSBzdXJlIHRvIHNldCB6ZXJvIGZvciB1bmRlZmluZWQg
cHZpbmZvIG1lbW9yeT8KPiA+ID4gSW5zdGVhZCBvZiBrZWVwIHNldHRpbmcgcmV0dXJuIHZhbHVl
IGxpa2UgdGhpcz8KPiA+ID4KPiA+IFRoZXJlIG1pZ2h0IGJlIHVzYWdlIGxpa2UgdGhpcywgd3Jp
dGUgZmlyc3QgdGhlbiByZWFkIGJhY2sgYW5kIGNoZWNrIHRoZQo+IHJldHVybiB2YWx1ZS4KPiA+
Cj4gCj4geWVhaCwgYmV0dGVyIHdlIGNhbiBmb2xsb3cgbGlrZSByZXNlcnZlZCBiaXQgZGVmaW5p
dGlvbiwgZGlzY2FyZCB3cml0ZSBmb3IKPiB1bmRlZmluZWQgYml0cyBhbmQgcmV0dXJuIHplcm8u
Cj4gCkRvIHlvdSBtZWFuIGFkZCB3cml0ZSBkYXRhIHZlcmlmaWNhdGlvbiBpbiBwdmluZm9fbW1p
b193cml0ZT8gYW5kIGxldCBmcmVlIHJlYWQ/Cgo+IC0tCj4gT3BlbiBTb3VyY2UgVGVjaG5vbG9n
eSBDZW50ZXIsIEludGVsIGx0ZC4KPiAKPiAkZ3BnIC0ta2V5c2VydmVyIHd3d2tleXMucGdwLm5l
dCAtLXJlY3Yta2V5cyA0RDc4MTgyNwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
