Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8N0MFl9BlmkHdAIAu9opvQ
	(envelope-from <intel-gvt-dev-bounces@lists.freedesktop.org>)
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 18 Feb 2026 23:46:55 +0100
X-Original-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B79B715AADD
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 18 Feb 2026 23:46:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65D8E10E04A;
	Wed, 18 Feb 2026 22:46:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=hotmail.com header.i=@hotmail.com header.b="azCAYzD/";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazolkn19013086.outbound.protection.outlook.com
 [52.103.51.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E64E10E643
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 18 Feb 2026 22:46:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MK+Nxp8lTwZ6aUwDeGD6vHOuuUklRVAYUBXnqFZRrpWuOPZ5PGNfCwkXdj8IUoW9vsdRITTL/AT518Q2fV9mzSGCQqRbda92OaDy7ix5xJQnVKvy0ZbU6OfqJDJ/U65mZtVZgfx1SY2QRXXIZVZ+2hU1rulWvGeXo87HpPn5i9k2HXtDTXXV+Ba1VzzmcWQ+c/GxPMehTCWosHmMiaRWEqsnXIDFhnDS7CRwD1jc6HQfxwkVTsrWPQQNnmH4WaQArF7wIIpkD7S+XMcQZdWWh/1U0ikzxQ7Aue8trjy/m5xdU9erWJLn5bTBTRpijELx4B3Gpx9LqliKvr0c29XrmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l+9c+v6OBILjf5GpBeLRwnl/9jxl+M1/+QABlKizSf8=;
 b=KEFPXuDVbu/kjq4qcNk7lMFVgGt3g3mwmT42isCx4WlYsoqcHNJ+tnjBaNcE+oPueE5wh/06URmWxTH7ITwiQMLmsEUA7DLrKz7o/rAvknyZtr+4etsKiwdhzDU7c3LPosNT/jZ1fiGhr+Y0eZ1mz3cxHB0HA2x4VFvaRyGIrXNfUHKsMwzlOufPCJ8eRTobUCNMpRf8LdvSTutdIkRuEiuCkzVHY5exqNbOTj7qbeSubZOWprdL3M4ZfPAXjwwiyXL4nx8nlRwin5qTpd8Fq7WULi+Q7OkJFc7FOY56g/iq5fwYC4Fjnf6MSc52uGx/sS+tlSzX0wrdcEebf8UWig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l+9c+v6OBILjf5GpBeLRwnl/9jxl+M1/+QABlKizSf8=;
 b=azCAYzD/YdFfZrDIhqFlQytuqxb98JrT5/SzREjzoqx1ZdQe6k0OOZnVXNitckQJ3DU9I3TLdTR+y/6Rd30zca89XrJu/OHfP4LZOZ1DG/OlH/u9/VRG2SnqDr8vJSGhe0CTiGshvxKhc7UWu2KO8PWP3jUmF86jetW+1vlPbQ973Q5So0BbPg106+41g8cdvEYmRPGbNuRgpo++mZctD/OvZvWEIAU2lFNosRKnucShvJUfwfOYPjrzIpvDmF2ilXrzfidhJhKHBpccP6E8pPPAZrV+8w/myLor/Gv+VjHSp5bnsA8GJYl+r2yWewqGCKpqdB66SuAYvxgbq+Ao4Q==
Received: from PAWP192MB2179.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:358::13)
 by PA3P192MB2987.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:4b7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Wed, 18 Feb
 2026 22:46:51 +0000
Received: from PAWP192MB2179.EURP192.PROD.OUTLOOK.COM
 ([fe80::474:8ab3:b947:5f2e]) by PAWP192MB2179.EURP192.PROD.OUTLOOK.COM
 ([fe80::474:8ab3:b947:5f2e%3]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 22:46:51 +0000
From: Janeth Whitsett <whitsejaneth806@hotmail.com>
To: "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Subject: =?Windows-1252?Q?_Know_Someone_Who=92d_Love_a_Baby_Grand=3F_?=
Thread-Topic: =?Windows-1252?Q?_Know_Someone_Who=92d_Love_a_Baby_Grand=3F_?=
Thread-Index: AdyhKGAmMre/gd5EQpK1ygSuwW3n1g==
Date: Wed, 18 Feb 2026 22:46:51 +0000
Message-ID: <PAWP192MB217904B086A8671A2D2A7480F96AA@PAWP192MB2179.EURP192.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAWP192MB2179:EE_|PA3P192MB2987:EE_
x-ms-office365-filtering-correlation-id: e38896cd-69ed-4aee-5d0f-08de6f3f9b3c
x-microsoft-antispam: BCL:0;
 ARA:14566002|12121999013|8060799015|15080799012|8062599012|13091999003|19110799012|20031999003|31061999003|39105399006|461199028|3412199025|440099028|19111999003|102099032|40105399003;
x-microsoft-antispam-message-info: =?Windows-1252?Q?lUtGcKpkrM1djhklJ6v5Y1P0J88b3fPUs/u4ZEaztiFINxKTtNxKQTGS?=
 =?Windows-1252?Q?NMOlM0Yo5Yf9ySbaCIrkSKyEyskLOD0u6v0wES/0b0ciujJzucDbleh6?=
 =?Windows-1252?Q?BbQfOZTzydmoxt3y+PcyL8CMpqplRvP4AQCOUC1HGZa/k+qEZKp9eA9S?=
 =?Windows-1252?Q?cuC/t6BZiso6KKjVNHnakdrxKSl3OngLxiTUR2vHum+JPwcy+VMStlvU?=
 =?Windows-1252?Q?CQ3BKsGCHuVslGykNV76jOf3jETQyQPlHTx8J0HHUqZUHbC0wSB70t/C?=
 =?Windows-1252?Q?Y3+32l5BtRBNlK5vCeINrkLt/EFhM/RVdE781HbVbflJpVwlWEDtcYjD?=
 =?Windows-1252?Q?v6UL+SjmpEnV8Fa7kzUowvM65+BQl3k99Jf4oaz0Xr2YHlDm3fUu0FlO?=
 =?Windows-1252?Q?TLphcVN9ex2UghLjhStZibChZthEmYlxmjmce4RLideFhqCx4XhVC15S?=
 =?Windows-1252?Q?nb4CHpkgPOViG92J4wwzkSfh0EddoCiO6dyUMFkNX4KcBb37FHswfvvl?=
 =?Windows-1252?Q?vXdKVVlQkzHcCI3lb1rhlnn2mF7GoFfJ4P0S0sVBl0BBc01eN31p3naX?=
 =?Windows-1252?Q?AnMXGuVUHAooPYGvhJf+Phoo6jAARZcVc+hcVEYuv6lz7PxLCWzJISM0?=
 =?Windows-1252?Q?ArPSm3Jo58w1JNs2s8TqpJEDSQ143lfr915Kb86e0eBTGay07bTfF5sn?=
 =?Windows-1252?Q?bKd0NavVp7nBepw90suY2lGKfaq0+nGk7JDBLfrPZLFZdg99Q+g2Bqji?=
 =?Windows-1252?Q?C6C9enkkzqdas2gjOVM/yMwmuLHzH/xyzZ1AQhlQoestBTKeWveyT0fp?=
 =?Windows-1252?Q?Ec0+HCNBKGPNjW4Uzi+1exn81RVTJUuVwAIhe/DGSgZwVOQSG6QBP6Yp?=
 =?Windows-1252?Q?ttbn87lf4/Diw9fXs1rGo+9dM4iDnmCuYTSGOEyf5VRU53kETOh3XVW3?=
 =?Windows-1252?Q?7oPWcSJYADz00i+qwpSLAuc+QxNKMw1VFoQHFVk30np6hvxCEx0nxDPm?=
 =?Windows-1252?Q?23Eg7S4VHupGVIV80LWbhOiQRrmkR+n/FO0MEfFSzkV8fZXzu0Bsc3UI?=
 =?Windows-1252?Q?mVhG7GapioVxay2t25KsyJvyXRo4qwCyr4rSrTvTYUm/vZb1lDitiW2m?=
 =?Windows-1252?Q?hN5MjszBgJQ7sytekWznG/Ob0DELyOTf03u5A25MicnwQe1EWErVf3va?=
 =?Windows-1252?Q?y/SK7SR/LY9cFArpMHb8iTT4SS8UyK1ZXCRrRAmoWNfyKY+uUgQOIgzu?=
 =?Windows-1252?Q?SHswrFiPsZWIz4NR+ZVxsqfuL5d2V+7WL+rEF4cnQJnavcadVa5tZOYl?=
 =?Windows-1252?Q?9jNQ7V6iW0srDZ6J7HZB2my18VM4eIb3WQU7AOol+0CGaaUov/tLPA/W?=
 =?Windows-1252?Q?JTxizm2ELerezK9RiGvUJkumA5t9d9jzX+7usg0BKgivazxtflZBW4Oc?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?wSM97cXd9VmIKxwRCIw+MMiuAivWriFlS9LbvJ5mtmUVxSlwo/3alQU5?=
 =?Windows-1252?Q?2snyo7hUaR53MVWslPaPW/z0TYgaczuQUzFtY7qCwcqhEORhvbeeaX8X?=
 =?Windows-1252?Q?NSEFZ1so0PeMH/9TZCkZ061LXXP4K7hg9krmHrOQiGv0wiXTqyRaOMiV?=
 =?Windows-1252?Q?M2sts3pbB9UyeS2y4jXf0TjiyHlIDHn76fR9AqvRSQCcKlOcJ1IM+wdM?=
 =?Windows-1252?Q?DnKznbb/pMedSsbfz9A6lTFIPLhGcTrQSFGorjymK/L+ab1ITUfgGydd?=
 =?Windows-1252?Q?nOdkGgD9Zd51TajV8SEjqnoneRoyapJm1Ic/YABawu0sAm8c+wSBwaTc?=
 =?Windows-1252?Q?wnFTKit2PS5EjHuPOJMMoNPCyHXf84Zn9u6CKel0t+x/U5gZ93UgpNxe?=
 =?Windows-1252?Q?oE4gc82rF/cAxL1PnA4HoR+oB7On/PoImXfPUFhxLJ4SyuSea154F4P4?=
 =?Windows-1252?Q?tLY/DFPyaKtNeRKzq0qhBggNyyHjSfL1O4uhqBthO3jJtLoeoYGlXjbM?=
 =?Windows-1252?Q?FDz5t/bHIH98X0jNZRsIJ/SoLYUmQMeRdhzx/awhpUdNoyzrZ+QT7Hld?=
 =?Windows-1252?Q?c3CwBKH1TXig0Q1RWKslsJBv+VQnpiDrkG+9UCQQISdC/jVwqvON0OB5?=
 =?Windows-1252?Q?Te237/K5lmHAUVO/keOWrJShLqFbsJABfYDrJpLdXYTr9+EFDWj2hPJc?=
 =?Windows-1252?Q?Z2V2nUzIyHxgUBuPeWuMB+4nErEyxBint+TRXKL7LvqSwOVT12wpMKib?=
 =?Windows-1252?Q?50FbHqAC1DHYfy1KUuC/THn+7xMWSBHpYlE3N5UbCYLpDHzxHjSRDR7W?=
 =?Windows-1252?Q?OHiW0Vy9Lj0XVoc34iAroUQ/OItDmqc4K6tT3vY2wPACQpDhRwLi+W/1?=
 =?Windows-1252?Q?kOZB25lPXHiausB0vzPyEU+BJiG+U1nQzmVbb9LUNp7B70MJNHCzjnRn?=
 =?Windows-1252?Q?uOzVs86ml1ejSRPEZBpFozAcSTIFXdredV8p7uwMb+SbMtM9BC8FemQR?=
 =?Windows-1252?Q?E4cttgyn9FKTQKk1kt4ui8ELcCeickZ3J1SiQN34G3mKKR5S/WznwjUI?=
 =?Windows-1252?Q?Q5EGDvcKufgSQtp8ANvUBXifYY7tVqoPOfmOyujgs9X1psnUMiwvO2e+?=
 =?Windows-1252?Q?vYyXV2/NZC27GyWI2j3d98kEM/PHBexf2qdwOrQRAwV0gl39p33PVqUC?=
 =?Windows-1252?Q?I7T/xqbhv0+qAhwLL6BsoO8ivpqOS/JPTGaNpkRqaUVVqlRPKNkxrsdV?=
 =?Windows-1252?Q?bt8FG8cDd5cby5/obj2wPFXrGddgmHzFbmRrQtjhx/eXW6ckOCscmxry?=
 =?Windows-1252?Q?QLssHsE+d+UsMx1Enhw1i913g/Cml/0inOZOFaB2+V74w0rvTVBqmrT8?=
 =?Windows-1252?Q?EAKBhaQhtYUF9oa2g3mUVRDlKN7bpD1iYaF7iWFUb38jucb8oLfjcjii?=
 =?Windows-1252?Q?vpJCe+VMgyNrl0pJtRd4q0dyvtmd8b9s8BFPruzf/0SjRE4YXAfBAK7I?=
 =?Windows-1252?Q?ZixO/Erm?=
Content-Type: multipart/alternative;
 boundary="_000_PAWP192MB217904B086A8671A2D2A7480F96AAPAWP192MB2179EURP_"
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-ce714.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAWP192MB2179.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: e38896cd-69ed-4aee-5d0f-08de6f3f9b3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2026 22:46:51.0694 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3P192MB2987
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUBJECT_ENDS_QUESTION(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	SUBJECT_ENDS_SPACES(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[hotmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[hotmail.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[intel-gvt-dev@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[whitsejaneth806@hotmail.com,intel-gvt-dev-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[hotmail.com:+];
	NEURAL_HAM(-0.00)[-0.997];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TAGGED_RCPT(0.00)[intel-gvt-dev];
	FREEMAIL_FROM(0.00)[hotmail.com]
X-Rspamd-Queue-Id: B79B715AADD
X-Rspamd-Action: no action

--_000_PAWP192MB217904B086A8671A2D2A7480F96AAPAWP192MB2179EURP_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Greetings Intelgvtdev,

I hope you're doing well. I wanted to check in regarding the message I sent=
 earlier about the Yamaha piano that belonged to my friend=92s late husband=
. This instrument holds profound sentimental value for her, and she=92d lov=
e for it to find a new home with someone who will cherish it as much as her=
 late husband did.

If you or anyone you know might be interested, she=92d be happy to share mo=
re details.

Thank you for considering this, any help or advice is appreciated.

Best wishes,
Ms. Janeth

--_000_PAWP192MB217904B086A8671A2D2A7480F96AAPAWP192MB2179EURP_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<meta name=3D"Generator" content=3D"MS Exchange Server version 16.0.19628.2=
0204">
<title></title>
</head>
<body>
<!-- Converted from text/rtf format -->
<p><font face=3D"Aptos">Greetings Intelgvtdev,</font> </p>
<p><font face=3D"Aptos">I hope you're doing well. I wanted to check in rega=
rding the message I sent earlier about the Yamaha piano that belonged to my=
 friend=92s late husband. This instrument holds profound sentimental value =
for her, and she=92d love for it to find
 a new home with someone who will cherish it as much as her late husband di=
d.</font></p>
<p><font face=3D"Aptos">If you or anyone you know might be interested, she=
=92d be happy to share more details.</font>
</p>
<p><font face=3D"Aptos">Thank you for considering this, any help or advice =
is appreciated.</font>
</p>
<p><font face=3D"Aptos">Best wishes,</font> <br>
<font face=3D"Aptos">Ms. Janeth</font> </p>
</body>
</html>

--_000_PAWP192MB217904B086A8671A2D2A7480F96AAPAWP192MB2179EURP_--
