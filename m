Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C28E6B7DC
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 17 Jul 2019 10:08:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C03416E287;
	Wed, 17 Jul 2019 08:08:35 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02C546E287
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 17 Jul 2019 08:08:33 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jul 2019 01:08:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,273,1559545200"; d="scan'208";a="167894267"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by fmsmga008.fm.intel.com with ESMTP; 17 Jul 2019 01:08:33 -0700
Received: from fmsmsx101.amr.corp.intel.com (10.18.124.199) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 17 Jul 2019 01:08:33 -0700
Received: from shsmsx104.ccr.corp.intel.com (10.239.4.70) by
 fmsmsx101.amr.corp.intel.com (10.18.124.199) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 17 Jul 2019 01:08:33 -0700
Received: from shsmsx107.ccr.corp.intel.com ([169.254.9.162]) by
 SHSMSX104.ccr.corp.intel.com ([169.254.5.110]) with mapi id 14.03.0439.000;
 Wed, 17 Jul 2019 16:08:31 +0800
From: "Zhang, Xiaolin" <xiaolin.zhang@intel.com>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] drm/i915/gvt: fix incorrect cache entry for guest page
 mapping
Thread-Topic: [PATCH] drm/i915/gvt: fix incorrect cache entry for guest page
 mapping
Thread-Index: AQHVPHA72TBsFrNvyUOTc0TP27TZJQ==
Date: Wed, 17 Jul 2019 08:08:31 +0000
Message-ID: <073732E20AE4C540AE91DBC3F07D4460876B39CE@SHSMSX107.ccr.corp.intel.com>
References: <1563378987-21880-1-git-send-email-xiaolin.zhang@intel.com>
 <20190717075507.GA14238@kroah.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.4.160]
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
Cc: "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gMDcvMTcvMjAxOSAwMzo1NSBQTSwgR3JlZyBLSCB3cm90ZToKPiBPbiBXZWQsIEp1bCAxNywg
MjAxOSBhdCAxMTo1NjoyN1BNICswODAwLCBYaWFvbGluIFpoYW5nIHdyb3RlOgo+PiBHUFUgaGFu
ZyBvYnNlcnZlZCBkdXJpbmcgdGhlIGd1ZXN0IE9DTCBjb25mb3JtYW5jZSB0ZXN0IHdoaWNoIGlz
IGNhdXNlZAo+PiBieSBUSFAgR1RUIGZlYXR1cmUgdXNlZCBkdXJuaW5nIHRoZSB0ZXN0Lgo+Pgo+
PiBJdCB3YXMgb2JzZXJ2ZWQgdGhlIHNhbWUgR0ZOIHdpdGggZGlmZmVyZW50IHNpemUgKDRLIGFu
ZCAyTSkgcmVxdWVzdGVkCj4+IGZyb20gdGhlIGd1ZXN0IGluIEdWVC4gU28gZHVyaW5nIHRoZSBn
dWVzdCBwYWdlIGRtYSBtYXAgc3RhZ2UsIGl0IGlzCj4+IHJlcXVpcmVkIHRvIHVubWFwIGZpcnN0
IHdpdGggb3JnaW5hbCBzaXplIGFuZCB0aGVuIHJlbWFwIGFnYWluIHdpdGgKPj4gcmVxdWVzdGVk
IHNpemUuCj4+Cj4+IEZpeGVzOiBiOTAxYjI1MmI2Y2YgKCJkcm0vaTkxNS9ndnQ6IEFkZCAyTSBo
dWdlIGd0dCBzdXBwb3J0IikKPj4gU2lnbmVkLW9mZi1ieTogWGlhb2xpbiBaaGFuZyA8eGlhb2xp
bi56aGFuZ0BpbnRlbC5jb20+Cj4+IC0tLQo+PiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2t2
bWd0LmMgfCAxMiArKysrKysrKysrKysKPj4gIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25z
KCspCj4gPGZvcm1sZXR0ZXI+Cj4KPiBUaGlzIGlzIG5vdCB0aGUgY29ycmVjdCB3YXkgdG8gc3Vi
bWl0IHBhdGNoZXMgZm9yIGluY2x1c2lvbiBpbiB0aGUKPiBzdGFibGUga2VybmVsIHRyZWUuICBQ
bGVhc2UgcmVhZDoKPiAgICAgaHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvaHRtbC9sYXRlc3Qv
cHJvY2Vzcy9zdGFibGUta2VybmVsLXJ1bGVzLmh0bWwKPiBmb3IgaG93IHRvIGRvIHRoaXMgcHJv
cGVybHkuCj4KPiA8L2Zvcm1sZXR0ZXI+Cj4KR3JlZywgVGhhbmtzIGdyZWF0IGluZm9ybWF0aW9u
IHRvIHBvaW50IG91dCB0aGlzIEkgYW0gbm90IGZ1bGx5IGF3YXJlLgp3aWxsIHJlc2VuZCB0byBj
b3JyZWN0IHRoaXMuCgotWGlhb2xpbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
