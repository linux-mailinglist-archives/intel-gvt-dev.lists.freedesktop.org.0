Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D97C58CA90
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  8 Aug 2022 16:33:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 264A618B6CA;
	Mon,  8 Aug 2022 14:33:18 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FDD218B064
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  8 Aug 2022 14:33:12 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id
 w11-20020a17090a380b00b001f73f75a1feso3887680pjb.2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 08 Aug 2022 07:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:mime-version:subject:to:from:date:from:to:cc;
 bh=ML26rUkiOBEKoq5or/SY8nsGaxboOCjyhxS73ghRdIo=;
 b=qIStx8vskvLUy7qfELoUn0cE5kZBDHQBsp68udvDTTB/sblSVqKzPW1o6WSmPgkVcn
 u6q/GcufpBX6ccqMk1dGq4kGI2PzsdIDagxidwbrlLzx1bBHi78X1Ik/4ZbDt8B+2rlN
 62/XJLuIFICvyXZZnS0OaRkab9cXzDzIw3aLDWPy69MKIu83UEMm+Y4x8yYi7w+Jxyd5
 7YL5DeUECofe0yFmT9HiGCVx0+9xpEyM/NmHZZkIH3RrLeB+qTdv+HK8dv4AgCzC58S4
 DORkdzDU6uOR85utLd4+YFEHrDcr+0IbSN10taRxgsCiDsaH9YQO03i5T2Xk6gCgUUxS
 WXWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=message-id:mime-version:subject:to:from:date:x-gm-message-state
 :from:to:cc;
 bh=ML26rUkiOBEKoq5or/SY8nsGaxboOCjyhxS73ghRdIo=;
 b=uexM6d6Vo8ksSResvej1iKPie69Ex+LUehJuZtADKsSUuYWtsQcAIdFjfbGmWOsyhZ
 RvOr27umYv9UnMRXlC2EHKsX+IoYeTu339Ohp65G6c7tVP+yRE3PGexRaC1RNRUtK4a5
 4UXtrRI6u+bwRANlveHJUTPa/QV/NMJ192ruQi614V4QsSnc7XcpjDtWRSC5LakFoHTB
 nFqOtE8K6AkR7Y8g/3COkG4MEYO7RZq7/BPewOTjhZzLyN0+w/v8cldzk/JBi4msbi88
 ADNvcLA553vPmEY1tjGCdmkBmg/qM/8RMZ41auptSYPVB+RII3Pl8urfHYaJ0AZAqIpV
 CAUQ==
X-Gm-Message-State: ACgBeo0WoqgQzvh4tCrE7GG1vaBR5FWTZb2blsx2fIU9gfBqcZUNFWks
 jk0XQ35KozaH6xdIfsGfi6qly8obCj8eXYg=
X-Google-Smtp-Source: AA6agR69Z/CmCSoVaoeU65LouTtUsS7m/KCs9NBjXovhyv5KybEAjjVDvmXGFTxSjd9+Hf3bJYoXIg==
X-Received: by 2002:a17:902:f688:b0:16f:28:ea27 with SMTP id
 l8-20020a170902f68800b0016f0028ea27mr18485129plg.151.1659969191951; 
 Mon, 08 Aug 2022 07:33:11 -0700 (PDT)
Received: from user-PC ([173.245.219.68]) by smtp.gmail.com with ESMTPSA id
 x10-20020a17090a6b4a00b001f6c86e6ff0sm5368536pjl.36.2022.08.08.07.33.08
 for <intel-gvt-dev@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Aug 2022 07:33:11 -0700 (PDT)
Date: Mon, 8 Aug 2022 18:21:17 +0400
From: =?utf-8?B?2LPYp9mF2Yog2KfZhNi52KfZhdix2Yo=?= <llouislouis05@gmail.com>
To: intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>
Subject: Re: Reminder of my previous letter.
X-Priority: 3
X-GUID: 5D15F939-C58D-4DB0-9052-DC26DEEDD447
X-Has-Attach: no
X-Mailer: Foxmail 7.2.23.121[en]
Mime-Version: 1.0
Message-ID: <2022080818205251843520@gmail.com>
Content-Type: multipart/alternative;
 boundary="----=_001_NextPart238130316852_=----"
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

This is a multi-part message in MIME format.

------=_001_NextPart238130316852_=----
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

R29vZCBkYXkgbXkgRnJpZW5kLCBJIGhvcGUgeW91IHJlY2VpdmVkIG15IHByZXZpb3VzIGxldHRl
cj8gSSBiZWxpZXZlIHlvdeKAmXJlIHNtYXJ0IGFuZCBhIGJ1c2luZXNzIG15c3RlcmlvdXMgcGVy
c29uLiBJdCB3b3VsZCBiZSBhbiBob25vciBpZiB3ZSBjYW4gYmUgZnJpZW5kcy4gSSBhbSBBbC1B
bXJpLCBmcm9tIER1YmFpLiBQbGVhc2UgY2FuIHdlIGhhdmUgYSBidXNpbmVzcyBkaXNjdXNzaW9u
IHRoYXQgY2FuIGJlbmVmaXQgYm90aCBvZiB1cz8gSSB3aWxsIGV4cGxhaW4gdGhlIGRldGFpbHMg
dG8geW91ciB1bmRlcnN0YW5kaW5nLg0KDQo=

------=_001_NextPart238130316852_=----
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charse=
t=3Dutf-8"><style>body { line-height: 1.5; }body { font-size: 14px; font-f=
amily: "Segoe UI"; color: rgb(0, 0, 0); line-height: 1.5; }</style></head>=
<body>=0A<div><span></span></div><div><span><div style=3D"margin: 10px;"><=
div style=3D""><font face=3D"verdana" style=3D"font-size: 15px;"><i>Good d=
ay my Friend, I hope you received my previous letter? I believe you=E2=80=
=99re smart and a business mysterious person. It would be an honor if we c=
an be friends. I am Al-Amri, from Dubai. Please can we have a business dis=
cussion that can benefit both of us? I will explain the details to your un=
derstanding.</i></font></div><div style=3D"font-family: verdana; font-size=
: 10pt;"><br></div></div></span></div>=0A</body></html>
------=_001_NextPart238130316852_=------

