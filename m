Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BFFE005
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 29 Apr 2019 12:03:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1C5E89264;
	Mon, 29 Apr 2019 10:03:15 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0E0E89264;
 Mon, 29 Apr 2019 10:03:14 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 16393605-1500050 for multiple; Mon, 29 Apr 2019 11:02:36 +0100
MIME-Version: 1.0
To: Xiaolin Zhang <xiaolin.zhang@intel.com>, intel-gfx@lists.freedesktop.org, 
 intel-gvt-dev@lists.freedesktop.org
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <1556507458-24684-5-git-send-email-xiaolin.zhang@intel.com>
References: <1556507458-24684-1-git-send-email-xiaolin.zhang@intel.com>
 <1556507458-24684-5-git-send-email-xiaolin.zhang@intel.com>
Message-ID: <155653215521.27886.14694707069719603445@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH v5 4/8] drm/i915: vgpu context submission pv optimization
Date: Mon, 29 Apr 2019 11:02:35 +0100
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
Cc: Xiaolin Zhang <xiaolin.zhang@intel.com>, zhenyu.z.wang@intel.com,
 joonas.lahtinen@linux.intel.com, hang.yuan@intel.com, min.he@intel.com,
 zhiyuan.lv@intel.com, zhi.a.wang@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

UXVvdGluZyBYaWFvbGluIFpoYW5nICgyMDE5LTA0LTI5IDA0OjEwOjU0KQo+ICtzdGF0aWMgdm9p
ZCBwdl9zdWJtaXQoc3RydWN0IGludGVsX2VuZ2luZV9jcyAqZW5naW5lKQo+ICt7Cj4gKyAgICAg
ICBzdHJ1Y3QgaW50ZWxfZW5naW5lX2V4ZWNsaXN0cyAqIGNvbnN0IGV4ZWNsaXN0cyA9ICZlbmdp
bmUtPmV4ZWNsaXN0czsKPiArICAgICAgIHN0cnVjdCBleGVjbGlzdF9wb3J0ICpwb3J0ID0gZXhl
Y2xpc3RzLT5wb3J0Owo+ICsgICAgICAgdW5zaWduZWQgaW50IG47Cj4gKyAgICAgICBzdHJ1Y3Qg
Z3Z0X3NoYXJlZF9wYWdlICpzaGFyZWRfcGFnZSA9IGVuZ2luZS0+aTkxNS0+dmdwdS5zaGFyZWRf
cGFnZTsKPiArICAgICAgIHU2NCBkZXNjc1syXTsKPiArCj4gKyAgICAgICBmb3IgKG4gPSAwOyBu
IDwgZXhlY2xpc3RzX251bV9wb3J0cyhleGVjbGlzdHMpOyBuKyspIHsKPiArICAgICAgICAgICAg
ICAgc3RydWN0IGk5MTVfcmVxdWVzdCAqcnE7Cj4gKyAgICAgICAgICAgICAgIHVuc2lnbmVkIGlu
dCBjb3VudCA9IDA7Cj4gKwo+ICsgICAgICAgICAgICAgICBkZXNjc1tuXSA9IDA7Cj4gKyAgICAg
ICAgICAgICAgIHJxID0gcG9ydF91bnBhY2soJnBvcnRbbl0sICZjb3VudCk7Cj4gKyAgICAgICAg
ICAgICAgIGlmIChycSAmJiBjb3VudCA9PSAwKSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAg
cG9ydF9zZXQoJnBvcnRbbl0sIHBvcnRfcGFjayhycSwgKytjb3VudCkpOwo+ICsgICAgICAgICAg
ICAgICAgICAgICAgIGRlc2NzW25dID0gZXhlY2xpc3RzX3VwZGF0ZV9jb250ZXh0KHJxKTsKPiAr
ICAgICAgICAgICAgICAgfQo+ICsgICAgICAgfQo+ICsKPiArICAgICAgIHNwaW5fbG9jaygmZW5n
aW5lLT5pOTE1LT52Z3B1LnNoYXJlZF9wYWdlX2xvY2tbZW5naW5lLT5pZF0pOwoKT25seSBvbmUg
ZW5naW5lIGF0IGEgdGltZSBub3cgYWNjZXNzZXMgdGhhdCBwb3J0aW9uIG9mIHB2X2Vsc3AsIHNv
IHRoZQpzcGluIGxvY2sgaXMgbm90IHJlcXVpcmVkIHBlci1zZSwgYWl1aS4KClRoZSBwcm9ibGVt
IGlzIHRoYXQgdGhlcmUgaXMgbm8gY29vcmRpbmF0aW9uIGJldHdlZW4gcHZfc3VibWl0IGFuZCB0
aGUKb3RoZXIgc2lkZSBvZiB0aGUgcGlwZSwgYXMgZmFyIGFzIEkgY2FuIHNlZS4gU28gaXQgc2Vl
bXMgdmVyeSBwb3NzaWJsZQpmb3IgdXMgdG8gb3ZlcndyaXRlIGVudHJpZXMgYmVmb3JlIHRoZXkg
aGF2ZSBiZWVuIHJlYWQuIEkgZXhwZWN0IHRvIHNlZQpzb21lIGFjayBtZWNoYW5pc20gZm9yIFZH
VF9HMlZfUFZfU1VCTUlTU0lPTi4KCj4gKyAgICAgICBmb3IgKG4gPSAwOyBuIDwgZXhlY2xpc3Rz
X251bV9wb3J0cyhleGVjbGlzdHMpOyBuKyspCj4gKyAgICAgICAgICAgICAgIHNoYXJlZF9wYWdl
LT5wdl9lbHNwW2VuZ2luZS0+aWRdLmRlc2NzW25dID0gZGVzY3Nbbl07CgpJJ2QgcmVjb21tZW5k
IG5vdCB1c2luZyBlbmdpbmUtPmlkLCB0aGF0J3MganVzdCBvdXIgaW50ZXJuYWwgaWQgYW5kIG1h
eQp2YXJ5IGJldHdlZW4gaG9zdC9ndWVzdC4gVXNlIGVuZ2luZS0+aHdfaWQ/IE9yIG5lZ290aWF0
ZSB1c2luZyBwdiBzZXR1cAphbmQgc3RvcmUgcHZfaWQ/CgpCdXQgc3RhcnRpbmcgdG8gbG9vayBt
b3JlIHNvbGlkIG92ZXIgYWxsLiBXZSBqdXN0IG5lZWQgdG8gZmluaXNoCnNwbGl0dGluZyBvdXQg
dGhlIHZhcmlvdXMgc2ltaWxhci1idXQtcXVpdGUtZGlmZmVyZW50LXJlYWxseSBzdWJtaXNzaW9u
CmJhY2tlbmRzLiA6KQotQ2hyaXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9pbnRlbC1ndnQtZGV2
