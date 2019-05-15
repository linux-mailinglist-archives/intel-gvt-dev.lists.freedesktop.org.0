Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B2E1E834
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 15 May 2019 08:20:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07542894E3;
	Wed, 15 May 2019 06:20:23 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DE36894E3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 15 May 2019 06:20:22 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 May 2019 23:20:21 -0700
X-ExtLoop1: 1
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
 by orsmga001.jf.intel.com with ESMTP; 14 May 2019 23:20:20 -0700
Received: from fmsmsx117.amr.corp.intel.com (10.18.116.17) by
 FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Tue, 14 May 2019 23:20:20 -0700
Received: from shsmsx151.ccr.corp.intel.com (10.239.6.50) by
 fmsmsx117.amr.corp.intel.com (10.18.116.17) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Tue, 14 May 2019 23:20:20 -0700
Received: from shsmsx107.ccr.corp.intel.com ([169.254.9.7]) by
 SHSMSX151.ccr.corp.intel.com ([169.254.3.216]) with mapi id 14.03.0415.000;
 Wed, 15 May 2019 14:20:18 +0800
From: "Zhang, Xiaolin" <xiaolin.zhang@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [PATCH] drm/i915/gvt: cancel dma map only for not present ggtt
 entry
Thread-Topic: [PATCH] drm/i915/gvt: cancel dma map only for not present ggtt
 entry
Thread-Index: AQHVCuPU9Mv8AQNBe0Wghrh0gVTZzw==
Date: Wed, 15 May 2019 06:20:18 +0000
Message-ID: <073732E20AE4C540AE91DBC3F07D44608765CDBB@SHSMSX107.ccr.corp.intel.com>
References: <20190515060559.7506-1-xiaolin.zhang@intel.com>
 <20190515060734.GT12913@zhen-hp.sh.intel.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.4.80]
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

T24gMDUvMTUvMjAxOSAwMjowOCBQTSwgWmhlbnl1IFdhbmcgd3JvdGU6Cj4gT24gMjAxOS4wNS4x
NSAxNDowNTo1OSArMDgwMCwgWGlhb2xpbiBaaGFuZyB3cm90ZToKPj4gb25seSBjYW5jZWwgZ2d0
dCBlbnRyeSBkbWEgbWFwIGZvciBpbnZhbGlkIGdndHQgZW50cnksIGRvbid0IGRvIGl0Cj4+IGZv
ciBwYXJpdGlhbCB1cGRhdGUgb3Igb2xkIGdndHQgZW50cnkuCj4+Cj4+IHRoaXMgY2hhbmdlIGNh
biBhZGRyZXNzIERNQSAiZmF1bHQgcmVhc29uIDIzIiBpc3N1ZSBmb3Igd2luIGd1ZXN0IHdpdGgK
Pj4gaW50ZWwgaW9tbXUgb24uCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFhpYW9saW4gWmhhbmcgPHhp
YW9saW4uemhhbmdAaW50ZWwuY29tPgo+PiAtLS0KPj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2
dC9ndHQuYyB8IDE3ICsrKysrKystLS0tLS0tLS0tCj4+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNl
cnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2d2dC9ndHQuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuYwo+PiBp
bmRleCBjMmY3ZDIwZjYzNDYuLjZkMDIxZDgzMGYzNyAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZ3Z0L2d0dC5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9n
dHQuYwo+PiBAQCAtMjI0Myw3ICsyMjQzLDEyIEBAIHN0YXRpYyBpbnQgZW11bGF0ZV9nZ3R0X21t
aW9fd3JpdGUoc3RydWN0IGludGVsX3ZncHUgKnZncHUsIHVuc2lnbmVkIGludCBvZmYsCj4+ICAJ
CX0KPj4gIAl9Cj4+ICAKPj4gLQlpZiAoIXBhcnRpYWxfdXBkYXRlICYmIChvcHMtPnRlc3RfcHJl
c2VudCgmZSkpKSB7Cj4+ICsJaWYgKCFvcHMtPnRlc3RfcHJlc2VudCgmZSkpIHsKPj4gKwkJZ2d0
dF9nZXRfaG9zdF9lbnRyeShnZ3R0X21tLCAmbSwgZ19ndHRfaW5kZXgpOwo+PiArCQlnZ3R0X2lu
dmFsaWRhdGVfcHRlKHZncHUsICZtKTsKPj4gKwkJb3BzLT5zZXRfcGZuKCZtLCBndnQtPmd0dC5z
Y3JhdGNoX21mbik7Cj4+ICsJCW9wcy0+Y2xlYXJfcHJlc2VudCgmbSk7Cj4+ICsJfSBlbHNlIGlm
ICghcGFydGlhbF91cGRhdGUgJiYgKG9wcy0+dGVzdF9wcmVzZW50KCZlKSkpIHsKPj4gIAkJZ2Zu
ID0gb3BzLT5nZXRfcGZuKCZlKTsKPj4gIAkJbSA9IGU7Cj4gSSB0aGluayB0aGlzIG1ha2VzIGNv
bmRpdGlvbiBjaGVjayBhIGJpdCBjdW1iZXJzb21lLCBhcyB0aGUgc3BlY2lhbCBjYXNlCj4geW91
IG5lZWQgdG8gaGFuZGxlIGlzIGZvciBwYXJ0aWFsX3VwZGF0ZSBpbnN0ZWFkIG9mIHRlc3RfcHJl
c2VudC4KSSBhZ3JlZSB3aXRoIHRvIHJlbW92ZSB0aGlzIGFkZGl0aW9uYWwgdGVzdF9wcmVzZW50
IGNoZWNrIGluICJlbHNlIGlmIgphbmQgSSB3aWxsIHJlbW92ZSBpdCBhbmQgdGhlbiBkbyBtb3Jl
IHRlc3QuCj4+ICAKPj4gQEAgLTIyNjYsMTkgKzIyNzEsMTEgQEAgc3RhdGljIGludCBlbXVsYXRl
X2dndHRfbW1pb193cml0ZShzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSwgdW5zaWduZWQgaW50IG9m
ZiwKPj4gIAkJCW9wcy0+c2V0X3BmbigmbSwgZ3Z0LT5ndHQuc2NyYXRjaF9tZm4pOwo+PiAgCQl9
IGVsc2UKPj4gIAkJCW9wcy0+c2V0X3BmbigmbSwgZG1hX2FkZHIgPj4gUEFHRV9TSElGVCk7Cj4+
IC0JfSBlbHNlIHsKPj4gLQkJb3BzLT5zZXRfcGZuKCZtLCBndnQtPmd0dC5zY3JhdGNoX21mbik7
Cj4+IC0JCW9wcy0+Y2xlYXJfcHJlc2VudCgmbSk7Cj4+ICAJfQo+PiAtCj4+ICBvdXQ6Cj4+IC0J
Z2d0dF9zZXRfZ3Vlc3RfZW50cnkoZ2d0dF9tbSwgJmUsIGdfZ3R0X2luZGV4KTsKPj4gLQo+PiAt
CWdndHRfZ2V0X2hvc3RfZW50cnkoZ2d0dF9tbSwgJmUsIGdfZ3R0X2luZGV4KTsKPj4gLQlnZ3R0
X2ludmFsaWRhdGVfcHRlKHZncHUsICZlKTsKPiBDYW4gd2UgZG8gdW5tYXAgZm9yICFwYXJ0aWFs
X3VwZGF0ZSBvbmx5IGFuZCByZW1vdmUgYWJvdmUgY2xlYXJfcHJlc2VudD8KPiBTbyBzdGlsbCB1
c2Ugc2NyYXRjaCBmb3IgaG9zdCBpbiBjYXNlIG9mIHBhcnRpYWwgdXBkYXRlLgo+Cj4+IC0KPj4g
IAlnZ3R0X3NldF9ob3N0X2VudHJ5KGdndHRfbW0sICZtLCBnX2d0dF9pbmRleCk7Cj4+ICAJZ2d0
dF9pbnZhbGlkYXRlKGd2dC0+ZGV2X3ByaXYpOwo+PiArCWdndHRfc2V0X2d1ZXN0X2VudHJ5KGdn
dHRfbW0sICZlLCBnX2d0dF9pbmRleCk7Cj4+ICAJcmV0dXJuIDA7Cj4+ICB9Cj4+ICAKPj4gLS0g
Cj4+IDIuMTUuMQo+PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9pbnRlbC1ndnQtZGV2
