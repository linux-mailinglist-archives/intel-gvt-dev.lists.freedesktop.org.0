Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD634B36A
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 19 Jun 2019 09:54:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69F0C6E31C;
	Wed, 19 Jun 2019 07:54:57 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCC316E31C;
 Wed, 19 Jun 2019 07:54:55 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Jun 2019 00:54:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,392,1557212400"; d="scan'208";a="181583429"
Received: from mcostacx-wtg.ger.corp.intel.com (HELO localhost)
 ([10.249.47.136])
 by fmsmga001.fm.intel.com with ESMTP; 19 Jun 2019 00:54:52 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>, "Vivi\,
 Rodrigo" <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Re: [PULL] gvt-fixes
In-Reply-To: <20190619062240.GM9684@zhen-hp.sh.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20190619062240.GM9684@zhen-hp.sh.intel.com>
Date: Wed, 19 Jun 2019 10:56:08 +0300
Message-ID: <877e9im2jr.fsf@intel.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>, "Lv,
 Zhiyuan" <zhiyuan.lv@intel.com>, Zhi Wang <zhi.a.wang@intel.com>, "Yuan,
 Hang" <hang.yuan@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gV2VkLCAxOSBKdW4gMjAxOSwgWmhlbnl1IFdhbmcgPHpoZW55dXdAbGludXguaW50ZWwuY29t
PiB3cm90ZToKPiBIaSwKPgo+IEhlcmUncyBvbmUgZ3Z0IGZpeCBmb3IgNS4yLXJjNiB0byBzYW5p
dGl6ZSByZXNlcnZlZCByZWdpc3RlciB3cml0ZSBpbgo+IFBWSU5GTyB3aGljaCBzaG91bGQgYmUg
ZGlzY2FyZGVkLiBUaGlzIGZpeGVkIHNvbWUgZ3Vlc3QgYmVoYXZpb3Igd2hpY2gKPiBjb250YWlu
IHNvbWUgdW5tZXJnZWQgZmVhdHVyZXMgdGhhdCBwcm9iZSB0aHJvdWdoIFBWSU5GTyByZWdpc3Rl
ciBzdGF0ZS4KPgo+IFRoYW5rcy4KClB1bGxlZCB0byBkcm0taW50ZWwtZml4ZXMsIHRoYW5rcy4K
CkJSLApKYW5pLgoKCj4gLS0KPiBUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDE1
ZTdmNTJhNDU5NmI0OTZjZTNkYTJmYTRjMWY5NGM2ZmIwMDIzZjI6Cj4KPiAgIGRybS9pOTE1L2d2
dDogc2F2ZSBSSU5HX0hFQUQgaW50byB2cmVnIHdoZW4gdmdwdSBzd2l0Y2hlZCBvdXQgKDIwMTkt
MDYtMDMgMTM6MTg6MzYgKzA4MDApCj4KPiBhcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3Np
dG9yeSBhdDoKPgo+ICAgaHR0cHM6Ly9naXRodWIuY29tL2ludGVsL2d2dC1saW51eCB0YWdzL2d2
dC1maXhlcy0yMDE5LTA2LTE5Cj4KPiBmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gOTcx
YWZlYzNhNTM3M2Y5NjY4NGFkODk5NTc5ZjZhNGQ1MTQ2MjQxMDoKPgo+ICAgZHJtL2k5MTUvZ3Z0
OiBpZ25vcmUgdW5leHBlY3RlZCBwdmluZm8gd3JpdGUgKDIwMTktMDYtMTcgMTU6NDU6NDEgKzA4
MDApCj4KPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCj4gZ3Z0LWZpeGVzLTIwMTktMDYtMTkKPgo+IC0gRml4IHJlc2VydmVk
IFBWSU5GTyByZWdpc3RlciB3cml0ZSAoV2VpbmFuKQo+Cj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IFdlaW5hbiBMaSAo
MSk6Cj4gICAgICAgZHJtL2k5MTUvZ3Z0OiBpZ25vcmUgdW5leHBlY3RlZCBwdmluZm8gd3JpdGUK
Pgo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaGFuZGxlcnMuYyB8IDE1ICsrKysrKysrKy0t
LS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoK
LS0gCkphbmkgTmlrdWxhLCBJbnRlbCBPcGVuIFNvdXJjZSBHcmFwaGljcyBDZW50ZXIKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBt
YWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
