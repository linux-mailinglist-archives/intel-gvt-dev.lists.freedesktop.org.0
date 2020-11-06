Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 513B82A967E
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  6 Nov 2020 13:54:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B054D893CB;
	Fri,  6 Nov 2020 12:54:22 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4D8D6EA87
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  6 Nov 2020 12:54:20 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id i6so1794287lfd.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 06 Nov 2020 04:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:reply-to:from:date:message-id:subject:to;
 bh=8XO8tzvbqoZ7+jg77OKMfliL+EcEdm++9c8W6K82eVQ=;
 b=u/FCXTM3qw5ymlokLmHFlbp73BlEQkhnbvBftTNW6B7sk4zzjZzNcLBC48CsCdnt7t
 NDfk3L6QqmS5LdTfA9/lsqUBkAL8eRaI9/GMIbG8An4dq7DMKWONmVQnkKojxxXY2Prc
 jD93nfCK7BOO7FI3+VH+2++NX1WYICuskqXd47aZ+cErvsG9YgSgZ/Lz2ed6iY58Y/zW
 6dP2bICaYjDUSulfQYIG75/PhQMBMKy2LKuYGvsBXo6+8QJLnThiRpLkGqoSN10bfyT6
 FPZRWeK1iYCvT+Ev1qmDWJsATw9zCS8iIl7gjLaFmxFcuQxJOXlE4JWfYfzDG4p8Ol+q
 ihKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:reply-to:from:date:message-id
 :subject:to;
 bh=8XO8tzvbqoZ7+jg77OKMfliL+EcEdm++9c8W6K82eVQ=;
 b=My5uOV601vH3/6Fm7mthgLg0rkdCrJbm2XoNC0NFauOqmMhO9bgKtMeecMi3QSjC/Y
 NqBw0kgH7mEwqLXiZ96QUS2ynOo92e3dxpdI5NUeMUSCoTXTa1TPj8Nf3EcZfkR+4xtJ
 PSv1Tq8nQnhwh6LuKilJz3c9EouZD7xYpHfUpSjhMYr343WMeKYTQH8ec5dByyfChUQU
 nHOKrqN2uleWRnwhN8o4pnXI7mBg60mUQSFF81vDQZ2yH3g7+R1hbZvNEcQ8odvJP9H4
 xVZcYbPoJA1L11vcb2WwxkUx9E59Z5vJBUScMO+/op4c/EEv3XYpEz9DIU7lHP48SPhI
 noog==
X-Gm-Message-State: AOAM530g+RrMlONtLSjFnJCwLjiSNspPAA0iYhT5fq4zyPj+ZtCVByQ5
 zZRwt8cW0IBDQGp1xP0hNSAmlLojFs6EIFKQb9U=
X-Google-Smtp-Source: ABdhPJyWAQpHHqAluVkMmZbdp/wLRB4wqAZBcWXdWcwGd/9eUNGryewFNH7NTRiwRhzzt+XAACGeH2OXT7sJ/AIOvFM=
X-Received: by 2002:ac2:443c:: with SMTP id w28mr770726lfl.405.1604667259297; 
 Fri, 06 Nov 2020 04:54:19 -0800 (PST)
MIME-Version: 1.0
From: Daniel SACKEY <ddsckey@gmail.com>
Date: Fri, 6 Nov 2020 20:54:09 +0800
Message-ID: <CAME6GFB=ZVwN=VrWF9uKzjgAyqw-7D=b5ncCsK59dbqhtGK80g@mail.gmail.com>
Subject: re
To: undisclosed-recipients:;
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
Reply-To: ddsckey@gmail.com
Content-Type: multipart/mixed; boundary="===============1234155765=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--===============1234155765==
Content-Type: multipart/alternative; boundary="000000000000f9243205b36fb541"

--000000000000f9243205b36fb541
Content-Type: text/plain; charset="UTF-8"

 Good morning and how are you,

This message might meet you in utmost surprise. However, it is my urgent
need for a foreign partner that made me contact you for this transaction. I
am Mr Daniel Sackey, Managing Director of Ecobank over here in Accra,
Ghana.  On 15th July 2009 one of my bank customers died along with his
entire family in a plane crash in Northern Iran, but before his death, he
made a fixed deposit of $12,500,000.00 with our bank unfortunately, the
deceased did not attach to the fund any next of kin. Since there is no next
of kin to the fund, I want to put your  information into our bank database
as the legal next of kin to the fund and the money would be legally
transferred to you.  I want you to help me receive the fund in your country
or any country of your choice because I cannot do this deal alone except
with a foreign partner. This business is legal, and we shall follow all the
legal banking procedures for the money to be transferred to you legally.

We shall share the money equally; 50/50 percent each after it has been
transferred to you. If you agree to my business deal, more details relating
to the fund transfer and vital legal documents concerning this deal will be
forwarded to you for more clarifications as soon as I receive your reply.
Please treat this transaction very confidential.

Sincerely
Mr. Daniel Sackey

--000000000000f9243205b36fb541
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">
<div class=3D"gmail-_3U2q6dcdZCrTrR_42Nxby gmail-JWNdg1hee9_Rz6bIGvG1c gmai=
l-allowTextSelection"><div><div class=3D"gmail-rps_400b"><div><div dir=3D"l=
tr"><div class=3D"gmail-x_gmail-_3U2q6dcdZCrTrR_42Nxby gmail-x_gmail-JWNdg1=
hee9_Rz6bIGvG1c gmail-x_gmail-allowTextSelection"><div><div class=3D"gmail-=
x_gmail-rps_400b"><div><div dir=3D"ltr"><div class=3D"gmail-x_gmail-x_gmail=
-_3U2q6dcdZCrTrR_42Nxby gmail-x_gmail-x_gmail-JWNdg1hee9_Rz6bIGvG1c gmail-x=
_gmail-x_gmail-allowTextSelection"><div><div class=3D"gmail-x_gmail-x_gmail=
-rps_274"><div><div dir=3D"ltr"><div class=3D"gmail-x_gmail-x_gmail-x_gmail=
-_2zOpJb7ZbCN0X1DoeFyiYw gmail-x_gmail-x_gmail-x_gmail-JWNdg1hee9_Rz6bIGvG1=
c gmail-x_gmail-x_gmail-x_gmail-allowTextSelection"><div><div class=3D"gmai=
l-x_gmail-x_gmail-x_gmail-rps_274"><div><div dir=3D"ltr"><div class=3D"gmai=
l-x_gmail-x_gmail-x_gmail-x_gmail-_3U2q6dcdZCrTrR_42Nxby gmail-x_gmail-x_gm=
ail-x_gmail-x_gmail-JWNdg1hee9_Rz6bIGvG1c gmail-x_gmail-x_gmail-x_gmail-x_g=
mail-allowTextSelection"><div><div class=3D"gmail-x_gmail-x_gmail-x_gmail-x=
_gmail-rps_274"><div><div dir=3D"ltr"><div class=3D"gmail-x_gmail-x_gmail-x=
_gmail-x_gmail-x_gmail-_2zOpJb7ZbCN0X1DoeFyiYw gmail-x_gmail-x_gmail-x_gmai=
l-x_gmail-x_gmail-JWNdg1hee9_Rz6bIGvG1c gmail-x_gmail-x_gmail-x_gmail-x_gma=
il-x_gmail-allowTextSelection"><div><div class=3D"gmail-x_gmail-x_gmail-x_g=
mail-x_gmail-x_gmail-rps_274"><div><div dir=3D"ltr"><div class=3D"gmail-x_g=
mail-x_gmail-x_gmail-x_gmail-x_gmail-x_gmail-_2zOpJb7ZbCN0X1DoeFyiYw gmail-=
x_gmail-x_gmail-x_gmail-x_gmail-x_gmail-x_gmail-JWNdg1hee9_Rz6bIGvG1c gmail=
-x_gmail-x_gmail-x_gmail-x_gmail-x_gmail-x_gmail-allowTextSelection"><div><=
div class=3D"gmail-x_gmail-x_gmail-x_gmail-x_gmail-x_gmail-x_gmail-rps_274"=
><div><div dir=3D"ltr"><div class=3D"gmail-x_gmail-x_gmail-x_gmail-x_gmail-=
x_gmail-x_gmail-x_gmail-_3U2q6dcdZCrTrR_42Nxby gmail-x_gmail-x_gmail-x_gmai=
l-x_gmail-x_gmail-x_gmail-x_gmail-JWNdg1hee9_Rz6bIGvG1c gmail-x_gmail-x_gma=
il-x_gmail-x_gmail-x_gmail-x_gmail-x_gmail-allowTextSelection"><div><div cl=
ass=3D"gmail-x_gmail-x_gmail-x_gmail-x_gmail-x_gmail-x_gmail-x_gmail-rps_e4=
6d"><div><div dir=3D"ltr"><div class=3D"gmail-x_gmail-x_gmail-x_gmail-x_gma=
il-x_gmail-x_gmail-x_gmail-x_gmail-_3U2q6dcdZCrTrR_42Nxby gmail-x_gmail-x_g=
mail-x_gmail-x_gmail-x_gmail-x_gmail-x_gmail-x_gmail-JWNdg1hee9_Rz6bIGvG1c =
gmail-x_gmail-x_gmail-x_gmail-x_gmail-x_gmail-x_gmail-x_gmail-x_gmail-allow=
TextSelection"><div><div class=3D"gmail-x_gmail-x_gmail-x_gmail-x_gmail-x_g=
mail-x_gmail-x_gmail-x_gmail-rps_e46d"><div><div dir=3D"ltr"><div><div><div=
><div><div dir=3D"ltr"><div><div><div><div><div dir=3D"ltr"><div><div><div>=
<div><div dir=3D"ltr"><div><div><div><div><div dir=3D"ltr"><div><div><div><=
div><div dir=3D"ltr"><div><div><div><div><div dir=3D"ltr"><div><div><div><d=
iv><div dir=3D"ltr"><div><div><div><div><div dir=3D"ltr"><div><div><div><di=
v><div dir=3D"ltr"><div><div><div><div><div dir=3D"ltr"><div><div><div><div=
><div dir=3D"ltr"><div><div><div><div><div dir=3D"ltr"><div><div><div><div>=
<div dir=3D"ltr"><div><div><div><div><div dir=3D"ltr"><div><div><div><div><=
div dir=3D"ltr"><div><div><div><div><div dir=3D"ltr"><div><div><div><div><d=
iv dir=3D"ltr"><div><div><div><div><div dir=3D"ltr"><div><div><div><div><di=
v dir=3D"ltr"><div><div><div><div><div dir=3D"ltr"><div><div><div><div><div=
 dir=3D"ltr"><div><div><div><div><div dir=3D"ltr"><div><div><div><div><div =
dir=3D"ltr"><div><div><div><div><div dir=3D"ltr"><div dir=3D"ltr"><div dir=
=3D"ltr"><div><div><div><div><div dir=3D"ltr"><div><div><div><div><div dir=
=3D"ltr"><div><div><div><div><div dir=3D"ltr"><div><div><div><div><div dir=
=3D"ltr"><div style=3D"margin:0px;padding:0px;border:0px none;font-style:no=
rmal;font-weight:400;font-stretch:inherit;font-size:15px;line-height:inheri=
t;vertical-align:baseline;color:rgb(32,31,30);letter-spacing:normal;text-al=
ign:start;text-indent:0px;text-transform:none;white-space:normal;word-spaci=
ng:0px;background-color:rgb(255,255,255)">Good morning and how are you,</di=
v><div style=3D"margin:0px;padding:0px;border:0px none;font-style:normal;fo=
nt-weight:400;font-stretch:inherit;font-size:15px;line-height:inherit;verti=
cal-align:baseline;color:rgb(32,31,30);letter-spacing:normal;text-align:sta=
rt;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;=
background-color:rgb(255,255,255)"><br></div><div style=3D"margin:0px;paddi=
ng:0px;border:0px none;font-style:normal;font-weight:400;font-stretch:inher=
it;font-size:15px;line-height:inherit;vertical-align:baseline;color:rgb(32,=
31,30);letter-spacing:normal;text-align:start;text-indent:0px;text-transfor=
m:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255=
)">This
 message might meet you in utmost surprise. However, it is my urgent=20
need for a foreign partner that made me contact you for this=20
transaction. I am Mr Daniel Sackey, Managing Director of Ecobank over=20
here in Accra, Ghana.=C2=A0 On 15th July 2009 one of my bank customers died=
=20
along with his entire family in a plane crash in Northern Iran, but=20
before his death, he made a fixed deposit of $12,500,000.00 with our=20
bank unfortunately, the deceased did not attach to the fund any next of=20
kin. Since there is no next of kin to the fund, I want to put your=C2=A0=20
information into our bank database as the legal next of kin to the fund=20
and the money would be legally transferred to you.=C2=A0 I want you to help=
=20
me receive the fund in your country or any country of your choice=20
because I cannot do this deal alone except with a foreign partner. This=20
business is legal, and we shall follow all the legal banking procedures=20
for the money to be transferred to you legally.</div><div style=3D"margin:0=
px;padding:0px;border:0px none;font-style:normal;font-weight:400;font-stret=
ch:inherit;font-size:15px;line-height:inherit;vertical-align:baseline;color=
:rgb(32,31,30);letter-spacing:normal;text-align:start;text-indent:0px;text-=
transform:none;white-space:normal;word-spacing:0px;background-color:rgb(255=
,255,255)"><br></div><div style=3D"margin:0px;padding:0px;border:0px none;f=
ont-style:normal;font-weight:400;font-stretch:inherit;font-size:15px;line-h=
eight:inherit;vertical-align:baseline;color:rgb(32,31,30);letter-spacing:no=
rmal;text-align:start;text-indent:0px;text-transform:none;white-space:norma=
l;word-spacing:0px;background-color:rgb(255,255,255)">We
 shall share the money equally; 50/50 percent each after it has been=20
transferred to you. If you agree to my business deal, more details=20
relating to the fund transfer and vital legal documents concerning this=20
deal will be forwarded to you for more clarifications as soon as I=20
receive your reply. Please treat this transaction very confidential.=C2=A0=
=C2=A0</div><div style=3D"margin:0px;padding:0px;border:0px none;font-style=
:normal;font-weight:400;font-stretch:inherit;font-size:15px;line-height:inh=
erit;vertical-align:baseline;color:rgb(32,31,30);letter-spacing:normal;text=
-align:start;text-indent:0px;text-transform:none;white-space:normal;word-sp=
acing:0px;background-color:rgb(255,255,255)"><br></div><div style=3D"margin=
:0px;padding:0px;border:0px none;font-style:normal;font-weight:400;font-str=
etch:inherit;font-size:15px;line-height:inherit;vertical-align:baseline;col=
or:rgb(32,31,30);letter-spacing:normal;text-align:start;text-indent:0px;tex=
t-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(2=
55,255,255)">Sincerely</div><div style=3D"margin:0px;padding:0px;border:0px=
 none;font-style:normal;font-weight:400;font-stretch:inherit;font-size:15px=
;line-height:inherit;vertical-align:baseline;color:rgb(32,31,30);letter-spa=
cing:normal;text-align:start;text-indent:0px;text-transform:none;white-spac=
e:normal;word-spacing:0px;background-color:rgb(255,255,255)">Mr. Daniel Sac=
key</div></div></div></div></div></div></div></div></div></div></div></div>=
</div></div></div></div></div></div></div></div></div></div></div></div></d=
iv></div></div></div></div></div></div></div></div></div></div></div></div>=
</div></div></div></div></div></div></div></div></div></div></div></div></d=
iv></div></div></div></div></div></div></div></div></div></div></div></div>=
</div></div></div></div></div></div></div></div></div></div></div></div></d=
iv></div></div></div></div></div></div></div></div></div></div></div></div>=
</div></div></div></div></div></div></div></div></div></div></div></div></d=
iv></div></div></div></div></div></div></div></div></div></div></div></div>=
</div></div></div></div></div></div></div></div></div></div></div></div></d=
iv></div></div></div></div></div></div></div></div></div></div></div></div>=
</div></div></div></div></div></div></div></div></div></div></div></div></d=
iv></div></div></div></div></div></div></div></div></div></div></div></div>=
</div></div></div></div></div></div></div></div></div></div></div></div></d=
iv></div></div></div></div></div></div></div></div></div></div></div></div>=
</div>

</div>

--000000000000f9243205b36fb541--

--===============1234155765==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============1234155765==--
