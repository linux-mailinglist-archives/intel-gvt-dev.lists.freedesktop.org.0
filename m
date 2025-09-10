Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD71B50A5A
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 10 Sep 2025 03:40:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18BBA10E117;
	Wed, 10 Sep 2025 01:40:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CtmDFUyM";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3352310E29A
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 10 Sep 2025 01:40:17 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-71d60110772so55910057b3.0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 09 Sep 2025 18:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757468416; x=1758073216; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E1MDhODWhsMeXaI17vji2GdK4JETFLD6slC5k+oU09I=;
 b=CtmDFUyM6y0iKikRUjcCFMyasC5pYivPLtwWR0FjndmA1Q+RxBuvzbb3/R9AgBliEY
 iRaRlOUZLCu0lyKkEJHv7AfkCOj5uvcfczJlxemdctvu9zkG3pzUL3FfD1hWLsh/fodK
 z3BPje9CwPZnmUTlboFaEFqNJ6gcGIx6BVHhmxchkXvV/di3nM/avX29/7dsNyxkXGTM
 gdO6ED6tOhiylPiEofgb7/N/Ym8826ILc0O4FhpE5hkGzasNnx5LLPoS6iCdvVy2wJeQ
 aHWv/wqWLJMF20XaCYutTmi3n63HKVnuc84Y3GVkaUhAzWbuIwIOUgt8SKQlSjmLuoZ4
 70Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757468416; x=1758073216;
 h=to:subject:message-id:date:from:reply-to:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=E1MDhODWhsMeXaI17vji2GdK4JETFLD6slC5k+oU09I=;
 b=hCIAjP2SxhMzsrzUOIn8Im+6JAbj1K11uerIqd8TOLxxAbI71/WaNz7EMnEw93AZJv
 tGIHK8SfEMJGJBwdhy11JS2MT+Bde7ZvXb8J8Zp76Dfgs0mFxzf2+7jxNdoouu719pv1
 2Gy6cxrkS//UtGE1ZjSGxtyzPxlTMgghcn8rKZyxLsdAF4JkLwC68oJyqxrddand6meo
 d5jsOnT9BtZ+cxqmJY4udcE1WnqXnqO/6u12+Y3W1liadDb/K6nz1JEQaW6l/nkMcj48
 gVTK/xIY8qCJGfxIRnBj+EvFRnDkBYndRK6XOz/eeJHCOKOVez4gjVdyRRAhhEJe4AH7
 gD7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtr+2dG7i5HXQH4ShCPkuBgkYoLd4qbX6q2lAVGCN74jvucsrq12dDV0b8VfONP5ZmH/SQ4Ci1y4k6aw3F@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJqwIxyriObVBN+JePbi+RUnDQCJ+LWOotDyf7Sd+G2tUHnHW+
 udgTbPjmxnUgCgf4XVTqNGQw1CeaOAqp9pgkbDznKwRMqC4l9yUZhKrzK8JrmifBzVIgqixQ7LM
 TNfb0nVKzI6CoJJDf1lr2mMIKnw+rjFI=
X-Gm-Gg: ASbGnctQg175iJ/shrAonYjDC0ZF8IQE29fCtC3nNvbslnSpksv6rzfFkJTkHr9AnF6
 +sQaH9O+9Et/eBWe6QPLqlpKARXiiWVrQImFo1LeEnuyQhVpHpdwAKovhbkyuNMC0ABuJaAvo/G
 m9Ah8wgRahLF1dN++1WMT5yGeWl0Ay6e83qQiWvFlvanyk09+DtHjhpA9ePonB2JRHyamPWxwKB
 BQwo1n/MmgZ8JgMd/WkRqjQTPyxxzAB5poZ9sCC1D6aYHWXeYi5
X-Google-Smtp-Source: AGHT+IFnYrYwS4zeMVu12l8LV7QkXlxq3559ghaQx1fC8vI0dIlDY0Pmn4vVtVanIWMC3Jbq3auTvxqVy3lj4nYTgUc=
X-Received: by 2002:a05:690c:4b89:b0:72c:54a3:f05c with SMTP id
 00721157ae682-72c54a464e0mr44614287b3.19.1757468415979; Tue, 09 Sep 2025
 18:40:15 -0700 (PDT)
MIME-Version: 1.0
From: Alex Donkor <kofi.colins82@gmail.com>
Date: Wed, 10 Sep 2025 01:40:02 +0000
X-Gm-Features: Ac12FXyK6-fxxxcsqysflUhL9WzF-qw2T4BDtt1jS4HjQ0rkzjNVYFcdJnwHrZk
Message-ID: <CAAUY6d2KQ=L7bQiSxrSr891b4BHkGM=31HSXhrwCfG1uQPKa-A@mail.gmail.com>
Subject: From Alex
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="000000000000a3775c063e68809a"
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
Reply-To: a0101d@yahoo.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--000000000000a3775c063e68809a
Content-Type: text/plain; charset="UTF-8"

-- 
Hello Dear,

Compliment of the day to you, I know you will be surprise to receive this
email from me because we never met before. I am Mr. Alexander Donkor  a
banker by profession from West African Agricultural Development bank Ghana
(ADB) here in West Africa and am currently holding the post of the Bank
(Chief Audit Unit) in ECOWAS STATE. I am sending this brief letter to
solicit your partnership to transfer (US$11,200,000) into your bank
account. I shall send you more information and procedures when I receive a
positive response from you and for your information 40% of the above
mentioned amount will be for you if you agree to help me execute this
business also 10% will be for your expense you will make in this
transaction and 50% is for me. please kindly reply by confirming your
interest of partnership with me.

Best Regard
Mr.Alexander

--000000000000a3775c063e68809a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div><br clear=3D"all"></div><div><br></d=
iv><span class=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" cl=
ass=3D"gmail_signature" data-smartmail=3D"gmail_signature">Hello Dear,<br><=
br>Compliment of the day to you, I know you will be surprise to receive thi=
s email from me because we never met before. I am Mr. Alexander Donkor=C2=
=A0 a banker by profession from West African Agricultural Development bank =
Ghana=C2=A0 (ADB) here in West Africa and am currently holding the post of =
the Bank (Chief Audit Unit) in ECOWAS STATE. I am sending this brief letter=
 to solicit your partnership to transfer (US$11,200,000) into your bank acc=
ount. I shall send you more information and procedures when I receive a pos=
itive response from you and for your information 40% of the above mentioned=
 amount will be for you if you agree to help me execute this business also =
10% will be for your expense you will make in this transaction and 50% is f=
or me. please kindly reply by confirming your interest of partnership with =
me.<br><br>Best Regard<br>Mr.Alexander</div></div>
</div>

--000000000000a3775c063e68809a--
