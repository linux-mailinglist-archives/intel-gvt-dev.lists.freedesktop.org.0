Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A9D91EC8A
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  2 Jul 2024 03:17:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 319F810E004;
	Tue,  2 Jul 2024 01:17:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=healthnow.org header.i=@healthnow.org header.b="SdWxFBIC";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11hn2233.outbound.protection.outlook.com [52.100.171.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9F0610E004
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  2 Jul 2024 01:17:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HZMqYAIzTGbhIGQAC+d4NIRUKqvJFvpkQOvCxN56trD8j+zCooSiLhjPIVO7D5orsSgIzwwvDEUljc71k+VqNj58pNIX6R76Za9XsLCmm6ROp4Isihq/hkCCG0seooWJC1bKCyTdZsN2XO3XU6EOp2EIlLjGV1dv4Rla/AyJWWV9N9G2vFKBKyjVApAd/+OhCy1oF2UDpSRGuoisjoZCkQm0TooJXMG6wv3gXCQzMg+x4SaUTf+41PEQQjdoaRU+aaYFyZ3ePOjnxbaWXBDOG39qKb/scdOrRXxquVLOSr9Ld3855VIgb2zn4bBT6FV0WOXzt3XYnA0oR51exYAQ0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jpnCOrP5uDZ/oHLuY3OIjSytRNiGUjXRZ/5IbABNkR0=;
 b=hBDd7NlVC8MyR6KyocMWxXahupPTHYh2sd1G0y2KQZJIFQa+FnlusG/7vwBb0H1371XGU+MpKcOgQoQmRv4FF4EqkGeNt/6kasgIjzolB7RHMY4NEpErA4KMyxhAxDeKM3s43NkaOPM81uxsH5IhuXlMGQX3zq1Oy0T4LyXu7eYkrfVFEfAc+nMhzEQtWT3LBTTPW6++1aHQIzkq60hc7mkqa8BR6/3DPHQ7plibkieBLMRK9sWeV/IxG0+s2w/WvTahhDrFX2rUqcRe5ow5AW8HTB5g7pN6RZthom/q1OyFvjIbo/Wr1gjvMaobDcoCqY9AeSxbfGTgO3SzFb3AKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 208.81.14.32) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=gmail.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=healthnow.org; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=healthnow.org;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jpnCOrP5uDZ/oHLuY3OIjSytRNiGUjXRZ/5IbABNkR0=;
 b=SdWxFBICo9y69L1JzwD1454pxr8HuJHUCOpEzI7HPSIrqbs8pV7DxEmgXQ8ghpWt0kczcDlR3tuvXw8/RdkLJ8VKU0NBotonntjI5m/hb5WA+kRHmm45wm8cRbCKjVxLxK43NARgwIhPs0/5cBAmHcFZm02Ob7YUuYC6ly/8Fkw=
Received: from BN9PR03CA0460.namprd03.prod.outlook.com (2603:10b6:408:139::15)
 by SJ2PR20MB6660.namprd20.prod.outlook.com (2603:10b6:a03:53a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Tue, 2 Jul
 2024 01:17:30 +0000
Received: from BN3PEPF0000B371.namprd21.prod.outlook.com
 (2603:10b6:408:139:cafe::da) by BN9PR03CA0460.outlook.office365.com
 (2603:10b6:408:139::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.33 via Frontend
 Transport; Tue, 2 Jul 2024 01:17:30 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 208.81.14.32)
 smtp.mailfrom=gmail.com;
 dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=healthnow.org;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 gmail.com discourages use of 208.81.14.32 as permitted sender)
Received: from mail.healthnow.org (208.81.14.32) by
 BN3PEPF0000B371.mail.protection.outlook.com (10.167.243.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.7762.1 via Frontend Transport; Tue, 2 Jul 2024 01:17:30 +0000
Received: from EXMPR02BVWA.healthnow.org (10.130.146.23) by
 EXMPR01BVWA.healthnow.org (10.130.146.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
 15.1.2507.39; Mon, 1 Jul 2024 21:17:27 -0400
Received: from [178.215.236.233] (10.8.129.249) by mail.healthnow.org
 (10.130.146.23) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 1 Jul 2024 21:17:26 -0400
From: Holley Lisanne <holley.lisanne@healthnow.org>
To: <intel-gvt-dev@lists.freedesktop.org>
Subject: We have reached an agreement with the European Investment Payment
Date: Mon, 1 Jul 2024 18:17:26 -0700
Message-ID: <20240701181726.26F996A244F7CBA2@healthnow.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-OrganizationHeadersPreserved: EXMPR01BVWA.healthnow.org
X-EOPAttributedMessage: 0
X-CrossPremisesHeadersPromoted: BN3PEPF0000B371.namprd21.prod.outlook.com
X-CrossPremisesHeadersFiltered: BN3PEPF0000B371.namprd21.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B371:EE_|SJ2PR20MB6660:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ea147bf-e619-4f51-ac9b-08dc9a34be95
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|35950700016|376014|1800799024|366016|7093399012|3613699012|17110700014|17130700016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TVJIblVrWWxqNm1MWnpHOWYzNk5uQVViMjJEbmpxRnpjWXBBdURBNWlQZVV5?=
 =?utf-8?B?U1JyNU5PZmhsZy9oRkRMTmY1b0R2NkwwM3ArZFBTd1ZJdzZ6b1B1L2Y5cHRt?=
 =?utf-8?B?ZWl5Wm43bjBrVWtrMFhrdUh1MVluQUp2bmpjSDQ3ZGJ5QVJUeitaOXVINGRk?=
 =?utf-8?B?V1h2YWdxL2ZIWU9MekxwMXMzTnBjb1BnYlJnVUhzbThJTEhoc203cmY5S1Ay?=
 =?utf-8?B?cnhEdGdRZFVKSWlPZUpLRDdYUTVJMXYvbTRueDA5Ti9nYXcwT3ovUVU5WFBo?=
 =?utf-8?B?L0plV2JiNHFxSUNwS2IwV25za1hFRjhseU00enI4TGdJN1FaYmg3RDFsL05Y?=
 =?utf-8?B?SUFCMERzYjVWVUs5aFB6UmtUeHE2bnVpcFY4b3ZFSTdrVG8zbkw2S1Q1TGd4?=
 =?utf-8?B?VWtZd005ejlnd2l5Lzh5ajViZnlWZXQrNDgwZTE0bXN0azEycXA1MlF6Skdz?=
 =?utf-8?B?S3FoSlEzdFEvKzdMdlg5TnRjNnBSdlFPb1Z4cmFlMmYvT3lkSXZzNGZCejRr?=
 =?utf-8?B?MHNBWmNNMjRHT0NKak1HNnB6OThwTVd2NG5Ca0JzSjdzU2YwU0hIVlU2VWJF?=
 =?utf-8?B?S3UwdExEUGZyZnBJNnZnYWVZM3g5NjdHN1Z2QWRMMEVFRm12SXpwN3ZRcU9Q?=
 =?utf-8?B?c1F1UlVqaUtXVjlSM01QaXJ6a3ArQnFxc1pZV0xXRE5VbTJaUnZSYUJXbmxV?=
 =?utf-8?B?VG5MMmYrNTZhZ0xrT2FvSGpqZjh0aWlrUkp3SkFZOWlUaEM5ejd6VlhyUGxt?=
 =?utf-8?B?eWl1S1crblZmQlVvNFJTenc0NWgybm5ab09JWlh1WWtUU1Q0UW4vM0FGbDZU?=
 =?utf-8?B?c3dYaXVUVXl5S0xFakFMZk8wS2pQb21SQjVrRnFldkRjMnlCU1Y4ZnVrcW0y?=
 =?utf-8?B?OGdJMGhOSm53RmJwL0tCOTczM2lJTHpIMUtzSkVJYWhlU1Jsa3BjcUdZSU1O?=
 =?utf-8?B?V0J6T2pFZ2hGSFU0MmtiNVNPdC9XQXFYVVJMY2Qya1lOOUh1aGQwY1BHbm1r?=
 =?utf-8?B?ZFc2cEVUY3VBcXBzVnVvbnhlaGtEcTlLcnlJejczQ0g4SklvV3pva3N5c1Zq?=
 =?utf-8?B?L21zRHk1eW1CeVhLNjduQ0ZrY3ZUaGprVGo4L05vRXBkWlBhM2RVd3ZlZTlT?=
 =?utf-8?B?cWJad241bEYxamtqRzVsSk1oVm51TDBKMTU1OHZtVGlZbWxDSU9CZjZFZ2hv?=
 =?utf-8?B?QnNONXEwRUl2K0NYZzZDNnFwZngrVmRBbWZ2djhna2NYSlF2MGRGTkxrNGoy?=
 =?utf-8?B?eS8rdFExeTQwWEM2bkZyUjQvYjlyOTRlMmsxQWNWTTRvSDBZMDR4cFhBRGdZ?=
 =?utf-8?B?b0o5cXhtdEk0MEU2MVdtcFRabDg4R2E5NzNoRmJNM2VERkhnRHVORWY5am1t?=
 =?utf-8?B?R21LVDY4SWdna0VIc3NtLzhJZk9POFM1Y2k0SXFyalVwaENvSUlHY1VRUEIv?=
 =?utf-8?B?cWxOZ2o1U2s2S0twUld6dkd0NHZ4WGNia2Z4YWhnY3J2ZkdVbWM1R29BRDVq?=
 =?utf-8?B?YmI3VEEwcVVZakVGYWVWS3ZpMnpBQjhRVFJUU3B0YkEvYzRmOE55TFpEUDQ1?=
 =?utf-8?B?UURQeng3c1dDUG9nam5rN1pIOWZkUXkyYTZZaVhzdFhaUFRDV0ZmY2d5dWkw?=
 =?utf-8?B?QnFHRUFxRHlxUndMZm5ibDVnVW1LQW5Jcy8xdk1ab1hTWGkzOGYrNzRkMk9Q?=
 =?utf-8?B?YnN3aU5OM1ZzTUVRYUhWOWVPL1VXNEN5cTZ5VXBUZGN0cU5nZTRVMXJtR3RP?=
 =?utf-8?B?WWhxcWNLMTBGaitIUDgxRFF6RXJFZDlaVHpna3VCbm5UcG5wblg0cEwyVHlo?=
 =?utf-8?B?Z0ljbVRUOEVWcWViTzVsNXZzU0MzeDYxNmdaVzRNWEV2d3RoT1ZaaEFWY0E3?=
 =?utf-8?B?M0I0SEtaREJ3Sys4SEZLWnVDdkJmZmh0M1Zxd3pKcy8wSWZxTmQ5dEo2YjJQ?=
 =?utf-8?B?a2dXMjh1WjFSaG41U1hQMllEUkFvNHc0S0dpZ003elg2dWNicXpvSGd4c0ow?=
 =?utf-8?B?TDFidDA3WWhGazNvWjJyOEtNME1YVG1jZXlPRXJQWjloaEJ6MHR0SllZK202?=
 =?utf-8?B?UjlwZ1RoblhhMU0xem1aR1dTWWZ2T2JJalNKQVdBNWRvZVFWRnZybjdoSjBw?=
 =?utf-8?B?MHhUU2dPazJyOVppYUo1bnlzKzdNcXpsT3Y2VVFXd29xcTk4WlozTmJuZUVy?=
 =?utf-8?B?V0UxUVM1Sm9mRU00ajZUVkwwZlZENUsvbm96K1Q2UnZYOFVCdlFaOG9YandD?=
 =?utf-8?B?dlpEQVc5aUxGVjNQOThVYkU4dTZnRmVVamRKbVRuaDVKSFhmeDFlb2NkUzhv?=
 =?utf-8?B?UVNEblRGbmcybksxaDdIaE5qRnh6VFUyTWIrZUszZXhKa2NUQkR4bi95bmVF?=
 =?utf-8?B?dFF2QTZJVG1iaFVuVEVXQTNiRm0yS2hZc1RMd3hoVUh0am5ySFdFTUpWVzJs?=
 =?utf-8?B?VTVGNm5CNUFreFBjaWRaZ2grRWFWNno0MjFSamlha1B2QnFsdWNzTkhKdDNa?=
 =?utf-8?B?cTdJV2V2QkFyOFZyd2ttWld4NVpNRWxEOUNxNTBMY0QwVGV5b0RBbGxQMWMz?=
 =?utf-8?B?UE1BLytadVU4M29kZ3RxdFV4S0g4R0JMUVE5VEFJZnhxOU9vNzFxbzNzRHZH?=
 =?utf-8?B?blpYL3NJSUM1SXIrang2SXh6T3J0M0JuRFJtU3NjOFl5Wkk3MWlCRDdvNWlq?=
 =?utf-8?B?MGFacEprUkI1M1REZHVJMExuZnBaeWFTMkE9PQ==?=
X-Forefront-Antispam-Report: CIP:208.81.14.32; CTRY:US; LANG:en; SCL:5; SRV:;
 IPV:NLI; SFV:SPM; H:mail.healthnow.org; PTR:InfoDomainNonexistent; CAT:OSPM;
 SFS:(13230040)(82310400026)(35950700016)(376014)(1800799024)(366016)(7093399012)(3613699012)(17110700014)(17130700016);
 DIR:OUT; SFP:1501; 
X-OriginatorOrg: healthnow.org
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2024 01:17:30.5756 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ea147bf-e619-4f51-ac9b-08dc9a34be95
X-MS-Exchange-CrossTenant-Id: 480ee22c-5ff4-416d-bfa6-99e16833d21c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=480ee22c-5ff4-416d-bfa6-99e16833d21c; Ip=[208.81.14.32];
 Helo=[mail.healthnow.org]
X-MS-Exchange-CrossTenant-AuthSource: EXMPR02BVWA.healthnow.org
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR20MB6660
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
Reply-To: unitednation.kerrymorgan@yandex.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Dear Beneficiary, 

We are writing to inform you that we have been authorized by the=20
European Investment Bank of London and the International Monetary=20
Fund (IMF) to investigate the cause of the delay in your legally=20
approved funds. Our investigation has revealed that your payment=20
was delayed by corrupt bank employees who attempted to divert=20
your funds into their personal accounts.

 To prevent this kind of fraudulent activity, we have reached an=20
agreement with the European Investment Bank and the IMF to manage=20
and monitor your payment. As a result, we have received an=20
irrevocable payment guarantee for your MFI payment. We are=20
pleased to inform you that the European Investment Bank has=20
decided to reimburse you the sum of =E2=82=AC3,500,000.00 and transfer it=
=20
directly to your bank account via bank transfer. To ensure a=20
smooth and hassle-free payment process, please contact the right=20
agent, Mr. Kerry Morgan, at the email address below: 

Email: unitednation.kerrymorgan@yandex.com 

Additionally, please feel free to provide us with your WhatsApp=20
number for easy communication. Thank you for your attention to=20
this matter.

Sincerely, 

Mrs. Holley Lisanne=20
Reply: unitednation.kerrymorgan@yandex.com
