Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPO5AuSMjWnq3wAAu9opvQ
	(envelope-from <intel-gvt-dev-bounces@lists.freedesktop.org>)
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 12 Feb 2026 09:18:44 +0100
X-Original-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 674B312B312
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 12 Feb 2026 09:18:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AF2C10E6F5;
	Thu, 12 Feb 2026 08:18:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=mytuike.net header.i=jhaller@mytuike.net header.b="CbCWdagz";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
X-Greylist: delayed 6589 seconds by postgrey-1.36 at gabe;
 Thu, 12 Feb 2026 08:18:40 UTC
Received: from mta.mail9.cloud-hosting.sntianye.net
 (mta.mail9.cloud-hosting.sntianye.net [185.221.223.232])
 by gabe.freedesktop.org (Postfix) with ESMTP id 17D0910E6F5
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 12 Feb 2026 08:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=dkim; d=mytuike.net;
 h=From:To:Message-ID:Reply-To:Subject:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:List-ID:List-Unsubscribe;
 i=jhaller@mytuike.net; 
 bh=4zOR71a8BbHk0U6WieyynXijfuxVMcXhDCWp/7WBIyE=;
 b=CbCWdagzDVoFX6BJGwCPaROhloteXmtue7TtS6YRggyROofxwiqYBqrwoHEbPgUUwQLvOQewijd2
 3nyfKnbCvVbUVbYZxaQLgSUAH6RwbNEdm1NFGyy86ml6l0DvTr9Bc4IH1Vw8v2TtXeZJqMYx1oxu
 r6ZZWNBRf5+1hWi5X0imrmdgQWlrHBdt82f3ZZp1EGHxulGthsSZR990qJDDOJHBaZPdV5BgcMlm
 uZ3my7r853TKzGGH60HEXm5malZ9Bh865u+4kgpfpFd4U2t+75qiMQvfX7RiZlbOzOvcgszJkvhr
 S5DJ8kuAxsvRgaq0Z6uKeZbdF2FKE+IdbHM5nA==
From: "Felix Ulrich" <jhaller@mytuike.net>
To: intel-gvt-dev@lists.freedesktop.org
Message-ID: <JI=ztBLYjXQO8FDMJPN4SOdvMQP3Itx1I7Fg4gFXpzxXGg=m@likecode.com>
Subject: =?UTF-8?B?RS1CaWtlIFNvcnRpbWVudCBmw7xyIDIwMjYsIGFiIExhZ2VyIHZlcmbDvGdiYXIgLSBFLWJpa2UgbGluZXVwIGZvciAyMDI2LCBhdmFpbGFibGUgZnJvbSBzdG9jaw==?=
Date: Thu, 12 Feb 2026 04:28:05 +0100
MIME-Version: 1.0
Content-Type: multipart/alternative; charset="UTF-8";
 boundary="b1_13b703e9ba761af621265093896ce268"
Content-Transfer-Encoding: quoted-printable
X-MC-User: 981dab3bcab30bae
X-MC-Track: opens,clicks_all
X-Campaign: likecode-35488726
X-campaignid: 14bcecc3cce0a52451cfcff6
Feedback-ID: 8983:35488726:mc:likecode
List-Unsubscribe-Post: List-Unsubscribe=One-Click
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
Reply-To: verkauf@mytuike.net
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.92 / 15.00];
	URI_COUNT_ODD(1.00)[1];
	SUSPICIOUS_URL_IN_SUSPICIOUS_MESSAGE(1.00)[];
	R_DKIM_REJECT(1.00)[mytuike.net:s=dkim];
	R_MIXED_CHARSET(0.53)[subject];
	URIBL_RED(0.50)[mytuike.net:replyto];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[mytuike.net : SPF not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_ANON_DOMAIN(0.10)[];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	HAS_PHPMAILER_SIG(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCPT_COUNT_ONE(0.00)[1];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[verkauf@mytuike.net];
	RCVD_COUNT_TWO(0.00)[2];
	REPLYTO_DOM_EQ_FROM_DOM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jhaller@mytuike.net,intel-gvt-dev-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mytuike.net:-];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[intel-gvt-dev];
	PREVIOUSLY_DELIVERED(0.00)[intel-gvt-dev@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	R_SPF_ALLOW(0.00)[+ip4:131.252.210.177:c];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mytuike.net:replyto,likecode.com:mid]
X-Rspamd-Queue-Id: 674B312B312
X-Rspamd-Action: no action

--b1_13b703e9ba761af621265093896ce268
Content-Type: text/plain; format=flowed; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

EU 250W E-Bike Angebot=0A=0ANeue E=E2=80=91Bike Modelle =E2=80=93 250W/25 k=
m/h, ab deutschem Lager=0AGuten Tag, hier ist Horizon Cycle Supply.=0A=0AWi=
r k=C3=B6nnen EU=E2=80=91konforme E=E2=80=91Bikes (250W, 25 km/h) kurzfrist=
ig aus deutschem Lager liefern.=0A=0ABeliebte Ausstattung: Federsystem, Sch=
eibenbremsen, Schutzbleche sowie modernes Display.=0A=0AAkku: 48V entnehmba=
r, mehrere Unterst=C3=BCtzungsstufen, h=C3=A4ufig mit 7=E2=80=91Gang Schalt=
ung.=0A=0ALieferung: aus deutschem Lager, typischerweise 3=E2=80=937 Werkta=
ge innerhalb der EU. Staffelpreise m=C3=B6glich.=0A=0AF=C3=BCr ein Angebot =
gen=C3=BCgt Ihre Lieferadresse (Land/PLZ) und die gew=C3=BCnschte St=C3=
=BCckzahl.=0A=0AMit freundlichen Gr=C3=BC=C3=9Fen=0ABen Romano=0AHorizon Cy=
cle Supply=0A=0AStoc...

--b1_13b703e9ba761af621265093896ce268
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html><head><meta charset=3D"utf-8"/><title>EU 250W E-Bike Angebot</title><=
/head>=0A<body style=3D"font-family:Arial,Helvetica,sans-serif;font-size:14=
px;line-height:1.5;margin:0;padding:10px;">=0A<table cellpadding=3D"0" cell=
spacing=3D"0" style=3D"border-collapse:collapse;" width=3D"100%">=0A<tr><td=
 colspan=3D"2" style=3D"padding:0 0 10px 0;text-align:center;">=0A<img alt=
=3D"E-Bike" src=3D"https://www.lenonlures.com/cdn/shop/files/81gGGvQWBrL.jp=
g" style=3D"max-width:100%;height:auto;display:block;margin:0 auto;"/></td>=
</tr>=0A<tr>=0A<td style=3D"width:50%;padding:10px;border-right:1px solid #=
cccccc;" valign=3D"top">=0A<h3 style=3D"margin:0 0 8px 0;">Neue E=E2=80=
=91Bike Modelle =E2=80=93 250W/25 km/h, ab deutschem Lager</h3>=0A<p style=
=3D"margin:0 0 6px 0;">Guten Tag, hier ist Horizon Cycle Supply.</p>=0A<p s=
tyle=3D"margin:0 0 6px 0;">Wir k=C3=B6nnen EU=E2=80=91konforme E=E2=80=
=91Bikes (<strong>250W</strong>, <strong>25 km/h</strong>) kurzfristig aus =
deutschem Lager liefern.</p>=0A<p style=3D"margin:0 0 6px 0;">Beliebte Auss=
tattung: Federsystem, Scheibenbremsen, Schutzbleche sowie modernes Display.=
</p>=0A<p style=3D"margin:0 0 6px 0;">Akku: <strong>48V entnehmbar</strong>=
, mehrere Unterst=C3=BCtzungsstufen, h=C3=A4ufig mit <strong>7=E2=80=91Gang=
</strong> Schaltung.</p>=0A<p style=3D"margin:0 0 6px 0;">Lieferung: aus <s=
trong>deutschem Lager</strong>, typischerweise <strong>3=E2=80=937 Werktage=
</strong> innerhalb der EU. Staffelpreise m=C3=B6glich.</p>=0A<p style=3D"m=
argin:0 0 6px 0;">F=C3=BCr ein Angebot gen=C3=BCgt Ihre <strong>Lieferadres=
se</strong> (Land/PLZ) und die gew=C3=BCnschte <strong>St=C3=BCckzahl</stro=
ng>.</p>=0A<p style=3D"margin:8px 0 0 0;">Mit freundlichen Gr=C3=BC=C3=
=9Fen<br/><strong>Ben Romano</strong><br/><strong>Horizon Cycle Supply</str=
ong></p>=0A</td>=0A<td style=3D"width:50%;padding:10px;" valign=3D"top">=0A=
<h3 style=3D"margin:0 0 8px 0;">Stock in Germany: EU=E2=80=91spec e=
=E2=80=91bikes for quick replenishment</h3>=0A<p style=3D"margin:0 0 6px 0;=
">Hi =E2=80=93 reaching out from Horizon Cycle Supply.</p>=0A<p style=3D"ma=
rgin:0 0 6px 0;">Our B2B range includes EU=E2=80=91spec e=E2=80=91bikes (<s=
trong>250W</strong>, <strong>25 km/h</strong>) ready to ship from Germany s=
tock.</p>=0A<p style=3D"margin:0 0 6px 0;">Typical spec includes suspension=
 setup, disc brakes, fenders and a modern LCD.</p>=0A<p style=3D"margin:0 0=
 6px 0;">Configuration: <strong>48V</strong> removable battery, assist mode=
s, often a <strong>7=E2=80=91speed</strong> drivetrain.</p>=0A<p style=3D"m=
argin:0 0 6px 0;">Shipping: from <strong>DE/EU stock</strong>, typically <s=
trong>3=E2=80=937 business days</strong>. Dealer terms and tier pricing ava=
ilable.</p>=0A<p style=3D"margin:0 0 6px 0;">To quote, we only need your <s=
trong>delivery location</strong> (country/postcode) and desired <strong>qua=
ntity</strong>.</p>=0A<p style=3D"margin:8px 0 0 0;">Best regards<br/><stro=
ng>Ben Romano</strong><br/><strong>Horizon Cycle Supply</strong></p>=0A</td=
>=0A</tr></table>=0A<p style=3D"font-size:11px;color:#666666;margin:10px 0 =
0 0;">Wenn Sie keine E-Mails mehr erhalten m=C3=B6chten, antworten Sie bitt=
e mit "unlist". - If you do not wish to receive emails, please reply "unlis=
t".</p>=0A</body></html>

--b1_13b703e9ba761af621265093896ce268--


