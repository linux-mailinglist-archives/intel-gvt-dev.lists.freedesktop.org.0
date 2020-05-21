Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C89CD1DC437
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 21 May 2020 02:50:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 571BE6E8DE;
	Thu, 21 May 2020 00:50:35 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81BC16E8DE
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 21 May 2020 00:50:34 +0000 (UTC)
IronPort-SDR: GA1v9L7L8J5pzDyv7HmPA3kr7tPFoeMefdatNjUL42Faf6gWyprTO3qt64MMdsItWl/4UIvoIf
 s9NCMlhKP5GQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2020 17:50:34 -0700
IronPort-SDR: gX20VhLNNxjyKpFuyMuje6t86vVuDP2P5akpHyJjtW/+zI9X5WRSEar73LMHjBoWvDymr/+HGJ
 2Gs/zbllUSxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,416,1583222400"; d="scan'208";a="255162794"
Received: from unknown (HELO [10.239.160.120]) ([10.239.160.120])
 by fmsmga008.fm.intel.com with ESMTP; 20 May 2020 17:50:33 -0700
Subject: Re: [PATCH 2/2] drm/i915/gvt: Add GVT suspend/resume routine to i915.
From: Colin Xu <Colin.Xu@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
References: <20200518062852.158709-1-colin.xu@intel.com>
 <20200518062852.158709-3-colin.xu@intel.com>
 <20200518104513.GY18545@zhen-hp.sh.intel.com>
 <2302b038-e847-cb63-b4bc-450ca461b4c8@intel.com>
Message-ID: <2fbb2843-8c7e-c19b-3e46-2cb268fe1c9f@intel.com>
Date: Thu, 21 May 2020 08:50:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <2302b038-e847-cb63-b4bc-450ca461b4c8@intel.com>
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
Reply-To: Colin.Xu@intel.com
Cc: intel-gvt-dev@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Ck9uIDIwMjAtMDUtMjEgMDg6MzcsIENvbGluIFh1IHdyb3RlOgo+Cj4gT24gMjAyMC0wNS0xOCAx
ODo0NSwgWmhlbnl1IFdhbmcgd3JvdGU6Cj4+IE9uIDIwMjAuMDUuMTggMTQ6Mjg6NTIgKzA4MDAs
IENvbGluIFh1IHdyb3RlOgo+Pj4gQWRkIEdWVCBzdXNwZW5kL3Jlc3VtZSByb3V0aW5lIHRvIGk5
MTUuCj4+PiBHVlQgcmVsaWVzIG9uIGk5MTUgc28gc3VzcGVuZCBhaGVhZCBvZiBvdGhlciBpOTE1
IHJvdXRpbmUsIGFuZCByZXN1bWUKPj4+IGF0IGxhc3QgdmljZSB2ZXJzYS4KPj4+Cj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBIYW5nIFl1YW4gPGhhbmcueXVhbkBsaW51eC5pbnRlbC5jb20+Cj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBDb2xpbiBYdSA8Y29saW4ueHVAaW50ZWwuY29tPgo+Pj4gLS0tCj4+PiDCoCBk
cml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2Rydi5jIHwgMTUgKysrKysrKysrKysrKysrCj4+PiDC
oCAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2Rydi5jIAo+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9pOTE1X2Rydi5jCj4+PiBpbmRleCAzNGVlMTJmM2YwMmQuLmM1ZDdkNThkZjY3ZSAxMDA2NDQK
Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZHJ2LmMKPj4+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2k5MTVfZHJ2LmMKPj4+IEBAIC04Nyw2ICs4NywxMCBAQAo+Pj4gwqAg
I2luY2x1ZGUgImludGVsX3BtLmgiCj4+PiDCoCAjaW5jbHVkZSAidmx2X3N1c3BlbmQuaCIKPj4+
IMKgICsjaWYgSVNfRU5BQkxFRChDT05GSUdfRFJNX0k5MTVfR1ZUKQo+Pj4gKyNpbmNsdWRlICJn
dnQuaCIKPj4+ICsjZW5kaWYKPj4+ICsKPj4+IMKgIHN0YXRpYyBzdHJ1Y3QgZHJtX2RyaXZlciBk
cml2ZXI7Cj4+PiDCoCDCoCBzdGF0aWMgaW50IGk5MTVfZ2V0X2JyaWRnZV9kZXYoc3RydWN0IGRy
bV9pOTE1X3ByaXZhdGUgKmRldl9wcml2KQo+Pj4gQEAgLTExNzcsNiArMTE4MSwxMSBAQCBzdGF0
aWMgaW50IGk5MTVfZHJtX3N1c3BlbmQoc3RydWN0IGRybV9kZXZpY2UgCj4+PiAqZGV2KQo+Pj4g
wqAgwqDCoMKgwqDCoCBkcm1fa21zX2hlbHBlcl9wb2xsX2Rpc2FibGUoZGV2KTsKPj4+IMKgICsj
aWYgSVNfRU5BQkxFRChDT05GSUdfRFJNX0k5MTVfR1ZUKQo+Pj4gK8KgwqDCoCBpZiAoZGV2X3By
aXYtPmd2dCkKPj4+ICvCoMKgwqDCoMKgwqDCoCBpbnRlbF9ndnRfcG1fc3VzcGVuZChkZXZfcHJp
di0+Z3Z0KTsKPj4+ICsjZW5kaWYKPj4+ICsKPj4+IMKgwqDCoMKgwqAgcGNpX3NhdmVfc3RhdGUo
cGRldik7Cj4+PiDCoCDCoMKgwqDCoMKgIGludGVsX2Rpc3BsYXlfc3VzcGVuZChkZXYpOwo+Pj4g
QEAgLTEzNTQsNiArMTM2MywxMiBAQCBzdGF0aWMgaW50IGk5MTVfZHJtX3Jlc3VtZShzdHJ1Y3Qg
ZHJtX2RldmljZSAKPj4+ICpkZXYpCj4+PiDCoCDCoMKgwqDCoMKgIGludGVsX3Bvd2VyX2RvbWFp
bnNfZW5hYmxlKGRldl9wcml2KTsKPj4+IMKgICsjaWYgSVNfRU5BQkxFRChDT05GSUdfRFJNX0k5
MTVfR1ZUKQo+Pj4gK8KgwqDCoCBpZiAoZGV2X3ByaXYtPmd2dCkgewo+PiBpbnRlbF9ndnRfYWN0
aXZlKCkKPiBBbG1vc3QgZm9yZ290IHdlIGhhdmUgdGhpcyBmdW5jdGlvbiBjYW4gdXNlLiBUaGFu
a3MuCj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGludGVsX2d2dF9wbV9yZXN1bWUoZGV2X3By
aXYtPmd2dCk7Cj4+PiArwqDCoMKgIH0KPj4+ICsjZW5kaWYKPj4+ICsKPj4+IGVuYWJsZV9ycG1f
d2FrZXJlZl9hc3NlcnRzKCZkZXZfcHJpdi0+cnVudGltZV9wbSk7Cj4+Pgo+PiBKdXN0IHdyYXAg
dGhpcyBpbiBpbnRlbF9ndnQuYy8uaCB3aGljaCBpcyBpOTE1IGd2dCBob3N0IHNpZGUgY2FsbGVy
LCAKPj4gdGhlbgo+PiBpOTE1IGNvZGUganVzdCBjYWxsIGludGVsX2d2dF9wbV9zdXNwZW5kL3Jl
c3VtZSgpLgo+Cj4gSXQgbWFrZXMgdGhlIGludGVncmF0aW9uIG1vcmUgY2xlYW4uCj4KPiBJJ2xs
IG1vdmUgdGhlIGNvZGUgYW5kIHVwZGF0ZSBpbiBWMiBhbmQgaW5jbHVkZSBpbnRlbC1nZnguIFRo
YW5rcy4KCkJUVy4gSXMgaXQgbmVjZXNzYXJ5IHRvIGltcGxlbWVudCBwbSBzdXNwZW5kL3Jlc3Vt
ZcKgIGJvZHkgaW4gZ3Z0LmMgCmluc3RlYWQgb2YgaW50ZWxfZ3Z0PwoKaTkxNV9kcnYuYyAtPiBp
bnRlbF9ndnQuYyAtPiBndnQuYwoKb3IKCmk5MTVfZHJ2LmMgLT5pbnRlbF9ndnQuYwoKV2hpY2gg
aXMgYmV0dGVyPwoKQ3VycmVudCBpbnRlbF9ndnQuYyBsb29rcyBvbmx5IGEgd3JhcHBlciBjb2Rl
IHdoaWxlIGFsbCBpbXBsZW1lbnRhdGlvbiAKYWN0dWFsbHkgaW4gZ3Z0LmMuCgo+Cj4+PiDCoMKg
wqDCoMKgIHJldHVybiAwOwo+Pj4gLS0gCj4+PiAyLjI2LjIKPj4+Cj4+PiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+Pj4gaW50ZWwtZ3Z0LWRldiBtYWls
aW5nIGxpc3QKPj4+IGludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4+PiBodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXYK
PgotLSAKQmVzdCBSZWdhcmRzLApDb2xpbiBYdQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0
LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2Cg==
