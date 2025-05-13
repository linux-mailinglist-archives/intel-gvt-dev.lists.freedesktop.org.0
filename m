Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C704AB4C23
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 13 May 2025 08:41:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10E0010E194;
	Tue, 13 May 2025 06:41:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.b="Vv3dspVR";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from OS8PR02CU002.outbound.protection.outlook.com
 (mail-japanwestazolkn19012051.outbound.protection.outlook.com [52.103.66.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B81CD10E194
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 13 May 2025 06:41:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c5POdETXxIWle0Bn/PYECrJxPP61NeATVocJ+W/7wKaTUr1pmbKdSH3vplao5xsZYHYRZiyRTJ632tXzfrRAp70S3otLQsiWO0a4NA1dzXxVrNVXn3E3fodJkxaMwrQpSBDLTe9hEpVTahMDLh/SQO8kOR2cT0cflqbqHGm3Ojd8hoYR9lRgk0lR8ET8LUKFENAlIx53DdtxwOHYPeNa0GaZKrJJCDlNw6+k6l7kvIBFeFAcpJJ/ZX0rzU+ImtiRXgoCfx+tGZYrr6aImSd/Pqt8Cu5YsiWYTSsY2DPG2p3/L0lx5FANfjcR6rKr2nqykAEnvyCeeJH+4RGSnaqoaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=68WmV75kh8CLFIMDCcLcaranNxM7jjnajbftwbUmOqk=;
 b=hC/YuHOnpelhWVHqPCkbY/jXrkhKizBY2YjHP7eVFxMrnxpS/fESEJWvhXYpKjwxbupVEsVJEEUbiMTXwil1KFTeB3zLnxkCT0sCHaUqdg2nHaIEVXc+fpK8e/DZoxCWSi5ixwOYDqQ/v6XcRMFUFq1PP9gflxZ3f7AxrncPF3BkEkpJ7GZhNFLm3XlOuljj0jEoxHrU0yNuFbKBWXw7mZIH71CFYjM88QtPd9z7vojFMOibCzb8ocmnM06ZlR/hdDjdCtsZOjrLx9t9/uFFchQBcqe8/tdF54esAfjM6GYrTi82pL82LEcYgJliyNINXtp4lJAcrxOdYjJaMhHn/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=68WmV75kh8CLFIMDCcLcaranNxM7jjnajbftwbUmOqk=;
 b=Vv3dspVRutje/6ppcofBuFzZ//sV5TluXUg8d2mjunViiiM6OUQ3EeuLZ0tPv0Hkk5ljjaWtp2ft7u2QrI2HDlmoBt5490KoR22j3s/Kv9EEPDVLa/I7lpwhNclEDT5KhE6Fc/+2aO/SowThdUX1Da0PqksBDWJ8Syq84nUUANBP+LhFVx9GUeHsALypg1m0muw1RpjI6v/oCwZlQSfWAbAqLOHTJPEJlFOu6WbeNgfNHkb7N1FJLwZZSXyPedNbWPMnKcFNCrg8ojg02P8hryZQZ0aJJeh/Pkav7FTjyeTc0WW6tIPGvU7iUpEn7fh5azhe6Q0HegBXL+Jz3cF9wQ==
Received: from TY0PR01MB5842.apcprd01.prod.exchangelabs.com
 (2603:1096:405:10::11) by TYZPR01MB4403.apcprd01.prod.exchangelabs.com
 (2603:1096:400:1d1::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Tue, 13 May
 2025 06:41:45 +0000
Received: from TY0PR01MB5842.apcprd01.prod.exchangelabs.com
 ([fe80::1ace:bbc3:c2e7:7d0c]) by TY0PR01MB5842.apcprd01.prod.exchangelabs.com
 ([fe80::1ace:bbc3:c2e7:7d0c%3]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 06:41:45 +0000
Message-ID: <TY0PR01MB5842E1D29F2F17A1F471CA1AB496A@TY0PR01MB5842.apcprd01.prod.exchangelabs.com>
From: "yis4ca5a94b53@outlook.com" <yis4ca5a94b53@outlook.com>
To: contact <contact@samcertification.org>
Subject: 666652
Date: Tue, 13 May 2025 14:41:40 +0800
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook Express 6.00.2900.2180
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.2180
X-ClientProxiedBy: SI2P153CA0014.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::6)
 To TY0PR01MB5842.apcprd01.prod.exchangelabs.com
 (2603:1096:405:10::11)
X-Microsoft-Original-Message-ID: <004a01dbc415$5cd763c6$0024bc9a@outlook.com>
Importance: high
X-Priority: 1
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY0PR01MB5842:EE_|TYZPR01MB4403:EE_
X-MS-Office365-Filtering-Correlation-Id: 83bace5d-6095-4926-380c-08dd91e939b3
X-MS-Exchange-SLBlob-MailProps: hQngCdii+CZMtubk+T4alwTMqtSryas8gEL6hh4sVxegoH4FVXERgFBs63bHUXtsTbzSQG9YKFPlQNLAXRPI0NcRlKmWZoJy9305CZQ6EGuO5iUGo8YoubWOAzTUO8tIPGfDmkQhFSkPVEA85ngXn3D65aAKYDOoNxReRp5Z6wgqLXMiH0keTSPKZlu1xaZpMfBthS4paT1/VvKfZsMqWiyqqCCDCwok4gyIvgxbNsM2FJChvETIn2NuG3rchQO37pZWQPhdChTjTLyq/SU/JybskZFvPY0dlVYfRnKynMTOKu2S4+G0NfLkieJa16JJGGiioTr/gE5VOdfR5cd2q+cuMqBrRY0lzgAchhCQlpe/zyksFuzSrFQNHUZKA7+qy0dNO6izXPhvkxYm1nLE5WsNsb3Uh0GKXCjhnKtu08d1SUKZvqH+Xv93zd3Z1tN8TN5AqkTOYZHkfinD29YYQH2fiHjDUOS602vaJRa6it7dFdirHclqNHlNjRpPAvg6GNeLXprlS5uEAuXEapMyeIWf+Qdx9edz9xFlnL0jkf6odsH8vtAvin8r3aVJ6q4U3mAgYtkpyI9oGhejhm6faqta/fQfwsilA5U80t/SjpnrI/G8fv9ehSilenW+uq8pO2gyI1kj9o5UgcldV0m/yJXbjgwBNg7HDBv7a+PFVUp8AWgI819rsQ==
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|9112599006|41001999006|8060799009|461199028|5072599009|19110799006|12121999007|8040799003|13031999003|3412199025|440099028|12091999003|18061999006|16045399007|3420499032|3430499032|56899033;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bDI5NzllTGNuUTRZaFBuL2ZrcDhrUklUQTRZQ1VUZG4zL1lxdDBlc3FSdzI0?=
 =?utf-8?B?dW5wL01xVmIxRTdwS0tXaE94bWVVRk9OSXBXMHRDZUoxdFFuVnh0c0FrWG5E?=
 =?utf-8?B?MWxFdlVyRjhMQXB6bVBhcUxIcHdybnJIbHpqeTBIbzJOajFSMENRaStyVThl?=
 =?utf-8?B?OElEa0hSVVcvZnJlOUJER29sTjFqNlV6UnMwT0YzWEhoSWptN0JLczNTOEcw?=
 =?utf-8?B?UnYvWWNWS0VNNDVOZ1oyS0U5Z0JibHVpUmRxU01lY1dDYW9Id21CQzJUM3NQ?=
 =?utf-8?B?ZFJZdHlzVHV1ZDJpMldqT0JGcWpudnFDT2VxcktsUVBzNDNOVUV0Y0pwSmxx?=
 =?utf-8?B?aUdHU0VsS1g1OENvMXQyaTM1bFEzQ01PK3FpRHhCa3pNMnBMWmJ0dkZrK29q?=
 =?utf-8?B?ZVlGRHNxb09rWFJqNEhUbVc3elVqZW1ZZHI5TUZCQi83TXJCaW1yeW4xZ2h1?=
 =?utf-8?B?TmFWZldlUTRpZEJTbG1FVVVEZ1p6MER4Y0EwbXZXWENML0V6L0ZNZmRFSnBQ?=
 =?utf-8?B?TGpQNnFFSC9ucktvcGd5UWVaU2NOajhxYkEwREsvcGVTbVhuS2hnWUhuYk1R?=
 =?utf-8?B?QzNIekc3VXB3OGxpTDNUSzJCWHp1dkxmbUo4MjhuQVUrQkNWL2JUQndHS0VN?=
 =?utf-8?B?LzNQTVlkRmJRUk1uT2Rra1BrLzhsb0NKVHpzMVljRDJGV1g2WUxTOFFtTnhy?=
 =?utf-8?B?WWFGOWlTRjVBL3ljQ25RaWxuelhJRkZPSmhtR1cvTGx2N1krYnZzOFBkVy9H?=
 =?utf-8?B?djYwTGVIdkdMZzF6c1lUSVdXS2pDeC81S3hKb1Q2QzA5bXJhaVNVd2grWHZu?=
 =?utf-8?B?Nisra3N6c2NZMTV4WTBJaWovZlB4dVo2YnlWRFFvYWxQczR3S3hxVTdsYi9T?=
 =?utf-8?B?ZytoYU1id3JxUWFDVzNFYWsrTnN1bDVEVWhOSVlJS3dCaWFmUmdBV1RyNk1t?=
 =?utf-8?B?eUY1Slg5Q1pRSjlLMU51WEJvd3AwSUpmL0xqaWZKc1R3a0hBdjRSTXFtRHZn?=
 =?utf-8?B?NFo2ZlVjcVJZeVZMTnNISE0rRklCWWs5dVQyYW1zcTJlL1ZGOU9hbGNlaUt3?=
 =?utf-8?B?YjFZVUdvUXNZemNiTlovK2F1dzllS09teHVoMGMrWmU3dlErSGlWRWs3eVRW?=
 =?utf-8?B?azlvbzVpUEFGZXNreWtwT2E0Z2t3OXUwREhlUHg2YjF0Q0dtTU1lbTEva0tV?=
 =?utf-8?B?WHZJYTd2ZHFXMWVRMEZia0RwTWlZVlZyME11S21IQWtleVpaYkszQW5IL0hj?=
 =?utf-8?B?KzRIZm9NWERqUGpDM0VYN0tkS2NPN3B4Y3UycmhtcDBYOFJWb3JBeThTcG9C?=
 =?utf-8?B?ekFJVWZyK1ZMdUtCVmZSVE1HRFllZEpwRXdLVEtITjNjdUlGNUsxK2V0WE1M?=
 =?utf-8?B?R3NLZUlxU0w1U0lNamFIN0U3c2xBdUNpR2ZNTzZuU0hXVzFnNk8weUp0Wml1?=
 =?utf-8?B?ck9QbkxPWWQ5dXlLQXVyWGdJeC9xSC9tRVR4L1RRRHBtSXpZZlhCNXkxREtU?=
 =?utf-8?B?d2NFY296WE13MGpWNmJqOTArcWxMa2lxQzYrcjdCQmJIRC9WckJyNVc1bCtW?=
 =?utf-8?B?WmVvdjl6R2hCdlhaWjk1VXNSSzJyQ2VyYTIzWWZXZjFPdnhQTGxvem1FbjFU?=
 =?utf-8?B?Um5jKzJKcElZakZIaE8rYlYrVHlDTmU1bTZ4RURDNGd3cDB6MTNkL3FwbVFX?=
 =?utf-8?B?cC9aeHpqRzBSZlRnZ2hPcWE3VjI0U2VhWmZ5N1lRYlpoZ1lPNnY4R3BwalBw?=
 =?utf-8?Q?XzNQD1HsEEJ7Ix40gQ=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZjZwWDY4SmpXYmNEcjh3eGI1dVFRTkFQU0dmZzZjcjBuVGpqTTA4WDlLS3JL?=
 =?utf-8?B?VmY5S1BOYWl5Yk9iWHZGeDFnK3Jod3RuM3U1Y3REbnJXV2xpRklsTmo4bFRz?=
 =?utf-8?B?QmpKWG1iU2djalVTZUNKelptMUM4cnJ4cS9hY0pOV3RKV3FjS2o2ZDY1WEJR?=
 =?utf-8?B?QU9ORHIvczdJNjZqbzhMN04xb3VWbitKT29ncHlwam1DRGxrSXJWcGdtTkRi?=
 =?utf-8?B?MlJQaGp4ZUhmbndQNFBGelkzb0d5UXFYUW9KdG5hdzc0N0FVdlRqMisxN2Nj?=
 =?utf-8?B?bHBBTVBtcXRZVXVZNG5DelExNWo1Z3NUa0RaVVBrMnRqQWtnaXhsZTRGV3U0?=
 =?utf-8?B?eEJPalFwc2ZuTFVadVhHRDNBWGxxUXNPbTE3aXoyWjVTQThrTEo2UWE3UlEy?=
 =?utf-8?B?VkFyeTVXcXppaUJVUXRmUGVqNERvRHM1b21hWWNsa0diN29GcjN1QU9iYmw2?=
 =?utf-8?B?bVQ3Z0cwbGpac1BSa3FTeFd2eWg5OUJwRktZUDNPK1hhRm56aVZYK0FSeGRj?=
 =?utf-8?B?SER2dkphWXh4aDJ0U2xqdC8yYlkvQWdWbEE4bUlrbDYwdVFKdXRKNnRlbVlV?=
 =?utf-8?B?QUMwVUgxSXFGazVLYS93THlVWHJUSXh4Z0dlbm5Xekw0cFF0VForMWh2TEpE?=
 =?utf-8?B?RDUwcWR0cWEzUlpsZlg3NXdmSTVYajJBaVJnWDlEZTJ4N05QaWRxRHVNSzNN?=
 =?utf-8?B?Ymo1Y1VHTzIxQjNtMFRvaENkdFY0dk5IZjBIQlR0SEFHUVdsZ2kzdVFjR3E4?=
 =?utf-8?B?b3JPNGRIMXNwTE9CMG5TT1NvQkJUQTVEcHZEWjhWRjVEbEdhZS9YMjJsNm1X?=
 =?utf-8?B?WWIrL3R4ZzFPNXFDK01tNWpwMmF5cFBxSXA5NkJqTldNSkV5WmtXWUFhS0w5?=
 =?utf-8?B?S0dweXdsV3F4VzUybXVjQWdtQjdwdnhBN1RjelFrb3Yzc0huSmJTdXl0SzF1?=
 =?utf-8?B?dzdKbVl3RmQxcnUwN29EOGNvYUQwWlZ6bjU2ZXJCSHBpL2tGTG9KM0RQdnNZ?=
 =?utf-8?B?SHlWQjdYalVCaHdFTEhFZmFBV0VTc0JvZ0xURFZ0cFVJdEFtS2VWNUNDRXJk?=
 =?utf-8?B?ZUxqM3c1cVpPS3ZydExTZzhBaXdLR1dGMW93c1pxVldtV2tHaVlmZ1RDOU9q?=
 =?utf-8?B?MFIveElvUEh4NkEvTEpwaTJQTGRPMjZoRGZQWDdLelRrZVpDQ3JmQW1nVmwv?=
 =?utf-8?B?dEZsc0ozU1g2YlpmcW5LYnRzczFaK1VIZHBBdW1OMG0xTmNSWExKNTdWTnJa?=
 =?utf-8?B?LzlsTisweUVhZHphSHN6WFNPSk01cWEyMWtTWnRydnFSWlMrRzVITzM3ODR6?=
 =?utf-8?B?VGk3NHY4bXZXN0xKK3g5ZXRPSkVUbUVPVmQ4V1JRdGlKRXBNNFBDb0ZmZmg5?=
 =?utf-8?B?VFZZU3VobXN6enA5ekJQZ1lOY2JVSFRjZzZKcHF3ZFVQSDdIcU03U2pGdDBN?=
 =?utf-8?B?TFMrUEhJZVplN3Uvb0R4YW1WK0pRcCtJUnA3T1VOb3VobXZmVjRhNnJ4SXhE?=
 =?utf-8?B?TGtMNGM5WnB0WkpBM3VoaDgwa1NtS0xDTStaQVB4TEs3ZjlzRUV3Z05sR0Jj?=
 =?utf-8?B?TUcxbjFMMSt2bU8xbEowT3Y5elJRSzFYZm4ycHZZQ0NOd0lKRUtOL0hObVJD?=
 =?utf-8?B?amJ0eHd3V2psV3JjZStEczZvcFFkbTV3bUpsa3NEaUp4OWVERjA0YlI5ZVBJ?=
 =?utf-8?Q?23fgjrCkgA2CBqKi4f4R?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83bace5d-6095-4926-380c-08dd91e939b3
X-MS-Exchange-CrossTenant-AuthSource: TY0PR01MB5842.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 06:41:44.0982 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR01MB4403
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

<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8"><p=
>Subject:&nbsp;Sourcing from China? Free advice</p>
<p>Hi,</p>
<p>China is a fantastic place to source quality products, but even the best=
=20
sourcing experiences can have occasional problems. If you're currently faci=
ng=20
any challenges, or you simply have a question you'd like answered, I=E2=80=
=99d be happy=20
to help.</p>
<p>Whether you need assistance solving an ongoing issue or just some quick=
=20
advice, feel free to hit reply. I'm always happy to offer a suggestion or t=
wo,=20
no strings attached. I'm a professional China sourcing agent with many year=
s of=20
experience and an extensive list of contacts.</p>
<p>Looking forward to hearing from you!</p>
<p>jake</p>
<p>Professional China Sourcing Agent</p>
<p>WhatsApp&nbsp;&nbsp; +86 13674026136</p>
<p>&nbsp;</p>
<p>Email jiakelee9527@hotmail=E3=80=82com</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p><font style=3D"BACKGROUND-COLOR: silver" color=3D"silver"><p>According t=
o the advice of the Indian chief, Hobson determined to get to the coast by =
the shortest route, and to take a north-easterly direction. After consultin=
g, his map, which merely gave a rough outline of the configuration of the c=
ountry, it seemed best to him to descend the valley of the Coppermine, a la=
rge river which flows into Coronation Gulf.</p><p>&quot;Have Dan hitch up t=
he light buggy and bring it around to the door. And you get your hat and co=
at. I want you to go along with me.&quot;</p><p>=E2=80=98Dear me,=E2=80=99 =
said Esther, =E2=80=98I thought he was something higher than that.=E2=80=99=
 She was disappointed.</p><p></p><p>&quot;Nay, that we will ourselves disch=
arge,&quot; said King Robert, eagerly catching at the hope of a pacific ter=
mination of this unpleasing debate. &quot;Ramorny=E2=80=99s prospects will =
be destroyed by his being sent from court and deprived of his charge in Rot=
hsay=E2=80=99s household, and it would be ungenerous to load a falling man.=
 But here comes our secretary, the prior, to tell us the hour of council ap=
proaches. Good morrow, my worthy father.&quot;</p><p>=E2=80=98Bother the Sh=
ogun! I=E2=80=99ve seen something like the Babu class, and something like t=
he farmer class. What I want to see is the Rajput class =E2=80=94 the man w=
ho used to wear the thousands and thousands of swords in the curio-shops. T=
hose swords were as much made for use as a Rajputana sabre. Where are the m=
en who used =E2=80=99em? Show me a Samurai.=E2=80=99</p><p>&quot;Honey,&quo=
t; he said, quickly, when he saw her eyes, &quot;you don=E2=80=99t understa=
nd. I want you to do what you want to do. You=E2=80=99ve planned this out i=
n order to be with me; so now you do it. Don=E2=80=99t think any more about=
 me or anything I=E2=80=99ve said. I was merely thinking that it might make=
 matters worse for both of us; but I don=E2=80=99t believe it will. You thi=
nk your father loves you so much that after you=E2=80=99re gone he=E2=80=99=
ll change his mind. Very good; go. But we must be very careful, sweet =E2=
=80=94 you and I=E2=80=94 really we must. This thing is getting serious. If=
 you should go and your father should charge me with abduction =E2=80=94 ta=
ke the public into his confidence and tell all about this, it would be seri=
ous for both of us =E2=80=94 as much for you as for me, for I=E2=80=99d be =
convicted sure then, just on that account, if nothing else. And then what? =
You=E2=80=99d better not try to see me often for the present =E2=80=94 not =
any oftener than we can possibly help. If we had used common sense and stop=
ped when your father got that letter, this wouldn=E2=80=99t have happened. =
But now that it has happened, we must be as wise as we can, don=E2=80=99t y=
ou see? So, think it over, and do what you think best and then write me and=
 whatever you do will be all right with me =E2=80=94 do you hear?&quot; He =
drew her to him and kissed her. &quot;You haven=E2=80=99t any money, have y=
ou?&quot; he concluded wisely.</p><p>&quot;Agitatin=E2=80=99,&quot; murmure=
d Lady Mont. &quot;Ask Adrian.&quot;</p><p>&quot;I am gratefully sensible, =
Crayford,&quot; he began, &quot;of the interest which you take in me =E2=80=
=94&quot;</p><p>&quot;It=E2=80=99s frightful cheek on my part, but I though=
t you wouldn=E2=80=99t mind. We=E2=80=99ve just come back from the Soudan.&=
quot;</p><p>What a scene was presented by Cape Bathurst and the surrounding=
 plain. It was mid-day, and but a few faint twilight rays glimmered upon th=
e southern horizon. The cold was not so intense as one would have supposed,=
 and the thermometer marked only 15=C2=B0 Fahrenheit above zero; but the sn=
ow-drifts whirled along with terrific force, and all would inevitably have =
been thrown to the ground, had not the snow in which they were standing up =
to their waists helped to sustain them against the gusts of wind. Everythin=
g around them was white, the walls of the enceinte, and the whole of the ho=
use even to the roof were completely covered over, and nothing but a few bl=
ue wreaths of smoke would have betrayed the existence of a human habitation=
 to a stranger.</p><p>&quot;I think because SHE=E2=80=99S a Cherrell, my de=
ar.&quot;</p><p>&quot;You are quite right, sir;&quot; adding to his men, &q=
uot;bring out all the canvas there is!&quot;</p><p>&quot;Under your lordshi=
p=E2=80=99s favour,&quot; said Sir Patrick, &quot;I, who am knight and nobl=
e, take license to say, that such a brave man as Henry Wynd may reject hono=
urable titles, such an honest man as this reverend citizen may dispense wit=
h gold.&quot;</p><p>&quot;Nay, my lord,&quot; said Ramorny, &quot;if, young=
, handsome, and a prince, you know not how to make yourself acceptable to a=
 fine woman, it is not for me to say more.&quot;</p><p>Conachar and his fai=
r charge having arrived on the threshold of their own apartment, which was =
opened to them by an old female servant, the burgher=E2=80=99s uneasiness w=
as ended. Determined, however, to ascertain, if possible, whether there had=
 been any cause for it, he called out to the man whose motions had occasion=
ed the alarm, and who stood still, though he seemed to keep out of reach of=
 the light. &quot;Come, step forward, my friend, and do not play at bo peep=
; knowest thou not, that they who walk like phantoms in the dark are apt to=
 encounter the conjuration of a quarterstaff? Step forward, I say, and show=
 us thy shapes, man.&quot;</p><p>After that, as they walked together to Fra=
mley Court, Mrs Robarts made her friend promise that she would stand by her=
 if any serious attack were made on the absent clergyman.</p><p>Cowperwood =
smiled his inscrutable smile. There were so many ins and outs to this finan=
cial life. It was an endless network of underground holes, along which all =
sorts of influences were moving. A little wit, a little nimbleness, a littl=
e luck-time and opportunity =E2=80=94 these sometimes availed. Here he was,=
 through his ambition to get on, and nothing else, coming into contact with=
 the State treasurer and the governor. They were going to consider his case=
 personally, because he demanded that it be considered =E2=80=94 nothing mo=
re. Others more influential than himself had quite as much right to a share=
, but they didn=E2=80=99t take it. Nerve, ideas, aggressiveness, how these =
counted when one had luck!</p><p>&quot;Yes, the Cowperwoods! What about the=
 Cowperwoods?&quot; demanded Butler, turning squarely to Aileen =E2=80=94 s=
he was sitting beside him =E2=80=94-his big, red face glowing.</p><p>The wh=
ole morning Hobson and Sergeant Long wandered about the coast. The weather =
was much improved, the rain had ceased, and the wind had veered round to th=
e south-east with extraordinary suddenness, without unfortunately decreasin=
g in violence, causing fresh anxiety to the Lieutenant, who could no longer=
 hope to reach the mainland.</p><p>=E2=80=98Where did you pick up your Cons=
titution, then?=E2=80=99</p></font></p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p><font style=3D"BACKGROUND-COLOR: silver" color=3D"silver"><p>&quot;I hea=
rd something on my way here,&quot; he proceeded, &quot;which suggests to my=
 mind a method of meeting the difficulty that you have just mentioned. Unle=
ss I am entirely mistaken, Miss Burnham will not say No to the change that =
I have in view for her.&quot;</p><p>&quot;I trust your Grace will make her =
penance a gentle one,&quot; replied the knight.</p><p>This was spoken with =
a melancholy smile, while a tear at the same time stood in the speaker=E2=
=80=99s eye. Torquil stared at his young chief for an instant, then drew hi=
s sharp wood knife across the creature=E2=80=99s throat with a cut so swift=
 and steady that the weapon reached the backbone. Then rising on his feet, =
and again fixing a long piercing look on his chief, he said: &quot;As much =
as I have done to that hind would I do to any living man whose ears could h=
ave heard my dault (foster son) so much as name a white doe, and couple the=
 word with Hector=E2=80=99s name!&quot;</p><p>Felix had seen every face aro=
und him, and had particularly noticed a recent addition to his audience; bu=
t now he looked before him without appearing to fix his glance on any one. =
In spite of his cooling meditations an hour ago, his pulse was getting quic=
kened by indignation, and the desire to crush what he hated was likely to v=
ent itself in articulation. His tone became more biting.</p><p>&quot;He is =
before you, and is happy to bid you welcome. But may I inquire what brings =
you to Fort Reliance?&quot;</p><p>&quot;For God=E2=80=99s sake =E2=80=94 fo=
r the sake of the mercy which we daily pray for,&quot; said the kind hearte=
d old King to the Duke of Albany, &quot;let this be ended! Wherefore should=
 these wretched rags and remnants of humanity be suffered to complete their=
 butchery? Surely they will now be ruled, and accept of peace on moderate t=
erms?&quot;</p><p>Clara beckoned to Crayford to return to her.</p><p>&quot;=
There is but one thing I could never have forgiven you,&quot; replied Madge=
,=E2=80=94&quot;a death I did not share!&quot;</p><p>&quot;Why not?&quot;</=
p><p>Henry Smith, though angry, could scarce forbear a smile.</p><p>=E2=80=
=98That,=E2=80=99 thought Sir Lawrence, cryptically, =E2=80=98explains to m=
e why I never find a lost collar-stud. My friend the porter was so certain =
Jack would be at Newmarket, and not under that chest of drawers, that he to=
ok him for someone else when he came in.=E2=80=99</p><p>=E2=80=98Oh, Miss D=
unstable! I must read it all.=E2=80=99</p><p>=E2=80=98Dearest Ludovic, dear=
est Ludovic!=E2=80=99 and she got up and came over to him, =E2=80=98I do th=
ink so; I do, indeed.=E2=80=99</p><p>=E2=80=98Do you mean that you are goin=
g over at once?=E2=80=99</p><p>As Catharine passed along, she felt all the =
wild influence of the agitating scene, and it was with difficulty she forbo=
re from repeating the cries of lamentation and alarm which were echoed arou=
nd her. In the mean time, she rushed rapidly on, embarrassed like one in a =
dream, with a strange sense of dreadful calamity, the precise nature of whi=
ch she was unable to define, but which implied the terrible consciousness t=
hat the man who loved her so fondly, whose good qualities she so highly est=
eemed, and whom she now felt to be dearer than perhaps she would before hav=
e acknowledged to her own bosom, was murdered, and most probably by her mea=
ns. The connexion betwixt Henry=E2=80=99s supposed death and the descent of=
 Conachar and his followers, though adopted by her in a moment of extreme a=
nd engrossing emotion, was sufficiently probable to have been received for =
truth, even if her understanding had been at leisure to examine its credibi=
lity. Without knowing what she sought except the general desire to know the=
 worst of the dreadful report, she hurried forward to the very spot which o=
f all others her feelings of the preceding day would have induced her to av=
oid.</p><p>Mr Wace and Mr Pendrell clapped their hands, and the example was=
 followed even by most of the Dissenters. Philip was aware that he was doin=
g a popular thing, of a kind that Treby was not used to from the elder Deba=
rrys; but his appearance had not been long premeditated. He was driving thr=
ough the town towards an engagement at some distance, but on calling at Lab=
ron=E2=80=99s office he had found that the affair which demanded his presen=
ce had been deferred, and so had driven round to the Free School. Christian=
 came in behind him.</p><p>=E2=80=98Do, you mean, then, Miss Dunstable, tha=
t you=E2=80=99ll never marry?=E2=80=99</p><p>We must go back to our hostess=
, whom we should not have left for so long a time, seeing that this chapter=
 is written to show how well she could conduct herself in great emergencies=
. She had declared that after awhile she would be able to leave her positio=
n near the entrance door, and find out her own peculiar friends among the c=
rowd; but the opportunity for doing so did not come till very late in the e=
vening. There was a continuation of arrivals; she was wearied to death with=
 making little speeches, and had more than once declared that she must depu=
te Mrs Harold Smith to take her place. That lady stuck to her through all h=
er labours with admirable constancy, and made the work bearable. Without so=
me such constancy on a friend=E2=80=99s part, it would have been unbearable=
; and it must be acknowledged that this was much to the credit of Mrs Harol=
d Smith. Her own hopes with reference to the great heiress had all been sha=
ttered, and her answer had been given to her in very plain language. But, n=
evertheless, she was true to her friendship, and was almost as willing to e=
ndure the fatigue on this occasion as though she had a sister-inlaw=E2=80=
=99s right in the house. At about one o=E2=80=99clock her brother came. He =
had not yet seen Miss Dunstable since the offer had been made, and had now =
with great difficulty been persuaded by his sister to show himself.</p><p>T=
hese are statements of a certain quality, a quality that extends through a =
huge universe in which I find myself placed.</p><p>&quot;Hold thy peace,&qu=
ot; interrupted Eviot, &quot;and be thankful, I pray you, if you have any t=
hankfulness in you, that thy body is not crow=E2=80=99s meat and thy soul i=
n a place where water is too scarce to duck thee.&quot;</p><p>&quot;I am no=
t mistaken. I saw it with my own eyes. The day before yesterday, July 4th, =
there was positively no tide on the coast of Cape Bathurst.&quot;</p><p>&qu=
ot;Twenty-one? But you said twenty-five!&quot;</p><p>=E2=80=98Did he say no=
thing about me, father?=E2=80=99 said Esther, trembling a little, but unabl=
e to repress her egoism.</p><p>With her chin tilted up and all her body tau=
t against the tree trunk she stood, breathless from the darkness and the si=
lence and the stars. Ears of a weasel, nose of a fox to hear and scent out =
what was stirring! In the tree above her head a bird chirped once. The dron=
e of the last train, still far away, began, swelled, resolved itself into t=
he sound of wheels and the sound of steam, stopped, then began again and fa=
ded out in a far drumming. All hushed once more! Where she stood the moat h=
ad been, filled in so long that this great elm tree had grown. Slow, the li=
ves of trees, and one long fight with the winds; slow and tenacious like th=
e life of her family clinging to this spot.</p><p>&quot;Take my cab,&quot; =
said Amelius, &quot;and save time.&quot;</p><p>He went out, pausing at the =
door to grab playfully at his sister=E2=80=99s waist, and saying that he=E2=
=80=99d be back about midnight, hurried to Marjorie=E2=80=99s house, becaus=
e he had promised to take her to a show.</p><p>&quot;Isn=E2=80=99t that ter=
rible?&quot; she said, weakly, her hands trembling in a nervous way. &quot;=
Isn=E2=80=99t it dreadful? Isn=E2=80=99t there anything more you can do, tr=
uly?&quot; You won=E2=80=99t really have to go to prison, will you?&quot; H=
e objected to her distress and her nervous fears. He preferred a stronger, =
more self-reliant type of woman, but still she was his wife, and in his day=
 he had loved her much.</p><p>=E2=80=98Pray do,=E2=80=99 said Esther, colou=
ring. To relieve herself she took some work and bowed her head over her sti=
tching. It was in reality a little heaven to her that Felix was there, but =
she saw beyond it =E2=80=94 saw that by-and-by he would be gone, and that t=
hey should be farther on their way, not towards meeting, but parting. His w=
ill was impregnable. He was a rock, and she was no more to him than the whi=
te clinging mist-cloud.</p><p>&quot;Why not?&quot;</p><p>=E2=80=98None what=
ever,=E2=80=99 said Lucy. =E2=80=98He made me an offer and I refused him.=
=E2=80=99 This she said very sharply;=E2=80=94 more so undoubtedly than the=
 circumstances required; and with a brusqueness that was injudicious as wel=
l as uncourteous. But at the moment, she was thinking of her own position w=
ith reference to Lady Lufton =E2=80=94 not to Lord Lufton; and of her feeli=
ngs with reference to the lady =E2=80=94 not to the gentleman.</p><p>=E2=80=
=98Yes, I=E2=80=99m a working man; Sunday is my holiday,=E2=80=99 said Feli=
x, pausing at the door since the host seemed to expect this.</p><p>&quot;An=
d if I might suggest, Miss Dinny, a little sea air for you.&quot;</p><p>=E2=
=80=98What had I better do, Justinia? how had I better tell her?=E2=80=99 A=
nd then the two ladies put their heads together, bethinking themselves how =
they might best deprecate the wrath of Lady Lufton. It had been arranged th=
at Mrs Robarts should go back to the parsonage after lunch, and she had per=
sisted in her intention after it had been settled that the Merediths were t=
o stay over that evening. Lady Meredith now advised her friend to carry out=
 this determination without saying anything about her husband=E2=80=99s ini=
quities, and then to send the letter up to Lady Lufton as soon as she reach=
ed the parsonage. =E2=80=98Mamma will never know that you received it here,=
=E2=80=99 said Lady Meredith. But Mrs Robarts would not consent to this. Su=
ch a course seemed to her to be cowardly. She knew that her husband was doi=
ng wrong; she felt that he knew it himself; but still it was necessary that=
 she should defend him. However terrible might be the storm, it must break =
upon her own head. So she at once went and tapped at Lady Lufton=E2=80=99s =
private door; and as she did so Lady Meredith followed her.</p><p>This real=
 vagueness of class terms is equally true whether we consider those terms u=
sed extensively or intensively, that is to say whether in relation to all t=
he members of the species or in relation to an imaginary typical specimen. =
The logician begins by declaring that S is either P or not P. In the world =
of fact it is the rarest thing to encounter this absolute alternative; S1 i=
s pink, but S2 is pinker, S3 is scarcely pink at all, and one is in doubt w=
hether S4 is not properly to be called scarlet. The finest type specimen yo=
u can find simply has the characteristic quality a little more rather than =
a little less. The neat little circles the logician uses to convey his idea=
 of P or not P to the student are just pictures of boundaries in his mind, =
exaggerations of a natural mental tendency. They are required for the purpo=
ses of his science, but they are departures from the nature of fact.</p><p>=
&quot;Reckon with my father about that,&quot; answered Conachar; &quot;he w=
ill pay you gallantly =E2=80=94 a French mutton for every hide I have spoil=
ed, and a fat cow or bullock for each day I have been absent.&quot;</p><p>&=
quot;None of that! none of that!&quot; he said, glowering under his strange=
, sad, gray brows. &quot;I can=E2=80=99t stand it! Don=E2=80=99t tempt me! =
We=E2=80=99re not out of this place yet. He=E2=80=99s not! You=E2=80=99ll c=
ome home with me now.&quot;</p><p>When general attention was called to Chri=
stian, young Joyce looked down at his own legs and touched the curves of hi=
s own hair, as if measuring his own approximation to that correct copy of a=
 gentleman. Mr Wace turned his head to listen for Christian=E2=80=99s answe=
r with that tolerance of inferiority which becomes men in places of public =
resort.</p><p>&quot;Just that,&quot; replied Cowperwood, hearkening to them=
. &quot;Have you heard the news?&quot;</p><p>&quot;Not so,&quot; said Catha=
rine; &quot;I have done him too much grace already. When he has seen the er=
rant damsel safe home, it will be time enough to claim his reward.&quot;</p=
><p>=E2=80=98Let=E2=80=99s go and look at photographs, and refrain from mix=
ing our countries or our drinks.=E2=80=99</p><p>&quot;You can=E2=80=99t,&qu=
ot; growled Jack Muskham; &quot;the whole thing=E2=80=99s of a piece. The p=
oint is simply: Is he fit to be a member here or not? I ask the Chairman to=
 put that to the meeting.&quot;</p><p>=E2=80=98Well, don=E2=80=99t you thin=
k he must have been mad when such an idea as that came into his head? But y=
ou don=E2=80=99t believe it; I can see that. And yet it is as true as heave=
n. Standing exactly here, on this spot, he said that he would persevere til=
l I accepted his love. I wonder what made me specially observe that both hi=
s feet were within the lines of that division.=E2=80=99</p><p>=E2=80=98They=
 have paid it,=E2=80=99 said Mr Lyon, opening his desk. =E2=80=98I have it =
here ready to deliver to you.=E2=80=99</p><p>They do not stand in any attit=
ude of antagonism. A religious system so many-faced and so enduring as Chri=
stianity must necessarily be saturated with truth even if it be not wholly =
true. To assume, as the Atheist and Deist seem to do, that Christianity is =
a sort of disease that came upon civilization, an unprofitable and wasting =
disease, is to deny that conception of a progressive scheme and rightness w=
hich we have taken as our basis of belief. As I have already confessed, the=
 Scheme of Salvation, the idea of a process of sorrow and atonement, presen=
ts itself to me as adequately true. So far I do not think my new faith brea=
ks with my old. But it follows as a natural consequence of my metaphysical =
preliminaries that I should find the Christian theology Aristotelian, over =
defined and excessively personified. The painted figure of that bearded anc=
ient upon the Sistine Chapel, or William Blake=E2=80=99s wild-haired, wild-=
eyed Trinity, convey no nearer sense of God to me than some mother-of-pearl=
-eyed painted and carven monster from the worship of the South Sea Islander=
s. And the Miltonic fable of the offended creator and the sacrificial son! =
it cannot span the circle of my ideas; it is a little thing, and none the l=
ess little because it is intimate, flesh of my flesh and spirit of my spiri=
t, like the drawings of my youngest boy. I put it aside as I would put asid=
e the gay figure of a costumed officiating priest. The passage of time has =
made his canonicals too strange, too unlike my world of common thought and =
costume. These things helped, but now they hinder and disturb. I cannot bri=
ng myself back to them . . .</p><p>=E2=80=98Let me beg of you to put it asi=
de till after tea, father,=E2=80=99 said Esther. =E2=80=98However objection=
able Mr Holt may find its pages, they would certainly be made worse by bein=
g greased with bread-and-butter.=E2=80=99</p><p>The next week the traps wer=
e in full activity. Some twenty martens were taken, in all the beauty of th=
eir winter clothing, but only two or three foxes. These cunning creatures d=
ivined the snare laid for them, and scratching up the ground near the trap,=
 they often managed to run off with the bait without being caught. This mad=
e Sabine beside himself with rage for,&quot; he said, &quot;such a subterfu=
ge was unworthy of a respectable fox.&quot;</p><p>Mrs. Farnaby was still ob=
stinate. &quot;You can go if you like,&quot; she said; &quot;I shall stay h=
ere.&quot;</p><p>=E2=80=98O, I suppose Johnson will bear a kick if you bid =
him. You=E2=80=99re his principal, I believe.=E2=80=99</p><p>&quot;The Pole=
, madam, is probably not the coldest point of the globe, for most navigator=
s agree that the sea is there open. From certain peculiarities of its geogr=
aphical position it would appear that a certain spot on the shores of North=
 Georgia, 95=C2=B0 longitude and 78=C2=B0 latitude, has the coldest mean te=
mperature in the world: 2=C2=B0 below zero all the year round. It is, there=
fore, called the =E2=80=98pole of cold.=E2=80=99 &quot;</p><p>As the launch=
 was blotted out in the haze we squelched past sugar-cane crops and fat pig=
s, past the bleak cemetery of dead soldiers on the hill, across a section o=
f moor, till we struck a hill-road above the sea. The views shifted and cha=
nged like a kaleidoscope. First a shaggy shoulder of land tufted with dripp=
ing rushes and naught above, beneath, or around but mist and the straight s=
pikes of the rain; then red road swept by water that fell into the unknown;=
 then a combe, straight walled almost as a house, at the bottom of which cr=
awled the jade-green sea; then a vista of a bay, a bank of white sand, and =
a red-sailed junk beating out before the squall; then only wet rock and fer=
n, and the voice of thunder calling from peak to peak.</p><p>Such were the =
thoughts which occupied his mind, when, as he opened his door to issue fort=
h, the person dearest to his thoughts, but whom he certainly least expected=
 to see, was present to his eyes, and dropped into his arms.</p></font></p>

