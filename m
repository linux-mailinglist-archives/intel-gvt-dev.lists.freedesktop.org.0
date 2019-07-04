Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 808F15F433
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  4 Jul 2019 10:00:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EEE76E2DD;
	Thu,  4 Jul 2019 08:00:58 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFB786E2DD
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  4 Jul 2019 08:00:56 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Jul 2019 01:00:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,449,1557212400"; d="scan'208";a="184948937"
Received: from coxu-arch-shz.sh.intel.com (HELO [10.239.160.21])
 ([10.239.160.21])
 by fmsmga001.fm.intel.com with ESMTP; 04 Jul 2019 01:00:54 -0700
Subject: Re: [PATCH v2] drm/i915/gvt: Adding ppgtt to GVT GEM context after
 pin.
To: Zhenyu Wang <zhenyuw@linux.intel.com>
References: <20190704070613.31609-1-colin.xu@intel.com>
 <20190704074351.GV9684@zhen-hp.sh.intel.com>
From: Colin Xu <Colin.Xu@intel.com>
Message-ID: <4d2595be-6614-0f33-0cbf-a7341cf94906@intel.com>
Date: Thu, 4 Jul 2019 16:00:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190704074351.GV9684@zhen-hp.sh.intel.com>
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
Cc: intel-gvt-dev@lists.freedesktop.org, stable@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Ck9uIDIwMTktMDctMDQgMTU6NDMsIFpoZW55dSBXYW5nIHdyb3RlOgo+IE9uIDIwMTkuMDcuMDQg
MTU6MDY6MTMgKzA4MDAsIENvbGluIFh1IHdyb3RlOgo+PiBXaW5kb3dzIGd1ZXN0IGNhbid0IHJ1
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
dF9jb250ZXh0X3BwZ3R0X2Zyb21fc2hhZG93KCkgd2lsbCByZXBvcnQgZXJyb3IuCj4+Cj4+IEZp
eGVzOiA0ZjE1NjY1Y2NiYmEgKGRybS9pOTE1OiBBZGQgcHBndHQgdG8gR1ZUIEdFTSBjb250ZXh0
KQo+Pgo+PiB2MjoKPj4gTW92ZSBzZXRfY29udGV4dF9wcGd0dF9mcm9tX3NoYWRvdygpIGFmdGVy
IHByZXBhcmVfd29ya2xvYWQoKS4gKHpoZW55dSkKPj4KPj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5l
bC5vcmcKPj4gU2lnbmVkLW9mZi1ieTogQ29saW4gWHUgPGNvbGluLnh1QGludGVsLmNvbT4KPj4g
LS0tCj4+ICAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3NjaGVkdWxlci5jIHwgMTQgKysrKysr
Ky0tLS0tLS0KPj4gICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9u
cygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3NjaGVkdWxl
ci5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3NjaGVkdWxlci5jCj4+IGluZGV4IDE5NmI0
MTU1YTMwOS4uMTAwMDQwMjA5MTg4IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9ndnQvc2NoZWR1bGVyLmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3NjaGVk
dWxlci5jCj4+IEBAIC02ODUsMTMgKzY4NSw2IEBAIHN0YXRpYyBpbnQgZGlzcGF0Y2hfd29ya2xv
YWQoc3RydWN0IGludGVsX3ZncHVfd29ya2xvYWQgKndvcmtsb2FkKQo+PiAgIAltdXRleF9sb2Nr
KCZ2Z3B1LT52Z3B1X2xvY2spOwo+PiAgIAltdXRleF9sb2NrKCZkZXZfcHJpdi0+ZHJtLnN0cnVj
dF9tdXRleCk7Cj4+ICAgCj4+IC0JcmV0ID0gc2V0X2NvbnRleHRfcHBndHRfZnJvbV9zaGFkb3co
d29ya2xvYWQsCj4+IC0JCQkJCSAgICBzLT5zaGFkb3dbcmluZ19pZF0tPmdlbV9jb250ZXh0KTsK
Pj4gLQlpZiAocmV0IDwgMCkgewo+PiAtCQlndnRfdmdwdV9lcnIoIndvcmtsb2FkIHNoYWRvdyBw
cGd0dCBpc24ndCByZWFkeVxuIik7Cj4+IC0JCWdvdG8gZXJyX3JlcTsKPj4gLQl9Cj4+IC0KPj4g
ICAJcmV0ID0gaW50ZWxfZ3Z0X3dvcmtsb2FkX3JlcV9hbGxvYyh3b3JrbG9hZCk7Cj4+ICAgCWlm
IChyZXQpCj4+ICAgCQlnb3RvIGVycl9yZXE7Cj4+IEBAIC03MDcsNiArNzAwLDEzIEBAIHN0YXRp
YyBpbnQgZGlzcGF0Y2hfd29ya2xvYWQoc3RydWN0IGludGVsX3ZncHVfd29ya2xvYWQgKndvcmts
b2FkKQo+PiAgIAl9Cj4+ICAgCj4+ICAgCXJldCA9IHByZXBhcmVfd29ya2xvYWQod29ya2xvYWQp
Owo+PiArCWlmIChyZXQpCj4+ICsJCWdvdG8gb3V0Owo+PiArCj4+ICsJcmV0ID0gc2V0X2NvbnRl
eHRfcHBndHRfZnJvbV9zaGFkb3cod29ya2xvYWQsCj4+ICsJCQkJCSAgICBzLT5zaGFkb3dbcmlu
Z19pZF0tPmdlbV9jb250ZXh0KTsKPj4gKwlpZiAocmV0KQo+PiArCQlndnRfdmdwdV9lcnIoIndv
cmtsb2FkIHNoYWRvdyBwcGd0dCBpc24ndCByZWFkeVxuIik7Cj4gQXMgd29ya2xvYWQncyBzaGFk
b3dfbW0gc2hvdWxkIGFsd2F5cyBiZSBmb3IgcHBndHQsIHNvIHdlIGRvbid0IG5lZWQgcmV0dXJu
Cj4gZm9yIHNldF9jb250ZXh0X3BwZ3R0X2Zyb21fc2hhZG93LCBjYW4ganVzdCBiZSB2b2lkLiBU
aGVuIGhvdyBhYm91dCBkbyB0aGF0Cj4gaW4gcHJlcGFyZV93b3JrbG9hZCBhZnRlciB3ZSBzZXR0
bGUgZG93biBzaGFkb3cgcGRwPwo+CklmIHNvLCBpcyBjaGVja2luZyBtbS0+dHlwZSBhbmQgc2hh
ZG93ZWQgZmxhZyBzdGlsIG5lY2Vzc2FyeT8gc2luY2UgaW50ZWxfdmdwdV9waW5fbW0oKQppbiBw
cmVwYXJlX3dvcmtsb2FkIHdpbGwgZ3VhcmFuZWUgdGhhdCwgaWYgaW50ZWxfdmdwdV9waW5fbW0o
KSBmYWlscywgc2hhZG93IHBkcCB3b24ndApnZXQgdXBkYXRlZCBhbmQgbm8gbmVlZCB0byBwaW4u
IEFtIEkgcmlnaHQ/Cgo+PiAgIG91dDoKPj4gICAJaWYgKHJldCkgewo+PiAgIAkJLyogV2UgbWln
aHQgc3RpbGwgbmVlZCB0byBhZGQgcmVxdWVzdCB3aXRoCj4+IC0tIAo+PiAyLjIyLjAKPj4KLS0g
CkJlc3QgUmVnYXJkcywKQ29saW4gWHUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
