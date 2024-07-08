Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE0C92A09E
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  8 Jul 2024 12:59:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D09110E0FE;
	Mon,  8 Jul 2024 10:59:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QjEnbIBs";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
 [209.85.208.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAB5510E1B7
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  8 Jul 2024 10:59:50 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id
 38308e7fff4ca-2ebe40673e8so49563721fa.3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 08 Jul 2024 03:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720436389; x=1721041189; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1vjb1UXYN3i22a4P5oBmDN+I5ltu5noZ8cyWZ3tkDZM=;
 b=QjEnbIBsNLwymOqFSKE1B6CQ248gtHc7qtt5zjLdWUN6MYKpFi58Yro7FrXWT31p54
 cFfxr+pTVCKmDgyRvurqfpYMc46GtM0NnWJHZZKT4rO1R0f+TY+jRce9jabOpPsKadDM
 hLlNrsAX0wrF6rME+fcBLlGGEXdKHwQ38ec+IlmoTc68ndT8/g6K7Hj1d5c3mWDYi2ar
 ggAC8IS9fONx95k19wYUTp8dz4k74hnanA3minjLKtpk8M4a/LWMcKfGDH5u5nde2n6D
 aw92Ofl+S9SHYbuCzrqlpgn4INLvPlDaSr/5hHy7S7Q0NbfElccPLMDoYqIJO61nsSM0
 lyiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720436389; x=1721041189;
 h=to:subject:message-id:date:from:reply-to:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1vjb1UXYN3i22a4P5oBmDN+I5ltu5noZ8cyWZ3tkDZM=;
 b=wj75ary/d4s2CazPkCHnC2zFslM5pCbUKOl+9BMWc1nzKWy5ji22w4zH0hnr84aJ18
 7nk1lOlC25xOcLoj7k0ynDwrBY2GnAKDo8gANstHYuUHk6RIDVt4RuUHFqELr9MZC63c
 qEkBQwQl4RkAParScFGH2V/tSVvZOfLWZwN++Rhyre793dnUj7zZLJKpIp3ry+4KtCyw
 v7iNdqkbggEigtTnul3Bg/hAX7a5Y9jibMq65SX8374zYJ499x8BrgmhAyK5yd8MI3m3
 y/CyIJ+YXKwH5DQV5zs1L4L0qVv8Xi5FXhwXxTyQK91xgrxg5u01pbXyDslK70SMs/DI
 D4vQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMfXX0DnKKgCwJs4H9SStImqZEMjZghs9uR2/LUdAsJHh259GAkpuoGLHufn9z1+0Pk/jTjyNt4VaDgigTmYVyES4mINVLD9ZKapa3Gx3GU9rKsg==
X-Gm-Message-State: AOJu0YxSU5TXZiXDt8hWOibM3US1WuqHB+8RArLzixupnPRzgSodHTD+
 apJZcMuAyVolNlAQhoYKNXdYbRiZr5JwwhquuqQuT2XLPlnVcpWiKxqT5+9Vz9UNYD5LYNYK7FS
 UM8PZN0anBh3wQnlvOgdEwPgIzmY=
X-Google-Smtp-Source: AGHT+IHcobiAmfTQf7e8yWXiImRY4gBm0QR2iFEGmmrVZF5kMmeXChOTIQT2LjaPg5yhzQCsCiSh+GrNq/cqJkEEQ7M=
X-Received: by 2002:a2e:2c0b:0:b0:2ee:8749:d4a1 with SMTP id
 38308e7fff4ca-2ee8ed66d8amr77143831fa.10.1720436388614; Mon, 08 Jul 2024
 03:59:48 -0700 (PDT)
MIME-Version: 1.0
From: FAISAL <lindaanny016@gmail.com>
Date: Mon, 8 Jul 2024 03:59:37 -0700
Message-ID: <CAMC_TiWzEd9wp_pm_NQB__Cn6L34Qaa5xvY25L7OdA9uFu5C+w@mail.gmail.com>
Subject: Salam alaikum
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="000000000000cd58b0061cba4fbc"
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
Reply-To: faisal58171@gmail.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--000000000000cd58b0061cba4fbc
Content-Type: text/plain; charset="UTF-8"

Salam alaikum,

We are Saudi Investors Group company who are ready to fund projects outside
Saudi. We grant loan a low interest rate of 2% ROI per annum.Kindly revert
back if you have projects that needs funding.

Thanks

investment officer

--000000000000cd58b0061cba4fbc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Salam alaikum,<br><br>We are Saudi Investors Group company=
 who are ready to fund projects outside Saudi. We grant loan a low interest=
 rate of 2% ROI per annum.Kindly revert back if you have projects that need=
s funding. <br><br>Thanks<br><br>investment officer<br></div>

--000000000000cd58b0061cba4fbc--
