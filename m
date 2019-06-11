Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFC941680
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 11 Jun 2019 23:00:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A404F891FA;
	Tue, 11 Jun 2019 21:00:17 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 549AB891FA
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 11 Jun 2019 21:00:16 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id d30so7624909pgm.7
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 11 Jun 2019 14:00:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=nUPaXZb2EyHCiKOm64w17o/WMgOXwq3cvo71tUNaOwE=;
 b=nvqwhqsdXUOniNHq6BiTGLf4JYL2Pw5WHe/XLo+/QMOgGbTL36GRyF+nDGCOuISxK7
 C7wRZQz7qBPhCHvVUr55Ao5Wt3WfV8RYvLoLVswSTtlKp7qtUdcKd5wQcHOSaZwDcBV5
 D2DTdzIFBY2HsN/hWFaDsEZqfw502TNfnlG3BXoVZxhoP0DTASGakiT+cUSpB22M12kl
 XyoOcqtHtOZMOKhy0RxtVqDq9iRdJAJ3SI1dWIvw+XEj9vv78l/2zHu4QG03iv0qWGTW
 uvRH+nUo6yhs524cQOh18SJ7+3VA+Vadh3TqMvaR8zeUhHw+DijNHwM1CUGMe+1kv7Ro
 FrPw==
X-Gm-Message-State: APjAAAXiIaf+BNLlnQsEzFwHX4a+atQjrcsEFkC2997T7XjXjzXXCarb
 mn5hr1LY33v038Y3ta9INB82Yg==
X-Google-Smtp-Source: APXvYqw4YBmB5zv3pmuSF2o1Ro24lhPZ3aL8+7Yz5YYkMM5A75U9mLeByV4nZS/X2MAaqVMFGY5qAQ==
X-Received: by 2002:a63:4419:: with SMTP id r25mr22692286pga.247.1560286815720; 
 Tue, 11 Jun 2019 14:00:15 -0700 (PDT)
Received: from cabot.adilger.ext (S0106a84e3fe4b223.cg.shawcable.net.
 [70.77.216.213])
 by smtp.gmail.com with ESMTPSA id l1sm14357897pgj.67.2019.06.11.14.00.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jun 2019 14:00:14 -0700 (PDT)
From: Andreas Dilger <adilger@dilger.ca>
Message-Id: <6DCAE4F8-3BEC-45F2-A733-F4D15850B7F3@dilger.ca>
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: [PATCH V2] include: linux: Regularise the use of FIELD_SIZEOF
 macro
Date: Tue, 11 Jun 2019 15:00:10 -0600
In-Reply-To: <20190611134831.a60c11f4b691d14d04a87e29@linux-foundation.org>
To: Andrew Morton <akpm@linux-foundation.org>
References: <20190611193836.2772-1-shyam.saini@amarulasolutions.com>
 <20190611134831.a60c11f4b691d14d04a87e29@linux-foundation.org>
X-Mailer: Apple Mail (2.3273)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dilger-ca.20150623.gappssmtp.com; s=20150623;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references;
 bh=nUPaXZb2EyHCiKOm64w17o/WMgOXwq3cvo71tUNaOwE=;
 b=1PkfIHxoAL100GHTIJPtUgnC6vtovLyncp9xFBxlnggPu12+zsDGgnLaBjug3WcCRF
 ADQVr3JetSynDAQbtUt6ErvLUOeaCpig1636+Ma6Jq/Pzq9Wm8vruTUnsCFntkIJGXPX
 wWnf8ZOx9s4y5y8Qm3ZvQvL2os1TOwaLQLvbm9ZJou9U0nJzedf/8LPDMnNkHoMmIRvm
 0JVJjUBp99ct05cqa2egnpZd13j2INZwnsHocqWKQQe5RqyURZIMrPteLnuZG4T+3ubQ
 FsvDJpuZH3QIeO3XlnkM7vdfDShdyMdLnG6hcUpiZJVNutSS2SeLa5Fxo2XceNqs4ysr
 0rpg==
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
Content-Type: multipart/mixed; boundary="===============0026791404=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0026791404==
Content-Type: multipart/signed;
 boundary="Apple-Mail=_31ECB8A0-2497-4644-8BE0-DFE1190172F7";
 protocol="application/pgp-signature"; micalg=pgp-sha256


--Apple-Mail=_31ECB8A0-2497-4644-8BE0-DFE1190172F7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

On Jun 11, 2019, at 2:48 PM, Andrew Morton <akpm@linux-foundation.org> =
wrote:
>=20
> On Wed, 12 Jun 2019 01:08:36 +0530 Shyam Saini =
<shyam.saini@amarulasolutions.com> wrote:
>=20
>> Currently, there are 3 different macros, namely sizeof_field, =
SIZEOF_FIELD
>> and FIELD_SIZEOF which are used to calculate the size of a member of
>> structure, so to bring uniformity in entire kernel source tree lets =
use
>> FIELD_SIZEOF and replace all occurrences of other two macros with =
this.
>>=20
>> For this purpose, redefine FIELD_SIZEOF in include/linux/stddef.h and
>> tools/testing/selftests/bpf/bpf_util.h and remove its defination from
>> include/linux/kernel.h
>>=20
>> In favour of FIELD_SIZEOF, this patch also deprecates other two =
similar
>> macros sizeof_field and SIZEOF_FIELD.
>>=20
>> For code compatibility reason, retain sizeof_field macro as a wrapper =
macro
>> to FIELD_SIZEOF
>=20
> As Alexey has pointed out, C structs and unions don't have fields -
> they have members.  So this is an opportunity to switch everything to
> a new member_sizeof().
>=20
> What do people think of that and how does this impact the patch =
footprint?

I did a check, and FIELD_SIZEOF() is used about 350x, while =
sizeof_field()
is about 30x, and SIZEOF_FIELD() is only about 5x.

That said, I'm much more in favour of "sizeof_field()" or =
"sizeof_member()"
than FIELD_SIZEOF().  Not only does that better match "offsetof()", with
which it is closely related, but is also closer to the original =
"sizeof()".

Since this is a rather trivial change, it can be split into a number of
patches to get approval/landing via subsystem maintainers, and there is =
no
huge urgency to remove the original macros until the users are gone.  It
would make sense to remove SIZEOF_FIELD() and sizeof_field() quickly so
they don't gain more users, and the remaining FIELD_SIZEOF() users can =
be
whittled away as the patches come through the maintainer trees.

Cheers, Andreas






--Apple-Mail=_31ECB8A0-2497-4644-8BE0-DFE1190172F7
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - http://gpgtools.org

iQIzBAEBCAAdFiEEDb73u6ZejP5ZMprvcqXauRfMH+AFAl0AFloACgkQcqXauRfM
H+AuLxAAgNkosRb8jCBUvSkSZcRIz6m3CRCKyZBz9EPhtA2ihZfEB+0hz1uGmXS5
opkX/nM8cIIrc2g/uiWBq6RVg8FFJxC3qVRDhPqDJ5b6jq6Q5WjV98HwBljIKIEM
EWXmiEtnxAQAWrNcYoI0HAI5nMUxpIHxo0+hWnfLhk/fTPoUwgLgZawDmn+pwcND
DU07/6GM67fcfUGYxZKD43X6a/s2lkR28Nn3MN7o2Y/exOm6J0otNWB4Vsu7d6t/
cScoBhni7d5c02FbLXTpab1n/Sjq/+Ijd3yp3ooxjoFvhfqx6YoBYL5fKxZx29HO
AXautmzcIwSccj17hB9lIvq/lLdXBL/k9qiKBcIzImCLxSa9+hMJFcl4gH3Qo4i7
J+7jzFHXnFnx9g5J4rka5VIlGpbBM85N35g8vJZFGVc/juJm6r6YXA+48kKI6hZB
uFH8fNhjYJGDFyiCh637pF5CObUattAasEPN8O8mQ3qxZKg8C/9jvOLgHlI9W9iK
ijBEDk0atDHpIJe3dlUw/fQA7LZ4bvXe07VUBqnBUd+/+7KBLZxLkfnygJXf8nzX
k0TILorUWagkDNgpBE/vwV1ER8UzU6NRxz/w4e6/N/mufG7iPcxZjCTtfJUS3GLW
hPKj3bi6qV6cw+EyroLHp9igONkqhvnPjEFx5a4YA3gAxQ8viSE=
=5D1y
-----END PGP SIGNATURE-----

--Apple-Mail=_31ECB8A0-2497-4644-8BE0-DFE1190172F7--

--===============0026791404==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============0026791404==--
