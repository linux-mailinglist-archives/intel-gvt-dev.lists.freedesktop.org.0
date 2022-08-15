Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C54F59334A
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 15 Aug 2022 18:32:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80FBACE03C;
	Mon, 15 Aug 2022 16:32:39 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01hn2243.outbound.protection.outlook.com [52.100.0.243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8084CCDFE0;
 Mon, 15 Aug 2022 16:32:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E+6Bhn5F/gnIF3Pqpbc5j2VmOuucYboSsvMLS5FD+8OqqR8Nv3BwapU6y470VEKV/DJHn2T9urVjGDJmbht20OAZl8AwoVeHPGdOTxEW5V/94ydLLTM/KKq5j8k54P4mek+hsLo3IsorFnltZZsP/N53BlRkUmSr+kyBr0ulnbYe2RKdVQsWCfUgAfy2FwLCFtlIQZHvbLaOVriUuhNVo9bR2bo6EHFJj7Uu3emUYN/7G+yuOE6rXnXztxt1KacK06Br+qmDFTgnBKeLQElJXLBxyPFttnNI2Rqak5pBknLi49imBnsP2OCrIZsDYpWBU2+nwvjEoWpXXMOsXNFQ7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4msfIOxQ1crv5MRswH2o3Ys3WmG66EQY49NzE9fa/Sw=;
 b=QkfoeedqXtutRFguH24IaHvB02aHkbxq3e9uejRi29t+L9K1295xRK9kzMCIFmcBP/o7eekdb800SI1j+fzq2fa8dgzDJJpwdO3H7VTwSvTtwe42y7NODzCY7F59rbF6vXTAmRZrwJEdEUntCgQRrJdrVYayRSpRje84Inb2ITxgS1H4e+z3Te84rWlUB1V2y1m1gOmGIGBYnV3kO+X6hOAzK2Zb/Y+ITkCcxLCT17tlziWaPjF3VVXwSm62lJ1FfbcIwrhmExcZRAZb5Sh4LNngrUMZvG6IlUgvwwjuAH3jwVE40uDmL/X6n1KXC0SOE264hNR2dvvuRoSBPXMGqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 34.130.58.223) smtp.rcpttodomain=ech.co.jp smtp.mailfrom=t4.cims.jp;
 dmarc=bestguesspass action=none header.from=t4.cims.jp; dkim=none (message
 not signed); arc=none (0)
Received: from SG2PR02CA0103.apcprd02.prod.outlook.com (2603:1096:4:92::19) by
 SI2PR04MB4959.apcprd04.prod.outlook.com (2603:1096:4:14b::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5525.10; Mon, 15 Aug 2022 16:32:22 +0000
Received: from SG2APC01FT0050.eop-APC01.prod.protection.outlook.com
 (2603:1096:4:92:cafe::cf) by SG2PR02CA0103.outlook.office365.com
 (2603:1096:4:92::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.19 via Frontend
 Transport; Mon, 15 Aug 2022 16:32:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 34.130.58.223)
 smtp.mailfrom=t4.cims.jp; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=t4.cims.jp;
Received-SPF: Pass (protection.outlook.com: domain of t4.cims.jp designates
 34.130.58.223 as permitted sender) receiver=protection.outlook.com;
 client-ip=34.130.58.223; helo=User; pr=M
Received: from mail.prasarana.com.my (58.26.8.158) by
 SG2APC01FT0050.mail.protection.outlook.com (10.13.36.165) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5525.11 via Frontend Transport; Mon, 15 Aug 2022 16:32:22 +0000
Received: from MRL-EXH-02.prasarana.com.my (10.128.66.101) by
 MRL-EXH-01.prasarana.com.my (10.128.66.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 16 Aug 2022 00:32:20 +0800
Received: from User (34.130.58.223) by MRL-EXH-02.prasarana.com.my
 (10.128.66.101) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Tue, 16 Aug 2022 00:32:08 +0800
From: Al-Hashimi <gallaxy@t4.cims.jp>
Subject: Re:Hello
Date: Mon, 15 Aug 2022 16:32:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="Windows-1251"
Content-Transfer-Encoding: 7bit
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook Express 6.00.2600.0000
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2600.0000
Message-ID: <29e17574-38fb-4cc9-a2e6-90545ab758cf@MRL-EXH-02.prasarana.com.my>
To: Undisclosed recipients:;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[34.130.58.223];domain=User
X-MS-Exchange-ExternalOriginalInternetSender: ip=[34.130.58.223];domain=User
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 743b2042-c932-44cb-efe9-08da7edbbad7
X-MS-TrafficTypeDiagnostic: SI2PR04MB4959:EE_
X-MS-Exchange-SenderADCheck: 0
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?windows-1251?Q?dsstaxyz/1Bg5fPyVXUrdv+GwPVrJfDL+z/Jpj8wHlxgZSaUBmHJCYLB?=
 =?windows-1251?Q?moPeAj6nO+Hc3o1d3HXzD9zQWHeUZSWnn+mlFHiPhNpSzB1DIHR+JH8q?=
 =?windows-1251?Q?hNj3L+ZlEX/j2r6afKd1Mu6lk0GUjsDx6FW9LY4siK270uJFywHjbTiz?=
 =?windows-1251?Q?//OdRtVeJNGxpIisEQHt9O+eL7oLwcGhUoXblYWEi0jqMfZ9AmJsrfCw?=
 =?windows-1251?Q?SvbUJjJc4qy+9jpsjYZbMayOL39hSSAV3csMlltVkNLEZiWnF3rBZTGh?=
 =?windows-1251?Q?gzOcOKprCkM2NrhEMrqA4y7+m1nNL+nZRFKBRcp16Ga2RXsH2SBXP8cS?=
 =?windows-1251?Q?r9j392c8WcGIxrK9Ofxf8Xt0sbhkCjmFvJkD7t1vaufW8IIDmoV+6u0s?=
 =?windows-1251?Q?Ay1A/idsXH4sKRDTgFF07Kf5t26a5/JY+B6TKADgASpUkg7WgVADe6qS?=
 =?windows-1251?Q?H7RSZ3TxlXm8bvSlFsgsBVpG5KGG6hBKMTEDFSNRuj+UdVlkRAQGoCk7?=
 =?windows-1251?Q?Grgn1xhFUpXn+uBzSwP6AxnA1U0wpkejB/3JDwNWPK9Kyrujaab7GDLx?=
 =?windows-1251?Q?J3NGjI6pJOWfZSYaEwN2JuaxKSacXbrcvt3G59RFk2Qt+YQ7nmaReO4G?=
 =?windows-1251?Q?PHaK7EJFjyT/KIk9JXwpLyHdYg7JRwjG1C+eyQZivh2TZhbL+I54MW6E?=
 =?windows-1251?Q?3lZlGEQXeJ+h7taqpets559J2ney7c9ixkbw1CfW2sPa+yEzZb51NVbC?=
 =?windows-1251?Q?ScW+037rl+YY+gQswgOERd/ctfMRe3QyMIR8BJiUV/1Mhj/Ecme9o1H7?=
 =?windows-1251?Q?KvY9ihNM9o2VCvXYk6SKew7aCaDHSPsYunKeBhtkOVDt1dP81Jd8ZOR8?=
 =?windows-1251?Q?lS7FRDFd5S2vKHzKbtEC3WQLbsOm3w2cnqkQpUEf2dmxcPJHmOhMsOsG?=
 =?windows-1251?Q?i4BZkK945UfexADEGGJHwbkuFzlu0bTWobUuaBfmO8BZUE2yUCs8WaKa?=
 =?windows-1251?Q?/CHIRlBILTCxADLsINYthrHXTMa7YbBgHgp6KCx0IF+u2owBRv2Y0oNZ?=
 =?windows-1251?Q?Y3mqc4GGJC5AKZdQPO7UkzZUZq+YsBAUHZcEknysiS8uXyMOWeHYRWNj?=
 =?windows-1251?Q?DvykzkFULdMJBwXyx0+d/nnsJ7Uq5eEKjHB7Rn/J8GBc0YrVyd/5+K7W?=
 =?windows-1251?Q?eCAfz363y37yYo+Ig4zziBOuNbmWDJP7RPR6eGfTLVw9Yy6QQfjVJ/Ce?=
 =?windows-1251?Q?DLkTIkBEyWGd/sILS2EsrUGfLdzEtzWQ6dYuxosgUNIlTWrasI5EBI6V?=
 =?windows-1251?Q?a0U7kYxfaqD4EvZENfr6GSd/I4tqpoTO5LprWg0zet3yNlSEpE9Ym2IH?=
 =?windows-1251?Q?tGrYTVUU3evb2n9mpvUYPWqHwcmxhpFtg+k=3D?=
X-Forefront-Antispam-Report: CIP:58.26.8.158; CTRY:CA; LANG:en; SCL:5; SRV:;
 IPV:NLI; SFV:SPM; H:User; PTR:223.58.130.34.bc.googleusercontent.com; CAT:OSPM;
 SFS:(13230016)(396003)(346002)(376002)(136003)(39860400002)(40470700004)(7116003)(5660300002)(70586007)(82310400005)(8676002)(40480700001)(7406005)(38500700001)(7416002)(8936002)(82740400003)(36906005)(40460700003)(70206006)(2906002)(316002)(7366002)(32850700003)(9686003)(86362001)(81166007)(26005)(6666004)(156005)(31696002)(41300700001)(498600001)(83380400001)(3480700007)(32650700002)(35950700001)(336012)(956004)(31686004)(109986005)(2700400008);
 DIR:OUT; SFP:1501; 
X-OriginatorOrg: myprasarana.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 16:32:22.3372 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 743b2042-c932-44cb-efe9-08da7edbbad7
X-MS-Exchange-CrossTenant-Id: 3cbb2ff2-27fb-4993-aecf-bf16995e64c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3cbb2ff2-27fb-4993-aecf-bf16995e64c0; Ip=[58.26.8.158];
 Helo=[mail.prasarana.com.my]
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT0050.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR04MB4959
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
Reply-To: hashimirrr22@kakao.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Hello,
 
My name is Reem E. Al-Hashimi, the Emirates Minister of State and Managing Director of the United Arab Emirates (Dubai) World Expo 2020/2021 Committee. I am writing to you to stand as my partner to receive my share of gratification from foreign companies whom I helped during the bidding exercise towards the Dubai World Expo 2020/2021 Committee.
 
I"m serving as a Minister. I have a limit to my personal income and investment level, I cannot receive such a huge sum back to my country or my personal account. I reached with the foreign companies to direct the gratifications to an open beneficiary account with a financial institution where it will be possible for me to instruct further transfer of the fund to a third party account.
 
The amount is valued at $ 47,745,533.00 with a financial institution waiting my instruction for further transfer to a destination account as soon as I have your information indicating interest and I will compensate you with 30% of the total amount and you will also get benefit from the investment.
 
If you can handle the fund in a good investment.PLEASE REPLY ME ON THIS EMAIL: rrrhashimi2022@kakao.com
Regards,
Reem
