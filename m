Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67CA43A8859
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 15 Jun 2021 20:16:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1678489BD4;
	Tue, 15 Jun 2021 18:16:09 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-oln040092254060.outbound.protection.outlook.com [40.92.254.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E97C89BD4
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 15 Jun 2021 18:16:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CCuvxgB2GR1fHKOjqsyNa8oj7HEdyZMBEVD7rBOCh9csc/4I8HXhBIXuabVMJwl00bjDqegma2c7Lk0pG4127WBe+KnOuk4SuAf1aeeTFc9vSLRkfLlIHL7rZi3p+M80wkga+ctTdWHJqOyygAF/MJRsTplNa09SEGDm9S8TZPk2zJyR2YwgfsiaYE0tEvypvQS8bhvN8/OAH6ZtxCDSp8JwQPhlImlzQx1HKOLoWiHeln5Id0soeuonxHy4o3ciYruUqrds9TlPDljk/KO1zeRGna4xqnF+rAtt9nf1RbeO89gq2/oJkfSn9UvCdzrpNdtH1KNFHLB4CLrClESMUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YLDInCaXnNRnoYS+lwylXO5qAy39ib1wgT4WOC01lhQ=;
 b=JAEqd6IS3rBzw7ckGO91h5ipPD1V240geqXW1AlQ6x8vDNJT1Vu1wD+hRyIL5pDT1e2lUqr9xSHtGnKvkmrJY2YYqR1XBHVaXNagBcFs+H7vBslOs6hHal0yRDtxwWbueW2VTX9dXyNhcB9uMnf8DB+wLqU0jrWtRZLkCy2esgLM3rCWsHt7/TGfF//wDaVrGXDlHDn1yKqTBRpWrXdpbfXhPBMYimeojOmthPO2UvI4gjFBlcgd+qHuxwfoQRcPwdHnR1lVtpKu72TFvl2vhdP3/xdYRZRphqeeTzASyIgbm7KAdfAMx64o5WorQgA6f0NMpTVxTzIkY/4fY1vJ+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YLDInCaXnNRnoYS+lwylXO5qAy39ib1wgT4WOC01lhQ=;
 b=BkUam5OL0JsyLHj/Yngtt9OfCPhZ2ZcUrUbdFCJfxRsZ1s4+9qz89bw/ti8zvhCLUYHWOi4G/mhcfjCbG/yKNzqMN778OSaZKTz2O6koogWvS9iLxG95p6BhVQu+Bb5n+cjNdEKhQx8QW8yzcVuUGpVoTNnonUaigjsyd/VBh3ieltzggzkbnJ9INNe/RlSnZDPZenNuIrQDTMrVqRkFk/8Maili/hShzkUCZp+W7cWMuGA3F1Wcjvwa0LTgsrsb2tZLImF/VH2FlYleIufdJ5bN07r06lMXrqb8DOgB3v9VPK4Xtzhv1tO+581wgBuL7kopRnlt3/sxFpTjBgB4ow==
Received: from TY2PR04MB3472.apcprd04.prod.outlook.com (2603:1096:404:93::10)
 by TYZPR04MB4367.apcprd04.prod.outlook.com (2603:1096:400:6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.23; Tue, 15 Jun
 2021 18:15:52 +0000
Received: from TY2PR04MB3472.apcprd04.prod.outlook.com
 ([fe80::a5b3:5b0e:9739:e39e]) by TY2PR04MB3472.apcprd04.prod.outlook.com
 ([fe80::a5b3:5b0e:9739:e39e%2]) with mapi id 15.20.4219.025; Tue, 15 Jun 2021
 18:15:51 +0000
From: mcdan nodinna <sherrirk7jgn@outlook.com>
To: "yao_xl11@hotmail.com" <yao_xl11@hotmail.com>
Subject: =?gb2312?B?usPN5rrD0661xDI00KHKsdPpwNbGvcyooauh7w==?=
Thread-Topic: =?gb2312?B?usPN5rrD0661xDI00KHKsdPpwNbGvcyooauh7w==?=
Thread-Index: AQHXYhJ5HiC0GX79QUO649lLqrOHdw==
Date: Tue, 15 Jun 2021 18:15:51 +0000
Message-ID: <TY2PR04MB34724F80FEACDADE4AB907638A309@TY2PR04MB3472.apcprd04.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [ZLiT1omouATLHEjXOo8Dc+fVBGnTtx/r]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9d095c84-804a-4ad6-e82d-08d930299c10
x-ms-exchange-slblob-mailprops: NS9Gj58uCj05BZi20I8HdojX08Yhdbg+Q4X3cn2TDRuZ+nLWvZfCQ7h4y7LhMXStTYGBvOClxvX3txp7L8C8eOEpQ6ldPmayKUGxJLuLVTe6vnArAshazkhyIU6fRp1epch7W4arKPzpuPeFVxQ1zav5wYKzXamFJ6ziHYtIbZ02V7jN9220XD613LSl4Ky1hjXpLKgxkAKlefaMIYzhdJhIfVyB6NJCMfeI3lfG/EsEIdvGXaAWom5jNbSyvtkjDj58HDzI7cKQ8MpcA3BJIgSP3U3rz3PYJdJUf4m9gfow2ZFxVl0vL9qk7uZ36soTVH/fdyCaNS1bv29ahRgy6Y5aGOvdoG4EhXJPKJ5lkKhUpJSasreqtBgxzW0ATJyJhgRAVkV2iSFh12KxnPjTswZoXF13ONaMr5bvzBEE0QP8WZJ+Cwd+dVKeNwriPnbTmt0Q7BwujiDXeqI4dP5hXWqIRWARHaSDOO32P/4bgr5bkv/BX4FzmoCTZhLCx5eF1Sh8jp8pGJcBnmePyVhjhm4S/MbV+N0jB9qsXwfqB3yr3V6eHerpcBEj0eJ6TI9kaAtAj1sqQmUyU89LdjwtWL2mNGhtpIo2Ky6O3r8H5Z/zv/I74BRxFrlmzXOxMyFRe35dJUiyqIvhvYjdUknY5+Tb4f1nnOePEwSM8GpaOTNFv96A5A2zJk1sXuQybb6mapx0QhMravYt7/3sPABUWw==
x-ms-traffictypediagnostic: TYZPR04MB4367:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SndJMp780ouSg3u9WLTXxEOJ/XR+t0aOZGntTTQ1t4yGa0L0y6WticZhfdlcmGSk5QwJFTq4ro8+M4cyobB/WgJKIRvM3hlulvUPLypv/7x1555LVw6yJzYsKsdSIjtf6T8VUYYyM3RLQpqKsHeQ/8c9wD5IpNq/fGyM6BWBw8Xl7RqqvwdmcoYt+GCW9/BQUWnV3Yx+1JWXr64j+5ImbZwFNqr7Xp6UwIK1glHOAnkAq+GtNP/gaEBk9IsGi+PTTjFRAQzkbTZw9Va8CGfJk1ScknV+TVE1dNQgR9L+s+kIid7E5LL3opydErSyaB6XWgwzsv7nhOsvfgP+DV0wpWEO1U401qB3ERVLzn9l6OoBy8BgXvhpBTxZHCtbUg8DY5458RD8THsVmhGE/IjCX9QnXYMXzm9Cq+OuamRviBiIsjZxjNFZdYUdgJDvnVJ44xjR5Zervg14sdqaXBR4aw==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: ROZcwOzYCK0wCVX15+RDKRDWXR6Qg26s4aHW3K2S7MO2MWgs8mMcSZ2A279/+I6M38wyHtKcOcZiWef++SZJSla68vvRd/7kH/cTXtBq+JBiMPRoxrOERzxibohjyASidXJre4Ih/YmA0PfxYlvuWA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR04MB3472.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d095c84-804a-4ad6-e82d-08d930299c10
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2021 18:15:51.7853 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB4367
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
Content-Type: multipart/mixed; boundary="===============0985146755=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--===============0985146755==
Content-Language: zh-TW
Content-Type: multipart/alternative;
	boundary="_000_TY2PR04MB34724F80FEACDADE4AB907638A309TY2PR04MB3472apcp_"

--_000_TY2PR04MB34724F80FEACDADE4AB907638A309TY2PR04MB3472apcp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

xPq6w6HvIc7Sw8fKx2t10+nA1i7O0sPH1fu6z8v509DT6cDWzfjTzs+3LsjDxPqyxri7vqHU2srW
1tAuz9/Jz7Osuf2w2c3yyMvF48T60rvG8M3mz+3K3Nfu1ebKtbXE1ebIy7bU1b0usNm80sDWLsDP
u6K7+i7M5dP9ssrGsS6499bWyrHKsbLKtcjTzs+3trzT0CzN5rzS0+vN5rzS1q685LXEttS+9i6z
9r/uy9m2yNfuv+w1t9bW06OstvjH0ru5zOG5qbOsuN+1xMXiwsrWu9KqxPrT0LG4tvjAtL7Nv8nS
1ML61Ni2+LnpLs7Sw8fKx9X9uea+rdOqtcTT6cDWzcW20y6h77Gj1qS1vb/uu/DL2bW9v+4uxPrP
67Tyt6LKsbzkLs/7x7LKsbzkLtfc09DE48/r0qq1xNPpwNYu16Ky4dPQ08W73brswPsu0vLOqrPP
0MXL+dLUztLDx2t10+nA1sTc1NrIq8fyzfjC59Taz9/M5dP9zbbXosa9zKjW0NOutcOzz9DFv8m/
v7XEw8DT/iEg1NrP38zl0/2+urLKzfgs1+680cqxyrGyysa9zKgstPPA1s241KSy4iws1ebIy7DZ
vNIstcLW3cbLv8ssIDI4uNwsoe/C6b2r087PtyzFo8Wj087Ptyy2t7XY1vfTrs/WvfC1yLbg1tbG
5cXG087PtyzAz7uiu/ostefX09POz7e2vNPQIbTzvNK2vNTazea1xGdhbWXE47K7xNyyu83mLr6r
ssrJ+rvuvLS/zNW5v6qjoSDGt9bKsaPWpC6z9r/usaPWpCyz9r/uv+zL2bu2063E+sC0ytTN5iGh
76Hvoe+h76HvyOfS1MnPway9087et6i08r+qo6wgx+u4tNbG0tTPws341re1veSvwMDG99bQtPK/
qjrViNF90XVodHRwczovLzByei50dy9WN3FVYg0KDQprddPpwNa1x8jr16jTw8341re08ulfaHR0
cHM6Ly8wcnoudHcvVjdxVWINCg==

--_000_TY2PR04MB34724F80FEACDADE4AB907638A309TY2PR04MB3472apcp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
</head>
<body>
<p><font color=3D"red" size=3D"5">=C4=FA=BA=C3=A1=EF!=CE=D2=C3=C7=CA=C7ku=
=D3=E9=C0=D6.=CE=D2=C3=C7=D5=FB=BA=CF=CB=F9=D3=D0=D3=E9=C0=D6=CD=F8=D3=CE=
=CF=B7.=C8=C3=C4=FA=B2=C6=B8=BB=BE=A1=D4=DA=CA=D6=D6=D0.=CF=DF=C9=CF=B3=AC=
=B9=FD=B0=D9=CD=F2=C8=CB=C5=E3=C4=FA=D2=BB=C6=F0=CD=E6=CF=ED=CA=DC=D7=EE=D5=
=E6=CA=B5=B5=C4=D5=E6=C8=CB=B6=D4=D5=BD.=B0=D9=BC=D2=C0=D6.=C0=CF=BB=A2=BB=
=FA.=CC=E5=D3=FD=B2=CA=C6=B1.=B8=F7=D6=D6=CA=B1=CA=B1=B2=CA=B5=C8=D3=CE=CF=
=B7=B6=BC=D3=D0,=CD=E6=BC=D2=D3=EB=CD=E6=BC=D2=D6=AE=BC=E4=B5=C4=B6=D4=BE=
=F6.=B3=F6=BF=EE=CB=D9=B6=C8=D7=EE=BF=EC5=B7=D6=D6=D3=A3=AC=B6=F8=C7=D2=BB=
=B9=CC=E1=B9=A9=B3=AC=B8=DF=B5=C4=C5=E2=C2=CA=D6=BB=D2=AA=C4=FA=D3=D0=B1=B8=
=B6=F8=C0=B4=BE=CD=BF=C9=D2=D4=C2=FA=D4=D8=B6=F8=B9=E9.=CE=D2=C3=C7=CA=C7=
=D5=FD=B9=E6=BE=AD=D3=AA=B5=C4=D3=E9=C0=D6=CD=C5=B6=D3.=A1=EF=B1=A3=D6=A4=
=B5=BD=BF=EE=BB=F0=CB=D9=B5=BD=BF=EE.=C4=FA=CF=EB=B4=F2=B7=A2=CA=B1=BC=E4.=
=CF=FB=C7=B2=CA=B1=BC=E4.=D7=DC=D3=D0=C4=E3=CF=EB=D2=AA=B5=C4=D3=E9=C0=D6.=
=D7=A2=B2=E1=D3=D0=D3=C5=BB=DD=BA=EC=C0=FB.=D2=F2=CE=AA=B3=CF=D0=C5=CB=F9=
=D2=D4=CE=D2=C3=C7ku=D3=E9=C0=D6=C4=DC=D4=DA=C8=AB=C7=F2=CD=F8=C2=E7=D4=DA=
=CF=DF=CC=E5=D3=FD=CD=B6=D7=A2=C6=BD=CC=A8=D6=D0=D3=AE=B5=C3=B3=CF=D0=C5=BF=
=C9=BF=BF=B5=C4=C3=C0=D3=FE! =D4=DA=CF=DF=CC=E5=D3=FD=BE=BA=B2=CA=CD=F8,=D7=
=EE=BC=D1=CA=B1=CA=B1=B2=CA=C6=BD=CC=A8,=B4=F3=C0=D6=CD=B8=D4=A4=B2=E2,,=D5=
=E6=C8=CB=B0=D9=BC=D2,=B5=C2=D6=DD=C6=CB=BF=CB,
 28=B8=DC,=A1=EF=C2=E9=BD=AB=D3=CE=CF=B7,=C5=A3=C5=A3=D3=CE=CF=B7,=B6=B7=B5=
=D8=D6=F7=D3=AE=CF=D6=BD=F0=B5=C8=B6=E0=D6=D6=C6=E5=C5=C6=D3=CE=CF=B7,=C0=
=CF=BB=A2=BB=FA,=B5=E7=D7=D3=D3=CE=CF=B7=B6=BC=D3=D0!=B4=F3=BC=D2=B6=BC=D4=
=DA=CD=E6=B5=C4game=C4=E3=B2=BB=C4=DC=B2=BB=CD=E6.=BE=AB=B2=CA=C9=FA=BB=EE=
=BC=B4=BF=CC=D5=B9=BF=AA=A3=A1 =C6=B7=D6=CA=B1=A3=D6=A4.=B3=F6=BF=EE=B1=A3=
=D6=A4,=B3=F6=BF=EE=BF=EC=CB=D9=BB=B6=D3=AD=C4=FA=C0=B4=CA=D4=CD=E6!=A1=EF=
=A1=EF=A1=EF=A1=EF=A1=EF=C8=E7=D2=D4=C9=CF=C1=AC=BD=D3=CE=DE=B7=A8=B4=F2=BF=
=AA=A3=AC =C7=EB=B8=B4=D6=C6=D2=D4=CF=C2=CD=F8=D6=B7=B5=BD=E4=AF=C0=C0=C6=
=F7=D6=D0=B4=F2=BF=AA:<fontcolor=3Dbluesize=3D5>=D5=88=D1}=D1uhttps://0rz.t=
w/V7qUb</fontcolor=3Dbluesize=3D5></font><br>
</p>
<p><font color=3D"red" size=3D"5"><u><font color=3D"#0066cc">ku=D3=E9=C0=D6=
=B5=C7=C8=EB=D7=A8=D3=C3=CD=F8=D6=B7</font></u>=B4=F2=E9_https://0rz.tw/V7q=
Ub</font></p>
</body>
</html>

--_000_TY2PR04MB34724F80FEACDADE4AB907638A309TY2PR04MB3472apcp_--

--===============0985146755==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0985146755==--
