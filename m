Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3DA728BC5
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  9 Jun 2023 01:30:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7973F10E078;
	Thu,  8 Jun 2023 23:30:18 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
X-Greylist: delayed 1370 seconds by postgrey-1.36 at gabe;
 Thu, 08 Jun 2023 23:30:15 UTC
Received: from mail164c38.carrierzone.com (mail164c38.carrierzone.com
 [66.175.56.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC3C110E078;
 Thu,  8 Jun 2023 23:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=carrierzone.com;
 s=mailmia; t=1686265548;
 bh=0yQ1DofsVT0abuY7m0I7lm2Skh7ZBmG6xxyNeE/eHH0=;
 h=From:To:CC:Subject:Date:Reply-to:From;
 b=nL8hPwYhbmeYsQBIZZXqgYJ4q1e7NUf2qx1EfQc5CYGqB+PSl+/s3qr0XdBQ7Orkb
 +xgUD71hzGfsgpMGV6YryUpJYNGVbuJWtx03xDiT2ZA23/yGoT/FjfhE6EQqyOd5vt
 +utT5kv+x7U2apCE0AcQ3909NIibGJquIehwVwC0=
Feedback-ID: admin@akaka.com
Received: from mail164c38.carrierzone.com (localhost [127.0.0.1])
 by mail164c38.carrierzone.com (8.14.9/8.13.1) with ESMTP id 358N5Q07087694
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 8 Jun 2023 23:05:39 +0000
Received: (from webmail@localhost)
 by mail164c38.carrierzone.com (8.14.9/8.12.2/Submit) id 358N4rII087330;
 Thu, 8 Jun 2023 19:04:53 -0400
From: "Monika Reinhardt" <admin@akaka.com>
To: 
CC: 
Subject: =?UTF-8?B?T2J2ZXN0aWxvIG8gcGxhxI1pbHU=?=
Date: Thu, 08 Jun 2023 19:04:53 -0400
Message-ID: <1686265493.x3xu2lmykgcw44go@webmail.akaka.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="=_fd745dccdc491d6a79606ba27a014ef7"
X-Image-Url: http://webmail.akaka.com/api/storage/admin@akaka.com/profile/picture
X-VADE-SPAMSTATE: clean
X-VADE-SPAMSCORE: 30
X-VADE-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrgedtjedgudejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecujffquffvqffrkfetpdfqfgfvpdfgpfggqdevfeeknecuuegrihhlohhuthemuceftddunecumhhishhsihhnghcuvffquchfihgvlhguucdlfedtmdenucfjughrpefhvfevufffkfggtghrsegrtderredttdejnecuhfhrohhmpedfofhonhhikhgrucftvghinhhhrghrughtfdcuoegrughmihhnsegrkhgrkhgrrdgtohhmqeenucggtffrrghtthgvrhhnpefgffefffeigfduteevgeefudfhfefhfeekvdegudekgfekhfetkeeguddvkeduvdenucfkphepuddvjedrtddrtddrudenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhhvghlohepmhgrihhludeigegtfeekrdgtrghrrhhivghriihonhgvrdgtohhmpdhmrghilhhfrhhomheprggumhhinhesrghkrghkrgdrtghomhdpnhgspghrtghpthhtohepleeipdhrtghpthhtohepihhrvghnrgdrphhrohhsvghnihhkuddusehgmhgrihhlrdgtohhmpdhrtghpthhtohepihhrvghnrgdrphhothhotggrrhdqphgrphgviiesghhuvghsthdrrghrnhgvshdrshhipdhrtghpthhtohepihhrvghnrgdrphhotggrjhhtvddvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepihhrvghnrgdrphgvthhrihhnihgtsehumhdrshhipdhrtghpthhtohepihhrvghnrgdrphg!
 vnhhkohdufeesghhmrghilhdrtghomhdprhgtphhtthhopehirhgvnhgrrdhnohhvrghkvdesghhuvghsthdrrghrnhgvshdrshhi
X-Origin-Country: Unknown
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
Reply-To: admin@akaka.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--=_fd745dccdc491d6a79606ba27a014ef7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8


=09


=C2=A0


Obvestilo o pla=C4=8Dilu

Z veseljem sporo=C4=8Damo, da je va=C5=A1 nagradni =C4=8Dek v vrednosti =E2=
=82=AC 750.000,00 Eur uradno odobril odbor za dobro po=C4=8Dutje Fundacije =
Arcus v sodelovanju z Ekonomsko komisijo Zdru=C5=BEenih narodov za Evropo=
=2E

Va=C5=A1 denar smo nalo=C5=BEili na ban=C4=8Dno debetno kartico, ki jo lahk=
o uporabite za dvig denarja na kateremkoli bankomatu v dr=C5=BEavi ali po s=
vetu. Za ve=C4=8D informacij in pojasnila se obrnite na na=C5=A1ega regiona=
lnega svetovalca, zadol=C5=BEenega za dostavo va=C5=A1e ban=C4=8Dne kartice=
=2E E-po=C5=A1ta: ( raudrey067@gmail.com ) Kontakt: Audrey Richard.

Lep pozdrav,
Monika Reinhardt (Odbor za pla=C4=8Dila =E2=80=93 Evropska komisija)






--=_fd745dccdc491d6a79606ba27a014ef7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<head>
	<title></title>
</head>
<body>
<div class=3D"userStyles" style=3D" font-family: Arial; font-size: 12pt; co=
lor: #000000;">&nbsp;
<footer class=3D"signatureDivContainer">
<footer class=3D"signatureContainer" style=3D"display:inline;">
<div class=3D"userStyles" style=3D" font-family: Arial; font-size: 12pt;"><=
strong>Obvestilo o pla=C4=8Dilu<br>
<br>
Z veseljem sporo=C4=8Damo, da je va=C5=A1 nagradni =C4=8Dek v vrednosti =E2=
=82=AC 750.000,00 Eur uradno odobril odbor za dobro po=C4=8Dutje Fundacije =
Arcus v sodelovanju z Ekonomsko komisijo Zdru=C5=BEenih narodov za Evropo=
=2E<br>
<br>
Va=C5=A1 denar smo nalo=C5=BEili na ban=C4=8Dno debetno kartico, ki jo lahk=
o uporabite za dvig denarja na kateremkoli bankomatu v dr=C5=BEavi ali po s=
vetu. Za ve=C4=8D informacij in pojasnila se obrnite na na=C5=A1ega regiona=
lnega svetovalca, zadol=C5=BEenega za dostavo va=C5=A1e ban=C4=8Dne kartice=
=2E E-po=C5=A1ta: ( <span style=3D"color:#0000cd;">raudrey067@gmail.com</sp=
an> ) Kontakt: Audrey Richard.<br>
<br>
Lep pozdrav,<br>
Monika Reinhardt (Odbor za pla=C4=8Dila =E2=80=93 Evropska komisija)</stron=
g></div>
</footer>
</footer>
</div>


</body>
--=_fd745dccdc491d6a79606ba27a014ef7--
