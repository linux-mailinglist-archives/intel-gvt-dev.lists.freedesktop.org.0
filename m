Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD1B12A4D6
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 25 Dec 2019 01:00:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0295289DFD;
	Wed, 25 Dec 2019 00:00:39 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-oln040092075061.outbound.protection.outlook.com [40.92.75.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B55DE89E8C;
 Wed, 25 Dec 2019 00:00:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZCwPfPwWCGpy6ZuI20ATy9OJDkzW2DuWjjzyQTP2o49LAjhbGWU9xibUG7nTn41PaDIeYLoml0b3QVvmgOcFNrYZkRY8eti5H+72xL/oHYOBrPQjl+gOJMC6ij+kaKycdQUJlXsjyqEjCA56udBzO3xb+sZCVFMCNk7pQsoGq1Cns2FymCzPg6pKdgqTAXrVlzWvsk14TiKHe8rOYpKsSSkP0haDS7ysc2LKGj1DYkcihMJEk+RDGHeSvN1aNtTFNZssPBIisKU5qgr8hjtSLoQ381S2XlFinl6HTZlXcWHDc7SG36vHAYvLTEp4w2tVBK4At3i/JNWpAfmeyIzlrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AcBCxuSoz2Eu/qtC8EcAZ9mhOcK4vUCD8mD0w+/18KA=;
 b=jEJxwA//WdWIFa0WgR3+L0fkYJ+CyXsmAPGjxvD79Xf4DddHKAEHb8x+rJJC3ja3SFJxDj9xvhlZNGHbLapcK2WWaEupWoQ68hPJVk1barjb6lW3Lr8YHOpYs4ZX8NUE9eDBpZahwqkrXEXUTu9AQsjEnABd67LvRGk7rQU7C9bJh3x7srVzotWbozjj9hVQ32RxvrGZyHvBWtVIcU5WAObDP8Qd9liTQUhce1fbgPAkc9P7k9nBo+NymUWxZry9vJ1mfCJB7cuilaljavp6GwZx1TEGt3VqgxWUhY1hyED9IfC9X2zfRf2o7vXoxvTdB8mdV8eqs7XRkxTmym3aRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AcBCxuSoz2Eu/qtC8EcAZ9mhOcK4vUCD8mD0w+/18KA=;
 b=URq1x26jndGJKin0Ppc2djUCnzHGXKTeRDGvgTNN4ncW3CzstBi5Gq40pXFDc+Rtcm97+b5yC6kAit+cQlF1IlJ6U8ZMpRZf3Z85uL0RRMABTxqqaclBzorHIKokpd9S3i56HxNsIDxlB9tAx24YXa8wYhQbKX5gSy3HaS4zQeeVqBFkSCxgblvh1X6jmHDFgGXjb72Y1Hty8+BLDqC7eEsNIZVTGMwJSNCt5i5XGeM3k7ppVkTWuemb0iOCpu/Hk+DOjF2tRso7jqfvCkL56RFc1k5A7xbhmX+Igwj8uG3R4UXxRxEjaXQKXt1VKPB/Hcnexb22osvDnokxRGKxTA==
Received: from DB3EUR04FT035.eop-eur04.prod.protection.outlook.com
 (10.152.24.55) by DB3EUR04HT140.eop-eur04.prod.protection.outlook.com
 (10.152.25.106) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2581.11; Wed, 25 Dec
 2019 00:00:34 +0000
Received: from AM6PR07MB4008.eurprd07.prod.outlook.com (10.152.24.53) by
 DB3EUR04FT035.mail.protection.outlook.com (10.152.24.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2581.11 via Frontend Transport; Wed, 25 Dec 2019 00:00:34 +0000
Received: from AM6PR07MB4008.eurprd07.prod.outlook.com
 ([fe80::fdaa:780:ae36:1ac3]) by AM6PR07MB4008.eurprd07.prod.outlook.com
 ([fe80::fdaa:780:ae36:1ac3%7]) with mapi id 15.20.2581.007; Wed, 25 Dec 2019
 00:00:34 +0000
From: Miran Posser <miran20089@hotmail.com>
Subject: I wish you all the best
Thread-Topic: I wish you all the best
Thread-Index: AQHVucABZids8jUWC0OCe+miPJBQhQ==
Date: Wed, 25 Dec 2019 00:00:34 +0000
Message-ID: <AM0PR07MB4002580507486B41ABB2786B852E0@AM0PR07MB4002.eurprd07.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:F95A1F82021291D62EC6F0764A06F9EF0157089FBE86634011C3FB1B59CF8F0E;
 UpperCasedChecksum:B8F49303BD544DACC27075ED3FCF602C5B14B90DA786516C2A3C1B0D88D54D2E;
 SizeAsReceived:7089; Count:41
x-tmn: [JxyQAS/4CHQKCpw6mfTD8xUp+pRKnTM2]
x-ms-publictraffictype: Email
x-incomingheadercount: 41
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 4ed664ab-323d-4fdd-dcfe-08d788cd7718
x-ms-traffictypediagnostic: DB3EUR04HT140:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QDOU7Ypykg6q0kWnctEcFeT+FtNHBwQM0N03N/Og63vlgbLUTX2PWJhYPFfRUwd2VizXEKKcZlJ0VdqMdg6+biod3hqp1SWAhV4Klzl0eGFxdRnUOurCtEztHwS7D+Oez3usw3j2dTS8NR5KYw8FqVypUjuM1DSlY9HqlxWkLRnUcIzmtY6HBtxl13Pmk9i5
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ed664ab-323d-4fdd-dcfe-08d788cd7718
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Dec 2019 00:00:34.2916 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3EUR04HT140
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
Content-Type: multipart/mixed; boundary="===============0031827215=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--===============0031827215==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_AM0PR07MB4002580507486B41ABB2786B852E0AM0PR07MB4002eurp_"

--_000_AM0PR07MB4002580507486B41ABB2786B852E0AM0PR07MB4002eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I hope this email finds you.
I want to know if you received the last message I sent you?
I really want to hear from you.
wish you all the best.
Miran Posser....
I look forward to your response.

--_000_AM0PR07MB4002580507486B41ABB2786B852E0AM0PR07MB4002eurp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt; col=
or:rgb(0,0,0)">
</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt; col=
or:rgb(0,0,0)">
<div style=3D"margin:0px; font-family:Calibri,Helvetica,sans-serif; backgro=
und-color:rgb(255,255,255)">
<span style=3D"margin:0px"><font face=3D"comic sans ms, sans-serif">I hope =
this email finds you.<br>
</font></span></div>
<div style=3D"margin:0px; font-family:Calibri,Helvetica,sans-serif; backgro=
und-color:rgb(255,255,255)">
<font face=3D"comic sans ms, sans-serif"><span style=3D"margin:0px"></span>=
</font></div>
<div style=3D"margin:0px; font-family:Calibri,Helvetica,sans-serif; backgro=
und-color:rgb(255,255,255)">
<div style=3D"margin:0px"><font face=3D"comic sans ms, sans-serif">I want t=
o know if you received the last message I sent you?<br>
</font></div>
<div style=3D"margin:0px"><font face=3D"comic sans ms, sans-serif">I really=
 want to hear from you.<br>
</font></div>
<div style=3D"margin:0px"><font face=3D"comic sans ms, sans-serif">wish you=
 all the best.</font></div>
</div>
<font face=3D"comic sans ms, sans-serif" style=3D"background-color:rgb(255,=
255,255)">Miran Posser....<br>
I look forward to your response.&nbsp;&nbsp;</font><br>
</div>
</body>
</html>

--_000_AM0PR07MB4002580507486B41ABB2786B852E0AM0PR07MB4002eurp_--

--===============0031827215==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0031827215==--
