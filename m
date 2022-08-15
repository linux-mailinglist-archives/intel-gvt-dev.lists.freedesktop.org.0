Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E615928E6
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 15 Aug 2022 07:03:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C60F810E14E;
	Mon, 15 Aug 2022 05:03:07 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01rlhn2140.outbound.protection.outlook.com [40.95.54.140])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38708112543;
 Mon, 15 Aug 2022 05:02:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RBHTAQzyMgRWqBQAohSQnyn4LtkiIcXKS6yAAkbdVuOgtGz+4A8ocGIg7Lc5IGO0/NYWRGqI9WbsAEUEty/+6bGL2DJdunJ+cOhPKgBWCihKJVWPpD+G/f2zanIgS7ErWmYdHVpXTvzKjeAhz7rRsyutehO7eKEY6iUGnxdkuvWITyW65aLLvVKR2asI5gv8r+Cs87Hjx0CsslbBQKxqoqnU7BA64srX4/uaLXnfl8yUyDFRMwSEmaPjG8q7vHYpaRbkIC7uo3IEKFcAovugAQpRmFak6qsANLLCkFymaU+l0IpeotBmgkkJnDBiqSCe3cwsyd97AlqqEjd2MOhUOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SW/klY+8ARoUCldAADS+fgGeS9R0IE7RgyYXd+dMKbI=;
 b=oWMMKUuNUTaDxK3pauwfc91sIP8UtUYx9Rv8+qEqJIWC2ZcKAVdqmNfmHhIg0IKDUMQC3nEvyymOWgdG04il8YqD6L47JqtdzidtwGCsZZYbw/G0COvn/LlSpgJbua1KwKMCowHHNi7lrjrHGs8KfOaSXkn/WGL6yMO9sdaWygscN/2pfefxzQosnlb35bFqCkFp13KQtj2fiV4fWp8zJjbSLQ/Q2vVO9KzfDlqZKU/6OoOAqi1U3s8OacXyc37f5VqrMuAARAsHsjF9xR5q490+FAASs4BqpKynUfvpAzCWZnkvdtrJp/01RgwsTnwNwoJJNrI1v6/tdRkZmwIPrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 18.221.4.235) smtp.rcpttodomain=cafedecolombia.com
 smtp.mailfrom=ameeco.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=ameeco.com; dkim=none (message not signed); arc=none (0)
Received: from TYBP286CA0027.JPNP286.PROD.OUTLOOK.COM (2603:1096:404:10a::15)
 by SG2PR04MB5461.apcprd04.prod.outlook.com (2603:1096:4:168::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.23; Mon, 15 Aug
 2022 05:02:45 +0000
Received: from TYZAPC01FT052.eop-APC01.prod.protection.outlook.com
 (2603:1096:404:10a:cafe::c1) by TYBP286CA0027.outlook.office365.com
 (2603:1096:404:10a::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10 via Frontend
 Transport; Mon, 15 Aug 2022 05:02:45 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 18.221.4.235)
 smtp.mailfrom=ameeco.com;
 dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=ameeco.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 ameeco.com discourages use of 18.221.4.235 as permitted sender)
Received: from mail.prasarana.com.my (58.26.8.158) by
 TYZAPC01FT052.mail.protection.outlook.com (10.118.152.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5525.11 via Frontend Transport; Mon, 15 Aug 2022 05:02:44 +0000
Received: from MRL-EXH-02.prasarana.com.my (10.128.66.101) by
 MRL-EXH-01.prasarana.com.my (10.128.66.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 15 Aug 2022 13:02:43 +0800
Received: from User (18.221.4.235) by MRL-EXH-02.prasarana.com.my
 (10.128.66.101) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Mon, 15 Aug 2022 13:02:27 +0800
From: "Mrs. Reem Al." <pere@ameeco.com>
Subject: 8/14/2022
Date: Mon, 15 Aug 2022 05:02:39 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="Windows-1251"
Content-Transfer-Encoding: 7bit
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook Express 6.00.2600.0000
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2600.0000
Message-ID: <e4a9f435-b2ad-43be-83d3-4c7785429d36@MRL-EXH-02.prasarana.com.my>
To: Undisclosed recipients:;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[18.221.4.235];domain=User
X-MS-Exchange-ExternalOriginalInternetSender: ip=[18.221.4.235];domain=User
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d8054ca-220e-4728-8b75-08da7e7b63c6
X-MS-TrafficTypeDiagnostic: SG2PR04MB5461:EE_
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?windows-1251?Q?1+Z05RXWI6kwieXVQz5iyBGWBxPGR1TKXJUWnpKx08l/R4+Xd0IdD8rv?=
 =?windows-1251?Q?xRIjBx326eq1+DoQH8mewnYu/VuqTLe+3nDY0BTkvHCIwh0yYeCB0Yo6?=
 =?windows-1251?Q?B6WgZftOPm1wdeP7mYyU04zftaiolGjP8A1SC1bxKU/DTmAdRmLxe+0d?=
 =?windows-1251?Q?D7dbIERQfbyTpcQ5XIiEOxwKmoCJHUihoIjBmATfUeElub3pPWkiJfZ6?=
 =?windows-1251?Q?hfG7xRgc+pUI9n4TitFN8di7JpPuI60ZvJiIKXn8qk54p+uGrC9+KUZj?=
 =?windows-1251?Q?f6c5JyT2hv1npNwN78sO5TDL48UjIHBMuV0bodSF2iXQJ8pgmC4PtFT6?=
 =?windows-1251?Q?Fku2wCkK/mn/0jVYe+33fJz3WtvsTBGrnLWKr9BjBP0jW63jUTnKquWP?=
 =?windows-1251?Q?IDqBZ/Q9jcqN3ZQNOQ4/QRr4nVpN96Zau6A5M6fgstEFrpiceG+i57Pa?=
 =?windows-1251?Q?UYK/9afqXfVkK9WBuyM8a5NZT53qXD8zBj964ppw2SyfDvd6i/LJGBEg?=
 =?windows-1251?Q?yCTI1+592loHBMArtLf0nZtnoER45tx1i7sm/3Mm0vvlz9YzugoyNGcM?=
 =?windows-1251?Q?XtIU5qLgvpFYNB1rMHI2GjCBzmeLCwtpkjcATWeoYTnepe7ehn580Jpz?=
 =?windows-1251?Q?rNNNWFMVOSkKDLVaRYa9ucumxbcFdoCntc6F7/T25ETjqvBzevesZ2bX?=
 =?windows-1251?Q?I8VZifEGaPZs8ULZUsn2Uurqr+6spd0I6XD6NwpJf/nJKupTXbAHIwDb?=
 =?windows-1251?Q?EYd4zjn+vsV/wYFDv0BjTtZSc2NaWKs1WRrohV/SIdjwsaJFjoLBp/n7?=
 =?windows-1251?Q?Vh7UNz2CGKpH/TEkSP7O3iHYfasntB+2LW0cEbGp6y7wmpD/l4ZogPmR?=
 =?windows-1251?Q?CeddFGnU4EX1Q4dxdMDwCwReRnjI852rSjTQzcFV+UUpP9M4z5K94ACh?=
 =?windows-1251?Q?8CwDzK8AA3WYAhW8Oyo1KtYqeFQ90lqC3zSFi/xw1iAtmv0MrV0GHspD?=
 =?windows-1251?Q?PhahaOA3B+kkNtc3gBj379ioFfLe/ZX8Y+qLF/tOucvZGW7RkYq46pJR?=
 =?windows-1251?Q?rUCY0RICwJ4lD9Th3nT/ytCU16kVepEDiwZj9KYsj1GOULfpZqcZmwe4?=
 =?windows-1251?Q?C1T835g5X3LGLyifFNX04hslVb5Z1QHpAqPkj67/0vfCmB6I36W0uQR9?=
 =?windows-1251?Q?3JShZ7GkTqAimLWEklq9Hz40kZIJt+mKMT3bWzL/W0YSrMzDWrr+8zzH?=
 =?windows-1251?Q?wwKjIlGoNzQbKtUKtnD/udRfkBCiby4XuL1i3uhhSxsBMKc0g0xCK1lj?=
 =?windows-1251?Q?Vp0+zhJJnCfMprFYpW6/TCojtuF/YyQI1NSYE/0+Tl3fvbrOlc/SkRgi?=
 =?windows-1251?Q?fAuUKQPmQfLfYWR57mWj3zP7y6yMdyRzZXqDhHJnE2mvfp0YyrYaAYz0?=
 =?windows-1251?Q?1G9602qS30dGyuP9UhOc/Lif0nkyuLfEQtYZOzhrrEcZ6Ig40DmHdHO3?=
 =?windows-1251?Q?gZw6Q5RFwIDDESkaqQ2HFa6GQIPIya2FQ+Cdu5jRGIoLEs25d5CKydFt?=
 =?windows-1251?Q?GI5f30WXnZHOh+Z+v+YYhwXeqrJEjpMukke7Bg=3D=3D?=
X-Forefront-Antispam-Report: CIP:58.26.8.158; CTRY:US; LANG:en; SCL:9; SRV:;
 IPV:NLI; SFV:SPM; H:User; PTR:ec2-18-221-4-235.us-east-2.compute.amazonaws.com;
 CAT:OSPM;
 SFS:(13230016)(39860400002)(346002)(376002)(396003)(136003)(40470700004)(70586007)(31686004)(8676002)(70206006)(31696002)(316002)(81166007)(8936002)(7406005)(498600001)(4744005)(5660300002)(7416002)(40460700003)(7366002)(36906005)(86362001)(109986005)(2906002)(82740400003)(6666004)(82310400005)(41300700001)(156005)(26005)(32850700003)(9686003)(3480700007)(32650700002)(336012)(35950700001)(956004)(40480700001)(2700400008);
 DIR:OUT; SFP:1023; 
X-OriginatorOrg: myprasarana.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 05:02:44.4661 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d8054ca-220e-4728-8b75-08da7e7b63c6
X-MS-Exchange-CrossTenant-Id: 3cbb2ff2-27fb-4993-aecf-bf16995e64c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3cbb2ff2-27fb-4993-aecf-bf16995e64c0; Ip=[58.26.8.158];
 Helo=[mail.prasarana.com.my]
X-MS-Exchange-CrossTenant-AuthSource: TYZAPC01FT052.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB5461
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
Reply-To: reemealhashimi@daum.net
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

<HTML><HEAD><TITLE></TITLE>
</HEAD>
<BODY bgcolor=#FFFFFF leftmargin=5 topmargin=5 rightmargin=5 bottommargin=5>
<FONT size=2 color=#000000 face="Arial">
<DIV>
<FONT size=3 face="Arial Black"><B>Hello,</B></FONT></DIV>
<DIV>
<FONT size=3 face="Arial Black"><B>&nbsp;</B></FONT></DIV>
<DIV>
<FONT size=3 face="Arial Black"><B>My name is Mrs. Reem E. Al-Hashimi, The Emirates Minister of State and Managing Director of the United Arab Emirates (Dubai) World Expo 2020/2021 Committee.</B></FONT></DIV>
<DIV>
<FONT size=3 face="Arial Black"><B> </B></FONT></DIV>
<DIV>
<FONT size=3 face="Arial Black"><B>I have a great business proposal to discuss with you, if you are interested in foreign investment/partnership please reply with your line of interest.</B></FONT></DIV>
<DIV>
<FONT size=3 face="Arial Black"><B>&nbsp;</B></FONT></DIV>
<DIV>
<FONT size=3 face="Arial Black"><B>PLEASE REPLY ME ON THIS EMAIL:&nbsp; reemealhashimi@daum.net</B></FONT></DIV>
<DIV>
<FONT size=3 face="Arial Black"><B>&nbsp;</B></FONT></DIV>
<DIV>
<FONT size=3 face="Arial Black"><B>Regards,</B></FONT></DIV>
<DIV>
<FONT size=3 face="Arial Black"><B>*Mrs. Reem*</B></FONT></DIV>
</FONT>
</BODY></HTML>
