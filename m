Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F064D73B2
	for <lists+intel-gvt-dev@lfdr.de>; Sun, 13 Mar 2022 09:21:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0830E10E143;
	Sun, 13 Mar 2022 08:21:06 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01hn2205.outbound.protection.outlook.com [52.100.164.205])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 562D610E1C5
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sun, 13 Mar 2022 08:21:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XeWbwoTUG2Xr7Q0P554du5cgcTqpK1P50o3NCa7wfzG/54XhDj7dmz+MleULsvdyQZbHdw1/WO1YYuTOFQ3gill4aGI5e54xnGn0dTDg639gV0pB7ljvvQcaDo3rx3GxsrMiKEUaY7KaW81uLuq6SkcVl4Gqi3cXcynFAzg3iC2hOpAWzRuvpHbvG71DCAScVKLSY6pYjiTyMqzIZx2C4TtBV7Y+yQYq72CxqaF4m41vV8iy0EOG5+xV3bG6nH6rDGaQRW+GXBOgE2nKxsugFF3Ka0UfOip4U/CKY6T8zFzHd28jnEtPevjOgz++F4ShYGvpnJntyZOhOx9eGGmKoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9pYUSYGd5wUmNPRniAogi8+cudXasxS+M/fRH+Lg+J0=;
 b=hQSja2jSnbW53ntK9lvCnF6sCUSVlYccwNmD6Yh/YuP12rKoYp62KDL8uWqcB3e5/mDryqomQqtR/e8tKiaTHAfMi5+ljdJbjoNs/5vZ+rtbbB2CD+cOTrZXHGooCgQ8X4NiOu+ZccKlzWrWMO+uqQwqusVW+GJxcvm/lq/6TQHXIjSMo45Nio5Cuo/IlyNLoVaMemKpNhXPPOygiZZBP/cUIEMgQx7OjEkz48wN3ahxfXLnjw+aEWV7cdRO/O2P/G4ygJsHfhWmaC1ezWoAT5pDzayITFnywKS56tg8S/4KVWGujrAowgATEWJgaiN3Ii7eozgLsX/Y9vPU4KKoOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eosfq3n7.gq; dmarc=pass action=none header.from=eosfq3n7.gq;
 dkim=pass header.d=eosfq3n7.gq; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vonckxck.onmicrosoft.com; s=selector1-vonckxck-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9pYUSYGd5wUmNPRniAogi8+cudXasxS+M/fRH+Lg+J0=;
 b=LJne/qzQfIl1LF3YJomR9HMOJaXqmsPulHTsxfz4n56cHKio+xOWA1ZEWWizt0//yVWuRJYd7v8l77IxQDKCEz8QftPfHw/LKqn5n8zdtDZ1L9cg/Qr50zX1FUmBwE9vrpShQCkB4FNN2Y6BhU8kSpYoygArHCvXADZYiZrYHbI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=eosfq3n7.gq;
Received: from SG2PR02MB2924.apcprd02.prod.outlook.com (2603:1096:4:60::9) by
 HK2PR02MB3923.apcprd02.prod.outlook.com (2603:1096:202:26::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5061.26; Sun, 13 Mar 2022 08:21:00 +0000
Received: from SG2PR02MB2924.apcprd02.prod.outlook.com
 ([fe80::6414:8529:2c9b:b774]) by SG2PR02MB2924.apcprd02.prod.outlook.com
 ([fe80::6414:8529:2c9b:b774%5]) with mapi id 15.20.5061.026; Sun, 13 Mar 2022
 08:21:00 +0000
Message-ID: <d50d99cda835c7b17df55b1c0d2c64a8@eosfq3n7.gq>
From: "=?utf-8?Q?=E7=B3=BB=E7=BB=9F=E7=AE=A1=E7=90=86=E5=91=98?="
 <h4gk4@eosfq3n7.gq>
To: "=?utf-8?Q?intel-gvt-dev?=" <intel-gvt-dev@lists.freedesktop.org>
Subject: =?utf-8?Q?=E3=80=90=E9=87=8D=E8=A6=81=E9=80=9A=E7=9F=A5=E3=80=91=E5=85=B3=E4=BA=8E=E9=82=AE=E7=AE=B1=E8=B4=A6=E6=88=B7=E6=8A=A5=E5=A4=87?=
Date: Sun, 13 Mar 2022 16:20:58 +0800
X-Mailer: Lfrgk Nqvzvpdrna 9.86
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: HK2PR04CA0053.apcprd04.prod.outlook.com
 (2603:1096:202:14::21) To SG2PR02MB2924.apcprd02.prod.outlook.com
 (2603:1096:4:60::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2123c24a-f237-48a2-70e2-08da04ca6826
X-MS-TrafficTypeDiagnostic: HK2PR02MB3923:EE_
X-Microsoft-Antispam-PRVS: <HK2PR02MB3923F447DDBDF51EEDF95D2FA20E9@HK2PR02MB3923.apcprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bWdJc2dOdHlGQ0l6NVZLNUM0dDFuOEppRk82ZEJveHd4NXM4TWphNXFRek52?=
 =?utf-8?B?bUVrWkl1YnprdWxLYTRvVDhCM3F2RzBzamt4LzRQaHZuTk1kUmhqRVR2bGZN?=
 =?utf-8?B?dFZ0bCtIYTVEVTJtVEJrT2d5TUFDZkZWNDYvenBoQUY4QjFXK0o5cWZtS0Vs?=
 =?utf-8?B?YlJhTWVlZ1Y1UzQ1ZzdVOVFxSUwyN2xYbGc1WWZ3ak91L2c2REFkWjdiR2M0?=
 =?utf-8?B?RTc5NGZPNVNxQjBvREliSWJEMm0zTnJHZnVWdjNHNDBIRW52N2traXJDY011?=
 =?utf-8?B?US9JSitGWHZMcGxpZWJZVVpyQmF4b1poc0Y1UU5YWFQxa1NyMjQ3UVNUcGRy?=
 =?utf-8?B?RmQvd1VqTlZBODUzNit3dzRXaVdZay93M2w0b2lvdEJrYjZnTG50S21hdDBK?=
 =?utf-8?B?cXBqQmg5cHZrTmtpamVZQjdPVHR2UWVpTWwyU09MbS9rY240eWxYK3o4d3Rk?=
 =?utf-8?B?K0dya01LRHFQVkE4YnpJU1lnYlc2SUJGMy92NWNuZGFFOTR5RmZtYm9vRG9v?=
 =?utf-8?B?N1EwQ3laYTl2Nk5mSHhhazRIRW9GM3UvSVBSYTZOVUMwMFJWZlFsZXNNL2hL?=
 =?utf-8?B?a0xYZVdkRDZLWWI1OURWeFNWLzJ1Q2RkcEswUkd3bktLNWtjRGJoR1hpdDNz?=
 =?utf-8?B?YlRpd3pWTjd6S2ZBVXREWGFoL1EzS2pnQVdpaEZNbDVESCtlbFZmWnpUenRq?=
 =?utf-8?B?czM1SlBHRjFFdlhhY0ErdzBRMlU2ckU5cDhTL3B0M2loRlo3SjVsMTI3S2Fy?=
 =?utf-8?B?T1VwRjdXc2xET0ZkMlplV0hOQU5mVDhKekdZLzJWSnlIZ01iRlA0Z2hIZEQ1?=
 =?utf-8?B?Z2JueGVRS2J6SkJBcHA1bkZ2S3c2K1h4UDBkQXNzOW1rM0Q3WFFLcFpENThw?=
 =?utf-8?B?ck1GRG1VSHVscHVmSndtaHVtZmZraVhNY3VqV2xOR1Q5UlRDRXlaMVpRTVB5?=
 =?utf-8?B?Tm1GcjdjZUZsRmVOZjF3bjNUWE85c3VOdG8xTU1EWmlqYnJwb3R0UUs5SnV4?=
 =?utf-8?B?TzFvdDRDLzhpY0R5WFlwV2pxcGN5bHFVdHNCMWlKZ1dsaGZ5Ymc5UjZ4ZkYw?=
 =?utf-8?B?LzlCcDRhVU1JS2V2RDdNQ0p1NjVLR0x0QktHME5JNGhqUlAzdWcvRzdsamlu?=
 =?utf-8?B?Vi95VzBTbjMrWUx1Q2tNU05XQTU3UUdiMDZJaUNwVWpEdGQ1VzVWVTJHd1l4?=
 =?utf-8?B?MEdKL21IWGorc3ZibTFieUlwUXZVaE9tb3dqc2M3emZDZ3hvVGVRbjNCMDVC?=
 =?utf-8?B?T24weGQ2NEhiVXdabFp3TWxnZGJURlRMOHlWTWJSaDk3Z1BRMldWYlhaakc1?=
 =?utf-8?B?TjBTK2x2SkhFTE9aN3lLVXJIeCtmV1d4MHpuOStScjh5NUJ6RHhJL3VTc2xo?=
 =?utf-8?B?N2tiTTFWQUJrc2tlaDdWeXRCYXM1OUF4RWVmdHR4MU96V0oyUndueUhUT1Nk?=
 =?utf-8?B?cmpZdktReDEyQWFJWURyM09WZGFOb0pEemwrZzF3UFhQTW52aVJyQmFSd2ZL?=
 =?utf-8?B?bGtKZmZsbkEyRUtFL0ZyUlJhQmlVUEpkY3RydXAxS3Z3WkFlWGxjRkI4NHh6?=
 =?utf-8?B?ZXFoeUlPNVgvWjc2RXBBNDhDMmlvZGZlbll4dVMrcjdPUkVXRG5DU1lWYWtr?=
 =?utf-8?B?T0lwUjM4b2NYQmx0RzkrK0svcUxhamZCMnZ5endhbVBqdUJzS2toWllmZUtZ?=
 =?utf-8?B?TUltekR2VjVUMUhwYVRmK2hDNDhPZVZlczdaMkZUSWduWTJydHdDWk9aT2Mr?=
 =?utf-8?Q?gUubmqy6Xyso1j4JOU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:zh-cn; SCL:9;
 SRV:; IPV:NLI; SFV:SPM; H:SG2PR02MB2924.apcprd02.prod.outlook.com; PTR:;
 CAT:OSPM;
 SFS:(13230001)(366004)(6486002)(4744005)(786003)(2906002)(316002)(6916009)(83080400002)(186003)(26005)(86362001)(166002)(6506007)(66946007)(38350700002)(38100700002)(6512007)(36756003)(224303003)(8936002)(52116002)(24736004)(108616005)(2616005)(508600001)(66476007)(5660300002)(66556008)(100850200001)(564404004);
 DIR:OUT; SFP:1501; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dld5cEl0MEZYSTh0SWtLeXI2SEFGTVM0czgzWWs5MnlWUDdFSDRERWxSVENY?=
 =?utf-8?B?Tjl0Y0E4bng2b3o5dExuQkpjWlBQQVNSU2lxdGR2UGZqOXo1VmFSU1djZmJK?=
 =?utf-8?B?dVhBL3d5Z0M5bHFYSjIvbjNjUFBBNG4yOFZRWW1rQkZjd2dnVkxTSklFNWlm?=
 =?utf-8?B?TmYvV2hnUEZHejZBNnd6Q0wyTG9Nc3Q3bWYyVDVQdjJMWm9BTC9zYlJEYnZJ?=
 =?utf-8?B?SnZjYk1palpISTdPeDhyRlNPb0Y3cWI2S0VXWEx1aVZZSWVzWCtOMm1qZGI4?=
 =?utf-8?B?b1BzSzBoS3NoQ0oyOHVpSWNDUjU3N1FhSjc1M255bThoRlZTZnFmTFdiU0I0?=
 =?utf-8?B?TlBKQjMzYzlHR0dUZFJRMnlqeDgxcjd0aytvcjZXYzBYZHBkUnY4dkhRaGhY?=
 =?utf-8?B?cjd4SzVWY0RtZFJmMWt6Zlc2dE1zK2VMZ2RrbXFpNytENmYyNXUrUjNYcjhW?=
 =?utf-8?B?cWRmTmU0WmRESUVWalV6VURjZThuMERSZjhDZkRTMTFLT0VZcVpDbTBNUlJC?=
 =?utf-8?B?cC9wMlh5d2xscWtoSEJGRE5aKytTdzA5ZjZzWkJRNHFUZVdKbXVIcVdaYXNn?=
 =?utf-8?B?blZtR3JGU2xKUVdlR3FHRWFDQTlNL3RGR0tISHlGMTRxdUpla3dNUjJZQTJF?=
 =?utf-8?B?MHN0NzZ2ZFRIUDFWYUFnWkVUenJzME9BOEUxV3N3YzNFOUx3OG5XZG83bFFU?=
 =?utf-8?B?ZmZPOEVkY093R2tvTU9uODBvelh2ZVM4aHpTakJjZDZOUHdhNVFsSTJnYVRx?=
 =?utf-8?B?alZ5Y2pNK0dXbXFOS1RNZDFqanBwRzM5K1c4bU5QRElITXhpZHBGZjQxTktE?=
 =?utf-8?B?OXBBNkh2WTYzbDRsbm9mWFZjR1FQc2MzT1QzMHJnOTJ6KzJmdWZtY2kwUm9L?=
 =?utf-8?B?cU1XMDdWM1FiZHd3dG9NcUZndzR5dkVtK0hyS3pUbkY2VU9yc0JqNTVOOFNk?=
 =?utf-8?B?emxldWxobzdMTWFlQXBVLzIvOFNNT3RTQWRxbGRncTV5R3ZkRjAxV1JyalA5?=
 =?utf-8?B?aFpTQXBGZll5Y3YwS1pnUXFVdDE0M3NHdU1KZmE1eHhrbVh5R0hvcklXai8v?=
 =?utf-8?B?TnZwdndLQ0g0YXhNajNvTEp6KzBjUkVHYkEvSEtxL2E3cFBXQ092SWR1Rnln?=
 =?utf-8?B?dEZuQkdKbFYwb1lZTFI2enRqSVhCM1orZVBaLzlGclFJOCsxMG1td29qNG5p?=
 =?utf-8?B?anY0V2F5UURFMy9LTTdzSjQya25tVEVKdkRkazZDcXBtR1dwd2JyUExKendD?=
 =?utf-8?B?UE9LaG5OQXhOWE5zUlhiV1VkeEFha0N5bTFKcU1nNEJQSCsrZE9YVGZ2c1lj?=
 =?utf-8?B?TGpKTm5XV1pqaGwxNXM4WG5vU2NxSGdocXVPanhNMU9hNWNMaU5wUVNQblU2?=
 =?utf-8?B?UlNmMDNqeEY3d0ZDWDI2K251VFNyL3Y1bE9zR0hYdXMyQjhzMkNidTVNWmpu?=
 =?utf-8?B?eWVPQ0FNL2x1TzN4azBXRW5QeUtlZ090a2VHOWxEVDZyeHdMc3VudEtYMGxx?=
 =?utf-8?B?eml5MVNEK3pKdVNKa3kzQ1d2Z05QUWwxOHhlaTJFajF0aFZESGlLMlh2WU05?=
 =?utf-8?B?UGV5bDMya0JKU2ZBcGNQcFMrYUNSdlFGZjRNdldaY1ZTSWxPZFRmLzBXQnVD?=
 =?utf-8?B?ZzRNWFZzcjQ4V21hbDZTVjFQUTdHbHBvQ2srb09KUzJad1BkNVlqeFBmRjdy?=
 =?utf-8?B?RFVBV24yQ1l4Y25oSGVmTzNCZVVpRlVPSFJVY0c5V1U2QlFJSmpZNjBlYW1R?=
 =?utf-8?B?bTUycHJ3K1hYY21HdjBUVHdOZTNqRTF6RWp2aWk0NFhpTnJwRTBjRVJmZjZT?=
 =?utf-8?B?U2JJVGw5aFd1NG1WTWRwaFhTSVovVGVnNXN1ZVpKcGt0NElTbzdldjk5TXl6?=
 =?utf-8?B?ajMrcFVRLzhRTWc2M2ZZZVpRbDBOY0JFZ0J3d1ZzbnpyMldkejVBMWJ5bDVC?=
 =?utf-8?Q?bk812zagFVL11bDxF/RHoCrLlv5W0VD3?=
X-OriginatorOrg: eosfq3n7.gq
X-MS-Exchange-CrossTenant-Network-Message-Id: 2123c24a-f237-48a2-70e2-08da04ca6826
X-MS-Exchange-CrossTenant-AuthSource: SG2PR02MB2924.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2022 08:21:00.5632 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 1758e64d-fc13-4ac7-b9f9-9c4519950186
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Di/34fVHAwcFrzKf/KqbLznt9wL9G8HHH0KkgKo3UV5+ATGUEih8lPQzjFpXPijIl0ql7JYrEtx7OQCRAVW85w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR02MB3923
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

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN"><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8"></=
head>
<body>
<p style=3D"FONT-SIZE: 14px; FONT-FAMILY: &quot;lucida Grande&quot;, Verdan=
a, &quot;Microsoft YaHei&quot;; WHITE-SPACE: normal; WORD-SPACING: 0px; TEX=
T-TRANSFORM: none; FONT-WEIGHT: 400; COLOR: rgb(0,0,0); FONT-STYLE: normal;=
 ORPHANS: 2; WIDOWS: 2; LETTER-SPACING: normal; LINE-HEIGHT: 23px; BACKGROU=
ND-COLOR: rgb(255,255,255); TEXT-INDENT: 0px; font-variant-ligatures: norma=
l; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decorati=
on-thickness: initial; text-decoration-style: initial; text-decoration-colo=
r: initial">=E6=82=A8=E5=A5=BD=EF=BC=9Aintel-gvt-dev@lists.freedesktop.org=
=20
&nbsp;=E5=85=88=E7=94=9F/=E5=A5=B3=E5=A3=AB</p>
<p style=3D"FONT-SIZE: 14px; FONT-FAMILY: &quot;lucida Grande&quot;, Verdan=
a, &quot;Microsoft YaHei&quot;; WHITE-SPACE: normal; WORD-SPACING: 0px; TEX=
T-TRANSFORM: none; FONT-WEIGHT: 400; COLOR: rgb(0,0,0); FONT-STYLE: normal;=
 ORPHANS: 2; WIDOWS: 2; LETTER-SPACING: normal; LINE-HEIGHT: 23px; BACKGROU=
ND-COLOR: rgb(255,255,255); TEXT-INDENT: 0px; font-variant-ligatures: norma=
l; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decorati=
on-thickness: initial; text-decoration-style: initial; text-decoration-colo=
r: initial">=E7=BD=91=E7=BB=9C=E4=B8=8E=E6=95=B0=E6=8D=AE=E4=B8=AD=E5=BF=83=
=E6=AD=A3=E5=9C=A8=E9=83=A8=E7=BD=B2=E6=96=B0=E7=89=88=E7=94=B5=E5=AD=90=E6=
=B2=B9=E4=BB=B6=E7=B3=BB=E7=BB=9F=EF=BC=8C=E6=8B=9F=E5=AE=9A=E4=BA=8E2022=
=E5=B9=B42=E6=9C=8810=E6=97=A5=E5=B0=86=E6=97=A7=E7=89=88=E9=93=80=E4=BB=B6=
=E7=B3=BB=E7=BB=9F=E4=B8=AD=E7=9A=84=E9=82=AE=E5=BB=BA=E3=80=81=E7=BD=91=E7=
=9B=98=E3=80=81=E9=80=9A=E8=AE=AF=E5=BD=95=E7=AD=89=E6=95=B0=E6=8D=AE=E5=85=
=A8=E9=83=A8=E8=BF=81=E7=A7=BB=E8=87=B3=E6=96=B0=E7=89=88=E9=82=AE=E5=81=A5=
=E7=B3=BB=E7=BB=9F=E3=80=82<br>=E8=AF=B7=E7=94=A8=E6=88=B7=E5=9C=A8=E8=BF=
=81=E7=A7=BB=E5=89=8D=E7=A1=AE=E8=AE=A4=E9=82=AE=E7=AE=B1=E8=B4=A6=E6=88=B7=
=E6=98=AF=E5=90=A6=E6=AD=A3=E5=B8=B8=E7=99=BB=E9=99=86=E3=80=82<br>=EF=BC=
=88=E7=8E=B0=E9=9C=80=E8=A6=81=E5=AF=B9=E9=82=AE=E7=AE=B1=E8=BF=9B=E8=A1=8C=
=E6=8A=A5=E5=A4=87=E4=BF=9D=E7=95=99)<br>=E6=B3=A8=E6=84=8F=E4=BA=8B=E9=A1=
=B9=EF=BC=9A<br>&nbsp;=20
&nbsp; 1=E3=80=81=E8=AF=B7=E6=82=A8=E6=9F=A5=E7=9C=8B=E6=9C=AC=E7=94=B1=E4=
=BB=B6=E5=90=8E=E5=89=8D=E5=BE=80=E6=8A=A5=E5=A4=87=EF=BC=8C=E5=AF=B9=E4=BA=
=8E=E6=9C=AA=E6=8A=A5=E5=A4=87=E4=BF=9D=E7=95=99=E7=9A=84=E9=82=AE=E7=AE=B1=
=E8=B4=A6=E6=88=B7=E9=83=B5=E4=BB=B6=E7=B3=BB=E7=BB=9F=E5=B0=86=E6=A0=B9=E6=
=8D=AE=E7=9B=B8=E5=85=B3=E6=96=87=E4=BB=B6=E8=A6=81=E6=B1=82=E5=81=9C=E7=94=
=A8=E5=85=B6=E8=B4=A6=E6=88=B7=E5=B9=B6=E5=88=A0=E9=99=A4=EF=BC=8C=E6=84=9F=
=E8=B0=A2=E6=82=A8=E7=9A=84=E9=85=8D=E5=90=88=EF=BC=81<br>&nbsp; &nbsp;=20
2=E3=80=81=E4=BB=8E3=E6=9C=885=E6=97=A5=E8=87=B3=E6=96=B0=E9=82=AE=E8=A7=81=
=E7=B3=BB=E7=BB=9F=E6=AD=A3=E5=BC=8F=E4=B8=8A=E7=BA=BF=E6=9C=9F=E9=97=B4=EF=
=BC=8C=E7=94=A8=E6=88=B7=E5=8F=AF=E6=AD=A3=E5=B8=B8=E6=94=B6=E5=8F=91=E4=BF=
=A1=EF=BC=8C=E4=BD=86=E4=B8=8D=E8=A6=81=E4=BF=AE=E6=94=B9=E9=82=AE=E7=AE=B1=
=E5=AF=86=E7=A0=81=EF=BC=8C=E5=90=A6=E5=88=99=E5=B0=86=E6=97=A0=E6=B3=95=E7=
=99=BB=E9=99=86=E6=96=B0Email=E7=B3=BB=E7=BB=9F=E3=80=82=E6=96=B0Email=E7=
=B3=BB=E7=BB=9F=E4=B8=8A=E7=BA=BF=E7=9A=84=E5=85=B6=E4=BB=96=E4=BA=8B=E5=AE=
=9C=E5=B0=86=E5=8F=A6=E8=A1=8C=E9=80=9A=E7=9F=A5=E3=80=82<br><a style=3D"CU=
RSOR: pointer; TEXT-DECORATION: underline; COLOR: rgb(30,84,148); OUTLINE-W=
IDTH: medium; OUTLINE-STYLE: none; OUTLINE-COLOR: invert" href=3D"http://ww=
w.rzorkce.cn/" rel=3D"noopener" target=3D"_blank">=E7=82=B9=E6=AD=A4=E6=8A=
=A5=E5=A4=87=E4=BF=9D=E7=95=99</a></p>
<p style=3D"FONT-SIZE: 14px; FONT-FAMILY: &quot;lucida Grande&quot;, Verdan=
a, &quot;Microsoft YaHei&quot;; WHITE-SPACE: normal; WORD-SPACING: 0px; TEX=
T-TRANSFORM: none; FONT-WEIGHT: 400; COLOR: rgb(0,0,0); FONT-STYLE: normal;=
 ORPHANS: 2; WIDOWS: 2; LETTER-SPACING: normal; LINE-HEIGHT: 23px; BACKGROU=
ND-COLOR: rgb(255,255,255); TEXT-INDENT: 0px; font-variant-ligatures: norma=
l; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decorati=
on-thickness: initial; text-decoration-style: initial; text-decoration-colo=
r: initial">2022-03-13&nbsp;=20
16:20:58</p></body></html>

