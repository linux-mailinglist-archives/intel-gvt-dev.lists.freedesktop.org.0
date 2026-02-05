Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oIy9H6MHhWlW7gMAu9opvQ
	(envelope-from <intel-gvt-dev-bounces@lists.freedesktop.org>)
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 05 Feb 2026 22:12:03 +0100
X-Original-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA848F77F1
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 05 Feb 2026 22:12:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5D5E10E08C;
	Thu,  5 Feb 2026 21:05:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=dustyfishbj.pro header.i=aaa76@dustyfishbj.pro header.b="NpSh6K0S";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
X-Greylist: delayed 305 seconds by postgrey-1.36 at gabe;
 Thu, 05 Feb 2026 21:05:25 UTC
Received: from mail.dustyfishbj.pro (denim.cozystonehm.com [170.130.89.149])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9A03410E08C
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  5 Feb 2026 21:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=mx1; d=dustyfishbj.pro;
 h=From:Reply-To:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
 i=aaa76@dustyfishbj.pro;
 bh=zyt8r5mwSgw/Nkphu6NLeP3BmCBGfWEqXDWokL0Z/Z0=;
 b=NpSh6K0Sy/q/3hd5dBNItoJuirwibPZERqZpViIQxNs/URmoHb0HsKqGSPHGqn5zUf3nWrcGB6Kr
 qqQpVo90jnyHHiBZh1CasTl1LmuYz1me27YS11QHjsZRR8U9F3Ih82XX/xhgyBmjjtyppX23YwfC
 WYJ6FPs57XI4xRebdfP6NqMJAeL6Cygkl2tCwMcXjOkpPIs2alLK0YZlr2A4ORVXCN+QaLDkf68W
 1p3J79BAsfu3bG6PN+C0FWI/Z+EyCpeWOqNHcgvJCqnd5Cxupi/WqCC+gXMDSGqF4s86ohpQYQTd
 kdnxPeAX0ftbLr2sTyDAyKPUmavF/P4ZPkXqsw==
From: AAA Customer Support <aaa76@dustyfishbj.pro>
To: intel-gvt-dev@lists.freedesktop.org
Subject: Roadside kit shipment update
Date: Thu, 5 Feb 2026 16:00:16 -0500
Message-ID: <RPzTQL94_o6Cg8khrfnHB4suS.17cb@pdf3.dustyfishbj.pro>
X-Request-ID: 249625d5-47c3-44bb-a167-153f24237c5a
X-Distribution: list
X-Mail-Source: edge-6
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="tLVjh--sGQrwygkXaSLBWD3X468Jdci-.wy2"
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
Reply-To: aaa76@dustyfishbj.pro
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [13.29 / 15.00];
	URIBL_BLACK(7.50)[dustyfishbj.pro:replyto,dustyfishbj.pro:url,dustyfishbj.pro:dkim];
	ABUSE_SURBL(5.00)[www.dustyfishbj.pro:url,pdf3.dustyfishbj.pro:mid,dustyfishbj.pro:replyto,dustyfishbj.pro:dkim];
	URI_COUNT_ODD(1.00)[1];
	MAILLIST(-0.20)[mailman];
	MANY_INVISIBLE_PARTS(0.10)[2];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	BAD_REP_POLICIES(0.10)[];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[dustyfishbj.pro,quarantine];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	R_DKIM_ALLOW(0.00)[dustyfishbj.pro:s=mx1];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	GREYLIST(0.00)[pass,body];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_TRACE(0.00)[dustyfishbj.pro:+];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aaa76@dustyfishbj.pro,intel-gvt-dev-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	HAS_REPLYTO(0.00)[aaa76@dustyfishbj.pro];
	RCVD_COUNT_TWO(0.00)[2];
	NEURAL_HAM(-0.00)[-0.701];
	R_SPF_ALLOW(0.00)[+ip4:131.252.210.177:c];
	PREVIOUSLY_DELIVERED(0.00)[intel-gvt-dev@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[intel-gvt-dev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,dustyfishbj.pro:replyto,dustyfishbj.pro:url,dustyfishbj.pro:dkim,pdf3.dustyfishbj.pro:mid]
X-Rspamd-Queue-Id: CA848F77F1
X-Rspamd-Action: add header
X-Spam: Yes

--tLVjh--sGQrwygkXaSLBWD3X468Jdci-.wy2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Your=20AAA=20Offer
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20AAA
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20Your=20AAA=20Em=
ergency=20Car=20Kit
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20Valid=20From=20=
now=20through=20this=20week
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20Thank=20you=20f=
or=20being=20a=20loyal=20AAA=20member!=20We=20are=20pleased=20to=20provide=
=20this=20emergency=20roadside=20car=20kit=20to=20help=20you=20stay=20secur=
e=20while=20traveling.
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20By=20spending=
=20a=20few=20moments=20to=20finish=20a=20short=20survey,=20you'll=20assist=
=20us=20in=20enhancing=20and=20maintaining=20excellent=20service.
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20Receive=20Yours=20Now
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20What=E2=80=99s=
=20in=20Your=20AAA=20Emergency=20Roadside=20Kit
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20Be=20prepared=
=20for=20the=20unforeseen.=20Your=20provided=20kit=20is=20crafted=20to=20ha=
ndle=20the=20most=20frequent=20roadside=20situations:
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=208-gauge=20jumper=20cables=20(10=20ft)=20fo=
r=20rapid=20battery=20boosts
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20High-visibility=20reflective=20triangle=20=
=20small=20LED=20flashlight
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20Tire=20pressure=20gauge=20=20valve-stem=20=
caps=20for=20simple=20checks
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20Multi-bit=20tool=20set=20(screwdriver,=20p=
liers)=20=20strong=20tape
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20First-aid=20pouch=20(bandages,=20wipes,=20=
gauze)
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20Thermal=20blanket,=20poncho,=20and=20textu=
red=20work=20gloves
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20Bungee=20cord,=20zip=20ties,=20and=20emerg=
ency=20whistle
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20All=20stored=20in=20a=20sturdy,=20trunk-re=
ady=20carry=20case
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20Not=
e:=20This=20kit=20is=20a=20benefit=20of=20your=20AAA=20membership.=20Comple=
te=20the=20survey=20to=20have=20yours=20sent=20directly.
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20The=20little=20=
engine=20chugged=20up=20the=20hill,=20its=20wheels=20turning=20with=20stead=
y=20purpose.=20At=20the=20top,=20a=20vast=20new=20valley=20stretched=20befo=
re=20it,=20painted=20in=20morning=20colors.=20The=20journey=20was=20its=20o=
wn=20reward,=20a=20quiet=20truth=20learned=20with=20each=20mile.=20The=20tr=
acks=20gleamed=20ahead,=20inviting=20and=20endless.=20There=20was=20always=
=20another=20hill,=20another=20horizon.
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20A=20paper=20boa=
t=20sailed=20on=20a=20rain-filled=20gutter,=20a=20captain=20of=20leaves=20a=
t=20the=20helm.=20It=20navigated=20past=20pebbles=20and=20twigs,=20a=20flee=
ting=20voyage=20under=20a=20gray=20sky.=20The=20water=20carried=20it=20gent=
ly=20around=20a=20corner,=20out=20of=20sight.=20Some=20adventures=20are=20s=
mall,=20quiet,=20and=20perfectly=20complete.

http://www.dustyfishbj.pro/qim

--tLVjh--sGQrwygkXaSLBWD3X468Jdci-.wy2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE=20html>
<html=20lang=3D"en">
<head>
=20=20=20=20<meta=20charset=3D"UTF-8">
=20=20=20=20<meta=20name=3D"viewport"=20content=3D"width=3Ddevice-width,=20=
initial-scale=3D1.0">
=20=20=20=20<title>Your=20AAA=20Offer</title>
=20=20=20=20<style>
=20=20=20=20=20=20=20=20@media=20only=20screen=20and=20(max-width:=20600px)=
=20{
=20=20=20=20=20=20=20=20=20=20=20=20.container=20{=20width:=20100%=20!impor=
tant;=20}
=20=20=20=20=20=20=20=20=20=20=20=20.two-column=20{=20display:=20block=20!i=
mportant;=20width:=20100%=20!important;=20}
=20=20=20=20=20=20=20=20=20=20=20=20.column=20{=20display:=20block=20!impor=
tant;=20width:=20100%=20!important;=20}
=20=20=20=20=20=20=20=20=20=20=20=20.mobile-stack=20{=20display:=20block=20=
!important;=20width:=20100%=20!important;=20}
=20=20=20=20=20=20=20=20}
=20=20=20=20</style>
</head>
<body=20style=3D"margin:0;=20padding:0;=20background-color:#f5f5f5;=20font-=
family:=20Arial,=20sans-serif;">
=20=20=20=20<center>
=20=20=20=20=20=20=20=20<table=20role=3D"presentation"=20align=3D"center"=
=20border=3D"0"=20cellpadding=3D"0"=20cellspacing=3D"0"=20width=3D"550"=20c=
lass=3D"container"=20style=3D"max-width:550px;=20width:100%;=20background-c=
olor:#ffffff;=20border-collapse:collapse;">
=20=20=20=20=20=20=20=20=20=20=20=20<!--=20Logo=20-->
=20=20=20=20=20=20=20=20=20=20=20=20<tr>
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20<td=20align=3D"center"=20st=
yle=3D"padding:=2030px=2020px=2010px;">
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20<div=20style=3D=
"font-size:38pt;=20font-weight:bold;=20color:#C62828;">AAA</div>
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20</td>
=20=20=20=20=20=20=20=20=20=20=20=20</tr>
=20=20=20=20=20=20=20=20=20=20=20=20<!--=20Header=20-->
=20=20=20=20=20=20=20=20=20=20=20=20<tr>
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20<td=20align=3D"center"=20st=
yle=3D"background-color:#000000;=20padding:25px=2020px;">
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20<h1=20style=3D"=
margin:0;=20font-size:26px;=20color:#ffffff;=20line-height:1.3;">Your=20AAA=
=20Emergency=20Car=20Kit</h1>
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20</td>
=20=20=20=20=20=20=20=20=20=20=20=20</tr>
=20=20=20=20=20=20=20=20=20=20=20=20<!--=20Sub=20Header=20-->
=20=20=20=20=20=20=20=20=20=20=20=20<tr>
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20<td=20align=3D"center"=20st=
yle=3D"padding:15px=2020px=205px;">
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20<p=20style=3D"m=
argin:0;=20color:#757575;=20font-size:16px;">Valid=20From=20now=20through=
=20this=20week</p>
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20</td>
=20=20=20=20=20=20=20=20=20=20=20=20</tr>
=20=20=20=20=20=20=20=20=20=20=20=20<!--=20Main=20Body=20Section=20-->
=20=20=20=20=20=20=20=20=20=20=20=20<tr>
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20<td=20style=3D"padding:25px=
=2030px;=20border:1px=20solid=20#e0e0e0;=20margin:20px;=20border-radius:8px=
;=20box-shadow:=200=202px=208px=20rgba(0,0,0,0.05);">
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20<p=20style=3D"m=
argin:0=200=2018px=200;=20font-size:16px;=20line-height:1.6;=20color:#333;"=
>Thank=20you=20for=20being=20a=20loyal=20AAA=20member!=20We=20are=20pleased=
=20to=20provide=20this=20emergency=20roadside=20car=20kit=20to=20help=20you=
=20stay=20secure=20while=20traveling.</p>
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20<p=20style=3D"m=
argin:0=200=2025px=200;=20font-size:16px;=20line-height:1.6;=20color:#333;"=
>By=20spending=20a=20few=20moments=20to=20finish=20a=20short=20survey,=20yo=
u'll=20assist=20us=20in=20enhancing=20and=20maintaining=20excellent=20servi=
ce.</p>
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20<!--=20CTA=20Bu=
tton=20-->
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20<table=20role=
=3D"presentation"=20align=3D"center"=20border=3D"0"=20cellpadding=3D"0"=20c=
ellspacing=3D"0"=20style=3D"margin:20px=20auto=2010px;">
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20<tr>
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20<td=20align=3D"center"=20style=3D"background-color:#D32F2F;=20bord=
er-radius:6px;=20padding:14px=2032px;">
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20<a=20href=3D"http://www.dustyfishbj.pro/qim"=20style=
=3D"color:#ffffff;=20text-decoration:none;=20font-size:18px;=20font-weight:=
bold;=20display:inline-block;">Receive=20Yours=20Now</a>
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20</td>
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20</t=
r>
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20</table>
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20</td>
=20=20=20=20=20=20=20=20=20=20=20=20</tr>
=20=20=20=20=20=20=20=20=20=20=20=20<!--=20Visual=20Separator=20-->
=20=20=20=20=20=20=20=20=20=20=20=20<tr>
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20<td=20align=3D"center"=20st=
yle=3D"padding:10px;">
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20<div=20style=3D=
"height:4px;=20width:80px;=20background-color:#e0e0e0;=20border-radius:2px;=
"></div>
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20</td>
=20=20=20=20=20=20=20=20=20=20=20=20</tr>
=20=20=20=20=20=20=20=20=20=20=20=20<!--=20New=20Pattern:=20Two-Column=20In=
fo=20Block=20-->
=20=20=20=20=20=20=20=20=20=20=20=20<tr>
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20<td=20style=3D"padding:10px=
=2030px=2030px;">
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20<h2=20style=3D"=
margin:0=200=2015px=200;=20font-size:24px;=20color:#212121;=20text-align:ce=
nter;">What=E2=80=99s=20in=20Your=20AAA=20Emergency=20Roadside=20Kit</h2>
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20<p=20style=3D"m=
argin:0=200=2025px=200;=20color:#757575;=20font-size:16px;=20text-align:cen=
ter;">Be=20prepared=20for=20the=20unforeseen.=20Your=20provided=20kit=20is=
=20crafted=20to=20handle=20the=20most=20frequent=20roadside=20situations:</=
p>
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20<table=20role=
=3D"presentation"=20class=3D"two-column"=20width=3D"100%"=20border=3D"0"=20=
cellpadding=3D"0"=20cellspacing=3D"0"=20style=3D"border-collapse:collapse;">
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20<tr=
=20class=3D"mobile-stack">
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20<td=20class=3D"column"=20width=3D"48%"=20valign=3D"top"=20style=3D=
"padding-right:4%;">
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20<ul=20style=3D"margin:0=200=2020px=200;=20padding-left=
:20px;=20color:#333;=20font-size:15px;=20line-height:1.7;">
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20<li=20style=3D"margin-bottom:10px;">8-gaug=
e=20jumper=20cables=20(10=20ft)=20for=20rapid=20battery=20boosts</li>
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20<li=20style=3D"margin-bottom:10px;">High-v=
isibility=20reflective=20triangle=20=20small=20LED=20flashlight</li>
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20<li=20style=3D"margin-bottom:10px;">Tire=
=20pressure=20gauge=20=20valve-stem=20caps=20for=20simple=20checks</li>
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20<li=20style=3D"margin-bottom:10px;">Multi-=
bit=20tool=20set=20(screwdriver,=20pliers)=20=20strong=20tape</li>
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20</ul>
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20</td>
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20<td=20class=3D"column"=20width=3D"48%"=20valign=3D"top">
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20<ul=20style=3D"margin:0;=20padding-left:20px;=20color:=
#333;=20font-size:15px;=20line-height:1.7;">
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20<li=20style=3D"margin-bottom:10px;">First-=
aid=20pouch=20(bandages,=20wipes,=20gauze)</li>
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20<li=20style=3D"margin-bottom:10px;">Therma=
l=20blanket,=20poncho,=20and=20textured=20work=20gloves</li>
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20<li=20style=3D"margin-bottom:10px;">Bungee=
=20cord,=20zip=20ties,=20and=20emergency=20whistle</li>
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20<li=20style=3D"margin-bottom:10px;">All=20=
stored=20in=20a=20sturdy,=20trunk-ready=20carry=20case</li>
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20</ul>
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20</td>
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20</t=
r>
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20</table>
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20</td>
=20=20=20=20=20=20=20=20=20=20=20=20</tr>
=20=20=20=20=20=20=20=20=20=20=20=20<!--=20Callout=20Card=20-->
=20=20=20=20=20=20=20=20=20=20=20=20<tr>
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20<td=20style=3D"padding:0=20=
30px=2030px;">
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20<div=20style=3D=
"background-color:#f9f9f9;=20border-left:4px=20solid=20#C62828;=20padding:2=
0px;=20border-radius:0=206px=206px=200;">
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20<p=
=20style=3D"margin:0;=20font-size:16px;=20line-height:1.6;=20color:#333;"><=
strong>Note:</strong>=20This=20kit=20is=20a=20benefit=20of=20your=20AAA=20m=
embership.=20Complete=20the=20survey=20to=20have=20yours=20sent=20directly.=
</p>
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20</div>
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20</td>
=20=20=20=20=20=20=20=20=20=20=20=20</tr>
=20=20=20=20=20=20=20=20=20=20=20=20<!--=20Micro-section=20-->
=20=20=20=20=20=20=20=20=20=20=20=20<tr>
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20<td=20style=3D"padding:20px=
=2030px;=20background-color:#f5f5f5;=20font-size:9px;=20color:#f5f5f5;=20li=
ne-height:1.4;">
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20<p=20style=3D"m=
argin:0;">The=20little=20engine=20chugged=20up=20the=20hill,=20its=20wheels=
=20turning=20with=20steady=20purpose.=20At=20the=20top,=20a=20vast=20new=20=
valley=20stretched=20before=20it,=20painted=20in=20morning=20colors.=20The=
=20journey=20was=20its=20own=20reward,=20a=20quiet=20truth=20learned=20with=
=20each=20mile.=20The=20tracks=20gleamed=20ahead,=20inviting=20and=20endles=
s.=20There=20was=20always=20another=20hill,=20another=20horizon.</p>
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20<p=20style=3D"m=
argin:8px=200=200=200;">A=20paper=20boat=20sailed=20on=20a=20rain-filled=20=
gutter,=20a=20captain=20of=20leaves=20at=20the=20helm.=20It=20navigated=20p=
ast=20pebbles=20and=20twigs,=20a=20fleeting=20voyage=20under=20a=20gray=20s=
ky.=20The=20water=20carried=20it=20gently=20around=20a=20corner,=20out=20of=
=20sight.=20Some=20adventures=20are=20small,=20quiet,=20and=20perfectly=20c=
omplete.</p>
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20</td>
=20=20=20=20=20=20=20=20=20=20=20=20</tr>
=20=20=20=20=20=20=20=20</table>
=20=20=20=20</center>
=20=20=20=20<img=20src=3D"http://www.dustyfishbj.pro/open/aW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmc.png"=
=20width=3D"1"=20height=3D"1"=20style=3D"display:none"=20alt=3D"">
</body>
</html>

--tLVjh--sGQrwygkXaSLBWD3X468Jdci-.wy2--
