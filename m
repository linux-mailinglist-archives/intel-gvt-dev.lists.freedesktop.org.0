Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC581FDCB
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 16 May 2019 04:52:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7466E89237;
	Thu, 16 May 2019 02:52:34 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3675189237
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 16 May 2019 02:52:33 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 May 2019 19:52:32 -0700
X-ExtLoop1: 1
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by orsmga007.jf.intel.com with ESMTP; 15 May 2019 19:52:33 -0700
Received: from fmsmsx156.amr.corp.intel.com (10.18.116.74) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Wed, 15 May 2019 19:52:32 -0700
Received: from shsmsx108.ccr.corp.intel.com (10.239.4.97) by
 fmsmsx156.amr.corp.intel.com (10.18.116.74) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Wed, 15 May 2019 19:52:31 -0700
Received: from shsmsx107.ccr.corp.intel.com ([169.254.9.7]) by
 SHSMSX108.ccr.corp.intel.com ([169.254.8.126]) with mapi id 14.03.0415.000;
 Thu, 16 May 2019 10:52:30 +0800
From: "Zhang, Xiaolin" <xiaolin.zhang@intel.com>
To: "Zhang, Xiong Y" <xiong.y.zhang@intel.com>, Zhenyu Wang
 <zhenyuw@linux.intel.com>
Subject: Re: [PATCH v2] drm/i915/gvt: cancel dma map only for not present
 ggtt entry
Thread-Topic: [PATCH v2] drm/i915/gvt: cancel dma map only for not present
 ggtt entry
Thread-Index: AQHVCvZyCGVvGV2zekuAMrZCwO1stg==
Date: Thu, 16 May 2019 02:52:29 +0000
Message-ID: <073732E20AE4C540AE91DBC3F07D44608765EAA9@SHSMSX107.ccr.corp.intel.com>
References: <20190515081921.4394-1-xiaolin.zhang@intel.com>
 <20190515090123.GU12913@zhen-hp.sh.intel.com>
 <073732E20AE4C540AE91DBC3F07D44608765E9A8@SHSMSX107.ccr.corp.intel.com>
 <8082FF9BCB2B054996454E47167FF4EC275DC3A9@SHSMSX104.ccr.corp.intel.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.4.160]
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

T24gMDUvMTYvMjAxOSAxMDozMCBBTSwgWmhhbmcsIFhpb25nIFkgd3JvdGU6Cj4KPj4gLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogaW50ZWwtZ3Z0LWRldiBbbWFpbHRvOmludGVs
LWd2dC1kZXYtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmddIE9uCj4+IEJlaGFsZiBPZiBa
aGFuZywgWGlhb2xpbgo+PiBTZW50OiBUaHVyc2RheSwgTWF5IDE2LCAyMDE5IDg6MjEgQU0KPj4g
VG86IFpoZW55dSBXYW5nIDx6aGVueXV3QGxpbnV4LmludGVsLmNvbT4KPj4gQ2M6IGludGVsLWd2
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjJdIGRy
bS9pOTE1L2d2dDogY2FuY2VsIGRtYSBtYXAgb25seSBmb3Igbm90IHByZXNlbnQKPj4gZ2d0dCBl
bnRyeQo+Pgo+PiBPbiAwNS8xNS8yMDE5IDA1OjAyIFBNLCBaaGVueXUgV2FuZyB3cm90ZToKPj4+
IE9uIDIwMTkuMDUuMTUgMTY6MTk6MjEgKzA4MDAsIFhpYW9saW4gWmhhbmcgd3JvdGU6Cj4+Pj4g
b25seSBjYW5jZWwgZ2d0dCBlbnRyeSBkbWEgbWFwIGZvciBpbnZhbGlkIGdndHQgZW50cnksIGRv
bid0IGRvIGl0Cj4+Pj4gZm9yIHBhcml0aWFsIHVwZGF0ZSBvciBvbGQgZ2d0dCBlbnRyeS4KPiBb
WmhhbmcsIFhpb25nIFldIGlmIGd1ZXN0IGp1c3QgbW9kaWZ5IGdndHQsIG5vdCBjbGVhciB0aGVu
IHdyaXRlLCB3aGVyZSB3aWxsIHRoZSBvbGQgZ2d0dCBlbnRyeSBiZSB1bm1hcHBlZCA/Cj4gV2l0
aCB0aGlzIGZpeCwgaXQgc2VlbXMgdGhlIG9sZCBnZ3R0IGVudHJ5IHdpbGwgbmV2ZXIgYmUgdW5t
YXBwZWQuCj4KPiBTdGlsbCBkb24ndCBjbGVhciB3aHkgZ3JhcGhpYyBhY2Nlc3MgaXQgYWZ0ZXIg
Z2d0dCBoYXMgZHJvcHBlZCBpdC4gSG93IGFib3V0IHRoaXMgY2hhbmdlID8KdGhpcyBkb2Vzbid0
IHdvcmsgZWl0aGVyIGFmdGVyIGEgdGVzdC4KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9n
dnQvZ3R0LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmMKPiBAQCAtMjI3
NSwxMCArMjI3NSwxMSBAQCBzdGF0aWMgaW50IGVtdWxhdGVfZ2d0dF9tbWlvX3dyaXRlKHN0cnVj
dCBpbnRlbF92Z3B1ICp2Z3B1LCB1bnNpZ25lZCBpbnQgb2ZmLAo+ICAgICAgICAgZ2d0dF9zZXRf
Z3Vlc3RfZW50cnkoZ2d0dF9tbSwgJmUsIGdfZ3R0X2luZGV4KTsKPgo+ICAgICAgICAgZ2d0dF9n
ZXRfaG9zdF9lbnRyeShnZ3R0X21tLCAmZSwgZ19ndHRfaW5kZXgpOwo+IC0gICAgICAgZ2d0dF9p
bnZhbGlkYXRlX3B0ZSh2Z3B1LCAmZSk7Cj4KPiAgICAgICAgIGdndHRfc2V0X2hvc3RfZW50cnko
Z2d0dF9tbSwgJm0sIGdfZ3R0X2luZGV4KTsKPiAgICAgICAgIGdndHRfaW52YWxpZGF0ZShndnQt
PmRldl9wcml2KTsKPiArCj4gKyAgICAgICBnZ3R0X2ludmFsaWRhdGVfcHRlKHZncHUsICZlKTsK
PiAgICAgICAgIHJldHVybiAwOwo+ICB9Cj4KPiB0aGFua3MKPj4+PiB0aGlzIGNoYW5nZSBjYW4g
YWRkcmVzcyBETUEgImZhdWx0IHJlYXNvbiAyMyIgaXNzdWUgZm9yIHdpbiBndWVzdAo+Pj4+IHdp
dGggaW50ZWwgaW9tbXUgb24uCj4+Pj4KPj4+PiB2MjogdXBkYXRlIGhhbmRsaW5nIG9mIGdndHQg
cGFydGlhbCB1cGRhdGUgKFpoZW55dSwgWWFuLCBIZW5yeSkKPj4+Pgo+Pj4+IFNpZ25lZC1vZmYt
Ynk6IFhpYW9saW4gWmhhbmcgPHhpYW9saW4uemhhbmdAaW50ZWwuY29tPgo+Pj4+IC0tLQo+Pj4+
ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmMgfCAyMSArKysrKysrKysrKystLS0tLS0t
LS0KPj4+PiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0p
Cj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5jCj4+
Pj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmMgaW5kZXggYzJmN2QyMGY2MzQ2Li40
ODU2YjlmZWM0MTEKPj4+PiAxMDA2NDQKPj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9n
dnQvZ3R0LmMKPj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmMKPj4+PiBA
QCAtMjI0MywxMCArMjI0MywyMSBAQCBzdGF0aWMgaW50IGVtdWxhdGVfZ2d0dF9tbWlvX3dyaXRl
KHN0cnVjdAo+PiBpbnRlbF92Z3B1ICp2Z3B1LCB1bnNpZ25lZCBpbnQgb2ZmLAo+Pj4+ICAJCX0K
Pj4+PiAgCX0KPj4+Pgo+Pj4+IC0JaWYgKCFwYXJ0aWFsX3VwZGF0ZSAmJiAob3BzLT50ZXN0X3By
ZXNlbnQoJmUpKSkgewo+Pj4+ICsJaWYgKCFvcHMtPnRlc3RfcHJlc2VudCgmZSkpIHsKPj4+PiAr
CQlnZ3R0X2dldF9ob3N0X2VudHJ5KGdndHRfbW0sICZtLCBnX2d0dF9pbmRleCk7Cj4+Pj4gKwkJ
Z2d0dF9pbnZhbGlkYXRlX3B0ZSh2Z3B1LCAmbSk7Cj4+Pj4gKwkJb3BzLT5zZXRfcGZuKCZtLCBn
dnQtPmd0dC5zY3JhdGNoX21mbik7Cj4+Pj4gKwkJb3BzLT5jbGVhcl9wcmVzZW50KCZtKTsKPj4+
PiArCX0gZWxzZSB7Cj4+Pj4gIAkJZ2ZuID0gb3BzLT5nZXRfcGZuKCZlKTsKPj4+PiAgCQltID0g
ZTsKPj4+Pgo+Pj4+ICsJCWlmIChwYXJ0aWFsX3VwZGF0ZSkgewo+Pj4+ICsJCQlvcHMtPnNldF9w
Zm4oJm0sIGd2dC0+Z3R0LnNjcmF0Y2hfbWZuKTsKPj4+PiArCQkJb3BzLT5jbGVhcl9wcmVzZW50
KCZtKTsKPj4+PiArCQkJZ290byBvdXQ7Cj4+Pj4gKwkJfQo+Pj4+ICsKPj4+PiAgCQkvKiBvbmUg
UFRFIHVwZGF0ZSBtYXkgYmUgaXNzdWVkIGluIG11bHRpcGxlIHdyaXRlcyBhbmQgdGhlCj4+Pj4g
IAkJICogZmlyc3Qgd3JpdGUgbWF5IG5vdCBjb25zdHJ1Y3QgYSB2YWxpZCBnZm4KPj4+PiAgCQkg
Ki8KPj4+PiBAQCAtMjI2NiwxNyArMjI3Nyw5IEBAIHN0YXRpYyBpbnQgZW11bGF0ZV9nZ3R0X21t
aW9fd3JpdGUoc3RydWN0Cj4+IGludGVsX3ZncHUgKnZncHUsIHVuc2lnbmVkIGludCBvZmYsCj4+
Pj4gIAkJCW9wcy0+c2V0X3BmbigmbSwgZ3Z0LT5ndHQuc2NyYXRjaF9tZm4pOwo+Pj4+ICAJCX0g
ZWxzZQo+Pj4+ICAJCQlvcHMtPnNldF9wZm4oJm0sIGRtYV9hZGRyID4+IFBBR0VfU0hJRlQpOwo+
Pj4+IC0JfSBlbHNlIHsKPj4+PiAtCQlvcHMtPnNldF9wZm4oJm0sIGd2dC0+Z3R0LnNjcmF0Y2hf
bWZuKTsKPj4+PiAtCQlvcHMtPmNsZWFyX3ByZXNlbnQoJm0pOwo+Pj4+ICAJfQo+Pj4+IC0KPj4+
PiAgb3V0Ogo+Pj4+ICAJZ2d0dF9zZXRfZ3Vlc3RfZW50cnkoZ2d0dF9tbSwgJmUsIGdfZ3R0X2lu
ZGV4KTsKPj4+PiAtCj4+Pj4gLQlnZ3R0X2dldF9ob3N0X2VudHJ5KGdndHRfbW0sICZlLCBnX2d0
dF9pbmRleCk7Cj4+Pj4gLQlnZ3R0X2ludmFsaWRhdGVfcHRlKHZncHUsICZlKTsKPj4+PiAtCj4+
Pj4gIAlnZ3R0X3NldF9ob3N0X2VudHJ5KGdndHRfbW0sICZtLCBnX2d0dF9pbmRleCk7Cj4+Pj4g
IAlnZ3R0X2ludmFsaWRhdGUoZ3Z0LT5kZXZfcHJpdik7Cj4+Pj4gIAlyZXR1cm4gMDsKPj4+PiAt
LQo+Pj4gSG93IGFib3V0IGJlbG93IHNpbXBsZXIgY2hhbmdlPwo+Pj4KPj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmMKPj4+IGIvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ3Z0L2d0dC5jIGluZGV4IDA4Yzc0ZTY1ODM2Yi4uOGYyN2RiOWQ3YTFlCj4+PiAxMDA2NDQK
Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuYwo+Pj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5jCj4+PiBAQCAtMjI2OSwxNiArMjI2OSwxNiBAQCBzdGF0
aWMgaW50IGVtdWxhdGVfZ2d0dF9tbWlvX3dyaXRlKHN0cnVjdAo+PiBpbnRlbF92Z3B1ICp2Z3B1
LCB1bnNpZ25lZCBpbnQgb2ZmLAo+Pj4gIAkJCW9wcy0+c2V0X3BmbigmbSwgZ3Z0LT5ndHQuc2Ny
YXRjaF9tZm4pOwo+Pj4gIAkJfSBlbHNlCj4+PiAgCQkJb3BzLT5zZXRfcGZuKCZtLCBkbWFfYWRk
ciA+PiBQQUdFX1NISUZUKTsKPj4+IC0JfSBlbHNlIHsKPj4+ICsJfSBlbHNlCj4+PiAgCQlvcHMt
PnNldF9wZm4oJm0sIGd2dC0+Z3R0LnNjcmF0Y2hfbWZuKTsKPj4+IC0JCW9wcy0+Y2xlYXJfcHJl
c2VudCgmbSk7Cj4+PiAtCX0KPj4+Cj4+PiAgb3V0Ogo+Pj4gIAlnZ3R0X3NldF9ndWVzdF9lbnRy
eShnZ3R0X21tLCAmZSwgZ19ndHRfaW5kZXgpOwo+Pj4KPj4+IC0JZ2d0dF9nZXRfaG9zdF9lbnRy
eShnZ3R0X21tLCAmZSwgZ19ndHRfaW5kZXgpOwo+Pj4gLQlnZ3R0X2ludmFsaWRhdGVfcHRlKHZn
cHUsICZlKTsKPj4+ICsJaWYgKCFwYXJ0aWFsX3VwZGF0ZSkgewo+Pj4gKwkJZ2d0dF9nZXRfaG9z
dF9lbnRyeShnZ3R0X21tLCAmZSwgZ19ndHRfaW5kZXgpOwo+Pj4gKwkJZ2d0dF9pbnZhbGlkYXRl
X3B0ZSh2Z3B1LCAmZSk7Cj4+PiArCX0KPj4gdGhpcyBjaGFuZ2UgZG9lcyBub3Qgd29yayBhZnRl
ciBhIHRlc3QgYW5kIHRoaXMgY2hhbmdlIHdhcyAgcG9pbnRlZCBvdXQgYnkKPj4gSGVucnkgYmVm
b3JlIGV4Y2VwdCB5b3VyIGNsZWFyIHByZXNlbnQuIEFub3RoZXIgdGVzdCBpcyB0aGF0IGlmIHdl
IGNoYW5nZSAiaWYKPj4gKCFwYXJ0aWFsX3VwZGF0ZSkiIHRvICJpZiAoIW9wcy0+dGVzdF9wcmVz
ZW50KCZlKSkiIGFmdGVyIGxhYmVsIG91dCwgaXQgd2lsbCB3b3JrLgo+PiBidXQgdGhpcyBjaGFu
Z2UgaXMgZXNzZW50aWFsIHRvIHRoZSBzYW1lIG15IHBhdGNoIHNldCBhbmQgaXMgbm90IGdvb2QK
Pj4gcmVhZGFibGUgdGhhbiBteSBwYXRjaCBzZXQgcGVyIG15IG9waW5pb24uCj4+PiAgCWdndHRf
c2V0X2hvc3RfZW50cnkoZ2d0dF9tbSwgJm0sIGdfZ3R0X2luZGV4KTsKPj4+ICAJZ2d0dF9pbnZh
bGlkYXRlKGd2dC0+ZGV2X3ByaXYpOwo+Pj4KPj4+Cj4+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4+IGludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0Cj4+
IGludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4+IGh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGlu
ZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
