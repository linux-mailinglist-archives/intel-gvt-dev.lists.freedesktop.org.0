Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1322D911CA7
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 21 Jun 2024 09:17:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB89710EB0E;
	Fri, 21 Jun 2024 07:17:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NVNlelBV";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5495010EB23
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 21 Jun 2024 07:17:12 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id
 5614622812f47-3d4430b8591so887616b6e.2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 21 Jun 2024 00:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718954231; x=1719559031; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=1YIxeipAVc5LQYIaRyJ8mumwC1UhziW1i7ZfDql3Lvw=;
 b=NVNlelBVjMKJY57AC+jdc9/uNnz+wIvodsMm6uxzmipZ5jeMgchZ6vd3V/+NMc5O62
 T76U8jyJ22iqZnueZywdHqViAF38LQpqgk6m1w66WLCdY2eEkcxULm55sR5CaFGqZ4Qu
 r7BBYE70fLzVJlcSlIACduBFjYGrawR1Lqr4l8jeKEv76Xb99Kq+xJFi1lzvELPxGyzN
 7w76Zi3nJT0N8tfTYLDnGWLul1ATeyO5MgoJ+hGpIUY3sp/ePsEALmqOxOX8fXPegmzO
 2+3YFnA0Qt4MbANypKzKnggtddN6suwLqQTN/yPa51wKDaQD0SDiZE2Yf6dpje+FH4H3
 tzng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718954231; x=1719559031;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1YIxeipAVc5LQYIaRyJ8mumwC1UhziW1i7ZfDql3Lvw=;
 b=l06GUxqUGDoX+pxw/V+85dhPaOBY9YwNv1HvOpR0/d+WxEiQecjIr6UndBiWNx+FoM
 iAlxNK/7BdO4TCtUKJr5PqZ8xpfO8f/8+jTRG1qhd+RMkGvxkcXgFsWOnj8O83QqeUCw
 m1lOckJdWwjwhLFINWqY/5AaSEn7GdpX9efN6xH7wBKORraFj/yFfu9r4HPJ622V0L5d
 EOvJRsZk6SX8naTIxAWdJ1HKbVQ8CgqcIkBNsBgM9WpOIObklgxB8kAj5FPhHaQ+1E83
 5058HJM8lUsMn6pRTQ18VFBHw0cvzjUBeJFRYokJKY6HAu2G0aAxdO4RdrWWG4v0FuNz
 7b1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUg45GK6bXml2aPX8nQG1LETkO8sl/ynp1SwI5PVQhS7lWMSDWOv/ZlV8p0tRQcVqZbT+pX42yPr0DNj7Nkk+GgcdDPgSmdMF5svEBQ4T4Dhodulw==
X-Gm-Message-State: AOJu0YzZOp5M2DaHIkVG/zMhl004eDhtdkYGKDEa292cITrm1uQlHKkC
 MpPTG3j//m8Xzkx5PhNu48s6ZmdP+SB7cUZI4wwdi1i/hat6tsKn5KRWnmID4xroDnv+BCJFP7m
 RJ/PKjjtPn7BQihtxqwSLFFSS4A8=
X-Google-Smtp-Source: AGHT+IFJs3GAwGSJ0vxRXiIvSALYNdjZ3dpzR4MyNRt3bfVXm0PRghSxxiq2JknL+UlnSWReaJ8uts4BuHWvHXipghM=
X-Received: by 2002:a05:6808:1705:b0:3d4:41b6:6c4e with SMTP id
 5614622812f47-3d51b9b86a6mr8063929b6e.16.1718954231329; Fri, 21 Jun 2024
 00:17:11 -0700 (PDT)
MIME-Version: 1.0
From: Soros George <sorosgeorgewww@gmail.com>
Date: Fri, 21 Jun 2024 09:16:59 +0200
Message-ID: <CACVjM-M7dY593ThmUzYaKQj6ps4hnUzUnNRQ_fPKbp7yw35wOw@mail.gmail.com>
Subject: =?UTF-8?Q?Sie_haben_eine_Spende_von_=D0=8420=2E000=2E000?=
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="00000000000057ff7d061b613866"
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

--00000000000057ff7d061b613866
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Guten Tag, Sie haben eine Spende in H=C3=B6he von =D0=8420.000.000  erhalte=
n. Mein
Name ist Soros George, meine Stiftung m=C3=B6chte Ihnen eine Spende in H=C3=
=B6he von
=D0=8420.000.000 anbieten und als gl=C3=BCcklicher Mensch werde ich spenden=
, um die
Wohlt=C3=A4tigkeitsorganisation Waisenhaus zu unterst=C3=BCtzen. Kontaktier=
en Sie
mich f=C3=BCr weitere Informationen, um Ihr gespendetes Geld zu erhalten: D=
ies
ist 100 % garantiert  https://www.youtube.com/watch?v=3DsuMviHNNk2U

--00000000000057ff7d061b613866
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Guten Tag, Sie haben eine Spende in H=C3=B6he von =D0=8420=
.000.000 =C2=A0erhalten. Mein Name ist Soros George, meine Stiftung m=C3=B6=
chte Ihnen eine Spende in H=C3=B6he von =D0=8420.000.000 anbieten und als g=
l=C3=BCcklicher Mensch werde ich spenden, um die Wohlt=C3=A4tigkeitsorganis=
ation Waisenhaus zu unterst=C3=BCtzen. Kontaktieren Sie mich f=C3=BCr weite=
re Informationen, um Ihr gespendetes Geld zu erhalten: Dies ist 100 % garan=
tiert =C2=A0<a href=3D"https://www.youtube.com/watch?v=3DsuMviHNNk2U" targe=
t=3D"_blank">https://www.youtube.com/watch?v=3DsuMviHNNk2U</a></div>

--00000000000057ff7d061b613866--
