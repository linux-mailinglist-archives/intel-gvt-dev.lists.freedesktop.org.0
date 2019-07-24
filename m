Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C3472401
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 24 Jul 2019 03:49:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DFBA6E41B;
	Wed, 24 Jul 2019 01:49:36 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB53F6E41B;
 Wed, 24 Jul 2019 01:49:35 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Jul 2019 18:49:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,300,1559545200"; d="scan'208";a="193293347"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by fmsmga004.fm.intel.com with ESMTP; 23 Jul 2019 18:49:35 -0700
Received: from fmsmsx151.amr.corp.intel.com (10.18.125.4) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 23 Jul 2019 18:49:34 -0700
Received: from shsmsx103.ccr.corp.intel.com (10.239.4.69) by
 FMSMSX151.amr.corp.intel.com (10.18.125.4) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 23 Jul 2019 18:49:34 -0700
Received: from shsmsx107.ccr.corp.intel.com ([169.254.9.162]) by
 SHSMSX103.ccr.corp.intel.com ([169.254.4.109]) with mapi id 14.03.0439.000;
 Wed, 24 Jul 2019 09:49:31 +0800
From: "Zhang, Xiaolin" <xiaolin.zhang@intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>
Subject: Re: [PATCH v8 1/9] drm/i915: introduced vgpu pv capability
Thread-Topic: [PATCH v8 1/9] drm/i915: introduced vgpu pv capability
Thread-Index: AQHVQQJWO/M/AJbGb0ucwRHYyh4zXw==
Date: Wed, 24 Jul 2019 01:49:30 +0000
Message-ID: <073732E20AE4C540AE91DBC3F07D4460876B5EF7@SHSMSX107.ccr.corp.intel.com>
References: <1563881524-147440-1-git-send-email-xiaolin.zhang@intel.com>
 <1563881524-147440-2-git-send-email-xiaolin.zhang@intel.com>
 <156387421346.31349.17560663189266498755@skylake-alporthouse-com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.4.100]
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
Cc: "Wang, Zhenyu Z" <zhenyu.z.wang@intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>, "Yuan,
 Hang" <hang.yuan@intel.com>, "He, Min" <min.he@intel.com>, "Lv,
 Zhiyuan" <zhiyuan.lv@intel.com>, "Wang, Zhi A" <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gMDcvMjMvMjAxOSAwNTozMCBQTSwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+IFF1b3RpbmcgWGlh
b2xpbiBaaGFuZyAoMjAxOS0wNy0yMyAxMjozMTo1NikKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2k5MTVfdmdwdS5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV92Z3B1
LmMKPj4gaW5kZXggZGJkMWZhMy4uOWIzN2RkMSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvaTkxNV92Z3B1LmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV92
Z3B1LmMKPj4gQEAgLTk1LDcgKzk1LDE0IEBAIHZvaWQgaTkxNV9kZXRlY3RfdmdwdShzdHJ1Y3Qg
ZHJtX2k5MTVfcHJpdmF0ZSAqZGV2X3ByaXYpCj4+ICAgICAgICAgZGV2X3ByaXYtPnZncHUuY2Fw
cyA9IHJlYWRsKHNoYXJlZF9hcmVhICsgdmd0aWZfb2Zmc2V0KHZndF9jYXBzKSk7Cj4+ICAKPj4g
ICAgICAgICBkZXZfcHJpdi0+dmdwdS5hY3RpdmUgPSB0cnVlOwo+PiAtICAgICAgIERSTV9JTkZP
KCJWaXJ0dWFsIEdQVSBmb3IgSW50ZWwgR1ZULWcgZGV0ZWN0ZWQuXG4iKTsKPj4gKwo+PiArICAg
ICAgIGlmICghaW50ZWxfdmdwdV9jaGVja19wdl9jYXBzKGRldl9wcml2LCBzaGFyZWRfYXJlYSkp
IHsKPj4gKyAgICAgICAgICAgICAgIERSTV9JTkZPKCJWaXJ0dWFsIEdQVSBmb3IgSW50ZWwgR1ZU
LWcgZGV0ZWN0ZWQuXG4iKTsKPj4gKyAgICAgICAgICAgICAgIHJldHVybjsKPj4gKyAgICAgICB9
Cj4+ICsKPj4gKyAgICAgICBEUk1fSU5GTygiVmlydHVhbCBHUFUgZm9yIEludGVsIEdWVC1nIGRl
dGVjdGVkIHdpdGggcHZfY2FwcyAweCV4LlxuIiwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ZGV2X3ByaXYtPnZncHUucHZfY2Fwcyk7Cj4gVGhpcyBpcyBhIHVzZXItZmFjaW5nIG1lc3NhZ2Us
IGF2b2lkIHVzaW5nIGFueSBqYXJnb24uIEluc3RlYWQgb2YKPiBwdl9jYXBzOiV4LCBleHBhbmQg
aXQgdG8gYSBzZXQgb2Ygc3RyaW5ncyBpZiB5b3UgdGhpbmsgaXQncyBpbXBvcnRhbnQKPiBmb3Ig
dGhlIHVzZXIgdG8ga25vdy4gSXQncyBwcm9iYWJseSBub3QhIEJ1dCB5b3UgcHJvYmFibHkgd2Fu
dCB0bwo+IGluY2x1ZGUgdGhlIGNhcHMgaW4gZGVidWdmcy9pOTE1X2NhcGFiaWxpdGllcy4KPiAt
Q2hyaXMKPgpDaHJpcywgdGhhbmtzIHlvdXIgdGltZSB0byByZXZpZXcgYW5kIGl0IGlzIGdvb2Qg
cG9pbnQuCkkgd2lsbCBwb2xpc2ggdGhlIG1lc3NhZ2UgbGlrZSB0aGlzICJ4eHggR1ZULWcgZGV0
ZWN0ZWQgd2l0aCBQVgpPcHRpbWl6YXRpb25zLiIKYW5kIHdpbGwgaW5jbHVkZSB0aGUgcHYgY2Fw
cyBpbiBkZWJ1Z2ZzL2k5MTVfY2FwYWJpbGl0aWVzLiBkbyB5b3UgdGhpbmsKaXMgaXQgYmV0dGVy
PwotQlJzLCBYaWFvbGluCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vaW50ZWwtZ3Z0LWRldg==
