Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 002031D978F
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 19 May 2020 15:22:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8216188AEF;
	Tue, 19 May 2020 13:22:47 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-oln040092074073.outbound.protection.outlook.com [40.92.74.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D8836E33A;
 Tue, 19 May 2020 13:22:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aBaahU5KUetrv0QtN0Sc45oMawUyL/2u1C3X81uSHTbXM6eiABTT6ZEeYHEVz6zBtTJKVRWaZC9Xr2eGBmCxVMgrj8SXa72gPSQDd4taZiyW2JOuGi3cXUibrmHZzy5CxeFZD72tGeJGyN5eEgtKGcov87rIB1Ep6oNTOQkhI/24LPj5+4o/fswEU89klXT3lhAlNzfXKe70eu6M2Q6qkP2lLcQVSJsYsF9m/TnV79Y2t/AGNztl0Bgc71wvFrhxpfPJhfsu2If1fV+cr9h271pmllhWGI7FTraPQWTdr0Ja721LfECfgZaeTwGm6TH416ruLvGV+JTo6Mhk5YYpvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GO9Gpwe92Mtr8uDXdnEPx96rQ298FAyou+tiwcEBefQ=;
 b=DOO5iH20d64pvP7fV9usU0iy8bzsTWpTr/4/nABzonw6+1MEPWD06BleUVnUi5NRCg4BsISqctpJhzIKTcAeU8N80+l6kxhJFyAxDLKayKsB+4ANSjBTaPKxXPx02v4XOM9qL5ss679a8R2sovKNSTa22seZHGCHTKpobZKYXuxdyV3kVKjjd2R/O1skjpYbOvir9SnwRwWnT4WP5gs6OC1UI5Ne1cmYh7+Sl+ZrSQXnVJRNFnTYTXS8UEfFP7ACk40Nah8Msx2ClmlE/yQX8FTOzYVdmkptNTQ470XOhf+S72+n38sDADEYb3h/Kl2duAFq1w3hDwZQmRaCbUjGgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GO9Gpwe92Mtr8uDXdnEPx96rQ298FAyou+tiwcEBefQ=;
 b=AcfipzeRJajgl7Zl99NfXF5BEtORNytPgLDPqctTbzTY3/PPsXde17cbdymZn8B7VlxgAuGVgtIIG3Sz5iQEmO64KV4Fa6UttXXspZN4fcJxx34Cmm31Dc2g5gk7Ci+cOxDQNf9iMbOEr2PiLtyG+HJM702i10PtPFbnSI5xi32a/Hy3OllFNcuUFoF7P1qUYK8gkZ5JzPo5ACfw+NxymZhs2un/GmjB7kc1qHwKvH8qtnqAqd3tYmIDe26r2iUE0m3bRw4gEyjOjo6GS+IYPWSsVtFWWoIbpRRoaV4hEAsyTNvh5kG+7POSe08TAlBdEOgw1W1syRHHR2gU4w5OsQ==
Received: from HE1EUR04FT019.eop-eur04.prod.protection.outlook.com
 (2a01:111:e400:7e0d::4f) by
 HE1EUR04HT236.eop-eur04.prod.protection.outlook.com (2a01:111:e400:7e0d::421)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.19; Tue, 19 May
 2020 13:22:42 +0000
Received: from DB7PR04MB4124.eurprd04.prod.outlook.com
 (2a01:111:e400:7e0d::48) by HE1EUR04FT019.mail.protection.outlook.com
 (2a01:111:e400:7e0d::117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.19 via Frontend
 Transport; Tue, 19 May 2020 13:22:41 +0000
Received: from DB7PR04MB4124.eurprd04.prod.outlook.com
 ([fe80::872:91f:9c89:63a5]) by DB7PR04MB4124.eurprd04.prod.outlook.com
 ([fe80::872:91f:9c89:63a5%3]) with mapi id 15.20.3000.034; Tue, 19 May 2020
 13:22:41 +0000
From: MA KM <didy2tds@outlook.com>
Subject: My Greetings 
Thread-Topic: My Greetings 
Thread-Index: AQHWLeBxPr03WJi6MkOfjKg835P5SQ==
Date: Tue, 19 May 2020 13:22:41 +0000
Message-ID: <DB7PR04MB41243B4C9EC71B0BCCB666F09DB90@DB7PR04MB4124.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:485DABD354150AC86B0AAF631D97A3BFE2C2622D551091EC8E7B31D989B040A0;
 UpperCasedChecksum:05188E88041427D6FFF7122A6A0814AD720A47748236C335B0576D1E547ACED1;
 SizeAsReceived:12113; Count:41
x-tmn: [IlPREDRUlMJ959zViTghoyL/pfw8DZXS]
x-ms-publictraffictype: Email
x-incomingheadercount: 41
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 0e0c4a1a-9dbb-40bb-68cc-08d7fbf7b5a1
x-ms-traffictypediagnostic: HE1EUR04HT236:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZD/BNcntZ4h01M3nA29uNF0cNzU0zTSiHILzV2Q5YkBu38oc0qoP6EVYznOCrzHxTXjX40Et/urDoy+IgKbc3hjhAOXbeuR+u+loFt9aEXodIh5uK4yuED3Dkj5g+go+2+qy8xyz0JMFy+LuqE0QwYl4ZjzuMMJ+JnL0d/DZORol1AUtTHSH097wkTzsB+zAcftiefbKVKJJpFI5zwHn53TWhKJclGlhcQrrdnZAewvNfH9jROL0ABovqGDevi7R
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:0; SRV:;
 IPV:NLI; SFV:NSPM; H:DB7PR04MB4124.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:; SFS:; DIR:OUT; SFP:1901; 
x-ms-exchange-antispam-messagedata: EA1YI7NXniiJmzmK8Q2pH6QnFiWXJYUhwMt3jJXbQ0l0fYOIPpEndWppK5buRVhgfIrXwwx/SrMvPrdJnMAiMKHe34cNFYGOKVVTTpWQyus1VTT8K65AGeQfZR+l/tv1CLMDuxvYyR/XNcIlB9VNNQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e0c4a1a-9dbb-40bb-68cc-08d7fbf7b5a1
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2020 13:22:41.8233 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1EUR04HT236
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
Content-Type: multipart/mixed; boundary="===============0699208037=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--===============0699208037==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DB7PR04MB41243B4C9EC71B0BCCB666F09DB90DB7PR04MB4124eurp_"

--_000_DB7PR04MB41243B4C9EC71B0BCCB666F09DB90DB7PR04MB4124eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello

With warm hearts, I offer my friendship and my greetings to you.

I have an immediate need for a business cooperation with you. I got
your contact through the Global Business/Investment Network.

I represent an interest  individual who will want to negotiate a possible
working terms with you on an investment interest in your country, worth US$=
100,000.000.00 (One Hundred Million United States Dollars),
This investment fund is originated from the Angolan National Oil Company {S=
ONANGOL} www.sonangol.co.ao
The percentage will be shared in 20%/80%

Kindly get back to me for more details.

Reply to my private email: johngledhill123@gmx.com


Kind regards
Mr. John Gledhill
Tel:+27 83 369 5008

--_000_DB7PR04MB41243B4C9EC71B0BCCB666F09DB90DB7PR04MB4124eurp_
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
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span>Hello<br>
</span>
<div><br>
</div>
<div>With warm hearts, I offer my friendship and my greetings to you.<br>
</div>
<div><br>
</div>
<div>I have an immediate need for a business cooperation with you. I got<br=
>
</div>
<div>your contact through the Global Business/Investment Network.<br>
</div>
<div><br>
</div>
<div>I represent an interest &nbsp;individual who will want to negotiate a =
possible<br>
</div>
<div>working terms with you on an investment interest in your country, wort=
h US$100,000.000.00 (One Hundred Million United States Dollars),<br>
</div>
<div>This investment fund is originated from the Angolan National Oil Compa=
ny {SONANGOL} www.sonangol.co.ao<br>
</div>
<div>The percentage will be shared in 20%/80% <br>
</div>
<div><br>
</div>
<div>Kindly get back to me for more details.<br>
</div>
<div><br>
</div>
<div>Reply to my private email: johngledhill123@gmx.com<br>
</div>
<div><br>
</div>
<div><br>
</div>
<div>Kind regards<br>
</div>
<div>Mr. John Gledhill<br>
</div>
<span>Tel:&#43;27 83 369 5008</span><br>
</div>
</body>
</html>

--_000_DB7PR04MB41243B4C9EC71B0BCCB666F09DB90DB7PR04MB4124eurp_--

--===============0699208037==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0699208037==--
