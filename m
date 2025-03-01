Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E583A4AC5A
	for <lists+intel-gvt-dev@lfdr.de>; Sat,  1 Mar 2025 15:46:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70ACC10E273;
	Sat,  1 Mar 2025 14:46:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jhgj75qP";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F110410E273
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat,  1 Mar 2025 14:46:23 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id
 d75a77b69052e-472087177a5so37464251cf.2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 01 Mar 2025 06:46:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740840383; x=1741445183; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hcT6/gudrgSXrOt5Y8cNwV+CzJCtkclqhxVGdcwXMlU=;
 b=jhgj75qP51aek0qli9oKzyKY4oQDDRdBovlw3kH+/NdNeuv8XRVHSRk7R1Aohe2PPQ
 U/OpjAIAE+Ye61PIz4oWPiNjfpik3B1sP3AzA9AZmYflWQrl6RCVMylI81T+awDaKWjJ
 uMjB04SLGKgmEYya0Ngr4gJ893EzRnaxyXnq+HsICQqPHX5o1h8Gf7RKnC7hEX10uHgY
 BnkTEU6FacdWd2cCsyRrFP++KzQDYL1//Lpm6CmP7/c/mCfb/i4IHP3kkL6bUxQprH6P
 r273OgGQpQKzcFd6V7YGKaNl02mK8ljyAzVId+IvgQeNW0iy1VqiRpzBRgxaSm4wU3rQ
 puHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740840383; x=1741445183;
 h=to:subject:message-id:date:from:reply-to:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hcT6/gudrgSXrOt5Y8cNwV+CzJCtkclqhxVGdcwXMlU=;
 b=WKkMBlBmYyckulpgRWlW/dXcbHFQ7G8ZRRFDP0lMqB9o/6i5a07xPdFSu1IKp0qv/2
 w99ShrPURTVmiARrKmZcAlgaemjsiMUbP0QsP2yfIoxbe3FQ7qL4qOKNzZiV/nLRA/U3
 E5F0NzdH9qkF8sMdGQ2SGL9pIgxzUoPEbBfn+pc0LQpGdY9SWTpKiecMOhx1/TcrEf0g
 INGjCMbv6TRtjM17ntC1ArhGe+w4kDBGSW0B9OcDi9SkDdy+2DhEhbSC9KI5XE25X6JV
 0CvzWJlytp5o43JwRWgrySMmd9a/p3CtuLGCoPSt9EJ1t4uV+FH2j1dhVVy8TaYHbLMm
 63JQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJrQ5O5N4H30Q7n4gkrTFwZ/6ndV4k5ahaGiIINhS0xqDfAuet6pfsO/ld3mMb5YU6OBwAzVn+OpQAVMOb@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyTl5CPGly+YClbuJknKAeLY7UUafJcfIrXAzRZB9PbpkyK77JV
 3I56lp+Y6OOPiy4TmZJ8CqGMcOJVGWmW4ZfOeJTxV3anc5OySyoj1Z2jOKPlGrai6a/kNbt/9Le
 HM6laIfCCcIZtaFjAPbLkS8B9sek=
X-Gm-Gg: ASbGncs/tAwl8X+FqUgpMunVT0C2UJeXyVcPh/yeqHP/KQHu7rceqgSUyiEKUArUgOD
 X8uoiC60CVpicJv5kjetzC9PMyW2ovQpMi7oJmva63Iq6s6y6zOehtTIZovcBav7pES/vh3ADWW
 NbzHgNKgrQXpfEvhgaVGIkceHxPjmSJw==
X-Google-Smtp-Source: AGHT+IHZzNVCZ4+Ez38NEd63++eKphOO78vf1C/QSwwA68Tm4DGHRKAgz95VPVnHO52o9TaK012MjmIdNTXPtbT5brA=
X-Received: by 2002:a05:622a:1a91:b0:473:85c8:93dc with SMTP id
 d75a77b69052e-474bc0f27d2mr84473161cf.45.1740840382478; Sat, 01 Mar 2025
 06:46:22 -0800 (PST)
MIME-Version: 1.0
From: Gorge Henderson <jamiedimon386@gmail.com>
Date: Sat, 1 Mar 2025 06:45:52 -0800
X-Gm-Features: AQ5f1JqDJz1XJBAckNhkWemANd3cbJECurEI7K1fhhzcX0yXtApjr1RJpoib6S8
Message-ID: <CAPzRcr1G4f6P_euV6ig9neg3DGD80-Ks6neOcrxZz7AtpHipzQ@mail.gmail.com>
Subject: Attention: Please!!!,
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="0000000000009bc3fa062f48fcf4"
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
Reply-To: gorgehenderson88@gmail.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--0000000000009bc3fa062f48fcf4
Content-Type: text/plain; charset="UTF-8"

Attention: Please!!!,

We got information from Ms Linda Wells that you are dead as She claim to be
your next of Kin.she send a request to transfer yourself

Here is her account information where she instructed us to transfer your
fulnd, $10,500,000.00 as your next of Kin.

Account Info.
Account name:Linda Wells
Bank name: Bank of America
Account number:6540988760
Check Account.

But we want to confirm that you are dead before we proceed to transfer the
money to her.Please if you are not dead try to reply immediately,So that we
should cancel every communication with Ms Linda Wells and arrest her for
trying to claim your fund.

Please try to reconfirm your information below
Full Name==
Address===
Phone number===

Please reply now if you are still alive.

Thanks and God bless

--0000000000009bc3fa062f48fcf4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Attention: Please!!!,<br><br>We got information from Ms Li=
nda Wells that you are dead as She claim to be your next of Kin.she send a =
request to transfer yourself<br><br>Here is her account information where s=
he instructed us to transfer your fulnd, $10,500,000.00 as your next of Kin=
.<br><br>Account Info.<br>Account name:Linda Wells<br>Bank name: Bank of Am=
erica<br>Account number:6540988760<br>Check Account.<br><br>But we want to =
confirm that you are dead before we proceed to transfer the money to her.Pl=
ease if you are not dead try to reply immediately,So that we should cancel =
every communication with Ms Linda Wells and arrest her for trying to claim =
your fund.<br><br>Please try to reconfirm your information below<br>Full Na=
me=3D=3D<br>Address=3D=3D=3D<br>Phone number=3D=3D=3D<br><br>Please reply n=
ow if you are still alive.<br><br>Thanks and God bless</div>

--0000000000009bc3fa062f48fcf4--
