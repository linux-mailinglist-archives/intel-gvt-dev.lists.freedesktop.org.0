Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2J1MKetE12ksMAgAu9opvQ
	(envelope-from <intel-gvt-dev-bounces@lists.freedesktop.org>)
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 09 Apr 2026 08:19:23 +0200
X-Original-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E73A83C6877
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 09 Apr 2026 08:19:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A296E10E71D;
	Thu,  9 Apr 2026 06:10:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kelindier.com header.i=ejansen@kelindier.com header.b="lnBIGK2j";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
X-Greylist: delayed 11536 seconds by postgrey-1.36 at gabe;
 Thu, 09 Apr 2026 06:10:55 UTC
Received: from mta13.kelindier.com (mta13.kelindier.com [185.117.90.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id A2CD210E71B
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  9 Apr 2026 06:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=dkim; d=kelindier.com; 
 h=From:To:Message-ID:Reply-To:Subject:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:List-ID:List-Unsubscribe;
 i=ejansen@kelindier.com; 
 bh=2LGBQ3HS6OpZy+eqKktvodV64mVxtvx3vPo2Mt3STxc=;
 b=lnBIGK2jrOgzVHM9Qyd4H7Ba/JXK1dEDx4TMz7eiB9pn27mIoQLw3JgfSRg1umT4P9wvK+90rSuy
 LIVheZrEP/r98EEevMVbatGNEdfZoEhazvlMEvDzZn6DoQFlB29T8AKH/QazjkXyF1KO4MwTGJRN
 k6IOvnsFjuq+F+vFuDI+rJt1orTuD83AtEog7E2p0hHyYLM6T49xZS0N1UuEVQlYPe3nxTTMWdIO
 A+E/mxwRL+GWk7yOW39NyxxaviHTkz1JPPT987tNzAm8P/vCbP4P6Olh8//DM4KnHYLHT62TQe/Y
 hZG5iPAbq3w+cOkKp3IMgfh47i4gM29UIsbi4w==
From: "Michael Werner" <ejansen@kelindier.com>
To: intel-gvt-dev@lists.freedesktop.org
Message-ID: <ojCXN_QLMj5pUg50HxmDx4tRR3OYmeVx=@lincolnsouthrotary.org>
Subject: =?UTF-8?B?UmVsaWFibGUgMjUwVyBFLUJpa2UgZm9yIHRoZSBFVSBNYXJrZXQgLSBadXZlcmzDpHNzaWdlcyAyNTBXIEUtQmlrZSBmw7xyIGRlbiBFVS1NYXJrdA==?=
Date: Thu, 09 Apr 2026 03:47:06 +0200
MIME-Version: 1.0
Content-Type: multipart/alternative; charset="UTF-8";
 boundary="b1_e7e4b38fff72a29fff71e8f61cd1eb7e"
Content-Transfer-Encoding: quoted-printable
X-MC-User: 04443401b3e126d1
X-MC-Track: opens,clicks_all
X-Campaign: lincolnsouthrotary-98822851
X-campaignid: f98f9509a7b7dab459e7ec3c
Feedback-ID: 9287:98822851:mc:lincolnsouthrotary
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
Reply-To: sales@kelindier.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Spamd-Result: default: False [11.87 / 15.00];
	URIBL_BLACK(7.50)[kelindier.com:replyto];
	RSPAMD_EMAILBL(2.50)[sales.kelindier.com:replyto];
	URI_COUNT_ODD(1.00)[1];
	R_DKIM_REJECT(1.00)[kelindier.com:s=dkim];
	MAILLIST(-0.20)[mailman];
	BAD_REP_POLICIES(0.10)[];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[kelindier.com : SPF not aligned (relaxed),none];
	R_PARTS_DIFFER(0.08)[54.2%];
	HAS_LIST_UNSUB(-0.01)[];
	HAS_PHPMAILER_SIG(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	GREYLIST(0.00)[pass,body];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_SPAM(0.00)[0.150];
	HAS_REPLYTO(0.00)[sales@kelindier.com];
	RCVD_COUNT_TWO(0.00)[2];
	REPLYTO_DOM_EQ_FROM_DOM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ejansen@kelindier.com,intel-gvt-dev-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kelindier.com:-];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[intel-gvt-dev];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[intel-gvt-dev@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	R_SPF_ALLOW(0.00)[+ip4:131.252.210.177];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,kelindier.com:replyto]
X-Rspamd-Queue-Id: E73A83C6877
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes

--b1_e7e4b38fff72a29fff71e8f61cd1eb7e
Content-Type: text/plain; format=flowed; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

EU Warehouse E-Bike Offer | 250W | 750Wh | Up to 50 km=0A=0ADeutsche Versio=
n steht nach dem englischen Text.=0A=0ADear Sir or Madam,=0A=0AThank you fo=
r taking a moment to read this email.=0A=0APlease allow us to present our f=
at tire e-bike shown in the image above. This model is equipped with a 250W=
 motor, a 750Wh battery, and a riding range of up to 50 km.=0A=0AWith its f=
at tire design, stable frame structure, front suspension, and practical rea=
r rack, it is suitable for commuting, leisure riding, short-distance transp=
ort, and daily use.=0A=0AFrom a sales point of view, this e-bike offers a p=
ractical specification level and an appearance that can work well for retai=
lers, distributors, and resellers looking for a model with broad everyday a=
ppe...

--b1_e7e4b38fff72a29fff71e8f61cd1eb7e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!doctype html>=0A<html>=0A<head>=0A<meta charset=3D"utf-8">=0A<meta name=
=3D"viewport" content=3D"width=3Ddevice-width,initial-scale=3D1.0">=0A<titl=
e>EU Warehouse E-Bike Offer | 250W | 750Wh | Up to 50 km</title>=0A</head>=
=0A<body style=3D"margin:0;padding:0;background:#f4f4f4;">=0A<table role=3D=
"presentation" cellpadding=3D"0" cellspacing=3D"0" border=3D"0" width=3D"10=
0%" style=3D"background:#f4f4f4;">=0A<tr>=0A<td align=3D"center" style=3D"p=
adding:20px 10px;">=0A<table role=3D"presentation" cellpadding=3D"0" cellsp=
acing=3D"0" border=3D"0" width=3D"600" style=3D"width:600px;max-width:600px=
;background:#ffffff;font-family:Arial,Helvetica,sans-serif;color:#222;">=0A=
<tr>=0A<td style=3D"padding:0;">=0A<img src=3D"https://gamvire.com/cdn/shop=
/files/2_0011_11.jpg" alt=3D"E-bike" width=3D"600" style=3D"display:block;w=
idth:100%;max-width:600px;height:auto;border:0;">=0A</td>=0A</tr>=0A<tr>=0A=
<td style=3D"padding:18px 28px 8px 28px;font-size:13px;line-height:19px;col=
or:#666;"><strong>Deutsche Version steht nach dem englischen Text.</strong>=
</td>=0A</tr>=0A<tr>=0A<td style=3D"padding:4px 28px 0 28px;font-size:15px;=
line-height:24px;">=0A<p style=3D"margin:0 0 14px 0;">Dear Sir or Madam,</p=
>=0A<p style=3D"margin:0 0 14px 0;">Thank you for taking a moment to read t=
his email.</p>=0A<p style=3D"margin:0 0 14px 0;">Please allow us to present=
 our fat tire e-bike shown in the image above. This model is equipped with =
a 250W motor, a 750Wh battery, and a riding range of up to 50 km.</p>=0A<p =
style=3D"margin:0 0 14px 0;">With its fat tire design, stable frame structu=
re, front suspension, and practical rear rack, it is suitable for commuting=
, leisure riding, short-distance transport, and daily use.</p>=0A<p style=
=3D"margin:0 0 14px 0;">From a sales point of view, this e-bike offers a pr=
actical specification level and an appearance that can work well for retail=
ers, distributors, and resellers looking for a model with broad everyday ap=
peal.</p>=0A<p style=3D"margin:0 0 14px 0;">With stock already prepared in =
our Germany warehouse, we are able to offer door-to-door delivery across th=
e EU in 3-5 days, which is useful for buyers who want a shorter lead time.<=
/p>=0A<p style=3D"margin:0 0 14px 0;">The overall product concept focuses o=
n usability, stable riding, and a specification level that can be introduce=
d to a broad range of end users.</p>=0A<p style=3D"margin:0 0 14px 0;">For =
many resellers, local stock and quick dispatch are important advantages, es=
pecially when customers prefer shorter waiting times and direct delivery ar=
rangements.</p>=0A<p style=3D"margin:0 0 14px 0;">If you need our quotation=
 for this model, please reply to this email. We will send you pricing and a=
dditional details by return email.</p>=0A<p style=3D"margin:0 0 18px 0;">Be=
st regards,<br>Christian M=C3=B6ller<br>Westfalia Bike Works</p>=0A</td>=0A=
</tr>=0A<tr>=0A<td style=3D"padding:8px 28px 0 28px;border-top:1px solid #e=
5e5e5;font-size:15px;line-height:24px;">=0A<p style=3D"margin:18px 0 14px 0=
;">Sehr geehrte Damen und Herren,</p>=0A<p style=3D"margin:0 0 14px 0;">Ich=
 hoffe, diese Nachricht erreicht Sie gut.</p>=0A<p style=3D"margin:0 0 14px=
 0;">Heute stellen wir Ihnen ein Fat Tire E-Bike vor, das bereits ab deutsc=
hem Lager verf=C3=BCgbar ist. Dieses Modell ist mit einem 250W Motor, einem=
 750Wh Akku und einer Reichweite von bis zu 50 km ausgestattet.</p>=0A<p st=
yle=3D"margin:0 0 14px 0;">Mit breiten Reifen, stabilem Rahmen, Federgabel =
und praktischem Gep=C3=A4cktr=C3=A4ger eignet es sich gut f=C3=BCr Pendeln,=
 Freizeit, kurze Transporte und den t=C3=A4glichen Einsatz.</p>=0A<p style=
=3D"margin:0 0 14px 0;">Es ist eine gute Option f=C3=BCr H=C3=A4ndler und S=
hops, die ein unkompliziertes, praktisches und alltagstaugliches E-Bike f=
=C3=BCr verschiedene lokale M=C3=A4rkte suchen.</p>=0A<p style=3D"margin:0 =
0 14px 0;">Mit bereits verf=C3=BCgbarem Bestand in unserem deutschen Lager =
k=C3=B6nnen wir eine schnelle Lieferung innerhalb der EU in 3-5 Tagen anbie=
ten, was f=C3=BCr K=C3=A4ufer mit k=C3=BCrzerem Beschaffungszeitraum sehr h=
ilfreich ist.</p>=0A<p style=3D"margin:0 0 14px 0;">F=C3=BCr viele H=C3=
=A4ndler ist ein solches Modell leichter zu vermarkten, weil die wichtigste=
n Punkte klar sind: praktische Ausstattung, n=C3=BCtzliche Akkukapazit=
=C3=A4t und kurze Lieferzeit aus Deutschland.</p>=0A<p style=3D"margin:0 0 =
14px 0;">F=C3=BCr viele Wiederverk=C3=A4ufer sind lokaler Bestand und schne=
ller Versand wichtige Vorteile, besonders wenn Endkunden k=C3=BCrzere Warte=
zeiten und direkte Zustellung bevorzugen.</p>=0A<p style=3D"margin:0 0 14px=
 0;">Wenn Sie unser Angebot f=C3=BCr dieses Modell w=C3=BCnschen, antworten=
 Sie bitte auf diese E-Mail. Wir senden Ihnen Preis und zus=C3=A4tzliche In=
formationen per R=C3=BCckmail zu.</p>=0A<p style=3D"margin:0 0 24px 0;">Mit=
 freundlichen Gr=C3=BC=C3=9Fen<br>Christian M=C3=B6ller<br>Westfalia Bike W=
orks</p>=0A</td>=0A</tr>=0A</table>=0A</td>=0A</tr>=0A</table>=0A</body>=0A=
</html>

--b1_e7e4b38fff72a29fff71e8f61cd1eb7e--


