Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE4A59B070
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 20 Aug 2022 22:30:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE05610E18D;
	Sat, 20 Aug 2022 20:30:03 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01rlhn2183.outbound.protection.outlook.com [40.95.54.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA0CC10E18D;
 Sat, 20 Aug 2022 20:29:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KDGZZGWe+CazQNSrESJloIN21Fu8vfYRUtApoAQLQY61/j+v3F1syEwg/rB7fNmt7DUYpBuTpbirqZ/nfVnZT7YYMtMZEuaw1adbqFErpV5YGi1Hejp+VOvvVUOFxSQ3MpSZILbFO7EDXlwHWA4TwL2bZUVTE3zlFMMseR/n+bSnIV6GgnPubQK5cEcrbrRVJ8M3s3a2gKfZ3+oFSgK9UkQBA61V2SBuSItfhQ9jl1U2ThGBc8H9fzS4aWL4RiOCzJkAnKVlNoW5mD/dVodKMcgc6pcQYuVyA/YdLDRBWuX4WRa7L9Vrv5mF7/YAPCqkaAknlyt/Gf2MaaxUFp6Vgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XVMhxF0AAQsrWMhcVTNXn5mmwl2APDNhDOS6ajugVOU=;
 b=GegF8Wz8l61WJy3qX1zWOrIU3j/nRKUlH9MPv2/PAFwkD1cBQrMKYtSKTY4XjdEViPcxw8dpfPyMegav+o8G6VslYa+hN2pt0p2D7bG17ULYk6i4h5ulpB8dFcMOWJpUWuW8HXoYQezjzoH1Lvr2+h5sdappvojCL1dyhCUUybFpyFns5rq+VKRDXDqg9vX8YYbXv/1D4ih2Wu6+a2fHALjdMHX9JaFfhbmc0sPHLT7TfipDLxkJs1/W5LATw0KM/9IZRoaFlzbsy28SFQYJekEgLOWiOiHH07zUqn5fuGAsNAXSMLnlUV/Nl1HF1QqGODACQPC/srlkvgVHVNutuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 47.254.239.197) smtp.rcpttodomain=formslive.com.au
 smtp.mailfrom=hiroshima-c.ed.jp; dmarc=none action=none
 header.from=hiroshima-c.ed.jp; dkim=none (message not signed); arc=none (0)
Received: from TYCP286CA0070.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:31a::14)
 by PUZPR04MB6142.apcprd04.prod.outlook.com (2603:1096:301:e3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.21; Sat, 20 Aug
 2022 20:29:53 +0000
Received: from TYZAPC01FT050.eop-APC01.prod.protection.outlook.com
 (2603:1096:400:31a:cafe::2c) by TYCP286CA0070.outlook.office365.com
 (2603:1096:400:31a::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.18 via Frontend
 Transport; Sat, 20 Aug 2022 20:29:53 +0000
X-MS-Exchange-Authentication-Results: spf=none (sender IP is 47.254.239.197)
 smtp.mailfrom=hiroshima-c.ed.jp; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=hiroshima-c.ed.jp;
Received-SPF: None (protection.outlook.com: hiroshima-c.ed.jp does not
 designate permitted sender hosts)
Received: from mail.prasarana.com.my (58.26.8.158) by
 TYZAPC01FT050.mail.protection.outlook.com (10.118.152.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5546.15 via Frontend Transport; Sat, 20 Aug 2022 20:29:53 +0000
Received: from MRL-EXH-02.prasarana.com.my (10.128.66.101) by
 MRL-EXH-01.prasarana.com.my (10.128.66.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Sun, 21 Aug 2022 04:29:28 +0800
Received: from User (47.254.239.197) by MRL-EXH-02.prasarana.com.my
 (10.128.66.101) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Sun, 21 Aug 2022 04:29:28 +0800
From: "Mrs. Mai Hynoi" <daimon-h@hiroshima-c.ed.jp>
Subject: Re.With warm hearts I offer my friendship and my greetings.
Date: Sat, 20 Aug 2022 20:29:28 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="Windows-1251"
Content-Transfer-Encoding: 7bit
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook Express 6.00.2600.0000
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2600.0000
Message-ID: <3b646c62-661f-4458-9b38-03e4c94042d0@MRL-EXH-02.prasarana.com.my>
To: Undisclosed recipients:;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[47.254.239.197];domain=User
X-MS-Exchange-ExternalOriginalInternetSender: ip=[47.254.239.197];domain=User
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a7193722-5d7d-4a8c-db56-08da82eabd3c
X-MS-TrafficTypeDiagnostic: PUZPR04MB6142:EE_
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?windows-1251?Q?ypFIeKz1BkyVwlMieYaVcXZnzp4wCEJ6o/SuYJSKu4bSDFUHMuBY6tOv?=
 =?windows-1251?Q?OrwlLoReS8QZDGB0V94zxSldM6Jx1pu8pur8H8cmeFWVV7x2Ox3FvQek?=
 =?windows-1251?Q?dz189r/U3hND4r2r0nSwlRcpZUzB79NghWwNa8AI3Ry3QVVHlVJupsu/?=
 =?windows-1251?Q?5BfjHLhg6QpKUD/4MRlLsSr8kOrPNBhXq2jxTcnnQvHJRetwkUAj/q/1?=
 =?windows-1251?Q?cR60uFA8RipQ5Wh9Ja8m/19eaohFzrHbO7zTdS38CG4CluAMZKW6PcDB?=
 =?windows-1251?Q?ENjUe0CTEPlUL/CbWOKQ87naU31HeIEURMDy6WD1LquEsxVfw8YasK29?=
 =?windows-1251?Q?CiiK5bG1ssFbiqAEh2RYlmvvQmr0G8AUn4abBjaXjq6qsyDmOD7I4hCh?=
 =?windows-1251?Q?fMoxrPW3sRJAZSQyoEdFMYhI8PngbXEGr8CnHghgsOLOyTSe14ovsoG7?=
 =?windows-1251?Q?Wr1YviKlPyjqgQQk/Z4QEiPLISUfSnyaiRcE5IFJOJo3qfUPMN7RaM79?=
 =?windows-1251?Q?RbFIhtSoNxez/ez2V1l+QLTYl7rEdOmVAMQyP3BJhlYrRyCJdC+eKlxM?=
 =?windows-1251?Q?0UqjK/Eajoc3qIV2XeqpypGAovg1qpdqv71GHEEVd1iIkdv3GWNNIhhp?=
 =?windows-1251?Q?DLYtRMtY/w/77x+PJCj0/TqWdTogaHkTStj2vxnDFdWOslmxdzfisZLj?=
 =?windows-1251?Q?QGb99wnlsEICMuJoA30BIzFb14eks563SMCQ89k0c9h5jpuVIG6dDx9n?=
 =?windows-1251?Q?1xdLRhm73bCqJvao6pA7pttQN64kBstSIo2fozd5Yg7Txjk3CN0fzyYd?=
 =?windows-1251?Q?KiQ3/YM936vywHOpwBNb6bcDzP1qdtFjDL9Q5hmvuwaL8/pzecHEo04S?=
 =?windows-1251?Q?w5MSgnPbdtbup0j+EI3FewMxZVpr25DR+ddneW0TlSqENI7Lxs96zzTA?=
 =?windows-1251?Q?GiLu/640NxipczPNNCr9W8N9Kug1AI9zoJXNUL9g7tNdne03zC1g3CP0?=
 =?windows-1251?Q?RdKuypey3z2fHKbBPw5hx6irAiznTIB6IoH31YRczJBKD1PY+sRY9ugd?=
 =?windows-1251?Q?OX2RoDFmoJ8WxwA/NLhjp4K8cYNS36akdDQ0foB3P0OldDYG29V6azIZ?=
 =?windows-1251?Q?L/MLRFiXlUEf0m/BDT6g5l1wLVcC1Hbz8HnLqVgaS8OEz3nlw84R0LjJ?=
 =?windows-1251?Q?nRPaurU80EwIB8qqqH0hcXh1rYjlGrl+7uh1by4rBaLFMEQqwy3m+FRD?=
 =?windows-1251?Q?WWzK5RCwPx17nf+o4XknZXCI1V11zb7DtFoElQwm7kc87AeH35ZablBm?=
 =?windows-1251?Q?MfuacZsqiCrr0+eHZbgpZD9fEmJrq9Z5SWnlPVarcxMaooXN79lDp8wt?=
 =?windows-1251?Q?NA+Ds9bR8YjgojSMPcAMHtMLF6g1A/ICOxk4YFnSO2xA56hnDekqRsRn?=
 =?windows-1251?Q?Yg7eIm0yIXB+mcaJWrzZGFOoFgDhaS9dnSg4oJGx19CQyKRXse0uPMaV?=
 =?windows-1251?Q?ozwQkX+e3yG558Mo5vZwSSpcBad3eolEc5mRV1qT6cSHmMk12WMvwyk9?=
 =?windows-1251?Q?KSThbpJmpkCvu36Z?=
X-Forefront-Antispam-Report: CIP:58.26.8.158; CTRY:MY; LANG:en; SCL:9; SRV:;
 IPV:NLI; SFV:SPM; H:User; PTR:InfoDomainNonexistent; CAT:OSPM;
 SFS:(13230016)(396003)(39860400002)(136003)(346002)(376002)(40470700004)(316002)(956004)(83380400001)(336012)(40460700003)(36906005)(2860700004)(82310400005)(40480700001)(31686004)(31696002)(86362001)(2906002)(5660300002)(35950700001)(4744005)(7366002)(7416002)(8936002)(70206006)(70586007)(8676002)(82740400003)(156005)(7406005)(32650700002)(26005)(9686003)(498600001)(41300700001)(81166007)(109986005)(32850700003)(2700400008);
 DIR:OUT; SFP:1023; 
X-OriginatorOrg: myprasarana.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2022 20:29:53.3312 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7193722-5d7d-4a8c-db56-08da82eabd3c
X-MS-Exchange-CrossTenant-Id: 3cbb2ff2-27fb-4993-aecf-bf16995e64c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3cbb2ff2-27fb-4993-aecf-bf16995e64c0; Ip=[58.26.8.158];
 Helo=[mail.prasarana.com.my]
X-MS-Exchange-CrossTenant-AuthSource: TYZAPC01FT050.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR04MB6142
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
Reply-To: maihynoi290@gmail.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

<HTML><HEAD><TITLE></TITLE>
</HEAD>
<BODY bgcolor=#FFFFFF leftmargin=5 topmargin=5 rightmargin=5 bottommargin=5>
<FONT size=2 color=#000000 face="Arial">
<DIV>
&nbsp;</DIV>
<DIV>
Dear Beloved.</DIV>
<DIV>
 </DIV>
<DIV>
 </DIV>
<DIV>
With warm hearts I offer my friendship and my greetings</DIV>
<DIV>
&nbsp;</DIV>
<DIV>
I am sincerely seeking your confidence in this matter which I propose with my free mind and as a woman of integrity. My name is Mrs. Mai Hynoi , I’m from&nbsp; Vietnam. I am terminally ill and have decided to donate my inheritance I got from my late husband to you for a charity project in your town, When my late husband was alive, he deposited the sum of US383Million in my Bank. I have been diagnosed with acute cancer for about 2 years now.&nbsp; From all indications my condition is really deteriorating and my doctors have courageously advised me that I may not live all that long;&nbsp; this is because the cancer has reached a critical stage.</DIV>
<DIV>
 </DIV>
<DIV>
I shall be undergoing major operations in less than two weeks from now. If you are sure that you will use the donated fund as I have advised here,</DIV>
<DIV>
 </DIV>
<DIV>
Get back to me for more details.</DIV>
<DIV>
 </DIV>
<DIV>
Thanks and kind regards.</DIV>
<DIV>
 </DIV>
<DIV>
&nbsp;</DIV>
<DIV>
Mrs. Mai Hynoi</DIV>
</FONT>
</BODY></HTML>
