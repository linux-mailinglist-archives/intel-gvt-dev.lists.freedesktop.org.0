Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D40979A9B
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 16 Sep 2024 07:10:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC30210E09D;
	Mon, 16 Sep 2024 05:10:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=patrimoniocultural.gob.ec header.i=@patrimoniocultural.gob.ec header.b="riwlTHH4";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
X-Greylist: delayed 10068 seconds by postgrey-1.36 at gabe;
 Mon, 16 Sep 2024 05:09:59 UTC
Received: from mail.patrimoniocultural.gob.ec
 (188.16.152.190.static.anycast.cnt-grms.ec [190.152.16.188])
 by gabe.freedesktop.org (Postfix) with ESMTP id D2C6B10E09D;
 Mon, 16 Sep 2024 05:09:59 +0000 (UTC)
Received: from patrimoniocultural.gob.ec (patrimoniocultural.gob.ec
 [172.16.1.216])
 by mail.patrimoniocultural.gob.ec (Postfix) with ESMTP id E444C1CBFE0;
 Sun, 15 Sep 2024 19:14:56 -0500 (-05)
Received: from localhost (localhost [127.0.0.1])
 by patrimoniocultural.gob.ec (Postfix) with ESMTP id 014102350D636;
 Sun, 15 Sep 2024 19:32:36 -0500 (-05)
Received: from patrimoniocultural.gob.ec ([127.0.0.1])
 by localhost (patrimoniocultural.gob.ec [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 9eQMMGYNPGYZ; Sun, 15 Sep 2024 19:32:36 -0500 (-05)
Received: from localhost (localhost [127.0.0.1])
 by patrimoniocultural.gob.ec (Postfix) with ESMTP id 5AB8823513EF4;
 Sun, 15 Sep 2024 19:32:33 -0500 (-05)
DKIM-Filter: OpenDKIM Filter v2.10.3 patrimoniocultural.gob.ec 5AB8823513EF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=patrimoniocultural.gob.ec; s=63CF141A-A31B-11ED-B306-67065D75D749;
 t=1726446754; bh=4VenDKla5aFUDF7KkEzn+mJSm7/lBB+GkDSEG9fMSQg=;
 h=Date:From:Message-ID:MIME-Version;
 b=riwlTHH4MWRMrInagzSZQR/YsjbGM/p2zaqMWXdpy3d9iND8njNzY0FdZALfWH/UO
 usdN0gyTQgWajt8oW3F3QMVmETIMh4gI/LxergfNopLYT2zTJDwDQjmS9OLyS6SGUb
 Xh1JGlezA+rDs17IN+Ts12vi4E8AqilW6rQ0tjuQhI8RvmjPJaYO7mY4slNETzUJu+
 dIZwJlLz+/CLAonpJvinHfv0e9FDKLT80aJ4BOTmxLu1ltHdM77dsF5StW2ukUxV0R
 S21oKu/xIYVnB78s+BSy6iUkOFSBmQYjS1mvRTzqX7keFcqaaLNh1+g2cfI3X66S47
 v+z4fia2vPP4w==
X-Virus-Scanned: amavisd-new at patrimoniocultural.gob.ec
Received: from patrimoniocultural.gob.ec ([127.0.0.1])
 by localhost (patrimoniocultural.gob.ec [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id EVP5ggmoNGmn; Sun, 15 Sep 2024 19:32:33 -0500 (-05)
Received: from patrimoniocultural.gob.ec (patrimoniocultural.gob.ec
 [172.16.1.216])
 by patrimoniocultural.gob.ec (Postfix) with ESMTP id BC2B72350D61D;
 Sun, 15 Sep 2024 19:32:22 -0500 (-05)
Date: Sun, 15 Sep 2024 19:32:22 -0500 (ECT)
From: Sigmund Philomena <karina.fonseca@patrimoniocultural.gob.ec>
Message-ID: <607247549.2077681.1726446742532.JavaMail.zimbra@patrimoniocultural.gob.ec>
Subject: 
MIME-Version: 1.0
Content-Type: multipart/alternative; 
 boundary="=_8aff4636-9b31-4fe1-9222-5d0dc40214f0"
X-Originating-IP: [102.129.152.45]
X-Mailer: Zimbra 9.0.0_ZEXTRAS_20220713 (ZimbraWebClient - FF130
 (Win)/9.0.0_ZEXTRAS_20220713)
Thread-Index: yfBk8r2SQL5BC8pckVR0uuiNZMyKqg==
Thread-Topic: 
X-eerssa-MailScanner-Information: Please contact the ISP for more information
X-eerssa-MailScanner-ID: E444C1CBFE0.A99FC
X-eerssa-MailScanner: Found to be clean
X-eerssa-MailScanner-From: karina.fonseca@patrimoniocultural.gob.ec
X-Spam-Status: No
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
Reply-To: Sigmund Philomena <philomenahilliardsigmund@gmail.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--=_8aff4636-9b31-4fe1-9222-5d0dc40214f0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable




Your email address. was randomly selected to receive a donation of $1,300,0=
00.00=20

Bitte best=C3=A4tigen Sie, dass Sie Eigent=C3=BCmer Ihrer E-Mail-Adresse si=
nd. Sie wurde nach der elektronischen Spinball-Ziehung per Zufallsprinzip a=
usgew=C3=A4hlt, um eine Spende in H=C3=B6he von $1,300,000.00 US-Dollar (ei=
ne Million dreihunderttausend Dollar) von der Philomena Hilliard Sigmund Fo=
undation zu erhalten. Ich erwarte Ihre Antwort nach dem Lesen dieser E-Mail=
....=20

--=20
Este mensaje ha sido analizado por MailScanner
en busca de virus y otros contenidos peligrosos,
y se considera que est=E1 limpio.



--=_8aff4636-9b31-4fe1-9222-5d0dc40214f0
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><body><div style=3D"font-family: arial, helvetica, sans-serif; font-s=
ize: 12pt; color: #000000"><div><br></div><div><br></div><div data-marker=
=3D"__SIG_PRE__"><br>Your email address. was randomly selected to receive a=
 donation of $1,300,000.00<br><br>Bitte best=C3=A4tigen Sie, dass Sie Eigen=
t=C3=BCmer Ihrer E-Mail-Adresse sind. Sie wurde nach der elektronischen Spi=
nball-Ziehung per Zufallsprinzip ausgew=C3=A4hlt, um eine Spende in H=C3=B6=
he von $1,300,000.00 US-Dollar (eine Million dreihunderttausend Dollar) von=
 der Philomena Hilliard Sigmund Foundation zu erhalten. Ich erwarte Ihre An=
twort nach dem Lesen dieser E-Mail....</div></div><br />--=20
<br />Este mensaje ha sido analizado por=20
<a href=3D"http://www.mailscanner.info/"><b>MailScanner</b></a>
<br />en busca de virus y otros contenidos peligrosos,
<br />y se considera que est&aacute; limpio.
</body></html>

--=_8aff4636-9b31-4fe1-9222-5d0dc40214f0--
