Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C515456F3
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 10 Jun 2022 00:12:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F04E211BD6A;
	Thu,  9 Jun 2022 22:12:04 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D502611BD6A
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  9 Jun 2022 22:12:03 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 3-20020a17090a174300b001e426a02ac5so576390pjm.2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 09 Jun 2022 15:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=Ul/EzbBly6ODsmexOY2i5Jxn57Jnn2+bqgnTBu/Gn5I=;
 b=qaAbKKLs4H/2rs01onbftifjJo3i2Qerl5AQsAaRp756rKNRfZ2HuuJAzjZhIGZC0S
 /VQoXxtI2tc5RTZyl1SGn4E8UU3zOHqI+Z/avCBkfPOMFsDOKXU/gYOKju0tbn7YFtzk
 6v+K7ycaDsme5m/fVPj7Fdh6MnJRjgi/JyWjQL9BL1UdoZzBmtrSKzqnJ76LcAlGOnNf
 7/EpK+rf+U6gCiDZiiVsYY3jFuIwwDy4u9WWE9GgEDMd8QJWgh0Z3e0TPrBrX79Vk2hF
 MBX+5GT5twBcCbS6tyKh3n+vlA4bZ4LZR6OIHV3S24NytlaTBd3FvYOGNuFuqynnRSl9
 MfTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Ul/EzbBly6ODsmexOY2i5Jxn57Jnn2+bqgnTBu/Gn5I=;
 b=BFWbQwBOKznHWHvz1N+5IGjx0MlcikSU/BYO6NDTZJnKy9QJXsqb/VBOcZANv38ED7
 NcEnRTj4gHMUesMkDQJXVqbxE7PQk5Uvk09AB+gp3+lY1FPmCRvrn3ntl2faQ3E10Km5
 Y9wkLLJx5eXmR4mKSP2yLqtSUbDejlM8LbcCcd+AU+MyO4A6l3I23B2ZMAG2/9Ir1xi0
 QVxtGpqufH8Xg0KcBnF5vtDYIWIuycU9hyvWzMI9aRGUWS48tiaU0YkbdsZyZM4FF9bw
 9/f6dxK57O6O2BOkGXJhFeHKWvKb6d5k4NSW3c9e2lxtFtnfRn377uAn/pdXwWyP4Tz4
 SwGQ==
X-Gm-Message-State: AOAM531iKooJJZ1XrZph0hm3nuQxMy0HxDAnPDMF8voAmASCkUSwnVX8
 Rs8T3Ydye+p8Y0nVicZv4Rev3+XBWAghRUb1Ow==
X-Google-Smtp-Source: ABdhPJybkEXzk5yRNxEHEYLWgMJRBADPCiCgo0aHmjk+ddcyPt5kQxYb37iqxcE24wvDQsja90CPsvLmP94z0yyPECQ=
X-Received: by 2002:a17:902:c745:b0:166:496a:b455 with SMTP id
 q5-20020a170902c74500b00166496ab455mr37291026plq.135.1654812723445; Thu, 09
 Jun 2022 15:12:03 -0700 (PDT)
MIME-Version: 1.0
From: Jacinto  Zamora <jacintoiszamora@gmail.com>
Date: Thu, 9 Jun 2022 23:16:16 +0100
Message-ID: <CABoj9nJtDuCG6-_LXdC+4ehosMowTc7BMVSSsBT+TrBnCOPJvg@mail.gmail.com>
Subject: issues of health
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="0000000000008d08c405e10b1c42"
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
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--0000000000008d08c405e10b1c42
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I am Jacinto Zamora
a Widow suffering from ovarian cancer my condition is really deteriorating
and it is quite obvious that i might not live more than two months, my
doctor confirm the cancer has gotten to a very worst dangerous stage, my
late husband and my only child died few years ago, his death was
politically motivated, my late husband was a very rich and wealthy business
man, he was running his cocoa timber plantation business in C=C3=B4te
d'Ivoire.After his death, I started managing all his business and wealth,
my late husband

deposited Us4.5 million dollars in one of the bank here he wanted to use
the fund to expand his cocoa timber plantation business to other African
countries before his sudden death. I struggle to write you this memorandum
in tears while searching for a reliable and honest person to help me donate
the fund to orphanages in your country. I want God to have mercy on me and
accept my soul, so I decided to charities churches motherless babies=E2=80=
=99
temples less privileged and Give widows alms, Therefore, I have instructed
my bank manager to transfer the capital to a foreigner that will apply
before I passed on. The bank already has the doctor's report of my physical
condition confirming I will not live longer. 80% of this total amount is
for donation, the remaining 20% is for you

Kindly respond immediately
Jacinto Zamora

--0000000000008d08c405e10b1c42
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I am Jacinto Zamora<br>a Widow suffering from ovarian canc=
er my condition is really deteriorating and it is quite obvious that i migh=
t not live more than two months, my doctor confirm the cancer has gotten to=
 a very worst dangerous stage, my late husband and my only child died few y=
ears ago, his death was politically motivated, my late husband was a very r=
ich and wealthy business man, he was running his cocoa timber plantation bu=
siness in C=C3=B4te d&#39;Ivoire.After his death, I started managing all hi=
s business and wealth, my late husband<br><br>deposited Us4.5 million dolla=
rs in one of the bank here he wanted to use the fund to expand his cocoa ti=
mber plantation business to other African countries before his sudden death=
. I struggle to write you this memorandum in tears while searching for a re=
liable and honest person to help me donate the fund to orphanages in your c=
ountry. I want God to have mercy on me and accept my soul, so I decided to =
charities churches motherless babies=E2=80=99 temples less privileged and G=
ive widows alms, Therefore, I have instructed my bank manager to transfer t=
he capital to a foreigner that will apply before I passed on. The bank alre=
ady has the doctor&#39;s report of my physical condition confirming I will =
not live longer. 80% of this total amount is for donation, the remaining 20=
% is for you =C2=A0 =C2=A0 =C2=A0 =C2=A0<br><br>Kindly respond immediately<=
br>Jacinto Zamora</div>

--0000000000008d08c405e10b1c42--
