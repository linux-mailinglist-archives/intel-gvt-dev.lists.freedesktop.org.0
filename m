Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5C9842AA9
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 30 Jan 2024 18:18:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F39A1131BF;
	Tue, 30 Jan 2024 17:18:24 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
X-Greylist: delayed 4645 seconds by postgrey-1.36 at gabe;
 Tue, 30 Jan 2024 17:18:21 UTC
Received: from mailgw.vtvcab.vn (mailgw.vtvcab.vn [103.233.48.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AA151131BF;
 Tue, 30 Jan 2024 17:18:21 +0000 (UTC)
Authentication-Results: esa-internal.vtvcab.vn;
 dkim=pass (signature verified) header.i=@vtvcab.vn
IronPort-SDR: O2m85ujwaGm3ce/3xnvPCCVfeGmeRQuzxE8owaHQc2/4bxitdN4H5Z91BFypua2yHK9yX1z48/
 rSkbYodLmYSg==
IronPort-PHdr: =?us-ascii?q?9a23=3AFeRqUBzOS64znAbXCy+O/D0hRQkC/pjqNwoI44?=
 =?us-ascii?q?YmjLQVLPTx4cG7bwTWsO92hRrSXYyBtqwXw+aDrbz+UmUKp4iH4zgZJZlFVh?=
 =?us-ascii?q?tWwc5DhQEkCd6IBQrhIfrjfyE2T6EgNUMwpi7jbxYOQJ+kNw6aoii89zkXSA?=
 =?us-ascii?q?7iPwh4LfinBomAg82r2rK39obIagpFwTuxMtYQTR+2+FvstpUVnbpHFrk3+D?=
 =?us-ascii?q?3Sn2Z5I/oLwlNDJxHDrxCl+NWQ+YM61yVxt84g7vcVAsCYHq5tS4dTL3MBMk?=
 =?us-ascii?q?M55ZHSuUXnUBGw1l8ffVs0n0F6I1XEsC+icsburimjmM50gwuKAZzudqoqdy?=
 =?us-ascii?q?WZ8ZcoUjbthy4bFxwV9jDKmNNhj797xXDAjkVZnrLVTKyKDuRBeo6eV+IwbD?=
 =?us-ascii?q?EcXfcOBxV6KLuAQ4UjJMA6IsZhnbHYtXIovBiFF1TyOMn+2hhtmi7m5fUj3d?=
 =?us-ascii?q?VmECzk9TYxRsgc6GWxzrTLML5KeNuP8JeZyhrdNPQKiRLEvduAYlUgu/aKRb?=
 =?us-ascii?q?VqbY/LxFIyEx+QllyLst+/ZWG8y/gNvm6H7uFpSeOojSsdphpspiS0mZt+h5?=
 =?us-ascii?q?LAw4MT1l3e8yx9hpgpO9axQghlZ43sHJhRsnSCPpBtCoM5Qm5usTon0LBOp5?=
 =?us-ascii?q?OhfSYLxZhmjx7SYvCKac6Jtzr9SPiaKD0+mnRo?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2BYOADjuz9b/yEUaApOgiNDUlgElDU?=
 =?us-ascii?q?NgjOCUodZiTIWAQEBAQF8hAQPCyACEwEBOBEBBQdhAg4BAgwBARkKAQwIhWi?=
 =?us-ascii?q?CKAEBARWcRYJfgnMBBYFgiCwEChkNgVQMGgaCCYtBgUYRAYNNgTOFWoJyTII?=
 =?us-ascii?q?NgQoNgUgEhyiIM4R1hH9PIoNsPjCBDDl+AQEB?=
X-IPAS-Result: =?us-ascii?q?A2BYOADjuz9b/yEUaApOgiNDUlgElDUNgjOCUodZiTIWA?=
 =?us-ascii?q?QEBAQF8hAQPCyACEwEBOBEBBQdhAg4BAgwBARkKAQwIhWiCKAEBARWcRYJfg?=
 =?us-ascii?q?nMBBYFgiCwEChkNgVQMGgaCCYtBgUYRAYNNgTOFWoJyTIINgQoNgUgEhyiIM?=
 =?us-ascii?q?4R1hH9PIoNsPjCBDDl+AQEB?=
X-IronPort-AV: E=Sophos;i="5.63,1,1557162000"; d="scan'208,217";a="22357931"
Received: from vtvcab-mail3.vtvcab.vn (HELO mail.vtvcab.vn) ([10.104.20.33])
 by esa-internal.vtvcab.vn with ESMTP; 30 Jan 2024 22:55:28 +0700
DKIM-Signature: v=1; a=rsa-sha256; d=vtvcab.vn; s=mail; c=relaxed/relaxed;
 t=1706630128; h=from:subject:to:date:message-id;
 bh=6Uh4ktYMTwnZNsUuY0v5oXCj+8Xn1vzHmu1LiIdTiqQ=;
 b=nScK/OiKdi4Qd4LurWXLkGVJe3ZH5i4V0D9wtj1FLa3JxT9pSrvFySvX+rAmgatHJDn9uzwykuH
 A1N5TiDEwRvWlE+BYBA35kY78QSBPTDfDCBSwHQZPMzANykSz56TByxOMt9xP0qfY/iEJARy1rz0y
 Vlq0ASRTV9oGv3o48MQ=
Received: from Vtvcab-mailSBDT.vtvcab.vn (10.70.113.101) by
 VTVCAB-MAIL3.vtvcab.vn (10.104.20.33) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Tue, 30 Jan 2024 22:55:27 +0700
Received: from Vtvcab-mailSBDT.vtvcab.vn (10.70.113.101) by
 Vtvcab-mailSBDT.vtvcab.vn (10.70.113.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Tue, 30 Jan 2024 22:55:18 +0700
Received: from Vtvcab-mailSBDT.vtvcab.vn ([fe80::d539:b951:9b62:6f3f]) by
 Vtvcab-mailSBDT.vtvcab.vn ([fe80::d539:b951:9b62:6f3f%12]) with mapi id
 15.00.1497.044; Tue, 30 Jan 2024 22:55:18 +0700
From: "Quan tri doanh thu dong tien (TT.CNPM)" <vDonT.DEV@vtvcab.vn>
Subject: =?iso-8859-1?Q?Jeg_har_et_l=E5neforslag_til_dig_@_2%._?=
Thread-Topic: =?iso-8859-1?Q?Jeg_har_et_l=E5neforslag_til_dig_@_2%._?=
Thread-Index: AdpTj3JNlkk/LOBJTUWs3NeBEC3SJQAA5AhAAAAAGyAAAAAXsAAAABHgAAAADNAAAAAJAAAAAAigAAAACGAAAAAIMAAAAAnQAAAACJAAAAAIIAAAAAggAAAACMAAAAAIkAAAAAggAAAACfAAAAAIsAAAAAmwAAAAB1AAAAAKQAAAAAhAAAAACkAAAAAIQAAAAAlAAAAACQAAAAAJAAAAAAkAAAAACwAAAAALYAAAAAqQAAAACvAAAAAPUAAAAAqAAAAACrAAAAAKIAAAAAmAAAAAC+AAAAAK4AAAAAvgAAAAC3AAAAALAAAAAApwAAAACwAAAAALYAAAAAzAAAAADcAAAAAKYAAAAAtgAAAAC8AAAAALgAAAAAsgAAAAC+AAAAALgAAAAAtwAAAADBAAAAAL0AAAAAugAAAADaA=
Date: Tue, 30 Jan 2024 15:55:18 +0000
Message-ID: <da68045a96ce40c989be0c2327988bd8@Vtvcab-mailSBDT.vtvcab.vn>
Accept-Language: vi-VN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [92.119.17.70]
x-kse-serverinfo: Vtvcab-mailSBDT.vtvcab.vn, 9
x-kse-attachmentfiltering-interceptor-info: protection disabled
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: Clean, bases: 1/29/2024 2:00:00 PM
x-kse-bulkmessagesfiltering-scan-result: protection disabled
Content-Type: multipart/alternative;
 boundary="_000_da68045a96ce40c989be0c2327988bd8VtvcabmailSBDTvtvcabvn_"
MIME-Version: 1.0
To: Undisclosed recipients:;
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
Reply-To: "harryolsonllc@gmail.com" <harryolsonllc@gmail.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--_000_da68045a96ce40c989be0c2327988bd8VtvcabmailSBDTvtvcabvn_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello
I have a loan proposal for you @ 2%. If you are interested, contact email: =
harryolsonllc@gmail.com
Greetings
Harry Olson.
Hej
Jeg har et l=E5neforslag til dig @ 2%. Hvis du er interesseret, kan du kont=
akte e-mail: harryolsonllc@gmail.com
Hilsner
Harry Olson.

--_000_da68045a96ce40c989be0c2327988bd8VtvcabmailSBDTvtvcabvn_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Word 14 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	font-family:"Calibri","sans-serif";}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<div style=3D"mso-element:para-border-div;border:none;border-bottom:solid w=
indowtext 1.0pt;padding:0in 0in 1.0pt 0in">
<p class=3D"MsoNormal" style=3D"border:none;padding:0in"><span style=3D"fon=
t-family:&quot;Arial&quot;,&quot;sans-serif&quot;;border:none windowtext 1.=
0pt;padding:0in">Hello</span><span style=3D"font-family:&quot;Arial&quot;,&=
quot;sans-serif&quot;"><br>
<span style=3D"border:none windowtext 1.0pt;padding:0in">I have a loan prop=
osal for you @ 2%. If you are interested, contact email: harryolsonllc@gmai=
l.com</span><br>
<span style=3D"border:none windowtext 1.0pt;padding:0in">Greetings</span><b=
r>
<span style=3D"border:none windowtext 1.0pt;padding:0in">Harry Olson.<o:p><=
/o:p></span></span></p>
</div>
<p class=3D"MsoNormal">Hej<o:p></o:p></p>
<p class=3D"MsoNormal">Jeg har et l=E5neforslag til dig @ 2%. Hvis du er in=
teresseret, kan du kontakte e-mail: harryolsonllc@gmail.com<o:p></o:p></p>
<p class=3D"MsoNormal">Hilsner<o:p></o:p></p>
<p class=3D"MsoNormal">Harry Olson.<o:p></o:p></p>
</div>
</body>
</html>

--_000_da68045a96ce40c989be0c2327988bd8VtvcabmailSBDTvtvcabvn_--
