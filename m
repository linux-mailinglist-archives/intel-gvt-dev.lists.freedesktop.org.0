Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C32ED89
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 30 Apr 2019 02:14:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0412C89358;
	Tue, 30 Apr 2019 00:14:45 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFFC189358
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 30 Apr 2019 00:14:43 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Apr 2019 17:14:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,411,1549958400"; d="scan'208";a="154883158"
Received: from coxu-arch-shz.sh.intel.com (HELO [10.239.160.21])
 ([10.239.160.21])
 by orsmga002.jf.intel.com with ESMTP; 29 Apr 2019 17:14:42 -0700
Subject: Re: [PATCH v3 5/6] drm/i915/gvt: Assign NULL to the pointer after
 memory free.
To: "Gimbitskii, Aleksei" <aleksei.gimbitskii@intel.com>,
 "Wang, Zhi A" <zhi.a.wang@intel.com>
References: <20190423120413.30929-1-aleksei.gimbitskii@intel.com>
 <20190423120413.30929-6-aleksei.gimbitskii@intel.com>
 <20190425031406.GX17995@zhen-hp.sh.intel.com>
 <40634fbc-3569-e5c4-2741-3a40ab67e198@intel.com>
 <1EB9BA72F2F5144BB1A5812E11248EAD18E13437@irsmsx105.ger.corp.intel.com>
From: Colin Xu <Colin.Xu@intel.com>
Message-ID: <9aeb6501-3ff7-426e-8cf2-e39061e3daf7@intel.com>
Date: Tue, 30 Apr 2019 08:14:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1EB9BA72F2F5144BB1A5812E11248EAD18E13437@irsmsx105.ger.corp.intel.com>
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
Cc: "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>, Zhenyu Wang <zhenyuw@linux.intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gMjAxOS0wNC0yOSAyMDoyMiwgR2ltYml0c2tpaSwgQWxla3NlaSB3cm90ZToKPiBUaGFua3Mg
Zm9yIHRoZSByZW1pbmRpbmcgYW5kIHNvcnJ5IHRoYXQgSSBmb3JnZXQgdG8gbWVudGlvbiB0aGF0
LiAgQnV0IHdlIHRoaW5rIHRoYXQgaWYgd2UgYWRkIHRoaXMgZXJyb3IgbWVzc2FnZSBoZXJlLCBw
cm9iYWJseSB3ZSBhbHNvIG5lZWQgdG8gYWRkIHRoZSBlcnJvciBtZXNzYWdlIGluIG90aGVyIHNp
bWlsYXIgcGxhY2VzLCB3aGljaCBzZWVtcyBhIGJpdCBvdmVyIHRvbyBtdWNoLiBIb3cgYWJvdXQg
d2Ugc3RpbGwgZm9sbG93IHRoZSBleGlzdGluZyBzdHlsZT8KClRoZW4gaXQncyBPSyB0byBrZWVw
IGN1cnJlbnQgc3R5bGUuIElmIHRoZSBlcnIgbXNnIGNhbid0IGRpc3Rpbmd1aXNoIHRoZSBlcnJv
ciByZWFzb25zLAp3ZSBjb3VsZCBjcmFmdCBhbm90aGVyIHBhdGNoIHRvIGNsZWFudXAgYWxsIHJl
bGF0aXZlIG1zZ3MgdG9nZXRoZXIuCgpXaGF0IGRvIHlvdSB0aGluaywgWmhpPwoKPgo+IC0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gRnJvbTogWHUsIENvbGluCj4gU2VudDogVGh1cnNkYXks
IEFwcmlsIDI1LCAyMDE5IDg6MzIgQU0KPiBUbzogR2ltYml0c2tpaSwgQWxla3NlaSA8YWxla3Nl
aS5naW1iaXRza2lpQGludGVsLmNvbT4KPiBDYzogWmhlbnl1IFdhbmcgPHpoZW55dXdAbGludXgu
aW50ZWwuY29tPjsgaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IFdhbmcsIFpo
aSBBIDx6aGkuYS53YW5nQGludGVsLmNvbT4KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDUvNl0g
ZHJtL2k5MTUvZ3Z0OiBBc3NpZ24gTlVMTCB0byB0aGUgcG9pbnRlciBhZnRlciBtZW1vcnkgZnJl
ZS4KPgo+Cj4gT24gMjAxOS0wNC0yNSAxMToxNCwgWmhlbnl1IFdhbmcgd3JvdGU6Cj4+IE9uIDIw
MTkuMDQuMjMgMTU6MDQ6MTIgKzAzMDAsIEFsZWtzZWkgR2ltYml0c2tpaSB3cm90ZToKPj4+IFRo
ZSBrbG9jd29yayBzdGF0aWMgY29kZSBhbmFseXplciBjb21wbGFpbnMgYWJvdXQgdXNpbmcgcG9p
bnRlciBhZnRlcgo+Pj4gYmVpbmcgZnJlZWQsIGJlY2F1c2UgZnVydGhlciB3ZSBwYXNzIGl0IHRv
IHRoZSBndnRfdmdwdV9lcnIoKSBmdW5jdGlvbi4KPj4+IEFzc2lnbiBwb2ludGVyIHRvIGJlIE5V
TEwgaW50ZW50aW9uYWx5LCB0byBtZWV0IHJlcXVpcmVtZW50cyBvZiB0aGUKPj4+IGNvZGUgYW5h
bHl6ZXIuCj4+Pgo+Pj4gVGhpcyBwYXRjaCBmaXhlZCB0aGUgaXNzdWUgIzY0OCByZXBvcnRlZCBh
cyBlcnJvciBieSBrbG9jd29yay4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBBbGVrc2VpIEdpbWJp
dHNraWkgPGFsZWtzZWkuZ2ltYml0c2tpaUBpbnRlbC5jb20+Cj4+PiBDYzogWmhlbnl1IFdhbmcg
PHpoZW55dXdAbGludXguaW50ZWwuY29tPgo+Pj4gQ2M6IFpoaSBXYW5nIDx6aGkuYS53YW5nQGlu
dGVsLmNvbT4KPj4+IC0tLQo+Pj4gICAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5jIHwg
MSArCj4+PiAgICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPj4+Cj4+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5jCj4+PiBiL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2d2dC9ndHQuYyBpbmRleCAwNjE0OTlhMzhmNGQuLjkyNzc1M2E1OWExZQo+Pj4gMTAw
NjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmMKPj4+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuYwo+Pj4gQEAgLTExMDYsNiArMTEwNiw3IEBAIHN0
YXRpYyBzdHJ1Y3QgaW50ZWxfdmdwdV9wcGd0dF9zcHQKPj4+ICpwcGd0dF9wb3B1bGF0ZV9zcHRf
YnlfZ3Vlc3RfZW50cnkoCj4+PiAgICAKPj4+ICAgIGVycl9mcmVlX3NwdDoKPj4+ICAgIAlwcGd0
dF9mcmVlX3NwdChzcHQpOwo+Pj4gKwlzcHQgPSBOVUxMOwo+Pj4gICAgZXJyOgo+Pj4gICAgCWd2
dF92Z3B1X2VycigiZmFpbDogc2hhZG93IHBhZ2UgJXAgZ3Vlc3QgZW50cnkgMHglbGx4IHR5cGUg
JWRcbiIsCj4+PiAgICAJCSAgICAgc3B0LCB3ZS0+dmFsNjQsIHdlLT50eXBlKTsKPj4gSSB0aGlu
ayB3ZSBjYW4gcmVtb3ZlIHRoaXMgZXJyb3IgbWVzc2FnZSB3aGljaCBkb2Vzbid0IHRlbGwgdGhl
IHJlYXNvbgo+PiB0byBmYWlsIGF0IGFsbCwgYnV0IGhhdmUgZXJyIG1lc3NhZ2UgaW4gZWFybGll
ciBwYXRoIHdoZXJlIHdlIGNhbgo+PiBpbmRpY2F0ZSB0aGUgcmVhc29uLgo+IFNlZW0gbGlrZSBt
aXNzIG15IGNvbW1lbnQgaW4gdjIuCj4KPiBJIHdvdWxkIHN1Z2dlc3QgYWRkIGRpZmZlcmVudCBt
c2cgYmVmb3JlIHRoZSB0d28gImdvdG8gZXJyX2ZyZWVfc3B0IiwKPgo+IHRoZW4gaW4gdGhpcyBl
cnJfZnJlZV9zdHAgbGFiZWwgeW91IGNvdWxkIGp1c3QgcmV0dXJuIHdpdGhvdXQgcHJpbnQgdGhl
Cj4KPiBzYW1lIG1zZyBhcyBlcnIuIE90aGVyd2lzZSB5b3UgY2FuJ3QgdGVsbCB0aGUgcmVhc29u
IGZyb20gdGhlIHNhbWUgZXJyLgo+Cj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCj4+IGludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0Cj4+IGludGVsLWd2
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldgo+IC0tCj4gQmVzdCBSZWdhcmRzLAo+
IENvbGluIFh1Cj4KLS0gCkJlc3QgUmVnYXJkcywKQ29saW4gWHUKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0
CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
