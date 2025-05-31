Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AADC7AC9AAD
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 31 May 2025 13:20:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8349610E11D;
	Sat, 31 May 2025 11:20:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="S+1POAlT";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com
 [209.85.221.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 319AF10E27E
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 31 May 2025 11:20:10 +0000 (UTC)
Received: by mail-vk1-f175.google.com with SMTP id
 71dfb90a1353d-52eec54acf4so731997e0c.0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 31 May 2025 04:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748690410; x=1749295210; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mFpYqdD02brjr37JBHtoR2nWucRJ27MNtKiulFtjPec=;
 b=S+1POAlTqImtSjz0bbbfWE5kD5fE+doR1XYcshPa294kcF59S34WIoIGhMYMRp1Cgh
 csSHNB1Oitf9nCr2uKxDhVYbfJcJZunlX8wO14hDMeq3esanb8gxKL+1/D8AbYsJ3cKx
 hFZB+7Yg7cZsrsOcKdPKiTgSfeXrRIRL2Oj9/tKN12q9n0L46a5701QmOhU11rWMlvn/
 2QTQ0xIPW9SPOknlLebqWqY/f7P260fseuSItgY6GqLlvMmXDvz8GZP988NceAta/sdN
 wRPMoGRqMYyu5ooqZj5Kyed0n6tSRA7n/uPA1G7hfuoBoNivWbq05Aer1NDas3INM9Oj
 3YlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748690410; x=1749295210;
 h=to:subject:message-id:date:from:reply-to:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mFpYqdD02brjr37JBHtoR2nWucRJ27MNtKiulFtjPec=;
 b=n0mJTVpnU64t/DsI42SbaDJwREbE1ewW2m82TiBMsI5NF7jeGKlqha1xLXXIR4OIR7
 sMmiLBFTLyTWEjUUCndoD5TLc84e/NtwqCtqxgPCeNZH1XWX0c8yH6UnqjGNsTxpXAN/
 GUGOnf2CRw4hjFvpAYa2DXyqVgPMMjIVRe9TQmDi7sK+lgXv2X1U7cZX4Ui8TCOBBWeL
 cQJqlCwp+bQNFGrEmpvVixCMH5TuLyd+6y1WFlaEg/32LmSb+DILW6eRU+gonUBT8EgA
 RfyDLdkAu5c+UQNXD69f6L3tH5slGO9dkN96v8AsYZPjHSpYUBtf0BkuaNVwlS8U9sKa
 U+/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvp1DcVYSvmyAwE07XiWY85Hs3kvf8XJptZAKVtgZ3OAdFVMPZDkv6QhvWsB+2B1x8//CZOXXzxOvXbGmv@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxodrbH4LHSaKKAjgwSftBwBI8VUW1Mw1yeO/MK/lE4RrxNguQd
 a1J74WIddNSHhHFTVFqs7Vb4tmEmlu3xUR1SJs2jf7p28LFlPjPc5dlyZje8PSnHPkUQoUFdO3x
 5RoSqm7Ogs05dsJKAtGPyb2Oh3Y36f7U=
X-Gm-Gg: ASbGnct+7a6AF+gRlQ8W1LUQbOxk6a+9wuSBRNWKnW5VKEqPqHL+SHP1wbUo0nDyKey
 GPjBjTwurJKAbJ82AnViczgPv8lvVkSICnSjQMKFVao8wxcZDTcvyxn+CXyh+uhYnXM7lrKzxF6
 +lcGNJJdQQfX1y2v5i8r7huvmEH2QTV08=
X-Google-Smtp-Source: AGHT+IEHloTR7NNglHtSm8BHNVxFkX1gOfn1E4KXqNY1nyub3YYTxbFUpsNqui+Y1flS9oxpsZU8UgRQChf+qwA4IR0=
X-Received: by 2002:a05:6122:790:b0:52a:7787:53d7 with SMTP id
 71dfb90a1353d-5308109f849mr6422250e0c.6.1748690409847; Sat, 31 May 2025
 04:20:09 -0700 (PDT)
MIME-Version: 1.0
From: IMF OFFICE <chimamadueke920@gmail.com>
Date: Sat, 31 May 2025 12:19:44 -0700
X-Gm-Features: AX0GCFunKLTce_Plmc2K4kwITp2IcLSST7l4TJjHxSu5IpZFi3WJ47VaXt1uxWA
Message-ID: <CAMyapNzdOcb2RHREbVmruT5qw6BiVjqr2+XvVNf4seTcNRzwsw@mail.gmail.com>
Subject: INTERNATIONAL MONETARY FUND {IMF} OFFICE
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="000000000000b3828806366cb6b5"
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
Reply-To: kristalina.georgieva@outlook.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--000000000000b3828806366cb6b5
Content-Type: text/plain; charset="UTF-8"

INTERNATIONAL MONETARY FUND {IMF} OFFICE
IMF Headquarters. 700 19th Street, N.W,
In Affiliation with West African Economic
and the Monetary Union (WAEMU).
Website:www.imf.org.
C/O Kristalina Georgieva
E-mail:kristalina.georgieva@outlook.com


Attention Beneficiary,
Your Long overdue Payment Is Ready.

It came to our notice today that your long overdue unpaid contracts
inheritance funds, next of kin and lotto benefits that was originated from
Africa, Europe, Asia Plus Middle east and American is among the list of
individuals and companies that your unpaid funds has been located to the
CITY BANK LONDON, UNITED KINGDOM. Your email appeared among the
beneficiaries, who will receive a part-payment of your contractual sum and
has been approved already for months now. You are requested to get back to
us for more directions and instructions on how to receive your fund.
However, we received an email from one Mr. Robert Dean Randolph who told us
that he is your next of kin and that you died in a car accident last week.
He has also submitted his account for us to transfer the fund to him
including his International passport.

We want to hear from you before we can make the transfer to confirm if you
are dead or not. Please in confirmation that you are still alive, you are
advised to reconfirm the below listed information to enable us facilitate
an immediate payment for you.

1 Your full name
2 Your present contact address.
3 Your telephone & Fax numbers.
4 Your Occupations/age/sex.
5 Your Private Email Address.


Once again, We apologize to you on behalf Of IMF (International Monetary
Fund) for the delays on paying your funds, which according to records in
the system had been long overdue. You can contact the IMF
director/chairperson Ms. Kristalina Georgieva on her E-mail:(
kristalina.georgieva@outlook.com).

Sincerely,
Kristalina Georgieva
Chairperson/Director IMF,
www.imf.org.
Phone#:+1

--000000000000b3828806366cb6b5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">INTERNATIONAL MONETARY FUND {IMF} OFFICE<br>IMF Headquarte=
rs. 700 19th Street, N.W,<br>In Affiliation with West African Economic<br>a=
nd the Monetary Union (WAEMU).<br>Website:<a href=3D"http://www.imf.org">ww=
w.imf.org</a>.<br>C/O Kristalina Georgieva<br><a href=3D"mailto:E-mail%3Akr=
istalina.georgieva@outlook.com">E-mail:kristalina.georgieva@outlook.com</a>=
<br><br><br>Attention Beneficiary,<br>Your Long overdue Payment Is Ready.<b=
r><br>It came to our notice today that your long overdue unpaid contracts i=
nheritance funds, next of kin and lotto benefits that was originated from A=
frica, Europe, Asia Plus Middle east and American is among the list of indi=
viduals and companies that your unpaid funds has been located to the CITY B=
ANK LONDON, UNITED KINGDOM. Your email appeared among the beneficiaries, wh=
o will receive a part-payment of your contractual sum and has been approved=
 already for months now. You are requested to get back to us for more direc=
tions and instructions on how to receive your fund. However, we received an=
 email from one Mr. Robert Dean Randolph who told us that he is your next o=
f kin and that you died in a car accident last week. He has also submitted =
his account for us to transfer the fund to him including his International =
passport.<br><br>We want to hear from you before we can make the transfer t=
o confirm if you are dead or not. Please in confirmation that you are still=
 alive, you are advised to reconfirm the below listed information to enable=
 us facilitate an immediate payment for you.<br><br>1 Your full name<br>2 Y=
our present contact address.<br>3 Your telephone &amp; Fax numbers.<br>4 Yo=
ur Occupations/age/sex.<br>5 Your Private Email Address.<br><br><br>Once ag=
ain, We apologize to you on behalf Of IMF (International Monetary Fund) for=
 the delays on paying your funds, which according to records in the system =
had been long overdue. You can contact the IMF director/chairperson Ms. Kri=
stalina Georgieva on her E-mail:(<a href=3D"mailto:kristalina.georgieva@out=
look.com">kristalina.georgieva@outlook.com</a>).<br><br>Sincerely,<br>Krist=
alina Georgieva<br>Chairperson/Director IMF,<br><a href=3D"http://www.imf.o=
rg">www.imf.org</a>.<br>Phone#:+1<br></div>

--000000000000b3828806366cb6b5--
