Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB875ABC3
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 29 Jun 2019 16:25:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 802E66E9A8;
	Sat, 29 Jun 2019 14:25:31 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 846506E9A8;
 Sat, 29 Jun 2019 14:25:29 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id 207so11707336wma.1;
 Sat, 29 Jun 2019 07:25:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=tSfTfCg1RYrQS9+orWf92BVXcSGyjMupz270+2KJ+Us=;
 b=F4R3smTj1HbQHthYGx9M6V2/OlbaVwdxiZyEypDzqbwxXl2efXeg6E+tl4Zq41jqq0
 EJjWLbdmdxhgvJ6DZcmBTllHE1TebU2Un5P2ZYaAoX8c/OImv7BJgGUgdLI4PF9hLJwQ
 X2fEMm6zlk8OVjpuBEhXuH/N1DcHOCJw/JjWtaNllpxNPr59TARRvR/3ak+BHWvJQ7No
 VxCwiNXk0eN65/J4u0O3s4VvbfW73wQ/5psb5vBlbGkrumiNhvw+mUhzOZ+NfCKmhFGX
 5rbqYoP08Z4owuDUOpOUDdlW4gyyg2ypD3gDp3HNYnvBgjmKgA4ZuSz9lxGTskXFe7Z/
 51mw==
X-Gm-Message-State: APjAAAUNvjtTA1c+rIRoDrT5HOkznFkw9g8pztp64hr1FMVLI6iEd0Gg
 JyV0LYHWPf/ARxHgzGSKdw==
X-Google-Smtp-Source: APXvYqzYjeGlAIXCK0Otnr3tBdPOmwP6gFHgUXBBLaR5nRWD1D7mhQsGKJ7ZXMMjG4yeTA5UDqjZKg==
X-Received: by 2002:a1c:dc46:: with SMTP id t67mr9957034wmg.159.1561818328264; 
 Sat, 29 Jun 2019 07:25:28 -0700 (PDT)
Received: from avx2 ([46.53.248.49])
 by smtp.gmail.com with ESMTPSA id g123sm3503855wme.12.2019.06.29.07.25.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 29 Jun 2019 07:25:27 -0700 (PDT)
Date: Sat, 29 Jun 2019 17:25:10 +0300
From: Alexey Dobriyan <adobriyan@gmail.com>
To: Andreas Dilger <adilger@dilger.ca>
Subject: Re: [PATCH V2] include: linux: Regularise the use of FIELD_SIZEOF
 macro
Message-ID: <20190629142510.GA10629@avx2>
References: <20190611193836.2772-1-shyam.saini@amarulasolutions.com>
 <20190611134831.a60c11f4b691d14d04a87e29@linux-foundation.org>
 <6DCAE4F8-3BEC-45F2-A733-F4D15850B7F3@dilger.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6DCAE4F8-3BEC-45F2-A733-F4D15850B7F3@dilger.ca>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=tSfTfCg1RYrQS9+orWf92BVXcSGyjMupz270+2KJ+Us=;
 b=Wmn42cCjIZF370922nlT8XBZNT0vFC3qdUoivrJz5yLafRIjdx1Vw+bUvno+QUBVO5
 oMyQcmwqGx4DE3Y07CmSTM0IATWqZAW8kgg+hDEKwh+1CP4NznlAWonwVsCaGpQLaVCV
 I2vA/VdkUZjqS9WvauRGJBO3Xjdwe01bpXzqQP8wAMh3LJ6yI1E5Z9SfpRw+TuNVA5cx
 Mol2Xo2HUenKPsAtO6b1Hxjmm06+PdB0ii0cFoQihuSTWnRJjwjpf6NZuH7lsl3/21RK
 LnPOrpaBytkjll+vsC5zrv5VKacw2e2sTlF82+ldUSC/dM1uFOjAFEnxgQGkqlBXSG7l
 +TOw==
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

T24gVHVlLCBKdW4gMTEsIDIwMTkgYXQgMDM6MDA6MTBQTSAtMDYwMCwgQW5kcmVhcyBEaWxnZXIg
d3JvdGU6Cj4gT24gSnVuIDExLCAyMDE5LCBhdCAyOjQ4IFBNLCBBbmRyZXcgTW9ydG9uIDxha3Bt
QGxpbnV4LWZvdW5kYXRpb24ub3JnPiB3cm90ZToKPiA+IAo+ID4gT24gV2VkLCAxMiBKdW4gMjAx
OSAwMTowODozNiArMDUzMCBTaHlhbSBTYWluaSA8c2h5YW0uc2FpbmlAYW1hcnVsYXNvbHV0aW9u
cy5jb20+IHdyb3RlOgoKPiBJIGRpZCBhIGNoZWNrLCBhbmQgRklFTERfU0laRU9GKCkgaXMgdXNl
ZCBhYm91dCAzNTB4LCB3aGlsZSBzaXplb2ZfZmllbGQoKQo+IGlzIGFib3V0IDMweCwgYW5kIFNJ
WkVPRl9GSUVMRCgpIGlzIG9ubHkgYWJvdXQgNXguCj4gCj4gVGhhdCBzYWlkLCBJJ20gbXVjaCBt
b3JlIGluIGZhdm91ciBvZiAic2l6ZW9mX2ZpZWxkKCkiIG9yICJzaXplb2ZfbWVtYmVyKCkiCj4g
dGhhbiBGSUVMRF9TSVpFT0YoKS4gIE5vdCBvbmx5IGRvZXMgdGhhdCBiZXR0ZXIgbWF0Y2ggIm9m
ZnNldG9mKCkiLCB3aXRoCj4gd2hpY2ggaXQgaXMgY2xvc2VseSByZWxhdGVkLCBidXQgaXMgYWxz
byBjbG9zZXIgdG8gdGhlIG9yaWdpbmFsICJzaXplb2YoKSIuCj4gCj4gU2luY2UgdGhpcyBpcyBh
IHJhdGhlciB0cml2aWFsIGNoYW5nZSwgaXQgY2FuIGJlIHNwbGl0IGludG8gYSBudW1iZXIgb2YK
PiBwYXRjaGVzIHRvIGdldCBhcHByb3ZhbC9sYW5kaW5nIHZpYSBzdWJzeXN0ZW0gbWFpbnRhaW5l
cnMsIGFuZCB0aGVyZSBpcyBubwo+IGh1Z2UgdXJnZW5jeSB0byByZW1vdmUgdGhlIG9yaWdpbmFs
IG1hY3JvcyB1bnRpbCB0aGUgdXNlcnMgYXJlIGdvbmUuICBJdAo+IHdvdWxkIG1ha2Ugc2Vuc2Ug
dG8gcmVtb3ZlIFNJWkVPRl9GSUVMRCgpIGFuZCBzaXplb2ZfZmllbGQoKSBxdWlja2x5IHNvCj4g
dGhleSBkb24ndCBnYWluIG1vcmUgdXNlcnMsIGFuZCB0aGUgcmVtYWluaW5nIEZJRUxEX1NJWkVP
RigpIHVzZXJzIGNhbiBiZQo+IHdoaXR0bGVkIGF3YXkgYXMgdGhlIHBhdGNoZXMgY29tZSB0aHJv
dWdoIHRoZSBtYWludGFpbmVyIHRyZWVzLgoKVGhlIHNpZ25hdHVyZSBzaG91bGQgYmUKCglzaXpl
b2ZfbWVtYmVyKFQsIG0pCgppdCBpcyBwcm9wZXIgRW5nbGlzaCwKaXQgaXMgbG93ZXJjYXNlLCBz
byBpcyBlYXNpZXIgdG8gdHlwZSwKaXQgdXNlcyBzdGFuZGFyZCB0ZXJtIChtZW1iZXIsIG5vdCBm
aWVsZCksCml0IGJsZW5kcyBpbiB3aXRoIHN0YW5kYXJkICJzaXplb2YiIG9wZXJhdG9yLApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2
IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
