Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 676768ABCF1
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 20 Apr 2024 21:48:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FC4310E04E;
	Sat, 20 Apr 2024 19:48:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WNo0HFK0";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F39FB10E1AA
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 20 Apr 2024 19:48:04 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-2a2d0ca3c92so2172756a91.0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 20 Apr 2024 12:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713642484; x=1714247284; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kejCvSPY3VA90fBG/N0Pmqi7hPo5iS6uphdLc7rhFRA=;
 b=WNo0HFK04r3+0sGnZQD1uidrvSFJpZrInzqNE7mUKHRJGONaFQRXxuLb0VdAlclI7M
 XhsxLBNocHMT7HPVymG3ZrjFEED0fLYlbhpJBezeqOLOGZC3vA8OuXak8y3Lp9p/6lul
 AlLptt2+lsmNYEs34FHAMjcXXiiUsT9k3DWACNE377FlQpBAVjpcRu848O/77vxFs/mO
 /QJ/8oxMcKk6f87X09TYZ/kxQ1cuhUrqgL9J1zWuiVzoWdg9Lvv7qAjwflh7pelGK8GK
 zi1ZfpqzcVAEYxnDatEIH6cXqR8EDBvI0phJFYK+wanCJeZ3JWyquGi4OVv956+yhUDu
 PaFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713642484; x=1714247284;
 h=to:subject:message-id:date:from:reply-to:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kejCvSPY3VA90fBG/N0Pmqi7hPo5iS6uphdLc7rhFRA=;
 b=uBIv/FMVMJKV9nOZcHHxDhWpTV/yUv3pjSDvoiApiv0IIBaFsUNrokV3sQkMTEUoBW
 Ffn5b9lxkK8rEBvNwvC0zJsMtygQ2zEZGrUJSQA5Jv0IW4E4f2vTkpbKGe7T0oIJFM1T
 boMpUx/GXhC9Z1mWNam+wDA+L2pGnriPXrB1Ecvbt//v3P00GCmD0nVbve6nfM4y9Ezm
 RJZz8hGgJ7ltrxbSWgENsKs1M9WcwryAqWDWLaZ2ykbGBWnXacGGAfn1Uq7xxjU9aJ/i
 4AdLpvolFeWnvpUScCkb1tNXzjrH/SmtS/+oZyOEEs/bDmp0aJgx+KXAqm8z/0MnUUtz
 OPzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUq0KzX0IGTvqWZpS68fSNzbJoOt4zkVQM+vSmkX8vD3kGcnIg0GuSTAYSzwZzZH3bmK8vBiQwpTbHPdxb/uafinvgWduvh/Yk6GujzuiW2J5MG0A==
X-Gm-Message-State: AOJu0Yw+LXlTKXXj9JkDrdKYOhQfdEVXYbsFmByxARJYuBNbu96xBVwl
 iWy2X6piIJMBtPGd6peT1uBrMY+uh9OTZuqSApVick9wzrG7agIkr2R4opJ4PdO5kfNe2ESNUxQ
 60+wN+VGQx5tWWARSCcF0DDHBz/c=
X-Google-Smtp-Source: AGHT+IF0GFxZMDTCxlanl1e8HL7xCSqDoCQwgwpOSFlCKvGQKuwksD1n2A69QXA7CCx+/MA5agWzJlgRBFe9668uGrU=
X-Received: by 2002:a17:90a:b00c:b0:2ab:5348:67b7 with SMTP id
 x12-20020a17090ab00c00b002ab534867b7mr12612352pjq.22.1713642484114; Sat, 20
 Apr 2024 12:48:04 -0700 (PDT)
MIME-Version: 1.0
From: Sara Gadon <mrsmeijerink@gmail.com>
Date: Sat, 20 Apr 2024 14:47:53 -0500
Message-ID: <CALciwBLBf8BJNwVdJzLs96r_Eiex84=_kCgq=G0K+9YbqfRp5w@mail.gmail.com>
Subject: Hello
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="00000000000089b2d106168c7bdd"
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
Reply-To: sarameijerink2@mail.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--00000000000089b2d106168c7bdd
Content-Type: text/plain; charset="UTF-8"

Hello
I am Mrs Sara Meijerink and I am the wife of Late Mr. Meijerink. My late
husband bequeathed me 15,000,000.00 GBP for the Development of Charitable
Foundation. Before my late husband died in the hospital, he told me to use
this fund to establish a Charitable Foundation. Due to my present health
condition, I will not be able to handle this project. Please I want to
donate 15,000,000.00 GBP to you so that you will set up a Charitable
Foundation in your country. My late husband had a special interest in a
Charitable work before he died and he planned to make a difference in the
lives of the vulnerable people, orphanages, widows, and other people that
are in need. I promise that you would not regret handling this fund in a
charitable purpose in your country. I want to assure you that everything is
genuine and legal. My late husband acquired this money legally through oil
and gas business and he deposited the money in a bank in the United
Kingdom. Please I want you to establish this charitable project to make a
difference in the lives of the vulnerable people, orphanages, widows, and
other people that are in need in your country. I have been suffering from
cancer since my husband died and I will not be able to handle this
charitable project. I would like you to establish this Charitable
Foundation in your country. I am a widow and I have no children to inherit
this money. I'm just alone in this world and my health is currently very
bad. You are the only person I have contacted for this purpose. Therefore
you are all I have now. Please I want you to secure this money into your
account and use it for the charitable Foundation in your country.

I am currently hospitalized in a cancer hospital because of my ill health.
A few months after my husband's death, my husband's relatives sold all my
late husband's property including my late husband's Oil and Gas business
and abandoned me in the hospital. This is because in our tradition, when a
man dies without a male child, all his properties and investments would be
shared among his male relatives. Even if the man has a wife or daughters,
nobody wants to know. That's why before my husband died, he deposited this
15,000,000.00 GBP in a bank in the United Kingdom so that if something
happened to him, I could use the money to establish the Charitable
Foundation to make a difference in the lives of the vulnerable people,
orphanages, widows, and other people that are in need. My late husband had
a special love for charity.

I am very ill and my doctor told me that I would not last more than two
months because I have no more chances of surviving the cancer. But I want
to make sure that the money is transferred to your account before anything
happens to me. Please I want you to take this project very seriously so
that the bank can transfer the money to your account. Please believe me,
once you agree to handle this charitable project, the bank will transfer
this money to your account without delay. Moreover, the CEO of the bank
assured me that once I have someone who is honest and willing to receive
this money, they will initiate all procedures to release and transfer the
money into the person's bank account.

Please, if you are willing to do this charitable project in your country,
quickly assure me that you are interested so that I can introduce you to
the CEO of the bank in the United Kingdom. As soon as I receive your reply,
I will send you the necessary documents about the money and the contact
details of the CEO of the bank in the United Kingdom so that they can
transfer the money to your account.

Please, I need your quick response.

Thank you
Mrs. Sara Meijerink

--00000000000089b2d106168c7bdd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_sig=
nature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div>Hello<br>I=
 am Mrs Sara Meijerink and I am the wife of Late Mr. Meijerink. My late hus=
band bequeathed me 15,000,000.00 GBP for the Development of Charitable Foun=
dation. Before my late husband died in the hospital, he told me to use this=
=C2=A0fund=C2=A0to establish a Charitable Foundation. Due to my present hea=
lth condition, I will not be able to handle this project. Please I want to =
donate 15,000,000.00 GBP to you so that you will set up a Charitable Founda=
tion in your country. My late husband had a special interest in a Charitabl=
e work before he died and he planned to make a difference in the lives of t=
he vulnerable people, orphanages, widows, and other people that are in need=
. I promise that you would not regret handling this fund in a charitable pu=
rpose in=C2=A0your country. I want to assure you that everything is genuine=
 and legal. My late husband acquired this money legally through oil and gas=
 business and he deposited the money in a bank in the United Kingdom. Pleas=
e I want you to establish this charitable project to make a difference in t=
he lives of the vulnerable people, orphanages, widows, and other people tha=
t are in need in your country. I have been suffering from cancer since my h=
usband died and I will not be able to handle this charitable project.=C2=A0=
I would like you to establish this=C2=A0Charitable Foundation in your count=
ry. I am a widow=C2=A0and I have no children to inherit this money. I&#39;m=
 just alone in this world and my health is currently very bad. You are the =
only person I have contacted for this purpose. Therefore you are all I have=
 now. Please I want you to secure this money into your account and use it f=
or the charitable Foundation in your country.</div><div><br></div><div>I am=
 currently hospitalized in a cancer hospital because of my ill health. A fe=
w months after my husband&#39;s death, my husband&#39;s relatives sold all =
my late husband&#39;s property including my late husband&#39;s Oil and Gas =
business and abandoned me in the hospital. This is because in our tradition=
, when a man dies without a male child, all his properties and investments =
would be shared among his male relatives. Even if the man has a wife or dau=
ghters, nobody wants to know. That&#39;s why before my husband died, he dep=
osited this 15,000,000.00 GBP in a bank in the United Kingdom so that if so=
mething happened to him, I could use the money to establish the Charitable =
Foundation to make a difference in the lives of the vulnerable people, orph=
anages, widows, and other people that are in need. My late husband had a sp=
ecial love for charity.</div><div><br></div><div>I am very ill and my docto=
r told me that I would not last more than two months=C2=A0because I have no=
 more chances of surviving the cancer. But I want to make sure that the mon=
ey is transferred to your account before anything happens to me. Please=C2=
=A0I want you to take this project very seriously=C2=A0so that the bank can=
 transfer the money to your account. Please believe me, once you agree to h=
andle this charitable project, the bank will transfer this money to your ac=
count without delay. Moreover, the CEO of the bank assured me that once I h=
ave someone who is honest and willing to receive this money, they will init=
iate all procedures to release and transfer the money into the person&#39;s=
 bank account.</div><div><br></div><div>Please, if you are willing to do th=
is charitable project in your country, quickly assure me that you are inter=
ested so that I can introduce you to the CEO of the bank in the United King=
dom. As soon as I receive your reply, I will send you=C2=A0the necessary do=
cuments about the money and the contact details of the CEO of the bank in t=
he United Kingdom=C2=A0so that they can transfer the money to your account.=
</div><div><br></div><div>Please, I need your quick response.</div><div><br=
></div><div>Thank you<br>Mrs. Sara Meijerink</div></div></div></div></div>

--00000000000089b2d106168c7bdd--
