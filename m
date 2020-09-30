Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2788A27E7FA
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 30 Sep 2020 13:54:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9F0889C88;
	Wed, 30 Sep 2020 11:54:35 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC4AF6E7D5;
 Wed, 30 Sep 2020 11:54:34 +0000 (UTC)
IronPort-SDR: c88YqifepNDZLT2nfBvNWWBEgCKgXQOPdkBy44/SkBhBy/M8AMkOOWZUGuV9vnsBnFN5nTEhEw
 Tb/MxmofFOWA==
X-IronPort-AV: E=McAfee;i="6000,8403,9759"; a="180589829"
X-IronPort-AV: E=Sophos;i="5.77,322,1596524400"; d="scan'208";a="180589829"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2020 04:54:34 -0700
IronPort-SDR: 5qpA4V3ZPbkkv3ITyNVIz4OkXzMWi4UascHYtuIBTYvn0NyRyZR46AddJYfuIjlznjXFxO1IZB
 4VF7CaQpPGOg==
X-IronPort-AV: E=Sophos;i="5.77,322,1596524400"; d="scan'208";a="497191910"
Received: from cbalasoi-mobl1.ger.corp.intel.com (HELO [10.249.36.189])
 ([10.249.36.189])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2020 04:54:32 -0700
Subject: Re: [Intel-gfx] [PULL] topic/gvt-ww-lock
To: "Wang, Zhi A" <zhi.a.wang@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "Nikula, Jani" <jani.nikula@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, "Yuan, Hang"
 <hang.yuan@intel.com>, "Lv, Zhiyuan" <zhiyuan.lv@intel.com>,
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>
References: <4b78ef66-a74f-9156-62fb-bb733947b57e@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <505b138f-46d7-5599-3b41-646508b3bd5b@linux.intel.com>
Date: Wed, 30 Sep 2020 13:54:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <4b78ef66-a74f-9156-62fb-bb733947b57e@intel.com>
Content-Language: en-US
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

SGV5LAoKT3AgMjItMDktMjAyMCBvbSAxMzo1MSBzY2hyZWVmIFdhbmcsIFpoaSBBOgo+Cj4gSGks
Cj4KPiBIZXJlJ3MgdGhlIHBhdGNoIHdoaWNoIGludHJvZHVjZXMgR1ZULWcgd3cgbG9jayBzdXBw
b3J0IGFnYWluc3QgZHJtLWludGVsLWd0LW5leHQgYnJhbmNoLgo+Cj4gVGhhbmtzCj4KPiAtLSAK
Pgo+IFRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgNDMxNmIxOWRlZTI3Y2M1Y2Qz
NGE5NWZkYmMwYTNhNTIzNzUwNzcwMToKPgo+IMKgIGRybS9pOTE1OiBGaXggdW5pbml0aWFsaXNl
ZCB2YXJpYWJsZSBpbiBpbnRlbF9jb250ZXh0X2NyZWF0ZV9yZXF1ZXN0LiAoMjAyMC0wOS0yMSAx
MTowOTo0NiArMDIwMCkKPgo+IGFyZSBhdmFpbGFibGUgaW4gdGhlIGdpdCByZXBvc2l0b3J5IGF0
Ogo+Cj4gwqAgaHR0cHM6Ly9naXRodWIuY29tL2ludGVsL2d2dC1saW51eC5naXQgdGFncy9ndnQt
d3ctbG9jay0wOS0yMi0yMDIwCj4KPiBmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gZTFi
NDlhZTE1NTQ1MWFhYTAzOWVlYjIzZmNlODA4YzcxYTAzODI4MzoKPgo+IMKgIGRybS9pOTE1L2d2
dDogSW50cm9kdWNlIHBlciBvYmplY3QgbG9ja2luZyBpbiBHVlQgc2NoZWR1bGVyLiAoMjAyMC0w
OS0yMiAxMjowOTo1NiArMDMwMCkKPgo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiBndnQtd3ctbG9jay0wOS0yMi0yMDIw
Ogo+Cj4gLSBJbnRyb2R1Y2Ugd3cgbG9jayBzdXBwb3J0IGludG8gR1ZULWcuCj4KPiAtLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
Cj4gWmhpIFdhbmcgKDEpOgo+IMKgwqDCoMKgwqAgZHJtL2k5MTUvZ3Z0OiBJbnRyb2R1Y2UgcGVy
IG9iamVjdCBsb2NraW5nIGluIEdWVCBzY2hlZHVsZXIuCj4KPiDCoGRyaXZlcnMvZ3B1L2RybS9p
OTE1L2d2dC9zY2hlZHVsZXIuYyB8IDY4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0t
LS0tLQo+IMKgMSBmaWxlIGNoYW5nZWQsIDU3IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygt
KSAKCkkndmUgdGFrZW4gYSBsb29rIGF0IHRoaXMgYnJhbmNoLCBhbmQgSSBoYXZlIHNvbWUgZmVl
ZGJhY2suCgpBZGRpbmcgd3dfY3R4IGJsaW5kbHkgbGlrZSBpcyBkb25lIGRvZXNuJ3Qgd29yay4g
Rm9yIGV4YW1wbGUgSSdtIHdvcmtpbmcgb24gYSBwYXRjaCB0aGF0IGFkZHMgd3cgaGFuZGxpbmcg
dG8KaTkxNV9nZW1fb2JqZWN0X2dndHRfcGluKCksIHNvIHlvdSBkb24ndCBoYXZlIHRvIHBlcmZv
cm0gbWFudWFsbHkgaW4gcHJlcGFyZV9zaGFkb3dfd2FfY3R4KCkuIGludGVsX2NvbnRleHRfcGlu
KCkgYWxyZWFkeSBoYXMgYSB3dyBkYW5jZSwgeW91IGNhbiBrZWVwIGNhbGxpbmcgaXQgd2l0aG91
dCBvcGVuIGNvZGluZyBpdC4gSWYgeW91IGRvIGRlY2lkZSB0byBjYWxsIGl0IG1hbnVhbGx5LCBp
bnRlbF9jb250ZXh0X3B1dCB3b3VsZCBoYXZlIHRvIGJlIGNhbGxlZCBhZnRlciBjdHhfZmluaS4g
Q2hlZXJzLCBNYWFydGVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2ludGVsLWd2dC1kZXYK
