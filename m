Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FFF2FB402
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 19 Jan 2021 09:29:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 585C86E071;
	Tue, 19 Jan 2021 08:29:33 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C2046E071
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 19 Jan 2021 08:29:32 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id c12so277212wrc.7
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 19 Jan 2021 00:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=d9EPmxgSjplqIloqEd0fjmhaf+3lX7Ca0TE2z4KWzZU=;
 b=Mc5TIayeKmc7ETz+AffYmEItuFJXlQ+LEXC0DXPZd0CeGOe+I1qOEyFh4REscFCZ9K
 QBlcRgDo6dPqK01+Ka8woQ4Ce+Tpfm4FNert/g90UtAxCnBuF6LU1jEhogQ+mzzaEXxv
 DVOpaMrUYFVaILEhToWw1nDQFOPBoeBbLmfVTlycpgZ05pSDTcdv5hEOM/6dSSGRsn7E
 u8N/93WaR4XjU+lnDH7Ix1nIBRz/1r+gwTh3LStekGLavIWm5gbpGGe8mYxhTbrpBfQd
 2LQiofEKLbLBHRRgyFy04sunOBK61oZGum2gRLULFFnGY4r2g62QdNAeo2JEuWOMYptT
 Z8Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=d9EPmxgSjplqIloqEd0fjmhaf+3lX7Ca0TE2z4KWzZU=;
 b=Wcn5UISskHLQwXx/3wiyiE8ryLmmYE2pKE1ey4xfnWo/M+jdxobsy2kzibiwoVdASg
 DMRG/aG9A1aos7tj2lDKr8vnTPp63XRVYFU3yrWVyPFaMp4kaVkQu+xTFQEoknTmR46A
 6azgl54RU+lPLYYjcm81WD0qKCM/ddyDXmf05hxTjHlnazut8ETHZ2SeeJfI5UxBQrE3
 fd7KMUqa91UOTjXkyiET2LJl5/Vpg5irmO0Oq5xJTR8L1kOQiv5bEVEPM479Ch/ofcnc
 TNBVefhGrQ6bixJinqFQAjjVNQnX3lIFYGnsbnvSxILqq6wrGpu+eKlFqD9Xz57Pk+Z8
 jxiA==
X-Gm-Message-State: AOAM5322enfIsfEuHZRhsKA0TQaSp+FF94vbsW9tUUY5FA0emvEz+4vA
 Op0vruqDPyageJGkDCiCiB5KJA==
X-Google-Smtp-Source: ABdhPJxZgbmI7dqTDYKpsJ4RFJ20zHNFbzEsz8E5NfIQ/ie1dHSOozCsng29cOp98WeoUcI4x2Sbrw==
X-Received: by 2002:adf:b519:: with SMTP id a25mr3094280wrd.263.1611044971004; 
 Tue, 19 Jan 2021 00:29:31 -0800 (PST)
Received: from dell ([91.110.221.158])
 by smtp.gmail.com with ESMTPSA id b64sm3307488wmb.26.2021.01.19.00.29.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 00:29:30 -0800 (PST)
Date: Tue, 19 Jan 2021 08:29:27 +0000
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
Message-ID: <20210119082927.GJ4903@dell>
References: <20210115181601.3432599-1-lee.jones@linaro.org>
 <F914D9B9-6DD4-4383-9F7C-8D09FBFE96CE@vmware.com>
 <YAWhDRkSOHbJ+2Le@phenom.ffwll.local> <20210118150945.GE4903@dell>
 <YAXDgmWMR9s4OgxN@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YAXDgmWMR9s4OgxN@phenom.ffwll.local>
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

T24gTW9uLCAxOCBKYW4gMjAyMSwgRGFuaWVsIFZldHRlciB3cm90ZToKCj4gT24gTW9uLCBKYW4g
MTgsIDIwMjEgYXQgMDM6MDk6NDVQTSArMDAwMCwgTGVlIEpvbmVzIHdyb3RlOgo+ID4gT24gTW9u
LCAxOCBKYW4gMjAyMSwgRGFuaWVsIFZldHRlciB3cm90ZToKPiA+IAo+ID4gPiBPbiBGcmksIEph
biAxNSwgMjAyMSBhdCAwNjoyNzoxNVBNICswMDAwLCBaYWNrIFJ1c2luIHdyb3RlOgo+ID4gPiA+
IAo+ID4gPiA+ID4gT24gSmFuIDE1LCAyMDIxLCBhdCAxMzoxNSwgTGVlIEpvbmVzIDxsZWUuam9u
ZXNAbGluYXJvLm9yZz4gd3JvdGU6Cj4gPiA+ID4gPiAKPiA+ID4gPiA+IFRoaXMgc2V0IGlzIHBh
cnQgb2YgYSBsYXJnZXIgZWZmb3J0IGF0dGVtcHRpbmcgdG8gY2xlYW4tdXAgVz0xCj4gPiA+ID4g
PiBrZXJuZWwgYnVpbGRzLCB3aGljaCBhcmUgY3VycmVudGx5IG92ZXJ3aGVsbWluZ2x5IHJpZGRs
ZWQgd2l0aAo+ID4gPiA+ID4gbmlnZ2x5IGxpdHRsZSB3YXJuaW5ncy4KPiA+ID4gPiA+IAo+ID4g
PiA+ID4gTGFzdCBzZXQhICBBbGwgY2xlYW4gYWZ0ZXIgdGhpcyBmb3I7IEFybSwgQXJtNjQsIFBQ
QywgTUlQUyBhbmQgeDg2Lgo+ID4gPiA+IAo+ID4gPiA+IFRoYW5rcyEgRm9yIGFsbCB0aGUgdm13
Z2Z4IGJpdHM6Cj4gPiA+ID4gUmV2aWV3ZWQtYnk6IFphY2sgUnVzaW4gPHphY2tyQHZtd2FyZS5j
b20+Cj4gPiA+IAo+ID4gPiBPayBJIG1lcmdlZCBldmVyeXRoaW5nIGV4Y2VwdCB2bXdnZnggKHRo
YXQncyBmb3IgWmFjaykgYW5kIGk5MTUvbm91dmVhdQo+ID4gPiAodGhvc2UgZ2VuZXJhbGx5IGdv
IHRocm91Z2ggb3RoZXIgdHJlZXMsIHBscyBob2xsZXIgaWYgdGhleSdyZSBzdHVjaykuCj4gPiAK
PiA+IFRoYW5rcyBEYW5pZWwsIHlvdSdyZSBhIHN1cGVyc3RhciEKPiA+IAo+ID4gU28gWmFjayB3
aWxsIHRha2UgdGhlIHZtd2dmeCBwYXJ0cz8gIERlc3BpdGUgcHJvdmlkaW5nIGEgUi1iPwo+IAo+
IEkgb25seSBtZXJnZSBzdHVmZiB0aGF0J3MgZGVmYWN0byBhYmFuZG9uZWQgYWxyZWFkeS4gRXZl
cnl0aGluZyBlbHNlIEkgdHJ5Cj4gdG8gb2ZmbG9hZCB0byB3aG9tZXZlciBhY3R1YWxseSBjYXJl
cyA6LSkKClVuZGVyc3Rvb2QuICBUaGFua3MgZm9yIHRoZSBleHBsYW5hdGlvbi4KCkhvcGVmdWxs
eSBaYWNrIGFjdHVhbGx5IGNhcmVzLiA6RAoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpTZW5p
b3IgVGVjaG5pY2FsIExlYWQgLSBEZXZlbG9wZXIgU2VydmljZXMKTGluYXJvLm9yZyDilIIgT3Bl
biBzb3VyY2Ugc29mdHdhcmUgZm9yIEFybSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwg
VHdpdHRlciB8IEJsb2cKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9pbnRlbC1ndnQtZGV2Cg==
