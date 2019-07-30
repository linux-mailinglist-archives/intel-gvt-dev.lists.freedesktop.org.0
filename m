Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2474B7A313
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 30 Jul 2019 10:28:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFFE86E448;
	Tue, 30 Jul 2019 08:28:42 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E49D06E448;
 Tue, 30 Jul 2019 08:28:41 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Jul 2019 01:28:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,326,1559545200"; d="scan'208";a="190812586"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.150])
 by fmsmga001.fm.intel.com with ESMTP; 30 Jul 2019 01:28:38 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [PULL] gvt-fixes
In-Reply-To: <20190730070020.GX8319@zhen-hp.sh.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20190723092958.GD8319@zhen-hp.sh.intel.com>
 <20190729033347.GQ8319@zhen-hp.sh.intel.com> <87zhkxnlsu.fsf@intel.com>
 <20190730070020.GX8319@zhen-hp.sh.intel.com>
Date: Tue, 30 Jul 2019 11:33:01 +0300
Message-ID: <87ftmnorb6.fsf@intel.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, "Yuan, Hang" <hang.yuan@intel.com>, "Lv,
 Zhiyuan" <zhiyuan.lv@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>,
 Zhi Wang <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gVHVlLCAzMCBKdWwgMjAxOSwgWmhlbnl1IFdhbmcgPHpoZW55dXdAbGludXguaW50ZWwuY29t
PiB3cm90ZToKPiBPbiAyMDE5LjA3LjI5IDE0OjA1OjA1ICswMzAwLCBKYW5pIE5pa3VsYSB3cm90
ZToKPj4gCj4+IFBsZWFzZSBmaXgsIGFuZCBtYWtlIGl0IGEgaGFiaXQgdG8gcnVuIHRoZSBjaGVj
a3MgYmVmb3JlIHNlbmRpbmcgdGhlCj4+IHB1bGwgcmVxdWVzdHMuCj4+IAo+Cj4gU29ycnkgZm9y
IHRoYXQhIEkndmUgdHJpZWQgdG8gcmVmcmVzaCBhbmQgcmVnZW5lcmF0ZSB0aGUgcHVsbC4gVGhp
cyBhbHNvCj4gYnJpbmdzIGluIHR3byBtb3JlIGZpeGVzIGluIHF1ZXVlLCBvbmUgZm9yIHJ1bnRp
bWUgcG0gd2FybmluZyBmaXggYW5kIGFub3RoZXIKPiBvbmUgZm9yIHdpbmRvd3MgZ3Vlc3QgVERS
IHJlc2V0IGZpeC4KClRoYW5rcywgcHVsbGVkICYgcHVzaGVkIQoKQlIsCkphbmkuCgoKCj4KPiBU
aGFua3MuCj4gLS0KPiBUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDg5ZjU3NTIz
MDdjZjUzMDEwZDk3NTAzYWM1MDFiMmNhMWIwODk5MjI6Cj4KPiAgIGRybS9pOTE1OiBGaXggdGhl
IFRCVCBBVVggcG93ZXIgd2VsbCBlbmFibGluZyAoMjAxOS0wNy0yOSAxNTo1NDozNyArMDMwMCkK
Pgo+IGFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0Ogo+Cj4gICBodHRwczov
L2dpdGh1Yi5jb20vaW50ZWwvZ3Z0LWxpbnV4LmdpdCB0YWdzL2d2dC1maXhlcy0yMDE5LTA3LTMw
Cj4KPiBmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gNDE4NzQxNDgwODA5NWY2NDVjYTA2
NjFmOGRkZTc3NjE3ZTJlN2NiMzoKPgo+ICAgZHJtL2k5MTUvZ3Z0OiBBZGRpbmcgcHBndHQgdG8g
R1ZUIEdFTSBjb250ZXh0IGFmdGVyIHNoYWRvdyBwZHBzIHNldHRsZWQuICgyMDE5LTA3LTMwIDE0
OjMwOjU2ICswODAwKQo+Cj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IGd2dC1maXhlcy0yMDE5LTA3LTMwCj4KPiAtIEd1
YXJkIGFnYWluc3QgcG90ZW50aWFsIGdndHQgYWNjZXNzIGVycm9yIChYaW9uZykKPiAtIEZpeCBp
bmNsdWRlY2hlY2sgKFpoZW55dSkKPiAtIEZpeCBjYWNoZSBlbnRyeSBmb3IgZ3Vlc3QgcGFnZSBt
YXBwaW5nIGZvdW5kIGJ5IDJNIHBwZ3R0IGd1ZXN0IChYaWFvbGluKQo+IC0gRml4IHJ1bnRpbWUg
cG0gd2FybmluZyAoWGlhb2xpbikKPiAtIEZpeCBzaGFkb3cgbW0gc2V0dGxlbWVudCBmb3IgV2lu
ZG93cyBndWVzdCByZXNldCBmYWlsdXJlIChDb2xpbikKPgo+IC0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiBDb2xpbiBYdSAo
MSk6Cj4gICAgICAgZHJtL2k5MTUvZ3Z0OiBBZGRpbmcgcHBndHQgdG8gR1ZUIEdFTSBjb250ZXh0
IGFmdGVyIHNoYWRvdyBwZHBzIHNldHRsZWQuCj4KPiBYaWFvbGluIFpoYW5nICgyKToKPiAgICAg
ICBkcm0vaTkxNS9ndnQ6IGZpeCBpbmNvcnJlY3QgY2FjaGUgZW50cnkgZm9yIGd1ZXN0IHBhZ2Ug
bWFwcGluZwo+ICAgICAgIGRybS9pOTE1L2d2dDogZ3JhYiBydW50aW1lIHBtIGZpcnN0IGZvciBm
b3JjZXdha2UgdXNlCj4KPiBYaW9uZyBaaGFuZyAoMyk6Cj4gICAgICAgZHJtL2k5MTUvZ3Z0OiBX
YXJuaW5nIGZvciBpbnZhbGlkIGdndHQgYWNjZXNzCj4gICAgICAgZHJtL2k5MTUvZ3Z0OiBEb24n
dCB1c2UgZ2d0dF92YWxpZGRhdGVfcmFuZ2UoKSB3aXRoIHNpemU9MAo+ICAgICAgIGRybS9pOTE1
L2d2dDogQ2hlY2tpbmcgd29ya2xvYWQncyBnbWEgZWFybGllcgo+Cj4gWmhlbnl1IFdhbmcgKDEp
Ogo+ICAgICAgIGRybS9pOTE1L2d2dDogcmVtb3ZlIGR1cGxpY2F0ZSBpbmNsdWRlIG9mIHRyYWNl
LmgKPgo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvY21kX3BhcnNlci5jICAgfCAxMCAtLS0t
LS0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2ZiX2RlY29kZXIuYyAgIHwgIDYgKystLQo+
ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmMgICAgICAgICAgfCAgOSArKysrKwo+ICBk
cml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQva3ZtZ3QuYyAgICAgICAgfCAxMiArKysrKysrCj4gIGRy
aXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9zY2hlZHVsZXIuYyAgICB8IDU5ICsrKysrKysrKysrKysr
KysrKysrKysrKy0tLS0tLS0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvdHJhY2VfcG9p
bnRzLmMgfCAgMiAtLQo+ICA2IGZpbGVzIGNoYW5nZWQsIDY4IGluc2VydGlvbnMoKyksIDMwIGRl
bGV0aW9ucygtKQoKLS0gCkphbmkgTmlrdWxhLCBJbnRlbCBPcGVuIFNvdXJjZSBHcmFwaGljcyBD
ZW50ZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50
ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1n
dnQtZGV2
