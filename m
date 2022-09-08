Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 173AA5B2525
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  8 Sep 2022 19:50:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B258210EB81;
	Thu,  8 Sep 2022 17:49:57 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01rlhn2140.outbound.protection.outlook.com [40.95.53.140])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 238E910EB81;
 Thu,  8 Sep 2022 17:49:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PNhEm4cwdq1sBXuYcMRc7+qx0nAMltFG/mTt/5aUdM7JrvjcFsHyU9dyEmBpN8mtkwEV3iL201+cbEygBCxsRc8FU9pYMHYezecFvlTeXisu9OBrXELtoSkJfaH99RXj2g93aWLR27OPiGVYn6bWQzLkVOaGLnLl79hl0PquN3AmJ9E/NXeEOY9uTngVZ1DvoxfJaCIewhEsfjfGcOMJ/75aiA8YgE5FGzgz1uk0SSKLCwrQtMNDncWfyeKuya7Tr/sky0bhechRUJE83Kwm0NvOds/XLQk0un8aPs9sFXxPJpcccUMbJYk10N5pQetE1GceVBJctWrHcde7F1iJVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PHFB4N3dbae5IW5Y9I0CUbhWlizAkMMUpNz3fuxrC8U=;
 b=DoFqw7SGN9DtREJrUAMuIiQR2/mi+uUo+DVKbu00Mz8JrwESdGp4Z4/IEuRnYQQ6YoVs/HyPF1jusU/hgAayWy/NwmCrAJ/7IiuwQlO4XmGaEbJipOwbGy2KET+19yo0k0XTn6y3wzJXVrkWyt8jNBYly6CyxEzHjYnXo7BIh7M6Sb9EiCB2KpjpBwARlJOE+QhjjZy4ZA27eZXn0t+Bj2sAZl6zZAnmzchqRdkqXPwj6iAGT+rlfSznYIfd9N3bcBxA20651DZQEtRHzW5oR5w3Y3hXai6A+V2mrl5yYQYB7R8oHdaPuYJ0qQEOhJq2C05xyVwCs0LeS8RG0lx4zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=permerror (sender ip
 is 3.10.224.107) smtp.rcpttodomain=qdu.edu.cn
 smtp.mailfrom=id-press.eu; 
 dmarc=none action=none header.from=id-press.eu; dkim=none (message not
 signed); arc=none (0)
Received: from SG2P153CA0044.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::13) by
 HKAPR04MB3924.apcprd04.prod.outlook.com (2603:1096:203:d9::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.19; Thu, 8 Sep 2022 17:49:50 +0000
Received: from SG2APC01FT0042.eop-APC01.prod.protection.outlook.com
 (2603:1096:4:c6:cafe::79) by SG2P153CA0044.outlook.office365.com
 (2603:1096:4:c6::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.1 via Frontend
 Transport; Thu, 8 Sep 2022 17:49:50 +0000
X-MS-Exchange-Authentication-Results: spf=permerror (sender IP is
 3.10.224.107) smtp.mailfrom=id-press.eu; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=id-press.eu;
Received-SPF: PermError (protection.outlook.com: domain of id-press.eu used an
 invalid SPF mechanism)
Received: from mail.prasarana.com.my (58.26.8.159) by
 SG2APC01FT0042.mail.protection.outlook.com (10.13.36.217) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5612.13 via Frontend Transport; Thu, 8 Sep 2022 17:49:49 +0000
Received: from MRL-EXH-02.prasarana.com.my (10.128.66.101) by
 MRL-EXH-02.prasarana.com.my (10.128.66.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 9 Sep 2022 01:49:48 +0800
Received: from User (3.10.224.107) by MRL-EXH-02.prasarana.com.my
 (10.128.66.101) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Fri, 9 Sep 2022 01:49:38 +0800
From: "Shneor(Mrs.)" <igorspiroski@id-press.eu>
Subject: 9/7/2022
Date: Thu, 8 Sep 2022 17:49:47 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="Windows-1251"
Content-Transfer-Encoding: 7bit
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook Express 6.00.2600.0000
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2600.0000
Message-ID: <1c38871c-4d83-49ab-996e-51575eb1e457@MRL-EXH-02.prasarana.com.my>
To: Undisclosed recipients:;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[3.10.224.107];domain=User
X-MS-Exchange-ExternalOriginalInternetSender: ip=[3.10.224.107];domain=User
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2APC01FT0042:EE_|HKAPR04MB3924:EE_
X-MS-Office365-Filtering-Correlation-Id: 01277d16-29da-49e1-a13e-08da91c286b9
X-MS-Exchange-AtpMessageProperties: SA|SL
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?windows-1251?Q?wlsBSIFWtTOxFIZAiu26eus1jcijbJVu684pYgimvuQaxzkzaBO+SeN4?=
 =?windows-1251?Q?eDo4oh8RbiU2nRBaShO1V0bgGJ4bNlI12Cm99QVNpUNttMwesb3sPWJo?=
 =?windows-1251?Q?AYDjFzkjtF0l3xjNz2Uj7PHrrC50PaSh/xyfIsjMizw69JOEOQM7t5Lw?=
 =?windows-1251?Q?OiT12DMsajzp0ko7baysLd7+ud5MC5TYd5Mxbrwot+urtzx5M2iEfOyN?=
 =?windows-1251?Q?Q2Mwf8GOPHJZrdur8to/sVyikCOvtkfvzzNDJaEZwVvLQhFBcttir1jr?=
 =?windows-1251?Q?/VjDRdGuy1X5JTj01Vw3M5hEqsnJ/Jw+H9Sg9N35jhBRNJx6MIC+Npk9?=
 =?windows-1251?Q?qJR3rKM/DNlMrqkji+GMIiQhEiUQGyUixc9cM3ryMdU+a4jzxKcF7zyX?=
 =?windows-1251?Q?xF0a8m9t5MdJVq/VIJjtWQZBo7QuwDsMchQLiqUpfPrP42gCZLk9ZfYv?=
 =?windows-1251?Q?pO/JoleT2ptEsYsgOqryymX1eI8yGquulGeKcV6EML5h8e932oGRPcfO?=
 =?windows-1251?Q?ghhh/j7VtAxRSnw8K7wnqFlEkdFqApO8BIY5SN5m/iZnDXLhjYfltRgA?=
 =?windows-1251?Q?Kfm1CTOLUvLasV3sjJXl0O63jJa6YlB0dI8XJPZOreJo0ZWgKNv0JeXh?=
 =?windows-1251?Q?ViLIQRpD2A+EvhB6Gsc+fu0bVtNyu49WMWVJ35vnV9T0ri++8DMDqwgm?=
 =?windows-1251?Q?3pCAHubrSjyrQnTX5G1ijF1uJIEqfvx7F0HAhMkvTF6c92MXe8DhmQAR?=
 =?windows-1251?Q?hMEnCgX+vzXo5C3n/pUmsiuTe5oUuuRh1ULjuJU6vGezferDMBWQYG4B?=
 =?windows-1251?Q?KFVTYHNTb5lytlYesy9WwXndUgcP3zgmdXlrT6Ic+t0FC3IZ5JnXRXqn?=
 =?windows-1251?Q?sXzTDeFhB4Ter1TMGe4YWaYtxsAYY2hArKHPbq1BSITMAYyIwpnUvTJl?=
 =?windows-1251?Q?1QTlPGdNDmolek4XKRXl+DUDKIZQGaexfa3/dmLmXBdw4fXuhkxXkQ6B?=
 =?windows-1251?Q?j0wv4GLqAbugL622C+bbeLx/hZfG93v335HfnTL/MTIgNNMJUrF3+fbO?=
 =?windows-1251?Q?tFfAapDC2ZC5Mc7az06IMHiUPgE2+dcBVKKkXO3YUinQhxqZxx/J+Zqu?=
 =?windows-1251?Q?BuoIYaN/G7SQZMpdn0+aRBTWGM2Sm5WiG51IAV50Z8KsIYPLYQSpQsL6?=
 =?windows-1251?Q?GmxF/YRabfojcf/AROcfYhMNQInD6ZANJKCV0ZsmhxFhuogU1ivTTD8y?=
 =?windows-1251?Q?2QZCUq1PJo7+l2ByiPdbJGiF4qY/UZ/Cz1E2jRls0E/+lEeBOb0pPUGI?=
 =?windows-1251?Q?BZ633HPJIKZZZD7gJEETYDvCHOSMO9bAEddvct6RRT8l7gIU?=
X-Forefront-Antispam-Report: CIP:58.26.8.159; CTRY:GB; LANG:en; SCL:5; SRV:;
 IPV:NLI; SFV:SPM; H:User; PTR:ec2-3-10-224-107.eu-west-2.compute.amazonaws.com;
 CAT:OSPM;
 SFS:(13230016)(4636009)(346002)(136003)(39860400002)(376002)(396003)(40470700004)(46966006)(83380400001)(9686003)(47076005)(35950700001)(956004)(336012)(3480700007)(86362001)(81166007)(82740400003)(40460700003)(31696002)(82310400005)(32850700003)(156005)(109986005)(31686004)(316002)(36906005)(7406005)(7366002)(7416002)(498600001)(8676002)(70206006)(70586007)(26005)(2906002)(40480700001)(6666004)(5660300002)(41300700001)(8936002)(2700400008);
 DIR:OUT; SFP:1023; 
X-OriginatorOrg: myprasarana.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 17:49:49.5716 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01277d16-29da-49e1-a13e-08da91c286b9
X-MS-Exchange-CrossTenant-Id: 3cbb2ff2-27fb-4993-aecf-bf16995e64c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3cbb2ff2-27fb-4993-aecf-bf16995e64c0; Ip=[58.26.8.159];
 Helo=[mail.prasarana.com.my]
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT0042.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HKAPR04MB3924
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
Reply-To: ilanasoloshneor@daum.net
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

<HTML><HEAD><TITLE></TITLE>
</HEAD>
<BODY bgcolor=#FFFFFF leftmargin=5 topmargin=5 rightmargin=5 bottommargin=5>
<FONT size=2 color=#000000 face="Arial">
<DIV>
<FONT size=3><B>Hi Dear,</B></FONT></DIV>
<DIV>
<FONT size=3><B> </B></FONT></DIV>
<DIV>
<FONT size=3><B>&nbsp;</B></FONT></DIV>
<DIV>
<FONT size=3><B>My apology as I am contacting you through email; It is because it serves as the fastest and more convenient way to get to you, my name is Ilana Solomon Shneor a widow from Israel born in Austria. I understand we have not known each other before now, but my desire to invest in your country inspired me to contact you as I believe that our world is a global village where one can establish a good business and investment relationship before meeting each other physically.</B></FONT></DIV>
<DIV>
<FONT size=3><B> </B></FONT></DIV>
<DIV>
<FONT size=3><B>&nbsp;</B></FONT></DIV>
<DIV>
<FONT size=3><B> </B></FONT></DIV>
<DIV>
<FONT size=3><B>I have a proposition involving a fund transaction unfinished by my late Husband who died as the result of the Coronavirus disease (COVID-19). We planned to invest in the Dubai 2020 Expo before his death, due to my health condition I can’t handle the transaction. I solicit partnership with companies/individual business and NGO foundations that lost so much in the cause of the COVID-19 situation. My desire is to partner with profitable businesses.</B></FONT></DIV>
<DIV>
<FONT size=3><B> </B></FONT></DIV>
<DIV>
<FONT size=3><B>&nbsp;</B></FONT></DIV>
<DIV>
<FONT size=3><B> </B></FONT></DIV>
<DIV>
<FONT size=3><B>I will appreciate your reply for more details about me and the transaction on how we can proceed to move the fund to you by the security company under a contract. Please Respond to me on my private email: ilanasoloshneor@kakao.com</B></FONT></DIV>
<DIV>
<FONT size=3><B> </B></FONT></DIV>
<DIV>
<FONT size=3><B>&nbsp;</B></FONT></DIV>
<DIV>
<FONT size=3><B> </B></FONT></DIV>
<DIV>
<FONT size=3><B>Sincerely,</B></FONT></DIV>
<DIV>
<FONT size=3><B>Ilana Solomon Shneor(Mrs.)</B></FONT></DIV>
</FONT>
</BODY></HTML>
