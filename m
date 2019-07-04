Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5238D5F228
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  4 Jul 2019 06:27:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF7916E25A;
	Thu,  4 Jul 2019 04:27:38 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C1BD6E252
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  4 Jul 2019 04:27:36 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Jul 2019 21:27:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,449,1557212400"; d="scan'208";a="184918395"
Received: from coxu-arch-shz.sh.intel.com (HELO [10.239.160.21])
 ([10.239.160.21])
 by fmsmga001.fm.intel.com with ESMTP; 03 Jul 2019 21:27:35 -0700
Subject: Re: [PATCH] drm/i915/gvt: Do not check shadowed when adding ppgtt to
 GVT GEM context
To: Zhenyu Wang <zhenyuw@linux.intel.com>
References: <20190704000929.3359-1-colin.xu@intel.com>
 <20190704025515.GS9684@zhen-hp.sh.intel.com>
From: Colin Xu <Colin.Xu@intel.com>
Message-ID: <3b3542e7-8af7-5141-020a-2d93ca28b936@intel.com>
Date: Thu, 4 Jul 2019 12:27:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190704025515.GS9684@zhen-hp.sh.intel.com>
Content-Language: en-US
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
Reply-To: Colin.Xu@intel.com
Cc: intel-gvt-dev@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Ck9uIDIwMTktMDctMDQgMTA6NTUsIFpoZW55dSBXYW5nIHdyb3RlOgo+IE9uIDIwMTkuMDcuMDQg
MDg6MDk6MjkgKzA4MDAsIENvbGluIFh1IHdyb3RlOgo+PiBXaW5kb3dzIGd1ZXN0IGNhbid0IHJ1
biBhZnRlciBmb3JjZS1URFIgd2l0aCBob3N0IGxvZzoKPj4gLi4uCj4+IGd2dDogdmdwdSAxOiB3
b3JrbG9hZCBzaGFkb3cgcHBndHQgaXNuJ3QgcmVhZHkKPj4gZ3Z0OiB2Z3B1IDE6IGZhaWwgdG8g
ZGlzcGF0Y2ggd29ya2xvYWQsIHNraXAKPj4gLi4uCj4+Cj4+IFRoZSBlcnJvciBpcyByYWlzZWQg
Ynkgc2V0X2NvbnRleHRfcHBndHRfZnJvbV9zaGFkb3coKSwgd2hlbiBpdCBjaGVja3MKPj4gYW5k
IGZvdW5kIHRoZSBzaGFkb3dfbW0gaXNuJ3QgbWFya2VkIGFzIHNoYWRvd2VkLgo+Pgo+PiBJbiB3
b3JrIHRocmVhZCBiZWZvcmUgZWFjaCBzdWJtaXNzaW9uLCBhIHNoYWRvd19tbSBpcyBzZXQgdG8g
c2hhZG93ZWQgaW46Cj4+IHNoYWRvd19wcGd0dF9tbSgpCj4+IDwtaW50ZWxfdmdwdV9waW5fbW0o
KQo+PiA8LXByZXBhcmVfd29ya2xvYWQoKQo+PiA8LWRpc3BhdGNoX3dvcmtsb2FkKCkKPj4gPC13
b3JrbG9hZF90aHJlYWQoKQo+PiBIb3dldmVyIGNoZWNraW5nIHdoZXRoZXIgb3Igbm90IHNoYWRv
d19tbSBpcyBzaGFkb3dlZCBpcyBwcmlvciB0byBpdDoKPj4gc2V0X2NvbnRleHRfcHBndHRfZnJv
bV9zaGFkb3coKQo+PiA8LWRpc3BhdGNoX3dvcmtsb2FkKCkKPj4gPC13b3JrbG9hZF90aHJlYWQo
KQo+Pgo+PiBJbiBub3JtYWwgY2FzZSwgY3JlYXRlIHdvcmtsb2FkIHdpbGwgY2hlY2sgdGhlIGV4
aXN0ZW5jZSBvZiBzaGFkb3dfbW0sCj4+IGlmIG5vdCBpdCB3aWxsIGNyZWF0ZSBhIG5ldyBvbmUg
YW5kIG1hcmtlZCBhcyBzaGFkb3dlZC4gSWYgYWxyZWFkeSBleGlzdAo+PiBpdCB3aWxsIHJldXNl
IHRoZSBvbGQgb25lLiBTaW5jZSBzaGFkb3dfbW0gaXMgcmV1c2VkLCBjaGVja2luZyBvZiBzaGFk
b3dlZAo+PiBpbiBzZXRfY29udGV4dF9wcGd0dF9mcm9tX3NoYWRvdygpIGFjdHVhbGx5IGFsd2F5
cyBzZWUgdGhlIHN0YXRlIHNldCBpbgo+PiBjcmVhdGlvbiwgYnV0IG5vdCB0aGUgc3RhdGUgc2V0
IGluIGludGVsX3ZncHVfcGluX21tKCkuCj4+Cj4+IFdoZW4gZm9yY2UtVERSLCBhbGwgZW5naW5l
cyBhcmUgcmVzZXQsIHNpbmNlIGl0J3Mgbm90IGRtbHIgbGV2ZWwsIGFsbAo+PiBwcGd0dF9tbSBh
cmUgaW52YWxpZGF0ZWQgYnV0IG5vdCBkZXN0cm95ZWQuIEludmFsaWRhdGlvbiB3aWxsIG1hcmsg
YWxsCj4+IHJldXNlZCBzaGFkb3dfbW0gYXMgbm90IHNoYWRvd2VkIGJ1dCBzdGlsbCBrZWVwcyBp
biBwcGd0dF9tbV9saXN0X2hlYWQuCj4+IElmIHdvcmtsb2FkIHN1Ym1pc3Npb24gcGhhc2UgdGhv
c2Ugc2hhZG93X21tIGFyZSByZXVzZWQgd2l0aCBzaGFkb3dlZAo+PiBub3Qgc2V0LCB0aGVuIHNl
dF9jb250ZXh0X3BwZ3R0X2Zyb21fc2hhZG93KCkgd2lsbCByZXBvcnQgZXJyb3IuCj4+Cj4+IE5v
IG5lZWQgdG8gY2hlY2sgc2hhZG93ZWQgc3RhdGUgaW4gc2V0X2NvbnRleHRfcHBndHRfZnJvbV9z
aGFkb3coKS4KPiBUaGFua3MgZm9yIHRyYWNpbmcgdGhpcyEgSSB0aGluayB0aGlzIGlzIGEgc2lk
ZSBlZmZlY3QgZnJvbSAxZTE4ZDVlNjczMWQ2NzRmZWUwYmI0YjY2ZjVlYTYxZTUwNDQ1MmEzLAo+
IHdoaWNoIEkgbW92ZWQgdGhpcyBzZXR0aW5nIG91dCBvZiBzY2FuIGZ1bmN0aW9uLgoKSSB0aGlu
ayBldmVuIGJlZm9yZSAxZTE4ZDVlNjczMWQ2NzRmZWUwYmI0YjY2ZjVlYTYxZTUwNDQ1MmEgaXQg
c3RpbGwgaGFzIHByb2JsZW0Kc2luY2UgaW50ZWxfZ3Z0X3NjYW5fYW5kX3NoYWRvd193b3JrbG9h
ZCgpIGlzIGJlZm9yZSBwcmVwYXJlX3dvcmtsb2FkKCkuCgo+Cj4gT25lIHBvdGVudGlhbCBpc3N1
ZSB3aXRoIHRoaXMgaXMgc2hhZG93X3BkcHMgYXQgdGhpcyB0aW1lIG1pZ2h0IG5vdCBoYXZlIHZh
bGlkIHZhbHVlIHlldCwKPiBob3cgYWJvdXQgd2UgbW92ZSBzaGFkb3cgY3R4IHBwZ3R0IHNldHRp
bmcgYWZ0ZXIgd2UgcmVhbGx5IHByZXBhcmVkIG1tIGZvciB3b3JrbG9hZCBhbmQKPiBiZWZvcmUg
aTkxNSBzdWJtaXNzaW9uPyBBcyB0aGlzIHNldHRpbmcgbm93IGlzIG1vc3RseSB0byBwbGVhc2Ug
aTkxNSwgd2UgaGF2ZSBhbHJlYWR5IHNldAo+IGNvbnRleHQncyBwcGd0dCBieSBvdXJzZWxmLgo+
CklmIHByZXBhcmVfd29ya2xvYWQoKSBmYWlsZWQsIHNob3VsZCB3ZSBzdGlsbCBzZXQgY29udGV4
dCBwcGd0dCBmb3IgdGhlIHNoYWRvdz8KCj4+IEZpeGVzOiA0ZjE1NjY1Y2NiYmEgKGRybS9pOTE1
OiBBZGQgcHBndHQgdG8gR1ZUIEdFTSBjb250ZXh0KQo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBDb2xp
biBYdSA8Y29saW4ueHVAaW50ZWwuY29tPgo+PiAtLS0KPj4gICBkcml2ZXJzL2dwdS9kcm0vaTkx
NS9ndnQvc2NoZWR1bGVyLmMgfCAyICstCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9ndnQvc2NoZWR1bGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvc2NoZWR1bGVyLmMK
Pj4gaW5kZXggMTk2YjQxNTVhMzA5Li5hNWRiNTc5MjY5NjIgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2d2dC9zY2hlZHVsZXIuYwo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9ndnQvc2NoZWR1bGVyLmMKPj4gQEAgLTM3MSw3ICszNzEsNyBAQCBzdGF0aWMgaW50IHNl
dF9jb250ZXh0X3BwZ3R0X2Zyb21fc2hhZG93KHN0cnVjdCBpbnRlbF92Z3B1X3dvcmtsb2FkICp3
b3JrbG9hZCwKPj4gICAJc3RydWN0IGk5MTVfcHBndHQgKnBwZ3R0ID0gaTkxNV92bV90b19wcGd0
dChjdHgtPnZtKTsKPj4gICAJaW50IGkgPSAwOwo+PiAgIAo+PiAtCWlmIChtbS0+dHlwZSAhPSBJ
TlRFTF9HVlRfTU1fUFBHVFQgfHwgIW1tLT5wcGd0dF9tbS5zaGFkb3dlZCkKPj4gKwlpZiAobW0t
PnR5cGUgIT0gSU5URUxfR1ZUX01NX1BQR1RUKQo+PiAgIAkJcmV0dXJuIC1FSU5WQUw7Cj4+ICAg
Cj4+ICAgCWlmIChtbS0+cHBndHRfbW0ucm9vdF9lbnRyeV90eXBlID09IEdUVF9UWVBFX1BQR1RU
X1JPT1RfTDRfRU5UUlkpIHsKPj4gLS0gCj4+IDIuMjIuMAo+Pgo+PiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBpbnRlbC1ndnQtZGV2IG1haWxpbmcg
bGlzdAo+PiBpbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+PiBodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXYKCi0tIApC
ZXN0IFJlZ2FyZHMsCkNvbGluIFh1CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
