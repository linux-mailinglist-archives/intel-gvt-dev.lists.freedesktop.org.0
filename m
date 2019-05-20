Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA1222A99
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 20 May 2019 06:13:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49EB9891BA;
	Mon, 20 May 2019 04:13:25 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92CCE891BA
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 20 May 2019 04:13:23 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 May 2019 21:13:23 -0700
X-ExtLoop1: 1
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by orsmga002.jf.intel.com with ESMTP; 19 May 2019 21:13:22 -0700
Received: from fmsmsx111.amr.corp.intel.com (10.18.116.5) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Sun, 19 May 2019 21:13:22 -0700
Received: from shsmsx103.ccr.corp.intel.com (10.239.4.69) by
 fmsmsx111.amr.corp.intel.com (10.18.116.5) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Sun, 19 May 2019 21:13:22 -0700
Received: from shsmsx101.ccr.corp.intel.com ([169.254.1.129]) by
 SHSMSX103.ccr.corp.intel.com ([169.254.4.70]) with mapi id 14.03.0415.000;
 Mon, 20 May 2019 12:13:20 +0800
From: "Zhang, Tina" <tina.zhang@intel.com>
To: "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>
Subject: RE: [PATCH] drm/i915/gvt: Initialize intel_gvt_gtt_entry in stack
Thread-Topic: [PATCH] drm/i915/gvt: Initialize intel_gvt_gtt_entry in stack
Thread-Index: AQHVC9E7nCTJ0+KPuUW6vbYFEbXDeKZzbCcg
Date: Mon, 20 May 2019 04:13:20 +0000
Message-ID: <237F54289DF84E4997F34151298ABEBC87618672@SHSMSX101.ccr.corp.intel.com>
References: <1558001806-28225-1-git-send-email-tina.zhang@intel.com>
In-Reply-To: <1558001806-28225-1-git-send-email-tina.zhang@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYmQ1YmU0Y2MtNDYwNC00ZTJlLWFjYjAtY2Q5NWI1ODA2MTJmIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoia1hpVzFWMmZmdHNzaWNTSitTXC85NDJGOUVHS2hUZ0hzNGtFUFptSDN0MTJvVVNkTElwQjFnSUM2WUZ5S3MrOEQifQ==
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
Cc: "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

SSdtIGdvaW5nIHRvIHN1Ym1pdCBhIHBhdGNoLXNldCB3aGljaCBpbnRyb2R1Y2VzIHNldF9nZ3R0
X2VudHJ5IHRyYWNpbmcgcG9pbnQuCkZvcm0gdGhhdCBwYXRjaC1zZXQsIHdlIGNhbiBlYXNpbHkg
c2VlIHdoeSB0aGlzIHBhdGNoIGlzIG5lZWRlZC4KCkJSLApUaW5hCgo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tCj4gRnJvbTogWmhhbmcsIFRpbmEKPiBTZW50OiBUaHVyc2RheSwgTWF5IDE2
LCAyMDE5IDY6MTcgUE0KPiBUbzogemhlbnl1d0BsaW51eC5pbnRlbC5jb20KPiBDYzogWmhhbmcs
IFRpbmEgPHRpbmEuemhhbmdAaW50ZWwuY29tPjsgaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKPiBTdWJqZWN0OiBbUEFUQ0hdIGRybS9pOTE1L2d2dDogSW5pdGlhbGl6ZSBpbnRl
bF9ndnRfZ3R0X2VudHJ5IGluIHN0YWNrCj4gCj4gSW4gc3RhY2ssIGludGVsX2d2dF9ndHRfZW50
cnkgdmFsdWVzIG5lZWQgdG8gYmUgaW5pdGlhbGl6ZWQgYmVmb3JlIGJlaW5nIHVzZWQuCj4gCj4g
U2lnbmVkLW9mZi1ieTogVGluYSBaaGFuZyA8dGluYS56aGFuZ0BpbnRlbC5jb20+Cj4gLS0tCj4g
IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuYyB8IDcgKysrKystLQo+ICAxIGZpbGUgY2hh
bmdlZCwgNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQv
Z3R0LmMKPiBpbmRleCBjMmY3ZDIwLi42ZGY2ZTBiIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2d2dC9ndHQuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQu
Ywo+IEBAIC0yMTkyLDcgKzIxOTIsNyBAQCBzdGF0aWMgaW50IGVtdWxhdGVfZ2d0dF9tbWlvX3dy
aXRlKHN0cnVjdAo+IGludGVsX3ZncHUgKnZncHUsIHVuc2lnbmVkIGludCBvZmYsCj4gIAkvKiB0
aGUgVk0gbWF5IGNvbmZpZ3VyZSB0aGUgd2hvbGUgR00gc3BhY2Ugd2hlbiBiYWxsb29uaW5nIGlz
Cj4gdXNlZCAqLwo+ICAJaWYgKCF2Z3B1X2dtYWRyX2lzX3ZhbGlkKHZncHUsIGdtYSkpCj4gIAkJ
cmV0dXJuIDA7Cj4gLQo+ICsJZS52YWw2NCA9IDA7Cj4gIAllLnR5cGUgPSBHVFRfVFlQRV9HR1RU
X1BURTsKPiAgCW1lbWNweSgodm9pZCAqKSZlLnZhbDY0ICsgKG9mZiAmIChpbmZvLT5ndHRfZW50
cnlfc2l6ZSAtIDEpKSwgcF9kYXRhLAo+ICAJCQlieXRlcyk7Cj4gQEAgLTIyNDUsNyArMjI0NSw4
IEBAIHN0YXRpYyBpbnQgZW11bGF0ZV9nZ3R0X21taW9fd3JpdGUoc3RydWN0Cj4gaW50ZWxfdmdw
dSAqdmdwdSwgdW5zaWduZWQgaW50IG9mZiwKPiAKPiAgCWlmICghcGFydGlhbF91cGRhdGUgJiYg
KG9wcy0+dGVzdF9wcmVzZW50KCZlKSkpIHsKPiAgCQlnZm4gPSBvcHMtPmdldF9wZm4oJmUpOwo+
IC0JCW0gPSBlOwo+ICsJCW0udmFsNjQgPSBlLnZhbDY0Owo+ICsJCW0udHlwZSA9IGUudHlwZTsK
PiAKPiAgCQkvKiBvbmUgUFRFIHVwZGF0ZSBtYXkgYmUgaXNzdWVkIGluIG11bHRpcGxlIHdyaXRl
cyBhbmQgdGhlCj4gIAkJICogZmlyc3Qgd3JpdGUgbWF5IG5vdCBjb25zdHJ1Y3QgYSB2YWxpZCBn
Zm4gQEAgLTIyNjcsNgo+ICsyMjY4LDggQEAgc3RhdGljIGludCBlbXVsYXRlX2dndHRfbW1pb193
cml0ZShzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSwKPiB1bnNpZ25lZCBpbnQgb2ZmLAo+ICAJCX0g
ZWxzZQo+ICAJCQlvcHMtPnNldF9wZm4oJm0sIGRtYV9hZGRyID4+IFBBR0VfU0hJRlQpOwo+ICAJ
fSBlbHNlIHsKPiArCQltLnZhbDY0ID0gMDsKPiArCQltLnR5cGUgPSBHVFRfVFlQRV9HR1RUX1BU
RTsKPiAgCQlvcHMtPnNldF9wZm4oJm0sIGd2dC0+Z3R0LnNjcmF0Y2hfbWZuKTsKPiAgCQlvcHMt
PmNsZWFyX3ByZXNlbnQoJm0pOwo+ICAJfQo+IC0tCj4gMi43LjQKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0
CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
