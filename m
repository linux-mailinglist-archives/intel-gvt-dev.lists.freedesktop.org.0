Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E290FC869
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 14 Nov 2019 15:09:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 302D76EAD8;
	Thu, 14 Nov 2019 14:09:23 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-oln040092253087.outbound.protection.outlook.com [40.92.253.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F15B46E9CC;
 Thu, 14 Nov 2019 14:09:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NZxxvYjIshSUZXPty9AT9ngdcDffDXfk14oK5ObrmLtfFHj6j3eUipFdGUW6zSkEgUndhzRKuT9J75IX99aIj6Zu+LKKAZn8S/7/Dge15VO/oblj1yjiXuWkFr4bKeFdZYG0Rset6w1Wd92Q7WWN6ox65tgbjl40PvD96Sk9cywpvf86fFjV5lNrVL/K5tyl0fHC519J7GBdnSQEoyDg1HXKXGq9oE7KwuFlI1Fl9HEFgA6sFU6uDK6H2zq1SZkTQVgBQg/UDtnYbpNmujrD4nEaE79o5KCOMgN6VpO+xUx5d6nRomLBEGvL+E7It5/36/NcZAAnsZOIi3egXY6gww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ASYsT/FBONaY6mpCH6dI89Ad9gWLiQQHe3Xbu3/4myY=;
 b=QgFWoLhJJcTE4XjGR93Xp8YxzP8MZ9hnmW2abuHAxnNgmbWAuPSvylaQTxpoYhdXFhxmdYSOpZw3qttWWyS+CCon2kOllS9sBjigcNAYo38EKaf3yvBguQ5VZxR9gYit3Mqq1ggU2itotpJfyghm1bad4dlHnj75g7VOnSvHw4orMWqsttdy5XSabbCeCjVd9yPugrUgO+hcTPOgCqXkvU+s4ytzW++Z3l/gir8hSyNeMEpds4gW/5f6/1d+jOMtoQL9dKuMe/SPTLtCZtRCSuCK4ShotRJBbN2eqE3Y49BuAIyM4/hlMvy9cyh+7KEkU0zFCsWh7nDoIbFFEHdvig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from PU1APC01FT005.eop-APC01.prod.protection.outlook.com
 (10.152.252.58) by PU1APC01HT062.eop-APC01.prod.protection.outlook.com
 (10.152.253.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.23; Thu, 14 Nov
 2019 14:08:38 +0000
Received: from SG2PR06MB2395.apcprd06.prod.outlook.com (10.152.252.57) by
 PU1APC01FT005.mail.protection.outlook.com (10.152.252.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.23 via Frontend Transport; Thu, 14 Nov 2019 14:08:38 +0000
Received: from SG2PR06MB2395.apcprd06.prod.outlook.com
 ([fe80::20cd:13e7:90d9:a680]) by SG2PR06MB2395.apcprd06.prod.outlook.com
 ([fe80::20cd:13e7:90d9:a680%2]) with mapi id 15.20.2430.028; Thu, 14 Nov 2019
 14:08:38 +0000
From: Ethel Gilbertdata <Ethel.gilbertdata@outlook.com>
Subject: Healthcare Professional Database 
Thread-Topic: Healthcare Professional Database 
Thread-Index: AdWa9PfD08hYzbgDSiiBGnVF12X0+A==
Importance: high
X-Priority: 1
Date: Thu, 14 Nov 2019 14:08:38 +0000
Message-ID: <SG2PR06MB2395706C3AB59964FCE176E7F1710@SG2PR06MB2395.apcprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:D478A43740C444BDB008BB21149E1D204EFA5ABED8DA5D3A9EFBF2A77384F1C6;
 UpperCasedChecksum:F9568DFBCE6CDC6D05955963E2179D78FAB7DB8250C64733EA5A6F947B8035E3;
 SizeAsReceived:18813; Count:45
x-tmn: [pyNYESovl2XuXDjgpHPj88Es2skD99j0]
x-ms-publictraffictype: Email
x-incomingheadercount: 45
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: ec0a0946-ee26-4a3a-1d58-08d7690c256a
x-ms-traffictypediagnostic: PU1APC01HT062:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: V+ZKYpK8qP+9HYEwZG0kM8umbGp/Z1htqqSwm5aI3BM0ATAjmHCIiDi+WVQMWSfer8huuB0YaoWuyW261f8sBFd0siuXBsyMUbIF0x0sIBbPcVV1GoyUw4WcVoFI9TmljD5hSqILPjPx29l76Jp/iHmMDhAE71uKf/ouaOF+ad/3hKXrtt+pkL6c6sDUYJ9B
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: ec0a0946-ee26-4a3a-1d58-08d7690c256a
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2019 14:08:38.2570 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU1APC01HT062
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=outlook.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ASYsT/FBONaY6mpCH6dI89Ad9gWLiQQHe3Xbu3/4myY=;
 b=randOmaihAwQ4/f+RceXrtGofW//46x/ZdcF649ohbbd+n6CrFsxkJsP8epV5vVioMRHrm2idOyF+C7bCM127vYAln8NPQBtcyOPF5CuCWVbQ0YTGZEh+MpBX8qRIT+P+Q/CrOWP94FVwtA7UyYZevQciThXa1z3uZeWvHqBgnZkt69inGHcg0BF7ROqJJhKLtO7YboAd6gQYFUfGknL+XkKvjNZFi/abg65GajPZ8yQQB0mXOPBxyL/sSVyD85gte2WTEBTjogAUrmCyf+AQv8CsCbs3jfYbsUSBfE6rtwRHb5zWNlA7GMzFDYepoxzn4xWCgccn4Vse3rYXnqfRw==
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Content-Type: multipart/mixed; boundary="===============0967868466=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--===============0967868466==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_SG2PR06MB2395706C3AB59964FCE176E7F1710SG2PR06MB2395apcp_"

--_000_SG2PR06MB2395706C3AB59964FCE176E7F1710SG2PR06MB2395apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Greetings, how's your day been so far?

Is it something you would be interested in Healthcare Professional Database=
 for all your Business Activities?

All Key Decision Makers
Medical Practitioners / Doctors
CEO & Top Management
Microbiologist
Chemists & Bio-Chemists
Packaging Engineering
Contract Manufacturer's
Pathologists/ Pharmacists
Corporate management
Plant Managers
Equipment Manufacturers, supplier & Distributors
Purchase Heads
Hospitals & physicians data
Q.C Heads / Managers
Lab Directors/ Scientists
Quality Assurance & R &D list
Laboratory Heads
Trade Dealers & Suppliers
Manufacturing / Production Engineering
Vender Development & purchase

If your target audience is not mentioned kindly put it down in few words an=
d would be easier to me for further procedure.

Target Geography: ______________?? (Example : USA, UK, Canada, Australia, e=
tc...)

Target Job Title:  __________________?? (Example: CEO, VP, Managers, Nurses=
, Directors, etc....)

Await your kind swift response.

Best Regards,
 Ethel
Marketing Specialist





--_000_SG2PR06MB2395706C3AB59964FCE176E7F1710SG2PR06MB2395apcp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
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
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-IN" style=3D"font-family:&quot;Time=
s New Roman&quot;,serif;color:black">Greetings, how&#8217;s your day been s=
o far?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-IN" style=3D"font-family:&quot;Time=
s New Roman&quot;,serif;color:black"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-IN" style=3D"font-family:&quot;Time=
s New Roman&quot;,serif;color:black">Is it something you would be intereste=
d in
<b>Healthcare Professional Database</b> for all your Business Activities?<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-IN" style=3D"font-family:&quot;Time=
s New Roman&quot;,serif;color:black"><o:p>&nbsp;</o:p></span></p>
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" width=3D"0" style=3D"width:431.0pt;margin-left:-.05pt;border-collaps=
e:collapse">
<tbody>
<tr style=3D"height:.2in">
<td width=3D"361" nowrap=3D"" valign=3D"bottom" style=3D"width:271.0pt;bord=
er:solid windowtext 1.0pt;padding:0in 5.4pt 0in 5.4pt;height:.2in">
<p class=3D"MsoNormal" style=3D"line-height:105%"><span style=3D"font-famil=
y:&quot;Times New Roman&quot;,serif;color:black">All Key Decision Makers<o:=
p></o:p></span></p>
</td>
<td width=3D"213" nowrap=3D"" valign=3D"bottom" style=3D"width:160.0pt;bord=
er:solid windowtext 1.0pt;border-left:none;padding:0in 5.4pt 0in 5.4pt;heig=
ht:.2in">
<p class=3D"MsoNormal" style=3D"line-height:105%"><span style=3D"font-famil=
y:&quot;Times New Roman&quot;,serif;color:black">Medical Practitioners / Do=
ctors<o:p></o:p></span></p>
</td>
</tr>
<tr style=3D"height:.2in">
<td width=3D"361" nowrap=3D"" valign=3D"bottom" style=3D"width:271.0pt;bord=
er:solid windowtext 1.0pt;border-top:none;padding:0in 5.4pt 0in 5.4pt;heigh=
t:.2in">
<p class=3D"MsoNormal" style=3D"line-height:105%"><span style=3D"font-famil=
y:&quot;Times New Roman&quot;,serif;color:black">CEO &amp; Top Management<o=
:p></o:p></span></p>
</td>
<td width=3D"213" nowrap=3D"" valign=3D"bottom" style=3D"width:160.0pt;bord=
er-top:none;border-left:none;border-bottom:solid windowtext 1.0pt;border-ri=
ght:solid windowtext 1.0pt;padding:0in 5.4pt 0in 5.4pt;height:.2in">
<p class=3D"MsoNormal" style=3D"line-height:105%"><span style=3D"font-famil=
y:&quot;Times New Roman&quot;,serif;color:black">Microbiologist<o:p></o:p><=
/span></p>
</td>
</tr>
<tr style=3D"height:.2in">
<td width=3D"361" nowrap=3D"" valign=3D"bottom" style=3D"width:271.0pt;bord=
er:solid windowtext 1.0pt;border-top:none;padding:0in 5.4pt 0in 5.4pt;heigh=
t:.2in">
<p class=3D"MsoNormal" style=3D"line-height:105%"><span style=3D"font-famil=
y:&quot;Times New Roman&quot;,serif;color:black">Chemists &amp; Bio-Chemist=
s<o:p></o:p></span></p>
</td>
<td width=3D"213" nowrap=3D"" valign=3D"bottom" style=3D"width:160.0pt;bord=
er-top:none;border-left:none;border-bottom:solid windowtext 1.0pt;border-ri=
ght:solid windowtext 1.0pt;padding:0in 5.4pt 0in 5.4pt;height:.2in">
<p class=3D"MsoNormal" style=3D"line-height:105%"><span style=3D"font-famil=
y:&quot;Times New Roman&quot;,serif;color:black">Packaging Engineering<o:p>=
</o:p></span></p>
</td>
</tr>
<tr style=3D"height:.2in">
<td width=3D"361" nowrap=3D"" valign=3D"bottom" style=3D"width:271.0pt;bord=
er:solid windowtext 1.0pt;border-top:none;padding:0in 5.4pt 0in 5.4pt;heigh=
t:.2in">
<p class=3D"MsoNormal" style=3D"line-height:105%"><span style=3D"font-famil=
y:&quot;Times New Roman&quot;,serif;color:black">Contract Manufacturer's<o:=
p></o:p></span></p>
</td>
<td width=3D"213" nowrap=3D"" valign=3D"bottom" style=3D"width:160.0pt;bord=
er-top:none;border-left:none;border-bottom:solid windowtext 1.0pt;border-ri=
ght:solid windowtext 1.0pt;padding:0in 5.4pt 0in 5.4pt;height:.2in">
<p class=3D"MsoNormal" style=3D"line-height:105%"><span style=3D"font-famil=
y:&quot;Times New Roman&quot;,serif;color:black">Pathologists/ Pharmacists<=
o:p></o:p></span></p>
</td>
</tr>
<tr style=3D"height:.2in">
<td width=3D"361" nowrap=3D"" valign=3D"bottom" style=3D"width:271.0pt;bord=
er:solid windowtext 1.0pt;border-top:none;padding:0in 5.4pt 0in 5.4pt;heigh=
t:.2in">
<p class=3D"MsoNormal" style=3D"line-height:105%"><span style=3D"font-famil=
y:&quot;Times New Roman&quot;,serif;color:black">Corporate management<o:p><=
/o:p></span></p>
</td>
<td width=3D"213" nowrap=3D"" valign=3D"bottom" style=3D"width:160.0pt;bord=
er-top:none;border-left:none;border-bottom:solid windowtext 1.0pt;border-ri=
ght:solid windowtext 1.0pt;padding:0in 5.4pt 0in 5.4pt;height:.2in">
<p class=3D"MsoNormal" style=3D"line-height:105%"><span style=3D"font-famil=
y:&quot;Times New Roman&quot;,serif;color:black">Plant Managers<o:p></o:p><=
/span></p>
</td>
</tr>
<tr style=3D"height:.2in">
<td width=3D"361" nowrap=3D"" valign=3D"bottom" style=3D"width:271.0pt;bord=
er:solid windowtext 1.0pt;border-top:none;padding:0in 5.4pt 0in 5.4pt;heigh=
t:.2in">
<p class=3D"MsoNormal" style=3D"line-height:105%"><span style=3D"font-famil=
y:&quot;Times New Roman&quot;,serif;color:black">Equipment Manufacturers, s=
upplier &amp; Distributors<o:p></o:p></span></p>
</td>
<td width=3D"213" nowrap=3D"" valign=3D"bottom" style=3D"width:160.0pt;bord=
er-top:none;border-left:none;border-bottom:solid windowtext 1.0pt;border-ri=
ght:solid windowtext 1.0pt;padding:0in 5.4pt 0in 5.4pt;height:.2in">
<p class=3D"MsoNormal" style=3D"line-height:105%"><span style=3D"font-famil=
y:&quot;Times New Roman&quot;,serif;color:black">Purchase Heads<o:p></o:p><=
/span></p>
</td>
</tr>
<tr style=3D"height:.2in">
<td width=3D"361" nowrap=3D"" valign=3D"bottom" style=3D"width:271.0pt;bord=
er:solid windowtext 1.0pt;border-top:none;padding:0in 5.4pt 0in 5.4pt;heigh=
t:.2in">
<p class=3D"MsoNormal" style=3D"line-height:105%"><span style=3D"font-famil=
y:&quot;Times New Roman&quot;,serif;color:black">Hospitals &amp; physicians=
 data<o:p></o:p></span></p>
</td>
<td width=3D"213" nowrap=3D"" valign=3D"bottom" style=3D"width:160.0pt;bord=
er-top:none;border-left:none;border-bottom:solid windowtext 1.0pt;border-ri=
ght:solid windowtext 1.0pt;padding:0in 5.4pt 0in 5.4pt;height:.2in">
<p class=3D"MsoNormal" style=3D"line-height:105%"><span style=3D"font-famil=
y:&quot;Times New Roman&quot;,serif;color:black">Q.C Heads / Managers<o:p><=
/o:p></span></p>
</td>
</tr>
<tr style=3D"height:.2in">
<td width=3D"361" nowrap=3D"" valign=3D"bottom" style=3D"width:271.0pt;bord=
er:solid windowtext 1.0pt;border-top:none;padding:0in 5.4pt 0in 5.4pt;heigh=
t:.2in">
<p class=3D"MsoNormal" style=3D"line-height:105%"><span style=3D"font-famil=
y:&quot;Times New Roman&quot;,serif;color:black">Lab Directors/ Scientists<=
o:p></o:p></span></p>
</td>
<td width=3D"213" nowrap=3D"" valign=3D"bottom" style=3D"width:160.0pt;bord=
er-top:none;border-left:none;border-bottom:solid windowtext 1.0pt;border-ri=
ght:solid windowtext 1.0pt;padding:0in 5.4pt 0in 5.4pt;height:.2in">
<p class=3D"MsoNormal" style=3D"line-height:105%"><span style=3D"font-famil=
y:&quot;Times New Roman&quot;,serif;color:black">Quality Assurance &amp; R =
&amp;D list<o:p></o:p></span></p>
</td>
</tr>
<tr style=3D"height:.2in">
<td width=3D"361" nowrap=3D"" valign=3D"bottom" style=3D"width:271.0pt;bord=
er:solid windowtext 1.0pt;border-top:none;padding:0in 5.4pt 0in 5.4pt;heigh=
t:.2in">
<p class=3D"MsoNormal" style=3D"line-height:105%"><span style=3D"font-famil=
y:&quot;Times New Roman&quot;,serif;color:black">Laboratory Heads<o:p></o:p=
></span></p>
</td>
<td width=3D"213" nowrap=3D"" valign=3D"bottom" style=3D"width:160.0pt;bord=
er-top:none;border-left:none;border-bottom:solid windowtext 1.0pt;border-ri=
ght:solid windowtext 1.0pt;padding:0in 5.4pt 0in 5.4pt;height:.2in">
<p class=3D"MsoNormal" style=3D"line-height:105%"><span style=3D"font-famil=
y:&quot;Times New Roman&quot;,serif;color:black">Trade Dealers &amp; Suppli=
ers<o:p></o:p></span></p>
</td>
</tr>
<tr style=3D"height:.2in">
<td width=3D"361" nowrap=3D"" valign=3D"bottom" style=3D"width:271.0pt;bord=
er:solid windowtext 1.0pt;border-top:none;padding:0in 5.4pt 0in 5.4pt;heigh=
t:.2in">
<p class=3D"MsoNormal" style=3D"line-height:105%"><span style=3D"font-famil=
y:&quot;Times New Roman&quot;,serif;color:black">Manufacturing / Production=
 Engineering<o:p></o:p></span></p>
</td>
<td width=3D"213" nowrap=3D"" valign=3D"bottom" style=3D"width:160.0pt;bord=
er-top:none;border-left:none;border-bottom:solid windowtext 1.0pt;border-ri=
ght:solid windowtext 1.0pt;padding:0in 5.4pt 0in 5.4pt;height:.2in">
<p class=3D"MsoNormal" style=3D"line-height:105%"><span style=3D"font-famil=
y:&quot;Times New Roman&quot;,serif;color:black">Vender Development &amp; p=
urchase<o:p></o:p></span></p>
</td>
</tr>
</tbody>
</table>
<p class=3D"MsoNormal"><b><span lang=3D"EN-IN" style=3D"font-family:&quot;T=
imes New Roman&quot;,serif;color:black"><o:p>&nbsp;</o:p></span></b></p>
<p class=3D"MsoNormal"><span lang=3D"EN-IN" style=3D"font-family:&quot;Time=
s New Roman&quot;,serif;color:black">If your target audience is not mention=
ed kindly put it down in few words and would be easier to me for further pr=
ocedure.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-IN" style=3D"font-family:&quot;Time=
s New Roman&quot;,serif;color:black"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><b><span style=3D"font-family:&quot;Times New Roman&=
quot;,serif;color:black">Target Geography: ______________??</span></b><span=
 style=3D"font-family:&quot;Times New Roman&quot;,serif;color:black">
</span><span lang=3D"FR" style=3D"font-family:&quot;Times New Roman&quot;,s=
erif;color:black">(Example : USA, UK, Canada, Australia, etc&#8230;)<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Times New Roman&quo=
t;,serif;color:black"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><b><span style=3D"font-family:&quot;Times New Roman&=
quot;,serif;color:black">Target Job Title:&nbsp; __________________??</span=
></b><span style=3D"font-family:&quot;Times New Roman&quot;,serif;color:bla=
ck"> (Example: CEO, VP, Managers, Nurses, Directors, etc.&#8230;)<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-IN" style=3D"font-family:&quot;Time=
s New Roman&quot;,serif;color:black"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-IN" style=3D"font-family:&quot;Time=
s New Roman&quot;,serif;color:black">Await your kind swift response.<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-IN" style=3D"font-family:&quot;Time=
s New Roman&quot;,serif;color:black"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-IN" style=3D"font-family:&quot;Time=
s New Roman&quot;,serif;color:black">Best Regards,
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><b><span lang=3D"EN-IN" style=3D"font-family:&quot;T=
imes New Roman&quot;,serif;color:black">&nbsp;Ethel<o:p></o:p></span></b></=
p>
<p class=3D"MsoNormal"><b><span lang=3D"EN-IN" style=3D"font-family:&quot;T=
imes New Roman&quot;,serif;color:black">Marketing Specialist<o:p></o:p></sp=
an></b></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Times New Roman&quo=
t;,serif;color:black"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Times New Roman&quo=
t;,serif;color:black"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_SG2PR06MB2395706C3AB59964FCE176E7F1710SG2PR06MB2395apcp_--

--===============0967868466==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============0967868466==--
