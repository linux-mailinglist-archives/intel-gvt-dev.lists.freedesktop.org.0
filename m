Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D4E58A51E
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  5 Aug 2022 05:43:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 537FBAF254;
	Fri,  5 Aug 2022 03:43:40 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01rlhn2175.outbound.protection.outlook.com [40.95.110.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 205D918ACD7;
 Fri,  5 Aug 2022 03:43:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NSR4c45YvGemUPjv0LvtEIriD05e7jLcR2boFps6+czxVrKKPJUaz2ym9zryWh8gT6QdKUxqdIpx70mL5rNM6glUbzdjQ9B1kukOsPmoHSisIFMle5Xw02DAGI8d7VqDgt/lI2gizq273rc0Z38N4RFn/7QPmu21ZOO4KL2NsoXKrt8sHiBwKoegfwPnfb4JGtbjJWeZ1PIym1AW3h4LiKLbvy9DiBeH+k2vZ+TqmqFlJUhzHqKwHst6tfuHGI+uH/ggh6SqtKRFiVldvh7pxZ2ZYRYPgI0RAqKoSQyHkOcN+85Re6HeLbai2PzrjL3nZA0JvrDKY2pvWJ1OhWw6UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r9x+p64WL12qyDT97YwME7jx+tA7W5EpkiWzaBlXTvk=;
 b=BGAUNJIfD3XTx456Er+OBqhwKoKP9Ox8gL9iKz8my+8TXL+0OZ8NC+Z/fJRWOD6pXwKq44K2MZzq57iM15onVX77rsW0Xbczs7/Knmp6hOIaoVvcfEMvW0nMzGvJ4swJCOKFOOZk3hMgClw9mUr8isAM7zxWnUHTUC6q4N7yJwdoDEMU5rq18xcxICfvvRWUrePeZukRwB1ciY9o4jcy36zlQ0x+Hcvi93z8CKUfQR5AKgBfvg110l8rp239Zr+Aua1snUqU+KwUUh5+z34JVMdhBGRacIP02Gx5OddENu3bsOGLSA6egLz3SGYm3OEWrSj+/GR7OF4yw6Jtky8jWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 20.222.87.207) smtp.rcpttodomain=intel.com smtp.mailfrom=daum.net;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=daum.net;
 dkim=none (message not signed); arc=none (0)
Received: from TYCPR01CA0164.jpnprd01.prod.outlook.com (2603:1096:400:2b1::19)
 by TYZPR04MB4654.apcprd04.prod.outlook.com (2603:1096:400:59::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Fri, 5 Aug
 2022 03:43:13 +0000
Received: from TYZAPC01FT053.eop-APC01.prod.protection.outlook.com
 (2603:1096:400:2b1:cafe::b) by TYCPR01CA0164.outlook.office365.com
 (2603:1096:400:2b1::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14 via Frontend
 Transport; Fri, 5 Aug 2022 03:43:13 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 20.222.87.207) smtp.mailfrom=daum.net; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=daum.net;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 daum.net discourages use of 20.222.87.207 as permitted sender)
Received: from mail.prasarana.com.my (58.26.8.159) by
 TYZAPC01FT053.mail.protection.outlook.com (10.118.152.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5504.14 via Frontend Transport; Fri, 5 Aug 2022 03:43:12 +0000
Received: from MRL-EXH-02.prasarana.com.my (10.128.66.101) by
 MRL-EXH-02.prasarana.com.my (10.128.66.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 5 Aug 2022 11:43:12 +0800
Received: from User (20.222.87.207) by MRL-EXH-02.prasarana.com.my
 (10.128.66.101) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Fri, 5 Aug 2022 11:43:07 +0800
From: Reem <reem2018@daum.net>
Subject: Did you receive my last mail? I contacted you for an investment in
 your country.
Date: Fri, 5 Aug 2022 03:43:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="Windows-1251"
Content-Transfer-Encoding: 7bit
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook Express 6.00.2600.0000
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2600.0000
Message-ID: <0a98edae-63b6-40e5-83ab-d114c7474818@MRL-EXH-02.prasarana.com.my>
To: Undisclosed recipients:;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[20.222.87.207];domain=User
X-MS-Exchange-ExternalOriginalInternetSender: ip=[20.222.87.207];domain=User
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 78eea943-e222-4519-9d79-08da76949f94
X-MS-TrafficTypeDiagnostic: TYZPR04MB4654:EE_
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?windows-1251?Q?HWaEQU10MHm42cn3XkHpajkNzzs/xxJmfPjb9XaT4WbdAu61uq+dZDIt?=
 =?windows-1251?Q?8kJ5yD7sGNjPPKcmoV6unkd7rwcMLEAfuEXIk0MhWQirJwY7vZNtiKoP?=
 =?windows-1251?Q?nldsksLYaNTSddfhsQieqOJZfZllLHcBSAl5AdFan10Dg3fy0sBPq0hj?=
 =?windows-1251?Q?s9JnAXEaYaHQS5uZD7fUOeoiBVbS3sS0h7+TwkEc4v4kwx6EhFFnu1yL?=
 =?windows-1251?Q?udjfENYwaBsL1xqEGJWhKonq+lcfe+e9ZQCpnbAZVjalaI6GOSNr7OKy?=
 =?windows-1251?Q?tMcV2pmmzSIsMkeIHJOZmc8YzqHvL0rvY+9Mkr7jTUytgcF9zdDXsxj6?=
 =?windows-1251?Q?HHOw/IKtaLd1vZnjlx+pjJ+Yx6QvEFZSe/dvg5kfjoIfaNIE2HgUgemT?=
 =?windows-1251?Q?g7BKpQuJ9sESJzzbG/9o7Yir6hDY5D2hMDO5hf7CRppWh1Tlqv/FV/q0?=
 =?windows-1251?Q?9Of0PIagGksBj8IWGJsqUaVoJZ/fo1yzVZm9x1N9kepzarbmgIc+wWb5?=
 =?windows-1251?Q?fALjG3r5t7vQcrq2omk1vF+pX3kigkAOsceuEiDvH7a7smS5sHGSG+iK?=
 =?windows-1251?Q?P2oIaHIByfy1zFbX85Us/ulZHPSfz40m3b0Smbko+v9JSEWTaVi1lfwn?=
 =?windows-1251?Q?4EfdYXg72OqkFNCnqjF83isOfT2t9Z5bBkT7/3l+nlu0ZYHWsEbXOpBo?=
 =?windows-1251?Q?uloHL56Js9D6ihtCfmeG7HfcOgkBXPr5B3kP80aguMaYKpGRq6i3U+73?=
 =?windows-1251?Q?cEMCOOXRlRITxZpsoubx8OP2b2psstFaJHB6MhHJfUi+wlwkTdte5C1n?=
 =?windows-1251?Q?RLbSf7YdJj8cYPjLUfR0hWBu40/0Gn7Ub8qmdb9Mcyq0n3qVPGgXsuM9?=
 =?windows-1251?Q?JpnZbGKrtyp8t5tc7sF8rn3M1FdMNHk6833TDXo1lh6ys7CdV+IfW86T?=
 =?windows-1251?Q?Fl1SSeYDxcQcmgPbRmr09LaxgVlcVKx0C7ZhG1WVML3uRkik+nW9b/fk?=
 =?windows-1251?Q?4CnEQqKlkPP3Y20fo3EqKt6zI9fNNdcSS/wCVg1MKucDGYsGdhOGUynr?=
 =?windows-1251?Q?uP7NPK+DwELtSqoFj+wOcaXi54OBadG8UbRAUsP6zHxd68Q0K10CqDJm?=
 =?windows-1251?Q?akfFBcHeo2I3YmPPO8x4jkk/LeK9rqPfrqSnJmBzTvBT9r149oTzJ1oT?=
 =?windows-1251?Q?AIncUOWpbFKnIeZy9PyGN8+ygHuxGOjPf5SQpbXWILMMMDLaKnSR9Zz7?=
 =?windows-1251?Q?Vzfn3JVYmCu+25Um4D9ZW3Fq6BTJelVWMvQ2MpDKTUj47QAVv/isNJzP?=
 =?windows-1251?Q?aT3dzL87TtF3fjfSIxHQ1tPWZq3RffJteQKhmiWYdzR/V3RgHbwisSok?=
 =?windows-1251?Q?AfzQ22v/AOsBuns4ezlg051P0H2EDrdgjMo7oW+BGqJv54SRtBwHuJU1?=
 =?windows-1251?Q?Qu9UqLxUUWHYPLijA6dzZGNoGldVnFT0dhnyM17H/LeG9EdldJMy8+Kt?=
 =?windows-1251?Q?c7mlr85H?=
X-Forefront-Antispam-Report: CIP:58.26.8.159; CTRY:JP; LANG:en; SCL:9; SRV:;
 IPV:NLI; SFV:SPM; H:User; PTR:InfoDomainNonexistent; CAT:OSPM;
 SFS:(13230016)(376002)(136003)(346002)(396003)(39860400002)(40470700004)(956004)(336012)(109986005)(81166007)(82740400003)(156005)(32650700002)(35950700001)(32850700003)(40460700003)(8936002)(70206006)(70586007)(8676002)(82310400005)(5660300002)(40480700001)(7366002)(7416002)(2906002)(7406005)(6666004)(498600001)(41300700001)(9686003)(26005)(2860700004)(316002)(36906005)(558084003)(31686004)(31696002)(86362001)(2700400008);
 DIR:OUT; SFP:1023; 
X-OriginatorOrg: myprasarana.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2022 03:43:12.8089 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78eea943-e222-4519-9d79-08da76949f94
X-MS-Exchange-CrossTenant-Id: 3cbb2ff2-27fb-4993-aecf-bf16995e64c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3cbb2ff2-27fb-4993-aecf-bf16995e64c0; Ip=[58.26.8.159];
 Helo=[mail.prasarana.com.my]
X-MS-Exchange-CrossTenant-AuthSource: TYZAPC01FT053.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB4654
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
Reply-To: reem.alhashimi@yandex.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Reem B. Al Hashimi
PO Box 899
AbuDhabi, United Arab Emirates
