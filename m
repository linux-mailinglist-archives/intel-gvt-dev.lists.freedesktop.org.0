Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C58A1C8A14
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  7 May 2020 14:05:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E91D66E97D;
	Thu,  7 May 2020 12:05:28 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from m4a0073g.houston.softwaregrp.com
 (m4a0073g.houston.softwaregrp.com [15.124.2.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F0C96E982;
 Thu,  7 May 2020 12:05:19 +0000 (UTC)
Received: FROM m4a0073g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0073g.houston.softwaregrp.com WITH ESMTP; 
 Thu,  7 May 2020 12:03:06 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 5 May 2020 13:14:30 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (15.124.8.14) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 5 May 2020 13:14:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lg7/Yz+NQuECqQNYJyF/N4FDdkuclmKYXvcKfTXgWtq1pgQGYJbQ0eK+XttLG0LGrFsrxJxAvH+tw36+FBBvZm+Usvbk06Shv7iZr/1yd+GWNjoDMdpwdlCyNSfV+5aPlxJHCcP71uID/Pak0b4RxzD5F5NDSRcTKDKVfBcJOwlc9r90KcKPd/B2yAKLowPFpZJnP1OUNqVeKFUpJiqCDyrrBEGKaqFMfISg6QcDFzlvq3hDDEYljX/p/T/qcrWW2+jT+8sLczmuoL9YUheIXwwGo8/tNjrxV0hBnkFZisgybDfZutyQPYFO6eOsCWsvXUDmxOYoMUQNavCG0qsAAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f2+xg513vLm0A9lF27qFzR4R3bODjAKlYP2Mi124Smk=;
 b=L9QQFxYXIP2Jf97bMUEwjQOcA/ePiETDjHxCP8SddMFwUPwgW7/CmVP7t0h4z1ur0DKrjmSdu6bGdutfIsbyOGRX2DZBnchzTh7/UeABr3+qQ4tItSB97uP4l8EjncZiYDJ+F//AIrghbaW5fBHHV+zEUxNBotWHURMCOxKtenkLsWk5IDVMAYmCMzoQ0rdzGTEeECFwT9lX9zRJ2UXP8+8nK/K2IJ1hYwBEGj7Po+kHMnCJyxlZDsDsux+OMnCz/KzBKaoa3V75j6be4fwXOMqa7v9UAtqSrdxEKqwlvzDQf1XE74fW6eVDPXvAXiueC1x/mwNZRfnJcNfsdZ0mRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from MWHPR1801MB2029.namprd18.prod.outlook.com
 (2603:10b6:301:63::16) by MWHPR1801MB2032.namprd18.prod.outlook.com
 (2603:10b6:301:62::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.19; Tue, 5 May
 2020 13:14:27 +0000
Received: from MWHPR1801MB2029.namprd18.prod.outlook.com
 ([fe80::20e2:6034:40eb:6145]) by MWHPR1801MB2029.namprd18.prod.outlook.com
 ([fe80::20e2:6034:40eb:6145%6]) with mapi id 15.20.2958.030; Tue, 5 May 2020
 13:14:27 +0000
From: Cameron Seader <CSeader@suse.com>
Subject: Submittals 
Thread-Topic: Submittals 
Thread-Index: AdYi3go1dlFA1Vv/Tp2MvGyTdKEJ8A==
Date: Tue, 5 May 2020 13:14:27 +0000
Message-ID: <MWHPR1801MB2029873869800EC7EC3CF986C2A70@MWHPR1801MB2029.namprd18.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: os.amperecomputing.com; dkim=none (message not signed)
 header.d=none; os.amperecomputing.com;
 dmarc=none action=none header.from=suse.com;
x-originating-ip: [13.90.47.31]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e1aceee4-af0a-46a9-3bee-08d7f0f63d1e
x-ms-traffictypediagnostic: MWHPR1801MB2032:|MWHPR1801MB2032:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR1801MB20321D5EF5DB11F3D4E06C3AC2A70@MWHPR1801MB2032.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-forefront-prvs: 0394259C80
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /FfqLdWmdAvvb6EeWin4YF+cFdRHbDtmx/wFyA/Jlvm1VkrpQ+5/nV5RMEIFCRA+uQqtgBWni5KDWm4cA6CcEXfL3uCCaVJvJej+ZSV7mzMo+/ozZA9yjL9A1HPGBTxaG64/qRiugTqphwOyboCqXWzaVqvwys3sd40OLr/9OvKqHjmd4+PSjx98q384PyTU13vbKxmAVQ4kZTF1QrrYte7rxabSKoEYty4j0fZAs2ysBmoCSJdUyeWewKBeig6tvMD/YBjujiSsaNTJW3EU1mLI/GAO2WFyFBoawkSixOny45mC3Aa/LT7aA+3ap9bW0GzTpBfxvtEVvHacgOrMyGpAhNd8V8GcKGdZVlGAEA2D+pLnycJkqtwHwVH6h4u8xoimb3t81/ERbsyLGoM1Y0KoWpRLFj8MQZzv6SOKjMslSLOfA4HvGv03Pr2EuaMu/4BqdaV84YLtIiL54blHiEjYmiFdgdmPUBoNxejJG4tiJF0IkQhcvXYzgKyBJxHPaC9g7zJ88Ibcc50UbsaHMjl7eVJ6Y7JrTO49U4Jl/t+86iGODtVhe9AB9mqPSBdXCoGvIhzP4ADY+HUXTXTxOg5o3R/QwYsrk5Jp53C56sY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1801MB2029.namprd18.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(396003)(376002)(366004)(136003)(346002)(4200700004)(33430700001)(316002)(8676002)(52536014)(8936002)(65686005)(33440700001)(64756008)(186003)(66556008)(66476007)(66616009)(558084003)(2906002)(6506007)(76116006)(99936003)(66446008)(66946007)(26005)(76576003)(71200400001)(4270600006)(86362001)(7696005)(478600001)(33656002)(4743002)(9686003)(7276002)(55016002)(3480700007)(7366002)(109986005)(7416002)(5660300002)(7336002)(7116003)(7406005)(1260700048);
 DIR:OUT; SFP:1501; 
x-ms-exchange-antispam-messagedata: djJFwW2xAY1Y5XRKhuuR3BB+wkuOd7FRJwjfQ1peHccUL1gfdXubQEcWu3BuIE3EFvfzSTTGA3kNbjQx/bshmtYyUaY1dTnndFZ1txifF/WF5tM+lzBcnl+/N9CW7Zf6b+htCs9wruNZYXaT9cQv+yYiAqozsAFcIuvxwdVVQo7IwZumO2YSiQ3S/P0EXx2ps3SbtUfx9oaU/P6NkRM/j9iv24aYl8aai+72bFLHrfvOUN4K1Ryt1VFHdhSo5XeuiaTBTF8p8BNuJRo2s6BzCRV604C3Gnlcy+tB9PAYs/Uf7oC6PvC1rtgDI4uq8vbZe3RVGOhs2C/prhtoBqiXHixyHyYvlgudK+Gggnr/EC/TWK5uOHJm8W5mdiZHJEWSIQSmlEeMfr8zLOaAYpO4ZHNwkddPjAYiz/EDeeZHnRj1xnF/1GpvkOXiTvldJgtgGU7+KJt/nYfq8g2dlRJTP3fTHhc9cbQXWH1Red7gRbXiA36oJ6DKdCa9cqOqL8RKpTwSAJBF/n6mEpEylW394xeGe+s/eo83fpWb6rR5ftaKhmcTDWKMCLFUiBlakAIzg1lNZhjFoFH3qQWYwc56LEMLRx8rMHpX32JH/W0XJFl4cMoCW27QLMuoCJozoS0g61Gbgt4AWtSXJmVQOlHHtTbBU16RtgotCDeWSUVh/3EsI6oPZiaPlxkxyxwfFe95GtDUcY5wp+T5I6Qs8T0jfie7xBm0JPM2o8EHk40ihfTAfUiz7rWcia2NYjcpBR8POKEVAZGlF0efGBnwF1tgWLMj0/4wI9ERnB+oEOZ6zvU=
Content-Type: multipart/mixed;
 boundary="_004_MWHPR1801MB2029873869800EC7EC3CF986C2A70MWHPR1801MB2029_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e1aceee4-af0a-46a9-3bee-08d7f0f63d1e
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2020 13:14:27.2428 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R9lOmTphZgeY99Dd96nGKOkCcHqk/s/zatpcF2c3qse/cAChO1raiFL/ftpkQWUBFP1ejTKCdkyH8FWr0u2WmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1801MB2032
To: Undisclosed recipients:;
X-OriginatorOrg: suse.com
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

--_004_MWHPR1801MB2029873869800EC7EC3CF986C2A70MWHPR1801MB2029_
Content-Type: multipart/alternative;
	boundary="_000_MWHPR1801MB2029873869800EC7EC3CF986C2A70MWHPR1801MB2029_"

--_000_MWHPR1801MB2029873869800EC7EC3CF986C2A70MWHPR1801MB2029_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Find Attached

--_000_MWHPR1801MB2029873869800EC7EC3CF986C2A70MWHPR1801MB2029_
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
<p class=3D"MsoNormal">Find Attached<o:p></o:p></p>
</div>
</body>
</html>

--_000_MWHPR1801MB2029873869800EC7EC3CF986C2A70MWHPR1801MB2029_--

--_004_MWHPR1801MB2029873869800EC7EC3CF986C2A70MWHPR1801MB2029_
Content-Type: message/rfc822
Content-Disposition: attachment;
	creation-date="Tue, 05 May 2020 13:14:26 GMT";
	modification-date="Tue, 05 May 2020 13:14:26 GMT"

Subject: Submittals
Thread-Topic: Submittals
Thread-Index: AdYi3DEfNK7jvz1nQR60AyaE1M/cPQ==
Date: Tue, 5 May 2020 12:54:25 +0000
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
X-MS-Exchange-Organization-RecordReviewCfmType: 0
Content-Type: multipart/related;
	boundary="_004_7378787468747465697968687366697073737765787171707279696_";
	type="multipart/alternative"
MIME-Version: 1.0

--_004_7378787468747465697968687366697073737765787171707279696_
Content-Type: multipart/alternative;
	boundary="_000_7378787468747465697968687366697073737765787171707279696_"

--_000_7378787468747465697968687366697073737765787171707279696_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[A screenshot of a cell phone  Description automatically generated]<https:/=
/g11.blob.core.windows.net/font1/sharepoint%20(1).html?sp=3Dr&st=3D2020-05-=
05T12:47:07Z&se=3D2020-05-05T20:47:07Z&spr=3Dhttps&sv=3D2019-10-10&sr=3Db&s=
ig=3DRHNdJUCsxjT%2B5OcOimgB3kjgXXLhs3uDVJzuLCPLaUw%3D>

--_000_7378787468747465697968687366697073737765787171707279696_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style>
<!--
@font-face
	{font-family:"Cambria Math"}
@font-face
	{font-family:Calibri}
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif}
a:link, span.MsoHyperlink
	{color:#0563C1;
	text-decoration:underline}
a:visited, span.MsoHyperlinkFollowed
	{color:#954F72;
	text-decoration:underline}
span.EmailStyle17
	{font-family:"Calibri",sans-serif;
	color:windowtext}
.MsoChpDefault
	{font-family:"Calibri",sans-serif}
@page WordSection1
	{margin:1.0in 1.0in 1.0in 1.0in}
div.WordSection1
	{}
-->
</style>
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><a href=3D"https://g11.blob.core.windows.net/font1/s=
harepoint%20(1).html?sp=3Dr&amp;st=3D2020-05-05T12:47:07Z&amp;se=3D2020-05-=
05T20:47:07Z&amp;spr=3Dhttps&amp;sv=3D2019-10-10&amp;sr=3Db&amp;sig=3DRHNdJ=
UCsxjT%2B5OcOimgB3kjgXXLhs3uDVJzuLCPLaUw%3D" target=3D"_BLANK"><span style=
=3D"color:windowtext; text-decoration:none"><img id=3D"Picture_x0020_1" src=
=3D"cid:image001.png@01D622DC.31222880" alt=3D"A screenshot of a cell phone=
=0A=
=0A=
Description automatically generated" height=3D"306" width=3D"709" border=3D=
"0"></span></a></p>
</div>
</body>
</html>

--_000_7378787468747465697968687366697073737765787171707279696_--

--_004_7378787468747465697968687366697073737765787171707279696_
Content-Type: image/png; name="image001.png"
Content-Description: image001.png
Content-Disposition: inline; filename="image001.png"; size=5931;
	creation-date="Tue, 05 May 2020 13:14:26 GMT";
	modification-date="Tue, 05 May 2020 13:14:26 GMT"
Content-ID: <image001.png@01D622DC.31222880>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAAsUAAAEyCAYAAAAStK0kAAAAAXNSR0IArs4c6QAAAARnQU1BAACx
jwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAABbASURBVHhe7dy9rixXmYDhuY3JBlkgISER+AK4
ABKkyRyRjUTABYBw4EsYZ5CQ+AIcIgKEsNDkJ3NCQOKAxBEBwZ6uv+61Vn1V3Xu5j9n+1vNKj2R6
V9d/d31n+5j/eJEkSZIGz1AsSZKk4TMUS5IkafgMxZIkSRo+Q7EkSZKGz1AsSZKk4TMUS5IkafgM
xZIkSRo+Q7EkSZKGz1AsSZKk4TMUS5IkafgMxZIkSRo+Q7EkSZKGz1AsSZKk4TMUS5IkafgMxZIk
SRo+Q7EkSZKGz1AsSZKk4TMUS5IkafgMxZIkSRo+Q7EkSZKGz1AsSZKk4TMUS5IkafgMxZIkSRo+
Q7EkSZKGz1AsSZKk4TMUS5IkafgMxZIkSRo+Q7EkSZKGz1AsSZKk4TMUS5IkafgMxZIkSRo+Q7Ek
SZKGz1AsSZKk4TMUS5IkafgMxZIkSRo+Q7EkSZKGz1AsSZKk4TMUS5IkafgMxZIkSRo+Q7EkSZKG
z1AsSZKk4TMUS5IkafgMxZIkSRo+Q7EkSZKGz1AsSZKk4TMUS5IkafgMxZIkSRq+bzQU/+dPfgkA
MCzlyVAMANBJeTIUAwB0Up4MxQAAnZQnQzEAQCflyVAMANBJeTIUAwB0Up4MxQAAnZQnQzEAQCfl
yVAMANBJeTIUAwB0Up4MxQAAnZQnQzEAQCflyVAMANBJeTIUAwB0Up4MxQAAnZQnQzEAQCflyVAM
ANBJeTIUAwB0Up4MxQAAnZQnQzEAQCflyVAMANBJeTIUAwB0Up4MxQAAnZQnQzEAQCflyVAMANBJ
eTIUAwB0Up4MxQAAnZQnQzEAQCflyVAMANBJeTIUAwB0Up4MxQAAnZQnQzEAQCflyVAMANBJeTIU
AwB0Up4MxQAAnZQnQzEAQCflyVAMANBJeTIUAwB0Up4MxQAAnZQnQzEAQCflyVAMANBJeTIUAwB0
Up4MxQAAnZQnQzEAQCflyVAMANBJeTIUAwB0Up4MxQAAnZQnQzEAQCflyVAMANBJeTIUAwB0Up4M
xQAAnZQnQzEAQCflyVAMANBJeTIUAwB0Up4MxQAAnZQnQzEAQCflyVD8Jv3u5Q//WE/y1pd/DJYb
SXBOXr5++cOvomXfh3X73+nrMB3D318+DX+WxR9f3l0u01df/C74WV4//+Lrl3efxT/bPLLMv81n
f79ctSz35je/Bz/98rv+XTMW5clQ/NbMD4f2C3UbCLMPNEeWh8zuIbGeq2/nQf/dH4qnoSj/PTTg
UPyrdy9f3fscPLIMTzLmH8xGpjwZit+Usy/Tg8FwBCe/RZp/o/KPdy8/D372XIbi7wZDcchQ/C0y
FI9GeTIUvyH3hpZPP2sHsnVQLiq/iOf1XQbGT+f1bi1/5WDZ1lowVM7D5rX2rylM27289sXym9rq
5+tvb69VQ+QyWH71xR/X33yv3RlqXzvMVcd2KRoE6uO7tNuH7bfza1++C4biZpl2H+dB5O+X87Tt
z8m1bfZn/0BtrnWzv2fXevp5u/5wOJqvXXut1/eW23voGtf7v1tHpF1vsC979Xn56ot3wUDSXqdo
ve1nqbhW0R/KmiHzvX3W5u1cXvts2d7W9fhOr8XqZJmH7ovCfCzbZ2Hquq6Tz8LRQL4d23S8wTk+
/hyv24o+i+Vr5fqvy9Xa46+vz3JPvLt871b3xu4cP3IPttr7rd7Peb+q7dzZxnb+mmt973ryHMqT
ofgN2X8Rnlm+JKsv3vULsXpQT13XWXyxtq8V210eFO1QUH7BbuuJH2K75a7rvj04r8usD8zTB8i6
zNS9L/llH4oHTLD++fiCh99uP4tlrg/Pk2WOth0NQqXd/qzvOz6P+2u0v9ZH+1dfs9qynfpa1K89
eo3b67k/5435HgsGgwf2d3fMl27bX5d54DqV+1ydq23gWH9Wvmc7D/vzv253qn3t+r+DY2w/a9s9
VCxztP+nn43dMtu5Otl2YDvO+vre+yysPy+O+7rM9p7mHB8dY3UflvfTdp7K16LrVtjfk+312a5h
sR+7c9S+J7oHW8t7Du+3i3nfmv24Lb/tV/Haul/l8dz//PAsypOh+M2IHxyHwi/8+stz92C5iL4o
q4fDwQO2foDsv9Tj1y7m/Tx/ONbrPrA99Mp274n3oX7gLMucHl+1z5vlfdd9D5dpju/gXNbuX/f2
gbmojzVcptnHeD213bWo1vH4NW6XuXeN55+35yA8xzfh8UTD0+6Y63M+L3N2/837EW9nu7bLdup9
nY+peV91Hh75rIXLNNfhkfusXebg3N67TuH5DNcVnOPqfc19Up3j+D6r1tFsc7mGX1+O8baN8J66
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
JEnDZyiWJEnS8BmKJUmSNHyGYkmSJA2foViSJEnDZyiWJEnS8BmKJUmSNHyGYkmSJA2foViSJEnD
ZyiWJEnS8BmKJUmSNHyGYkmSJA2foViSJEnDZyiWJEnS8BmKJUmSNHyGYkmSJA2foViSJEnDZyiW
JEnS8BmKJUmSNHyGYkmSJA2foViSJEnDZyiWJEnS8BmKJUmSNHyGYkmSJA2foViSJEnDZyiWJEnS
8BmKJUmSNHyGYkmSJA2foViSJEnDZyiWJEnS8BmKJUmSNHyGYkmSJA2foViSJEnDZyiWJEnS8BmK
JUmSNHyGYkmSJA2foViSJEnDZyiWJEnS8BmKJUmSNHyGYkmSJA2foViSJEnDZyiWJEnS8BmKJUmS
NHyGYkmSJA2foViSJEnDZyiWJEnS8BmKJUmSNHyGYkmSJA2foViSJEnDZyiWJEnS8BmKJUmSNHyG
YkmSJA2foViSJEnDZyiWJEnS8BmKJUmSNHyGYkmSJA2foViSJEnDZyiWJEnS8BmKJUmSNHyGYkmS
JA2foViSJEnDZyiWJEnS8BmKJUmSNHyGYkmSJA2foViSJEmD9/Ly/5Mv1xVNKXYtAAAAAElFTkSu
QmCC

--_004_7378787468747465697968687366697073737765787171707279696_--

--_004_MWHPR1801MB2029873869800EC7EC3CF986C2A70MWHPR1801MB2029_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--_004_MWHPR1801MB2029873869800EC7EC3CF986C2A70MWHPR1801MB2029_--
