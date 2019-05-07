Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C685B163E2
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  7 May 2019 14:44:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6352A6E7C8;
	Tue,  7 May 2019 12:44:13 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C69AC6E7B8;
 Tue,  7 May 2019 12:44:11 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 May 2019 05:44:11 -0700
X-ExtLoop1: 1
Received: from jlahtine-desk.ger.corp.intel.com (HELO localhost)
 ([10.251.92.39])
 by orsmga007.jf.intel.com with ESMTP; 07 May 2019 05:44:09 -0700
MIME-Version: 1.0
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Zhenyu Wang <zhenyu.z.wang@intel.com>
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
In-Reply-To: <20190507090558.GE12913@zhen-hp.sh.intel.com>
References: <20190507090558.GE12913@zhen-hp.sh.intel.com>
Message-ID: <155723304753.4624.16859188328495893015@jlahtine-desk.ger.corp.intel.com>
User-Agent: alot/0.7
Subject: Re: [PULL] gvt-next-fixes
Date: Tue, 07 May 2019 15:44:07 +0300
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>, "Lv, 
 Zhiyuan" <zhiyuan.lv@intel.com>, Zhi Wang <zhi.a.wang@intel.com>, "Yuan,
 Hang" <hang.yuan@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

VGhhbmtzLCBwdWxsZWQgdGhpcyBub3cuCgpSZWdhcmRzLCBKb29uYXMKClF1b3RpbmcgWmhlbnl1
IFdhbmcgKDIwMTktMDUtMDcgMTI6MDU6NTgpCj4gCj4gSGksCj4gCj4gSGVyZSdzIGd2dC1uZXh0
LWZpeGVzIGZvciA1LjItcmMsIHdoaWNoIGluY2x1ZGVzIG9uZSByZXZlcnQgZm9yIEJYVAo+IHJl
Z3Jlc3Npb24sIG9uZSBtaXNzZWQgY29udGV4dCBtbWlvIHJlZyBhZnRlciBSQ1MgcmVuYW1pbmcs
IHNhbml0aXplCj4gZGlzcGxheSBidWZmZXIgc2l6ZSBjYWxjdWxhdGlvbiBhbmQgc29tZSBrbG9j
d29yayB3YXJuaW5nL2Vycm9yIGZpeGVzLgo+IAo+IFRoYW5rcwo+IC0tCj4gVGhlIGZvbGxvd2lu
ZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA0NDc4MTFhNjg2ZThkYTczMjU1MTZhNzgwNjljY2ZiZDEz
OWVmMWE3Ogo+IAo+ICAgZHJtL2k5MTUvaWNsOiBGaXggTUdfRFBfTU9ERSgpIHJlZ2lzdGVyIHBy
b2dyYW1taW5nICgyMDE5LTA0LTI0IDA5OjM5OjExICswMzAwKQo+IAo+IGFyZSBhdmFpbGFibGUg
aW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0Ogo+IAo+ICAgaHR0cHM6Ly9naXRodWIuY29tL2ludGVs
L2d2dC1saW51eC5naXQgdGFncy9ndnQtbmV4dC1maXhlcy0yMDE5LTA1LTA3Cj4gCj4gZm9yIHlv
dSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDc1ZmRiODExZDkzYzhhYTRhOWY3M2I2M2RiMDMyYjFl
NmE4NjY4ZWY6Cj4gCj4gICBkcm0vaTkxNS9ndnQ6IEFkZCBpbiBjb250ZXh0IG1taW8gMHgyMEQ4
IHRvIGdlbjkgbW1pbyBsaXN0ICgyMDE5LTA1LTA1IDE3OjAyOjI1ICswODAwKQo+IAo+IC0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KPiBndnQtbmV4dC1maXhlcy0yMDE5LTA1LTA3Cj4gCj4gLSBSZXZlcnQgTUNIQkFSIHNhdmUg
cmFuZ2UgY2hhbmdlIGZvciBCWFQgcmVncmVzc2lvbiAoWWFrdWkpCj4gLSBBbGlnbiBkaXNwbGF5
IGRtYWJ1ZiBzaXplIGZvciBieXRlcyBpbnN0ZWFkIG9mIGVycm9yLXByb25lIHBhZ2VzIChYaW9u
ZykKPiAtIEZpeCBvbmUgY29udGV4dCBNTUlPIHNhdmUvcmVzdG9yZSBhZnRlciBSQ1MwIG5hbWUg
Y2hhbmdlIChDb2xpbikKPiAtIE1pc2Mga2xvY3dvcmsgd2FybmluZy9lcnJvcnMgZml4ZXMgKEFs
ZWtzZWkpCj4gCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQo+IEFsZWtzZWkgR2ltYml0c2tpaSAoNCk6Cj4gICAgICAgZHJt
L2k5MTUvZ3Z0OiBSZW1vdmUgdHlwZWRlZiBhbmQgbGV0IHRoZSBlbnVtZXJhdGlvbiBzdGFydHMg
ZnJvbSB6ZXJvCj4gICAgICAgZHJtL2k5MTUvZ3Z0OiBEbyBub3QgY29weSB0aGUgdW5pbml0aWFs
aXplZCBwb2ludGVyIGZyb20gZmJfaW5mbwo+ICAgICAgIGRybS9pOTE1L2d2dDogVXNlIHNucHJp
bnRmKCkgdG8gcHJldmVudCBwb3NzaWJsZSBidWZmZXIgb3ZlcmZsb3cuCj4gICAgICAgZHJtL2k5
MTUvZ3Z0OiBDaGVjayBpZiBnZXRfbmV4dF9wdF90eXBlKCkgYWx3YXlzIHJldHVybnMgYSB2YWxp
ZCB2YWx1ZQo+IAo+IENvbGluIFh1ICgxKToKPiAgICAgICBkcm0vaTkxNS9ndnQ6IEFkZCBpbiBj
b250ZXh0IG1taW8gMHgyMEQ4IHRvIGdlbjkgbW1pbyBsaXN0Cj4gCj4gWGlvbmcgWmhhbmcgKDEp
Ogo+ICAgICAgIGRybS9pOTE1L2d2dDogQ2hhbmdlIGZiX2luZm8tPnNpemUgZnJvbSBwYWdlcyB0
byBieXRlcwo+IAo+IFpoYW8gWWFrdWkgKDEpOgo+ICAgICAgIGRybS9pOTE1L2d2dDogUmV2ZXJ0
ICJkcm0vaTkxNS9ndnQ6IFJlZmluZSB0aGUgc25hcHNob3J0IHJhbmdlIG9mIEk5MTUgTUNIQkFS
IHRvIG9wdGltaXplIGd2dC1nIGJvb3QgdGltZSIKPiAKPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUv
Z3Z0L2RlYnVnZnMuYyAgICAgIHwgIDQgKystLQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQv
ZG1hYnVmLmMgICAgICAgfCAxOSArKysrKysrKy0tLS0tLS0tLS0tCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2d2dC9ndHQuYyAgICAgICAgICB8IDE1ICsrKysrKysrKy0tLS0tLQo+ICBkcml2ZXJz
L2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmggICAgICAgICAgfCAxNiArKysrKysrKy0tLS0tLS0tCj4g
IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9oYW5kbGVycy5jICAgICB8ICA0ICsrLS0KPiAgZHJp
dmVycy9ncHUvZHJtL2k5MTUvZ3Z0L21taW9fY29udGV4dC5jIHwgIDEgKwo+ICBkcml2ZXJzL2dw
dS9kcm0vaTkxNS9ndnQvcmVnLmggICAgICAgICAgfCAgMyAtLS0KPiAgZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ3Z0L3NjaGVkdWxlci5jICAgIHwgIDIgKy0KPiAgOCBmaWxlcyBjaGFuZ2VkLCAzMSBp
bnNlcnRpb25zKCspLCAzMyBkZWxldGlvbnMoLSkKPiAKPiAtLSAKPiBPcGVuIFNvdXJjZSBUZWNo
bm9sb2d5IENlbnRlciwgSW50ZWwgbHRkLgo+IAo+ICRncGcgLS1rZXlzZXJ2ZXIgd3d3a2V5cy5w
Z3AubmV0IC0tcmVjdi1rZXlzIDRENzgxODI3Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1k
ZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
