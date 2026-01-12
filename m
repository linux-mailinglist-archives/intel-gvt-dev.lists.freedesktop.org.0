Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4CDD12A6A
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 12 Jan 2026 13:58:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0962A10E3C0;
	Mon, 12 Jan 2026 12:58:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.b="WfmnnsF2";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from TYPPR03CU001.outbound.protection.outlook.com
 (mail-japaneastazolkn19012048.outbound.protection.outlook.com [52.103.43.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0339210E3C0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 12 Jan 2026 12:58:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tldaRZa5IvD9zFKCXuvFgfhcB2gS9Wbbcsl3yXRHBGOmkWSUYo7F9KzUEhJFmF4DB1AgbRq6H+DRepatzURZnKdx4QbT/WPG1bliTKKVJbJcCmYfKCh96mlCO0qLo6IPPRWnzTgseLNY/zUPzjRI3NFKUJ5Oo1B471kk9L1QdUYx6RHPYEFH773GQ2Y72SSyfnA3wGXUEMXYTpYYwtcLy4J/uNGaUgcRld08qLbTLXgaV/82c9NqHtlhi8/Kfnt6OS/zQxBi6FgMX/ZwKF/UsUitu/Wh2MitDMpA+Q2y8j7bQ7Xgs7saiGIR9UP7hzT30Kw05UdR7AIaV5EHu7aHDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GRf3T4VQa2KfnH2jwz7Ymcc8GNRXINPy/lSmpd8uYic=;
 b=iThHVMPDSfasY+7o9Cqz/GxNksb9KPA+753FoTfi7Yh3IrFYq/3ax0eKdd6wrOskZEYUh4KfihC4XcY9O2GAluLNWhTdj/UZz7gRJZiWlHcL71Mcr3XOHtuubQgkTBXbCkWUp82ukogNBSWGoD7vD40Uk8vgR2jmdPN4kp7bQ3VEd+ogv2EGfpDlZeaTG1AcMnvbCRP8GivLrNF4BcahTRgUooauEG+/gm9/Rjjy4GjrUaWJfHI7P1xXOO23s+ibDlrBu9EHlKFLEmmOi5VLWJu3NlRYdUa6L33uwiB5cI9Pmp1vSdXLsla8fSfxy7WFt4AHVXxAyDefxu2mdZHsRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GRf3T4VQa2KfnH2jwz7Ymcc8GNRXINPy/lSmpd8uYic=;
 b=WfmnnsF2aMELyytoZmD9V4xYLCGF8QGZzke8L28VN66ZF+bh7cEm59epwFReRKvbbFqWjtH7KdtYa/EfHCPWKNbiKPDYu6uLLXlJhQ6m8RZLo3T6mYwFeBz9JCfwrRp4104cKRTuHPi1fB2gzUC0+FYjnWWFVmXnVZWuuJnOCBL5qQjiVMLx2m/d6U4TrB0wiaM11issivQZ8eoNSCdKb17ZdYiAQOJKC3NXdcf/ld0vQiSSMuAhmkUK4wgbCOQ42Nm9RRzljjIG6Xvqwr+xGMtiNsTQzRz2X71Pj8CSEfSxSI0wz02o7CRlH5vqL8bFoKfzzU8LB7rKz/JjKt2N4Q==
Received: from SEYPR03MB8325.apcprd03.prod.outlook.com (2603:1096:101:1a5::6)
 by SEYPR03MB7889.apcprd03.prod.outlook.com (2603:1096:101:165::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 12:58:26 +0000
Received: from SEYPR03MB8325.apcprd03.prod.outlook.com
 ([fe80::f3a9:bc03:1769:f850]) by SEYPR03MB8325.apcprd03.prod.outlook.com
 ([fe80::f3a9:bc03:1769:f850%6]) with mapi id 15.20.9478.004; Mon, 12 Jan 2026
 12:58:26 +0000
From: Beatrice Vega <Beatrice.vega12@outlook.com>
To: "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Subject: Would Love Your Feedback 
Thread-Topic: Would Love Your Feedback 
Thread-Index: AdyDwx+/poLwPbtsSv25vq6VAYDOGQ==
Date: Mon, 12 Jan 2026 12:58:26 +0000
Message-ID: <SEYPR03MB83252442A87410D1B68CBBDDEB81A@SEYPR03MB8325.apcprd03.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB8325:EE_|SEYPR03MB7889:EE_
x-ms-office365-filtering-correlation-id: d8565709-3f3b-42d9-062f-08de51da46de
x-microsoft-antispam: BCL:0;
 ARA:14566002|461199028|15080799012|31061999003|39105399006|13091999003|8060799015|8062599012|37102599003|19110799012|20031999003|12121999013|440099028|3412199025|40105399003|19111999003|102099032|13041999003;
x-microsoft-antispam-message-info: =?us-ascii?Q?y+kUSWfteaOVnyQSwJlyAdNQ+B1jeXT2tubhuwfNJ/SC7esKEtGkA6A3ePTL?=
 =?us-ascii?Q?p6c+tGzfYz8Jl5w6rdptUtnU3JrYAEuqsxbmPjdeH6KjLZKrEPDdHQtHiYDB?=
 =?us-ascii?Q?9AJQrt6brLa7Dd/TwU3JUC28x1rL1NnkW9qR7QQto5WQeIc/wAoRhRF+i/Bp?=
 =?us-ascii?Q?fgGKEUpBgTgylCwJavqWxkQxPgGWvMH9JfQng3CukD/xYxoXPItzfq9VWeCi?=
 =?us-ascii?Q?NW0e7oZlBXZM7s6IQW9Ki4hZ/szowOHsp318yRUeM/vrdtcEcPA8/K57/l8D?=
 =?us-ascii?Q?6B5X8/7IeB4O6j5f0mKx3tWJGCvhnXFPYVmJAPt9wrH9QobIvtwCt025iE7x?=
 =?us-ascii?Q?3lkrVQeBwjD0UlrBWihzCJqSgeTo3dUMhl2jchSK3GbtU4UWz+XtYcoWeGcK?=
 =?us-ascii?Q?2Q0TX++3hWyVZ41cGtV2FVrDErhaSjKtFI5ubXv+TNmv94STqcIYTADBQUoi?=
 =?us-ascii?Q?c2VQM+Vf2v1lDWeil6DrrTyxKy96MxLYt7rbRuAlgMe8rP9VQGy2v9oT64YO?=
 =?us-ascii?Q?v3o2QtGMisaZHNzfZ0mBVGLxFcPictYhbggCcPKFiZu/BRkOovnEk6IIMOlR?=
 =?us-ascii?Q?rFwF+KRZ3Lw0dtodMct8dmFR5y12xx7WOlwmjxvYD0oNKnbCbc4L8Fj2uktp?=
 =?us-ascii?Q?FfwhKGvev2Ixa9548a7G2ES4ILbV6wiAeHR+ONlCXZBAgAmRGJZyxdQ6VoXH?=
 =?us-ascii?Q?RntlCKOz3se7KpL0/LyuzNDkxrrmZYJ2VAon8cwQhxsdbeQpcpl+E4k3vCBX?=
 =?us-ascii?Q?TSjeKhyoomRXlJbg97tq/kyKzhLP9ZJd02dcx9CRE4q0g05DV7iifnn/qOrE?=
 =?us-ascii?Q?qpS8HsskDHp+FYQqq+Ey8ipDSjWVzSb9K62ojV9lFfqJ33Z+IfS/eEbwehtK?=
 =?us-ascii?Q?kmzH+8SmYtf9pADN0BOXpjz3I337Vc+0V7+biHJ74XP1rUcKAdtW1Ii478mq?=
 =?us-ascii?Q?bmHbetb6sQonDXYV7uc3+2QkNaqQ4rYWZtC9kMSuF8fDZ5rPG0DzLM48HGEo?=
 =?us-ascii?Q?IpLa9nyp0LrRhkR2xPDF6ct8Nv3GhW2p31J744Ki2fzj06CIwCgtCs+nxuOS?=
 =?us-ascii?Q?HRpq9ZPsmIAjJ+MyL7bHt7zPdlWw2Y6p6NO9Fuo8ELseKNBgRvwIxfFKp+EE?=
 =?us-ascii?Q?tUJPbi6P4LyWi4APzRzXkFRuEgGQnS2qmv6RNro/I3JCiDlmGhqVmwhM9cBh?=
 =?us-ascii?Q?o/7Y3YeKzOWxOblOigBaJktGT5I8/j1YcgR50q6WdF0LvrehnWXFVOBdsycT?=
 =?us-ascii?Q?2JOQOiBTIDvzkms9mT9rKH1OZFJzPaW+5clu0XhZdCy1sB+yGYbai8YqDI1h?=
 =?us-ascii?Q?Tb8bM7scpIRoZQ7jfqHqMn6fNAvSzXGbx4lKyWUat2MXutQlqv9B5cSi5mqR?=
 =?us-ascii?Q?d/Z9QKOk18eCz7AJJ7lAiFcZG2f6?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Dz3OaYo5jRFeXmZfIcGHIUpqalg7nmxxzeYPe8WZqvlPzLkLaOTTYlj2C5JM?=
 =?us-ascii?Q?oBMDSJ+KUfip3qSdcy9NwsBlPlirxYnNJYYz4PsVTx8Z1z/Cb48h4FP1gIl5?=
 =?us-ascii?Q?FAwm8Zha7fT/DcoxE/fEMlDgptpFo4y2WL9/ocDcWtxk8KbZU3cXn8DGvLqT?=
 =?us-ascii?Q?r9gSRfPasAjUMR+po/tA/sydyGB0s166Fkn4kWmFVWlzCDjcykSSNtjmncG3?=
 =?us-ascii?Q?JpdMA4nCCGLrVGufuvex3sUg6t2+fIMiHtmeyDOIARaS1jBqp4g5oSdBXs52?=
 =?us-ascii?Q?50o3CD8o0MQqZDmPfwd5Xn5ZA2TUh4g7Yx20JNIypiYyu1gXjPm73g6i4XLH?=
 =?us-ascii?Q?rx0Uq29Luq1Z+5ZO4QH5mt1hxt/DKavykqPdUhKpX+rk9c6NR9+WceI90Abm?=
 =?us-ascii?Q?s6X/CxQGYJhW15/829wyHcQWucTyBxZYlJYP8xOnJSH14aTpIICK4wxI5R5I?=
 =?us-ascii?Q?vMxJu2rad9iEnrfh3mm7anrY+lzDsgykEHZyvNR7AX+N5Sab8k6Chyr+yHgG?=
 =?us-ascii?Q?ZT2wb+Kq1YSMimTXDkHfjfTLWFiCo04RyCNw7r7fGQYFM3Nk3qMuT9UeMWJv?=
 =?us-ascii?Q?yvI2N6d4NieiITZuzQiB2XMuEk40nvuBo2q19vi1ZzOLo/nFgBSuTpu4uifU?=
 =?us-ascii?Q?aa+ojawX737/Mg6uWEwJUVY3T45Q/nsTz+LYL5iHX3CWKeYdNWT32NAPXj/D?=
 =?us-ascii?Q?OTpmW9v/V5IG4ORgo0T9eJ/dIJoEdXXS08xXCteV6mfQ3xLLBR5LOGad1hfH?=
 =?us-ascii?Q?LMWv5Rbe065Qi4GQJUcHhvM7Pb75cv504ITqFEVj1T5qtvKlMJ1VP2bSGLoP?=
 =?us-ascii?Q?YUIzdJgJMd2duwzy4UIFWzpByxCA6fS6EuL/nNkmuqC3L+aHpT6JQKc5R48L?=
 =?us-ascii?Q?n3sbAcBjmGpf2i40XNF0g80qyMDhL7tY8ZfbB2SoTbDKnk42Q0OSZyqkfAd4?=
 =?us-ascii?Q?BKdQmTSFxLNNYMU3BV2JPdS7BdArIvIhbsXb6BjTfS+NxdusFwJcpIaJFcB3?=
 =?us-ascii?Q?NV0vaNzUKsBz0XwvmsPOiAr/YWFdw30rdmg45dRyLE9eYasfEa/FHb+I7qnN?=
 =?us-ascii?Q?7WuCJRiI7MflnS35EzfqdfwME+/2AiLCWN2IeLZFfiAP3kTZX8KHsw7gvlqz?=
 =?us-ascii?Q?INgGFgjWhd4BjDLDR1uONdadV2znFIN7T4E6WGlS6r/4Ucp4sjY654wM0sY/?=
 =?us-ascii?Q?m5Vv6Rn5zq1ZepYlueTYLOjL8ZgO8x+j2E/ICpfkOvjwMKTa9UgWnuB1ULGd?=
 =?us-ascii?Q?75iqtb5aeGYAOKW/ZtVk/FZln8sm3J9gu5x0wJPu/okBU+09KDQuL33Sv7ym?=
 =?us-ascii?Q?mZlA9seEok+9ahe85vJvZ1huba7QlxcoW/SocYb9v3OrcexWWOJ5LNG5Bod/?=
 =?us-ascii?Q?BZWN5f/P0eFsBWUd6LdCBCYJwTto?=
Content-Type: multipart/alternative;
 boundary="_000_SEYPR03MB83252442A87410D1B68CBBDDEB81ASEYPR03MB8325apcp_"
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB8325.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: d8565709-3f3b-42d9-062f-08de51da46de
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2026 12:58:26.6224 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7889
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

--_000_SEYPR03MB83252442A87410D1B68CBBDDEB81ASEYPR03MB8325apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Greetings Intelgvtdev,

I hope this message finds you well. I wanted to check in regarding the mess=
age I sent earlier about the Yamaha piano that belonged to my friend's late=
 husband. This instrument holds profound sentimental value for her, and she=
'd love for it to find a new home with someone who will cherish it as much =
as her late husband did.

Please let me know if you're interested or know someone who might be.

Thanks for your time; any suggestions would mean a lot.

Warmest regards,
Ms. Beatrice

--_000_SEYPR03MB83252442A87410D1B68CBBDDEB81ASEYPR03MB8325apcp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"MS Exchange Server version 16.0.19426.2=
0218">
<title></title>
</head>
<body>
<!-- Converted from text/rtf format -->
<p><font face=3D"Aptos">Greetings Intelgvtdev,</font> </p>
<p><font face=3D"Aptos">I hope this message finds you well. I wanted to che=
ck in regarding the message I sent earlier about the Yamaha piano that belo=
nged to my friend&#8217;s late husband. This instrument holds profound sent=
imental value for her, and she&#8217;d love for
 it to find a new home with someone who will cherish it as much as her late=
 husband did.</font></p>
<p><font face=3D"Aptos">Please let me know if you&#8217;re interested or kn=
ow someone who might be.</font>
</p>
<p><font face=3D"Aptos">Thanks for your time; any suggestions would mean a =
lot.</font>
</p>
<p><font face=3D"Aptos">Warmest regards,</font> <br>
<font face=3D"Aptos">Ms. Beatrice</font> </p>
</body>
</html>

--_000_SEYPR03MB83252442A87410D1B68CBBDDEB81ASEYPR03MB8325apcp_--
