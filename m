Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C832B43424
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 13 Jun 2019 10:34:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CB2B890C2;
	Thu, 13 Jun 2019 08:34:42 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D6EC890C2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 13 Jun 2019 08:34:41 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Jun 2019 01:34:41 -0700
X-ExtLoop1: 1
Received: from fmsmsx104.amr.corp.intel.com ([10.18.124.202])
 by orsmga004.jf.intel.com with ESMTP; 13 Jun 2019 01:34:40 -0700
Received: from fmsmsx153.amr.corp.intel.com (10.18.125.6) by
 fmsmsx104.amr.corp.intel.com (10.18.124.202) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Thu, 13 Jun 2019 01:34:40 -0700
Received: from shsmsx151.ccr.corp.intel.com (10.239.6.50) by
 FMSMSX153.amr.corp.intel.com (10.18.125.6) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Thu, 13 Jun 2019 01:34:39 -0700
Received: from shsmsx101.ccr.corp.intel.com ([169.254.1.104]) by
 SHSMSX151.ccr.corp.intel.com ([169.254.3.246]) with mapi id 14.03.0439.000;
 Thu, 13 Jun 2019 16:34:38 +0800
From: "Li, Weinan Z" <weinan.z.li@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: RE: [PATCH] drm/i915/gvt: always return zero if read pvinfo failed
Thread-Topic: [PATCH] drm/i915/gvt: always return zero if read pvinfo failed
Thread-Index: AQHVIZYwi8Hcks20DEmeFRPReut4SqaYtvMAgACLRSA=
Date: Thu, 13 Jun 2019 08:34:37 +0000
Message-ID: <9BD218709B5F2A4F96F08B4A3B98A89773451256@SHSMSX101.ccr.corp.intel.com>
References: <20190613030517.30539-1-weinan.z.li@intel.com>
 <20190613081510.GN9684@zhen-hp.sh.intel.com>
In-Reply-To: <20190613081510.GN9684@zhen-hp.sh.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNTUyMWJkNzktNjVjZC00Yzc1LWJjZTgtYTI1NGZmMTBlZjZiIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjIuNS4xOCIsIlRydXN0ZWRMYWJlbEhhc2giOiJKZ2srbERDNCtJb1JaVVpnTFwvbjZTOURcL1k4Qnc3QzVaSm13ZDFGV1NKTmhiaWtydnk0ZDRWdVVsK2hXZFhYTGsifQ==
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
NDoxNSBQTQo+IFRvOiBMaSwgV2VpbmFuIFogPHdlaW5hbi56LmxpQGludGVsLmNvbT4KPiBDYzog
aW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBTdWJqZWN0OiBSZTogW1BBVENI
XSBkcm0vaTkxNS9ndnQ6IGFsd2F5cyByZXR1cm4gemVybyBpZiByZWFkIHB2aW5mbyBmYWlsZWQK
PiAKPiBPbiAyMDE5LjA2LjEzIDExOjA1OjE3ICswODAwLCBXZWluYW4gTGkgd3JvdGU6Cj4gPiBU
aGVyZSBpcyBwdmluZm8gcmVhZGluZyBjb21lIGZyb20gdmdwdSBtaWdodCBiZSBmYWlsZWQsIGxp
a2UgcmVhZGluZwo+ID4gZnJvbSBvbmUgdW5rbm93biBhZGRyZXNzLCBub3cgR1ZULWcgcmV0dXJu
cyB0aGUgdnJlZyB3aGljaCBpcyBvbmUKPiA+IHVuY2VydGFpbiB2YWx1ZS4gVG8gYXZvaWQgbWlz
dW5kZXJzdGFuZGluZywgR1ZULWcgd2lsbCBhbHdheXMgcmV0dXJuCj4gPiB6ZXJvIGlmIHJlYWRp
bmcgZmFpbGVkIG9jY3VycmVkLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFdlaW5hbiBMaSA8d2Vp
bmFuLnoubGlAaW50ZWwuY29tPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0
L2hhbmRsZXJzLmMgfCA3ICsrKysrLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9ndnQvaGFuZGxlcnMuYwo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaGFuZGxl
cnMuYwo+ID4gaW5kZXggYTZhZGU2NjM0OWJkLi5lYWI2NTdkNjUyNzYgMTAwNjQ0Cj4gPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaGFuZGxlcnMuYwo+ID4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZ3Z0L2hhbmRsZXJzLmMKPiA+IEBAIC0xMTk5LDkgKzExOTksMTIgQEAgc3Rh
dGljIGludCBwdmluZm9fbW1pb19yZWFkKHN0cnVjdCBpbnRlbF92Z3B1Cj4gKnZncHUsIHVuc2ln
bmVkIGludCBvZmZzZXQsCj4gPiAgCQlpbnZhbGlkX3JlYWQgPSB0cnVlOwo+ID4gIAkJYnJlYWs7
Cj4gPiAgCX0KPiA+IC0JaWYgKGludmFsaWRfcmVhZCkKPiA+IC0JCWd2dF92Z3B1X2VycigiaW52
YWxpZCBwdmluZm8gcmVhZDogWyV4OiV4XSA9ICV4XG4iLAo+ID4gKwlpZiAoaW52YWxpZF9yZWFk
KSB7Cj4gPiArCQlndnRfdmdwdV9lcnIoImludmFsaWQgcHZpbmZvIHJlYWQ6IFsweCV4OjB4JXhd
ID0gMHgwIGluc3RlYWQgb2YKPiA+ICsweCV4XG4iLAo+ID4gIAkJCQlvZmZzZXQsIGJ5dGVzLCAq
KHUzMiAqKXBfZGF0YSk7Cj4gPiArCQltZW1zZXQocF9kYXRhLCAwLCBieXRlcyk7Cj4gPiArCX0K
PiA+ICsKPiAKPiBTaG91bGRuJ3Qgd2UgbWFrZSBzdXJlIHRvIHNldCB6ZXJvIGZvciB1bmRlZmlu
ZWQgcHZpbmZvIG1lbW9yeT8KPiBJbnN0ZWFkIG9mIGtlZXAgc2V0dGluZyByZXR1cm4gdmFsdWUg
bGlrZSB0aGlzPwo+IApUaGVyZSBtaWdodCBiZSB1c2FnZSBsaWtlIHRoaXMsIHdyaXRlIGZpcnN0
IHRoZW4gcmVhZCBiYWNrIGFuZCBjaGVjayB0aGUgcmV0dXJuIHZhbHVlLgoKPiAtLQo+IE9wZW4g
U291cmNlIFRlY2hub2xvZ3kgQ2VudGVyLCBJbnRlbCBsdGQuCj4gCj4gJGdwZyAtLWtleXNlcnZl
ciB3d3drZXlzLnBncC5uZXQgLS1yZWN2LWtleXMgNEQ3ODE4MjcKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QK
aW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
