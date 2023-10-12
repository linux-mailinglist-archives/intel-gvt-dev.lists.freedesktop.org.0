Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB857C71F7
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 12 Oct 2023 18:02:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72A4210E151;
	Thu, 12 Oct 2023 16:02:41 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03olkn2045.outbound.protection.outlook.com [40.92.58.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1542710E151;
 Thu, 12 Oct 2023 16:02:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=epqfLqLhxqs7YL0qV0nvjzJBV94exLEhhgjuYJggipPTG7KkLJ2vkm3478p3GZlBx1UwAx8w5iwv7+sc5+M0uX9oQl5RFiIQypH6DNr0dSj+W4G5VPlxfDYkqZXsYTPEcxEBqyK4oje+DpjFTG/vMW3MzDgFuSbb+Siso91Ecs2vi54HUi3dpqRk9t4lvOdA2Glfvh4I7kGC8Oo8vzv68v0tjjAhAHZ2i+VE7tzFblD9lMSf2+AxzAUa33fShwTsTR8olp/7Ce812xift5HFL/xbSAdAL9tLi8iwu+rbp2AYT3OXYATlxDSum4ZE+OGxF7mZq+YQCkNQr8TJkMmnfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FpBscWl1q3c+a9PP+NeGab0TVKuKYE+cUuwkeSEE4lE=;
 b=aMxuegy0gkw2V5W9YTxp8jm/GM64U+MbtZjzdeqJ5AnoA27WZ+wTjim5Am1VAWJeUC3ibwFA0hFQ0JWZ+eEq1w9W47dVSfpW56sI7IAmieINnMGonCZHCmpJ8a9rv1PWXAzGczTx5AiFkz08nJ0aCtNqHEHt95PaZcqa1zhNdhn6sVkR5o8Sin+uwX3NPuzLAmCUB09uPU4DBFYck2IyyJVoMGljulx4nBaaq6NBTcuHnI3F6OqQIgJoN4z8HXHtzse8MWw9y3ukqFUbU6JZLpTIP7T0NhRcyWy7SpUY5tqbWNDu+FDIJaHtB9l+4WXdHDcQXQLxL4qgdwSMqXFVng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from DU0PR03MB8833.eurprd03.prod.outlook.com (2603:10a6:10:40f::14)
 by DB9PR03MB7721.eurprd03.prod.outlook.com (2603:10a6:10:2c7::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.43; Thu, 12 Oct
 2023 16:02:31 +0000
Received: from DU0PR03MB8833.eurprd03.prod.outlook.com
 ([fe80::a353:a892:537f:dfa1]) by DU0PR03MB8833.eurprd03.prod.outlook.com
 ([fe80::a353:a892:537f:dfa1%7]) with mapi id 15.20.6863.043; Thu, 12 Oct 2023
 16:02:31 +0000
From: aa z <az56033@outlook.fr>
Subject: From:Mrs Becky Bell.
Thread-Topic: From:Mrs Becky Bell.
Thread-Index: AQHZ/SWBT5jvxNxK602izzksTSUrMA==
Date: Thu, 12 Oct 2023 16:02:31 +0000
Message-ID: <DU0PR03MB8833A7C990EFC62CAFC8856581D3A@DU0PR03MB8833.eurprd03.prod.outlook.com>
Accept-Language: en-GB, fr-FR, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-tmn: [nkd+uCtrMJxtS7aKkVQxea8C5dE0FAOo]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR03MB8833:EE_|DB9PR03MB7721:EE_
x-ms-office365-filtering-correlation-id: cf1fbb2e-1037-47c8-ad72-08dbcb3ca423
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jqOI5me/DZgjQUvaMyBFKHJEqSrwziaeZ2qRwkx3i82UCSsDg0jQtxz/uTqu5mGnlTzU8Hj34OfP2DvTKDd9VRrjUi74lbQ8JIEBj4oq4wiiQseBvAM3F3MKXE5Pg3DYALCcLtzR2840TFdrAgrAAFpovGmhI5S5arDRr/b+LKmpqbHztQDNxwyRj5HvEzlvqRF3aBtgy/E6OjygLhgAhMKpDSL10e1lTAhFtCai0G7FXOPmMpIztWdj3dRVDam/86ISqZIBLib+Wlqqk9NQqNtfzV+mNEzMlpxqtzke+VUok145ZeWzC3oLiUZp4z5Ge38jWYxU3iqnLHoGH16Nh8zcfApeldqr7QrorUPs7r02ztM3EVKfTpIR6K5/fk0QZpc9CyrPie+jOFj9savUY6cDb3NZrUclicwqW6UDQdVxfw0B/DPJAQims1GSz3MzTFjM9XDriSh68OO1c0Hu+QcW0/lLYP3Kloq/GjnjEww85J74mq5lnOxoYDCACiijUuKTsiiz9bRAPZxD4YxzneqRrqCWaDsirR2EA+5jnBkUM4SI1D5PS7ICi8nzfAsr
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?iMhTyl9xGLYmYCaQ/u1mazaLJ1HOudD4hVeTodffevMxUHyRGW24qXrNr4?=
 =?iso-8859-1?Q?+R6/QCeOv63iJdY8ike7B3XA9Uhv3MDOxCxPVmIah/qZKrYV3uYKfhSFLA?=
 =?iso-8859-1?Q?ErdzAHrYMze0p4F+QVO5tSuxK+OWNhaFsFOcTWnPVDt6vuAhkyv5oN0KTa?=
 =?iso-8859-1?Q?yWtiz9+7tUTktEBcG3w24TouaAt3reViHpX7rpUbvXYWmlIGoAKqDFl7Nz?=
 =?iso-8859-1?Q?FqvnjVxB7w1OGLXkqfOk3xrFCFNvX+j5HaHenXSQ0+NjblxcYGhuaxrMmj?=
 =?iso-8859-1?Q?09WH9Mq2717Z/JC3WldcRr7CYLpY/Av9ZoWWDpQGKc3rDKnSmIqkI7sl+N?=
 =?iso-8859-1?Q?NNydlxUBbFqukltR0dhDSoIX6xixYBn777+hXzRcL9OCbZGzo8KGpNbomB?=
 =?iso-8859-1?Q?kDsuKXMQf1i1FHHpc6tuYrQ2a414rxG20BH+OUpK6TwDNpOA7l7w3E0j+r?=
 =?iso-8859-1?Q?w+HAwIAuTjDhQrJdFlu5AstxUxu+G+xDZFIdAJ2TcE99h4YFquZDN1YOqY?=
 =?iso-8859-1?Q?6WUEPdQRWbV7V4F+YYEoQKfBsiTXeLOiphTHZbI1V6p/j6xkFHgTMHtnfl?=
 =?iso-8859-1?Q?9rFyET/M52mcuXDoVLaabwJ6yZhKVHwvrIFALIB7o++1KR8sg798j60RAt?=
 =?iso-8859-1?Q?g/s0HwF/zuXqRYnugzGbdhzOgz6mAkWwrgFKZR/eQ7Y8h5HQzBgXZI+4qw?=
 =?iso-8859-1?Q?JD65mayzgTyo6UjjZBUDWc99M//tvsJkfFXQ+72WYO5sh/9GNrThhoNzg5?=
 =?iso-8859-1?Q?uu/ZGF01XdyuzajMb2RkRfkREULyebDhiqB5BhveDinBQHQO/q0legDL54?=
 =?iso-8859-1?Q?N4ehuYeg5K9uP3xgycaFLXMsKgZwrW9+SA49kWSZEttmbjnnjsOI52pgNL?=
 =?iso-8859-1?Q?VXtBy/zntYmG8RJYks0tKnMoONbnW/JlHVK6Z2nqyWx2eMpbSB6HpeGSTy?=
 =?iso-8859-1?Q?hM0rI+QR/KbKTGg/ZgIS4goXfbEc1P27ix8vACeGy43enTC/exDjL1H+AW?=
 =?iso-8859-1?Q?HjvKuvr7VvBbNzVMB5iW9sHUcJipBNCiBK868UOQK80cPOxsTu18n5pPPI?=
 =?iso-8859-1?Q?CT8EQTJxUT20TxpW/9PC2Hao3wqdIkWTnZKev1jagixMt4uUV40rlBqQ9s?=
 =?iso-8859-1?Q?xf6Pn+Gi4tYjhlpD/JuQKLudMmoe0HhJLTDoRnU/vaivBpFLBe8Ql/npbc?=
 =?iso-8859-1?Q?ViQL2C1ww9F5t7ouHJEymOtNPYyfskEptwKhKyE4MehvMXFzXhQmZdQC?=
Content-Type: multipart/alternative;
 boundary="_000_DU0PR03MB8833A7C990EFC62CAFC8856581D3ADU0PR03MB8833eurp_"
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-76d7b.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR03MB8833.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: cf1fbb2e-1037-47c8-ad72-08dbcb3ca423
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2023 16:02:31.5037 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB7721
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

--_000_DU0PR03MB8833A7C990EFC62CAFC8856581D3ADU0PR03MB8833eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



I am Mrs Becky Bell of Auburn, Washington who won the $754,550,826 Million =
Powerball Jackpot on February 6, 2023. to show my appreciation to God Mysel=
f and my family are donating $750,000 to 20 people, hence you are getting t=
his email. Reply to this email for more information and how to receive the =
donation.
Thanks
Mrs Becky Bell.

--_000_DU0PR03MB8833A7C990EFC62CAFC8856581D3ADU0PR03MB8833eurp_
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
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div class=3D"elementToProof">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature">
<div>I am Mrs Becky Bell of Auburn, Washington who won the $754,550,826 Mil=
lion Powerball Jackpot on February 6, 2023. to show my appreciation to God =
Myself and my family are donating $750,000 to 20 people, hence you are gett=
ing this email. Reply to this email
 for more information and how to receive the donation.
<div>Thanks </div>
Mrs Becky Bell.</div>
</div>
</div>
</body>
</html>

--_000_DU0PR03MB8833A7C990EFC62CAFC8856581D3ADU0PR03MB8833eurp_--
