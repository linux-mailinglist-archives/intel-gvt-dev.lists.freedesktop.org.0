Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC16D89166A
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 29 Mar 2024 11:01:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63FE911261E;
	Fri, 29 Mar 2024 10:01:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AoGq5TlM";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35EC311261E
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 29 Mar 2024 10:01:14 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-513e89d0816so2059804e87.0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 29 Mar 2024 03:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711706408; x=1712311208; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:subject:to
 :reply-to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=pt6Y4KrqgaNiziD5GOk3AquJiGBASDiQYisFtAwleW0=;
 b=AoGq5TlM4sUfmHX+pyyTcb0DIvofJ3PGADSBFSmvKapgJR4Qk2kmmAs5psB5c20o8v
 nCw9DuhF4am0Y2yqLSywJH0OgLVFo+nKsExVkfC+YPSqd7pCcdwRkiQspAErzwM0tPBJ
 zXEJc5Cp+TU8z0h91f1GnOGT+22u1Tac/LLmvh/XJM49KEcZ86CU1UUmgMu045Fmyjek
 h2WzUCgX8o9MiPYk6v1USfkvqbDtiRJs6zpfO1DG9vgmUC9Qg2VIb0dd2DI5EME0wHao
 mjeI92D+xuXlLlB3VxYReK4hzfV3LL5xTPwgiwaNVd544g+0Yp6ytgxpNAy0nUgDH0ux
 OLFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711706408; x=1712311208;
 h=content-transfer-encoding:mime-version:message-id:subject:to
 :reply-to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pt6Y4KrqgaNiziD5GOk3AquJiGBASDiQYisFtAwleW0=;
 b=f5GJ11Nie4G873yiQ9amUqCEjpN9u2J6LuqXJ8WgegY40FyLaysZabMjnUYOFsjEuP
 Nalw3miRazYEQ7/CGrOu+0b+nQZIXGg/0bnw04i7cyP5vYQ6v1q+o0XU2Elb3ttu82dx
 G1DHsLWHqmdoAGDl2zM2zXmJpXJXpalGDRyRtqoWaEl3nOCWoiZkN94j1fKKVlWcgPpa
 WxfIRgcdefCoHzIIpNK6l6MW53dvu2Hdzbe6hWk0FkuP/b99gt8ovhQq+Cq/xiUcyxNb
 Gh77qsbmtPpuzoLCm7bJDHsuUzY5mC39hgrQihjdubFRwAZWSXYYnrgUYIn7WtRTy1kt
 OOwQ==
X-Gm-Message-State: AOJu0Yw0P8XBqoknsOKN2633gKFKCXc973mL6Rpu1iGkCmxu41JmDMUG
 8IhQVASVqFR3mm15VaTArsKuo0sqXHrZCVv3aHIWkw3FSdAMlxM9kPhlVaes
X-Google-Smtp-Source: AGHT+IHl1Ps4LWsrcWz/vO/Ugpurd6itojZh5/OUp9O49C614o8c+Ji3ObmnMaGMltswMWXO/F67Zg==
X-Received: by 2002:a05:6512:2085:b0:515:d44d:1f4d with SMTP id
 t5-20020a056512208500b00515d44d1f4dmr47816lfr.62.1711706408357; 
 Fri, 29 Mar 2024 03:00:08 -0700 (PDT)
Received: from [156.0.214.32] ([156.0.214.32])
 by smtp.gmail.com with ESMTPSA id
 bt30-20020a056000081e00b00341b9e11b11sm3874903wrb.24.2024.03.29.03.00.06
 for <intel-gvt-dev@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 29 Mar 2024 03:00:07 -0700 (PDT)
Date: Fri, 29 Mar 2024 03:00:07 -0700 (PDT)
X-Google-Original-Date: 29 Mar 2024 11:00:06 +0100
From: Office <agbojean10@gmail.com>
X-Google-Original-From: Office <pictures@jhf-china.org>
To: intel-gvt-dev@lists.freedesktop.org
Subject: =?UTF-8?B?R3LDvMOfZSA=?=intel-gvt-dev@lists.freedesktop.org 3/29/2024
 10:48:46 a.m..
Message-ID: <20240329104846.F9DC4F098E0219D9@jhf-china.org>
MIME-Version: 1.0
Content-Type: text/html
Content-Transfer-Encoding: quoted-printable
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
Reply-To: Office <parkerjudith259@gmail.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

<!DOCTYPE HTML>

<html><head><title></title>
<meta http-equiv=3D"X-UA-Compatible" content=3D"IE=3Dedge">
</head>
<body style=3D"margin: 0.4em;"><p>Gr&uuml;&szlig;e<br><br>ich wei&szlig; ni=
cht, ob Sie meine erste E-Mail erhalten haben, aber dies ist das zweite Mal=
, dass ich Ihnen schreibe. Ich schreibe Ihnen, um Sie davon in Kenntnis zu =
setzen, dass die Auszahlung Ihrer Zulage vom Verwaltungsrat des &Uuml;berpr=
&uuml;fungsausschusses f&uuml;r Zulagen und Verg&uuml;tungen der Vereinten =
Nationen genehmigt wurde.<br><br>
Ich bitte Sie daher, Ihre Angaben zu best&auml;tigen, damit die Finanzabtei=
lung Ihre Auszahlung unverz&uuml;glich genehmigen kann.<br><br>Bitte f&uuml=
;llen Sie die folgenden Felder aus.<br><br>1. Ihren vollst&auml;ndigen Name=
n<br>2. Ihre Anschrift<br>3. Ihre Telefonnummer:<br><br>Wir freuen uns, bal=
d von Ihnen zu h&ouml;ren.<br><br>Mit freundlichen Gr&uuml;&szlig;en<br><br=
>Judith Parker<br>Leitende Beraterin bei den Vereinten Nationen.<br>Vereini=
gtes K&ouml;nigreich.</p></body></html>
