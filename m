Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5418624778
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 21 May 2019 07:15:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0FCA8920F;
	Tue, 21 May 2019 05:15:44 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDE268920F
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 21 May 2019 05:15:42 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 May 2019 22:15:42 -0700
X-ExtLoop1: 1
Received: from coxu-arch-shz.sh.intel.com (HELO [10.239.160.22])
 ([10.239.160.22])
 by fmsmga006.fm.intel.com with ESMTP; 20 May 2019 22:15:41 -0700
Subject: Re: [PATCH v4 1/2] drm/i915/gvt: Check if cur_pt_type is valid
To: Aleksei Gimbitskii <aleksei.gimbitskii@intel.com>,
 intel-gvt-dev@lists.freedesktop.org
References: <20190502095922.31917-1-aleksei.gimbitskii@intel.com>
 <20190502095922.31917-2-aleksei.gimbitskii@intel.com>
From: Colin Xu <Colin.Xu@intel.com>
Message-ID: <280a6777-a86e-71b1-014d-cd09b7e9b5d4@intel.com>
Date: Tue, 21 May 2019 13:15:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190502095922.31917-2-aleksei.gimbitskii@intel.com>
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
Cc: Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

QWNrZWQtYnk6IENvbGluIFh1IDxjb2xpbi54dUBpbnRlbC5jb20+CgpJJ20gT0sgd2l0aCB0aGUg
Y2hhbmdlLiBaaGVueXUgaGFzIHNvbWUgY29tbWVudHMgaW4gdjMgc2VlIGlmIGhlIGhhcyAKbW9y
ZSBjb21tZW50cyBpbiB2NC4gVGhhbmtzLgoKT24gMjAxOS0wNS0wMiAxNzo1OSwgQWxla3NlaSBH
aW1iaXRza2lpIHdyb3RlOgo+IFN0YXRpYyBjb2RlIGFuYWx5emVyIHdhcm5zIHRoYXQgaW5kZXgg
dmFsdWUgZm9yIHNjcmF0Y2hfcHQgbWF5IGJlIGVxdWFsCj4gdG8gLTEuIEluZGV4IHZhbHVlIHR5
cGUgaXMgaW50ZWxfZ3Z0X2d0dF90eXBlX3QsIHNvIGl0IG1heSBiZSBhbnkgbnVtYmVyCj4gYXQg
cmFuZ2UgLTEgdG8gMTcuIENoZWNrIGZpcnN0IGlmIGN1cl9wdF90eXBlIGFuZCBjdXJfcHRfdHlw
ZSsxIGlzIHZhbGlkCj4gdmFsdWVzLgo+Cj4gdjI6Cj4gICAtIFByaW50IHNvbWUgZXJyb3IgbWVz
c2FnZXMgaWYgcGFnZSB0YWJsZSB0eXBlIGlzIGludmFsaWQuIChDb2xpbiBYdSkKPgo+IHY0Ogo+
ICAgLSBQcmludCBjdXJfcHRfdHlwZSBpbiBlcnJvciBtZXNzYWdlLiAoQ29saW4gWHUpCj4KPiBU
aGlzIHBhdGNoIGZpeGVkIHRoZSBjcml0aWFsIGlzc3VlICM0MjIgcmVwb3J0ZWQgYnkga2xvY3dv
cmsuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbGVrc2VpIEdpbWJpdHNraWkgPGFsZWtzZWkuZ2ltYml0
c2tpaUBpbnRlbC5jb20+Cj4gQ2M6IFpoZW55dSBXYW5nIDx6aGVueXV3QGxpbnV4LmludGVsLmNv
bT4KPiBDYzogWmhpIFdhbmcgPHpoaS5hLndhbmdAaW50ZWwuY29tPgo+IENjOiBDb2xpbiBYdSA8
Y29saW4ueHVAaW50ZWwuY29tPgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0
dC5jIHwgMTEgKysrKysrKysrKy0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0
L2d0dC5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5jCj4gaW5kZXggMDhjNzRlNjU4
MzZiLi43ZTYxMzk2YTY1YzYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0
L2d0dC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5jCj4gQEAgLTk0Miw3
ICs5NDIsMTYgQEAgc3RhdGljIGludCBwcGd0dF9pbnZhbGlkYXRlX3NwdF9ieV9zaGFkb3dfZW50
cnkoc3RydWN0IGludGVsX3ZncHUgKnZncHUsCj4gICAKPiAgIAlpZiAoZS0+dHlwZSAhPSBHVFRf
VFlQRV9QUEdUVF9ST09UX0wzX0VOVFJZCj4gICAJCSYmIGUtPnR5cGUgIT0gR1RUX1RZUEVfUFBH
VFRfUk9PVF9MNF9FTlRSWSkgewo+IC0JCWN1cl9wdF90eXBlID0gZ2V0X25leHRfcHRfdHlwZShl
LT50eXBlKSArIDE7Cj4gKwkJY3VyX3B0X3R5cGUgPSBnZXRfbmV4dF9wdF90eXBlKGUtPnR5cGUp
Owo+ICsKPiArCQlpZiAoIWd0dF90eXBlX2lzX3B0KGN1cl9wdF90eXBlKSB8fAo+ICsJCQkJIWd0
dF90eXBlX2lzX3B0KGN1cl9wdF90eXBlICsgMSkpIHsKPiArCQkJV0FSTigxLCAiSW52YWxpZCBw
YWdlIHRhYmxlIHR5cGUsIGN1cl9wdF90eXBlIGlzOiAlZFxuIiwgY3VyX3B0X3R5cGUpOwo+ICsJ
CQlyZXR1cm4gLUVJTlZBTDsKPiArCQl9Cj4gKwo+ICsJCWN1cl9wdF90eXBlICs9IDE7Cj4gKwo+
ICAgCQlpZiAob3BzLT5nZXRfcGZuKGUpID09Cj4gICAJCQl2Z3B1LT5ndHQuc2NyYXRjaF9wdFtj
dXJfcHRfdHlwZV0ucGFnZV9tZm4pCj4gICAJCQlyZXR1cm4gMDsKCi0tIApCZXN0IFJlZ2FyZHMs
CkNvbGluIFh1CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lu
dGVsLWd2dC1kZXY=
