Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B19A1816D
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 21 Jan 2025 16:55:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 947E610E5F4;
	Tue, 21 Jan 2025 15:55:44 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from AU1P273CU002.outbound.protection.outlook.com
 (mail-uaecentralazrln102200000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:e40b::])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DEC310E5F4;
 Tue, 21 Jan 2025 15:55:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iru1r+L64DqopZv+SKaeGQeKGMvgN3VQXQ8hJL17S/hiWD6NfkHRKgWN89s3mdbkySLniJp8GEHALT/gMRn/q5CelVxoDtTDKRApPXhTjKPFXXdJTsOStWsSnWTM3hwXYHjp3sHC2sQCrlcTWolcxKolw2BmD/8Jjkl6UkAapxKhbogIvFKIwtRk6QEZCj1YgYdUsPIkhw1Aehac+AcN0goK44pzGLWxxBDYnUuhPuHQpVHkmwwbBpdBE/xqDuGLTuPUBXdbJJLp4HABV2+FtQ59nvS6NpOcJUR6ZeO5ZtgmDEr4pdbKAPnFvYSQf+B9vaCtR3CP+RJQNW2AkOvd3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a1kXxelvG26U5m21by+2nAnGHIzuw5SOBFnRDmZjErU=;
 b=pfnPDRrNJdLKs36gvuRR/srP0feudXXpWfcovNdiMux36FjZgsklSGD0ChA/YBQCaCR8Vok2A+ymymtCE0y9Q43VXpMpBLBo0GeHKhry4v6Q3W0++FWGw8wW5xp87hf42UG7zmqKnPiaEK9T7D0qUrJcEQCx5gu6LeGH6hamh8Dadskv+eTSACdYxov+iYolhFLRLAzushczq90OTU+tlqtFAQoTiCtCOmR/qumQsghSEZkf0UjCFRT5E+X089ZymdkFbKEL4Av+HNBp3QNONGAGkgJqKbigw4S0HNRbL2PentDpIk1zbY93SHgSrwUa1EajJCgyaU+8X7HBMfKOiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 94.56.65.163) smtp.rcpttodomain=gmail.co smtp.mailfrom=kenyanut.com;
 dmarc=none action=none header.from=kenyanut.com; dkim=none (message not
 signed); arc=none (0)
Received: from DX0P273CA0050.AREP273.PROD.OUTLOOK.COM (2603:1086:300:5a::8) by
 DXZP273MB0559.AREP273.PROD.OUTLOOK.COM (2603:1086:300:e::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8356.22; Tue, 21 Jan 2025 15:55:36 +0000
Received: from DX3PEPF0000009C.AREP273.PROD.OUTLOOK.COM
 (2603:1086:300:5a:cafe::1a) by DX0P273CA0050.outlook.office365.com
 (2603:1086:300:5a::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.21 via Frontend Transport; Tue,
 21 Jan 2025 15:55:36 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 94.56.65.163)
 smtp.mailfrom=kenyanut.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kenyanut.com;
Received-SPF: Fail (protection.outlook.com: domain of kenyanut.com does not
 designate 94.56.65.163 as permitted sender) receiver=protection.outlook.com;
 client-ip=94.56.65.163; helo=mail.dubaimetro.ae;
Received: from mail.dubaimetro.ae (94.56.65.163) by
 DX3PEPF0000009C.mail.protection.outlook.com (10.167.240.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.8 via Frontend Transport; Tue, 21 Jan 2025 15:55:35 +0000
Received: from Serrsdexhcn1.dubaimetro.local (172.22.4.112) by
 Serrsdexhcn2.dubaimetro.local (172.22.4.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 21 Jan 2025 19:55:23 +0400
Received: from User (172.22.150.20) by Serrsdexhcn1.dubaimetro.local
 (172.22.4.112) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 21 Jan 2025 19:55:15 +0400
From: United Nations poverty alleviation program <mhusaidi@kenyanut.com>
Subject: CONGRATULATIONS TO YOU !!!
Date: Tue, 21 Jan 2025 16:55:33 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="Windows-1251"
Content-Transfer-Encoding: 7bit
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook Express 6.00.2600.0000
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2600.0000
Message-ID: <5477910b-d842-4a55-a4b8-f902abe3f8bd@Serrsdexhcn1.dubaimetro.local>
To: Undisclosed recipients:;
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DX3PEPF0000009C:EE_|DXZP273MB0559:EE_
X-MS-Office365-Filtering-Correlation-Id: 65f0141e-11d6-489c-c499-08dd3a340af8
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 1
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|61400799027|48200799018|7416014|376014|35950700016|32650700017|30052699003|82310400026|27013499003|2700400020;
X-Microsoft-Antispam-Message-Info: =?windows-1251?Q?Nwyfn90jBtVEV6g/yhmnfAo6Gq3xa/UUrO0rysV/pa13hTkvogIcEGSL?=
 =?windows-1251?Q?U0U5DSa2Z52z78MbUlT1gTf+fmgOrVt5y7bbXtjxvroipKShEw29RfHD?=
 =?windows-1251?Q?b+hCucO2cb5UEhxtbyW6ojgEZvW+TDAKlbVijphYviuveQlaB2t12ZUn?=
 =?windows-1251?Q?e1mOHoAKbapzYQerjIDkx7B4Uj1NmB78HEYG5hZEkG+5fa2/JKQGF4Mf?=
 =?windows-1251?Q?c7jutYm4CMr4a7UA9duheyOhcQqud9AquprmEfboCn8u8kAcrb79htmw?=
 =?windows-1251?Q?XNtnJd6hFE9UUYNVvGEiI1BXi6ztzCzbj2zZf8VIKiah/Vmizyr5FJ42?=
 =?windows-1251?Q?b6aWlLFSSMKa6TgSGhG6aGPtykAoBAymejncBA8bWVWpBcFUTQ1bvDKE?=
 =?windows-1251?Q?+TaFV7wM0ozQJAPEQa43H4lgS4kyNUCw7+4Zziy2ZpfNN1J7Ox1yBcE0?=
 =?windows-1251?Q?oNGIPj+FSJZ4xNcDFXDOY2UzXMjYNr4LwGcE7EFcaJc5FSC0Oo+TF9Xo?=
 =?windows-1251?Q?X9Svf3S6sH3X3wmjKjk6rgJm6y2AmiTcLNiZS4ubIoV3Rw6isf3KXzH2?=
 =?windows-1251?Q?O6uRgROu5vB2JKgnxkFqDERUK/0kKUgrbJXxVsC/EwrtPh2l93O46T4D?=
 =?windows-1251?Q?UUTKZhHpAwk79BXEL7fpENjMsLyGnGu6pc48p+CamvBYA+hl+R9Pp/WN?=
 =?windows-1251?Q?YhkpcWIWbSCvBXs6yr7OJ3VzPLEjgpMjK0ytuKNslK/ocRDml9+huZmr?=
 =?windows-1251?Q?yCORONBTC7HqHbRrWlK8CYyZq994WrogiyZAVjg7cb1Mh9PECzCI2zgb?=
 =?windows-1251?Q?Mn24NBpuWcqS9gF1VmHvQwNg7Gkzj17Kksd9LSGa1H5Edsl9+NdL+tAE?=
 =?windows-1251?Q?DQcqECZalIowKkRyCwcHLg9SpGcBz7Uo1/0oM3PkCB+4KYm3D/hhOxsY?=
 =?windows-1251?Q?uTC+MFJD2GhpMfZ6cr7cusgsBV9RVtdm3Tc5EHaTsdP3BrHwdMTQ1708?=
 =?windows-1251?Q?y0OXGZ0QU3j1er6ZvH0qUUDfCaihCs9D8kaA3nDzM9sm8nL9iAE7AOvZ?=
 =?windows-1251?Q?OkiFF7zFbwxFN9K/n9Uj3ns5KEehIfxHd83R8ORIUee7PyrcaTOKYi8W?=
 =?windows-1251?Q?z9QQunNsw/bp0l9IeyGmMtidxGzwx+dhWBhYnoDv6g1pZsZ0MRW1CUru?=
 =?windows-1251?Q?HR39PVyo6OdqD7wIZ6ymV/8JEDPP2MqSgwXs6htuzvlL9wEKS7svPYiH?=
 =?windows-1251?Q?2z+ztNYSG3H3/HhGsh/qmbn81swczPY5GoctID7ive5Hb2lA+7SsZD/O?=
 =?windows-1251?Q?q/L/gpl7OraGeyoK9hHfye6UPGW7kioJFiWskPwvrJzPuLIKV0igsqs7?=
 =?windows-1251?Q?YyPYLTo1yHEw844pk9mlJ1oBKQeHPwbbFiaNM/QVaQ5jXYd9ETSLEhpf?=
 =?windows-1251?Q?xY7FpLYSc2dGtFx4CMgdVpfCQdFBbUcb2w5jSan0uBF8CVtZ9ibWK13s?=
 =?windows-1251?Q?SMdFSyY7ZCrEH+WHRt4sUdmwSDtB57JSpV/k/IDtLMOytW6kB+mpU6y7?=
 =?windows-1251?Q?mH4eQpJzmxmUICMrxhBf02n6McWhqAD2dWKjNH0vLpByePCXsKV9mSkp?=
 =?windows-1251?Q?iKSXWjCpMYW9AReGVg0yjkwBbh8QW8Q7UB6dAUuDNIXp6MnK7J2xYgSL?=
 =?windows-1251?Q?vPxm8qsIK6lVBQXYW/nmB/hfbmj5cwGBADy/J9tRb4W2iGF2gq7/0ho2?=
 =?windows-1251?Q?B4GHcw79SA9T1z4FubRIkC4kxWOzt63XKQEYVpiiotgoH+z0goVemPOx?=
 =?windows-1251?Q?6HXod/+OeTETwOSklUFgAKhwJIzkoakm9j0Nyec7lCQ4r9PEZLPsliXN?=
 =?windows-1251?Q?+PPaE/fLpvf+6yJu2coJAMLlT5D3Y/ETUAhujA7NCeRNjqghg6o2eXEc?=
 =?windows-1251?Q?7iHGVvRmS4eiwjR3zSqXXXyuMao7OfJ/WdW07pP++33xgHOHuQtSWgTr?=
 =?windows-1251?Q?Vk4DnSpwrSdMnS8tQEQqK1vXT5qQTZY6WL4Wn6+pVBh0A9ZeXiEUooSN?=
 =?windows-1251?Q?iRwmK1iVMLlmBJS9FCv/3vde380LWptywf/L9g=3D=3D?=
X-Forefront-Antispam-Report: CIP:94.56.65.163; CTRY:AE; LANG:en; SCL:5; SRV:;
 IPV:NLI; SFV:SPM; H:mail.dubaimetro.ae; PTR:InfoDomainNonexistent; CAT:OSPM;
 SFS:(13230040)(61400799027)(48200799018)(7416014)(376014)(35950700016)(32650700017)(30052699003)(82310400026)(27013499003)(2700400020);
 DIR:OUT; SFP:1023; 
X-OriginatorOrg: dubaimetro.ae
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2025 15:55:35.2639 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65f0141e-11d6-489c-c499-08dd3a340af8
X-MS-Exchange-CrossTenant-Id: 0d6d1767-1fdb-46bd-8542-63a150227389
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0d6d1767-1fdb-46bd-8542-63a150227389; Ip=[94.56.65.163];
 Helo=[mail.dubaimetro.ae]
X-MS-Exchange-CrossTenant-AuthSource: DX3PEPF0000009C.AREP273.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DXZP273MB0559
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
Reply-To: gregphilipsofficial001un@gmail.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Dear winner,
 
Congratulations! your email address has won US$1,200,000.00 (One million two hundred thousand United States Dollars) email lottery promo organized and sponsor by British Columbia Government in conjunction with the United Nations Poverty Alleviation Program (UNPAP) with reference number: BC69JSA and winning numbers: 06 07 30 33 35 39 with bonus number 15. Batch Number: BC 6/49
 
For security reasons, you are advised to keep your winning information confidential till your claims are processed and your fund remitted to you in whatever manner you deem fit to claim your prize.
 
FILL THE BELOW FORM AND SEND IT BY EMAIL TO OUR CLAIM AGENT, FOR THE PAPER WORK OF YOUR PAYMENT
 
Full Name...............................
Nationality..............................
Sex................………………………
Telephone number .................
Batch Number…………………….
Reference No...........................
Winning Numbers……………….
 
BELOW IS OUR AGENT CONTACT DETAILS:
Name: Dr. Greg Philips (ESQ)
Tel Number: +234 901 115 4900
E-Mail: gregphilipsofficial001un@gmail.com
 
Congratulations once again!!!
 
NOTE: You did not play or participate in any lotto draws to win this cash prize your E-mail address was selected by computer during British Columbia lottery / United Nations poverty alleviation program for the draw which automatically qualified you a lucky winner of US$1,200,000.00.
