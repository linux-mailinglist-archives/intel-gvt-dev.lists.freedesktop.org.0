Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E993A00896
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  3 Jan 2025 12:28:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CC1E10E884;
	Fri,  3 Jan 2025 11:28:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="V3pxG1A9";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6013710E884
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  3 Jan 2025 11:28:17 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-304d760f12aso12033451fa.2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 03 Jan 2025 03:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1735903636; x=1736508436; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+dRE9vM4ej2GCNGIhG0asDg2gSJmIFVQko4JmCbi+5Q=;
 b=V3pxG1A9uybv/oKxS+0JT85yBpYQZidmWyqLcKVyQRZS5wZNIgWN5gh4PUoxeLRapR
 /q7eH/wSp/NTfKFOOk4uEu3Ofe8dvmB8+dfumlEC7Qbhe3sn9HmbEjNqtydRmYGyBllZ
 UaEMQlTrJYwWihe5KOkPSGraXeOc96jUPomxdC7fhrj80pzORuIpBvKmfrjh6NpEByE7
 XdLup4kIdomCWk4h8TtwoGjHDp4i55vqR4tXzaBPByVovzYLdnaiKzIZYJd4/XmkM6Id
 DvWmjZ2S2q4mOJa2wm911449MpmLyysteTo9HAS13zuLwKyT60XZ46Vd/I3HTMDH9r82
 xJKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735903636; x=1736508436;
 h=to:subject:message-id:date:from:reply-to:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+dRE9vM4ej2GCNGIhG0asDg2gSJmIFVQko4JmCbi+5Q=;
 b=DVXbAF9HpudnOzNvka6N9265Ly7cZVtoOpaODhbOEEBqtV1f33CoxfVOstGUbQFN8O
 y4PYxOyMR/mpxeZ/tr4aG792CXr45sQAgAgVN4a2bUkuwPpI3cmlcFEURINs/J2kiEFZ
 XtBcjLU+1PnpmR1RM5O6zO6a7D2KkKcMABhnmboLLv45d5iuBIbArckuGLtUztgKDyvL
 /57jWd3HgWjAiuBF/K2EFEEeA+tUbsjzRi3p+n/7WHuGYwNyv9mIKAvj7v6HnK50a5Kd
 Im1Pcb4Bjm815oKUZXeaKm1WptI2mxagMikQjZbfZxWNC9lJKQ2RxTocg8LyTM0DRmkA
 DfOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVklbkHXMWsW1ESwWhrouokuc4jVOFQMVvOCiLD1XuwPBG9YzvidauM2yPRKm3ZKfYJVmie6YHv2J+urrLf@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxk/kW6ib2Wq3sohkPDbeT+H9iQeFvPK+o7xwxy+RGn6lPnxrqX
 Z4X2Ip3726hRhWTd0ChLo9iu8S+zIXGIndRnFBJqTbeQiHM+fgyiVYrHMXgJw+jAQVpqdP71ERX
 ixnoQ2FN7OsaKbM1TC0jurJ7gXNwwDq3N69hd1w==
X-Gm-Gg: ASbGncs/GQqPoaH/JvA74ow/L0ZlsPt97Dni1Z+dqIZW+o5lXkxvFtlQlB4S3B0NMcX
 YFuItCMjNhN3698fGGwsQ9pz8g11HbEc+L9k1WMqMQQfElsLEKmVwZmDzudvSMn89pY79Slw=
X-Google-Smtp-Source: AGHT+IFhP2N9gqr0VcAnd/sa6F5vQkgCho+F9Qr3My9A52fqqcIoeaDg61SaFE+0do9m5auNuE1XvA7oPxvXxqxjXso=
X-Received: by 2002:a05:6402:2802:b0:5d3:cff5:635e with SMTP id
 4fb4d7f45d1cf-5d81de065b8mr115100504a12.26.1735903245990; Fri, 03 Jan 2025
 03:20:45 -0800 (PST)
MIME-Version: 1.0
From: XING <azfartahirz@gmail.com>
Date: Fri, 3 Jan 2025 03:20:34 -0800
Message-ID: <CAGOUVTf13Cm9TEJYm8UH3d_Nk7XToAt36eD8Rxemmxggw3ebjQ@mail.gmail.com>
Subject: =?UTF-8?Q?AW=3A_Lukrative_Gesch=C3=A4ftsgelegenheit?=
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="00000000000057826c062acb78ef"
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
Reply-To: msmeixinglin@gmail.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--00000000000057826c062acb78ef
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ich bin Frau Mei Xing von der CITIBANK (Hongkong). Ich wende mich an Sie
mit einem lukrativen Gesch=C3=A4ftsangebot, das sich meiner Meinung nach mi=
t
Ihren Interessen deckt. Ich w=C3=BCrde mich freuen, dieses Angebot mit Ihne=
n im
Detail zu besprechen, um die M=C3=B6glichkeiten einer f=C3=BCr beide Seiten
vorteilhaften Partnerschaft auszuloten. Bitte z=C3=B6gern Sie nicht, mich p=
er
E-Mail zu kontaktieren.

--00000000000057826c062acb78ef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br clear=3D"all"></div><div><div dir=3D"ltr" class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><s=
pan style=3D"font-family:verdana,sans-serif">Ich bin Frau Mei Xing von der =
CITIBANK (Hongkong). Ich wende mich an Sie mit einem lukrativen Gesch=C3=A4=
ftsangebot, das sich meiner Meinung nach mit Ihren Interessen deckt. Ich w=
=C3=BCrde mich freuen, dieses Angebot mit Ihnen im Detail zu besprechen, um=
 die M=C3=B6glichkeiten einer f=C3=BCr beide Seiten vorteilhaften Partnersc=
haft auszuloten. Bitte z=C3=B6gern Sie nicht, mich per E-Mail zu kontaktier=
en.</span></div></div></div></div>

--00000000000057826c062acb78ef--
