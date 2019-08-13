Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AF58BA93
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 13 Aug 2019 15:41:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99E2C6E146;
	Tue, 13 Aug 2019 13:41:36 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 758BD6E146;
 Tue, 13 Aug 2019 13:41:35 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Aug 2019 06:41:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,381,1559545200"; d="scan'208";a="194196191"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.150])
 by fmsmga001.fm.intel.com with ESMTP; 13 Aug 2019 06:41:32 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, "Vivi\,
 Rodrigo" <rodrigo.vivi@intel.com>
Subject: Re: [PULL] gvt-fixes
In-Reply-To: <20190813095845.GF19140@zhen-hp.sh.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20190813095845.GF19140@zhen-hp.sh.intel.com>
Date: Tue, 13 Aug 2019 16:41:32 +0300
Message-ID: <87blwtgp2r.fsf@intel.com>
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

T24gVHVlLCAxMyBBdWcgMjAxOSwgWmhlbnl1IFdhbmcgPHpoZW55dXdAbGludXguaW50ZWwuY29t
PiB3cm90ZToKPiBIaSwKPgo+IEhlcmUncyBvbmUgZ3Z0IGZpeCBmb3IgNS4zLXJjLCB0byBmaXgg
b25lIHVzZS1hZnRlci1mcmVlIGlzc3VlCj4gaW50cm9kdWNlZCBpbiBsYXN0IGZpeGVzIHB1bGwu
CgpUaGFua3MsIHB1bGxlZC4KCkJSLApKYW5pLgoKPgo+IFRoYW5rcwo+IC0tCj4gVGhlIGZvbGxv
d2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA0MTg3NDE0ODA4MDk1ZjY0NWNhMDY2MWY4ZGRlNzc2
MTdlMmU3Y2IzOgo+Cj4gICBkcm0vaTkxNS9ndnQ6IEFkZGluZyBwcGd0dCB0byBHVlQgR0VNIGNv
bnRleHQgYWZ0ZXIgc2hhZG93IHBkcHMgc2V0dGxlZC4gKDIwMTktMDctMzAgMTQ6MzA6NTYgKzA4
MDApCj4KPiBhcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKPgo+ICAgaHR0
cHM6Ly9naXRodWIuY29tL2ludGVsL2d2dC1saW51eC5naXQgdGFncy9ndnQtZml4ZXMtMjAxOS0w
OC0xMwo+Cj4gZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIGVhYzQ0NzFkMDg4MmRhMTRi
ZTY1MmVmMGE1NWI5MTQxNDVmYWIxNWE6Cj4KPiAgIGRybS9pOTE1OiBVc2UgYWZ0ZXIgZnJlZSBp
biBlcnJvciBwYXRoIGluIGludGVsX3ZncHVfY3JlYXRlX3dvcmtsb2FkKCkgKDIwMTktMDgtMDkg
MTY6MDQ6MTggKzA4MDApCj4KPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gZ3Z0LWZpeGVzLTIwMTktMDgtMTMKPgo+IC0g
Rml4IG9uZSB1c2UtYWZ0ZXItZnJlZSBlcnJvciAoRGFuKQo+Cj4gLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IERhbiBDYXJw
ZW50ZXIgKDEpOgo+ICAgICAgIGRybS9pOTE1OiBVc2UgYWZ0ZXIgZnJlZSBpbiBlcnJvciBwYXRo
IGluIGludGVsX3ZncHVfY3JlYXRlX3dvcmtsb2FkKCkKPgo+ICBkcml2ZXJzL2dwdS9kcm0vaTkx
NS9ndnQvc2NoZWR1bGVyLmMgfCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKCi0tIApKYW5pIE5pa3VsYSwgSW50ZWwgT3BlbiBTb3VyY2Ug
R3JhcGhpY3MgQ2VudGVyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vaW50ZWwtZ3Z0LWRldg==
