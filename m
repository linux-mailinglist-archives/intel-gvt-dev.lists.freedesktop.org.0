Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 480635ACA5
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 29 Jun 2019 18:54:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0219C89C18;
	Sat, 29 Jun 2019 16:54:48 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
X-Greylist: delayed 552 seconds by postgrey-1.36 at gabe;
 Sat, 29 Jun 2019 16:54:46 UTC
Received: from smtprelay.hostedemail.com (smtprelay0058.hostedemail.com
 [216.40.44.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C22D89A60
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 29 Jun 2019 16:54:46 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave06.hostedemail.com (Postfix) with ESMTP id 06C3D8123E26
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 29 Jun 2019 16:45:35 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay08.hostedemail.com (Postfix) with ESMTP id 72872182CF666;
 Sat, 29 Jun 2019 16:45:32 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com,
 :::::::::::::::::::::::::::::::::::::::,
 RULES_HIT:41:355:379:599:800:960:968:973:982:988:989:1260:1277:1311:1313:1314:1345:1359:1431:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2393:2553:2559:2562:2828:3138:3139:3140:3141:3142:3353:3622:3865:3866:3867:3868:3870:3871:3872:3874:4037:4321:5007:6742:10004:10400:10848:10967:11232:11658:11914:12043:12297:12663:12740:12760:12895:13069:13138:13231:13311:13357:13439:14096:14097:14181:14659:14721:21080:21433:21627:30034:30054:30070:30090:30091,
 0,
 RBL:23.242.196.136:@perches.com:.lbl8.mailshell.net-62.14.0.180 64.201.201.201,
 CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none, DomainCache:0,
 MSF:not bulk, SPF:fn, MSBL:0, DNSBL:neutral, Custom_rules:0:0:0, LFtime:24,
 LUA_SUMMARY:none
X-HE-Tag: wood26_67b7f2b025644
X-Filterd-Recvd-Size: 3038
Received: from XPS-9350 (cpe-23-242-196-136.socal.res.rr.com [23.242.196.136])
 (Authenticated sender: joe@perches.com)
 by omf01.hostedemail.com (Postfix) with ESMTPA;
 Sat, 29 Jun 2019 16:45:12 +0000 (UTC)
Message-ID: <c3b83ba7f9b003dd4fb9cad885461ce93165dc04.camel@perches.com>
Subject: Re: [PATCH V2] include: linux: Regularise the use of FIELD_SIZEOF
 macro
From: Joe Perches <joe@perches.com>
To: Alexey Dobriyan <adobriyan@gmail.com>, Andreas Dilger <adilger@dilger.ca>
Date: Sat, 29 Jun 2019 09:45:10 -0700
In-Reply-To: <20190629142510.GA10629@avx2>
References: <20190611193836.2772-1-shyam.saini@amarulasolutions.com>
 <20190611134831.a60c11f4b691d14d04a87e29@linux-foundation.org>
 <6DCAE4F8-3BEC-45F2-A733-F4D15850B7F3@dilger.ca>
 <20190629142510.GA10629@avx2>
User-Agent: Evolution 3.30.5-0ubuntu0.18.10.1 
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
Cc: keescook@chromium.org, kvm@vger.kernel.org,
 kernel-hardening@lists.openwall.com, netdev@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, devel@lists.orangefs.org,
 linux-kernel@vger.kernel.org, Shyam Saini <shyam.saini@amarulasolutions.com>,
 linux-mips@vger.kernel.org, linux-mm@kvack.org, linux-sctp@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-ext4 <linux-ext4@vger.kernel.org>, intel-gvt-dev@lists.freedesktop.org,
 bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 mayhs11saini@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gU2F0LCAyMDE5LTA2LTI5IGF0IDE3OjI1ICswMzAwLCBBbGV4ZXkgRG9icml5YW4gd3JvdGU6
Cj4gT24gVHVlLCBKdW4gMTEsIDIwMTkgYXQgMDM6MDA6MTBQTSAtMDYwMCwgQW5kcmVhcyBEaWxn
ZXIgd3JvdGU6Cj4gPiBPbiBKdW4gMTEsIDIwMTksIGF0IDI6NDggUE0sIEFuZHJldyBNb3J0b24g
PGFrcG1AbGludXgtZm91bmRhdGlvbi5vcmc+IHdyb3RlOgo+ID4gPiBPbiBXZWQsIDEyIEp1biAy
MDE5IDAxOjA4OjM2ICswNTMwIFNoeWFtIFNhaW5pIDxzaHlhbS5zYWluaUBhbWFydWxhc29sdXRp
b25zLmNvbT4gd3JvdGU6Cj4gPiBJIGRpZCBhIGNoZWNrLCBhbmQgRklFTERfU0laRU9GKCkgaXMg
dXNlZCBhYm91dCAzNTB4LCB3aGlsZSBzaXplb2ZfZmllbGQoKQo+ID4gaXMgYWJvdXQgMzB4LCBh
bmQgU0laRU9GX0ZJRUxEKCkgaXMgb25seSBhYm91dCA1eC4KPiA+IAo+ID4gVGhhdCBzYWlkLCBJ
J20gbXVjaCBtb3JlIGluIGZhdm91ciBvZiAic2l6ZW9mX2ZpZWxkKCkiIG9yICJzaXplb2ZfbWVt
YmVyKCkiCj4gPiB0aGFuIEZJRUxEX1NJWkVPRigpLiAgTm90IG9ubHkgZG9lcyB0aGF0IGJldHRl
ciBtYXRjaCAib2Zmc2V0b2YoKSIsIHdpdGgKPiA+IHdoaWNoIGl0IGlzIGNsb3NlbHkgcmVsYXRl
ZCwgYnV0IGlzIGFsc28gY2xvc2VyIHRvIHRoZSBvcmlnaW5hbCAic2l6ZW9mKCkiLgo+ID4gCj4g
PiBTaW5jZSB0aGlzIGlzIGEgcmF0aGVyIHRyaXZpYWwgY2hhbmdlLCBpdCBjYW4gYmUgc3BsaXQg
aW50byBhIG51bWJlciBvZgo+ID4gcGF0Y2hlcyB0byBnZXQgYXBwcm92YWwvbGFuZGluZyB2aWEg
c3Vic3lzdGVtIG1haW50YWluZXJzLCBhbmQgdGhlcmUgaXMgbm8KPiA+IGh1Z2UgdXJnZW5jeSB0
byByZW1vdmUgdGhlIG9yaWdpbmFsIG1hY3JvcyB1bnRpbCB0aGUgdXNlcnMgYXJlIGdvbmUuICBJ
dAo+ID4gd291bGQgbWFrZSBzZW5zZSB0byByZW1vdmUgU0laRU9GX0ZJRUxEKCkgYW5kIHNpemVv
Zl9maWVsZCgpIHF1aWNrbHkgc28KPiA+IHRoZXkgZG9uJ3QgZ2FpbiBtb3JlIHVzZXJzLCBhbmQg
dGhlIHJlbWFpbmluZyBGSUVMRF9TSVpFT0YoKSB1c2VycyBjYW4gYmUKPiA+IHdoaXR0bGVkIGF3
YXkgYXMgdGhlIHBhdGNoZXMgY29tZSB0aHJvdWdoIHRoZSBtYWludGFpbmVyIHRyZWVzLgo+IAo+
IFRoZSBzaWduYXR1cmUgc2hvdWxkIGJlCj4gCj4gCXNpemVvZl9tZW1iZXIoVCwgbSkKPiAKPiBp
dCBpcyBwcm9wZXIgRW5nbGlzaCwKPiBpdCBpcyBsb3dlcmNhc2UsIHNvIGlzIGVhc2llciB0byB0
eXBlLAo+IGl0IHVzZXMgc3RhbmRhcmQgdGVybSAobWVtYmVyLCBub3QgZmllbGQpLAo+IGl0IGJs
ZW5kcyBpbiB3aXRoIHN0YW5kYXJkICJzaXplb2YiIG9wZXJhdG9yLAoKeWVzIHBsZWFzZS4KCkFs
c28sIGEgc2ltcGxlIHNjcmlwdCBjb252ZXJzaW9uIGFwcGxpZWQKaW1tZWRpYXRlbHkgYWZ0ZXIg
YW4gcmMxIG1pZ2h0IGJlIGVhc2llc3QKcmF0aGVyIHRoYW4gaW5kaXZpZHVhbCBwYXRjaGVzLgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2
dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRl
dg==
