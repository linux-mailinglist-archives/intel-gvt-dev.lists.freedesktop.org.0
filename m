Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A60DD888E4
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 10 Aug 2019 08:46:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 554046EF44;
	Sat, 10 Aug 2019 06:46:18 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 343B16EF43;
 Sat, 10 Aug 2019 06:46:16 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 6BDB1803D0;
 Sat, 10 Aug 2019 08:46:12 +0200 (CEST)
Date: Sat, 10 Aug 2019 08:46:11 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH 0/5] kbuild: allow big modules to sub-divide Makefiles
Message-ID: <20190810064611.GC13020@ravnborg.org>
References: <20190806063923.1266-1-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190806063923.1266-1-yamada.masahiro@socionext.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=CjF8g_Sx3RpHsihlKJQA:9 a=CjuIK1q_8ugA:10
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
Cc: Michal Marek <michal.lkml@markovi.net>, dri-devel@lists.freedesktop.org,
 linux-kbuild@vger.kernel.org, Jani Nikula <jani.nikula@intel.com>,
 intel-gfx@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 linux-kernel@vger.kernel.org, Jani Nikula <jani.nikula@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

SGkgTWFzYWhpcm8KCk9uIFR1ZSwgQXVnIDA2LCAyMDE5IGF0IDAzOjM5OjE4UE0gKzA5MDAsIE1h
c2FoaXJvIFlhbWFkYSB3cm90ZToKPiAKPiBSZWNlbnRseSwgSmFuaSBOaWt1bGEgcmVxdWVzdHMg
YSBiZXR0ZXIgYnVpbGQgc3lzdGVtIHN1cHBvcnQKPiBmb3IgZHJpdmVycyBzcGFubmluZyBtdWx0
aXBsZSBkaXJlY3Rvcmllcy4KPiAoYmV0dGVyIGtidWlsZCBzdXBwb3J0IGZvciBkcml2ZXJzIHNw
YW5uaW5nIG11bHRpcGxlIGRpcmVjdG9yaWVzPykKPiAKPiBJIGltcGxlbWVudGVkIGl0LCBzbyBw
bGVhc2UgdGFrZSBhIGxvb2sgYXQgaXQuCj4gCj4gTm90ZToKPiBUaGUgc2luZ2xlIHRhcmdldHMg
ZG8gbm90IHdvcmsgY29ycmVjdGx5Lgo+IAo+IFRoZSBzaW5nbGUgdGFyZ2V0cyBoYXZlIG5ldmVy
IHdvcmtlZCBjb3JyZWN0bHk6CgpJdCB3b3JrcyBpbiBtb3N0IGNhc2VzLCBidXQgbm93IGFsd2F5
cy4KSSBkdW5ubyBob3cgbXVjaCBpdCBpcyB1c2VkLgpNeXNlbGYgSSBhbG1vc3QgYWx3YXlzIGRv
IG1ha2UgL2RyaXZlcnMvZm9vL2Jhci8KPiAKPiBbMV0gRm9yIGluc3RhbmNlLCAibWFrZSBkcml2
ZXJzL2Zvby9iYXIvYmF6Lm8iIHdpbGwgZGVzY2VuZCBpbnRvCj4gICAgIGRyaXZlcnMvZm9vL2Jh
ci9NYWtlZmlsZSwgd2hpY2ggbWF5IG5vdCBuZWNlc3NhcmlseSBzcGVjaWZ5Cj4gICAgIHRoZSBi
dWlsZCBydWxlIG9mIGJhei5vCj4gCj4gICAgIEl0IGlzIHBvc3NpYmxlIGZvciBkcml2ZXJzL2Zv
by9NYWtlZmlsZSBoYXZpbmcKPiAgICAgICAgIG9iai0kKENPTkZJR19CQVopICs9IGJhci9iYXou
bwo+IAo+IFsyXSBzdWJkaXItY2NmbGFncy15IGRvZXMgbm90IHdvcmsuCj4gCj4gICAgIFRoZSBz
aW5nbGUgdGFyZ2V0cyBkaXJlY3RseSBkZXNjZW5kIGludG8gdGhlIGRpcmVjdG9yeSBvZgo+ICAg
ICB0aGF0IGZpbGUgcmVzaWRlcy4KPiAKPiAgICAgSXQgbWlzc2VkIHN1YmRpci1jY2ZsYWdzLXkg
aWYgaXQgaXMgc3BlY2lmaWVzIGluIHBhcmVudAo+ICAgICBNYWtlZmlsZXMuCj4gCj4gUGVyaGFw
cywgSSB3aWxsIGhhdmUgdG8gbWFuYWdlIGNvcnJlY3QgaW1wbGVtZW50YXRpb24gb2Ygc2luZ2xl
IHRhcmdldHMuClRoZSBkYXkgdGhhdCBrYnVpbGQgaGFzIGEgc2VwYXJhdGUgc3RlcCB0byByZWFk
IGFsbCBNYWtlZmlsZXMKYW5kIHRoZW4gd2l0aG91dCB1c2luZyByZWN1cnNpdmUgbWFrZSBjYW4g
YnVpbGQgdGhlIGtlcm5lbCB3ZSBjYW4gaGF2ZQp0aGlzIGZpeGVkLgpVbnRpbCB0aGVuIHdlIGNh
biBhY2NwZXQgaXQgYXMgaXMgLSBhcyBmaXhpbmcgdGhpcyBtYXkgbm90IGJlIHNpbXBsZS4KCglT
YW0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwt
Z3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQt
ZGV2
