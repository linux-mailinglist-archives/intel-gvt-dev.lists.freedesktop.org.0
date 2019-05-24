Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D0D29288
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 24 May 2019 10:11:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D508F6E0A0;
	Fri, 24 May 2019 08:11:49 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A90236E09E
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 24 May 2019 08:11:48 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 May 2019 01:11:48 -0700
X-ExtLoop1: 1
Received: from joy-optiplex-7040.sh.intel.com (HELO joy-OptiPlex-7040)
 ([10.239.13.9])
 by orsmga005.jf.intel.com with ESMTP; 24 May 2019 01:11:46 -0700
Date: Fri, 24 May 2019 04:06:04 -0400
From: Yan Zhao <yan.y.zhao@intel.com>
To: Tina Zhang <tina.zhang@intel.com>
Subject: Re: [PATCH] drm/i915/gvt: Double check batch buffer size after copy
Message-ID: <20190524080604.GA27438@joy-OptiPlex-7040>
References: <20190524063954.3468-1-tina.zhang@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190524063954.3468-1-tina.zhang@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Reply-To: Yan Zhao <yan.y.zhao@intel.com>
Cc: intel-gvt-dev@lists.freedesktop.org, zhenyuw@linux.intel.com,
 hang.yuan@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMjQsIDIwMTkgYXQgMDI6Mzk6NTRQTSArMDgwMCwgVGluYSBaaGFuZyB3cm90
ZToKPiBEb3VibGUgY2hlY2sgdGhlIHNpemUgb2YgdGhlIHByaXZpbGVnZSBidWZmZXIgdG8gbWFr
ZSBzdXJlIHRoZSBzaXplCj4gcmVtYWlucyB1bmNoYW5nZWQgYWZ0ZXIgY29weS4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBUaW5hIFpoYW5nIDx0aW5hLnpoYW5nQGludGVsLmNvbT4KPiAtLS0KPiAgZHJp
dmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2NtZF9wYXJzZXIuYyB8IDEyICsrKysrKysrKysrLQo+ICAx
IGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvY21kX3BhcnNlci5jIGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZ3Z0L2NtZF9wYXJzZXIuYwo+IGluZGV4IGFiMDAyY2ZkM2NhYi4uOTZkYWRl
MzJhMzNjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9jbWRfcGFyc2Vy
LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvY21kX3BhcnNlci5jCj4gQEAgLTE3
MTcsNyArMTcxNyw3IEBAIHN0YXRpYyBpbnQgcGVyZm9ybV9iYl9zaGFkb3coc3RydWN0IHBhcnNl
cl9leGVjX3N0YXRlICpzKQo+ICAJc3RydWN0IGludGVsX3ZncHUgKnZncHUgPSBzLT52Z3B1Owo+
ICAJc3RydWN0IGludGVsX3ZncHVfc2hhZG93X2JiICpiYjsKPiAgCXVuc2lnbmVkIGxvbmcgZ21h
ID0gMDsKPiAtCXVuc2lnbmVkIGxvbmcgYmJfc2l6ZTsKPiArCXVuc2lnbmVkIGxvbmcgYmJfc2l6
ZSwgY2hlY2tfYmJfc2l6ZTsKPiAgCWludCByZXQgPSAwOwo+ICAJc3RydWN0IGludGVsX3ZncHVf
bW0gKm1tID0gKHMtPmJ1Zl9hZGRyX3R5cGUgPT0gR1RUX0JVRkZFUikgPwo+ICAJCXMtPnZncHUt
Pmd0dC5nZ3R0X21tIDogcy0+d29ya2xvYWQtPnNoYWRvd19tbTsKPiBAQCAtMTc4Myw2ICsxNzgz
LDE2IEBAIHN0YXRpYyBpbnQgcGVyZm9ybV9iYl9zaGFkb3coc3RydWN0IHBhcnNlcl9leGVjX3N0
YXRlICpzKQo+ICAJCWdvdG8gZXJyX3VubWFwOwo+ICAJfQo+ICAKPiArCXJldCA9IGZpbmRfYmJf
c2l6ZShzLCAmY2hlY2tfYmJfc2l6ZSk7Cj4gKwlpZiAocmV0KQo+ICsJCWdvdG8gZXJyX3VubWFw
Owo+ICsKY2FuIGp1c3QgY2hlY2sgd2hldGhlciB0aGUgYmF0Y2ggYnVmZmVyIGlzIGVuZGVkIHdp
dGggYmIgc3RhcnQgb3IgYmIgZW5kIHRvCmF2b2lkIGNhbGxpbmcgZmluZF9iYl9zaXplKCkgdHdp
Y2UsIHdoaWNoIGlzIGEgcmF0aGVyIGhlYXZ5IGNhbGwgYW5kIG1heSBjYXVzZQplbmRsZXNzIGxv
b3AgaW4gaXRzZWxmIGlmIG1heCBzaXplIGxpbWl0IGlzIG5vdCBpbXBvc2VkLgoKCj4gKwlpZiAo
Y2hlY2tfYmJfc2l6ZSAhPSBiYl9zaXplKSB7Cj4gKwkJZ3Z0X3ZncHVfZXJyKCJndWVzdCByaW5n
IGJ1ZmZlciBoYXMgYmVlbiBjaGFuZ2VkXG4iKTsKPiArCQlyZXQgPSAtRUlOVkFMOwo+ICsJCWdv
dG8gZXJyX3VubWFwOwo+ICsJfQo+ICsKPiAgCUlOSVRfTElTVF9IRUFEKCZiYi0+bGlzdCk7Cj4g
IAlsaXN0X2FkZCgmYmItPmxpc3QsICZzLT53b3JrbG9hZC0+c2hhZG93X2JiKTsKPiAgCj4gLS0g
Cj4gMi4xNy4xCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiBpbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAo+IGludGVsLWd2dC1kZXZAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9pbnRlbC1ndnQtZGV2Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
