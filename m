Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3548A2405AE
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 10 Aug 2020 14:18:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80D1B89B0B;
	Mon, 10 Aug 2020 12:18:23 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B494489B0B
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 10 Aug 2020 12:18:21 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id f26so7892338ljc.8
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 10 Aug 2020 05:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:reply-to:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=Duxa+mmNF3T3C2WDKsmzowR2OzvdY892XFjTPp0RWRI=;
 b=syefqBhEIbHfp/49+ec3OU/dPjcx9ByAKy8a9tAKHToxAlvDKtbfUI2pg/+/hCwJc9
 COLPbLMFKk0HCiEar9SEx2oCJWbd79bHcC+9XCWtYFJpZQGR2XjiExUDFxkWdL8sJ7Sb
 fS7msygkL3D0Bum68e0gMla/AZPEolBTprf843OhEnPr8Aok6UBYOW2K9u/2aNK6Lbfv
 xQv89eDj34SLOvJ+tnGH3Lc7YltSNurHewDif7O9QoXSWfvrN3et7xhOPc4LOuBdeeYN
 zPxtqA6FpW5AuuhyKgEWcVxMad7ZFsmxTyIp6QLvFHJe4gHe1UZYxifsp48lU2pKG7BY
 k0OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:reply-to:from:date:message-id
 :subject:to:content-transfer-encoding;
 bh=Duxa+mmNF3T3C2WDKsmzowR2OzvdY892XFjTPp0RWRI=;
 b=G04NtphwWvNOKpwlpvVdrz0z2wET5e8tcEEzE8Y49EWn+l0tF22Dxbev6xveLL09qa
 r+S2wjBs7hNhXf6hib4lz6cQ5eCMGanIV6XbBN8FzxzbPrAjjiNMdQ3ODoMOIqtaFzWO
 hNggweAFqHLQn7SJt/L7CRO0lhDUN2NZqD+wlKlgIx8FOX4pnzzZRu94gJD2dG6Xre2w
 8U/uSsE2p90c/YYbxVhcgXglCaW8H8rxP9nB6LoBwM0iWpNHjuriN0Voqo5sYGVqikf7
 KSIoB89yrK22LgYz51i+JtlnnnbsNwPZkcqo/3PvXLMqBAhIRW7GRleQ96C3ozqCu5f4
 71NQ==
X-Gm-Message-State: AOAM5314q/ZqjOU53S+7yD8p+PINfErcSHKG7W3tHlIEJKXR7/8QjPwQ
 it3nWKu0+hmb6PdYoEdqlsI0oAhVsPjjdW7sx2o=
X-Google-Smtp-Source: ABdhPJx59uu/x7zIPmHDOJmRuBEFV4Wcru386aw9xbwTnUFbvSVpR1Rtmrrn4P6fV1KaLQh2gf9PdhRBdYINAcMfPAY=
X-Received: by 2002:a2e:9695:: with SMTP id q21mr366979lji.437.1597061900051; 
 Mon, 10 Aug 2020 05:18:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:7c01:0:0:0:0:0 with HTTP; Mon, 10 Aug 2020 05:18:19
 -0700 (PDT)
From: "Mr. Scott Donald" <keshintondesmond@gmail.com>
Date: Mon, 10 Aug 2020 05:18:19 -0700
Message-ID: <CA+nDMutabOMr0UbCpep35_pKAJv3bCKLTSiNh3gaHkDGbDZKig@mail.gmail.com>
Subject: Hello. Please
To: undisclosed-recipients:;
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
Reply-To: sctnld11170@tlen.pl
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

LS0gCkRlYXIgRnJpZW5kLAoKSSdtIE1yLiBTY290dCBEb25hbGQgYSBTdWNjZXNzZnVsIGJ1c2lu
ZXNzTWFuIGRlYWxpbmcgd2l0aApFeHBvcnRhdGlvbiwgSSBnb3QgeW91ciBtYWlsIGNvbnRhY3Qg
dGhyb3VnaCBzZWFyY2ggdG8gbGV0IHlvdSBrbm93IG15CmludGVuc2lvbiBhbmQgbXkgVWdseSBT
aXR1YXRpb24gQW0gYSBkeWluZyBNYW4gaGVyZSBpbiBMb3MgQW5nZWxlcwpDYWxpZm9ybmlhIEhv
c3BpdGFsIEJlZCBpbiAoVVNBKSwgSSBMb3N0IG15IFdpZmUgYW5kIG15IG9ubHkgRGF1Z2h0ZXIK
Zm9yIENvdmlkLTE5IGFuZCBJIGFsc28gaGF2ZSBhIHByb2JsZW0gaW4gbXkgSGVhbHRoIGFuZCBJ
IGNhbiBkaWUKYW55dGltZSBJIEtub3csCgpJIGhhdmUgYSBwcm9qZWN0IHRoYXQgSSBhbSBhYm91
dCB0byBoYW5kIG92ZXIgdG8geW91LiBhbmQgSSBhbHJlYWR5Cmluc3RydWN0ZWQgdGhlIEJhbmtp
YSBTLkEuIE1hZHJpZCwgU3BhaW4oQlNBKSB0byB0cmFuc2ZlciBteSBmdW5kIHN1bQpvZiDCozMs
N00gR0JQLiBFcXVpdmFsZW50IHRvIOKCrDQsMDc3LDAzMy45MSBFVVIsIHRvIHlvdSBhcyB0byBl
bmFibGUgeW91CnRvIGdpdmUgNTAlIG9mIHRoaXMgZnVuZCB0byBDaGFyaXRhYmxlIEhvbWUgaW4g
eW91ciBTdGF0ZSBhbmQgdGFrZSA1MCUKZG9uJ3QgdGhpbmsgb3RoZXJ3aXNlIGFuZCB3aHkgd291
bGQgYW55Ym9keSBzZW5kIHNvbWVvbmUgeW91IGJhcmVseQprbm93IHRvIGhlbHAgeW91IGRlbGl2
ZXIgYSBtZXNzYWdlLCBoZWxwIG1lIGRvIHRoaXMgZm9yIHRoZSBoYXBwaW5lc3MKb2YgbXkgc291
bCBhbmQgZm9yIEdvZCB0byBtZXJjeSBtZSBhbmQgbXkgRmFtaWx5IGFuZCBnaXZlIFVzIGEgZ29v
ZApwbGFjZS4KCnBsZWFzZSwgZG8gYXMgSSBzYWlkIHRoZXJlIHdhcyBzb21lb25lIGZyb20geW91
ciBTdGF0ZSB0aGF0IEkgZGVlcGx5CmxvdmUgc28gdmVyeSB2ZXJ5IG11Y2ggYW5kIEkgbWlzcyBo
ZXIgc28gYmFkbHkgSSBoYXZlIG5vIG1lYW5zIHRvCnJlYWNoIGFueSBDaGFyaXRhYmxlIEhvbWUg
dGhlcmUuIHRoYXQgaXMgd2h5IEkgZ28gZm9yIGEgcGVyc29uYWwKc2VhcmNoIG9mIHRoZSBDb3Vu
dHJ5IGFuZCBTdGF0ZSBhbmQgSSBnb3QgeW91ciBtYWlsIGNvbnRhY3QgdGhyb3VnaApzZWFyY2gg
dG8gbGV0IHlvdSBrbm93IG15IEJpdHRlcm5lc3MgYW5kIHBsZWFzZSwgaGVscCBtZSBpcyBnZXR0
aW5nCkRhcmsgSSBhc2sgbXkgRG9jdG9yIHRvIGhlbHAgbWUga2VlcCB5b3Ugbm90aWNlIGZhaWx1
cmUgZm9yIG1lIHRvCnJlYWNoIHlvdSBpbiBwZXJzb24gWW91ciB1cmdlbnQgUmVzcG9uc2UsIGhl
cmUgaXMgbXkgRG9jdG9yIFdoYXRzLWFwcApOdW1iZXIgZm9yIHVyZ2VudCBub3RpY2UgKzEzMDE5
NjkyNzM3CgpIb3BlIFRvIEhlYXIgRnJvbSBZb3UuIEknbSBzZW5kaW5nIHRoaXMgZW1haWwgdG8g
eW91IGZvciB0aGUgc2Vjb25kCnRpbWUgeWV0IG5vIHJlc3BvbnNlIGZyb20geW91LgoKTXkgUmVn
YXJkcy4KCk1yLiBTY290dCBEb25hbGQKQ0VPCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1k
ZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldgo=
