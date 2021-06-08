Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C31623A057D
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  8 Jun 2021 23:05:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 822326E176;
	Tue,  8 Jun 2021 21:05:20 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11olkn2080.outbound.protection.outlook.com [40.92.19.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 165A26E176
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  8 Jun 2021 21:05:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=POydfoVXmeQ5o+8IhuOcS5ZBpcavHqvrxZBSfzFBBgVVqIWKzsNKBRGPsAglFv1UeRX2qlX1SEnYQxdXL1hSOtB1OssxIeZAWyNLklQzuDfezhBytONcB3NcY0m/NvZW0SMO6yuFZfoYmK8y+ZOgArUnr8myVaKCxsyJfMgr03BDmt6aAHojz+acVZp1z/gnFIs51+OSeYZB6STiYX7Lz9BZDnyPKmgX5kypiQzJkzVHgJ54B7ahd3m37tjOweWshIYFTdog0p+SMP7PQ+eesyEG4oGiZVMAZH6TLD3D3ViOLlQUm4R1gbc/ittY7Ht6ogK+aShqoxwKJFF336X9Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eKLD4UMGlUBkYTvPgaaIRXlWjdhezgWsCIbHHmCZT2w=;
 b=itET22jQNFt/2ya/LuMuiXjH7iPWxKW14RmrpJWzA5+5iVvsBSqMXW40lv0Ujbtcgi/cEBv6UeDJVOvcfKVPsfNQ4kBcbgJDzlKkZJmWO/rw+Q/M567ihRlYeZFBXgls2wTMk9o+3P6fzcjlkDIk0ru1JL6BNa6+qOtmDtAS5GSwgzcjjV2Db12bgu1K32w7B//sqgox8XlVZMf1ePLRTocM5Od4H4IcamzSWZMCGtxGCovVwE3fuAwpaNK8IdzmhlXjA4//yEpqXl/9MrzC6AUBTdbSOn3R2oqJrjhrBvYJo6wDkYePEvlSCD/+SsEjZuZVcN93QNiMGStnfgxWFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eKLD4UMGlUBkYTvPgaaIRXlWjdhezgWsCIbHHmCZT2w=;
 b=il05sSFZKvh5PYkV9DrAVc8uClSDjRylIOBWW/PdQZnI3XEnrenZHfTp3H3A4203OqEcjkVwB0PLozvPv5CP7MPaIycd619pHPFE6QeSBi7mYjSdKLMMEV5T5TnJyMSYdoahp+9qKwfD5LVnJ8697oMkgeIgL2wqDHcg+zfKQcC5T5oJnIbHNawj8BY+G3cL9VMjdvrnKFzNmlEyp5B5x0c4RifWqgseLQjyehGhgX1JJW08GB64lUWv+DbiAoFkgyl6u8hiWctb/gA79v4QHPdjeESoHGv+ALlK/mkzc1W9J64kYOBi6B0kZx1sObj2aT4yLY+bZwgkRmpu78pARA==
Received: from BN8NAM11FT019.eop-nam11.prod.protection.outlook.com
 (2a01:111:e400:fc4b::47) by
 BN8NAM11HT005.eop-nam11.prod.protection.outlook.com (2a01:111:e400:fc4b::157)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22; Tue, 8 Jun
 2021 21:05:14 +0000
Received: from MW4PR17MB5497.namprd17.prod.outlook.com
 (2a01:111:e400:fc4b::46) by BN8NAM11FT019.mail.protection.outlook.com
 (2a01:111:e400:fc4b::158) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22 via Frontend
 Transport; Tue, 8 Jun 2021 21:05:14 +0000
Received: from MW4PR17MB5497.namprd17.prod.outlook.com
 ([fe80::747c:48f7:a5e1:3f5c]) by MW4PR17MB5497.namprd17.prod.outlook.com
 ([fe80::747c:48f7:a5e1:3f5c%7]) with mapi id 15.20.4195.030; Tue, 8 Jun 2021
 21:05:14 +0000
From: vedan jonaha <jeffrenli10@outlook.com>
To: "kegesi110701@163.com" <kegesi110701@163.com>
Subject: =?gb2312?B?xMPTxbvd1dLA1siko6zV4rTO1ea1xLeitb2116Hy?=
Thread-Topic: =?gb2312?B?xMPTxbvd1dLA1siko6zV4rTO1ea1xLeitb2116Hy?=
Thread-Index: AQHXXKn5PShDogWumE6spzUHUuzFsw==
Date: Tue, 8 Jun 2021 21:05:14 +0000
Message-ID: <MW4PR17MB5497929410A1B3F6125601A6CD379@MW4PR17MB5497.namprd17.prod.outlook.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:37AE7E3CE67119B72D509E0D60A99A30DC7DA0100D118DDE0F840E1D679AEFD3;
 UpperCasedChecksum:FEE71E277CD6571700D1F6172AAFB7A966DA6F06FB3DD4496EA87DD47B9604F5;
 SizeAsReceived:11105; Count:42
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [vYTcMxnycWR9IH8qx4u+05TOiO3YHdKx]
x-ms-publictraffictype: Email
x-incomingheadercount: 42
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 3dcd635d-66d8-4498-43cd-08d92ac11c57
x-ms-exchange-slblob-mailprops: 79Jo46q8hhD8Q9WeIXJCf6EXbFF6fqa39V5ie3LExCLy0mTChC/PdeLictYMGRlbhKg6cas51wS7bss/oaTHmdYOSwkLjJ60vy4fDDFl36uAYAvdGFHfHsjPWUUUz/PxpfDBPdF0gAF4O6C2jgl/IWjQMjM8lTsaesIwsb5jI2OFco3soarKC6sqOertK2TZxttikoT1y2x+7nbR/ylbRcSoylkvEp1QS4UkB2mkpWp/kEKNLYhvLUB0nOJhovYwL9dlGXk/sbkYIcN8ri3ecH91Gsnh32Wjf6X8kTwJRPw+/ZOMpR9yHTcsEsQrbu1APBK0fsJNNTLvCNa7oLUO2qdl80me1PemgyUBO9Rg0IE/j3i1xZZXKd5AuO7CNL0NgbXxtD7GtuulQ73c/Vr9iLGDZhK83+JhbHGEX/X+TdAxpkoTdvVX3HhqugecPB5bSFfl6fOW1RM1dN2l7chjS6HfN81r34LKd0rwC8q0tOv50ZzKJ/npdZNFzmRyrY8ESw6EiNUZq5BsRHUJj9eTOA/8l9/C8w3ABqI/p86Hc1LFrQ27c4avtHPovsbc/0gEYv6Nmh1lpYE9nuNy7gTIwzkXur4S9tqCCjT4iOBz7luB5sYIkzoZkj0dArUgJhxkIpcdhMfrPuLU+JtRvShfg348URTCAWcPLna3s4eueuLkXIsFP2KX3+s1MxK6xhnl
x-ms-traffictypediagnostic: BN8NAM11HT005:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 24weOUr19+eKjZEz/rvPzVy4/auIDIlRb2qtKkTOmpWQ0YrX0+dXPEAjxppl3dB2u3w8IC/L1DCsK0Ne7Y46Hi/9m675i5rSCNfIFF928zukDAVWM9fz7UwISDqYgRDooIDXAdGv8vRW8thjlOYt84miNeSzd2TwsKi2RJsHRStWj3XWbIaJEpEgV0QMiCizStOAcboeiW4gUKqYacaehiZU4OO2zPMslmUDmU0om44mAvdCqHtkl0I3X1p83G4SORHN+16lJy6ItaacdbuTIzaLaNYytbA0Yuk/QDZwFaq/BtQ3ERYbep/WWVfh0g0XSOKpSpxc/eOqCkOwyyO/BeTPXf/EA2pXjFWIcipkRmlRSQaVx5eEUNjAinQf0m7vlz2hOXhST/9oDDFMSAc+kTkrKY6PbhDIQI8/7ZA+oe0vv68fwlSSh2vVJ0po328BKj0S0eGof8ZzhoTFUWyEEg==
x-ms-exchange-antispam-messagedata: yWJrAn3k5KNPRJlMM+zoCqLfI6qiSpEvUNoHNj8PmxtwzsuEKgpLJhmP6FOSGT31T0m/3vs8Xhfe183ghv1k5M5rg/4G1wW5Hj8zgFJxS2a5jGnVjh+k1w5ZrgKMuFcJpKurred3zicWM2Yw33esQQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT019.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dcd635d-66d8-4498-43cd-08d92ac11c57
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2021 21:05:14.0688 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8NAM11HT005
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
Content-Type: multipart/mixed; boundary="===============0079984215=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--===============0079984215==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MW4PR17MB5497929410A1B3F6125601A6CD379MW4PR17MB5497namp_"

--_000_MW4PR17MB5497929410A1B3F6125601A6CD379MW4PR17MB5497namp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

srvFwsTj066jrNa7xcLE47K7zeajrLXIxOPJz8/foaNVQ8zl0/3T0NfuyKu1xMrWu/rT6cDW087P
t8fSzfjWt8rHzqjSu7XEudm3vc341b4sVUPM5dP9xr3MqMrHtPPQzbXEufq8ytPpwNbTzs+3tcRO
Ty4xLM3mvNK/ydLU1NrN+NKzyc+1x8K816Ky4Sy52c34u7nM4bmpYXBwz8LU2LCy17AszebTzs+3
1+61o9DEvs3Kx7P2v+6h8lVDzOXT/bP2v+6/7MvZLrK708PU2cXCzea1vbrazfguofJVQ8zl0/3T
w9DEvq3Tqi7N5reo1+624C7V/bnmtcTTzs+3xr3MqMjDxPrN5rXDv6rQxNPWt8XQxC7N5tPOz7ey
u9PDyOvIui7X1Ly6zeawrtT1w7TN5r7N1PXDtM3mw7/M7NbBydnJz83yyMvXorLhLru2063E+tKy
0rvG8LzTyOtVQ8zl0/0hofKh8qHyofKh8sjn0tTJz8GsvdPO3reotPK/qqOsIMfruLTWxtLUz8LN
+Na3tb3kr8DAxvfW0LTyv6o6303I62h0dHBzOi8vdGlueXVybC5jb20veXhxcG5hcTINCg0KVUPM
5dP9tcfI69eo08PN+Na31Yi08ulfaHR0cHM6Ly90aW55dXJsLmNvbS95eHFwbmFxMg0K

--_000_MW4PR17MB5497929410A1B3F6125601A6CD379MW4PR17MB5497namp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
</head>
<body>
<p><font color=3D"red" size=3D"5">=B2=BB=C5=C2=C4=E3=D3=AE=A3=AC=D6=BB=C5=
=C2=C4=E3=B2=BB=CD=E6=A3=AC=B5=C8=C4=E3=C9=CF=CF=DF=A1=A3UC=CC=E5=D3=FD=D3=
=D0=D7=EE=C8=AB=B5=C4=CA=D6=BB=FA=D3=E9=C0=D6=D3=CE=CF=B7=C7=D2=CD=F8=D6=B7=
=CA=C7=CE=A8=D2=BB=B5=C4=B9=D9=B7=BD=CD=F8=D5=BE,UC=CC=E5=D3=FD=C6=BD=CC=A8=
=CA=C7=B4=F3=D0=CD=B5=C4=B9=FA=BC=CA=D3=E9=C0=D6=D3=CE=CF=B7=B5=C4NO.1,=CD=
=E6=BC=D2=BF=C9=D2=D4=D4=DA=CD=F8=D2=B3=C9=CF=B5=C7=C2=BC=D7=A2=B2=E1,=B9=
=D9=CD=F8=BB=B9=CC=E1=B9=A9app=CF=C2=D4=D8=B0=B2=D7=B0,=CD=E6=D3=CE=CF=B7=
=D7=EE=B5=A3=D0=C4=BE=CD=CA=C7=B3=F6=BF=EE=A1=F2UC=CC=E5=D3=FD=B3=F6=BF=EE=
=BF=EC=CB=D9.=B2=BB=D3=C3=D4=D9=C5=C2=CD=E6=B5=BD=BA=DA=CD=F8.=A1=F2UC=CC=
=E5=D3=FD=D3=C3=D0=C4=BE=AD=D3=AA.=CD=E6=B7=A8=D7=EE=B6=E0.=D5=FD=B9=E6=B5=
=C4=D3=CE=CF=B7=C6=BD=CC=A8=C8=C3=C4=FA=CD=E6=B5=C3=BF=AA=D0=C4=D3=D6=B7=C5=
=D0=C4.=CD=E6=D3=CE=CF=B7=B2=BB=D3=C3=C8=EB=C8=BA.=D7=D4=BC=BA=CD=E6=B0=AE=
=D4=F5=C3=B4=CD=E6=BE=CD=D4=F5=C3=B4=CD=E6=C3=BF=CC=EC=D6=C1=C9=D9=C9=CF=CD=
=F2=C8=CB=D7=A2=B2=E1.=BB=B6=D3=AD=C4=FA=D2=B2=D2=BB=C6=F0=BC=D3=C8=EBUC=CC=
=E5=D3=FD!=A1=F2=A1=F2=A1=F2=A1=F2=A1=F2=C8=E7=D2=D4=C9=CF=C1=AC=BD=D3=CE=
=DE=B7=A8=B4=F2=BF=AA=A3=AC =C7=EB=B8=B4=D6=C6=D2=D4=CF=C2=CD=F8=D6=B7=B5=
=BD=E4=AF=C0=C0=C6=F7=D6=D0=B4=F2=BF=AA:<fontcolor=3Dbluesize=3D5>=DFM=C8=
=EBhttps://tinyurl.com/yxqpnaq2</fontcolor=3Dbluesize=3D5></font><br>
</p>
<p><font color=3D"red" size=3D"5"><u><font color=3D"#0066cc">UC=CC=E5=D3=FD=
=B5=C7=C8=EB=D7=A8=D3=C3=CD=F8=D6=B7</font></u>=D5=88=B4=F2=E9_https://tiny=
url.com/yxqpnaq2</font></p>
</body>
</html>

--_000_MW4PR17MB5497929410A1B3F6125601A6CD379MW4PR17MB5497namp_--

--===============0079984215==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0079984215==--
