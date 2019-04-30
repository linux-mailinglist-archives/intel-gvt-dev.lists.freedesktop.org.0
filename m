Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 616DAED92
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 30 Apr 2019 02:16:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32C3989358;
	Tue, 30 Apr 2019 00:16:23 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4D6489358
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 30 Apr 2019 00:16:21 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Apr 2019 17:16:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,411,1549958400"; d="scan'208";a="154883463"
Received: from coxu-arch-shz.sh.intel.com (HELO [10.239.160.21])
 ([10.239.160.21])
 by orsmga002.jf.intel.com with ESMTP; 29 Apr 2019 17:16:20 -0700
Subject: Re: [PATCH v3 4/6] drm/i915/gvt: Check if cur_pt_type is valid
To: "Gimbitskii, Aleksei" <aleksei.gimbitskii@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Wang, Zhi A" <zhi.a.wang@intel.com>
References: <20190423120413.30929-1-aleksei.gimbitskii@intel.com>
 <20190423120413.30929-5-aleksei.gimbitskii@intel.com>
 <4561c51c-239a-baf2-da53-3a6a6d463c09@intel.com>
 <1EB9BA72F2F5144BB1A5812E11248EAD18E1344B@irsmsx105.ger.corp.intel.com>
From: Colin Xu <Colin.Xu@intel.com>
Message-ID: <6852df90-e0ac-da31-4914-96a69aac3108@intel.com>
Date: Tue, 30 Apr 2019 08:16:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1EB9BA72F2F5144BB1A5812E11248EAD18E1344B@irsmsx105.ger.corp.intel.com>
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
Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Ck9uIDIwMTktMDQtMjkgMjA6MjMsIEdpbWJpdHNraWksIEFsZWtzZWkgd3JvdGU6Cj4gVGhhbmtz
IGZvciByZW1pbmRpbmcgYW5kIHNvcnJ5IGZvciBsYXRlIHJlc3BvbnNlLgo+IEkgd2lsbCBhZGQg
Y3VyX3B0X3R5cGUgdmFsdWUgdG8gdGhlIFdBUk4gbWVzc2FnZS4KCkFzIG1lbnRpb25lZCBpbiA1
LzYsIGl0J3MgYWxzbyBPSyB0byBrZWVwIGN1cnJlbnQgc3R5bGUgYW5kIGltcHJvdmUgYWxsIG1z
ZyBpbiBmdXR1cmUuCgo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gRnJvbTogaW50ZWwt
Z3Z0LWRldiBbbWFpbHRvOmludGVsLWd2dC1kZXYtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5v
cmddIE9uIEJlaGFsZiBPZiBDb2xpbiBYdQo+IFNlbnQ6IFRodXJzZGF5LCBBcHJpbCAyNSwgMjAx
OSA4OjQzIEFNCj4gVG86IEdpbWJpdHNraWksIEFsZWtzZWkgPGFsZWtzZWkuZ2ltYml0c2tpaUBp
bnRlbC5jb20+OyBpbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBXYW5n
LCBaaGkgQSA8emhpLmEud2FuZ0BpbnRlbC5jb20+OyBaaGVueXUgV2FuZyA8emhlbnl1d0BsaW51
eC5pbnRlbC5jb20+Cj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyA0LzZdIGRybS9pOTE1L2d2dDog
Q2hlY2sgaWYgY3VyX3B0X3R5cGUgaXMgdmFsaWQKPgo+Cj4gT24gMjAxOS0wNC0yMyAyMDowNCwg
QWxla3NlaSBHaW1iaXRza2lpIHdyb3RlOgo+PiBTdGF0aWMgY29kZSBhbmFseXplciB3YXJucyB0
aGF0IGluZGV4IHZhbHVlIGZvciBzY3JhdGNoX3B0IG1heSBiZQo+PiBlcXVhbCB0byAtMS4gSW5k
ZXggdmFsdWUgdHlwZSBpcyBpbnRlbF9ndnRfZ3R0X3R5cGVfdCwgc28gaXQgbWF5IGJlCj4+IGFu
eSBudW1iZXIgYXQgcmFuZ2UgLTEgdG8gMTcuIENoZWNrIGZpcnN0IGlmIGN1cl9wdF90eXBlIGFu
ZAo+PiBjdXJfcHRfdHlwZSsxIGlzIHZhbGlkIHZhbHVlcy4KPj4KPj4gdjI6Cj4+ICAgIC0gUHJp
bnQgc29tZSBlcnJvciBtZXNzYWdlcyBpZiBwYWdlIHRhYmxlIHR5cGUgaXMgaW52YWxpZC4gKENv
bGluCj4+IFh1KQo+Pgo+PiBUaGlzIHBhdGNoIGZpeGVkIHRoZSBjcml0aWFsIGlzc3VlICM0MjIg
cmVwb3J0ZWQgYnkga2xvY3dvcmsuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEFsZWtzZWkgR2ltYml0
c2tpaSA8YWxla3NlaS5naW1iaXRza2lpQGludGVsLmNvbT4KPj4gQ2M6IFpoZW55dSBXYW5nIDx6
aGVueXV3QGxpbnV4LmludGVsLmNvbT4KPj4gQ2M6IFpoaSBXYW5nIDx6aGkuYS53YW5nQGludGVs
LmNvbT4KPj4gQ2M6IENvbGluIFh1IDxjb2xpbi54dUBpbnRlbC5jb20+Cj4+IC0tLQo+PiAgICBk
cml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmMgfCAxMSArKysrKysrKysrLQo+PiAgICAxIGZp
bGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5jCj4+IGIvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ3Z0L2d0dC5jIGluZGV4IDc2MDA0MTZkYjkwOC4uMDYxNDk5YTM4ZjRkCj4+IDEwMDY0
NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmMKPj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5jCj4+IEBAIC05NDIsNyArOTQyLDE2IEBAIHN0YXRpYyBp
bnQKPj4gcHBndHRfaW52YWxpZGF0ZV9zcHRfYnlfc2hhZG93X2VudHJ5KHN0cnVjdCBpbnRlbF92
Z3B1ICp2Z3B1LAo+PiAgICAKPj4gICAgCWlmIChlLT50eXBlICE9IEdUVF9UWVBFX1BQR1RUX1JP
T1RfTDNfRU5UUlkKPj4gICAgCQkmJiBlLT50eXBlICE9IEdUVF9UWVBFX1BQR1RUX1JPT1RfTDRf
RU5UUlkpIHsKPj4gLQkJY3VyX3B0X3R5cGUgPSBnZXRfbmV4dF9wdF90eXBlKGUtPnR5cGUpICsg
MTsKPj4gKwkJY3VyX3B0X3R5cGUgPSBnZXRfbmV4dF9wdF90eXBlKGUtPnR5cGUpOwo+PiArCj4+
ICsJCWlmICghZ3R0X3R5cGVfaXNfcHQoY3VyX3B0X3R5cGUpIHx8Cj4+ICsJCQkJIWd0dF90eXBl
X2lzX3B0KGN1cl9wdF90eXBlICsgMSkpIHsKPj4gKwkJCVdBUk4oMSwgIkludmFsaWQgcGFnZSB0
YWJsZSB0eXBlXG4iKTsKPiBPaCBsb29rcyB0aGUgY29tbWVudHMgaW4gdjIgYWxzbyBtaXNzZWQu
Cj4gV291bGQgeW91IGFkZCB0aGUgYWN0dWFsIGludmFsaWQgdHlwZSBpdCBoaXRzIGludG8gdGhl
IHdhcm5pbmcgYXMgd2VsbD8KPgo+PiArCQkJcmV0dXJuIC1FSU5WQUw7Cj4+ICsJCX0KPj4gKwo+
PiArCQljdXJfcHRfdHlwZSArPSAxOwo+PiArCj4+ICAgIAkJaWYgKG9wcy0+Z2V0X3BmbihlKSA9
PQo+PiAgICAJCQl2Z3B1LT5ndHQuc2NyYXRjaF9wdFtjdXJfcHRfdHlwZV0ucGFnZV9tZm4pCj4+
ICAgIAkJCXJldHVybiAwOwo+IC0tCj4gQmVzdCBSZWdhcmRzLAo+IENvbGluIFh1Cj4KPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGludGVsLWd2dC1k
ZXYgbWFpbGluZyBsaXN0Cj4gaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1k
ZXYKCi0tIApCZXN0IFJlZ2FyZHMsCkNvbGluIFh1CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1n
dnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
