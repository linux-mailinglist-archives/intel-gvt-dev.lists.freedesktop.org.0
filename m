Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C59207F701C
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 24 Nov 2023 10:39:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A64C210E7C9;
	Fri, 24 Nov 2023 09:39:41 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04olkn2038.outbound.protection.outlook.com [40.92.75.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A69310E7C8;
 Fri, 24 Nov 2023 09:39:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mySuSse6WaIEU60vwy9AtuJXFyjmHnOfdhtU+IgfkIA3KiYPCnGCwt0CzlnmjDuYzKrwgRw9RpwM9aEu9/uHlSgA5wyGwvfsmhnnglU6ElVOAieiBc3ZPG5Jx6PWGZld5ZZPhdKAMnjjI7rzBPpsHZsxjcQxA60DmUenLjnKLlzfG2DaAHPts+osaTIy0VahlIwrxAfTYgOzsCLyRyY5BNJ3i8lwUbgRpoP2n6sdPuhUS6yPVwU/Y1MZVMsV5B7QRfQCTtNJrh/CkuCIjrH96COy8Xrm2YT/h8PLRa+PwuZ8ndFfwRcrgp0HOFJeD9jmJ3JbvGwPgWJ/XehqtSXvgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XllhqJkNqRmv4bkULc/qsEU1xJnan9STes9WAobtDzA=;
 b=HAX+7wMqLcHb7t46iLOLhajBWpJ82L5/8MlOcZq4LMP/cnpH7YX4i00Hj82Pb9ZXlyBoTDfHD3Ak5OYDYqvNipHrbhzcFnTcpYHKJzOOQThY91qBSG7o71v7g5XEp18x8x8PcVK3ZKQ49whQ48rct+icIR1yI0hE+VzPwgkD+/uV+LhVJgUKcKNtWCoPsEk8Bukx5w0ym/EwMJBxdXesXpnAc5mABN+g06DvAH0phAk9pSAqV0JJVk0NDuzsNe3jNmw34cc2a9iNuTEToy1u1bRGkRpjxVNGoOr66/zeqVzjRkurF4eBkQEUrmbpIw9kCOswSHBOa2Xp8P0zrPfzQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XllhqJkNqRmv4bkULc/qsEU1xJnan9STes9WAobtDzA=;
 b=J54M2mzfSRKHjeL54XvCa/huJrXQwIhaARg70nQ3GC1t2SPaomm3bkH8vyOyl+hAHy1+lw5SHuO5SUVZouE8z0AsFBxvLdNzHpQjPLzyE72RHbTiQEQJe+zG96JKU0wL6B32oXIIfRK7ppRexAAv/H4jYIie+zI/P/gMKudpLwjLe0/a3XQcXxIaLIF9HsHWpz9lmqsa/oac5dCqQes/fFedeHvk2gMS+PEqw0w+ad7Cdd1lzjW62KRa9al0ierjeQsbIA4OUS6/csm7iL3mE+yI/fp1UwId27boDpM79FgmHyAEAvVs7ZgIgoxrL/C9rlufgY7AYVQMhhsowp4VWA==
Received: from AM9P195MB1109.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:1f6::8)
 by AM0P195MB0642.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:165::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.21; Fri, 24 Nov
 2023 09:39:35 +0000
Received: from AM9P195MB1109.EURP195.PROD.OUTLOOK.COM
 ([fe80::b495:4611:608c:c956]) by AM9P195MB1109.EURP195.PROD.OUTLOOK.COM
 ([fe80::b495:4611:608c:c956%6]) with mapi id 15.20.7025.021; Fri, 24 Nov 2023
 09:39:35 +0000
From: rebecca schieble <rebeccaschieble0006@outlook.com>
Subject: FOR GOD SAKE, YOUR URGENT REPLY IS NEEDED
Thread-Topic: FOR GOD SAKE, YOUR URGENT REPLY IS NEEDED
Thread-Index: AQHaHroim0TNpDloQkCtT7PBXeIfPw==
Date: Fri, 24 Nov 2023 09:39:35 +0000
Message-ID: <AM9P195MB110918C7EEBCFEBFE03DCC41B4B8A@AM9P195MB1109.EURP195.PROD.OUTLOOK.COM>
Accept-Language: en-ZA, en-US
Content-Language: en-ZA
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-tmn: [ragQ9Iz7z9dpGo5DyKB8Q0eAdsZJkjh6]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9P195MB1109:EE_|AM0P195MB0642:EE_
x-ms-office365-filtering-correlation-id: e3ecfae6-dc69-4b96-fff4-08dbecd14510
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1FOI6VZdR5ROcflHXKMC2pEgFW5v62N0yNK1kjv3xakO1ptW86SD5Vu2tcDKIYW+S+ujg9dxtQn1a0ris19MznaguPvaHc6CsqYM1bDDWPG66ughVPuD5q/cHVNbHD7oKkXvTVO2FCt4UW8VyRwkRp7X6M9fmbxv3Zj6tSx/KUqEnVlyOkF0acu66T/wT+3VR1Gs3glr6a/Lsk/V31ef0+FLVpXB/YILFjFOmLA21qTi15LnpODUSXhnGYP+z4mG/IPtuGh+fa1uUX6UWFnPv96m1imWLsWvKx75DAT+BoSxeBpERIS+Uv4eo7rqheLMIqzngxZ48/rp5GDCcJTSZVosWuSU1P68r4AzuXcs4R/7niUgpL3zhjnopC8jxDu5hCo4Vf7ua6wFt82eseQjNg7bT1redSI4hpgWLzZ2TlRc12ITm3tSEwv5ZiMDYBk15HefbB+Qyjsj17AbdP1nsxg75Vz/L6rTIOOdqMPf3GbZuOQnekcjl17aVlFLNQ23aEWnu20Or/kTeaLlPCfDQQjukV2binehUGUaAXdqrCZJd2qGkCyrbCkVbA+mHBRX
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?khAXooaxAqZThd/x70YDcOQjV+RwywH1MH2+YsawuzrjDj0974CGCZI2fF?=
 =?iso-8859-1?Q?7ao5C9N8d+7f0nLQLhTRNxs3ZvqNq/Jjsvu8/7MYsY45H0/vbLiuxE/M02?=
 =?iso-8859-1?Q?/Cxu4Y/2hmaXBtQvtBvcn1BIVqypi6lQrDRKu5MzSH3R01Xu9PWbVjb7PM?=
 =?iso-8859-1?Q?A/S+fw9qmzCmOyxsG9X26hlDzB2hrTd7RI4OBSTHTJWMEx4+RwSJ6RIi3q?=
 =?iso-8859-1?Q?PjUVWJV7jFCjZLRUNoLAIKovHDgbWid9Y2Tna5mXDqOLVKQlwROxgBlw2v?=
 =?iso-8859-1?Q?si38pSxhvxJO+i+AcLrsrmFSOqbjX/FsQ4QeP9CUxQ9yplTm6BukcSjN0a?=
 =?iso-8859-1?Q?5JF4Md0YxYcHfkDWRt3Nw9bmtLnWvKqFuihNgwjN7KWDAiF/YNv4PH4uhs?=
 =?iso-8859-1?Q?EHB5Pv2XK2222X+SVLETwBGEkaom0SpoMAm1KlTBRxrO5PZigFAf3WM75j?=
 =?iso-8859-1?Q?kxWxAxck7d7PyFE10zR5oqnfkw4YlYdrtqj9r2NAryYMJsUsJuwg4IVLAd?=
 =?iso-8859-1?Q?aRey9PtCW/w7p073nO8ZPRdxaklXV7yGtDhfVpcgrp1h6iLAMjMF05kBV3?=
 =?iso-8859-1?Q?8nvDiOmwY+rhPkCictnQKpX2yzI8kbJ1KMF+T/6y5c1or8AcEx3s6CIFR5?=
 =?iso-8859-1?Q?m5wGjH82//oBYtcL09i3yMdrfjhE2/6GqRO9KJC2RXvjYnromyQYIAiHrA?=
 =?iso-8859-1?Q?r7UdAUvpLV46u2+uBMWPJDuQw1yq36ehgIp3iJQinxN5+Wt8zLi/WuO8bS?=
 =?iso-8859-1?Q?1s7ooPoISLBXs+OXpFba5+HWxoVAjpL+e2+eZCxNFLYcZj8LbcvF1YZCsR?=
 =?iso-8859-1?Q?JNsVQNH8Z0iAYH7ftw1uFChmRl37aD+V8narZNeHVqvH7By4LLNM1gzAqW?=
 =?iso-8859-1?Q?uuG8p9cXlzH5h/d1DiHSNAX/UiTWAcuo1X6v2Vu7MAJCWfOjtgI/FES40c?=
 =?iso-8859-1?Q?tPr1mzucZkXY1GoGQEWQ7B50xAGUuhTU6pB/q6Tot1RDsjvrgT1gxJ0Xm9?=
 =?iso-8859-1?Q?iCopWi3LapHKihychF//+DnV93SHm8mif95yq+pkfHHI5zJOU7/ubBb/GT?=
 =?iso-8859-1?Q?eF8LP79nh6xeK1z5+J/W/VhQHQac0whHvLjx3Qz401EZ60+h0u7Dmg7l/3?=
 =?iso-8859-1?Q?4nmFO+FcpJTS0wmNODdcBzhqLrs5xJulCRJSd2o3c9+oy7lmCdgnkzAH40?=
 =?iso-8859-1?Q?w/pk4bEdvIFcxwpp6gwwKal9PER5j5EeLwQAzvUqGyUcuxMpRnGbjyqvdO?=
 =?iso-8859-1?Q?dm/W97O5uK6jwcehVxjvPvg1rm1e5MyPn1A2z9wHI=3D?=
Content-Type: multipart/alternative;
 boundary="_000_AM9P195MB110918C7EEBCFEBFE03DCC41B4B8AAM9P195MB1109EURP_"
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9P195MB1109.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: e3ecfae6-dc69-4b96-fff4-08dbecd14510
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2023 09:39:35.3752 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0P195MB0642
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

--_000_AM9P195MB110918C7EEBCFEBFE03DCC41B4B8AAM9P195MB1109EURP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Greetings  My Dear ,


Please All correspondence must be by my Private mail address

 E-mail :  mrsrebeccasc1234@gmail.com

My name is Major REBECCA SCHIEBLE. I'm an American soldier, am currently st=
ill serving in Iraq for ICU NURSE AT THE COMBAT SUPPORT HOSPITAL AT CAMP SP=
EICHER in the United State Army and providing adequate security for the US =
embassy in Baghdad. I'm seeking your kind assistance to move the sum of US$=
14.5Million to you as far as I can be assured that my share will be safe in=
 your care until I complete my service, this is not stolen money, and there=
 is no danger involved. I'm presently in a hospital recovering from injurie=
s Sustained in a suicide bomb attack, that took place during our combat wit=
h some ISIS Militant, I have successful move the Fund out of Iraq to SOUTH =
AFRICA, the fund is currently with a security Company, I am contacting you =
because you might be a God-fearing Citizen that is willing to be involve wi=
th this transaction and I am willing to share the money with you. I am send=
ing you this email message from the hospital where I am currently admitted =
for treatment and you should keep this information confidential between you=
 and I only. You will be wondering how I got your email address from USA on=
line yellow page. God bless you as you help me.



Some money in various currencies was discovered in barrels at a farmhouse n=
ear one of Saddam's old palaces in Tikrit-Iraq during a rescue operation wh=
ile I was still serving in Iraq some years ago and it was agreed by Sgt. Du=
ff and I that some part of this money be shared among both of us before inf=
orming anybody about it since both of us saw the money first. This was quit=
e an illegal thing to do, but I tell you what? No compensation can make up =
for the risk we have taken with our lives.


The above figure was given to me as my share, and to conceal this kind of m=
oney became a problem for me, so with the help of a British contact working=
 with us and his office enjoy some immunity, I was able to move the money t=
o a security company in SOUTH AFRICA as a diplomatic baggage. They are now =
waiting for us to provide the name of beneficiary who they will transfer th=
e funds to. The reason I want you to claim the funds on my behalf is that a=
s a soldier, I cannot present concrete evidence on how I made such a big am=
ount of money.



The moment I'm sure that you will assist me, I will let you know where I'm =
currently receiving treatment and I will also give you the information of t=
he security company and the security code of the baggage. I want you to tel=
l me how much you will take from this money for the assistance you will giv=
e to me. One passionate appeal I will make to you is not to discuss this ma=
tter with anybody, should you have reasons to reject this offer, please and=
 please destroy this message as any leakage of this information will be too=
 bad for me. I do not know how long I will remain here at the hospital; I h=
onestly want this matter to be resolved immediately, please contact me as s=
oon as possible, All correspondence must be by my Private mail address E-ma=
il :  mrsrebeccasc1234@gmail.com


Thanks for your anticipated co-operation and my regards to your family.


Yours Faithfully
FROM.MRS. REBECCA SCHIEBLE.

FOR GOD SAKE, YOUR URGENT REPLY IS NEEDED

--_000_AM9P195MB110918C7EEBCFEBFE03DCC41B4B8AAM9P195MB1109EURP_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Helvetic=
a, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">Greetings &nbsp;My De=
ar , &nbsp;</span></div>
<div><span style=3D"font-family: Calibri, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);"><br>
</span></div>
<div><span style=3D"font-family: Calibri, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);"><br>
</span></div>
<div><span style=3D"font-family: Calibri, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);">Please All correspondence must be by my Privat=
e mail address</span></div>
<div><span style=3D"font-family: Calibri, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);"><br>
</span></div>
<div><span style=3D"font-family: Calibri, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);">&nbsp;E-mail : &nbsp;mrsrebeccasc1234@gmail.co=
m</span></div>
<div><span style=3D"font-family: Calibri, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);"><br>
</span></div>
<div><span style=3D"font-family: Calibri, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);">My name is Major REBECCA SCHIEBLE. I'm an Amer=
ican soldier, am currently still serving in Iraq for ICU NURSE AT THE COMBA=
T SUPPORT HOSPITAL AT CAMP SPEICHER
 in the United State Army and providing adequate security for the US embass=
y in Baghdad. I'm seeking your kind assistance to move the sum of US$14.5Mi=
llion to you as far as I can be assured that my share will be safe in your =
care until I complete my service,
 this is not stolen money, and there is no danger involved. I'm presently i=
n a hospital recovering from injuries Sustained in a suicide bomb attack, t=
hat took place during our combat with some ISIS Militant, I have successful=
 move the Fund out of Iraq to SOUTH
 AFRICA, the fund is currently with a security Company, I am contacting you=
 because you might be a God-fearing Citizen that is willing to be involve w=
ith this transaction and I am willing to share the money with you. I am sen=
ding you this email message from
 the hospital where I am currently admitted for treatment and you should ke=
ep this information confidential between you and I only. You will be wonder=
ing how I got your email address from USA online yellow page. God bless you=
 as you help me.</span></div>
<div><span style=3D"font-family: Calibri, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);"><br>
</span></div>
<div><span style=3D"font-family: Calibri, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);"><br>
</span></div>
<div><span style=3D"font-family: Calibri, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);"><br>
</span></div>
<div><span style=3D"font-family: Calibri, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);">Some money in various currencies was discovere=
d in barrels at a farmhouse near one of Saddam's old palaces in Tikrit-Iraq=
 during a rescue operation while I
 was still serving in Iraq some years ago and it was agreed by Sgt. Duff an=
d I that some part of this money be shared among both of us before informin=
g anybody about it since both of us saw the money first. This was quite an =
illegal thing to do, but I tell
 you what? No compensation can make up for the risk we have taken with our =
lives.</span></div>
<div><span style=3D"font-family: Calibri, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);"><br>
</span></div>
<div><span style=3D"font-family: Calibri, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);"><br>
</span></div>
<div><span style=3D"font-family: Calibri, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);">The above figure was given to me as my share, =
and to conceal this kind of money became a problem for me, so with the help=
 of a British contact working with
 us and his office enjoy some immunity, I was able to move the money to a s=
ecurity company in SOUTH AFRICA as a diplomatic baggage. They are now waiti=
ng for us to provide the name of beneficiary who they will transfer the fun=
ds to. The reason I want you to
 claim the funds on my behalf is that as a soldier, I cannot present concre=
te evidence on how I made such a big amount of money. &nbsp;</span></div>
<div><span style=3D"font-family: Calibri, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);"><br>
</span></div>
<div><span style=3D"font-family: Calibri, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);"><br>
</span></div>
<div><span style=3D"font-family: Calibri, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);"><br>
</span></div>
<div><span style=3D"font-family: Calibri, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);">The moment I'm sure that you will assist me, I=
 will let you know where I'm currently receiving treatment and I will also =
give you the information of the security
 company and the security code of the baggage. I want you to tell me how mu=
ch you will take from this money for the assistance you will give to me. On=
e passionate appeal I will make to you is not to discuss this matter with a=
nybody, should you have reasons
 to reject this offer, please and please destroy this message as any leakag=
e of this information will be too bad for me. I do not know how long I will=
 remain here at the hospital; I honestly want this matter to be resolved im=
mediately, please contact me as
 soon as possible, All correspondence must be by my Private mail address E-=
mail : &nbsp;mrsrebeccasc1234@gmail.com</span></div>
<div><span style=3D"font-family: Calibri, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);"><br>
</span></div>
<div><span style=3D"font-family: Calibri, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);"><br>
</span></div>
<div><span style=3D"font-family: Calibri, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);">Thanks for your anticipated co-operation and m=
y regards to your family.</span></div>
<div><span style=3D"font-family: Calibri, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);"><br>
</span></div>
<div><span style=3D"font-family: Calibri, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);"><br>
</span></div>
<div><span style=3D"font-family: Calibri, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);">Yours Faithfully</span></div>
<div><span style=3D"font-family: Calibri, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);">FROM.MRS. REBECCA SCHIEBLE.</span></div>
<div><span style=3D"font-family: Calibri, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);"><br>
</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Helvetic=
a, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">FOR GOD SAKE, YOUR UR=
GENT REPLY IS NEEDED</span></div>
</body>
</html>

--_000_AM9P195MB110918C7EEBCFEBFE03DCC41B4B8AAM9P195MB1109EURP_--
