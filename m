Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D35492FA428
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 18 Jan 2021 16:09:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6927D6E400;
	Mon, 18 Jan 2021 15:09:51 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 365286E400
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 18 Jan 2021 15:09:50 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id c5so16785821wrp.6
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 18 Jan 2021 07:09:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=o0LrDk575sZO8QF6eRJPnKaqFriKwMIEzttJtoJHwP0=;
 b=DrzJ/q9KyuRRal0Ze0KBbIW7oKNk6JkGd6CVff4gctqjSVajqnVv9fc7l4zSQUtIRt
 cq+ipbNdcyGi8vKWvy03L6K1Nt4n4vl5tCE7kIZonzCkLKU0T9t4LWz4fXubhR6WZ6b8
 Rn9Nj+iFhp8F+gjof50KQotABsBOASwT1tIRsCQWUqxHTd6/Wmm4Viynn/1gq0U6iIPU
 uz7J7AWfvI+lkmOqPc4gG7QFOOQ0z8nJn//TX/yN5S6R1lEi0+z31VyXBmFKhPZdn3nq
 NsSgEvnUf0l6dMbCFJk1UihF29ReJOisAzC3Rlr7aD7qosJ4Hd8jf18Huw9xBsNG5Gr6
 VVOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=o0LrDk575sZO8QF6eRJPnKaqFriKwMIEzttJtoJHwP0=;
 b=dY4XdnR7C6EweMR3dLzxRM2lROdm7GDZYMYu4wqfXndbo2+66Yo2bUxHnlSI5Gc41j
 seLjgSnl8I12nXgKs94oGpzbWrBvZAe19H2OrPVhR1nqxqFbQ49m3FqUz4X1prv4PVU4
 1XE/sH1XNmz///cxMRhXHh0fCqXwkFFhh+lWTwjc09/pCrJ9TWJEZzIuhwTt8QdmxAo+
 0jwTwHd87Qmv9EEY/jAKK53Hu8IfMzTXDjti1qFh4yigaldsaOZaV+Tf+9RjswgXHWzO
 IFrAYQQFpety73/stLG5msG7tCjJA2jtEih9LhIir7ivWgAnw2zzufF4gpZUykgTiP2X
 mk5A==
X-Gm-Message-State: AOAM531Yy1sdnh9k0KGbAsPoVDRND+ZOR9ZW6zhtrrIgsh2cvzWJmFv3
 h1reU6XT++Eb20JJceLjCe2CZQ==
X-Google-Smtp-Source: ABdhPJyDZ5Oz5+gFChXkRG81oA1CFNwWNCMpwIu5woxmSaXUr+y+QkHfALigdBsXlGhC6+k4fDIdvA==
X-Received: by 2002:a05:6000:368:: with SMTP id
 f8mr26201890wrf.150.1610982588871; 
 Mon, 18 Jan 2021 07:09:48 -0800 (PST)
Received: from dell ([91.110.221.158])
 by smtp.gmail.com with ESMTPSA id n10sm29595126wrx.21.2021.01.18.07.09.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jan 2021 07:09:47 -0800 (PST)
Date: Mon, 18 Jan 2021 15:09:45 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Zack Rusin <zackr@vmware.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Ben Skeggs <bskeggs@redhat.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Dave Airlie <airlied@redhat.com>, David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Eddie Dong <eddie.dong@intel.com>, Eric Anholt <eric@anholt.net>,
 Faith <faith@valinux.com>, Gareth Hughes <gareth@valinux.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Jackie Li <yaodong.li@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Jan Safrata <jan.nikitenko@gmail.com>,
 Jesse Barnes <jesse.barnes@intel.com>, jim liu <jim.liu@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Keith Packard <keithp@keithp.com>, Kevin Tian <kevin.tian@intel.com>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Min He <min.he@intel.com>,
 Niu Bing <bing.niu@intel.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Pei Zhang <pei.zhang@intel.com>, Ping Gao <ping.a.gao@intel.com>,
 Rob Clark <rob.clark@linaro.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Roland Scheidegger <sroland@vmware.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Tina Zhang <tina.zhang@intel.com>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>,
 Zhi Wang <zhi.a.wang@intel.com>, Zhiyuan Lv <zhiyuan.lv@intel.com>
Subject: Re: [PATCH 00/29] [Set 15] Finally rid W=1 warnings from GPU!
Message-ID: <20210118150945.GE4903@dell>
References: <20210115181601.3432599-1-lee.jones@linaro.org>
 <F914D9B9-6DD4-4383-9F7C-8D09FBFE96CE@vmware.com>
 <YAWhDRkSOHbJ+2Le@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YAWhDRkSOHbJ+2Le@phenom.ffwll.local>
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

T24gTW9uLCAxOCBKYW4gMjAyMSwgRGFuaWVsIFZldHRlciB3cm90ZToKCj4gT24gRnJpLCBKYW4g
MTUsIDIwMjEgYXQgMDY6Mjc6MTVQTSArMDAwMCwgWmFjayBSdXNpbiB3cm90ZToKPiA+IAo+ID4g
PiBPbiBKYW4gMTUsIDIwMjEsIGF0IDEzOjE1LCBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8u
b3JnPiB3cm90ZToKPiA+ID4gCj4gPiA+IFRoaXMgc2V0IGlzIHBhcnQgb2YgYSBsYXJnZXIgZWZm
b3J0IGF0dGVtcHRpbmcgdG8gY2xlYW4tdXAgVz0xCj4gPiA+IGtlcm5lbCBidWlsZHMsIHdoaWNo
IGFyZSBjdXJyZW50bHkgb3ZlcndoZWxtaW5nbHkgcmlkZGxlZCB3aXRoCj4gPiA+IG5pZ2dseSBs
aXR0bGUgd2FybmluZ3MuCj4gPiA+IAo+ID4gPiBMYXN0IHNldCEgIEFsbCBjbGVhbiBhZnRlciB0
aGlzIGZvcjsgQXJtLCBBcm02NCwgUFBDLCBNSVBTIGFuZCB4ODYuCj4gPiAKPiA+IFRoYW5rcyEg
Rm9yIGFsbCB0aGUgdm13Z2Z4IGJpdHM6Cj4gPiBSZXZpZXdlZC1ieTogWmFjayBSdXNpbiA8emFj
a3JAdm13YXJlLmNvbT4KPiAKPiBPayBJIG1lcmdlZCBldmVyeXRoaW5nIGV4Y2VwdCB2bXdnZngg
KHRoYXQncyBmb3IgWmFjaykgYW5kIGk5MTUvbm91dmVhdQo+ICh0aG9zZSBnZW5lcmFsbHkgZ28g
dGhyb3VnaCBvdGhlciB0cmVlcywgcGxzIGhvbGxlciBpZiB0aGV5J3JlIHN0dWNrKS4KClRoYW5r
cyBEYW5pZWwsIHlvdSdyZSBhIHN1cGVyc3RhciEKClNvIFphY2sgd2lsbCB0YWtlIHRoZSB2bXdn
ZnggcGFydHM/ICBEZXNwaXRlIHByb3ZpZGluZyBhIFItYj8KCj4gTm90ZSB0aGF0IHdlIGhhdmUg
c29tZSBidWlsZCBpc3N1ZSBvbiBzb21lIG9mIHRoZSBjb25maWdzIHNmciB1c2VzLCBzbyBkcm0K
PiB0cmVlcyBhcmUgc3RpbGwgc3R1Y2sgb24gb2xkIHZlcnNpb25zIGluIGxpbnV4LW5leHQuIEhv
cGVmdWxseSBzaG91bGQgZ2V0Cj4gcmVzb2x2ZWQgc29vbiwgdGhlIGJ1Z2ZpeCBpcyBpbiBzb21l
IHN1YnRyZWUgSSd2ZSBoZWFyZC4KCk5vIHdvcnJpZXMuICBUaGFua3MgZm9yIGxldHRpbmcgbWUg
a25vdy4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KU2VuaW9yIFRlY2huaWNhbCBMZWFkIC0g
RGV2ZWxvcGVyIFNlcnZpY2VzCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZv
ciBBcm0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYg
bWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldgo=
