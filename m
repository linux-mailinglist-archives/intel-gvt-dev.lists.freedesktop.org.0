Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B711978A05
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 29 Jul 2019 13:00:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7872F89CA8;
	Mon, 29 Jul 2019 11:00:47 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C91C189CA8;
 Mon, 29 Jul 2019 11:00:45 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Jul 2019 04:00:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,322,1559545200"; d="scan'208";a="190522187"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.150])
 by fmsmga001.fm.intel.com with ESMTP; 29 Jul 2019 04:00:41 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Re: [PULL] gvt-fixes
In-Reply-To: <20190729033347.GQ8319@zhen-hp.sh.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20190723092958.GD8319@zhen-hp.sh.intel.com>
 <20190729033347.GQ8319@zhen-hp.sh.intel.com>
Date: Mon, 29 Jul 2019 14:05:05 +0300
Message-ID: <87zhkxnlsu.fsf@intel.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>, "Yuan,
 Hang" <hang.yuan@intel.com>, "Lv, Zhiyuan" <zhiyuan.lv@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>,
 Zhi Wang <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gTW9uLCAyOSBKdWwgMjAxOSwgWmhlbnl1IFdhbmcgPHpoZW55dXdAbGludXguaW50ZWwuY29t
PiB3cm90ZToKPiBwaW5nLi4KClNvcnJ5IGZvciB0aGUgZGVsYXkuIFVuZm9ydHVuYXRlbHksIGRp
bSBoaXQgdGhlIGZvbGxvd2luZyBpc3N1ZXM6CgpQdWxsaW5nIGh0dHBzOi8vZ2l0aHViLmNvbS9p
bnRlbC9ndnQtbGludXguZ2l0IHRhZ3MvZ3Z0LWZpeGVzLTIwMTktMDctMjMgLi4uCkZyb20gaHR0
cHM6Ly9naXRodWIuY29tL2ludGVsL2d2dC1saW51eAogKiB0YWcgICAgICAgICAgICAgICAgICAg
ICAgICAgZ3Z0LWZpeGVzLTIwMTktMDctMjMgLT4gRkVUQ0hfSEVBRApkaW06IDg2NDI2NTYyOTlj
ZiAoImRybS9pOTE1L2d2dDogZml4IGluY29ycmVjdCBjYWNoZSBlbnRyeSBmb3IgZ3Vlc3QgcGFn
ZSBtYXBwaW5nIik6IGNvbW1pdHRlciBTaWduZWQtb2ZmLWJ5IG1pc3NpbmcuCmRpbTogNGMyYmI1
NWJhN2Q2ICgiZHJtL2k5MTUvZ3Z0OiByZW1vdmUgZHVwbGljYXRlIGluY2x1ZGUgb2YgdHJhY2Uu
aCIpOiBtYW5kYXRvcnkgcmV2aWV3IG1pc3NpbmcuCmRpbTogMjVmZDE4MjlhZTRlICgiZHJtL2k5
MTU6IE1ha2UgdGhlIHNlbWFwaG9yZSBzYXR1cmF0aW9uIG1hc2sgZ2xvYmFsIik6IEZpeGVzOiBT
SEExIGluIG5vdCBwb2ludGluZyBhdCBhbiBhbmNlc3RvcjoKZGltOiAgICAgY2E2ZTU2ZjY1NGU3
ICgiZHJtL2k5MTU6IERpc2FibGUgc2VtYXBob3JlIGJ1c3l3YWl0cyBvbiBzYXR1cmF0ZWQgc3lz
dGVtcyIpCmRpbTogRVJST1I6IGlzc3VlcyBpbiBjb21taXRzIGRldGVjdGVkLCBhYm9ydGluZwoK
UGxlYXNlIGZpeCwgYW5kIG1ha2UgaXQgYSBoYWJpdCB0byBydW4gdGhlIGNoZWNrcyBiZWZvcmUg
c2VuZGluZyB0aGUKcHVsbCByZXF1ZXN0cy4KCkJSLApKYW5pLgoKCgo+Cj4gT24gMjAxOS4wNy4y
MyAxNzoyOTo1OCArMDgwMCwgWmhlbnl1IFdhbmcgd3JvdGU6Cj4+IAo+PiBIaSwKPj4gCj4+IEhl
cmUncyByZWNlbnQgZ3Z0LWZpeGVzIGZvciA1LjMtcmMuIEl0IGluY2x1ZGVzIHNhZmV0eSBndWFy
ZAo+PiBmb3IgcG9zc2libGUgZ2d0dCBhY2Nlc3MgZXJyb3Igd2l0aCByZWxhdGVkIGNoZWNrcywg
aW5jbHVkZWNoZWNrCj4+IGZpeCBhbmQgb25lIGNhY2hlIGVudHJ5IHNpemUgZml4IGZvciAyTUIg
cHBndHQgZ3Vlc3QuCj4+IAo+PiBUaGFua3MuCj4+IC0tCj4+IFRoZSBmb2xsb3dpbmcgY2hhbmdl
cyBzaW5jZSBjb21taXQgZDdlOGExOWIzOGM4YWMxYTMyYjZiMDNhZjA0OWUyYzg4ZDQxNTVkYjoK
Pj4gCj4+ICAgZHJtL2k5MTU6IERvbid0IGRlcmVmZXJlbmNlIHJlcXVlc3QgaWYgaXQgbWF5IGhh
dmUgYmVlbiByZXRpcmVkIHdoZW4gcHJpbnRpbmcgKDIwMTktMDctMDkgMTY6MTY6MTggKzAzMDAp
Cj4+IAo+PiBhcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKPj4gCj4+ICAg
aHR0cHM6Ly9naXRodWIuY29tL2ludGVsL2d2dC1saW51eC5naXQgdGFncy9ndnQtZml4ZXMtMjAx
OS0wNy0yMwo+PiAKPj4gZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDg2NDI2NTYyOTlj
Zjg2Y2ZlY2ViMWE0OGIwZTE4NzRkZTY4NzRhMmI6Cj4+IAo+PiAgIGRybS9pOTE1L2d2dDogZml4
IGluY29ycmVjdCBjYWNoZSBlbnRyeSBmb3IgZ3Vlc3QgcGFnZSBtYXBwaW5nICgyMDE5LTA3LTE4
IDExOjA2OjQxICswODAwKQo+PiAKPj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+PiBndnQtZml4ZXMtMjAxOS0wNy0yMwo+
PiAKPj4gLSBHdWFyZCBhZ2FpbnN0IHBvdGVudGlhbCBnZ3R0IGFjY2VzcyBlcnJvciAoWGlvbmcp
Cj4+IC0gRml4IGluY2x1ZGVjaGVjayAoWmhlbnl1KQo+PiAtIEZpeCBjYWNoZSBlbnRyeSBmb3Ig
Z3Vlc3QgcGFnZSBtYXBwaW5nIGZvdW5kIGJ5IDJNIHBwZ3R0IGd1ZXN0IChYaWFvbGluKQo+PiAK
Pj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQo+PiBYaWFvbGluIFpoYW5nICgxKToKPj4gICAgICAgZHJtL2k5MTUvZ3Z0OiBm
aXggaW5jb3JyZWN0IGNhY2hlIGVudHJ5IGZvciBndWVzdCBwYWdlIG1hcHBpbmcKPj4gCj4+IFhp
b25nIFpoYW5nICgzKToKPj4gICAgICAgZHJtL2k5MTUvZ3Z0OiBXYXJuaW5nIGZvciBpbnZhbGlk
IGdndHQgYWNjZXNzCj4+ICAgICAgIGRybS9pOTE1L2d2dDogRG9uJ3QgdXNlIGdndHRfdmFsaWRk
YXRlX3JhbmdlKCkgd2l0aCBzaXplPTAKPj4gICAgICAgZHJtL2k5MTUvZ3Z0OiBDaGVja2luZyB3
b3JrbG9hZCdzIGdtYSBlYXJsaWVyCj4+IAo+PiBaaGVueXUgV2FuZyAoMSk6Cj4+ICAgICAgIGRy
bS9pOTE1L2d2dDogcmVtb3ZlIGR1cGxpY2F0ZSBpbmNsdWRlIG9mIHRyYWNlLmgKPj4gCj4+ICBk
cml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvY21kX3BhcnNlci5jICAgfCAxMCAtLS0tLS0tLS0tCj4+
ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZmJfZGVjb2Rlci5jICAgfCAgNiArKystLS0KPj4g
IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuYyAgICAgICAgICB8ICA5ICsrKysrKysrKwo+
PiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2t2bWd0LmMgICAgICAgIHwgMTIgKysrKysrKysr
KysrCj4+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvc2NoZWR1bGVyLmMgICAgfCAyOCArKysr
KysrKysrKysrKysrKysrKysrKysrKysrCj4+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvdHJh
Y2VfcG9pbnRzLmMgfCAgMiAtLQo+PiAgNiBmaWxlcyBjaGFuZ2VkLCA1MiBpbnNlcnRpb25zKCsp
LCAxNSBkZWxldGlvbnMoLSkKPj4gCj4+IC0tIAo+PiBPcGVuIFNvdXJjZSBUZWNobm9sb2d5IENl
bnRlciwgSW50ZWwgbHRkLgo+PiAKPj4gJGdwZyAtLWtleXNlcnZlciB3d3drZXlzLnBncC5uZXQg
LS1yZWN2LWtleXMgNEQ3ODE4MjcKPgo+Cj4KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPj4gaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKPj4gaW50
ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2CgotLSAKSmFuaSBOaWt1bGEs
IEludGVsIE9wZW4gU291cmNlIEdyYXBoaWNzIENlbnRlcgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRl
bC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
