Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC71E63CD2D
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 30 Nov 2022 03:11:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A74A810E40C;
	Wed, 30 Nov 2022 02:11:05 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
X-Greylist: delayed 2597 seconds by postgrey-1.36 at gabe;
 Wed, 30 Nov 2022 02:10:59 UTC
Received: from outgoing19.jnb.host-h.net (outgoing19.jnb.host-h.net
 [129.232.250.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AACAE10E40C
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 30 Nov 2022 02:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=lensmedia.co.za; s=xneelo; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-ID:Subject:From:To:Date:reply-to:sender:cc:bcc:
 in-reply-to:references; bh=EvPRin6Yj/ATqgblhAKkA6q3l7C85h80615fhkpwstY=; b=qE
 s0dMQTZkZaWJuHf7oGIhuIhn45cCMMV7pmdXew+K5m3O49+g4VLUCJw19txhrUlL00/yXf/qia5Dw
 uVWJDT3rZELX3pgL+yaT6JobXrTlAm6rVwcLj1qWn4He+5xtN7RyI3dBZkBX0JHolmsHMBT2yq4Yh
 tRJQksXPDgocZyN20aak+W9HCjve8zFZ9a6K8y3OeKcaPqXOMcXmnJmlCHKDA9U0WteB+aUcO8n5w
 fxGNT3wV73ftTQSv+OIyUOIdnUOo0kCzniazZafqeSAeV/srwsDEPBFP8He/TLWh4Vim+3V40HQey
 fJJqGRLhHkG8m0O93WSm9y9pIMf1POGA==;
Received: from dedi636.jnb1.host-h.net ([196.22.132.57])
 by antispam9-jnb1.host-h.net with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <Internet@lensmedia.co.za>)
 id 1p0Bso-0002Yq-J6
 for intel-gvt-dev@lists.freedesktop.org; Wed, 30 Nov 2022 03:27:38 +0200
Received: from localhost ([127.0.0.1] helo=dedi636.jnb1.host-h.net)
 by dedi636.jnb1.host-h.net with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <Internet@lensmedia.co.za>) id 1p0Bso-000EUa-9W
 for intel-gvt-dev@lists.freedesktop.org; Wed, 30 Nov 2022 03:27:30 +0200
Received: from lensmztdjg by dedi636.jnb1.host-h.net with local (Exim 4.92)
 (envelope-from <lensmztdjg@dedi636.jnb1.host-h.net>)
 id 1p0Bso-000ETr-0h
 for intel-gvt-dev@lists.freedesktop.org; Wed, 30 Nov 2022 03:27:30 +0200
Date: Wed, 30 Nov 2022 03:25:19 +0200
To: intel-gvt-dev@lists.freedesktop.org
From: DHL-Express <Internet@lensmedia.co.za>
Subject: Your package cannot be delivered
Message-ID: <c2b8f1643f73459d5050f565b9b85e65@lensmedia.co.za>
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="124a4b5d8bd11cf2a218592acce53aa55"
Content-Transfer-Encoding: 8bit
X-Hetz-Sender-Domain: lensmedia.co.za
X-Originating-IP: 196.22.132.57
X-SpamExperts-Domain: lensmedia.co.za
X-SpamExperts-Username: 
Authentication-Results: host-h.net;
 auth=pass (login) smtp.auth=@lensmedia.co.za
X-SpamExperts-Outgoing-Class: unsure
X-SpamExperts-Outgoing-Evidence: Combined (0.81)
X-Recommended-Action: accept
X-Filter-ID: Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT9q8PrFAnbsj50pUURKgi2aPUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5zuw9h+h1zAannW6FFT1C8uV7/OA1M1ilNEwd/bINE37qFE
 3UJM4cFl+Iid+N6xLmFai5MjPVyFxwAbmfp+17aUWmuNA8WTybi1JN85FSnfKXag7nPZUtzcfvYi
 hWfaqKCK0oBJIaHrWJ0ZbgJRVI6RhXMC28WAGepq/v9A4gBVugpNOFKJpYWkZg1qPFOL2TGDwIE7
 VKe+bqpcdCns72R1B7dar1wNxu6xE2A4Gsspb3a3r8jjhRlx/iI1P2HBJWEtJ/urtexBTb2Nca1c
 RzjI3WlqJWhCKKDbv2ECuYRrNDxIPj1UU4msT2Odp9D6f/Om/kpOWQV1ILff1+qZar/CZdONW7YG
 NNLfGcEBhKT67icUDW+Tpjocs9HiN4W5TUJjjQ56IlYT0gVjAFDCZFtHcd3QbXHil9nVohJvu6B5
 vcQRHhpp7PEHhQA50A063668oneXkEyLK/B42pisdQETK48zBUFiTBZlsVonx1/dsGsijmyF6Za6
 LdlLbOK0zbWbtFWEMLqsZqM85AyyKVDKBkiY9v1Rlez6jmoRl5GlOLcFP/Fxqx7uULDQRB3NLRDf
 I1lAPXjqjTpMLQX5p6BHe2fwydFpmfqvw5lAMdbfJv/Vev9mUbCAAj8t5LdZMccHmFDqewO9xyOq
 CYO8P1aHRB5rpYuB1nPCWQBPaZ4BpBwL2YRMn3o87RrSLrmklZF4SK/s++2UNA3w+qb96T2Nfq7q
 DjbjfGCWL25yVReVWtlyk+AQkotsPJoL8t0u+9gdTbcFXu2B6nVeCB62JqLE+lUH2/3NjSHxqwRi
 ZsYawpv7+PEawVYojJIqBdT0K3k5CGAwgKZO6iiRzn3E+5RJZNme6ty1U6+uKYFyh4suOGrSgbfq
 Uu/AvGOXcseHED3t+6obJL6EKDZrBJjC8BbyQ/pnESFS5Z4igQsZZMOCrDbI9GTcfUTgA1F03UGU
 8jnPmYYn3IfEbwlHKDdrfjaSfEPFr2oCJea7Q9gw0YpPuQ==
X-Report-Abuse-To: spam@antispammaster.host-h.net
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

--124a4b5d8bd11cf2a218592acce53aa55
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit




	



DHL Express

 

Hi,


 

We inform you that your shipment No 54960131540 is still awaiting instructions from you.

 

You have to pay the additional shipping fees to ship your parcel as soon as possible.

 

As soon as we receive your additional shipping fees we’ll be in touch to arrange delivery.

 

 

 Start Delivery


 

Reminder : This procedure is mandatory to prevent your package from being returned to the sender

 
Your goods are at our warehouse.

Kind regards
Customer Support




--124a4b5d8bd11cf2a218592acce53aa55
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<!doctype html>
<html>
<head>
=09<title></title>
</head>
<body>
<div align=3D"left" style=3D"font-family: Verdana; border: 0px; font-stretc=
h: inherit; font-size: 15px; line-height: inherit;">
<p style=3D"box-sizing: border-box; line-height: normal; margin: 1em 0px; p=
adding: 0px; border-width: 0px;"><span style=3D"color: rgb(153, 0, 0);"><sp=
an style=3D"font-size: 48px;"><span style=3D"font-family: arial, helvetica,=
 sans-serif;"><strong style=3D"box-sizing: border-box; font-stretch: inheri=
t; margin: 0px; padding: 0px; border-width: 0px;">DHL Express</strong></spa=
n></span></span></p>

<p style=3D"box-sizing: border-box; line-height: normal; margin: 1em 0px; p=
adding: 0px; border-width: 0px;">=C2=A0</p>

<p style=3D"box-sizing: border-box; line-height: normal; margin: 1em 0px; p=
adding: 0px; border-width: 0px;"><strong style=3D"box-sizing: border-box; f=
ont-stretch: inherit; margin: 0px; padding: 0px; border-width: 0px;">Hi,</s=
trong></p>
</div>

<div align=3D"left" style=3D"font-family: Verdana; border: 0px; font-stretc=
h: inherit; font-size: 15px; line-height: inherit;">=C2=A0</div>

<div align=3D"left" style=3D"font-family: Verdana; border: 0px; font-stretc=
h: inherit; font-size: 15px; line-height: inherit;">We inform you that your=
 shipment=C2=A0<strong style=3D"box-sizing: border-box; font-stretch: inher=
it; margin: 0px; padding: 0px; border-width: 0px;"><span style=3D"border: 0=
px; font-weight: normal; font-stretch: inherit; font-size: inherit; line-he=
ight: normal; font-family: inherit; margin: 0px; padding: 0px; vertical-ali=
gn: baseline; box-sizing: border-box; color: inherit;">No</span></strong>=
=C2=A0<span style=3D"color: rgb(153, 0, 0);"><a href=3D"https://loyalfiling=
s.com/wp-content/indexxxx.php"><strong style=3D"box-sizing: border-box; fon=
t-stretch: inherit; margin: 0px; padding: 0px; border-width: 0px;"><span st=
yle=3D"border: 0px; font-weight: normal; font-stretch: inherit; font-size: =
inherit; line-height: normal; font-family: inherit; margin: 0px; padding: 0=
px; vertical-align: baseline; box-sizing: border-box;">54960131540</span></=
strong></a>=C2=A0</span>is still awaiting instructions from you.</div>

<div align=3D"left" style=3D"font-family: Verdana; border: 0px; font-stretc=
h: inherit; font-size: 15px; line-height: inherit;">=C2=A0</div>

<div align=3D"left" style=3D"font-family: Verdana; border: 0px; font-stretc=
h: inherit; font-size: 15px; line-height: inherit;">You have to pay the add=
itional shipping fees to ship your parcel as soon as possible.</div>

<div align=3D"left" style=3D"font-family: Verdana; border: 0px; font-stretc=
h: inherit; font-size: 15px; line-height: inherit;">=C2=A0</div>

<div align=3D"left" style=3D"font-family: Verdana; border: 0px; font-stretc=
h: inherit; font-size: 15px; line-height: inherit;">As soon as we receive y=
our additional shipping fees we=E2=80=99ll be in touch to arrange delivery.=
</div>

<div align=3D"left" style=3D"font-family: Verdana; border: 0px; font-stretc=
h: inherit; font-size: 15px; line-height: inherit;">=C2=A0</div>

<div align=3D"left" style=3D"font-family: Verdana; border: 0px; font-stretc=
h: inherit; font-size: 15px; line-height: inherit;">=C2=A0</div>

<div align=3D"left" style=3D"font-family: Verdana; border: 0px; font-stretc=
h: inherit; font-size: 15px; line-height: inherit;"><span style=3D"border: =
0px; font: inherit; margin: 0px; padding: 0px; vertical-align: baseline; co=
lor: inherit; box-sizing: border-box;">=C2=A0<a href=3D"https://loyalfiling=
s.com/wp-content/indexxxx.php" style=3D"border: 0px none; font: inherit; ma=
rgin: 0px; padding: 12px 24px; vertical-align: baseline; box-sizing: border=
-box; background-position: 0px 0px; color: rgb(255, 255, 255); background-c=
olor: rgb(168, 15, 15);" target=3D"_blank"><span style=3D"border: 0px; font=
: inherit; margin: 0px; padding: 0px; vertical-align: baseline; color: inhe=
rit; box-sizing: border-box;">Start Delivery</span></a></span></div>

<div align=3D"left" style=3D"font-family: Verdana; border: 0px; font-stretc=
h: inherit; font-size: 15px; line-height: inherit;">
<p align=3D"left" style=3D"box-sizing: border-box; line-height: normal; mar=
gin: 1em 0px; padding: 0px; border-width: 0px;">=C2=A0</p>

<p align=3D"left" style=3D"box-sizing: border-box; line-height: normal; mar=
gin: 1em 0px; padding: 0px; border-width: 0px;"><span style=3D"color: rgb(1=
53, 0, 0);"><strong style=3D"color: rgb(255, 0, 0); font-family: arial, hel=
vetica, sans-serif; font-size: 18px;">Reminder : This procedure is mandator=
y to prevent your package from being returned to the sender</strong></span>=
</p>

<p style=3D"box-sizing: border-box; line-height: normal; margin: 1em 0px; p=
adding: 0px; border-width: 0px;">=C2=A0</p>
Your goods are at our warehouse.

<p style=3D"box-sizing: border-box; line-height: normal; margin: 1em 0px; p=
adding: 0px; border-width: 0px;">Kind regards<br style=3D"box-sizing: borde=
r-box;" />
<a href=3D"https://loyalfilings.com/wp-content/indexxxx.php">Customer Suppo=
rt</a></p>
</div>
</body>
</html>


--124a4b5d8bd11cf2a218592acce53aa55--
