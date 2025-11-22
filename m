Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6BBC7C974
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 22 Nov 2025 08:29:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC03B10E009;
	Sat, 22 Nov 2025 07:29:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=noun-edu-ng.20230601.gappssmtp.com header.i=@noun-edu-ng.20230601.gappssmtp.com header.b="LY5b3jAG";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C93310E0F3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 22 Nov 2025 07:29:19 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-64074f01a6eso4856997a12.2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 21 Nov 2025 23:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=noun-edu-ng.20230601.gappssmtp.com; s=20230601; t=1763796557; x=1764401357;
 darn=lists.freedesktop.org; 
 h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7agCxPROh0g0TZ6auGHIUxykmZpdYwVoZ6a77movecM=;
 b=LY5b3jAGHMzfAsFNcp+CsJYeTkGCgpDOMwZjJqIFx7KhGjn82JXSBQCyltRuYcNjVM
 vWKlimU+w0CWIGWpNPCcEnS5n3SvIVrcnVhhFJduY94vTB6k2T27LMkYhUhl8XdSbEWI
 MCWeyD4Os12AF7n1/IZUjGU0E3boHS3gQ1yAEAo1gWR50jbXmkaEpWLs8bQvVfSFE2kQ
 T9xqR56blwnmO/rg5T4SgIHP75XRHwlJ+fv+03tho/ft/9z8yaejWsJzg/jTGazhr5bE
 wCGrhnnqL+68mPtD8h9hLduvwy6ahQT1a6HBVm+r2E1hOQkoT0578bR+RZKjDBZ86YR+
 coWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763796557; x=1764401357;
 h=to:subject:message-id:date:from:reply-to:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7agCxPROh0g0TZ6auGHIUxykmZpdYwVoZ6a77movecM=;
 b=cnrmrtPQMngW2kqQdvQ/NBJkSMzWdkw0gHdD1sE8y+E2vyP7rM5VlRwfkKOE/eNP8M
 hQljW+x+n+DW2rrTY7edY1LUrokTxOPGEIuv4KkJYJKcOXZl0/oI6hw8LyYk0erjgXbT
 bHBzL3nLECEQPjsUiQwn+GdXta5vqeZ3RgzfoPyUEZiNWEJo4SUcchstbczjAwDY/0kl
 ney4QU0GwQN77cFiecSYp7LL3UFCTvmqgy4lO49Vu3LfgT40/9hBNJTemoCzjxWLTVWv
 ZFjssBKveumgtLpb06smM7N/3fyCEWwyeZnN5jwiO+aBm4FvCpcifvZNfBD8PvgZoDf5
 hhtg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPhdjaXakUEufd030fWSZRI2SlWuZ9Ifk9EJmcuhvU7naiOt3ZqPoCOi+s71dzlChdpgIMIH2R1tO4u6Mb@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzWEIy/OoLDej3FvADTuL54VajGvkiB5QhbVQyb9NBVpHMc+M46
 tR5qRjg3S24ygwizI+Y1fyuSXPfqP2adW7m3j08BhKoLvjkZQfkUicWEfjvBhSyACFpr+Zp7WGd
 DgaK6611KyXqvsKpsjqSlwGfOBLvn310Or9PJyXmbIw==
X-Gm-Gg: ASbGncvnMISepgbbAcCpvbFUx7yix0eDlH/CpVLGUyfAnNcZ4WvikJmYx/Axkkqp9oW
 vvTRIJz5RfGlbhZHfyshfUNRjMw7oxVb55Qe0C9A7L1AnigIXSmapkk1HSUwpgNnqLAE8qObhLX
 1nWugkwUVnbOucwx+NB6I2O1xa/cMKn/njO6O5DFtI17wRQUlimqka1yA9j94vEQzPSXEat1Dk5
 rh/7eVr5H5PgdGotr78VF5ANjCjkIl35EXXoaMSTzztUpHYwTXl82VJx7dNF7b2wV7mVpSlyTXq
 kQShRTCdMcpNYlmIDPDlA4Y3kqzJ+X4vgI0=
X-Google-Smtp-Source: AGHT+IH8xoHo2fTxJexUFGunGHQUUhgDSSHnDFtWe2qHgssMOwsZuqaiI9CgM/uZVXbcYveolBYl3xxUKtYZa+5EFoM=
X-Received: by 2002:a17:907:d05:b0:b73:6b24:14b5 with SMTP id
 a640c23a62f3a-b7671a47bafmr574204366b.31.1763796556991; Fri, 21 Nov 2025
 23:29:16 -0800 (PST)
MIME-Version: 1.0
From: Mr William Melody <nou251202298@noun.edu.ng>
Date: Fri, 21 Nov 2025 23:29:02 -0800
X-Gm-Features: AWmQ_bm40s0X1AVtPqPboRvGijPVhhMwidPf_Eol5NmqlurmyDagVLYv46lKuPI
Message-ID: <CAKQtBhTahN=OiEPqMmdcFMBgng2ZrEQgcUYH5bjgSeMUPuL+hQ@mail.gmail.com>
Subject: Greetings
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="0000000000003c5d61064429e306"
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
Reply-To: mrwilliammelody@yandex.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--0000000000003c5d61064429e306
Content-Type: text/plain; charset="UTF-8"

Hello Dear,

My name is Mr. Williams Melody , I work with the African development bank
ADB as bank director, Your personality motivated me after going through
your profile and I decided to contact you for this business proposal that
will benefit both of us in the end. Actually, I am here searching for a
person of honor I can trust and use for the claims, this transaction
proposal is an inheritance claim which I want you to act as the next of kin
to the late Mr.Garry Kirstenfeldt..

Mr.Garry Kirstenfeldt., Died of corona-virus disease (COVID-19) on 2nd
March 2020, at the age of 71 years and left a deposit of 4.5 ,Million USD
in his account with this firm and since after his death no one has come for
the claim of this fund. Recently, the bank board of directors ordered his
special account officer who managed his account in this bank, to provide
his next of kin for the release of his deposit since he operated a coded
account with the bank financial department and has no specific mentioned
next of kin in his security file jacket with the bank.

I will share the proceeds on the percentage ration which I know would be
pleased by you. Upon a successful transaction which I'm highly optimistic
about, you are entitled to 40% while 50% would be for mine and 10% will be
set aside for any expenses that we might have incurred in the process. I
will furnish you with the information as it will interest you in detail
upon your satisfactory reply.

Best regards,
Mr. Williams Melody

--0000000000003c5d61064429e306
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail-msg-body gmail-P_wpofO gmail-mq_AS"><d=
iv class=3D"gmail-jb_0 gmail-X_6MGW gmail-N_6Fd5"><div><div id=3D"gmail-yiv=
2354686438"><div dir=3D"ltr"><div class=3D"gmail-yiv2354686438gmail-msg-bod=
y gmail-yiv2354686438gmail-P_wpofO gmail-yiv2354686438gmail-mq_AS"><div cla=
ss=3D"gmail-yiv2354686438gmail-jb_0 gmail-yiv2354686438gmail-X_6MGW gmail-y=
iv2354686438gmail-N_6Fd5"><div><div id=3D"gmail-yiv2354686438gmail-yiv04909=
85615"><div dir=3D"ltr"><div class=3D"gmail-yiv2354686438gmail-yiv049098561=
5gmail-msg-body gmail-yiv2354686438gmail-yiv0490985615gmail-P_wpofO gmail-y=
iv2354686438gmail-yiv0490985615gmail-mq_AS"><div class=3D"gmail-yiv23546864=
38gmail-yiv0490985615gmail-jb_0 gmail-yiv2354686438gmail-yiv0490985615gmail=
-X_6MGW gmail-yiv2354686438gmail-yiv0490985615gmail-N_6Fd5"><div><div id=3D=
"gmail-yiv2354686438gmail-yiv0490985615gmail-yiv9460717586"><div dir=3D"ltr=
"><div class=3D"gmail-yiv2354686438gmail-yiv0490985615gmail-yiv9460717586gm=
ail-msg-body gmail-yiv2354686438gmail-yiv0490985615gmail-yiv9460717586gmail=
-P_wpofO gmail-yiv2354686438gmail-yiv0490985615gmail-yiv9460717586gmail-mq_=
AS"><div class=3D"gmail-yiv2354686438gmail-yiv0490985615gmail-yiv9460717586=
gmail-jb_0 gmail-yiv2354686438gmail-yiv0490985615gmail-yiv9460717586gmail-X=
_6MGW gmail-yiv2354686438gmail-yiv0490985615gmail-yiv9460717586gmail-N_6Fd5=
"><div><div id=3D"gmail-yiv2354686438gmail-yiv0490985615gmail-yiv9460717586=
gmail-yiv4804822511"><div dir=3D"ltr"><div class=3D"gmail-yiv2354686438gmai=
l-yiv0490985615gmail-yiv9460717586gmail-yiv4804822511gmail-msg-body gmail-y=
iv2354686438gmail-yiv0490985615gmail-yiv9460717586gmail-yiv4804822511gmail-=
P_wpofO gmail-yiv2354686438gmail-yiv0490985615gmail-yiv9460717586gmail-yiv4=
804822511gmail-mq_AS"><div class=3D"gmail-yiv2354686438gmail-yiv0490985615g=
mail-yiv9460717586gmail-yiv4804822511gmail-jb_0 gmail-yiv2354686438gmail-yi=
v0490985615gmail-yiv9460717586gmail-yiv4804822511gmail-X_6MGW gmail-yiv2354=
686438gmail-yiv0490985615gmail-yiv9460717586gmail-yiv4804822511gmail-N_6Fd5=
"><div><div id=3D"gmail-yiv2354686438gmail-yiv0490985615gmail-yiv9460717586=
gmail-yiv4804822511gmail-yiv1240240571"><div dir=3D"ltr"><div class=3D"gmai=
l-yiv2354686438gmail-yiv0490985615gmail-yiv9460717586gmail-yiv4804822511gma=
il-yiv1240240571gmail-msg-body gmail-yiv2354686438gmail-yiv0490985615gmail-=
yiv9460717586gmail-yiv4804822511gmail-yiv1240240571gmail-P_wpofO gmail-yiv2=
354686438gmail-yiv0490985615gmail-yiv9460717586gmail-yiv4804822511gmail-yiv=
1240240571gmail-mq_AS"><div class=3D"gmail-yiv2354686438gmail-yiv0490985615=
gmail-yiv9460717586gmail-yiv4804822511gmail-yiv1240240571gmail-jb_0 gmail-y=
iv2354686438gmail-yiv0490985615gmail-yiv9460717586gmail-yiv4804822511gmail-=
yiv1240240571gmail-X_6MGW gmail-yiv2354686438gmail-yiv0490985615gmail-yiv94=
60717586gmail-yiv4804822511gmail-yiv1240240571gmail-N_6Fd5"><div><div id=3D=
"gmail-yiv2354686438gmail-yiv0490985615gmail-yiv9460717586gmail-yiv48048225=
11gmail-yiv1240240571gmail-yiv6304392045"><div dir=3D"ltr"><div class=3D"gm=
ail-yiv2354686438gmail-yiv0490985615gmail-yiv9460717586gmail-yiv4804822511g=
mail-yiv1240240571gmail-yiv6304392045gmail-msg-body gmail-yiv2354686438gmai=
l-yiv0490985615gmail-yiv9460717586gmail-yiv4804822511gmail-yiv1240240571gma=
il-yiv6304392045gmail-P_wpofO gmail-yiv2354686438gmail-yiv0490985615gmail-y=
iv9460717586gmail-yiv4804822511gmail-yiv1240240571gmail-yiv6304392045gmail-=
mq_AS"><div class=3D"gmail-yiv2354686438gmail-yiv0490985615gmail-yiv9460717=
586gmail-yiv4804822511gmail-yiv1240240571gmail-yiv6304392045gmail-jb_0 gmai=
l-yiv2354686438gmail-yiv0490985615gmail-yiv9460717586gmail-yiv4804822511gma=
il-yiv1240240571gmail-yiv6304392045gmail-X_6MGW gmail-yiv2354686438gmail-yi=
v0490985615gmail-yiv9460717586gmail-yiv4804822511gmail-yiv1240240571gmail-y=
iv6304392045gmail-N_6Fd5"><div><div id=3D"gmail-yiv2354686438gmail-yiv04909=
85615gmail-yiv9460717586gmail-yiv4804822511gmail-yiv1240240571gmail-yiv6304=
392045gmail-yiv4717448940"><div dir=3D"ltr"><div class=3D"gmail-yiv23546864=
38gmail-yiv0490985615gmail-yiv9460717586gmail-yiv4804822511gmail-yiv1240240=
571gmail-yiv6304392045gmail-yiv4717448940gmail-msg-body gmail-yiv2354686438=
gmail-yiv0490985615gmail-yiv9460717586gmail-yiv4804822511gmail-yiv124024057=
1gmail-yiv6304392045gmail-yiv4717448940gmail-P_wpofO gmail-yiv2354686438gma=
il-yiv0490985615gmail-yiv9460717586gmail-yiv4804822511gmail-yiv1240240571gm=
ail-yiv6304392045gmail-yiv4717448940gmail-mq_AS"><div class=3D"gmail-yiv235=
4686438gmail-yiv0490985615gmail-yiv9460717586gmail-yiv4804822511gmail-yiv12=
40240571gmail-yiv6304392045gmail-yiv4717448940gmail-jb_0 gmail-yiv235468643=
8gmail-yiv0490985615gmail-yiv9460717586gmail-yiv4804822511gmail-yiv12402405=
71gmail-yiv6304392045gmail-yiv4717448940gmail-X_6MGW gmail-yiv2354686438gma=
il-yiv0490985615gmail-yiv9460717586gmail-yiv4804822511gmail-yiv1240240571gm=
ail-yiv6304392045gmail-yiv4717448940gmail-N_6Fd5"><div><div id=3D"gmail-yiv=
2354686438gmail-yiv0490985615gmail-yiv9460717586gmail-yiv4804822511gmail-yi=
v1240240571gmail-yiv6304392045gmail-yiv4717448940gmail-yiv3640381119"><div =
dir=3D"ltr"><div class=3D"gmail-yiv2354686438gmail-yiv0490985615gmail-yiv94=
60717586gmail-yiv4804822511gmail-yiv1240240571gmail-yiv6304392045gmail-yiv4=
717448940gmail-yiv3640381119gmail-msg-body gmail-yiv2354686438gmail-yiv0490=
985615gmail-yiv9460717586gmail-yiv4804822511gmail-yiv1240240571gmail-yiv630=
4392045gmail-yiv4717448940gmail-yiv3640381119gmail-P_wpofO gmail-yiv2354686=
438gmail-yiv0490985615gmail-yiv9460717586gmail-yiv4804822511gmail-yiv124024=
0571gmail-yiv6304392045gmail-yiv4717448940gmail-yiv3640381119gmail-mq_AS"><=
div class=3D"gmail-yiv2354686438gmail-yiv0490985615gmail-yiv9460717586gmail=
-yiv4804822511gmail-yiv1240240571gmail-yiv6304392045gmail-yiv4717448940gmai=
l-yiv3640381119gmail-jb_0 gmail-yiv2354686438gmail-yiv0490985615gmail-yiv94=
60717586gmail-yiv4804822511gmail-yiv1240240571gmail-yiv6304392045gmail-yiv4=
717448940gmail-yiv3640381119gmail-X_6MGW gmail-yiv2354686438gmail-yiv049098=
5615gmail-yiv9460717586gmail-yiv4804822511gmail-yiv1240240571gmail-yiv63043=
92045gmail-yiv4717448940gmail-yiv3640381119gmail-N_6Fd5"><div><div id=3D"gm=
ail-yiv2354686438gmail-yiv0490985615gmail-yiv9460717586gmail-yiv4804822511g=
mail-yiv1240240571gmail-yiv6304392045gmail-yiv4717448940gmail-yiv3640381119=
gmail-yiv6631855549"><div dir=3D"ltr"><div class=3D"gmail-yiv2354686438gmai=
l-yiv0490985615gmail-yiv9460717586gmail-yiv4804822511gmail-yiv1240240571gma=
il-yiv6304392045gmail-yiv4717448940gmail-yiv3640381119gmail-yiv6631855549gm=
ail-msg-body gmail-yiv2354686438gmail-yiv0490985615gmail-yiv9460717586gmail=
-yiv4804822511gmail-yiv1240240571gmail-yiv6304392045gmail-yiv4717448940gmai=
l-yiv3640381119gmail-yiv6631855549gmail-P_wpofO gmail-yiv2354686438gmail-yi=
v0490985615gmail-yiv9460717586gmail-yiv4804822511gmail-yiv1240240571gmail-y=
iv6304392045gmail-yiv4717448940gmail-yiv3640381119gmail-yiv6631855549gmail-=
mq_AS"><div class=3D"gmail-yiv2354686438gmail-yiv0490985615gmail-yiv9460717=
586gmail-yiv4804822511gmail-yiv1240240571gmail-yiv6304392045gmail-yiv471744=
8940gmail-yiv3640381119gmail-yiv6631855549gmail-jb_0 gmail-yiv2354686438gma=
il-yiv0490985615gmail-yiv9460717586gmail-yiv4804822511gmail-yiv1240240571gm=
ail-yiv6304392045gmail-yiv4717448940gmail-yiv3640381119gmail-yiv6631855549g=
mail-X_6MGW gmail-yiv2354686438gmail-yiv0490985615gmail-yiv9460717586gmail-=
yiv4804822511gmail-yiv1240240571gmail-yiv6304392045gmail-yiv4717448940gmail=
-yiv3640381119gmail-yiv6631855549gmail-N_6Fd5"><div><div id=3D"gmail-yiv235=
4686438gmail-yiv0490985615gmail-yiv9460717586gmail-yiv4804822511gmail-yiv12=
40240571gmail-yiv6304392045gmail-yiv4717448940gmail-yiv3640381119gmail-yiv6=
631855549gmail-yiv8846057614"><div dir=3D"ltr"><div class=3D"gmail-yiv23546=
86438gmail-yiv0490985615gmail-yiv9460717586gmail-yiv4804822511gmail-yiv1240=
240571gmail-yiv6304392045gmail-yiv4717448940gmail-yiv3640381119gmail-yiv663=
1855549gmail-yiv8846057614gmail-msg-body gmail-yiv2354686438gmail-yiv049098=
5615gmail-yiv9460717586gmail-yiv4804822511gmail-yiv1240240571gmail-yiv63043=
92045gmail-yiv4717448940gmail-yiv3640381119gmail-yiv6631855549gmail-yiv8846=
057614gmail-P_wpofO gmail-yiv2354686438gmail-yiv0490985615gmail-yiv94607175=
86gmail-yiv4804822511gmail-yiv1240240571gmail-yiv6304392045gmail-yiv4717448=
940gmail-yiv3640381119gmail-yiv6631855549gmail-yiv8846057614gmail-mq_AS"><d=
iv class=3D"gmail-yiv2354686438gmail-yiv0490985615gmail-yiv9460717586gmail-=
yiv4804822511gmail-yiv1240240571gmail-yiv6304392045gmail-yiv4717448940gmail=
-yiv3640381119gmail-yiv6631855549gmail-yiv8846057614gmail-jb_0 gmail-yiv235=
4686438gmail-yiv0490985615gmail-yiv9460717586gmail-yiv4804822511gmail-yiv12=
40240571gmail-yiv6304392045gmail-yiv4717448940gmail-yiv3640381119gmail-yiv6=
631855549gmail-yiv8846057614gmail-X_6MGW gmail-yiv2354686438gmail-yiv049098=
5615gmail-yiv9460717586gmail-yiv4804822511gmail-yiv1240240571gmail-yiv63043=
92045gmail-yiv4717448940gmail-yiv3640381119gmail-yiv6631855549gmail-yiv8846=
057614gmail-N_6Fd5"><div><div id=3D"gmail-yiv2354686438gmail-yiv0490985615g=
mail-yiv9460717586gmail-yiv4804822511gmail-yiv1240240571gmail-yiv6304392045=
gmail-yiv4717448940gmail-yiv3640381119gmail-yiv6631855549gmail-yiv884605761=
4gmail-yiv1502761765"><div dir=3D"ltr"><div class=3D"gmail-yiv2354686438gma=
il-yiv0490985615gmail-yiv9460717586gmail-yiv4804822511gmail-yiv1240240571gm=
ail-yiv6304392045gmail-yiv4717448940gmail-yiv3640381119gmail-yiv6631855549g=
mail-yiv8846057614gmail-yiv1502761765gmail-msg-body gmail-yiv2354686438gmai=
l-yiv0490985615gmail-yiv9460717586gmail-yiv4804822511gmail-yiv1240240571gma=
il-yiv6304392045gmail-yiv4717448940gmail-yiv3640381119gmail-yiv6631855549gm=
ail-yiv8846057614gmail-yiv1502761765gmail-P_wpofO gmail-yiv2354686438gmail-=
yiv0490985615gmail-yiv9460717586gmail-yiv4804822511gmail-yiv1240240571gmail=
-yiv6304392045gmail-yiv4717448940gmail-yiv3640381119gmail-yiv6631855549gmai=
l-yiv8846057614gmail-yiv1502761765gmail-mq_AS"><div class=3D"gmail-yiv23546=
86438gmail-yiv0490985615gmail-yiv9460717586gmail-yiv4804822511gmail-yiv1240=
240571gmail-yiv6304392045gmail-yiv4717448940gmail-yiv3640381119gmail-yiv663=
1855549gmail-yiv8846057614gmail-yiv1502761765gmail-jb_0 gmail-yiv2354686438=
gmail-yiv0490985615gmail-yiv9460717586gmail-yiv4804822511gmail-yiv124024057=
1gmail-yiv6304392045gmail-yiv4717448940gmail-yiv3640381119gmail-yiv66318555=
49gmail-yiv8846057614gmail-yiv1502761765gmail-X_6MGW gmail-yiv2354686438gma=
il-yiv0490985615gmail-yiv9460717586gmail-yiv4804822511gmail-yiv1240240571gm=
ail-yiv6304392045gmail-yiv4717448940gmail-yiv3640381119gmail-yiv6631855549g=
mail-yiv8846057614gmail-yiv1502761765gmail-N_6Fd5"><div><div id=3D"gmail-yi=
v2354686438gmail-yiv0490985615gmail-yiv9460717586gmail-yiv4804822511gmail-y=
iv1240240571gmail-yiv6304392045gmail-yiv4717448940gmail-yiv3640381119gmail-=
yiv6631855549gmail-yiv8846057614gmail-yiv1502761765gmail-yiv2011179358"><di=
v dir=3D"ltr"><div class=3D"gmail-yiv2354686438gmail-yiv0490985615gmail-yiv=
9460717586gmail-yiv4804822511gmail-yiv1240240571gmail-yiv6304392045gmail-yi=
v4717448940gmail-yiv3640381119gmail-yiv6631855549gmail-yiv8846057614gmail-y=
iv1502761765gmail-yiv2011179358gmail-msg-body gmail-yiv2354686438gmail-yiv0=
490985615gmail-yiv9460717586gmail-yiv4804822511gmail-yiv1240240571gmail-yiv=
6304392045gmail-yiv4717448940gmail-yiv3640381119gmail-yiv6631855549gmail-yi=
v8846057614gmail-yiv1502761765gmail-yiv2011179358gmail-P_wpofO gmail-yiv235=
4686438gmail-yiv0490985615gmail-yiv9460717586gmail-yiv4804822511gmail-yiv12=
40240571gmail-yiv6304392045gmail-yiv4717448940gmail-yiv3640381119gmail-yiv6=
631855549gmail-yiv8846057614gmail-yiv1502761765gmail-yiv2011179358gmail-mq_=
AS"><div class=3D"gmail-yiv2354686438gmail-yiv0490985615gmail-yiv9460717586=
gmail-yiv4804822511gmail-yiv1240240571gmail-yiv6304392045gmail-yiv471744894=
0gmail-yiv3640381119gmail-yiv6631855549gmail-yiv8846057614gmail-yiv15027617=
65gmail-yiv2011179358gmail-jb_0 gmail-yiv2354686438gmail-yiv0490985615gmail=
-yiv9460717586gmail-yiv4804822511gmail-yiv1240240571gmail-yiv6304392045gmai=
l-yiv4717448940gmail-yiv3640381119gmail-yiv6631855549gmail-yiv8846057614gma=
il-yiv1502761765gmail-yiv2011179358gmail-X_6MGW gmail-yiv2354686438gmail-yi=
v0490985615gmail-yiv9460717586gmail-yiv4804822511gmail-yiv1240240571gmail-y=
iv6304392045gmail-yiv4717448940gmail-yiv3640381119gmail-yiv6631855549gmail-=
yiv8846057614gmail-yiv1502761765gmail-yiv2011179358gmail-N_6Fd5"><div><div =
id=3D"gmail-yiv2354686438gmail-yiv0490985615gmail-yiv9460717586gmail-yiv480=
4822511gmail-yiv1240240571gmail-yiv6304392045gmail-yiv4717448940gmail-yiv36=
40381119gmail-yiv6631855549gmail-yiv8846057614gmail-yiv1502761765gmail-yiv2=
011179358gmail-yiv8982601502"><div dir=3D"ltr"><div class=3D"gmail-yiv23546=
86438gmail-yiv0490985615gmail-yiv9460717586gmail-yiv4804822511gmail-yiv1240=
240571gmail-yiv6304392045gmail-yiv4717448940gmail-yiv3640381119gmail-yiv663=
1855549gmail-yiv8846057614gmail-yiv1502761765gmail-yiv2011179358gmail-yiv89=
82601502gmail-msg-body gmail-yiv2354686438gmail-yiv0490985615gmail-yiv94607=
17586gmail-yiv4804822511gmail-yiv1240240571gmail-yiv6304392045gmail-yiv4717=
448940gmail-yiv3640381119gmail-yiv6631855549gmail-yiv8846057614gmail-yiv150=
2761765gmail-yiv2011179358gmail-yiv8982601502gmail-P_wpofO gmail-yiv2354686=
438gmail-yiv0490985615gmail-yiv9460717586gmail-yiv4804822511gmail-yiv124024=
0571gmail-yiv6304392045gmail-yiv4717448940gmail-yiv3640381119gmail-yiv66318=
55549gmail-yiv8846057614gmail-yiv1502761765gmail-yiv2011179358gmail-yiv8982=
601502gmail-mq_AS"><div class=3D"gmail-yiv2354686438gmail-yiv0490985615gmai=
l-yiv9460717586gmail-yiv4804822511gmail-yiv1240240571gmail-yiv6304392045gma=
il-yiv4717448940gmail-yiv3640381119gmail-yiv6631855549gmail-yiv8846057614gm=
ail-yiv1502761765gmail-yiv2011179358gmail-yiv8982601502gmail-jb_0 gmail-yiv=
2354686438gmail-yiv0490985615gmail-yiv9460717586gmail-yiv4804822511gmail-yi=
v1240240571gmail-yiv6304392045gmail-yiv4717448940gmail-yiv3640381119gmail-y=
iv6631855549gmail-yiv8846057614gmail-yiv1502761765gmail-yiv2011179358gmail-=
yiv8982601502gmail-X_6MGW gmail-yiv2354686438gmail-yiv0490985615gmail-yiv94=
60717586gmail-yiv4804822511gmail-yiv1240240571gmail-yiv6304392045gmail-yiv4=
717448940gmail-yiv3640381119gmail-yiv6631855549gmail-yiv8846057614gmail-yiv=
1502761765gmail-yiv2011179358gmail-yiv8982601502gmail-N_6Fd5"><div><div id=
=3D"gmail-yiv2354686438gmail-yiv0490985615gmail-yiv9460717586gmail-yiv48048=
22511gmail-yiv1240240571gmail-yiv6304392045gmail-yiv4717448940gmail-yiv3640=
381119gmail-yiv6631855549gmail-yiv8846057614gmail-yiv1502761765gmail-yiv201=
1179358gmail-yiv8982601502gmail-yiv3886875272"><div dir=3D"ltr"><div class=
=3D"gmail-yiv2354686438gmail-yiv0490985615gmail-yiv9460717586gmail-yiv48048=
22511gmail-yiv1240240571gmail-yiv6304392045gmail-yiv4717448940gmail-yiv3640=
381119gmail-yiv6631855549gmail-yiv8846057614gmail-yiv1502761765gmail-yiv201=
1179358gmail-yiv8982601502gmail-yiv3886875272gmail-msg-body gmail-yiv235468=
6438gmail-yiv0490985615gmail-yiv9460717586gmail-yiv4804822511gmail-yiv12402=
40571gmail-yiv6304392045gmail-yiv4717448940gmail-yiv3640381119gmail-yiv6631=
855549gmail-yiv8846057614gmail-yiv1502761765gmail-yiv2011179358gmail-yiv898=
2601502gmail-yiv3886875272gmail-P_wpofO gmail-yiv2354686438gmail-yiv0490985=
615gmail-yiv9460717586gmail-yiv4804822511gmail-yiv1240240571gmail-yiv630439=
2045gmail-yiv4717448940gmail-yiv3640381119gmail-yiv6631855549gmail-yiv88460=
57614gmail-yiv1502761765gmail-yiv2011179358gmail-yiv8982601502gmail-yiv3886=
875272gmail-mq_AS"><div class=3D"gmail-yiv2354686438gmail-yiv0490985615gmai=
l-yiv9460717586gmail-yiv4804822511gmail-yiv1240240571gmail-yiv6304392045gma=
il-yiv4717448940gmail-yiv3640381119gmail-yiv6631855549gmail-yiv8846057614gm=
ail-yiv1502761765gmail-yiv2011179358gmail-yiv8982601502gmail-yiv3886875272g=
mail-jb_0 gmail-yiv2354686438gmail-yiv0490985615gmail-yiv9460717586gmail-yi=
v4804822511gmail-yiv1240240571gmail-yiv6304392045gmail-yiv4717448940gmail-y=
iv3640381119gmail-yiv6631855549gmail-yiv8846057614gmail-yiv1502761765gmail-=
yiv2011179358gmail-yiv8982601502gmail-yiv3886875272gmail-X_6MGW gmail-yiv23=
54686438gmail-yiv0490985615gmail-yiv9460717586gmail-yiv4804822511gmail-yiv1=
240240571gmail-yiv6304392045gmail-yiv4717448940gmail-yiv3640381119gmail-yiv=
6631855549gmail-yiv8846057614gmail-yiv1502761765gmail-yiv2011179358gmail-yi=
v8982601502gmail-yiv3886875272gmail-N_6Fd5"><div><div id=3D"gmail-yiv235468=
6438gmail-yiv0490985615gmail-yiv9460717586gmail-yiv4804822511gmail-yiv12402=
40571gmail-yiv6304392045gmail-yiv4717448940gmail-yiv3640381119gmail-yiv6631=
855549gmail-yiv8846057614gmail-yiv1502761765gmail-yiv2011179358gmail-yiv898=
2601502gmail-yiv3886875272gmail-yiv9307351514"><div dir=3D"ltr"><div class=
=3D"gmail-yiv2354686438gmail-yiv0490985615gmail-yiv9460717586gmail-yiv48048=
22511gmail-yiv1240240571gmail-yiv6304392045gmail-yiv4717448940gmail-yiv3640=
381119gmail-yiv6631855549gmail-yiv8846057614gmail-yiv1502761765gmail-yiv201=
1179358gmail-yiv8982601502gmail-yiv3886875272gmail-yiv9307351514gmail-msg-b=
ody gmail-yiv2354686438gmail-yiv0490985615gmail-yiv9460717586gmail-yiv48048=
22511gmail-yiv1240240571gmail-yiv6304392045gmail-yiv4717448940gmail-yiv3640=
381119gmail-yiv6631855549gmail-yiv8846057614gmail-yiv1502761765gmail-yiv201=
1179358gmail-yiv8982601502gmail-yiv3886875272gmail-yiv9307351514gmail-P_wpo=
fO gmail-yiv2354686438gmail-yiv0490985615gmail-yiv9460717586gmail-yiv480482=
2511gmail-yiv1240240571gmail-yiv6304392045gmail-yiv4717448940gmail-yiv36403=
81119gmail-yiv6631855549gmail-yiv8846057614gmail-yiv1502761765gmail-yiv2011=
179358gmail-yiv8982601502gmail-yiv3886875272gmail-yiv9307351514gmail-mq_AS"=
><div class=3D"gmail-yiv2354686438gmail-yiv0490985615gmail-yiv9460717586gma=
il-yiv4804822511gmail-yiv1240240571gmail-yiv6304392045gmail-yiv4717448940gm=
ail-yiv3640381119gmail-yiv6631855549gmail-yiv8846057614gmail-yiv1502761765g=
mail-yiv2011179358gmail-yiv8982601502gmail-yiv3886875272gmail-yiv9307351514=
gmail-jb_0 gmail-yiv2354686438gmail-yiv0490985615gmail-yiv9460717586gmail-y=
iv4804822511gmail-yiv1240240571gmail-yiv6304392045gmail-yiv4717448940gmail-=
yiv3640381119gmail-yiv6631855549gmail-yiv8846057614gmail-yiv1502761765gmail=
-yiv2011179358gmail-yiv8982601502gmail-yiv3886875272gmail-yiv9307351514gmai=
l-X_6MGW gmail-yiv2354686438gmail-yiv0490985615gmail-yiv9460717586gmail-yiv=
4804822511gmail-yiv1240240571gmail-yiv6304392045gmail-yiv4717448940gmail-yi=
v3640381119gmail-yiv6631855549gmail-yiv8846057614gmail-yiv1502761765gmail-y=
iv2011179358gmail-yiv8982601502gmail-yiv3886875272gmail-yiv9307351514gmail-=
N_6Fd5"><div><div id=3D"gmail-yiv2354686438gmail-yiv0490985615gmail-yiv9460=
717586gmail-yiv4804822511gmail-yiv1240240571gmail-yiv6304392045gmail-yiv471=
7448940gmail-yiv3640381119gmail-yiv6631855549gmail-yiv8846057614gmail-yiv15=
02761765gmail-yiv2011179358gmail-yiv8982601502gmail-yiv3886875272gmail-yiv9=
307351514gmail-yiv4450448818"><div dir=3D"ltr"><div class=3D"gmail-yiv23546=
86438gmail-yiv0490985615gmail-yiv9460717586gmail-yiv4804822511gmail-yiv1240=
240571gmail-yiv6304392045gmail-yiv4717448940gmail-yiv3640381119gmail-yiv663=
1855549gmail-yiv8846057614gmail-yiv1502761765gmail-yiv2011179358gmail-yiv89=
82601502gmail-yiv3886875272gmail-yiv9307351514gmail-yiv4450448818gmail-msg-=
body gmail-yiv2354686438gmail-yiv0490985615gmail-yiv9460717586gmail-yiv4804=
822511gmail-yiv1240240571gmail-yiv6304392045gmail-yiv4717448940gmail-yiv364=
0381119gmail-yiv6631855549gmail-yiv8846057614gmail-yiv1502761765gmail-yiv20=
11179358gmail-yiv8982601502gmail-yiv3886875272gmail-yiv9307351514gmail-yiv4=
450448818gmail-P_wpofO gmail-yiv2354686438gmail-yiv0490985615gmail-yiv94607=
17586gmail-yiv4804822511gmail-yiv1240240571gmail-yiv6304392045gmail-yiv4717=
448940gmail-yiv3640381119gmail-yiv6631855549gmail-yiv8846057614gmail-yiv150=
2761765gmail-yiv2011179358gmail-yiv8982601502gmail-yiv3886875272gmail-yiv93=
07351514gmail-yiv4450448818gmail-mq_AS"><div class=3D"gmail-yiv2354686438gm=
ail-yiv0490985615gmail-yiv9460717586gmail-yiv4804822511gmail-yiv1240240571g=
mail-yiv6304392045gmail-yiv4717448940gmail-yiv3640381119gmail-yiv6631855549=
gmail-yiv8846057614gmail-yiv1502761765gmail-yiv2011179358gmail-yiv898260150=
2gmail-yiv3886875272gmail-yiv9307351514gmail-yiv4450448818gmail-jb_0 gmail-=
yiv2354686438gmail-yiv0490985615gmail-yiv9460717586gmail-yiv4804822511gmail=
-yiv1240240571gmail-yiv6304392045gmail-yiv4717448940gmail-yiv3640381119gmai=
l-yiv6631855549gmail-yiv8846057614gmail-yiv1502761765gmail-yiv2011179358gma=
il-yiv8982601502gmail-yiv3886875272gmail-yiv9307351514gmail-yiv4450448818gm=
ail-X_6MGW gmail-yiv2354686438gmail-yiv0490985615gmail-yiv9460717586gmail-y=
iv4804822511gmail-yiv1240240571gmail-yiv6304392045gmail-yiv4717448940gmail-=
yiv3640381119gmail-yiv6631855549gmail-yiv8846057614gmail-yiv1502761765gmail=
-yiv2011179358gmail-yiv8982601502gmail-yiv3886875272gmail-yiv9307351514gmai=
l-yiv4450448818gmail-N_6Fd5"><div><div id=3D"gmail-yiv2354686438gmail-yiv04=
90985615gmail-yiv9460717586gmail-yiv4804822511gmail-yiv1240240571gmail-yiv6=
304392045gmail-yiv4717448940gmail-yiv3640381119gmail-yiv6631855549gmail-yiv=
8846057614gmail-yiv1502761765gmail-yiv2011179358gmail-yiv8982601502gmail-yi=
v3886875272gmail-yiv9307351514gmail-yiv4450448818gmail-yiv7990407763"><div =
dir=3D"ltr"><div class=3D"gmail-yiv2354686438gmail-yiv0490985615gmail-yiv94=
60717586gmail-yiv4804822511gmail-yiv1240240571gmail-yiv6304392045gmail-yiv4=
717448940gmail-yiv3640381119gmail-yiv6631855549gmail-yiv8846057614gmail-yiv=
1502761765gmail-yiv2011179358gmail-yiv8982601502gmail-yiv3886875272gmail-yi=
v9307351514gmail-yiv4450448818gmail-yiv7990407763gmail-msg-body gmail-yiv23=
54686438gmail-yiv0490985615gmail-yiv9460717586gmail-yiv4804822511gmail-yiv1=
240240571gmail-yiv6304392045gmail-yiv4717448940gmail-yiv3640381119gmail-yiv=
6631855549gmail-yiv8846057614gmail-yiv1502761765gmail-yiv2011179358gmail-yi=
v8982601502gmail-yiv3886875272gmail-yiv9307351514gmail-yiv4450448818gmail-y=
iv7990407763gmail-P_wpofO gmail-yiv2354686438gmail-yiv0490985615gmail-yiv94=
60717586gmail-yiv4804822511gmail-yiv1240240571gmail-yiv6304392045gmail-yiv4=
717448940gmail-yiv3640381119gmail-yiv6631855549gmail-yiv8846057614gmail-yiv=
1502761765gmail-yiv2011179358gmail-yiv8982601502gmail-yiv3886875272gmail-yi=
v9307351514gmail-yiv4450448818gmail-yiv7990407763gmail-mq_AS"><div class=3D=
"gmail-yiv2354686438gmail-yiv0490985615gmail-yiv9460717586gmail-yiv48048225=
11gmail-yiv1240240571gmail-yiv6304392045gmail-yiv4717448940gmail-yiv3640381=
119gmail-yiv6631855549gmail-yiv8846057614gmail-yiv1502761765gmail-yiv201117=
9358gmail-yiv8982601502gmail-yiv3886875272gmail-yiv9307351514gmail-yiv44504=
48818gmail-yiv7990407763gmail-jb_0 gmail-yiv2354686438gmail-yiv0490985615gm=
ail-yiv9460717586gmail-yiv4804822511gmail-yiv1240240571gmail-yiv6304392045g=
mail-yiv4717448940gmail-yiv3640381119gmail-yiv6631855549gmail-yiv8846057614=
gmail-yiv1502761765gmail-yiv2011179358gmail-yiv8982601502gmail-yiv388687527=
2gmail-yiv9307351514gmail-yiv4450448818gmail-yiv7990407763gmail-X_6MGW gmai=
l-yiv2354686438gmail-yiv0490985615gmail-yiv9460717586gmail-yiv4804822511gma=
il-yiv1240240571gmail-yiv6304392045gmail-yiv4717448940gmail-yiv3640381119gm=
ail-yiv6631855549gmail-yiv8846057614gmail-yiv1502761765gmail-yiv2011179358g=
mail-yiv8982601502gmail-yiv3886875272gmail-yiv9307351514gmail-yiv4450448818=
gmail-yiv7990407763gmail-N_6Fd5"><div><div id=3D"gmail-yiv2354686438gmail-y=
iv0490985615gmail-yiv9460717586gmail-yiv4804822511gmail-yiv1240240571gmail-=
yiv6304392045gmail-yiv4717448940gmail-yiv3640381119gmail-yiv6631855549gmail=
-yiv8846057614gmail-yiv1502761765gmail-yiv2011179358gmail-yiv8982601502gmai=
l-yiv3886875272gmail-yiv9307351514gmail-yiv4450448818gmail-yiv7990407763gma=
il-yiv6578108508"><div dir=3D"ltr"><div class=3D"gmail-yiv2354686438gmail-y=
iv0490985615gmail-yiv9460717586gmail-yiv4804822511gmail-yiv1240240571gmail-=
yiv6304392045gmail-yiv4717448940gmail-yiv3640381119gmail-yiv6631855549gmail=
-yiv8846057614gmail-yiv1502761765gmail-yiv2011179358gmail-yiv8982601502gmai=
l-yiv3886875272gmail-yiv9307351514gmail-yiv4450448818gmail-yiv7990407763gma=
il-yiv6578108508gmail-msg-body gmail-yiv2354686438gmail-yiv0490985615gmail-=
yiv9460717586gmail-yiv4804822511gmail-yiv1240240571gmail-yiv6304392045gmail=
-yiv4717448940gmail-yiv3640381119gmail-yiv6631855549gmail-yiv8846057614gmai=
l-yiv1502761765gmail-yiv2011179358gmail-yiv8982601502gmail-yiv3886875272gma=
il-yiv9307351514gmail-yiv4450448818gmail-yiv7990407763gmail-yiv6578108508gm=
ail-P_wpofO gmail-yiv2354686438gmail-yiv0490985615gmail-yiv9460717586gmail-=
yiv4804822511gmail-yiv1240240571gmail-yiv6304392045gmail-yiv4717448940gmail=
-yiv3640381119gmail-yiv6631855549gmail-yiv8846057614gmail-yiv1502761765gmai=
l-yiv2011179358gmail-yiv8982601502gmail-yiv3886875272gmail-yiv9307351514gma=
il-yiv4450448818gmail-yiv7990407763gmail-yiv6578108508gmail-mq_AS"><div cla=
ss=3D"gmail-yiv2354686438gmail-yiv0490985615gmail-yiv9460717586gmail-yiv480=
4822511gmail-yiv1240240571gmail-yiv6304392045gmail-yiv4717448940gmail-yiv36=
40381119gmail-yiv6631855549gmail-yiv8846057614gmail-yiv1502761765gmail-yiv2=
011179358gmail-yiv8982601502gmail-yiv3886875272gmail-yiv9307351514gmail-yiv=
4450448818gmail-yiv7990407763gmail-yiv6578108508gmail-jb_0 gmail-yiv2354686=
438gmail-yiv0490985615gmail-yiv9460717586gmail-yiv4804822511gmail-yiv124024=
0571gmail-yiv6304392045gmail-yiv4717448940gmail-yiv3640381119gmail-yiv66318=
55549gmail-yiv8846057614gmail-yiv1502761765gmail-yiv2011179358gmail-yiv8982=
601502gmail-yiv3886875272gmail-yiv9307351514gmail-yiv4450448818gmail-yiv799=
0407763gmail-yiv6578108508gmail-X_6MGW gmail-yiv2354686438gmail-yiv04909856=
15gmail-yiv9460717586gmail-yiv4804822511gmail-yiv1240240571gmail-yiv6304392=
045gmail-yiv4717448940gmail-yiv3640381119gmail-yiv6631855549gmail-yiv884605=
7614gmail-yiv1502761765gmail-yiv2011179358gmail-yiv8982601502gmail-yiv38868=
75272gmail-yiv9307351514gmail-yiv4450448818gmail-yiv7990407763gmail-yiv6578=
108508gmail-N_6Fd5"><div><div id=3D"gmail-yiv2354686438gmail-yiv0490985615g=
mail-yiv9460717586gmail-yiv4804822511gmail-yiv1240240571gmail-yiv6304392045=
gmail-yiv4717448940gmail-yiv3640381119gmail-yiv6631855549gmail-yiv884605761=
4gmail-yiv1502761765gmail-yiv2011179358gmail-yiv8982601502gmail-yiv38868752=
72gmail-yiv9307351514gmail-yiv4450448818gmail-yiv7990407763gmail-yiv6578108=
508gmail-yiv6656909513"><div dir=3D"ltr"><div style=3D"color:rgb(26,26,26);=
font-size:16px;font-family:arial,sans-serif">Hello Dear,</div><div style=3D=
"color:rgb(26,26,26);font-size:16px;font-family:arial,sans-serif"><br></div=
><div style=3D"color:rgb(26,26,26);font-size:16px;font-family:arial,sans-se=
rif">My
 name is Mr. Williams Melody , I work with the African development bank=20
ADB as bank director, Your personality motivated me after going through=20
your profile and I decided to contact you for this business proposal=20
that will benefit both of us in the end. Actually, I am here searching=20
for a person of honor I can trust and use for the claims, this=20
transaction proposal is an inheritance claim which I want you to act as=20
the next of kin to the late Mr.Garry Kirstenfeldt..</div><div style=3D"colo=
r:rgb(26,26,26);font-size:16px;font-family:arial,sans-serif"><br></div><div=
 style=3D"color:rgb(26,26,26);font-size:16px;font-family:arial,sans-serif">=
Mr.Garry
 Kirstenfeldt., Died of corona-virus disease (COVID-19) on 2nd March=20
2020, at the age of 71 years and left a deposit of 4.5 ,Million USD in=20
his account with this firm and since after his death no one has come for
 the claim of this fund. Recently, the bank board of directors ordered=20
his special account officer who managed his account in this bank, to=20
provide his next of kin for the release of his deposit since he operated
 a coded account with the bank financial department and has no specific=20
mentioned next of kin in his security file jacket with the bank.</div><div =
style=3D"color:rgb(26,26,26);font-size:16px;font-family:arial,sans-serif"><=
br></div><div style=3D"color:rgb(26,26,26);font-size:16px;font-family:arial=
,sans-serif">I
 will share the proceeds on the percentage ration which I know would be=20
pleased by you. Upon a successful transaction which I&#39;m highly=20
optimistic about, you are entitled to 40% while 50% would be for mine=20
and 10% will be set aside for any expenses that we might have incurred=20
in the process. I will furnish you with the information as it will=20
interest you in detail upon your satisfactory reply.=C2=A0</div><div style=
=3D"color:rgb(26,26,26);font-size:16px;font-family:arial,sans-serif"><br></=
div><div style=3D"color:rgb(26,26,26);font-size:16px;font-family:arial,sans=
-serif">Best regards,</div><div style=3D"color:rgb(26,26,26);font-size:16px=
;font-family:arial,sans-serif">Mr. Williams Melody</div></div>
</div></div></div></div></div>
</div></div></div></div></div>
</div></div></div></div></div>
</div></div></div></div></div>
</div></div></div></div></div>
</div></div></div></div></div>
</div></div></div></div></div>
</div></div></div></div></div>
</div></div></div></div></div>
</div></div></div></div></div>
</div></div></div></div></div>
</div></div></div></div></div>
</div></div></div></div></div>
</div></div></div></div></div>
</div></div></div></div></div>
</div></div></div></div></div>
</div></div></div></div></div>
</div></div></div></div></div>
</div></div></div></div></div>

--0000000000003c5d61064429e306--
