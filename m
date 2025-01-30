Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A8DA2376A
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 30 Jan 2025 23:58:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FD8810E029;
	Thu, 30 Jan 2025 22:58:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KAtB03J6";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com
 [209.85.160.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECF9410E029
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 30 Jan 2025 22:58:04 +0000 (UTC)
Received: by mail-oa1-f41.google.com with SMTP id
 586e51a60fabf-2a3939a758dso452364fac.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 30 Jan 2025 14:58:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738277884; x=1738882684; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vDK051yi7fO0RwW15dD8Dp8z6fcBRssp8rcqfqUWoF0=;
 b=KAtB03J6kdqY0upyVL1nsa0Cglb5h7Q1J4aVz22XrYAx++coLaHJcLu5R92CnQzp9u
 8Wx7eZnMKfTgtRJTAkRHQ4LYji2LtD1mKtG2KhX+r07SSLpPBA/7rj9NAqjyUJlpgm8s
 Pxdox6V139QLQ3YQsPDtVm6A3YgOzhS0TbATj+Xpk8BKa1els29lYYFGhiMr8SZVCFHv
 GM7Ri1yWft3lZgVp6GxIzZYbw0d1O3CDBOr4E4JE6X3dgg9TMwYE9pHl9ShOD4IkR7h4
 VHEvUHcxVH/IcPsz/BPd5IckbJh3Lqs+24gF6WQo+pNXUsFQOp14JL/fpRgS501vbru5
 ihPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738277884; x=1738882684;
 h=to:subject:message-id:date:from:reply-to:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vDK051yi7fO0RwW15dD8Dp8z6fcBRssp8rcqfqUWoF0=;
 b=BKMkbeYSBOtf/TQ5/7I4kphTUqLz9Npd3yYaaG1aytTeCtMENkskRzvQo1EsDLreSJ
 sUsNidyS2Euf1bRRQl++0ZyvE6uObAors2/zURthSEYCDae1x4Zrm4IjDp+1GW1KTt85
 FM3Zp5DVsEbn0gGrjY9GgFHlQ6D27+teQ1EfYqyQ+qqkwF+/4BCqxMHonxLP+D93PfPM
 i0MP1NFmqMCic9NndTug3K/20vE6VdZV6Yyp+4/aeC6+3hH52Z8RpE2FaGW2zCHoiopH
 cRsWqZ/eI7zrPuoR1tCpqohjdk/KZ68N0LSmYPFqlKHbPXX2JJBQ5r7XRtZOANDhgkvP
 GVRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQS7tUOvDuWB5OVIAxfPxpeXmE9oEwwoHKoDbz7qMGw2JeItgHXCbDi6qdXDpK4501mwerWJued8uR0HtU@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxJZtVKzoaZ6TUrJSNxXLUz/x1MELrDQF4M9Tm8BNO/m5IwVgcZ
 9k0cnkTM9Iq6RbIjyWq7jA5u06PjogrHA1SvNkOnpvI/zgXU4mjwVx2gHg5URz6kBVlX8RMfr41
 z8T/r55PJPMNBfmbbaqr/N9KWHGM=
X-Gm-Gg: ASbGncvL8tmSO8U7rFzS81eGOacLArGENwVFhVjr5ltefimX8qCzx3w8dvDVlaCE4Jy
 rInbO+ceAGtJcDQZofMBH8+mEBmEdz1IT9bjdc1H/X/XbLF11BsPs1cGR9Ojk5hLsMjYuMsa2m4
 A=
X-Google-Smtp-Source: AGHT+IE735wMqdnuhg5i4LboNAwT+a3xOYGUzEleltLvsfYtuOS5J8fcMNa2rDjUBaDVyut+KyydFxaJP5TfKo5g72o=
X-Received: by 2002:a05:6871:a908:b0:29e:75ff:4d0c with SMTP id
 586e51a60fabf-2b32efe7cd6mr6514945fac.4.1738277883754; Thu, 30 Jan 2025
 14:58:03 -0800 (PST)
MIME-Version: 1.0
From: The Illuminati Agent <a0976392089@gmail.com>
Date: Thu, 30 Jan 2025 14:57:53 -0800
X-Gm-Features: AWEUYZmtPJLiO69r1GXnfiqfvKcsR4iWwjWms2EGN2JJfh9Mj6hmbkVXBGHx_ZI
Message-ID: <CAKYXr+5SYxRK7EZDkahGajcMzkD9e=X8DjBx-U+sUBsmkdtpBg@mail.gmail.com>
Subject: 
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="000000000000c84158062cf45b72"
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
Reply-To: theilluminatiagent220@gmail.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--000000000000c84158062cf45b72
Content-Type: text/plain; charset="UTF-8"

WELCOME TO THE GREAT ILLUMINATI.

Greetings to you.
Are you ready to Join the illuminati for wealth, fame, power, protection,
Wisdom and all your desires. Apply For Illuminati. Membership Today And
Enjoy The Benefits. Join us today and start. receiving $5,000,000.00
USDollars as first membership benefit. Also more await.
Kindly reply yes or via Email: theilluminatiagent220@gmail.com

HAIL THE LIGHT

Note!!! Distance is not a barrier to join the Illuminati.
Welcome. What is the Illuminati group? And what are its objectives, and
thanks

--000000000000c84158062cf45b72
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">WELCOME TO THE GREAT ILLUMINATI.<br><br>Greetings to you.<=
br>Are you ready to Join the illuminati for wealth, fame, power, protection=
, Wisdom and all your desires. Apply For Illuminati. Membership Today And E=
njoy The Benefits. Join us today and start. receiving $5,000,000.00 USDolla=
rs as first membership benefit. Also more await.<br>Kindly reply yes or via=
 Email: <a href=3D"mailto:theilluminatiagent220@gmail.com">theilluminatiage=
nt220@gmail.com</a><br><br>HAIL THE LIGHT<br><br>Note!!! Distance is not a =
barrier to join the Illuminati.<br>Welcome. What is the Illuminati group? A=
nd what are its objectives, and thanks</div>

--000000000000c84158062cf45b72--
