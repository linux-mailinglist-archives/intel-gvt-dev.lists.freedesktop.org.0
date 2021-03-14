Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1669433A71A
	for <lists+intel-gvt-dev@lfdr.de>; Sun, 14 Mar 2021 18:27:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9E3889C17;
	Sun, 14 Mar 2021 17:27:57 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-oln040092253085.outbound.protection.outlook.com [40.92.253.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9805B89C17
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sun, 14 Mar 2021 17:27:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hvf+8FqzTBPx8mvKxPtV2+PnnVsBOekIjbsiRQ/gj0djS774JRr7TG6ver9NOdU4e6atGmInr40qkulMIlaoQ/E307EAqB08mrZDcI/165mwJUrJSXpPX18C7n9vULEyb1ho3PIBWeBfxvb/cMgDhtyr/49segjVpeM16VSZkHzdajrnjq4gl+JODdLsDfTbppcIPA34dAFd9GQyyMxlf9T+kvNTls1SuBbCoi1/tiN30+ELkf0EaQgaPQMltVHZVSAHg934hX7apmEQvCAZn0MOftySEL+SaT0oKa3brxFJm3j0VrLsuqqEviJSyf7NVCSWZ/Bcd9aVJngXeaBD/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Uta77mB5+riI9qBSR+E+qlYVH73lBDI4byONhP4CYI=;
 b=hKuwJutPvs8S4b8irTYuxwIhBrql1w9gwAPwSUfiseCTuFIfin8gDS0AkOA0MuylSFgSBE6SnpfXDbASyLiz3Q1BNfPFH8DQKh0LfRVON+PQq9LiEWlhig+8Dj/Ci2/Xkfl+Zp0jitU8XWS13q50Xa0La9nNqy2m74FbZ/fv3VfbmrIJGrMKATZf3QPvGBS4brYIZ7sb/4u+skGuSZsbJhWrtYpDhmwfQZIiBNMDgr6BceioTQQbNtq4oSSPSK+KaO3wsIHDABRB1PbIN069mljfgJy6l1O9YJ2B4IB/tJ3fJ0spI2yI489G67QJ3w8MkslGJM/EupGLKSYEp4u2dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Uta77mB5+riI9qBSR+E+qlYVH73lBDI4byONhP4CYI=;
 b=f8mRBZq2M126roGOT7IX59e+976Nf6P67+g4Rh1OphWcUc4XL2OutwgWfJF6NRx0STbOfMe1OoNhKhh7RbMpW+pTRIB1/e7J5MC1SKqs0fg7uhM/n28imx7Ps+N0PjYxOkxSIi3X+4ZlB5c3kRlKWjSbLZZPbWoKqAiIP1IgaV3O7YPDIfRU985rQQva90Ii1zp7ziD1+ywhlKwooxeWqCy1srRPswXSVpUBDpOd4jAyQk45dChmbmVcRZ6WBL/jvxg/vOS2WieFg26+5YsLjDkJqzu0U+KxpoXeQYrdd/Zktgvti/G5Cj/tKpnaXfyq4PsfG56wwUZ4hzfpX8uUHw==
Received: from TY2PR0101MB2720.apcprd01.prod.exchangelabs.com
 (2603:1096:404:b0::12) by TYZPR01MB3919.apcprd01.prod.exchangelabs.com
 (2603:1096:400:8::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Sun, 14 Mar
 2021 17:27:27 +0000
Received: from TY2PR0101MB2720.apcprd01.prod.exchangelabs.com
 ([fe80::a805:9df8:1c8b:5564]) by
 TY2PR0101MB2720.apcprd01.prod.exchangelabs.com
 ([fe80::a805:9df8:1c8b:5564%4]) with mapi id 15.20.3933.032; Sun, 14 Mar 2021
 17:27:27 +0000
From: utta berk <reyest8ono4w@outlook.com>
To: "531087330@qq.com" <531087330@qq.com>
Subject: =?gb2312?B?zqrRx9be1+6089Taz9+6z7eozfjJz7Kp3sTT6cDWxr3MqKH+?=
Thread-Topic: =?gb2312?B?zqrRx9be1+6089Taz9+6z7eozfjJz7Kp3sTT6cDWxr3MqKH+?=
Thread-Index: AQHXGPdOxt6cjqhZlU6GgYydJ9PSyg==
Date: Sun, 14 Mar 2021 17:27:27 +0000
Message-ID: <TY2PR0101MB2720A16707B216DCE53FFBADB76D9@TY2PR0101MB2720.apcprd01.prod.exchangelabs.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [rxqAXckMASUoByQAVF+1U/RIG+r3qZ/s4rvGJMcPpjs=]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a1602a76-a457-4bca-e573-08d8e70e7090
x-ms-exchange-slblob-mailprops: WdFS8CKwqrsUFznvFQ7nK7ZsWN3SDNPKGyTsB55ZUx0M04VzsDzsQkPbnCsY0ZT/mMa91YuEc8HaL6oe+TMM/ZMVH3pzg+OaaF14/miN5lqKZDW/CPOlZHt5uhAqsVntZxGDDM2q9Pl8QgJJrOFLIEC4zmNAV2kd1JkbvVRbbD1cAze3Af3LUCmlYKCWEb0n0lRMeTk8VcADLPbujsKNqNeGCdaPUiPaXj62shPdqJ6GvZaPIVRUSzdZWKqdwe6PjDAT7XGZqcyHb5J3xc0250dPKUOk2CDNvO+TMUnMYoHi8QhmnlUPqBLw+KRD0LJN2ihD/NjTa16XvTA7/NeyTuSbM6bOFHullsty0W/Un5otJgXOeUBNyFYBPeNnuWsInhhGT2A7/kskoAdS/iMMDJ2qx7mjHZSs9No8nNveqZNbdN/J8Khb0vwOrGZII1vvT+HBeCKZNnFiBzWzZGdLY29W2ODbZhy4ed8iaiZB4QhxaPrsXA6S/SAYlQ44Qwx/xD0nFpMc5ZM3VhD9JP4fK5chwIQd4YtYdhurDC7tJKA9hbFuFfadXsu65UE1h/vfcvmJO+xrP6SRaT8nzHCW7BCqq8Pfsc6xYoYeLkzVUvWIP07jYdLvdmc0tK4L5Sm7wIUk9hNoJc6jgtzqs/KL4N3MQx6ctVO/OJ13HJ6PF0HnQCwsrBEJC99SNs2CgyxXraQPZzLQcy3C24cUlt177WhDT4oRjPZz4SpWgz37Mhp6hlqh0LAS/3ZACt8txkz3hDqos8tsSTFapZ04QJGjReavlW0d+gPIVp1Jy5LudUp+bR4IYD/xp/Wv6HevdndMHPkiqfmP8XSjx1p60eGfr7ZGK5nWSQwH
x-ms-traffictypediagnostic: TYZPR01MB3919:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yU0N1Fg7ZOT+6XBLww8jGt6CH2ikyDtHkD3O0EhRKJrndwYMChvg0L23rQ1VHB0UtQx93Pwit+Jz/gG/64FhtrZ8kEuTt62nHumC9r6I1HwGNqeOz7/cyThJfwAJwMVmYxtBtqkpvee4TAnxUwDnF9wOC1MYgmpwwCcaaoQYIqccAOVlsF4j+GgbXz3D1CcVtGjPNzhqUAcAwgz/RM3RgklOs8jg3YwBqnZNaP7yR/5zDfCDGY6gqy92qQaKxt0M/Opv+wbsMLIu0Zorn34GMlE+NKGudMmto5TMscLgdYblYOIViMBFtUpd71HsMZEvd8lgfuETChqeFr/dTBsYZ+nTrLLkNxDd+bvhL7cQ3KCZtbrWW+SZ+941aaDjgQbgj3xy61jdbszESH+V2yJWm1oYejO7rCuDs5HASD68Bw4=
x-ms-exchange-antispam-messagedata: 6CPEkx4fQ9z3+NoVsFFtBFyuKbpC2pEqkZsz+PFvI8EMuRSbAJ+shUXNtHQkw3PW3gXQ1hlcJn7ugdqTVRnILnrdc4wBxMplnBrNZGGxLGF/LspJ21HrHUr28Ew5D0/azprR9MgjPUeSJMcNOvVAGw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR0101MB2720.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: a1602a76-a457-4bca-e573-08d8e70e7090
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2021 17:27:27.6244 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR01MB3919
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
Content-Type: multipart/mixed; boundary="===============1974734101=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--===============1974734101==
Content-Language: zh-TW
Content-Type: multipart/alternative;
	boundary="_000_TY2PR0101MB2720A16707B216DCE53FFBADB76D9TY2PR0101MB2720_"

--_000_TY2PR0101MB2720A16707B216DCE53FFBADB76D9TY2PR0101MB2720_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

xPq6w6H+of6h/qH+Ic7Sw8fKx2t10+nA1i7O0sPH1fu6z8v509DT6cDWzfjTzs+3LsjDxPqyxri7
vqHU2srW1tAuz9/Jz7Osuf2w2c3yyMvF48T60rvG8M3mz+3K3Nfu1ebKtbXE1ebIy7bU1b0usNm8
0sDWLsDPu6K7+i7M5dP9ssrGsS6499bWyrHKsbLKtcjTzs+3trzT0CzN5rzS0+vN5rzS1q685LXE
ttS+9i7N5reo1+624Nfut+G4u7XE087Pt8a9zKjWu9KqxPrT0LG4tvjAtL7Nv8nS1ML61Ni2+Lnp
Ls7Sw8fKx9X9uea+rdOqtcTT6cDWzcW20y6h/rGj1qS1vb/uu/DL2bW9v+4uxPrP67Tyt6LKsbzk
Ls/7x7LKsbzkLtfc09DE48/r0qq1xNPpwNYu16Ky4dPQ08W73brswPsu0vLOqrPP0MXL+dLUztLD
x2t10+nA1sTc1NrIq8fyzfjC59Taz9/M5dP9zbbXosa9zKjW0NOutcOzz9DFv8m/v7XEw8DT/iEg
1NrP38zl0/2+urLKzfgs1+680cqxyrGyysa9zKgstPPA1s241KSy4iws1ebIy7DZvNIstcLW3cbL
v8ssIDI4uNwsof7C6b2r087PtyzFo8Wj087Ptyy2t7XY1vfTrs/WvfC1yLbg1tbG5cXG087PtyzA
z7uiu/ostefX09POz7e2vNPQIcrH087Pt9DCvsm/zdK71sLNxrz2tcTT6cDWytfRoaOhIMa31sqx
o9akLrP2v+6xo9akLLP2v+6/7MvZu7bTrcT6wLTK1M3mIaH+of6h/sjn0tTJz8GsvdPO3reotPK/
qqOsIMfruLTWxtLUz8LN+Na3tb3kr8DAxvfW0LTyv6o6aHR0cHM6Ly9yZXVybC5jYy9SMTBvMFo8
aHR0cHM6Ly93d3cuMWt1MTExLmNvbT4NCjxodHRwczovL3d3dy4xa3UxMTEuY29tPg0KDQprddPp
wNa1x8jr16jTw8341rdodHRwczovL3JldXJsLmNjL1IxMG8wWjxodHRwczovL3d3dy4xa3UxMTEu
Y29tPg0K

--_000_TY2PR0101MB2720A16707B216DCE53FFBADB76D9TY2PR0101MB2720_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
</head>
<body>
<p><font color=3D"red" size=3D"5"><a href=3D"https://www.1ku111.com">=C4=FA=
=BA=C3=A1=FE=A1=FE=A1=FE=A1=FE!=CE=D2=C3=C7=CA=C7ku=D3=E9=C0=D6.=CE=D2=C3=
=C7=D5=FB=BA=CF=CB=F9=D3=D0=D3=E9=C0=D6=CD=F8=D3=CE=CF=B7.=C8=C3=C4=FA=B2=
=C6=B8=BB=BE=A1=D4=DA=CA=D6=D6=D0.=CF=DF=C9=CF=B3=AC=B9=FD=B0=D9=CD=F2=C8=
=CB=C5=E3=C4=FA=D2=BB=C6=F0=CD=E6=CF=ED=CA=DC=D7=EE=D5=E6=CA=B5=B5=C4=D5=E6=
=C8=CB=B6=D4=D5=BD.=B0=D9=BC=D2=C0=D6.=C0=CF=BB=A2=BB=FA.=CC=E5=D3=FD=B2=CA=
=C6=B1.=B8=F7=D6=D6=CA=B1=CA=B1=B2=CA=B5=C8=D3=CE=CF=B7=B6=BC=D3=D0,=CD=E6=
=BC=D2=D3=EB=CD=E6=BC=D2=D6=AE=BC=E4=B5=C4=B6=D4=BE=F6.=CD=E6=B7=A8=D7=EE=
=B6=E0=D7=EE=B7=E1=B8=BB=B5=C4=D3=CE=CF=B7=C6=BD=CC=A8=D6=BB=D2=AA=C4=FA=D3=
=D0=B1=B8=B6=F8=C0=B4=BE=CD=BF=C9=D2=D4=C2=FA=D4=D8=B6=F8=B9=E9.=CE=D2=C3=
=C7=CA=C7=D5=FD=B9=E6=BE=AD=D3=AA=B5=C4=D3=E9=C0=D6=CD=C5=B6=D3.=A1=FE=B1=
=A3=D6=A4=B5=BD=BF=EE=BB=F0=CB=D9=B5=BD=BF=EE.=C4=FA=CF=EB=B4=F2=B7=A2=CA=
=B1=BC=E4.=CF=FB=C7=B2=CA=B1=BC=E4.=D7=DC=D3=D0=C4=E3=CF=EB=D2=AA=B5=C4=D3=
=E9=C0=D6.=D7=A2=B2=E1=D3=D0=D3=C5=BB=DD=BA=EC=C0=FB.=D2=F2=CE=AA=B3=CF=D0=
=C5=CB=F9=D2=D4=CE=D2=C3=C7ku=D3=E9=C0=D6=C4=DC=D4=DA=C8=AB=C7=F2=CD=F8=C2=
=E7=D4=DA=CF=DF=CC=E5=D3=FD=CD=B6=D7=A2=C6=BD=CC=A8=D6=D0=D3=AE=B5=C3=B3=CF=
=D0=C5=BF=C9=BF=BF=B5=C4=C3=C0=D3=FE!
 =D4=DA=CF=DF=CC=E5=D3=FD=BE=BA=B2=CA=CD=F8,=D7=EE=BC=D1=CA=B1=CA=B1=B2=CA=
=C6=BD=CC=A8,=B4=F3=C0=D6=CD=B8=D4=A4=B2=E2,,=D5=E6=C8=CB=B0=D9=BC=D2,=B5=
=C2=D6=DD=C6=CB=BF=CB, 28=B8=DC,=A1=FE=C2=E9=BD=AB=D3=CE=CF=B7,=C5=A3=C5=A3=
=D3=CE=CF=B7,=B6=B7=B5=D8=D6=F7=D3=AE=CF=D6=BD=F0=B5=C8=B6=E0=D6=D6=C6=E5=
=C5=C6=D3=CE=CF=B7,=C0=CF=BB=A2=BB=FA,=B5=E7=D7=D3=D3=CE=CF=B7=B6=BC=D3=D0!=
=CA=C7=D3=CE=CF=B7=D0=C2=BE=C9=BF=CD=D2=BB=D6=C2=CD=C6=BC=F6=B5=C4=D3=E9=C0=
=D6=CA=D7=D1=A1=A3=A1 =C6=B7=D6=CA=B1=A3=D6=A4.=B3=F6=BF=EE=B1=A3=D6=A4,=B3=
=F6=BF=EE=BF=EC=CB=D9=BB=B6=D3=AD=C4=FA=C0=B4=CA=D4=CD=E6!=A1=FE=A1=FE=A1=
=FE=C8=E7=D2=D4=C9=CF=C1=AC=BD=D3=CE=DE=B7=A8=B4=F2=BF=AA=A3=AC =C7=EB=B8=
=B4=D6=C6=D2=D4=CF=C2=CD=F8=D6=B7=B5=BD=E4=AF=C0=C0=C6=F7=D6=D0=B4=F2=BF=AA=
:<fontcolor=3Dbluesize=3D5>https://reurl.cc/R10o0Z</fontcolor=3Dbluesize=3D=
5></a></font><a href=3D"https://www.1ku111.com"><br>
</a></p>
<p><font color=3D"red" size=3D"5"><u><font color=3D"#0066cc">ku=D3=E9=C0=D6=
=B5=C7=C8=EB=D7=A8=D3=C3=CD=F8=D6=B7</font></u><a href=3D"https://www.1ku11=
1.com">https://reurl.cc/R10o0Z</a></font></p>
</body>
</html>

--_000_TY2PR0101MB2720A16707B216DCE53FFBADB76D9TY2PR0101MB2720_--

--===============1974734101==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============1974734101==--
