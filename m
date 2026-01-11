Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73122D0F820
	for <lists+intel-gvt-dev@lfdr.de>; Sun, 11 Jan 2026 18:22:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0830010E054;
	Sun, 11 Jan 2026 17:22:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=estg.moe.gov.sa header.i=@estg.moe.gov.sa header.b="1xvbwtVr";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11020092.outbound.protection.outlook.com [52.101.69.92])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A75010E054;
 Sun, 11 Jan 2026 17:22:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yUqHHX4nAVRCpJZzcSaqQdtXAPf2uDtJU4P7+KTpbZ3Z2CiTynOh304zIZzhWDDJbQKQYYmLyYf7F6EcxzYRrdyBWDEK7lKDQtyiswQ7QWLRiXDES2KVa/jvnQeiT4hSnAio8JlM+hqW9EC+qqwW2o4Vt6OrdP6778PALsrJtIs7yuTdgf5Vq9E6/qswmyTixlzLHuivyXquGctME9sgAjc4n3t7hRJACKtHF8WAmi2FUGcwYuA0FvzJ6KrFkZJUEyA6/8hOXUs7CPkFrH3xMbZ7KyNeDf7N2DsdTDUIRuw/VioCTncVazQXjLOQDZMLCG3dSc++/ULN/85cdq3aVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jiY366ZuN1w3nqagB5/VdVNnUmfHWRa6Z1EkeP7HppY=;
 b=TRvu8sHCtw4aVbuKD8bFzppVXREgaFm4MF1xiLY9hQegF7pgOAy1WieJiahFlbfAm/0m0LI8qGgtd3DHCJDbcyLqN2LqbQGw4OdIaWrFItHzv2mPznM0Sq2YvRjMwbaVc8EcZB1rWrcnTZDTK1DYGsXbN9eUlmQGeZa6CucmN7K/CQgavPfiUjrO8CAwuihH17pq4GLktsp6VUT1joflkr9MMvv2gkKvfo9WoNIiK7sLj15ZPbO5djt3lylAPFdPuPeT+QKEeKslFIFB7K5L90cjhTjxiL6yZfGLHeCrVvqGBhZV18AWaaAWWhnOqSxFdkIwU4kLlaK8xfJDNjCiEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=estg.moe.gov.sa; dmarc=pass action=none
 header.from=estg.moe.gov.sa; dkim=pass header.d=estg.moe.gov.sa; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estg.moe.gov.sa;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jiY366ZuN1w3nqagB5/VdVNnUmfHWRa6Z1EkeP7HppY=;
 b=1xvbwtVr0sdb5XoFa8fMgeQoVb9CSNeOxhQqV1wPr/x+OIcHZKJlR/DUMxG8VXu14Ko1WZzKXkQQCSMnejQhRQ8XxjHatSEWn8ciYtSEFnaxODVkooYrGy9V6xmxgbXZ/CpNiZKnrr5tzyZxZEKqxhX/tJfRy8b4Q7jW5CyScAO1+o+T63Bj4m5B9pyVWs6CubkkdBJkLDKMetkH+V8zaxMSvx2DbrkAsLEVMcS2VzL4b5sxXlRDWAaspi5fy4yFu3LA3eBCrToLDBzKpIBneaJ6/oXzxfE9lJz9VTSW1mY6d00kVDFDhxGyUmDPUVbI5+J4h+64wwVZsEqwuYtBrw==
Received: from GVXPR02MB10763.eurprd02.prod.outlook.com (2603:10a6:150:150::6)
 by PA4PR02MB7069.eurprd02.prod.outlook.com (2603:10a6:102:bf::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Sun, 11 Jan
 2026 17:22:28 +0000
Received: from GVXPR02MB10763.eurprd02.prod.outlook.com
 ([fe80::9a0:e7f8:6df5:8a66]) by GVXPR02MB10763.eurprd02.prod.outlook.com
 ([fe80::9a0:e7f8:6df5:8a66%4]) with mapi id 15.20.9499.003; Sun, 11 Jan 2026
 17:22:28 +0000
From: =?windows-1256?B?08fR5SDI5Mogx+Ha5sfP?= <S4454635@estg.moe.gov.sa>
Subject: RFQ 2026 FHS NEW ORDER INQUIRY.
Thread-Topic: RFQ 2026 FHS NEW ORDER INQUIRY.
Thread-Index: AQHcgx7T8+ik3vrohkS490r3ObK0mQ==
Date: Sun, 11 Jan 2026 17:22:28 +0000
Message-ID: <GVXPR02MB107631ECBE81F627EF877C7BC9880A@GVXPR02MB10763.eurprd02.prod.outlook.com>
Accept-Language: ar-SA, en-US
Content-Language: ar-SA
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=estg.moe.gov.sa;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GVXPR02MB10763:EE_|PA4PR02MB7069:EE_
x-ms-office365-filtering-correlation-id: 78b01aac-5b53-4b4e-ed46-08de5135ff0d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|41320700013|366016|1800799024|7416014|786006|376014|8096899003|27013499003|38070700021|3613699012;
x-microsoft-antispam-message-info: =?windows-1256?Q?ABC/GAEDQ0LsNQzLfNG0REtDc18zc4flLTNInVNQGF3Kufukbeje9pQ2?=
 =?windows-1256?Q?cqSxqnT0MzgCgFooy5dCPzIiSZy5G5AnSXry4u1JBwPdFYW3Axx+YN/b?=
 =?windows-1256?Q?NuKosNElsupupHSQhuDqHS731SCJLGf64sIwgeF+YunM3C4bMPN41jNi?=
 =?windows-1256?Q?Eqd4dGbpNzdxRXAsgmIssyMeHpPA/zC5i6SBCv2WTjYqkS3swirlCzmS?=
 =?windows-1256?Q?ksrT3f1iGO2MLCWW4a8fKpINe42L/VRhe721NISNJOrCDDaiaeQ06IZt?=
 =?windows-1256?Q?OqfAi2QvxE1z2jx9KFig4rVCpdhDwAbY5PHJAJ9/aRi7KBhi7f+dAnBl?=
 =?windows-1256?Q?kocVMOFsPiJxLdAx7IfKWtlcaH1qgsZaxhRtzZu85tKHXv9LxrY9NPmi?=
 =?windows-1256?Q?fZsM7YFxFCh395QY0bcO7e/NANOfzxgk+pfrCb8vFk/KatvB9T9WnwFq?=
 =?windows-1256?Q?QuueH9cfH4ZwWLuqHP5sxdx7x0l3ZodXqU3FkguNqb+sJj2TXG3RkEJS?=
 =?windows-1256?Q?zDykpV0aQayVP+cz5X2cNHCR1OWscOwTe8/XlCV8YOIkGJsfyJ3ArnB/?=
 =?windows-1256?Q?s6kShAQUSuP0Fkv6mPFnYedbSfAn9JwcL51+gXFJYbxq2JTUl0+S8ogc?=
 =?windows-1256?Q?jpkbJRU+4s1PGgchXd5iRxlBz2yJAbSroZxmeRfCj/O9jpldSOWsiHx5?=
 =?windows-1256?Q?SYuBWDdCIHwXgzPMpDxIs5Kk2a8YyaAl50NeQnFeYe1m3lDXGFb/AUkm?=
 =?windows-1256?Q?jOrYW0xgey6NaI1OyiFNicK0xOtDvs/KSF0c1ie3m2aOvKgRk8tv/xdQ?=
 =?windows-1256?Q?N5oOYh8Dvc0DtuwzfSZM6fmPmqnfzcipgVId6l74/pekd8w63p4tj0iZ?=
 =?windows-1256?Q?KsiebZCNLSU2Vp3SLBgWNRgYCAAtHtPZvd5seNHuN9kmsmbgxBRjfwFi?=
 =?windows-1256?Q?SWewR1DvZXlprTTQhH7I42aqpVcOlJBzWaNnwzU2JHwK6XAr0qtRbIPt?=
 =?windows-1256?Q?QVKs7pBLBt37ePtuoq10VxyjsUiHYwXx11V0pTDMwFRIbvbvAEacZpen?=
 =?windows-1256?Q?F5L53M5lJQaAmwZfMydp/G0ZscNfgayYs82HUbYJkYZHOmRuU5M/mpaR?=
 =?windows-1256?Q?eRPLB31tFmngrcGeSeG7HEJDhJ3TpWRnGzMq3LBuSHfz/NK7NhKyuqig?=
 =?windows-1256?Q?VMZ4sYwHWVYA0RYND1TsG9oiZCXMZhyBcQjPjj0fH4MF8Ah4CF4finhq?=
 =?windows-1256?Q?I4XRGbsC2wOzhBnP0rDmA/fF5/Zi3WlfONTo1xXHvtwuAPRY8nhK6lcH?=
 =?windows-1256?Q?cJFTFu3djLqqFnVkbVy9zG5KW03mGqD37yQRkV0BQOlAktQmg9p/mWJr?=
 =?windows-1256?Q?9I8GvZaZ8ghx0EaasTH76JqfJP32BEkH2acSllDw55quSS60OUx7hyCp?=
 =?windows-1256?Q?+hLl+fh644IO+Za0PleiL+C2Jy3rwuLKvVHz4Dqp/rHs9xYGKYODbo5v?=
 =?windows-1256?Q?WAgGw1lLHiWcMjVDg44PwcquX3dTWyNoBKYk0OJOdBQetO30nPnovRRe?=
 =?windows-1256?Q?yPm2VNUENPCzfG4XHCQorwyOtHc4CPDsweQ7v4iInwFLAJ1tkG3Kgksc?=
 =?windows-1256?Q?eGmw+X8TJ85tpH1CKbaj3/t/JcFlJ9yX3/ZW0irNXii6sw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GVXPR02MB10763.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(41320700013)(366016)(1800799024)(7416014)(786006)(376014)(8096899003)(27013499003)(38070700021)(3613699012);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?windows-1256?Q?miLTfcBiPWrFxAyPEYBsDuyl+dkV0evf66nn70MptZWZ6gb0eQljxvkI?=
 =?windows-1256?Q?Caxuw40nL8KWyAzlJHjr5GgZKe6eOQcogwzGbBGfxJSWGIi0XOTZ8pwg?=
 =?windows-1256?Q?D1nlojHVzQAYqvoLFipsRXfr3Gp1pz/S8tPdsOQ63yrc3TcjPPqd16/V?=
 =?windows-1256?Q?Mw7y1EpkGiiKjMED9lBX+tn/NFSLxsJbFicweAhqtxJ+BdX2RDVy6jfN?=
 =?windows-1256?Q?0yJ+F0ybqIQTi69R6yOybb/j5nE6wCqXNaJj3xo7KPhRtsUIgyqLtCdx?=
 =?windows-1256?Q?kfVtSYR/EsvgzrDZ3c1dE01D3sK7i9OxuDKEbDPxsyULzrO4HxMKkaD6?=
 =?windows-1256?Q?xhdTdOzuz8Moc097HpR3Cqjovbq7M+ibdW40/jNSACEgfJ6GdrPbRIZx?=
 =?windows-1256?Q?eUR0McflHrLXprZioQgzkN8h67DJYQphfoc1hRe8bx0cbI027ZtaLfbW?=
 =?windows-1256?Q?mXy676fSJb9jg36JZ125ClxsW1hrxhZIMbeNwdpLKuc9D0AapbxGNPzl?=
 =?windows-1256?Q?QeNY6CagCvHJ4brYO4uXK6tHyq6izH+Mw19cXhVNGXcxHRFG9n1gzoAQ?=
 =?windows-1256?Q?PbpTVZJaytKHUN3dHfTAfUeJoI2sXoLY+bJjxCnUEXK1BcwY+emWFacJ?=
 =?windows-1256?Q?O/c9XQaTrooReSzwyEAFUrK//lsoivb3RanwLHDzJ5ySYep3DyVekIG7?=
 =?windows-1256?Q?GdeTZBJnJi1hVcunfzGB6ueaeBdxvFDnLjfIle5oSh1m9oYMYtIommiM?=
 =?windows-1256?Q?xF2pV7LMHAN1yv7FGzDjNdIk/YI0QKU+2zrxhE3GzuID2CKZLOnrVuao?=
 =?windows-1256?Q?hViJEji6rO0i43MBwDQWYJ1FH9Ei7zgiBOCTCnhh0gBiaChwIPFfHLTx?=
 =?windows-1256?Q?tIUaD4B+jH0Y0bStt0J3zIEOfFSmELs3loyCBHiu76ZpswJAOYBF5hJD?=
 =?windows-1256?Q?ZKCEAIQhsYf/kOdQCRJ6gGrPojlfA6HlSa/43YJ8eOIh9eAmLZJALV9B?=
 =?windows-1256?Q?T6DnGb0TBsNVPXfRM330otRs0M7J7o/n5vhU9dMbXRAWNhX1RUZSbZaK?=
 =?windows-1256?Q?Pn8jIxsKaxcQekRRlQHYpnQXSjgpBttu7N71L/6r97trU/SkYcqTy/Q2?=
 =?windows-1256?Q?Mn+jgu1sKZMUSwf2imbDe1RGjTpIBctPduipUo9IryEejpOuO8Jj92dh?=
 =?windows-1256?Q?WSFI5qj1j0VUwFTynJe5gtXeJklk2UDM11SHPZ9dfolU0jx8DLVd4Zlm?=
 =?windows-1256?Q?RyGtYv4lu6FJONTSqPxzF/6Em74sjuj3RDyAC6iLbRvuBPxMXzqhaCpM?=
 =?windows-1256?Q?WD55fzUZHtzWj4iKB3kq2pP1RrX1DjYt8m3+Ybj+PXAi+g/8XVPCPmxk?=
 =?windows-1256?Q?OFN3Xd3TpqJAEyPPjj0BkuB1+gfUND8W4ouHMkt+gPT6OUsHieQhANx5?=
 =?windows-1256?Q?IHRZ5PlINxTOfHWbsJXvPh7Fn8Zmk4/bgZTke8KYmIoro2z75u9awhuJ?=
 =?windows-1256?Q?bshmaZ0VJhd5QkFTYxYVe4wEx9xRh4ySc38AgOOsGx8PeKF0Q1hyqZH0?=
 =?windows-1256?Q?2Pg7db/OH/q2cDveDelxap9a5yzAVgmY4xB/kMEdQHkRuIdkW4fsRmAN?=
 =?windows-1256?Q?NDDt3Zdrg+JTHBtUNJUcN69ovOfahciMRKnRtwcV4hNuzUeWcJumFeV/?=
 =?windows-1256?Q?IpQf4UGrz5jruN/j1oc2fpUDN75cZeoFmcVgE3MZNBj1M5uOCJDuql+S?=
 =?windows-1256?Q?08qR6UW5gO6qmWm+E8C04nITpnzrJ5SK7NNaBbNl41e6GRhErdIsGJl0?=
 =?windows-1256?Q?WpvpFKrKMCDlF65i15tVTNIwHjXdKqTvyLMPGKxRHaTY6WDx?=
Content-Type: multipart/alternative;
 boundary="_000_GVXPR02MB107631ECBE81F627EF877C7BC9880AGVXPR02MB10763eu_"
MIME-Version: 1.0
X-OriginatorOrg: estg.moe.gov.sa
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GVXPR02MB10763.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78b01aac-5b53-4b4e-ed46-08de5135ff0d
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2026 17:22:28.6826 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b6875bbb-f371-480d-aba1-2972ce042c2b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MIYGqRJ99IMYdI5iJOXeO5ttBPgHkhCtYcDSbq91PQp4cS2yfdtHDFAPC8zWgmJsHI7BxxNtfBLR38Y5JRY5JgtY3++VXheqM+Y26iPqbe0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR02MB7069
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

--_000_GVXPR02MB107631ECBE81F627EF877C7BC9880AGVXPR02MB10763eu_
Content-Type: text/plain; charset="windows-1256"
Content-Transfer-Encoding: quoted-printable

Good day,

Please we are interested in purchasing your products as carefully listed on=
 your site.

Kindly Provide us with your best export prices, minimum order quantity. We =
are considering a couple of quotes received and your prompt response will b=
e appreciated
Do you have a company catalogue ? Please send to our WhatsApp +447542414560
We thank you and look forward to hearing from you shortly in order to exped=
ite this matter. It will be highly appreciated.

You can reach us on our WhatsApp: +447542414560 for faster communication.

Waiting for your feedback on whatsapp

Best Regards
Mr. Lori Tyler
International Sales Manager
FHS International Co. Ltd
WhatsApp: +447542414560

--_000_GVXPR02MB107631ECBE81F627EF877C7BC9880AGVXPR02MB10763eu_
Content-Type: text/html; charset="windows-1256"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dwindows-1=
256">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"rtl">
<div style=3D"direction: rtl; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb=
(0, 0, 0);" class=3D"elementToProof">
Good day,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Please we are interested in purchasing your products as carefully listed on=
 your site.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Kindly Provide us with your best export prices, minimum order quantity. We =
are considering a couple of quotes received and your prompt response will b=
e appreciated</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Do you have a company catalogue ? Please send to our WhatsApp +447542414560=
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
We thank you and look forward to hearing from you shortly in order to exped=
ite this matter. It will be highly appreciated.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
You can reach us on our WhatsApp: +447542414560 for faster communication.</=
div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Waiting for your feedback on whatsapp</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Best Regards</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Mr. Lori Tyler</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
International Sales Manager</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
FHS International Co. Ltd</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
WhatsApp: +447542414560</div>
</body>
</html>

--_000_GVXPR02MB107631ECBE81F627EF877C7BC9880AGVXPR02MB10763eu_--
