Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA767440A24
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 30 Oct 2021 18:04:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA92B6E038;
	Sat, 30 Oct 2021 16:04:36 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1C6F6E049
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 30 Oct 2021 16:04:35 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id h7so49704371ede.8
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 30 Oct 2021 09:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=tvrP+tp29Y3weN8U85Ji9+PnBnmNI1kYZ2gMw7YfXUg=;
 b=awe/lkk0XV/Ju+G5BBvQ5QbN2oWJpTrnc1ju9+//0V6Ulvy4Knh+fTqGYlPZA6uu5n
 +mJ0BhhBjDeYI4QEmZzDgZnn4Tie50or56a+aoZXdmfsT52SxmV/NkFUGR8etuvcKmwz
 xE/cDZ/jWkW7n/m0oY1ISdKP68t3A372H/9c0qFEx2H8yDFs6M0kUZffLXQvqTxLvo4m
 n0ccc0A948RSC/XlfaETvUfVd7SDYr+K6JoUF20YViR9IYpYD7bVt+0xRrZoPGlhEbJ5
 uZ7XhMASkPs9LUvO0/RIyjA3lb9Q1Zrpe4/leT8xEY9zvqCnvcRVVJuwsnABf6HCNFTg
 w4cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=tvrP+tp29Y3weN8U85Ji9+PnBnmNI1kYZ2gMw7YfXUg=;
 b=EUg+S4dFj1C7cvtP9QFY6dbJ/0GqBcQYZpHg9pZ2h6x/jJz6OFBbtbosr5FvhQ3Vf0
 9SHfq9QC2JdFXMm3NvrNvsnvK16UiM3yCujEUFLKHDMFDpKK/JMlkLwC/G3nWbH5aR/r
 PrqkOo9lc29kToBo0V8krSSoVjIxaxujuAL94EPXCJ8o7nK4moighexuI60vWVV9+m0g
 ZDU3Api4febPlvdRF3Ige2SpQsvIeGfGSfhF59/A0zujmn2dm+frFrzuJKvLijWKZTCg
 I3EFbEEm4Kxt2AD/JvV3yzNFWnYDQvTgNHeG+8OSk84NI27Uq1n6jC8uT8GHYGpyuYiO
 Ckcw==
X-Gm-Message-State: AOAM530JU4T8xkFNu3CYV+W8j6sK/ajl5/linysRP9Ngp0qJ8Gt1qhCC
 tNzP/NZBaYZH5rB3NpcNcODGtnShjXKYAOUk1rg=
X-Google-Smtp-Source: ABdhPJw0yHbCWyFfvBO00su/GfP87X0Lio949KQ+RfQ/ysZyQFF38dtFIhiataE3Erew3afPg3TRqEbcvlQRGPgCzVM=
X-Received: by 2002:a17:906:9f21:: with SMTP id
 fy33mr22244559ejc.567.1635609874183; 
 Sat, 30 Oct 2021 09:04:34 -0700 (PDT)
MIME-Version: 1.0
From: Mabel Sanchez <sgtmabelsanchez8@gmail.com>
Date: Sat, 30 Oct 2021 17:04:11 +0100
Message-ID: <CAJ-BvSwYtKdTr_sRHDmdrD4G8bg9GhohFgoys=jZLp4H=kz3Wg@mail.gmail.com>
Subject: 
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="0000000000008abacc05cf941980"
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

--0000000000008abacc05cf941980
Content-Type: text/plain; charset="UTF-8"

Hello dear, My name is Sgt. Mabel Sanchez, please I have something I would
want to discuss with you privately and if you wouldn't mind.To make this
successful, please do communicate with me here
(sgtmabelsanchez8@gmail.com) .Thanks
dear,I'm waiting to hear from you soon.

--0000000000008abacc05cf941980
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello dear, My name is Sgt. Mabel Sanchez, please I have s=
omething I would want to discuss with you privately and if you wouldn&#39;t=
 mind.To make this successful, please do communicate with me here=C2=A0 (<s=
pan style=3D"color:rgb(95,99,104);font-family:Roboto,RobotoDraft,Helvetica,=
Arial,sans-serif;font-size:14px;text-align:center;white-space:nowrap"><a hr=
ef=3D"mailto:sgtmabelsanchez8@gmail.com" target=3D"_blank">sgtmabelsanchez8=
@gmail.com</a>)</span>=C2=A0.Thanks dear,I&#39;m waiting to hear from you s=
oon.<br class=3D"gmail-Apple-interchange-newline"></div>

--0000000000008abacc05cf941980--
