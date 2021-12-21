Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FA447B90D
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 21 Dec 2021 04:37:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE2BF10E18F;
	Tue, 21 Dec 2021 03:37:46 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9776610E1C0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 21 Dec 2021 03:37:45 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id m12so19200112ljj.6
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 20 Dec 2021 19:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:reply-to:from:date:message-id:subject:to;
 bh=dvYMyLplijb9aWbUA9RvLPSyTQJCKNVwcpj7Ix1s9sM=;
 b=h9S4o0oJzPRWYIMcvkGe5q5YEJeE8bSFRvBAHqU8+LD0g0HJdE2S19wmSeeF2hDnHa
 o8Z4m3/BBc8hCF1Y1yIMNvrkOaaKSUcIkGz/yecxqSXFC8fOvDK/FGHXYpQ1Viy76NQE
 Uu/PO0QmEoXqY+o3yzCwzhoHMatuc8K2JTZURpm/wDogY4Vr1MhRrfip05uOk9pgiGfu
 oEdUqwhZf1ytnb06QG6S85i93exGPFFwHFruPiYeFbjPv+GbPoj97nDfZZEA4Rkz18G4
 4nftxaH9IQ04kBRWVWGqc5TDnE2E9hyMXNXGyqoJKtf72RJNSnt8oeae3TPIxUlO8rOj
 DzEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:reply-to:from:date:message-id
 :subject:to;
 bh=dvYMyLplijb9aWbUA9RvLPSyTQJCKNVwcpj7Ix1s9sM=;
 b=STW+E/TAmV602FY9BUMzFGI4zw+gd6dOyUCdE5Nkm2YzPeFXScSHC+gSqPwTdr6gvN
 RqEokha8/Y58P3aUwmVaFoMkgMYrJkQCkwLutP6V/pTgYVEpKI2hCAmBwNQi1VB7ZUMh
 DlNunC98LLAYDKz+182LWsL7DYd2Q+GldqXcNHnrXz8d6JcLMHU9QLdlbmd9vXLrVXcN
 NFCI4Y+w09x2Vd4u8CUcQlQ2n8kQUcFgWoscuZWWiZdayBrhInCTGjrVBIkCW+UA4Voo
 g5eDbVVpUQRiaOPrMhK9QSO7oyM8dtYl8ilTRxvBoXuh0t4kuZqJ63vyqOCsHgmD9y4G
 IrWA==
X-Gm-Message-State: AOAM533n4DlsgCKzktEBzY88vpN62T663mbEfmeGpHHZAlKd5eDiuTM7
 54DlRDBn8ncjRngpYqIFZ69HL7yyAs/wviMgKrc=
X-Google-Smtp-Source: ABdhPJwEwwWD4aTAcwX0Ll7mANzovl9uAb6uENdhWbJ4TW2akvIfWeVIqkON/Hs3ezzTlkVUSHMmgLkCOdEKdW+WauA=
X-Received: by 2002:a05:651c:205:: with SMTP id
 y5mr977941ljn.386.1640057863747; 
 Mon, 20 Dec 2021 19:37:43 -0800 (PST)
MIME-Version: 1.0
From: "Rochelle P. Walensky" <monpessoissa@gmail.com>
Date: Tue, 21 Dec 2021 03:37:04 +0000
Message-ID: <CAAjEgqOsy-EvWFh3RPdcTA+wZRnDUON2Jw8xOVQvJZEDyuaU2Q@mail.gmail.com>
Subject: RE
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="000000000000613f7505d39fba04"
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
Reply-To: paula19692021@outlook.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--000000000000613f7505d39fba04
Content-Type: text/plain; charset="UTF-8"

 hello

I am so sorry for contacting you through this means, this message may come
to your spam folder or junk due to bad network or distance

My name is paula,i am from Saudi Arabia,
I have been diagnosed with Esophageal cancer, It has defied all forms of
medical treatment, and
Right now, I have only few months to live and I want you to
use this Money(Saudi riyal 20,000.000.00 million twenty million Which is
about 5 million pounds) to charities home as my promise to Allah, i have my
only daughter which i will like you to take care of as their father died
when she was young and my late husbands brothers may kill her, they have
sold my gold company and my late husbands oil companies due to my sickness
i am given you 40% for you and your family. I will give you more details on
how to get the money.
remember Allah is the giver of wealth
Our Allah, give us in this world [that which is] good and in the Hereafter
[that which is] good and protect us from the punishment of the Fire.(
Al-Baqarah -201)
yours truly

Miss paula Mohammed

--000000000000613f7505d39fba04
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">=C2=A0hello <br><br>I am so sorry for contacting you throu=
gh this means, this message may come to your spam folder or junk due to bad=
 network or distance<br>=C2=A0<br>My name is paula,i am from Saudi Arabia,<=
br>I have been diagnosed with Esophageal cancer, It has defied all forms of=
 medical treatment, and<br>Right now, I have only few months to live and I =
want you to<br>use this Money(Saudi riyal 20,000.000.00 million twenty mill=
ion Which is about 5 million pounds) to charities home as my promise to All=
ah, i have my only daughter which i will like you to take care of as their =
father died when she was young and my late husbands brothers may kill her, =
they have sold my gold company and my late husbands oil companies due to my=
 sickness<br>i am given you 40% for you and your family. I will give you mo=
re details on how to get the money.<br>remember Allah is the giver of wealt=
h<br>Our Allah, give us in this world [that which is] good and in the Herea=
fter [that which is] good and protect us from the punishment of the Fire.( =
Al-Baqarah -201)<br>yours truly<br><br>Miss paula Mohammed=C2=A0 =C2=A0=C2=
=A0<br></div>

--000000000000613f7505d39fba04--
