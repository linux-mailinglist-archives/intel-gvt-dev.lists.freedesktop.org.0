Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A579A99D
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 23 Aug 2019 10:07:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 788076EBEB;
	Fri, 23 Aug 2019 08:07:06 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D31586EBEA;
 Fri, 23 Aug 2019 08:07:05 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Aug 2019 01:07:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,420,1559545200"; d="scan'208";a="170058264"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by orsmga007.jf.intel.com with ESMTP; 23 Aug 2019 01:07:05 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 23 Aug 2019 01:07:05 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 23 Aug 2019 01:07:04 -0700
Received: from shsmsx101.ccr.corp.intel.com (10.239.4.153) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 23 Aug 2019 01:07:03 -0700
Received: from shsmsx107.ccr.corp.intel.com ([169.254.9.65]) by
 SHSMSX101.ccr.corp.intel.com ([169.254.1.80]) with mapi id 14.03.0439.000;
 Fri, 23 Aug 2019 16:07:02 +0800
From: "Zhang, Xiaolin" <xiaolin.zhang@intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915: to make vgpu ppgtt
 notificaiton as atomic operation
Thread-Topic: [Intel-gfx] [PATCH v2] drm/i915: to make vgpu ppgtt
 notificaiton as atomic operation
Thread-Index: AQHVWYAStc1z8bkPQE+oDmYb7X55Dg==
Date: Fri, 23 Aug 2019 08:07:01 +0000
Message-ID: <073732E20AE4C540AE91DBC3F07D4460876D3410@SHSMSX107.ccr.corp.intel.com>
References: <1566543451-13955-1-git-send-email-xiaolin.zhang@intel.com>
 <156654711627.27716.4474982727513548344@skylake-alporthouse-com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.4.101]
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
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gMDgvMjMvMjAxOSAwMzo1OCBQTSwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+IFF1b3RpbmcgWGlh
b2xpbiBaaGFuZyAoMjAxOS0wOC0yMyAwNzo1NzozMSkKPj4gdmdwdSBwcGd0dCBub3RpZmljYXRp
b24gd2FzIHNwbGl0IGludG8gMiBzdGVwcywgdGhlIGZpcnN0IHN0ZXAgaXMgdG8KPj4gdXBkYXRl
IFBWSU5GTydzIHBkcCByZWdpc3RlciBhbmQgdGhlbiB3cml0ZSBQVklORk8ncyBnMnZfbm90aWZ5
IHJlZ2lzdGVyCj4+IHdpdGggYWN0aW9uIGNvZGUgdG8gdGlyZ2dlciBwcGd0dCBub3RpZmljYXRp
b24gdG8gR1ZUIHNpZGUuCj4+Cj4+IGN1cnJlbnRseSB0aGVzZSBzdGVwcyB3ZXJlIG5vdCBhdG9t
aWMgb3BlcmF0aW9ucyBkdWUgdG8gbm8gYW55IHByb3RlY3Rpb24sCj4+IHNvIGl0IGlzIGVhc3kg
dG8gZW50ZXIgcmFjZSBjb25kaXRpb24gc3RhdGUgZHVyaW5nIHRoZSBNVEJGLCBzdHJlc3MgYW5k
Cj4+IElHVCB0ZXN0IHRvIGNhdXNlIEdQVSBoYW5nLgo+Pgo+PiB0aGUgc29sdXRpb24gaXMgdG8g
YWRkIGEgbG9jayB0byBtYWtlIHZncHUgcHBndHQgbm90aWNhdGlvbiBhcyBhdG9taWMKPj4gb3Bl
cmF0aW9uLgo+Pgo+PiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+PiBTaWduZWQtb2ZmLWJ5
OiBYaWFvbGluIFpoYW5nIDx4aWFvbGluLnpoYW5nQGludGVsLmNvbT4KPj4gLS0tCj4+ICBkcml2
ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2Rydi5oICAgICB8IDEgKwo+PiAgZHJpdmVycy9ncHUvZHJt
L2k5MTUvaTkxNV9nZW1fZ3R0LmMgfCA0ICsrKysKPj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5
MTVfdmdwdS5jICAgIHwgMSArCj4+ICAzIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQo+
Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9kcnYuaCBiL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2k5MTVfZHJ2LmgKPj4gaW5kZXggZWIzMWMxNi4uMzJlMTdjNCAxMDA2
NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9kcnYuaAo+PiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2Rydi5oCj4+IEBAIC05NjEsNiArOTYxLDcgQEAgc3RydWN0
IGk5MTVfZnJvbnRidWZmZXJfdHJhY2tpbmcgewo+PiAgfTsKPj4gIAo+PiAgc3RydWN0IGk5MTVf
dmlydHVhbF9ncHUgewo+PiArICAgICAgIHN0cnVjdCBtdXRleCBsb2NrOwo+PiAgICAgICAgIGJv
b2wgYWN0aXZlOwo+PiAgICAgICAgIHUzMiBjYXBzOwo+PiAgfTsKPj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZ2VtX2d0dC5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUv
aTkxNV9nZW1fZ3R0LmMKPj4gaW5kZXggMmNkMmRhYi4uZmYwYjE3OCAxMDA2NDQKPj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9nZW1fZ3R0LmMKPj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvaTkxNV9nZW1fZ3R0LmMKPj4gQEAgLTgzMyw2ICs4MzMsOCBAQCBzdGF0aWMgaW50
IGdlbjhfcHBndHRfbm90aWZ5X3ZndChzdHJ1Y3QgaTkxNV9wcGd0dCAqcHBndHQsIGJvb2wgY3Jl
YXRlKQo+PiAgICAgICAgIGVudW0gdmd0X2cydl90eXBlIG1zZzsKPj4gICAgICAgICBpbnQgaTsK
Pj4gIAo+PiArICAgICAgIG11dGV4X2xvY2soJmRldl9wcml2LT52Z3B1LmxvY2spOwo+PiArCj4+
ICAgICAgICAgaWYgKGNyZWF0ZSkKPj4gICAgICAgICAgICAgICAgIGF0b21pY19pbmMocHhfdXNl
ZChwcGd0dC0+cGQpKTsgLyogbmV2ZXIgcmVtb3ZlICovCj4+ICAgICAgICAgZWxzZQo+PiBAQCAt
ODYwLDYgKzg2Miw4IEBAIHN0YXRpYyBpbnQgZ2VuOF9wcGd0dF9ub3RpZnlfdmd0KHN0cnVjdCBp
OTE1X3BwZ3R0ICpwcGd0dCwgYm9vbCBjcmVhdGUpCj4+ICAKPj4gICAgICAgICBJOTE1X1dSSVRF
KHZndGlmX3JlZyhnMnZfbm90aWZ5KSwgbXNnKTsKPj4gIAo+IEhvdyBkbyB5b3Uga25vdyB0aGUg
b3BlcmF0aW9uIGlzIGNvbXBsZXRlIGFuZCBpdCBpcyBub3cgc2FmZSB0bwo+IG92ZXJ3cml0ZSB0
aGUgZGF0YSByZWdzPwo+IC1DaHJpcwo+CmJ5IGRlc2lnbiwgdGhlIGRhdGEgcmVnIHZhbHVlIGlz
IGNvcGllZCBvdXQgdG8gdXNlLCBzbyBhcyBsb25nIGFzIHRoZQphY3Rpb24gYW5kIGRhdGEgaXMg
b3BlcmF0ZWQgdG9nZXRoZXIsIGhvdyBsb25nIHRoZSBvcGVyYXRpb24gaXMgbm90IGEKaXNzdWUg
YW5kICBpdCBpcyBzYWZlIHRvIG92ZXJ3cml0ZSB0aGUgZGF0YSByZWdzIHdpdGggbmV3IGFjdGlv
biBuZXh0IHRpbWUuCgotQlJzLCBYaWFvbGluCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQt
ZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
