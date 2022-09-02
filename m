Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D25CA5AAF9D
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  2 Sep 2022 14:42:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44A4B10E828;
	Fri,  2 Sep 2022 12:42:03 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01rlhn2173.outbound.protection.outlook.com [40.95.54.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9721D10E828;
 Fri,  2 Sep 2022 12:41:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BSwySJOqft2cDPW46iT9pL8ulbzgkr8yGgp9dONqQW4s8L8AFTN6LNurSaSEXfuM0SwRZtDH6ScLjj5Kt4sKXh5Nz2tg9VDGZuXkZRo8IgOZueJbR7Px8szD5CB402slzOyc8W1aPuRF2laaQxMHYUwS9QMMK+S/NQC6A/1BpwvODEcFhtd2GmjoTg2jqLS3RphqT2jeyYAD4hvCh20chvXZd07R2Uj/3pGR1681uAE/ov4+ltNsIMjId9mukwBoEy1BW7yHTb9QsaFUiFgqqqIEFv2jQV/pB9bdsEdFjGtX0hwLxZiFB/BHJsUIe2C5SmxggxoJEm/1KBBiVUJ+ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xe5As//aov9wn/EwyYyV0dlS8qmOJN4dnyEi9gjpSKs=;
 b=hlAK+ycokfQnqnGISoQE+SLMKNxJZrsQ+JvO7olF3YKaH6n9LBVttsRxIvcBXw/om9CMx0yOBwkj7nbT7DyhOm07ODSIBaTi74kDAXmEKXCZ61KF/yHvKgobogWFwArKwLM9N+V13p4xVZv0CYlxc3ayOx/ONe/qqs3jfrRNkj9GwzZa8is5yLVCs4mTMHRx23REBN68ubbUIK5MyY+MB1wmk5EkDgyMOrzZh5puAzqv264k5S1AqVmir3Z2Z2pPnUUbmASs6Koct1jfcNJz1M24q6Mc9KgE5s97HoQPVjTy5pHUZA/HNTWQi7IsBsQ225/kFW4t+vFWpaxIsoFd1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 171.22.30.52) smtp.rcpttodomain=aol.com smtp.mailfrom=bright-ed.com;
 dmarc=none action=none header.from=bright-ed.com; dkim=none (message not
 signed); arc=none (0)
Received: from SG2PR02CA0085.apcprd02.prod.outlook.com (2603:1096:4:90::25) by
 SEZPR04MB6429.apcprd04.prod.outlook.com (2603:1096:101:a5::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.15; Fri, 2 Sep 2022 12:41:52 +0000
Received: from SG2APC01FT0017.eop-APC01.prod.protection.outlook.com
 (2603:1096:4:90:cafe::83) by SG2PR02CA0085.outlook.office365.com
 (2603:1096:4:90::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.14 via Frontend
 Transport; Fri, 2 Sep 2022 12:41:52 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 171.22.30.52)
 smtp.mailfrom=bright-ed.com;
 dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bright-ed.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 bright-ed.com discourages use of 171.22.30.52 as permitted sender)
Received: from mail.prasarana.com.my (58.26.8.159) by
 SG2APC01FT0017.mail.protection.outlook.com (10.13.36.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5588.10 via Frontend Transport; Fri, 2 Sep 2022 12:41:51 +0000
Received: from MRL-EXH-02.prasarana.com.my (10.128.66.101) by
 MRL-EXH-02.prasarana.com.my (10.128.66.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 2 Sep 2022 20:41:41 +0800
Received: from User (171.22.30.52) by MRL-EXH-02.prasarana.com.my
 (10.128.66.101) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Fri, 2 Sep 2022 20:41:21 +0800
From: Mrs.Beal Paulette <nawinda@bright-ed.com>
Subject: Re.YOUR FUNDS ARE READY
Date: Fri, 2 Sep 2022 05:41:39 -0700
MIME-Version: 1.0
Content-Type: text/html; charset="Windows-1251"
Content-Transfer-Encoding: 7bit
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook Express 6.00.2600.0000
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2600.0000
Message-ID: <c6268fa2-5aa0-49a8-8cd7-dbcfd42c6c79@MRL-EXH-02.prasarana.com.my>
To: Undisclosed recipients:;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[171.22.30.52];domain=User
X-MS-Exchange-ExternalOriginalInternetSender: ip=[171.22.30.52];domain=User
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d871e4a6-2738-4386-234f-08da8ce082b1
X-MS-TrafficTypeDiagnostic: SEZPR04MB6429:EE_
X-MS-Exchange-AtpMessageProperties: SA|SL
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?windows-1251?Q?B+EQDJLNFnINtb9Nood7hvRy57K/fnzlfcFRcncVVHm4YpXIWJldOhe0?=
 =?windows-1251?Q?DfBFAbFKs98Ju1sPl+XZEUEqqID6ocsF9PKf0QXtf2hVtpzQQzQ8ifx0?=
 =?windows-1251?Q?IM6s2tq6jdQR2FzezUi01PAvtIHuAOnQv+HiFEstgypdDhsxaiee2JBR?=
 =?windows-1251?Q?uGxnZq3fc2Wu35ocVmvCrJ5nKWkiM35Y+v5gjLpumbBddeEzfGaQNUmr?=
 =?windows-1251?Q?63NI46jwGxOCDwcjmp3UutBI3jBq/g1S2IliNvWy8pUq6qJWvNwyMC6j?=
 =?windows-1251?Q?0+amlk8asWDt7hkrT6ehOPo08QZnoTZAoz3kJZ8Iz+Hyp2vTbBhSb1P/?=
 =?windows-1251?Q?Yi+EtV5qI77eo7qX9eWKGJLBHQetRrk+lazqvgyaXFABO0F2CwFRy2Fy?=
 =?windows-1251?Q?RuSfwQizbm0/sHlg4BycjjFPhv+AJTu5am7FVvtJxxvwATlbVhS/6wCN?=
 =?windows-1251?Q?ZJlhr31RemkOp9nW1ChmJNkay1cRd/H/AM66ex14OwTBZ91PmTktFkHJ?=
 =?windows-1251?Q?tqvjbmg0qlRo8UAuQicwtTgVs7T9AI/sCZXOQP+AXQ0z/GHagcWTJ6zv?=
 =?windows-1251?Q?yfCam1lyKeCZ8o5tf10XyZaOwE33He3XqWxNC/XsuAp7hyKKZLuEXIrF?=
 =?windows-1251?Q?Zdr8XXucSVBRCOkzhlUVEWIPloyUCwLncRzTrXgh18f08+WKkARcDhRI?=
 =?windows-1251?Q?J+FUyPfG20GwTiOIvv9Mtl1C3k3gSBFiyNiBuY69j6IWGdHdgFK+v7vW?=
 =?windows-1251?Q?D8NBo475TGhD3aAGJra5wMk704qiJsvelSj2Pftrbfz8yTa1k4CE3bVl?=
 =?windows-1251?Q?i+dK3CbPCa7RGKsxPht2894Htneu603sYYUzI3J7LZvxGUvoXQnJQHc/?=
 =?windows-1251?Q?cgIPi1wWhopPTKd30xCgvHdKen20x+kNZi4ZgjxSmPRLu9o3mpyFB3F9?=
 =?windows-1251?Q?kG3zvAIFuQwvzjtMN5Tl0qa2JqZC3SjZOd4oBpv9nb1eXMZ0zeIQkKgV?=
 =?windows-1251?Q?rpmAx24XDLORmWDG1BmZrrVQRVdXW7XhoqleaS6K+wST2TtgU9MsWGCa?=
 =?windows-1251?Q?m4XlCs2WAcJX3NbpK1/9FWxjyMejGaHyzVmK+mxWIFBPGrFY5fotTDlC?=
 =?windows-1251?Q?OhWam1IdRMYmvUS3K4aYBfioqzYr4aym0R8zO2/+tRgngMWSpr/2nksy?=
 =?windows-1251?Q?6mCGhU0wdWZm0W6+QAaoQSiKaapFlB/2p1KYkpD5lmBLOPehk66Vb+4y?=
 =?windows-1251?Q?O+VRZMcQcSw+P7Z6OwapBTrLW2P/hfcZY7Evel6OjaDdsk7jGd9gpbA2?=
 =?windows-1251?Q?P2+lLsvR0aGHSNStiDQk/HPghyVAie/2Qnbc74rOzUNwf0sd?=
X-Forefront-Antispam-Report: CIP:58.26.8.159; CTRY:US; LANG:en; SCL:5; SRV:;
 IPV:NLI; SFV:SPM; H:User; PTR:InfoDomainNonexistent; CAT:OSPM;
 SFS:(13230016)(4636009)(376002)(346002)(136003)(39860400002)(396003)(40470700004)(8936002)(40480700001)(86362001)(7416002)(498600001)(26005)(41300700001)(9686003)(109986005)(6666004)(31696002)(82740400003)(82310400005)(7366002)(81166007)(32850700003)(7406005)(40460700003)(83380400001)(35950700001)(2906002)(3480700007)(156005)(31686004)(70586007)(956004)(336012)(5660300002)(8676002)(70206006)(36906005)(316002)(32650700002)(2700400008);
 DIR:OUT; SFP:1023; 
X-OriginatorOrg: myprasarana.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2022 12:41:51.8931 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d871e4a6-2738-4386-234f-08da8ce082b1
X-MS-Exchange-CrossTenant-Id: 3cbb2ff2-27fb-4993-aecf-bf16995e64c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3cbb2ff2-27fb-4993-aecf-bf16995e64c0; Ip=[58.26.8.159];
 Helo=[mail.prasarana.com.my]
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT0017.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB6429
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
Reply-To: fbipayment600@citromail.hu
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

<HTML><HEAD><TITLE></TITLE>
</HEAD>
<BODY bgcolor=#FFFFFF leftmargin=5 topmargin=5 rightmargin=5 bottommargin=5>
<FONT size=2 color=#000000 face="Arial">
<DIV>
Federal Bureau of Investigation (FBI)</DIV>
<DIV>
&nbsp;</DIV>
<DIV>
Anti-Terrorist and Monitory Crime Division.</DIV>
<DIV>
&nbsp;</DIV>
<DIV>
Federal Bureau of Investigation.</DIV>
<DIV>
&nbsp;</DIV>
<DIV>
J.Edgar.Hoover Building Washington Dc</DIV>
<DIV>
&nbsp;</DIV>
<DIV>
Customers Service Hours / Monday to Saturday</DIV>
<DIV>
&nbsp;</DIV>
<DIV>
Office Hours Monday to Saturday:</DIV>
<DIV>
&nbsp;</DIV>
<DIV>
Dear Beneficiary,</DIV>
<DIV>
&nbsp;</DIV>
<DIV>
&nbsp;</DIV>
<DIV>
A Series of meetings have been held over the past 7 months with the secretary general of the United Nations Organization. This ended 3 days ago. It is obvious that you have not received your funds which is to the tune of $22.5million due to past corrupt Government Officials who almost held the funds to themselves for their selfish reason and some individuals who have taken advantage of your funds all in an attempt to swindle your fundS which has led to so many losses from your end and unnecessary delay in the receipt of your funds.</DIV>
<DIV>
&nbsp;</DIV>
<DIV>
&nbsp;</DIV>
<DIV>
The United Nations and Federal Bureau of Investigation have successfully passed a mandate to the Prime Minister of Cambodia Excellency Hun Sen to boost the exercise of clearing all foreign debts owed to you and other individuals and organizations who have been found not to have receive their Contract Sum, Lottery/Gambling, Inheritance and Now how would you like to receive your payment? Because we have two methods of payment which is by Bank Cashier Cheque or by Atm Card?</DIV>
<DIV>
&nbsp;</DIV>
<DIV>
&nbsp;</DIV>
<DIV>
ATM CARD: We will be issuing you a customer pin number which you will use to withdraw up to $10,000 per day from any ATM machine that has the Master Card Logo on it and the card has to be renewed in 6 years time which is 2028. Also with the ATM card you will be able to transfer your funds to your local bank account. The ATM card comes with a handbook or manual to enlighten you about how to use it. Even if you do not have a bank account Cashier Cheque will be deposited in your bank for it to be cleared within three working days. Your payment would be sent to you via any of your preferred options and would be mailed to you via FedEx. Because we have signed a contract with FedEx which should expire by the end of September 2022 you will only need to pay $380 instead of $520 saving you $140 so if you</DIV>
<DIV>
&nbsp;</DIV>
<DIV>
&nbsp;</DIV>
<DIV>
Pay before the one week you save $140 note that any one asking you for some kind of money above the usual fee is definitely a fraudster and you will have to stop communication with every other person if you have been in contact with any. Also remember that all you will ever have to spend is $380.00 nothing more Nothing less And we guarantee the receipt of your fund to be successfully delivered to you within the next 24hrs after the receipt of payment has been confirmed.</DIV>
<DIV>
&nbsp;</DIV>
<DIV>
&nbsp;</DIV>
<DIV>
Note: Everything has been taken care of by the Government of Cambodia, The United Nation and also the FBI and including taxes, custom paper and clearance duty so all you will ever need to pay is $380.</DIV>
<DIV>
&nbsp;</DIV>
<DIV>
DO NOT SEND MONEY TO ANYONE UNTIL YOU READ THIS: The actual fees for shipping your ATM card is $520 but because FedEx have temporarily discontinued the C.O.D which gives you the chance to pay when package is delivered for international shipping We had to sign contract with them for bulk shipping which makes the fees reduce from the actual fee of $520 to $380 nothing more and no hidden fees of any sort! To effect the release of your fund valued at $22.5million you are advised to contact our correspondent in Cambodia the delivery officer</DIV>
<DIV>
&nbsp;</DIV>
<DIV>
You are advised to contact her with the informations as stated below:</DIV>
<DIV>
&nbsp;</DIV>
<DIV>
Mr.Dara Sun.</DIV>
<DIV>
&nbsp;</DIV>
<DIV>
With the information below,</DIV>
<DIV>
&nbsp;</DIV>
<DIV>
Email: fedexexpress2@citromail.hu</DIV>
<DIV>
&nbsp;</DIV>
<DIV>
Your full Name..</DIV>
<DIV>
&nbsp;</DIV>
<DIV>
Your Address:..............</DIV>
<DIV>
&nbsp;</DIV>
<DIV>
Home/Cell Phone:..............</DIV>
<DIV>
&nbsp;</DIV>
<DIV>
Preferred Payment Method ( ATM CARD / Cashier Cheque )</DIV>
<DIV>
&nbsp;</DIV>
<DIV>
&nbsp;</DIV>
<DIV>
Upon receipt of payment the delivery officer will ensure that your package is sent within 24 working hours. Because we are so sure of everything we are giving you a 100% money back guarantee if you do not receive payment/package within the next 24hrs after you have made the payment for shipping.</DIV>
<DIV>
&nbsp;</DIV>
<DIV>
Yours sincerely,</DIV>
<DIV>
&nbsp;</DIV>
<DIV>
Mrs.Beal Paulette</DIV>
<DIV>
&nbsp;</DIV>
<DIV>
FEDERAL BUREAU OF INVESTIGATION</DIV>
<DIV>
&nbsp;</DIV>
<DIV>
UNITED STATES DEPARTMENT OF JUSTICE</DIV>
<DIV>
&nbsp;</DIV>
<DIV>
WASHINGTON, D.C. 20535</DIV>
</FONT>
</BODY></HTML>
