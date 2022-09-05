Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6017C5AD96B
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  5 Sep 2022 21:11:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE9E310E4BE;
	Mon,  5 Sep 2022 19:11:17 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01rlhn2174.outbound.protection.outlook.com [40.95.54.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21AF910E4BE;
 Mon,  5 Sep 2022 19:11:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oW5Vb+pp0G0whD9Ulu0xeS9F6grJWvjSHHWBULCZEUGOBCF4FNDF2QLUG06aqQ0l8rnI74ZYvV7I8ROWGiZ29huHbnnv9DEf0h4M2cea8miQs87FSwFIAyJit9dsDXj+w20d99Ub5EtYWSiH4n298peTvyq7q5f8kjP5erZ4678ZhN6rF/rNvV0As27IfkAIJvH0vrZ5hp5OLaK4l/mDfw5Ahv1g7Xnkf5yOv8NGlrS/M6gYUzcLcsL2dIGZGP1Hi75zaY2FH1O4z071K+trBwZSWcOvxaARg/gfgXFLdro+wqVqG6MFvereHHF8n12Y/o25Bf5zP4yYO5XXcp1mfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eBzyR9jsS/fhNUTYHSyzRpX9kdr76jFCkEqdl4BfiDM=;
 b=PFjiWYsF9K/lccJ+QLNbCKleOP17vGUySb8j7yGyzBpkXq/53UBkNTIszEsaUoQLCE1jvipRzyZKUVSLHi+x7g4ptnvQGd8HJ7oF7ndYJtUTXJg8Y3VzQKtCzNOdn72EG2etWXBXMf7jfRts79ht5r6mQUvikYy+9ZygAxh3s3FTklh7oxCtmvnxTQjJ3lpLBCxL3SgvuJR/BQTxEjSTn9rFguU14OeGtgw4nFWxhy4q8iJgqeiwP7Fh7k5NdYGDZo2MB9HU/rJFn3vbPOCJGWOCgj7NcSD7xj20PUc4kbJggC4Cemgvc6IHKH7aqC+2QQ11iML0aGFZIgmUgqYjfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 171.22.30.52) smtp.rcpttodomain=sce.nato.int smtp.mailfrom=bright-ed.com;
 dmarc=none action=none header.from=bright-ed.com; dkim=none (message not
 signed); arc=none (0)
Received: from SL2PR01CA0001.apcprd01.prod.exchangelabs.com
 (2603:1096:100:41::13) by PUZPR04MB6168.apcprd04.prod.outlook.com
 (2603:1096:301:ee::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Mon, 5 Sep
 2022 19:11:08 +0000
Received: from PSAAPC01FT030.eop-APC01.prod.protection.outlook.com
 (2603:1096:100:41:cafe::43) by SL2PR01CA0001.outlook.office365.com
 (2603:1096:100:41::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18 via Frontend
 Transport; Mon, 5 Sep 2022 19:11:08 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 171.22.30.52)
 smtp.mailfrom=bright-ed.com;
 dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bright-ed.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 bright-ed.com discourages use of 171.22.30.52 as permitted sender)
Received: from mail.prasarana.com.my (58.26.8.159) by
 PSAAPC01FT030.mail.protection.outlook.com (10.13.39.119) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5588.10 via Frontend Transport; Mon, 5 Sep 2022 19:11:08 +0000
Received: from MRL-EXH-02.prasarana.com.my (10.128.66.101) by
 MRL-EXH-02.prasarana.com.my (10.128.66.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 6 Sep 2022 03:10:40 +0800
Received: from User (171.22.30.52) by MRL-EXH-02.prasarana.com.my
 (10.128.66.101) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Tue, 6 Sep 2022 03:10:26 +0800
From: Mrs.Beal Paulette <nawinda@bright-ed.com>
Subject: Re.Your funds are ready.
Date: Mon, 5 Sep 2022 12:10:40 -0700
MIME-Version: 1.0
Content-Type: text/html; charset="Windows-1251"
Content-Transfer-Encoding: 7bit
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook Express 6.00.2600.0000
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2600.0000
Message-ID: <4303da9f-3d2e-43e7-8298-abaadc8fdfa9@MRL-EXH-02.prasarana.com.my>
To: Undisclosed recipients:;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[171.22.30.52];domain=User
X-MS-Exchange-ExternalOriginalInternetSender: ip=[171.22.30.52];domain=User
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ef857c6-c737-4c4b-d72f-08da8f7263a1
X-MS-TrafficTypeDiagnostic: PUZPR04MB6168:EE_
X-MS-Exchange-AtpMessageProperties: SA|SL
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?windows-1251?Q?f9ESrDAlhCoH+5T6DOg/1/JGUNn2arXIGgY/8Ygi7rjEhbwq4QaMl6hn?=
 =?windows-1251?Q?OV97xHBtrr1MlQeH09KDFUxdUFH1LJSwmUu25t19BVvPsAORrau1DA4n?=
 =?windows-1251?Q?XWboODInpZpvzp3R5agblJreGW3YnPIMHYoQ1GjQ0vSAukceI22VnK4U?=
 =?windows-1251?Q?V8PRMCnlqZ8vkoNztfC62ziecPBpqdaJy+z2pJcUN+qgN3KsghzlBRZj?=
 =?windows-1251?Q?YxdVqyzNYmKGRGsc5DN86Sy/YfXHvxC+1Y2wC+uUbpplstsU95CHIgB2?=
 =?windows-1251?Q?MbakCx0NbhaJj6AzkIRTzykpSCHVMG06IL58ydA/LYJSvGHLgevffhfN?=
 =?windows-1251?Q?LSeiqKT/hNRPxt2f1DvmP3ias6eS2hBt5yScBCUTd9AQJXX8VFQj9bqu?=
 =?windows-1251?Q?wRKIylP8shy2la0zo8icBvGmMj+beNT8V4vJPHE3oD+Ce1w40NJOZ3h+?=
 =?windows-1251?Q?Vn31+Hip3fgWOZaeNcL3V1kfanJ1k7F2EF5lWlp4x8Hb/qpuUz90jLpV?=
 =?windows-1251?Q?WqWHJvekYN3emPljFAcfXtUVZuqIrdMhG/X6KZh6rnH5thrkKI1ilfzY?=
 =?windows-1251?Q?iJ0uR4RioYGKl8PcEuGx2F0INskhv1KY5QlxD3dMERuD1BmrJgHa5RoY?=
 =?windows-1251?Q?/gexxEvPzhOaKps9PVY/XXCvdHQynfuidUXNZg32cz6wsEzEx3J970MS?=
 =?windows-1251?Q?3QHbyUUYnOWVzaEl3orZ4+dGoMYHl/G2Q1CoHsRE2DRO+nEO/Hca46po?=
 =?windows-1251?Q?2/6p8K6Sni3cE2JqrZ0pzJnrncS6cgfkoKAXvVMly/eXOgT5ecZwl2w/?=
 =?windows-1251?Q?jdWID1R1ARan0IAs4evQXEcqtJ6pw0De96zEymcEd7bUGK89EaGTM52I?=
 =?windows-1251?Q?0WT1YiF5FrEiGf9Bqf10Ha2YheEg3NXfFsStLG+cXlhpWWwoDmWZTgxw?=
 =?windows-1251?Q?v0cgRsQRTqr/20jZIDqSSovU+EnQrcFr5TXRuk1lzipG6MoXb9gmXTUA?=
 =?windows-1251?Q?7QS0/8Pfjx8YvKlMuWl2ovLm9FyzZf+8Mmb5gTWW2zg7QjgFEPLQVEmv?=
 =?windows-1251?Q?JwZQP33GZRqhES1htbPqjE3ARrnPTmpjLKR56oqu/p+DV1WcwH98M3g1?=
 =?windows-1251?Q?bfeQ4b2zFlU2oHWssQRQ+ELRL+3edbGQ3WKXHQQOl19iaoq6qTdY14AZ?=
 =?windows-1251?Q?4I9yg8xavbHMK1SergWLE5mZpw/43v+U9uhMfxI9epBqq16gsxjoVi1M?=
 =?windows-1251?Q?p/ZbrDc4mRGtXPEe21aQW8S/W06HFuy7NH+QL5pwZLSztBRjJWiYSgkb?=
 =?windows-1251?Q?+Ev7gDR5g9tPlp4AHAyxq6Ap22/yXHR9AFoXl859Ot2TemHS?=
X-Forefront-Antispam-Report: CIP:58.26.8.159; CTRY:US; LANG:en; SCL:5; SRV:;
 IPV:NLI; SFV:SPM; H:User; PTR:InfoDomainNonexistent; CAT:OSPM;
 SFS:(13230016)(4636009)(39860400002)(376002)(396003)(346002)(136003)(40470700004)(956004)(336012)(81166007)(6666004)(109986005)(5660300002)(8936002)(83380400001)(70206006)(41300700001)(70586007)(7366002)(8676002)(7416002)(7406005)(498600001)(31686004)(40460700003)(31696002)(82310400005)(156005)(26005)(35950700001)(82740400003)(3480700007)(9686003)(2906002)(316002)(32650700002)(36906005)(40480700001)(32850700003)(86362001)(2700400008);
 DIR:OUT; SFP:1023; 
X-OriginatorOrg: myprasarana.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 19:11:08.5378 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ef857c6-c737-4c4b-d72f-08da8f7263a1
X-MS-Exchange-CrossTenant-Id: 3cbb2ff2-27fb-4993-aecf-bf16995e64c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3cbb2ff2-27fb-4993-aecf-bf16995e64c0; Ip=[58.26.8.159];
 Helo=[mail.prasarana.com.my]
X-MS-Exchange-CrossTenant-AuthSource: PSAAPC01FT030.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR04MB6168
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
ATM CARD: We will be issuing you a customer pin number which you will use to withdraw up to $10,000 per day from any ATM machine that has the Master Card Logo on it and the card has to be renewed in 6 years time which is 2028. Also with the ATM card you will be able to transfer your funds to your local bank account. The ATM card comes with a handbook or manual to enlighten you about how to use it. Even if you do not have a bank account Cashier Cheque will be deposited in your bank for it to be cleared within three working days. Your payment would be sent to you via any of your preferred options and would be mailed to you via FedEx. Because we have signed a contract with FedEx which should expire by the end of&nbsp; September 2022 you will only need to pay $380 instead of $520 saving you $140 so if you</DIV>
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
