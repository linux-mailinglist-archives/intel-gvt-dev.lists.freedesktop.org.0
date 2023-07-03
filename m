Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 003FD745ACA
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  3 Jul 2023 13:10:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA9CA10E027;
	Mon,  3 Jul 2023 11:10:14 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E55D10E027
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  3 Jul 2023 11:10:13 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-992acf67388so398184466b.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 03 Jul 2023 04:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688382611; x=1690974611;
 h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n7uT2CQerPbzHWToHSTOTyAU9ye7xxpkW2DZv40foF8=;
 b=hYB9LmiTXKSLPkcH3FnJaExG4bkOhgm11gn9i5QAIfY562QQiceVxVNTqot//s+DnZ
 terBAzLXmtBcq1bm9rQfymnC2Ymk/xVGYy/yJnswYcROjr/b/1oCCnNaLS93VUzx7wKG
 pG8kCGVe2LzxPXjs2Jjv+8AHBdS08FopiJi7q4bQw7PIk22DrAlhkR6xKOwOyB4ucWKM
 G4fQ28rMfRq43Kz5NQke6m8oWyGi3o2V+TS+Un29mIkstjQWvHtGjVvJGdLPM4ykMLag
 Qb/1AAg22PU9q9szyYMAoFjrjd5jDFEfWDhGoPCkCSrtyzYBrJBFmaNgjYH3kDwqWWs9
 Kyjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688382611; x=1690974611;
 h=to:subject:message-id:date:from:reply-to:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=n7uT2CQerPbzHWToHSTOTyAU9ye7xxpkW2DZv40foF8=;
 b=Q1io0lR1MPdvZYN+9eFL6Q1bwKaVs6CR6sqMA0yy/1pagccDKGfNH1O0TLYq3JL5BL
 O8OmYysK15dBlQSkRqt6SOqGqSyDNKfzbErR+IYRZ741uf3aV70R6lnDaKEfQueNC5vd
 OFhVjVee4rc37OJ4SeEm2LvU5I2ozkFm8Pgqcj9rxvXyS3Zd813KO1UHHLqwCso+kdyY
 HfVv2XpEkAl0WT6pK3XpC3X7CieFPup0+Ks+E3eXl2uIcTmviOPZp7dIDeTOW0D8/bJg
 0faI4kGDoW7wk8Pq+ZB3oxrC/hRjKR4AAlenrF47e6anSc16+Kh0qXBywwvEQXfIp3cI
 uVGw==
X-Gm-Message-State: ABy/qLbeNdz9hjBI7jm4ElEX5qJGilGhpv0ALPSCIJX59PJVsR5QjZwK
 A9j3L/id7iIEK3T/SWA4Za5Rmd9Z01JIDUNEbOc=
X-Google-Smtp-Source: ACHHUZ4jXwzzGGFQ1Q0IJGzeBNt4b9/JiiLuAfyngbMn78ufx2aPiVz4YiLAw5W8/9PlTcrPJJFyRegvXdNN8Mp4D9Y=
X-Received: by 2002:a17:906:4a91:b0:98e:26ae:9b07 with SMTP id
 x17-20020a1709064a9100b0098e26ae9b07mr5026307eju.35.1688382611087; Mon, 03
 Jul 2023 04:10:11 -0700 (PDT)
MIME-Version: 1.0
From: Michael Freeman <michaelfreemann12@gmail.com>
Date: Mon, 3 Jul 2023 11:09:45 +0200
Message-ID: <CAGs0JcycfP0gt0Cr97r06RPFRiAMbOnGvZvWK_be3rSHsiK39Q@mail.gmail.com>
Subject: Good Day
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="000000000000c764bc05ff933502"
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
Reply-To: michaelfreemann6@gmail.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--000000000000c764bc05ff933502
Content-Type: text/plain; charset="UTF-8"

Greetings

I am a private wealth Manager to a Politically Exposed High Net-worth
Individual. We are able to provide growth stage capital and leveraged
buyouts for companies from a dedicated portfolio for investments in a
suitably vetted company.

My source is non-traditional and offers the advantage to undertake medium
to large scale funding at transparent and beneficial terms unmatched by
institutional capital providers. My requirement is a company/executive with
proof of competence to achieve fairly good ROI for medium or long-term
scenarios. If you are interested, contact me by email;
michaelfreemann6@gmail.com <michaelfreemann12@gmail.com>  , for us to
discuss modalities.

Thank you
Regards,

--000000000000c764bc05ff933502
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_sig=
nature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div style=3D"c=
olor:rgb(34,34,34)">Greetings<br></div><div dir=3D"ltr" style=3D"color:rgb(=
34,34,34)"><div dir=3D"ltr"><div><br></div><div>I am a private wealth Manag=
er to a Politically Exposed High Net-worth Individual. We are able to provi=
de growth stage capital and leveraged buyouts for companies from a dedicate=
d portfolio for investments in a suitably vetted company.</div><div><br></d=
iv><div>My source is non-traditional and offers the advantage to undertake =
medium to large scale funding at transparent and beneficial terms unmatched=
 by institutional capital providers. My requirement is a company/executive =
with proof of competence to achieve fairly good ROI for medium or long-term=
 scenarios. If you are interested, contact me by email;=C2=A0<a href=3D"mai=
lto:michaelfreemann12@gmail.com" style=3D"color:rgb(17,85,204)" target=3D"_=
blank">michaelfreemann6@gmail.com</a>=C2=A0 , for us to discuss modalities.=
</div><div><br></div><div>Thank you</div><div>Regards,</div></div></div></d=
iv></div></div></div>

--000000000000c764bc05ff933502--
