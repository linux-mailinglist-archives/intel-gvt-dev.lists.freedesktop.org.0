Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55CBD4169F
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 11 Jun 2019 23:09:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 150EA890E9;
	Tue, 11 Jun 2019 21:09:10 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0475B890E9;
 Tue, 11 Jun 2019 21:09:09 +0000 (UTC)
Received: from akpm3.svl.corp.google.com (unknown [104.133.8.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 542412080A;
 Tue, 11 Jun 2019 21:09:08 +0000 (UTC)
Date: Tue, 11 Jun 2019 14:09:07 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Andreas Dilger <adilger@dilger.ca>
Subject: Re: [PATCH V2] include: linux: Regularise the use of FIELD_SIZEOF
 macro
Message-Id: <20190611140907.899bebb12a3d731da24a9ad1@linux-foundation.org>
In-Reply-To: <6DCAE4F8-3BEC-45F2-A733-F4D15850B7F3@dilger.ca>
References: <20190611193836.2772-1-shyam.saini@amarulasolutions.com>
 <20190611134831.a60c11f4b691d14d04a87e29@linux-foundation.org>
 <6DCAE4F8-3BEC-45F2-A733-F4D15850B7F3@dilger.ca>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1560287348;
 bh=qmpEoNXO99XPF9xd/5iv2nDwyZYxG+9HqzTYNPT4KTw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=EzYSNQ5VopjCkhJxjwzVG+3NUfKcn1X9cU/Ns4PV5yZIsnow5MRHYB73/Tl3T81K/
 SbRRApw7C7MWKpiNZqE5wCHVmQlPPOHtSxjsrM3RebqPsIl/mcOR/W6a0jpkC0UwOz
 rSPkBbLzTQO7F5VSs5bcQHmoWK/bst5kRMcBgC7c=
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
 linux-mips@vger.kernel.org, Shyam Saini <shyam.saini@amarulasolutions.com>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-sctp@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bpf@vger.kernel.org,
 linux-ext4 <linux-ext4@vger.kernel.org>, intel-gvt-dev@lists.freedesktop.org,
 Alexey Dobriyan <adobriyan@gmail.com>, linux-arm-kernel@lists.infradead.org,
 mayhs11saini@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gVHVlLCAxMSBKdW4gMjAxOSAxNTowMDoxMCAtMDYwMCBBbmRyZWFzIERpbGdlciA8YWRpbGdl
ckBkaWxnZXIuY2E+IHdyb3RlOgoKPiA+PiB0byBGSUVMRF9TSVpFT0YKPiA+IAo+ID4gQXMgQWxl
eGV5IGhhcyBwb2ludGVkIG91dCwgQyBzdHJ1Y3RzIGFuZCB1bmlvbnMgZG9uJ3QgaGF2ZSBmaWVs
ZHMgLQo+ID4gdGhleSBoYXZlIG1lbWJlcnMuICBTbyB0aGlzIGlzIGFuIG9wcG9ydHVuaXR5IHRv
IHN3aXRjaCBldmVyeXRoaW5nIHRvCj4gPiBhIG5ldyBtZW1iZXJfc2l6ZW9mKCkuCj4gPiAKPiA+
IFdoYXQgZG8gcGVvcGxlIHRoaW5rIG9mIHRoYXQgYW5kIGhvdyBkb2VzIHRoaXMgaW1wYWN0IHRo
ZSBwYXRjaCBmb290cHJpbnQ/Cj4gCj4gSSBkaWQgYSBjaGVjaywgYW5kIEZJRUxEX1NJWkVPRigp
IGlzIHVzZWQgYWJvdXQgMzUweCwgd2hpbGUgc2l6ZW9mX2ZpZWxkKCkKPiBpcyBhYm91dCAzMHgs
IGFuZCBTSVpFT0ZfRklFTEQoKSBpcyBvbmx5IGFib3V0IDV4LgoKRXJrLiAgU29ycnksIEkgc2hv
dWxkIGhhdmUgZ3JlcHBlZC4KCj4gVGhhdCBzYWlkLCBJJ20gbXVjaCBtb3JlIGluIGZhdm91ciBv
ZiAic2l6ZW9mX2ZpZWxkKCkiIG9yICJzaXplb2ZfbWVtYmVyKCkiCj4gdGhhbiBGSUVMRF9TSVpF
T0YoKS4gIE5vdCBvbmx5IGRvZXMgdGhhdCBiZXR0ZXIgbWF0Y2ggIm9mZnNldG9mKCkiLCB3aXRo
Cj4gd2hpY2ggaXQgaXMgY2xvc2VseSByZWxhdGVkLCBidXQgaXMgYWxzbyBjbG9zZXIgdG8gdGhl
IG9yaWdpbmFsICJzaXplb2YoKSIuCj4gCj4gU2luY2UgdGhpcyBpcyBhIHJhdGhlciB0cml2aWFs
IGNoYW5nZSwgaXQgY2FuIGJlIHNwbGl0IGludG8gYSBudW1iZXIgb2YKPiBwYXRjaGVzIHRvIGdl
dCBhcHByb3ZhbC9sYW5kaW5nIHZpYSBzdWJzeXN0ZW0gbWFpbnRhaW5lcnMsIGFuZCB0aGVyZSBp
cyBubwo+IGh1Z2UgdXJnZW5jeSB0byByZW1vdmUgdGhlIG9yaWdpbmFsIG1hY3JvcyB1bnRpbCB0
aGUgdXNlcnMgYXJlIGdvbmUuICBJdAo+IHdvdWxkIG1ha2Ugc2Vuc2UgdG8gcmVtb3ZlIFNJWkVP
Rl9GSUVMRCgpIGFuZCBzaXplb2ZfZmllbGQoKSBxdWlja2x5IHNvCj4gdGhleSBkb24ndCBnYWlu
IG1vcmUgdXNlcnMsIGFuZCB0aGUgcmVtYWluaW5nIEZJRUxEX1NJWkVPRigpIHVzZXJzIGNhbiBi
ZQo+IHdoaXR0bGVkIGF3YXkgYXMgdGhlIHBhdGNoZXMgY29tZSB0aHJvdWdoIHRoZSBtYWludGFp
bmVyIHRyZWVzLgoKSW4gdGhhdCBjYXNlIEknZCBzYXkgbGV0J3MgbGl2ZSB3aXRoIEZJRUxEX1NJ
WkVPRigpIGFuZCByZW1vdmUKc2l6ZW9mX2ZpZWxkKCkgYW5kIFNJWkVPRl9GSUVMRCgpLgoKSSdt
IGEgYml0IHN1cnByaXNlZCB0aGF0IHRoZSBGSUVMRF9TSVpFT0YoKSBkZWZpbml0aW9uIGVuZHMg
dXAgaW4Kc3RkZGVmLmggcmF0aGVyIHRoYW4gaW4ga2VybmVsLmggd2hlcmUgc3VjaCB0aGluZ3Mg
YXJlIG5vcm1hbGx5CmRlZmluZWQuICBXaHkgaXMgdGhhdD8KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0Cmlu
dGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
