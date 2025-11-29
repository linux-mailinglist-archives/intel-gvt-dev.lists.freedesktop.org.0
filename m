Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21787C93FE4
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 29 Nov 2025 15:33:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC00E10E200;
	Sat, 29 Nov 2025 14:33:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=aruba.it header.i=@aruba.it header.b="CX12O3Nl";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from tn02out-b2.aruba.it (tn02out-b1.aruba.it [217.61.8.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B13C10E200
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 29 Nov 2025 14:33:53 +0000 (UTC)
Received: from localhost ([217.61.8.72]) by Consip with ESMTP
 id PM1Fvds8jFdIAPM1FvhSlJ; Sat, 29 Nov 2025 15:33:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1764426830; bh=FV07KrG7JN0pxKJ5G49PfuZ9YIKe2+l3Sg+wLCWvc7Q=;
 h=Date:From:Subject:MIME-Version:Content-Type;
 b=CX12O3NlWrfOeA1oFjIDougpzho8KkRO/XhXMwGe52+f7zHWqRu0kZ2BUnP22Jyzx
 5pzBSZMvvBq/RXuSGNWCshMTyPgZwpvd8midQIsdBhM5FBF5AzV1kefclsdBPv+qsr
 o2ViEDZ8gJhSuez6szrsDkQiN8YZtv7zN+NRGUdgh1EmJZo4EKvjVwMlD530WRpNKx
 MwPjMJBRf6lbmq4Pd/+swXKw9Y6QjJdKrn7D8j9YF8oHvYkpEIs2JY8pujZUAf23ho
 HJk4JuRQG+2Ncwo3B5y13j3/MvqgmksgpTRfXCpeuxq3cQXayVr7QxP2zQcaXsA2u+
 0eXL6vBm9ug6A==
Received: from zspmta-mint03.ad.aruba.it ([127.0.0.1])
 by localhost (zspmta-mint03.ad.aruba.it [127.0.0.1]) (amavis, port 10026)
 with ESMTP id qev8dGvrkAhY; Sat, 29 Nov 2025 15:33:49 +0100 (CET)
Received: from zspmbx-mint11.ad.aruba.it (unknown [10.202.133.51])
 by zspmta-mint03.ad.aruba.it (Postfix) with ESMTP id 4A68C1213D7;
 Sat, 29 Nov 2025 15:33:38 +0100 (CET)
Date: Sat, 29 Nov 2025 15:33:37 +0100 (CET)
From: "graziagiuseppa.morabito@interno.it" <graziagiuseppa.morabito@interno.it>
Message-ID: <1031881686.10184084.1764426817995.JavaMail.zimbra@interno.it>
Subject: 
MIME-Version: 1.0
Content-Type: multipart/alternative; 
 boundary="=_3c71d475-7ceb-45c9-9993-c09177e7306f"
X-Originating-IP: [105.112.213.225]
X-Mailer: Zimbra 10.1.10_GA_4785 (ZimbraWebClient - GC142
 (Win)/10.1.10_GA_4785)
Thread-Index: UFdzPZ170ZVOpUzspe38DOGNbxTuQQ==
Thread-Topic: 
X-CMAE-Envelope: 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
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
Reply-To: "Hr. Charles Jackson Jr." <ferassutti34@gmail.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--=_3c71d475-7ceb-45c9-9993-c09177e7306f
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



Hvorfor har du ikke modtaget donationen p=C3=A5 =E2=82=AC955.000,00 fra hr.=
 Charles Jackson Jr.? Bankdirekt=C3=B8ren informerede mig i g=C3=A5r om, at=
 en af =E2=80=8B=E2=80=8Bmodtagerne ikke havde gjort krav p=C3=A5 donatione=
n. Efter at have gennemg=C3=A5et mine optegnelser opdagede jeg, at du var b=
landt de ber=C3=B8rte, og jeg er meget ked af at h=C3=B8re dette. Bem=C3=A6=
rk venligst, at der ikke kr=C3=A6ves nogen betaling; et simpelt bekr=C3=A6f=
telsesstempel er alt, hvad der skal til for at pengene kan frigives og kred=
iteres din bankkonto inden for 24 timer.=20

Bem=C3=A6rk: For yderligere information og for at sikre, at din donation kr=
editeres inden for 24 timer, anbefaler jeg, at du sender mig dine oplysning=
er med det samme via e-mail til ferassutti34@gmail.com=20

Jeg =C3=B8nsker dig en velsignet m=C3=A5ned med stor succes.=20
Hr. Charles Jackson Jr.=20

--=_3c71d475-7ceb-45c9-9993-c09177e7306f
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><body><div style=3D"font-family: arial, helvetica, sans-serif; font-s=
ize: 12pt; color: #000000"><div><br></div><div><br></div><div data-marker=
=3D"__SIG_PRE__">Hvorfor har du ikke modtaget donationen p=C3=A5 =E2=82=AC9=
55.000,00 fra hr. Charles Jackson Jr.? Bankdirekt=C3=B8ren informerede mig =
i g=C3=A5r om, at en af =E2=80=8B=E2=80=8Bmodtagerne ikke havde gjort krav =
p=C3=A5 donationen. Efter at have gennemg=C3=A5et mine optegnelser opdagede=
 jeg, at du var blandt de ber=C3=B8rte, og jeg er meget ked af at h=C3=B8re=
 dette. Bem=C3=A6rk venligst, at der ikke kr=C3=A6ves nogen betaling; et si=
mpelt bekr=C3=A6ftelsesstempel er alt, hvad der skal til for at pengene kan=
 frigives og krediteres din bankkonto inden for 24 timer.<br><br>Bem=C3=A6r=
k: For yderligere information og for at sikre, at din donation krediteres i=
nden for 24 timer, anbefaler jeg, at du sender mig dine oplysninger med det=
 samme via e-mail til ferassutti34@gmail.com<br><br>Jeg =C3=B8nsker dig en =
velsignet m=C3=A5ned med stor succes.<br>Hr. Charles Jackson Jr.</div></div=
></body></html>
--=_3c71d475-7ceb-45c9-9993-c09177e7306f--
