Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E84501121A9
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  4 Dec 2019 03:58:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97BC66E04E;
	Wed,  4 Dec 2019 02:58:29 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D2F36E04E
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  4 Dec 2019 02:58:18 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Dec 2019 18:58:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,275,1571727600"; d="scan'208";a="361412609"
Received: from coxu-arch-shz.sh.intel.com (HELO [10.239.160.35])
 ([10.239.160.35])
 by orsmga004.jf.intel.com with ESMTP; 03 Dec 2019 18:58:16 -0800
Subject: Re: [PATCH 2/3] drm/i915/gvt: use vgpu lock for active state setting
To: Zhenyu Wang <zhenyuw@linux.intel.com>, intel-gvt-dev@lists.freedesktop.org
References: <20191202070109.73924-1-zhenyuw@linux.intel.com>
 <20191202070109.73924-2-zhenyuw@linux.intel.com>
From: Colin Xu <Colin.Xu@intel.com>
Message-ID: <37d467e5-62bc-bca8-ab74-d9647acb4759@intel.com>
Date: Wed, 4 Dec 2019 10:58:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191202070109.73924-2-zhenyuw@linux.intel.com>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

WWVzIGhlcmUgc2hvdWxkIHVzZSB2Z3B1X2xvY2sgaW5zdGVhZCBvZiBndnQtPmxvY2suCk1hZGUg
dGhpcyB3cm9uZyBpbiBpbml0aWFsIHN1Ym1pdC4gVGhhbmtzIGZvciBjYXRjaGluZyBvdXQuCgpS
ZXZpZXdlZC1ieTogQ29saW4gWHUgPGNvbGluLnh1QGludGVsLmNvbT4KCk9uIDIwMTktMTItMDIg
MTU6MDEsIFpoZW55dSBXYW5nIHdyb3RlOgo+IE5lZWQgdG8gYWxpZ24gd2l0aCBkZWFjdGl2YXRl
LCBzaG91bGQgb25seSB1c2UgdmdwdSdzIGxvY2sgZm9yCj4gYWN0aXZlIHN0YXRlIHNldHRpbmcg
aW5zdGVhZCBvZiBndnQgbG9jay4KPgo+IEZpeGVzOiBmMjVhNDlhYjhhYjkgKCJkcm0vaTkxNS9n
dnQ6IFVzZSB2Z3B1X2xvY2sgdG8gcHJvdGVjdCBwZXIgdmdwdSBhY2Nlc3MiKQo+IENjOiBDb2xp
biBYdSA8Y29saW4ueHVAaW50ZWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFpoZW55dSBXYW5nIDx6
aGVueXV3QGxpbnV4LmludGVsLmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2
dC92Z3B1LmMgfCA0ICsrLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3Zn
cHUuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC92Z3B1LmMKPiBpbmRleCBkNWE2ZTRlM2Qw
ZmQuLjg1YmQ5YmY0ZjZlZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQv
dmdwdS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3ZncHUuYwo+IEBAIC0yMTIs
OSArMjEyLDkgQEAgc3RhdGljIHZvaWQgaW50ZWxfZ3Z0X3VwZGF0ZV92Z3B1X3R5cGVzKHN0cnVj
dCBpbnRlbF9ndnQgKmd2dCkKPiAgICAqLwo+ICAgdm9pZCBpbnRlbF9ndnRfYWN0aXZhdGVfdmdw
dShzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSkKPiAgIHsKPiAtCW11dGV4X2xvY2soJnZncHUtPmd2
dC0+bG9jayk7Cj4gKwltdXRleF9sb2NrKCZ2Z3B1LT52Z3B1X2xvY2spOwo+ICAgCXZncHUtPmFj
dGl2ZSA9IHRydWU7Cj4gLQltdXRleF91bmxvY2soJnZncHUtPmd2dC0+bG9jayk7Cj4gKwltdXRl
eF91bmxvY2soJnZncHUtPnZncHVfbG9jayk7Cj4gICB9Cj4gICAKPiAgIC8qKgoKLS0gCkJlc3Qg
UmVnYXJkcywKQ29saW4gWHUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vaW50ZWwtZ3Z0LWRldg==
