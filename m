Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6221FCD8
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 16 May 2019 02:21:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3132689247;
	Thu, 16 May 2019 00:21:16 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 907C589247
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 16 May 2019 00:21:15 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 May 2019 17:21:15 -0700
X-ExtLoop1: 1
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by fmsmga007.fm.intel.com with ESMTP; 15 May 2019 17:21:15 -0700
Received: from fmsmsx163.amr.corp.intel.com (10.18.125.72) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Wed, 15 May 2019 17:21:14 -0700
Received: from shsmsx151.ccr.corp.intel.com (10.239.6.50) by
 fmsmsx163.amr.corp.intel.com (10.18.125.72) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Wed, 15 May 2019 17:21:14 -0700
Received: from shsmsx107.ccr.corp.intel.com ([169.254.9.7]) by
 SHSMSX151.ccr.corp.intel.com ([169.254.3.216]) with mapi id 14.03.0415.000;
 Thu, 16 May 2019 08:21:12 +0800
From: "Zhang, Xiaolin" <xiaolin.zhang@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [PATCH v2] drm/i915/gvt: cancel dma map only for not present
 ggtt entry
Thread-Topic: [PATCH v2] drm/i915/gvt: cancel dma map only for not present
 ggtt entry
Thread-Index: AQHVCvZyCGVvGV2zekuAMrZCwO1stg==
Date: Thu, 16 May 2019 00:21:12 +0000
Message-ID: <073732E20AE4C540AE91DBC3F07D44608765E9A8@SHSMSX107.ccr.corp.intel.com>
References: <20190515081921.4394-1-xiaolin.zhang@intel.com>
 <20190515090123.GU12913@zhen-hp.sh.intel.com>
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

T24gMDUvMTUvMjAxOSAwNTowMiBQTSwgWmhlbnl1IFdhbmcgd3JvdGU6Cj4gT24gMjAxOS4wNS4x
NSAxNjoxOToyMSArMDgwMCwgWGlhb2xpbiBaaGFuZyB3cm90ZToKPj4gb25seSBjYW5jZWwgZ2d0
dCBlbnRyeSBkbWEgbWFwIGZvciBpbnZhbGlkIGdndHQgZW50cnksIGRvbid0IGRvIGl0Cj4+IGZv
ciBwYXJpdGlhbCB1cGRhdGUgb3Igb2xkIGdndHQgZW50cnkuCj4+Cj4+IHRoaXMgY2hhbmdlIGNh
biBhZGRyZXNzIERNQSAiZmF1bHQgcmVhc29uIDIzIiBpc3N1ZSBmb3Igd2luIGd1ZXN0IHdpdGgK
Pj4gaW50ZWwgaW9tbXUgb24uCj4+Cj4+IHYyOiB1cGRhdGUgaGFuZGxpbmcgb2YgZ2d0dCBwYXJ0
aWFsIHVwZGF0ZSAoWmhlbnl1LCBZYW4sIEhlbnJ5KQo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBYaWFv
bGluIFpoYW5nIDx4aWFvbGluLnpoYW5nQGludGVsLmNvbT4KPj4gLS0tCj4+ICBkcml2ZXJzL2dw
dS9kcm0vaTkxNS9ndnQvZ3R0LmMgfCAyMSArKysrKysrKysrKystLS0tLS0tLS0KPj4gIDEgZmls
ZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5jIGIvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ3Z0L2d0dC5jCj4+IGluZGV4IGMyZjdkMjBmNjM0Ni4uNDg1NmI5ZmVjNDExIDEwMDY0NAo+
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmMKPj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZ3Z0L2d0dC5jCj4+IEBAIC0yMjQzLDEwICsyMjQzLDIxIEBAIHN0YXRpYyBp
bnQgZW11bGF0ZV9nZ3R0X21taW9fd3JpdGUoc3RydWN0IGludGVsX3ZncHUgKnZncHUsIHVuc2ln
bmVkIGludCBvZmYsCj4+ICAJCX0KPj4gIAl9Cj4+ICAKPj4gLQlpZiAoIXBhcnRpYWxfdXBkYXRl
ICYmIChvcHMtPnRlc3RfcHJlc2VudCgmZSkpKSB7Cj4+ICsJaWYgKCFvcHMtPnRlc3RfcHJlc2Vu
dCgmZSkpIHsKPj4gKwkJZ2d0dF9nZXRfaG9zdF9lbnRyeShnZ3R0X21tLCAmbSwgZ19ndHRfaW5k
ZXgpOwo+PiArCQlnZ3R0X2ludmFsaWRhdGVfcHRlKHZncHUsICZtKTsKPj4gKwkJb3BzLT5zZXRf
cGZuKCZtLCBndnQtPmd0dC5zY3JhdGNoX21mbik7Cj4+ICsJCW9wcy0+Y2xlYXJfcHJlc2VudCgm
bSk7Cj4+ICsJfSBlbHNlIHsKPj4gIAkJZ2ZuID0gb3BzLT5nZXRfcGZuKCZlKTsKPj4gIAkJbSA9
IGU7Cj4+ICAKPj4gKwkJaWYgKHBhcnRpYWxfdXBkYXRlKSB7Cj4+ICsJCQlvcHMtPnNldF9wZm4o
Jm0sIGd2dC0+Z3R0LnNjcmF0Y2hfbWZuKTsKPj4gKwkJCW9wcy0+Y2xlYXJfcHJlc2VudCgmbSk7
Cj4+ICsJCQlnb3RvIG91dDsKPj4gKwkJfQo+PiArCj4+ICAJCS8qIG9uZSBQVEUgdXBkYXRlIG1h
eSBiZSBpc3N1ZWQgaW4gbXVsdGlwbGUgd3JpdGVzIGFuZCB0aGUKPj4gIAkJICogZmlyc3Qgd3Jp
dGUgbWF5IG5vdCBjb25zdHJ1Y3QgYSB2YWxpZCBnZm4KPj4gIAkJICovCj4+IEBAIC0yMjY2LDE3
ICsyMjc3LDkgQEAgc3RhdGljIGludCBlbXVsYXRlX2dndHRfbW1pb193cml0ZShzdHJ1Y3QgaW50
ZWxfdmdwdSAqdmdwdSwgdW5zaWduZWQgaW50IG9mZiwKPj4gIAkJCW9wcy0+c2V0X3BmbigmbSwg
Z3Z0LT5ndHQuc2NyYXRjaF9tZm4pOwo+PiAgCQl9IGVsc2UKPj4gIAkJCW9wcy0+c2V0X3Bmbigm
bSwgZG1hX2FkZHIgPj4gUEFHRV9TSElGVCk7Cj4+IC0JfSBlbHNlIHsKPj4gLQkJb3BzLT5zZXRf
cGZuKCZtLCBndnQtPmd0dC5zY3JhdGNoX21mbik7Cj4+IC0JCW9wcy0+Y2xlYXJfcHJlc2VudCgm
bSk7Cj4+ICAJfQo+PiAtCj4+ICBvdXQ6Cj4+ICAJZ2d0dF9zZXRfZ3Vlc3RfZW50cnkoZ2d0dF9t
bSwgJmUsIGdfZ3R0X2luZGV4KTsKPj4gLQo+PiAtCWdndHRfZ2V0X2hvc3RfZW50cnkoZ2d0dF9t
bSwgJmUsIGdfZ3R0X2luZGV4KTsKPj4gLQlnZ3R0X2ludmFsaWRhdGVfcHRlKHZncHUsICZlKTsK
Pj4gLQo+PiAgCWdndHRfc2V0X2hvc3RfZW50cnkoZ2d0dF9tbSwgJm0sIGdfZ3R0X2luZGV4KTsK
Pj4gIAlnZ3R0X2ludmFsaWRhdGUoZ3Z0LT5kZXZfcHJpdik7Cj4+ICAJcmV0dXJuIDA7Cj4+IC0t
IAo+IEhvdyBhYm91dCBiZWxvdyBzaW1wbGVyIGNoYW5nZT8KPgo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0
LmMKPiBpbmRleCAwOGM3NGU2NTgzNmIuLjhmMjdkYjlkN2ExZSAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9n
dnQvZ3R0LmMKPiBAQCAtMjI2OSwxNiArMjI2OSwxNiBAQCBzdGF0aWMgaW50IGVtdWxhdGVfZ2d0
dF9tbWlvX3dyaXRlKHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1LCB1bnNpZ25lZCBpbnQgb2ZmLAo+
ICAJCQlvcHMtPnNldF9wZm4oJm0sIGd2dC0+Z3R0LnNjcmF0Y2hfbWZuKTsKPiAgCQl9IGVsc2UK
PiAgCQkJb3BzLT5zZXRfcGZuKCZtLCBkbWFfYWRkciA+PiBQQUdFX1NISUZUKTsKPiAtCX0gZWxz
ZSB7Cj4gKwl9IGVsc2UKPiAgCQlvcHMtPnNldF9wZm4oJm0sIGd2dC0+Z3R0LnNjcmF0Y2hfbWZu
KTsKPiAtCQlvcHMtPmNsZWFyX3ByZXNlbnQoJm0pOwo+IC0JfQo+ICAKPiAgb3V0Ogo+ICAJZ2d0
dF9zZXRfZ3Vlc3RfZW50cnkoZ2d0dF9tbSwgJmUsIGdfZ3R0X2luZGV4KTsKPiAgCj4gLQlnZ3R0
X2dldF9ob3N0X2VudHJ5KGdndHRfbW0sICZlLCBnX2d0dF9pbmRleCk7Cj4gLQlnZ3R0X2ludmFs
aWRhdGVfcHRlKHZncHUsICZlKTsKPiArCWlmICghcGFydGlhbF91cGRhdGUpIHsKPiArCQlnZ3R0
X2dldF9ob3N0X2VudHJ5KGdndHRfbW0sICZlLCBnX2d0dF9pbmRleCk7Cj4gKwkJZ2d0dF9pbnZh
bGlkYXRlX3B0ZSh2Z3B1LCAmZSk7Cj4gKwl9CnRoaXMgY2hhbmdlIGRvZXMgbm90IHdvcmsgYWZ0
ZXIgYSB0ZXN0IGFuZCB0aGlzIGNoYW5nZSB3YXMgIHBvaW50ZWQgb3V0CmJ5IEhlbnJ5IGJlZm9y
ZSBleGNlcHQgeW91ciBjbGVhciBwcmVzZW50LiBBbm90aGVyIHRlc3QgaXMgdGhhdCBpZiB3ZQpj
aGFuZ2UgImlmICghcGFydGlhbF91cGRhdGUpIiB0byAiaWYgKCFvcHMtPnRlc3RfcHJlc2VudCgm
ZSkpIiBhZnRlciAKbGFiZWwgb3V0LCBpdCB3aWxsIHdvcmsuIGJ1dCB0aGlzIGNoYW5nZSBpcyBl
c3NlbnRpYWwgdG8gdGhlIHNhbWUgbXkKcGF0Y2ggc2V0IGFuZCBpcyBub3QgZ29vZCByZWFkYWJs
ZSB0aGFuIG15IHBhdGNoIHNldCBwZXIgbXkgb3Bpbmlvbi4KPiAgCj4gIAlnZ3R0X3NldF9ob3N0
X2VudHJ5KGdndHRfbW0sICZtLCBnX2d0dF9pbmRleCk7Cj4gIAlnZ3R0X2ludmFsaWRhdGUoZ3Z0
LT5kZXZfcHJpdik7Cj4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9pbnRlbC1ndnQtZGV2
