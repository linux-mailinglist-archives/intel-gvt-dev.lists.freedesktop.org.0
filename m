Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 315AE380F76
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 14 May 2021 20:13:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E47A989143;
	Fri, 14 May 2021 18:13:31 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from JPN01-OS2-obe.outbound.protection.outlook.com
 (mail-os2jpn01olkn0186.outbound.protection.outlook.com [104.47.92.186])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B2AD6E0B7
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 14 May 2021 18:13:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mLFtG5cr2TBluDebVd9Pn1nNr1CVr7I+SXUZPx5xqh3cEj9vxd9+TtHnKqp47PsS9TrXNoY4BPlXfS5+Nry3zHZFJnAhkPSVw1UrfkOQYYlEM+i3oePbIe9vizQVq5rseyvu1TB4jjurnIPr0YmJ6bT8l8/Owl5u30KlMOYedMukj/mx/cnTLBoKJXCX6udkBJj/R9ZOhKrF/69VpFkJG3a+AQqevwpS2aAYzVE3m7iqgSUelhlVfSiT9E410M63LYUD+KWaqb7vTGZbeapYyoGJcBms/cpJSZfa8bcI4+o8+/8LWCeVykvu4vxxjxQtGGnT4MVOZbsBoAHLW65+Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E51h22xlmbdLG7mp6tVJWw5s5N+2ilaffftBG1+dpqA=;
 b=J1ZBUyhks4fWHPsvCKaiVpFYdNtJqCbAxZRTJtyd5gG45M9wvM/I2UAFkHu78DVN3o+lk6rtGuOXo6hVdtN6p4gExX82nBhzCOvReO1Knnbz706UsnGVnI+rQcSg2e1sW4eCEuzmlUjFyicJnr+x+FaxU6LV6zX9A9C3Sf73DCplvf41OlgGtVHkycUBKijdbjFZ3ac2dwYUoQyqRWfWFMHQ74hQvrjTnRiW3yG6zaAMLia4ev7VcM7/D41Dihm21zUPE6wMN36N34OfVOS7WAz1GMLIbGDZi3n5jKZ5IFsJYOKLZGtCfnpMVUw78BJlLnGXUCHrki2YWN24nbRRKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E51h22xlmbdLG7mp6tVJWw5s5N+2ilaffftBG1+dpqA=;
 b=Hxo5FnIUHUweFvmevSn6K35NbEonzoIsPIkJVjFwgsUhvCqZEwx4Z9Lh/C9ie28PZGiXWPWSUbefy0YwalMQaKkllsQ0QN2GFqInhj7X5aL6iT0mXIitc4+fptzG+q4VVND7AFVXGtP426ENQ/HRzsTtd7ojC4SlTZ0SwgF1X02nBvZKql2uFkI+50/DVXy9N/Nj18WdIJ+IGQa7ZQOlqe2ZKF5lVZhd2R4vmGfVTNS+jsm/FMzGRgEVEeinBWm61YbOMTN90rkB6MU2w70aJOb+4KId6gzTp2NYwBI2gchv6O9YnxJDWrS5neAemuuPlaKMKYZVVeSkSxGmOR+AjQ==
Received: from TY2PR04MB3600.apcprd04.prod.outlook.com (2603:1096:404:fe::20)
 by TYAPR04MB2559.apcprd04.prod.outlook.com (2603:1096:404:16::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Fri, 14 May
 2021 18:13:15 +0000
Received: from TY2PR04MB3600.apcprd04.prod.outlook.com
 ([fe80::850c:3225:344c:f50b]) by TY2PR04MB3600.apcprd04.prod.outlook.com
 ([fe80::850c:3225:344c:f50b%6]) with mapi id 15.20.4129.028; Fri, 14 May 2021
 18:13:15 +0000
From: gardn ptolemy <cannonq6ds85@outlook.com>
To: "ylyj2006@yahoo.com.cn" <ylyj2006@yahoo.com.cn>
Subject: =?gb2312?B?tPPQzdPOz7e7+syozerIq9LG1rKh7w==?=
Thread-Topic: =?gb2312?B?tPPQzdPOz7e7+syozerIq9LG1rKh7w==?=
Thread-Index: AQHXSOzOk2l/kE2Nik2JSXUBjjcktA==
Date: Fri, 14 May 2021 18:13:15 +0000
Message-ID: <TY2PR04MB3600201314EC0453E20E336B84509@TY2PR04MB3600.apcprd04.prod.outlook.com>
Accept-Language: zh-CN, zh-TW, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [1saITKunDotLXGXSRl9Eg/L3GBe65G/5Cdse8hDKPMY=]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2462bd1d-40bb-43a4-5303-08d91703f175
x-ms-exchange-slblob-mailprops: LqzShoI3NdIMMJJSLE5maetS/6j6AojWiHM5bF7AgUhyGvJgkHJKz1f7U1LT6BHWTfq8nrNOEZfcxPp0XVgVQ+fgLk3W2aN6K9BqKOYuagpnVNk3Zudv7meqpEnSwRHPa9jUzO8ftrxogEVLKKYi36HDH7WONhFoMD1SOCxAB3aTbMYek2MiqqKQRm8pLKDaKAj+MC+dBtIeaDt+WIhT2r1h7xpN0hxfLk4kBJP437vSIw+UWldg4gIsNyyeBwMK5EhFaoSSQnnm03fb3nb8jDGRa2SIxGOqk9V+PQTky9sQvOGZz1rVNpA/u1Itt/TpcHtD2Gph03k/3ZdO4qGWemZPy/t8OACo3kq2+i6cAXfCSiU9aNDeam8ypHSWs3C8fcPqe4OQ5XpXxZcSuAnY33oISlZq9HQjmy93svYC60NVj3x3uD0zGfLNBNLqVe7z83uNsaXCkZEC1/s3v40jbd5oBFRbfOC3sIuGQPa/gTxwkeyCSH6VUoAkdLATkNOg+b+WHWL+sr0MS5iaQOvsKRXfyMLI5frtzAOD5jeksYrYSuRrOv01cEKUNHpmlP1NmKmB2L9k8bxUzjjTFiCuRLpjnq6NYxtqpfXSMOQzEzuCZtQwkpbcdjxurq9dWi6CXQwuv5JdU9mw3VWn34JIFsMje7Eu/ImUbrgiBFxQfUcYXuVBS01Ojbry51c4yzD96DnhWDeH6uyuhZsuf9i4NWTvejM5VhVJ94NxnulVGihkIYC8VCMVKVcTEm0fpL0xTk7St5uOv15PZTxmBc98Tydoa0X+N6mZmsSNfhqvGOrn91Y4MO3updDGyynAmX9FB9fXbZWqPL8=
x-ms-traffictypediagnostic: TYAPR04MB2559:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: R2Qv9OQYdZv/BRoIwCVSrCalseA2NRQsSfEYMZ3lcrS+TUoCykyxdhXEEIwTx5wN8iNW1W0maweqHSuHr3inK3PvmeKJJkZ5IF/GMOtdEh1SIX9ybtjUPst35kSb6eibdFERjZ30nqQu5N7V+HHpIRS896d5w3qg51a5nX6oyNlNeRsh59jj3rqw8yQJRH2UpzSGIxmhTkdwW8hllL613bHRzJYqDFRnf+IerV1VyQgv6CIGVOKLYyHNaoq9mMYimE+BJyVJoxXFMGpB0kT9idEJdRL1bkiNHoALwgr2eSfOzJO1jV1Zod7OU6W+PbS1tsho2fW35mxP9SOBnhr5YEHFr0kWqBJ3G89MXuPLg3Rp6WQmeKBn6vPUYW+Gwn2boKyZ9G6ws0xvZxDCFcWz4fKB18p8k3uYgckUcBCzntjTe2Hao07xpmbKbmDYtxR3LwvOFHDmidwrC510iy/Z2A==
x-ms-exchange-antispam-messagedata: 53SUZ2hlri+e3A7HfDGXgY0mlBsgwCSBkWibRBdhah+w+I7upI/m2IPcwWiVu12jOe7EDcgcL1NgfWbHK+gzVyDS9zVLaik2GCRhbUOzcU4vl4vsHSY/2YuZsBh2z1zrj8ASjLyokvy9jYqLa1sokw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR04MB3600.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 2462bd1d-40bb-43a4-5303-08d91703f175
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2021 18:13:15.1985 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR04MB2559
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
Content-Type: multipart/mixed; boundary="===============1188062730=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--===============1188062730==
Content-Language: zh-CN
Content-Type: multipart/alternative;
	boundary="_000_TY2PR04MB3600201314EC0453E20E336B84509TY2PR04MB3600apcp_"

--_000_TY2PR04MB3600201314EC0453E20E336B84509TY2PR04MB3600apcp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

0+nA1tDC0aHU8aOsu/DIyMnPz98gVUPM5dP909DX7sirtcTK1rv60+nA1tPOz7fH0s341rfKx86o
0ru1xLnZt73N+NW+LFVDzOXT/ca9zKjKx7Tz0M21xLn6vMrT6cDW087Pt7XETk8uMSzN5rzSv8nS
1NTazfjSs8nPtcfCvNeisuEsudnN+Lu5zOG5qWFwcM/C1NiwstewLM3m087Pt9futaPQxL7Nysez
9r/uoe9VQ8zl0/2z9r/uv+zL2S6yu9PD1NnFws3mtb262s34LqHvVUPM5dP908PQxL6t06ouzea3
qNfutuAu1f255rXE087Pt8a9zKjIw8T6zea1w7+q0MTT1rfF0MQu0+nA1tDC0aHU8aOsu/DIyMnP
z98gw7/M7NbBydnJz83yyMvXorLhLru2063E+tKy0rvG8LzTyOtVQ8zl0/0hoe+h76HvyOfS1MnP
way9087et6i08r+qo6wgx+u4tNbG0tTPws341re1veSvwMDG99bQtPK/qjpodHRwczovL3Rpbnl1
cmwuY29tL3kzeWhzcmtnPGh0dHBzOi8vd3d3Lnl5YWh1Lm9yZz4NCjxodHRwczovL3l5YWh1Lm9y
Zz4NCg0KVUPM5dP9tcfI69eo08PN+Na3aHR0cHM6Ly90aW55dXJsLmNvbS95M3loc3JrZzxodHRw
czovL3l5YWh1Lm9yZz4NCg==

--_000_TY2PR04MB3600201314EC0453E20E336B84509TY2PR04MB3600apcp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
</head>
<body>
<p><font color=3D"red" size=3D"5"><a href=3D"https://www.yyahu.org">=D3=E9=
=C0=D6=D0=C2=D1=A1=D4=F1=A3=AC=BB=F0=C8=C8=C9=CF=CF=DF UC=CC=E5=D3=FD=D3=D0=
=D7=EE=C8=AB=B5=C4=CA=D6=BB=FA=D3=E9=C0=D6=D3=CE=CF=B7=C7=D2=CD=F8=D6=B7=CA=
=C7=CE=A8=D2=BB=B5=C4=B9=D9=B7=BD=CD=F8=D5=BE,UC=CC=E5=D3=FD=C6=BD=CC=A8=CA=
=C7=B4=F3=D0=CD=B5=C4=B9=FA=BC=CA=D3=E9=C0=D6=D3=CE=CF=B7=B5=C4NO.1,=CD=E6=
=BC=D2=BF=C9=D2=D4=D4=DA=CD=F8=D2=B3=C9=CF=B5=C7=C2=BC=D7=A2=B2=E1,=B9=D9=
=CD=F8=BB=B9=CC=E1=B9=A9app=CF=C2=D4=D8=B0=B2=D7=B0,=CD=E6=D3=CE=CF=B7=D7=
=EE=B5=A3=D0=C4=BE=CD=CA=C7=B3=F6=BF=EE=A1=EFUC=CC=E5=D3=FD=B3=F6=BF=EE=BF=
=EC=CB=D9.=B2=BB=D3=C3=D4=D9=C5=C2=CD=E6=B5=BD=BA=DA=CD=F8.=A1=EFUC=CC=E5=
=D3=FD=D3=C3=D0=C4=BE=AD=D3=AA.=CD=E6=B7=A8=D7=EE=B6=E0.=D5=FD=B9=E6=B5=C4=
=D3=CE=CF=B7=C6=BD=CC=A8=C8=C3=C4=FA=CD=E6=B5=C3=BF=AA=D0=C4=D3=D6=B7=C5=D0=
=C4.=D3=E9=C0=D6=D0=C2=D1=A1=D4=F1=A3=AC=BB=F0=C8=C8=C9=CF=CF=DF =C3=BF=CC=
=EC=D6=C1=C9=D9=C9=CF=CD=F2=C8=CB=D7=A2=B2=E1.=BB=B6=D3=AD=C4=FA=D2=B2=D2=
=BB=C6=F0=BC=D3=C8=EBUC=CC=E5=D3=FD!=A1=EF=A1=EF=A1=EF=C8=E7=D2=D4=C9=CF=C1=
=AC=BD=D3=CE=DE=B7=A8=B4=F2=BF=AA=A3=AC =C7=EB=B8=B4=D6=C6=D2=D4=CF=C2=CD=
=F8=D6=B7=B5=BD=E4=AF=C0=C0=C6=F7=D6=D0=B4=F2=BF=AA:<fontcolor=3Dbluesize=
=3D5>https://tinyurl.com/y3yhsrkg</fontcolor=3Dbluesize=3D5></a></font><a h=
ref=3D"https://yyahu.org"><br>
</a></p>
<p><font color=3D"red" size=3D"5"><u><font color=3D"#0066cc">UC=CC=E5=D3=FD=
=B5=C7=C8=EB=D7=A8=D3=C3=CD=F8=D6=B7</font></u><a href=3D"https://yyahu.org=
">https://tinyurl.com/y3yhsrkg</a></font></p>
</body>
</html>

--_000_TY2PR04MB3600201314EC0453E20E336B84509TY2PR04MB3600apcp_--

--===============1188062730==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============1188062730==--
