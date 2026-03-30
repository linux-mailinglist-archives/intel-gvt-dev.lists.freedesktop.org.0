Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKSgGKIeymmu5QUAu9opvQ
	(envelope-from <intel-gvt-dev-bounces@lists.freedesktop.org>)
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 30 Mar 2026 08:56:34 +0200
X-Original-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF3F35621F
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 30 Mar 2026 08:56:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F9AE10E37D;
	Mon, 30 Mar 2026 06:56:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=laojiguazi.com header.i=pgunther@laojiguazi.com header.b="B3iWnPv6";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
X-Greylist: delayed 9182 seconds by postgrey-1.36 at gabe;
 Mon, 30 Mar 2026 06:56:30 UTC
Received: from mail8.laojiguazi.com (mail8.laojiguazi.com [85.158.110.187])
 by gabe.freedesktop.org (Postfix) with ESMTP id 98F1110E37D
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 30 Mar 2026 06:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=dkim; d=laojiguazi.com;
 h=From:To:Message-ID:Reply-To:Subject:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:List-ID:List-Unsubscribe;
 i=pgunther@laojiguazi.com; 
 bh=NOysf7Ue1VtkKzhezEOKwTtCt4o6GHAtz0IY0LfeieU=;
 b=B3iWnPv66Wy3IcTixhxgXqH5S40h5d67OwikPEDKpqCkkqFHwV8cfVDJK3c+NpnI5b+Z/KgmuqaV
 N2BrZyGGX/0/7fwJtrb7ddg8Oi0JQBRKLXa8flznyA2n1kSn8jDDwSsMI80z0ooU2locgh0O6f27
 Su91LtwNqwpsvekb1zyOxrE/azyHqOjZigJTksQaGxSAQagY/4QKKTKyO7NwLf+SFzWb6uVlH04S
 8p/Wm682S09aGRxzk+X87WJ6+tikVFyV+k+4AZppNstqrlYBo89dBbScKB3ZAG8WzXLBSbryWsn2
 r01yX7bN0MY34AxftwrFpXwVcXdKuKYzx0TKYQ==
From: "Jessica Martin" <pgunther@laojiguazi.com>
To: intel-gvt-dev@lists.freedesktop.org
Message-ID: <gtat_HAXFP91AyLJEoOiACxYZdpR4v=0I@lincolnassessor.org>
Subject: =?UTF-8?B?Q2hhcmFrdGVyc3RhcmstZGltZW5zaW9uaWVydGUgRWxla3Ryb2ZhaHJyYWQtU29ydGltZW50IGbDvHIgRmFjaGjDpG5kbGVyIGbDvHIgcmVnaW9uYWxlIHVuZCDDvGJlcnJlZ2lvbmFsZSBIw6RuZGxlcg==?=
Date: Mon, 30 Mar 2026 05:25:39 +0200
MIME-Version: 1.0
Content-Type: multipart/alternative; charset="UTF-8";
 boundary="b1_7126463727700e1d46dcecd123abb9d9"
Content-Transfer-Encoding: quoted-printable
X-MC-User: 4987cd5b6eccb292
X-MC-Track: opens,clicks_all
X-Campaign: lincolnassessor-98515676
X-campaignid: ac3748d1875eab61570dc54b
Feedback-ID: 7868:98515676:mc:lincolnassessor
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
Reply-To: sales@laojiguazi.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Spamd-Result: default: False [2.56 / 15.00];
	R_MIXED_CHARSET(1.07)[subject];
	R_DKIM_REJECT(1.00)[laojiguazi.com:s=dkim];
	URI_COUNT_ODD(1.00)[1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[laojiguazi.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	HAS_PHPMAILER_SIG(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_TRACE(0.00)[laojiguazi.com:-];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[sales@laojiguazi.com];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[pgunther@laojiguazi.com,intel-gvt-dev-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	NEURAL_SPAM(0.00)[0.932];
	REPLYTO_DOM_EQ_FROM_DOM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[intel-gvt-dev@lists.freedesktop.org];
	TO_DN_NONE(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[intel-gvt-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lincolnassessor.org:mid,laojiguazi.com:replyto,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: BCF3F35621F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

--b1_7126463727700e1d46dcecd123abb9d9
Content-Type: text/plain; format=flowed; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

EU 250W E-Bike Offer=0A=0AInfo: Die englische Fassung finden Sie weiter unt=
en. - English version follows below.=0A=0AFat-Tire Modelle f=C3=BCr Gel=
=C3=A4nde und FreizeitHallo, hier ist Elmstone Bike Depot mit einer kurzen =
B2B-Anfrage.=0A=0AWir k=C3=B6nnen Ihnen aktuelle Modelle mit kurzer Lieferz=
eit innerhalb der EU anbieten.=0A=0AKleine Testbestellungen sind m=C3=B6gli=
ch, und Nachbestellungen k=C3=B6nnen kurzfristig organisiert werden.=0A=0AA=
uf Wunsch senden wir Ihnen Katalog, Preise, Spezifikationen und aktuelle Ve=
rf=C3=BCgbarkeit.=0A=0AJe nach Region ist eine z=C3=BCgige Lieferung aus DE=
-Lager m=C3=B6glich.=0A=0AWenn Interesse an einem E...

--b1_7126463727700e1d46dcecd123abb9d9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html><head><meta charset=3D"utf-8"/><title>EU 250W E-Bike Offer</title></h=
ead>=0A<body style=3D"font-family:Arial,Helvetica,sans-serif;font-size:14px=
;line-height:1.5;margin:0;padding:10px;">=0A<table cellpadding=3D"0" cellsp=
acing=3D"0" style=3D"border-collapse:collapse;" width=3D"100%">=0A<tr><td c=
olspan=3D"2" style=3D"padding:0 0 10px 0;text-align:center;color:#666666;fo=
nt-size:12px;"><em>Info: Die englische Fassung finden Sie weiter unten. - E=
nglish version follows below.</em></td></tr>=0A<tr><td colspan=3D"2" style=
=3D"padding:0 0 10px 0;text-align:center;">=0A<img alt=3D"" src=3D"https://=
ebycco.com/cdn/shop/files/2_0014_5.jpg" style=3D"max-width:100%;height:auto=
;display:block;margin:0 auto;"/></td></tr>=0A<tr>=0A<td colspan=3D"2" style=
=3D"padding:10px;" valign=3D"top">=0A<h3 style=3D"margin:0 0 8px 0;">Fat-Ti=
re Modelle f=C3=BCr Gel=C3=A4nde und Freizeit</h3><p style=3D"margin:0 0 6p=
x 0;">Hallo, hier ist Elmstone Bike Depot mit einer kurzen B2B-Anfrage.</p>=
<p style=3D"margin:0 0 6px 0;">Wir k=C3=B6nnen Ihnen aktuelle Modelle mit k=
urzer Lieferzeit innerhalb der EU anbieten.</p><p style=3D"margin:0 0 6px 0=
;">Kleine Testbestellungen sind m=C3=B6glich, und Nachbestellungen k=C3=
=B6nnen kurzfristig organisiert werden.</p><p style=3D"margin:0 0 6px 0;">A=
uf Wunsch senden wir Ihnen Katalog, Preise, Spezifikationen und aktuelle Ve=
rf=C3=BCgbarkeit.</p><p style=3D"margin:0 0 6px 0;">Je nach Region ist eine=
 z=C3=BCgige Lieferung aus DE-Lager m=C3=B6glich.</p><p style=3D"margin:0 0=
 6px 0;">Wenn Interesse an einem Einkauf besteht, antworten Sie bitte auf u=
nsere E-Mail und teilen Sie uns Ihre Adresse sowie Ihre Postleitzahl mit, d=
amit wir die Frachtkosten berechnen k=C3=B6nnen.</p><p style=3D"margin:8px =
0 0 0;">Freundliche Gr=C3=BC=C3=9Fe<br/><strong>Oscar Bryant</strong><br/><=
strong>Elmstone Bike Depot</strong></p>=0A</td>=0A</tr>=0A<tr><td colspan=
=3D"2" style=3D"padding:0 10px;"><hr style=3D"border:none;border-top:1px so=
lid #cccccc;margin:0;"/></td></tr>=0A<tr>=0A<td colspan=3D"2" style=3D"padd=
ing:10px;" valign=3D"top">=0A<h3 style=3D"margin:0 0 8px 0;">Fat-tire model=
s for off-road and leisure</h3><p style=3D"margin:0 0 6px 0;">Hello, I am c=
ontacting you on behalf of Elmstone Bike Depot.</p><p style=3D"margin:0 0 6=
px 0;">We offer EU-compliant e-bikes across several categories, including c=
ity, trekking, mountain and fat-tire models.</p><p style=3D"margin:0 0 6px =
0;">We can also start with a small first purchase if that is more suitable.=
</p><p style=3D"margin:0 0 6px 0;">Catalog, spec sheets and B2B information=
 are available on request.</p><p style=3D"margin:0 0 6px 0;">For many EU de=
stinations, we can arrange prompt shipping.</p><p style=3D"margin:0 0 6px 0=
;">If you are interested in a purchase, please reply to our email and share=
 your address and postal code so we can calculate the freight cost.</p><p s=
tyle=3D"margin:8px 0 0 0;">Kind regards<br/><strong>Oscar Bryant</strong><b=
r/><strong>Elmstone Bike Depot</strong></p>=0A</td>=0A</tr></table>=0A<p st=
yle=3D"font-size:11px;color:#666666;margin:10px 0 0 0;">Wenn Sie keine weit=
eren E-Mails erhalten m=C3=B6chten, antworten Sie bitte mit "unlist". - If =
you do not wish to receive further emails, please reply "unlist".</p>=0A</b=
ody></html>

--b1_7126463727700e1d46dcecd123abb9d9--


