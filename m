Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 055B7CD056A
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 19 Dec 2025 15:44:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 565A710EC47;
	Fri, 19 Dec 2025 14:44:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AxqCOibF";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA7D810E49C;
 Fri, 19 Dec 2025 14:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766155489; x=1797691489;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=8qVMEdRO6zargWeklAyqQcbvTOfw1khFv+G7j2pF2lk=;
 b=AxqCOibFzK2gwMA8/lHxhb3LtC1ONeyO3IsQ8mdGzlp9pXNz9qCtS2Ob
 kss9ibk4cLx7HXps6rc+F4cp+a2kTC0TvQEXhiU3vh+b/SKCN2XRgSAfx
 hQBUefNRf/JJQx7kNgeu2Vkw49rhU1jIxeF8x6DmERW8d2T+dyGYOZKVE
 NavgxwuCICmfMjiiqIunMGPtyxBEgzusCe/Th0XqZPGrCPs9PEr/gttLU
 1cPoWeScyUm9YWscMbOES8/WcR3731/DV8P/2TCRPxH5xMpfiJfA9oTcx
 dz/fAEGXn/P8POHgHEl6aFofxJz/JuzKoDJC5Zi4iXYHxfyJcoI0tv/7w A==;
X-CSE-ConnectionGUID: KOhydO8MS9aireEDUR6xPw==
X-CSE-MsgGUID: ozrSvxzEQbOcgAgkYr7BnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="78750003"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="78750003"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 06:44:49 -0800
X-CSE-ConnectionGUID: g5qIx8emSMWS6jF00U0J5A==
X-CSE-MsgGUID: grASrbjqSqeLPZ7d9tgqNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="199699322"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 06:44:49 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 06:44:48 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 19 Dec 2025 06:44:48 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.10) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 06:44:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FNey/GjIJv4lL57cBcje3iUPCPPb/k1O1sbdf9f0IupzMwbIKy4g/Imuj3giUPHhxuhD0IloKDp7pN+ObnwRqofXOsuZtP0pAa7xcJtk0/ZM9V0c2whAqLvYyFIumy0U/XcMWtYiQD71Z2cwoF8dPnAzx1h0NasW5Uew09YCOyjcF+aT1FIrmXJ8XxAqgZQ+3j8m9lr9iWM2Zl/gKE+Rx+o9PPlAfIEN4JgflY2Dw47QW4gds5QOtA66JbvnnxPaHLWcaslHuMfLx2avs0wj3enCvFJG18GMIliyU96BO/2UP2emDtSLj48bBST58QOPISjRjV1QmcUOF+9kSWqYBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jncpj6N4AhzmZkX4OHl7bhqt+7hlA+DiKMqw1MPexqA=;
 b=hiu8Kzutip6dLtMRzQPDB7zBukOi72B7E1zkmm2f0BhTjTqogCzkr0i3uMsIo1soD2mEWEtm88IhYT2aZ6ikOcLLlMVWnO6oF+58fp0u5RLw2UW4Z+EOJS+q2xhCPf15Vlm/qdN1Q9FnyIrx0hPAYTcaOjO6BAh8ZEYJgj2GUhCygvotXZMEZVDPbCH/VszBv83nqT5dA3/6J/pptKBBJ8FFXbpiqZnH9Z7is+BGaYPGtc4/wFJrsdeJ1BnoZaPgR2HRUiG3hSkjtf3ut39htkV1bBkVEpXpm2d4u1P8LJwSKgxn6fNObHLnDntwcYNoyKNJKukS5gRAuLbGnbVMbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by SJ0PR11MB5008.namprd11.prod.outlook.com (2603:10b6:a03:2d5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 14:44:47 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.9434.009; Fri, 19 Dec 2025
 14:44:47 +0000
Message-ID: <3c2657d2-b04b-4175-9259-afc4d8e68fe2@intel.com>
Date: Fri, 19 Dec 2025 20:14:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] drm/i915/gvt: Change for_each_pipe to use pipe_valid
 API
To: Jani Nikula <jani.nikula@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>, <intel-gvt-dev@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
References: <20251219060302.2365123-1-ankit.k.nautiyal@intel.com>
 <20251219060302.2365123-5-ankit.k.nautiyal@intel.com>
 <6e7a241b3c0244bf4d2ad37dc7fca69a3754405d@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <6e7a241b3c0244bf4d2ad37dc7fca69a3754405d@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0068.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::14) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|SJ0PR11MB5008:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d34329e-ab18-42f6-1da8-08de3f0d27b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a1RGZUE1Z2cwV0hkZkRTNTFKSWt5VExwNFZManJlc0hPdFBSUHRXcDBsWTZH?=
 =?utf-8?B?cUo3dlVMMEhNRE4rNDNXa1FNNThaRFlQRmYzcHJpcTdYMkRPRUkybnllbVJ1?=
 =?utf-8?B?dnFuanI4YmUraXhIUTJReDNXc2JJUjl0MUxCd1BnZ0lmMUpqemFSOHdrdlRt?=
 =?utf-8?B?VDB6R09PK2ZZSjVwWENMTU03ODZOMzlnOVREM0luSkJ1TmUzVDluSFAvSGl2?=
 =?utf-8?B?N1FkK2NWYUc0dXVnNWhOL0dwMFhtV2dVVGVzZ1FrU2tZaGcyTVdtRVgzc1p6?=
 =?utf-8?B?dHR5R1YwSklZZlp5UWV5REk3RWdKWi93Um1YaVRtdzJrcXFkOTlHWlkxWmVq?=
 =?utf-8?B?RzJ5T21oUzFPSG5Iak5wR08wYzhXQTk5OHpVbVRKNFpZK3VnYnRWZDhwNnht?=
 =?utf-8?B?cVVmS1VEc0NXMEx4cU1Seit4MHliblRhaklidkJ2MDJMWkoraDRGUjBuK0VB?=
 =?utf-8?B?QWlHSkUvcmhmSkJxNWlES1BEcVVmak9pT1hudUZvbW1SV2lwdVh0eWhsZWZs?=
 =?utf-8?B?NUxpUEw0VXlSTytXNmNJOE1zcG9WREI0TlpRZWdkQjRxZzBCQ3dMNUdsTGNK?=
 =?utf-8?B?dGJJeXZWV3grYzlFcTM0T0JrcU1Zang3VUpEb0VQbm1qVXhlcy9YL1ZkbDdp?=
 =?utf-8?B?RXBDZEtxK3J0ZDRwanQ2VGpHTlpWS2lIMlNjN2lNTkl3Ry9SWDFoTFZpT0xy?=
 =?utf-8?B?M3RZN1lqVDdCenJCVGpQRE1BYTEzUWFRQ3owazVvQ0gwd0IyZTlqaUVxUjBa?=
 =?utf-8?B?ckVTb1ZGRjYzaXJFbE8xU2lkSExuU3FXZEVVUVBCUmY3UW12YkF0dXZWMTI2?=
 =?utf-8?B?bTVLQ0w3Vkd0cnk0c25tcUxVMTkrNUNyWXM2RnJReWtwRjRxcU9QeTgxYW1p?=
 =?utf-8?B?d3Zxc0pkaEttTG1PTC9HMTVVbWhtRXlQWEp0QndNN1pUQS95Q010N2ZnNk1j?=
 =?utf-8?B?UjFSYnZ3WVRTOXBTcHdJVEtncTdOWTZVL2pmaVcyTEtqenVhRmUwNGNWcUtx?=
 =?utf-8?B?N3B6SGZjTGVueHJVbzFlaGhTcjA5eVJHRXloN0dsMmpWcVgrT0Iyd0tNRWpG?=
 =?utf-8?B?ZUc0cHRVQkhRYW04Z1Y1K1Btbi9pWXFRbGF4Tzg4UWFZY214S0V1SENjOTJD?=
 =?utf-8?B?MFN5dW00VHp3S3IzSG0wdUs4SXJEQ3hyWnRiYkVuNW9QQStMZDYyeXBJQ2x1?=
 =?utf-8?B?RVl1K2ZVdVZPK2U0UEptZlZCTnB0YW9PUzlKeGVhOE8zMnNkRFpCVzhPalNF?=
 =?utf-8?B?L1RzVjhwVnBiaW95Q2NoOVVFNHpPUFUwVVVJemdkNkVNcENmRDRjN0t5TVFC?=
 =?utf-8?B?OW51Y2Z5dUg4UVpJbStDVncyaS9VMXpvdWNqanBvK0gvVWprMFFpdjdFcE9C?=
 =?utf-8?B?L1FjOVZyRS9TOU90eXZMbWRwcjkzZzRYK0pIV3h0R3VrUGsvMVBhaEJRcHY1?=
 =?utf-8?B?NHpKamdneWMrc3BWK2U1T0ptOEtYSTNrbWFEY1phWmVsUlNxT2sva2lBU2Rz?=
 =?utf-8?B?TDZjRVZ6dTVnVWlLdlZhKzJUZkxvRXFhOEsySHJXSFNaOUhiTE5CbUIvaDcr?=
 =?utf-8?B?U3BLTXp5clJhN0NTUll4RGZJSVhuQmY5a2FBWGhMemFUWVFMMzA5Wm15VlI3?=
 =?utf-8?B?cTk2eVJMaXd1Uk11YTFLY1VoMzRWTjVDQlF2RHdBYjh4UXZTbFRybkwxNGJJ?=
 =?utf-8?B?L1hMQVpYTVNOL3B4a2h4bWovZ0JETVM4ZEJzSVY0NnhDangvd2wyQnBnblpr?=
 =?utf-8?B?VHVNQ2VER1o5MkJqbE5zQTlPRCtrR0RZd0UvcmZpRUpVY3hRb0NleWg4QmVF?=
 =?utf-8?B?S2ROWmw0bFMvNDFiVnk4THE2aU1WVktmcGZ4dy9pM2doWitFRzNrMnBFdkRz?=
 =?utf-8?B?TnU3b0tCOU4xRlRxeDB3UWJyNGc5YkVRNWU1eng0RG5yZ0lhK3FkdUhYMXJz?=
 =?utf-8?Q?+EFqGjHVBRrl3BVzCLXIfALDUulpGfdB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MUJmcmVlUWZFMERTaXVnSFM1RDVxVTIwN0pMK0x0WDRHb09zQ0VOZDF1RHZj?=
 =?utf-8?B?MHh4MGg3QmZXR2ZUbHowVXd6ZHNhTGlUTjZOclVDaW8ydk1HRDNkM09DbEZn?=
 =?utf-8?B?UEM4TEZoVlVzbDBJOXVGTjlORFlaa3hYaG50eEZ3MXQ0M0xXOTFhMGZVSDZN?=
 =?utf-8?B?K1BiTFNoRUxrK0VtUUROdUJxYXcvM0pjQ3VqdG96WEM4ajhySWhxUVlxOHNT?=
 =?utf-8?B?ams3MHRaU0VDUmVKbDQva0w2dUI4Y3JEaWNONUxEakdxNUNSMU04V1pPYmVO?=
 =?utf-8?B?aEgwZmhMN2wyaFRmL2tCdHRqT2lDVGxoMm84TDZrY3JBSEQ3MXc2OXFlZnAv?=
 =?utf-8?B?WkhQRWRQYlBGL3FzMzlWSytwcFQ3dEwxYWVqbWN2aTNUanBESFNRUGgrdHhj?=
 =?utf-8?B?ZTRhMVl6RHNsVjlNbWpkQTBVRGQ5WjlhT09YY0lTQThUbVdOcUx3ZTFxTGlQ?=
 =?utf-8?B?c2Y3cXFhaTVicWhXQ2ZDenh0TkJsSEp4UDlTbFFJOHIrckdHcVlkM1MyZXFP?=
 =?utf-8?B?amxRSEFkc1JOcDc0dTY0Ky8rdk1yeFlBSUQ5QnBpc1lXMzNTRnNUTDg1ZEdY?=
 =?utf-8?B?czY0THVPRWZSY2JESzNBV3M0S1BhenRhemxhdkkyaEZBUnppTHQ4UUNvRmNU?=
 =?utf-8?B?a01McWxEcVl3V1FQU1JiUVowbzdkaVNOQW00QWdJVEY4SUxYNGwyZlRTVUZj?=
 =?utf-8?B?eHROY3QySnpBdTJYNnJkcHZ2eEtQaDNjNGVvUXp1R0tnd2R1YnIzZjROR2Ji?=
 =?utf-8?B?U0srRUg5elozMmdjS2VnMWlVNDl4akZobXFVUDBjd0lOOWZmTWdVMHhpNDdo?=
 =?utf-8?B?YW5oaTkyN0VMeDYzRk1rY1ZvbnZudXFLOThiL2k4c3NEZmJYdzhTTm9lcTB1?=
 =?utf-8?B?MkpZQWtTYmYyUTRCd3VwRHlnN2hHT091eUttalZDZ1BaWERCM2NoeHpwTno2?=
 =?utf-8?B?RVF2NFNQV2NQR21KUk01WWxPajNFdUhSSXl2VXE4VGtuc2RBQ3VhNklwSE5u?=
 =?utf-8?B?VGNHenlSUDNSNTJjYnArNmR3NjFWcGJSNlVSamNqeU9QKzMxL0loYkxSRVU3?=
 =?utf-8?B?ZjJGZksxZ1hXUGRFUVhReDdhS3lOQUd0QUgzZmRSYTFtak1MbkhTaCtROGRl?=
 =?utf-8?B?QWI1QkszZHlUc29xTGI3Y0JhU1ZXK2paYTBzQSt5ZUdjRUhBcW91Zm5XSmJO?=
 =?utf-8?B?ZTE0NVRBRy8vNXpNVStpWXJNV1B2NzZ4NHNPTjFzVlVVdEZCSkl5Zllhb1hP?=
 =?utf-8?B?SDNMa2dIeFdKclpZa3FpeTZWd3JIZWlRMXdsTFd3elRDazFYYUJXeStpYmdN?=
 =?utf-8?B?b0NKMWxIU3JxL0NsYVduV2xzeWhBQlFXOUdHNUM5b1h2VUx0MmlnUnc2MThr?=
 =?utf-8?B?TG9JejBEL0lxZFY3MkVoejF2MXRUcFlSNkRrUXlWaVJ3ZWZLQ1BnTzcydDlP?=
 =?utf-8?B?a2NSTW02UjYwemJidnVPWXZtR05qSmxhS2FLdnE2VEpxSkdhNUhyYjJ4bzdX?=
 =?utf-8?B?WnFETGJLMEVyNFpQREZVSHRaQVYrMHMvTVpMeStiR0xSNld0QjI2SXBaRzBn?=
 =?utf-8?B?b0NTeUpIb3pmemNWL2J3SWE2ZFZ3T3ZGWWFacHN1QkpaUXF6R0wwd2JDL255?=
 =?utf-8?B?Qm8rb2VzaXR0S3crUzY3SnFxUHlZZlIzUjdyVmR1MVFjNkRvYjFtUlI2c25O?=
 =?utf-8?B?UHRZR2xFanc4UjNjOGh3dlFkQlRFQzlyblJNbGo0WmpYcmpxV1hoN0l1V2xi?=
 =?utf-8?B?M2JvOXZhTjhlTGdIYUk5VGhKdnQrdkJmYlZCVTBTbURMZXViVUU1dlBkM0NN?=
 =?utf-8?B?NXdFbDN5QkdzZWwrcG1WeHRLU1EvTFlhOTZ3Ri8zRHF6QWFQUDlOTFJPR1ZQ?=
 =?utf-8?B?SnBoMi9DQzNRZFg2VUxiNmJUSTVsY3lPY3l3L1RET20wUXpjQ1FNWSsxREJD?=
 =?utf-8?B?aWFKVWl6ckZDd0IwcCtoQ1VJNWN6emNnV1M5MGtWeHd3V3kvaHdyUTNGMk9W?=
 =?utf-8?B?MHl1VnNxME5KSThzc3dGeWxubWlFaVV4RzdONWE1eXJzanBjMENFa2h3U0VQ?=
 =?utf-8?B?aUtha3R4dllhOEtaSUc4ODF1QzBkNWlEQXFhUE55dVAxTzV5YmhzclB4dzRm?=
 =?utf-8?B?UkgvRm9WaUVidVV0T1Q2UEhURFR2TjdkdW41STc3QWsxR2U2RHlDVmJnQ1Fv?=
 =?utf-8?B?Nnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d34329e-ab18-42f6-1da8-08de3f0d27b5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 14:44:47.0814 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eZ5NdQXzzvjVSvsCaKMe+p5oqzXbRA5D4FVXGhhQi7eSZU9/IurlGFIGQbvDJzWw/paycGH24yUktF9K3gyjrapzRymUAJF+nIpPQzjlXfg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5008
X-OriginatorOrg: intel.com
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


On 12/19/2025 6:04 PM, Jani Nikula wrote:
> On Fri, 19 Dec 2025, Ankit Nautiyal <ankit.k.nautiyal@intel.com> wrote:
>> Add a new API to check if a given pipe is valid using
>> DISPLAY_RUNTIME_INFO() for GVT.
>>
>> Update GVT to use this API instead of accessing
>> `DISPLAY_RUNTIME_INFO->pipe_mask` directly in the `for_each_pipe` macro.
>>
>> Since `for_each_pipe` is defined in i915/display/intel_display.h, which
>> also contains other macros used by gvt/display.c, we cannot drop the
>> intel_display.h header yet. This causes a build error because
>> `for_each_pipe` is included from both i915/display/intel_display.h and
>> gvt/display_helpers.h.
>>
>> To resolve this, rename the GVT macro to `gvt_for_each_pipe` and make it
>> call the new API. This avoids exposing display internals and prepares for
>> display modularization.
> I'm fine with the separate name for this, to underline the difference.
>
> However, I think in the long run gvt should include fewer things from
> display/. This may mean refactoring display headers a bit to limit the
> exposure. Like, there's current intel_display_types.h and
> intel_display.h includes, and we shouldn't have them, but it's beyond
> this series.

I agree.. I have realized this while dealing with the problem with 
for_each_pipe.

display/intel_display_core.h was one such file, now that is removed.

Anyways, will get some things started on intel_gvt_mmio_table.c stuff next.


Thanks for the reviews!

Regards,

Ankit


>
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
>
>> v2:
>>   - Expose API to check if pipe is valid rather than the runtime info
>>     pipe mask. (Jani)
>>   - Rename the macro to `gvt_for_each_pipe` to resolve build error.
>> v3:
>>   - Use EXPORT_SYMBOL_NS_GPL(..., "I915_GVT"); (Jani)
>>   - Use enum pipe at call sites instead of casting in the macro. (Jani)
>>
>> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>> ---
>>   drivers/gpu/drm/i915/display/intel_gvt_api.c |  9 +++++++++
>>   drivers/gpu/drm/i915/display/intel_gvt_api.h |  1 +
>>   drivers/gpu/drm/i915/gvt/display.c           | 10 +++++-----
>>   drivers/gpu/drm/i915/gvt/display_helpers.h   |  4 ++++
>>   4 files changed, 19 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_gvt_api.c b/drivers/gpu/drm/i915/display/intel_gvt_api.c
>> index b1bfe4843135..a69e249395ae 100644
>> --- a/drivers/gpu/drm/i915/display/intel_gvt_api.c
>> +++ b/drivers/gpu/drm/i915/display/intel_gvt_api.c
>> @@ -32,3 +32,12 @@ u32 intel_display_device_mmio_base(struct intel_display *display)
>>   	return DISPLAY_MMIO_BASE(display);
>>   }
>>   EXPORT_SYMBOL_NS_GPL(intel_display_device_mmio_base, "I915_GVT");
>> +
>> +bool intel_display_device_pipe_valid(struct intel_display *display, enum pipe pipe)
>> +{
>> +	if (pipe < PIPE_A || pipe >= I915_MAX_PIPES)
>> +		return false;
>> +
>> +	return DISPLAY_RUNTIME_INFO(display)->pipe_mask & BIT(pipe);
>> +}
>> +EXPORT_SYMBOL_NS_GPL(intel_display_device_pipe_valid, "I915_GVT");
>> diff --git a/drivers/gpu/drm/i915/display/intel_gvt_api.h b/drivers/gpu/drm/i915/display/intel_gvt_api.h
>> index e9a1122a988d..a53687f7d934 100644
>> --- a/drivers/gpu/drm/i915/display/intel_gvt_api.h
>> +++ b/drivers/gpu/drm/i915/display/intel_gvt_api.h
>> @@ -16,5 +16,6 @@ u32 intel_display_device_pipe_offset(struct intel_display *display, enum pipe pi
>>   u32 intel_display_device_trans_offset(struct intel_display *display, enum transcoder trans);
>>   u32 intel_display_device_cursor_offset(struct intel_display *display, enum pipe pipe);
>>   u32 intel_display_device_mmio_base(struct intel_display *display);
>> +bool intel_display_device_pipe_valid(struct intel_display *display, enum pipe pipe);
>>   
>>   #endif /* __INTEL_GVT_API_H__ */
>> diff --git a/drivers/gpu/drm/i915/gvt/display.c b/drivers/gpu/drm/i915/gvt/display.c
>> index 9d6b22b2e4d0..1d0c581a8ccc 100644
>> --- a/drivers/gpu/drm/i915/gvt/display.c
>> +++ b/drivers/gpu/drm/i915/gvt/display.c
>> @@ -188,7 +188,7 @@ static void emulate_monitor_status_change(struct intel_vgpu *vgpu)
>>   {
>>   	struct drm_i915_private *dev_priv = vgpu->gvt->gt->i915;
>>   	struct intel_display *display = dev_priv->display;
>> -	int pipe;
>> +	enum pipe pipe;
>>   
>>   	if (IS_BROXTON(dev_priv)) {
>>   		enum transcoder trans;
>> @@ -200,7 +200,7 @@ static void emulate_monitor_status_change(struct intel_vgpu *vgpu)
>>   			  GEN8_DE_PORT_HOTPLUG(HPD_PORT_B) |
>>   			  GEN8_DE_PORT_HOTPLUG(HPD_PORT_C));
>>   
>> -		for_each_pipe(display, pipe) {
>> +		gvt_for_each_pipe(display, pipe) {
>>   			vgpu_vreg_t(vgpu, TRANSCONF(display, pipe)) &=
>>   				~(TRANSCONF_ENABLE | TRANSCONF_STATE_ENABLE);
>>   			vgpu_vreg_t(vgpu, DSPCNTR(display, pipe)) &= ~DISP_ENABLE;
>> @@ -516,7 +516,7 @@ static void emulate_monitor_status_change(struct intel_vgpu *vgpu)
>>   		vgpu_vreg_t(vgpu, PCH_ADPA) &= ~ADPA_CRT_HOTPLUG_MONITOR_MASK;
>>   
>>   	/* Disable Primary/Sprite/Cursor plane */
>> -	for_each_pipe(display, pipe) {
>> +	gvt_for_each_pipe(display, pipe) {
>>   		vgpu_vreg_t(vgpu, DSPCNTR(display, pipe)) &= ~DISP_ENABLE;
>>   		vgpu_vreg_t(vgpu, SPRCTL(pipe)) &= ~SPRITE_ENABLE;
>>   		vgpu_vreg_t(vgpu, CURCNTR(display, pipe)) &= ~MCURSOR_MODE_MASK;
>> @@ -669,10 +669,10 @@ void intel_vgpu_emulate_vblank(struct intel_vgpu *vgpu)
>>   {
>>   	struct drm_i915_private *i915 = vgpu->gvt->gt->i915;
>>   	struct intel_display *display = i915->display;
>> -	int pipe;
>> +	enum pipe pipe;
>>   
>>   	mutex_lock(&vgpu->vgpu_lock);
>> -	for_each_pipe(display, pipe)
>> +	gvt_for_each_pipe(display, pipe)
>>   		emulate_vblank_on_pipe(vgpu, pipe);
>>   	mutex_unlock(&vgpu->vgpu_lock);
>>   }
>> diff --git a/drivers/gpu/drm/i915/gvt/display_helpers.h b/drivers/gpu/drm/i915/gvt/display_helpers.h
>> index 46c5192a79a7..7c6e15aa280a 100644
>> --- a/drivers/gpu/drm/i915/gvt/display_helpers.h
>> +++ b/drivers/gpu/drm/i915/gvt/display_helpers.h
>> @@ -42,4 +42,8 @@
>>   #define INTEL_DISPLAY_DEVICE_CURSOR_OFFSET(display, pipe) \
>>   	intel_display_device_cursor_offset((display), (pipe))
>>   
>> +#define gvt_for_each_pipe(display, __p) \
>> +	for ((__p) = PIPE_A; (__p) < I915_MAX_PIPES; (__p)++) \
>> +		for_each_if(intel_display_device_pipe_valid((display), (__p)))
>> +
>>   #endif /* __DISPLAY_HELPERS_H__ */
