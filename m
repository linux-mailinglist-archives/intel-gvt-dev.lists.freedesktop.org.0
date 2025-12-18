Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6563ACCBB21
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 18 Dec 2025 12:58:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4339110E3FF;
	Thu, 18 Dec 2025 11:58:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X8abTVBp";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED4ED10E3FF;
 Thu, 18 Dec 2025 11:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766059093; x=1797595093;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=tu8R8diCLhVSFh/Zx20MO22eOJNrYln3GYEhVUTDs5I=;
 b=X8abTVBpAi6oMeyTQsSTpzbXb4+702g2gIBUl1XXAC2nTvkU5H7dVqLq
 qyrW26NeVsVb0kINjxJVYc0IemDTnbplZ9y9wiFGO1vA8Yr1l9hGUZppI
 u8N+30aZH4RNWRxr0IzjH3F9ViI4SGIae92hi/OWQmEy3eTYIO3OvGp9S
 WUk8qBAhM6Jl6MmlYW9WdX6kDIkZ7Kd2+Y0KhFRgwTFb0Pge3Y+VA/mLB
 LRI0VPN0Bqi/cxLpBtYLS9wDp761Jn5Bvk5rgWfY5E85srJ38Ww5ZoH/1
 se+Smv0tHws7VuggMVvtGE90R1UvF/nVBvmgpkJpDsNHKQZjBVhCVCPDp g==;
X-CSE-ConnectionGUID: SLgyhuVMR0ScquuplrJFAw==
X-CSE-MsgGUID: +IsSwml7SLyDO3kfyQ3qeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="90667724"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="90667724"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 03:58:13 -0800
X-CSE-ConnectionGUID: hElvF2+tS0qTTGM/SXuRJA==
X-CSE-MsgGUID: bDs/NvWdTZigR6d1Z4WKFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="203083387"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 03:58:13 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 03:58:12 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 18 Dec 2025 03:58:12 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.9) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 03:58:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XXvoWL9OdE5/25MIuEfI9ZeAzXpPIP4YIMWAD6Oe1wXqqi36ijYRJ5jCHBzj9EkYuu8aB3bq4LIh9K9dz5ATwztyN5zRZ35eWCTvL6nJzEtCMg/r/+kyH3/BWne7BFwaT+Tyi+tRAEmhaJ/lPXpEsjSaYQkHw6UKcwUxft1AF4cZWJs5XevcTAIasC41TbDZKGbHT+UI1rsf4M8Ls3W7nigjq31+axbRFxZfklJncSrD23CkFmxGuRwUg1AWix8G46Ou0X22Z/RDGq+mwv+30h9OulmuZEdeeRvyrpjFo3sKk9Kbku8oDboTxz8PgazKvJbPdkSn5Iibc9bde9UUEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IabXOiRJf2nlvaJfMVKYKE0iR6sfFdk3KegjlMOK2mE=;
 b=RIVqEnbMGkzanFXwsgL06fwkGZSoFBa7LfwQhHU7KxA/lopgn5S5lJ3X1EnC5s4P23v/CNejeamSqKKL6N2LAG476pWgrVrPjVKUIY+0bIhARRmbeXWSSHTJcA2fStFWia/RMl8tC49kke+ViPMGO3jM4zCxo6C/CGGZiI9d0hTAhz+TierSnJjEyE8LYkPtJKP8RLnqzHoOIB+5Tz54EkgsLBWBKJ/4l4O0D2UEsDdLXAFd2EAyzDX209G74dIi4/85HEEiX47eOYLu+WFEwcIzqtq4aXvK8e2bhLZca6kMMK9VGhSm5zdNy9L0lTuEstjREcu9WNhQ/c413jAasA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by DS7PR11MB6126.namprd11.prod.outlook.com (2603:10b6:8:9e::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6; Thu, 18 Dec 2025 11:58:04 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 11:58:04 +0000
Message-ID: <045818f0-3e1c-4531-86d5-d9233201b36d@intel.com>
Date: Thu, 18 Dec 2025 17:27:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] drm/i915/gvt: Change for_each_pipe to use pipe_valid
 API
To: Jani Nikula <jani.nikula@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>, <intel-gvt-dev@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
References: <20251218082302.2327243-1-ankit.k.nautiyal@intel.com>
 <20251218082302.2327243-6-ankit.k.nautiyal@intel.com>
 <fab98bc3d1034b8752a151a026c78370b6662ac3@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <fab98bc3d1034b8752a151a026c78370b6662ac3@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0009.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:176::13) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|DS7PR11MB6126:EE_
X-MS-Office365-Filtering-Correlation-Id: 8df1b338-3df3-437e-b4b4-08de3e2cb322
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y0tLSDZodytMeDJqS3RTVS9xZmJMZU1WbkRqbmhVN21ZY0IxUW4xUTlqQ09H?=
 =?utf-8?B?S1l2S3pGSGNUeGZsSk54YjJJZGlOYTRoSkNMd0FNbkpLUWFoYWZzNEdvZU14?=
 =?utf-8?B?bkc2QmhFZVVCN2Uya3ZaRVBhQy9zMzhLRmNRZjVPQlc0SXBjZVZuQnh2aWdQ?=
 =?utf-8?B?RjdrWGtLSlFPSVY2eTIvSEVTdnZlZ2d4cU1ycklveFl0TVlkQ3ExUS80WXRG?=
 =?utf-8?B?SG9QN2YvRVYvNC9rSU5XR1pnelp0Q0VjakFVNjNxR1ljK2lkY1NzOC9tQ0s2?=
 =?utf-8?B?M0Y5b3VGem1CQXFMcXFHWnlpb3NrdjJGMHJBWUtzY1pEb3ZhOVNteU9YZTc4?=
 =?utf-8?B?SlNhMmdwQ1pTRTMzd2dCL3gzK1RZR1VVbUc1QUN0aVBxV0VnaFJ3WUE3WnI4?=
 =?utf-8?B?bDJkOEQ2dURITmtoNitaTkF0OSt4Z0pUODRCQi9neDNjOWJTbGVRSEkwM2tY?=
 =?utf-8?B?aW1kNkhRcTk4NjliWnhkczBUcXJ3VWczL3lPZ0VFT2ZyWmlYTTgwMDJucmIr?=
 =?utf-8?B?cExiZDRWenYrOG1uK2tIenZ5bXc2c1BlamZBbUFPTFdvTTI0Nm1tUmQvclMx?=
 =?utf-8?B?STdjMEdHMlorOE02MEJIVEVaSHZseTdHWHRJNFl0TVhrU09IVDZpNFFQbitG?=
 =?utf-8?B?QjdBOTNaNERHZzduZ0NhbUtrTVptei9MTnZXSHRrbGwzYjNlUUx4cEVGVXlX?=
 =?utf-8?B?bmNmNCtCd1ZreXVpYit6TkJpRElaeXRsUGE5Y0tWeWhIUWJZakFUMUd3TjZz?=
 =?utf-8?B?Z1p1WjBxN3RHa01mVGQ0b0xnWGxpbzBaNUNhV2xMbkRRWDZtekFCQXB2MWw3?=
 =?utf-8?B?WXhZMkFPTmRNU3J5TGZLSVBxL2Q3M042V2xNZTFSZStOWG9abFZ0QWF4aFZk?=
 =?utf-8?B?RXp5UjNRMFMyaU15K2VPcHF4NDAxbmJmRW9GSXg5aWpVdzgvSXdwRFJYY1kz?=
 =?utf-8?B?ZTd5M0RMWUJGdktiOXo2SFlwTU1uZUk3dXI4QUZPUTlUMG5EUGdQYStYNjBQ?=
 =?utf-8?B?bHk2OXJwcEozelE3cXBjdU9uckRsU2R0UHVRTTA2WXhaUXpCblhpbS9vblJK?=
 =?utf-8?B?THFWOTI0Sm9RMDBISXNsaCtiY1RTUmMxOFZCWGhDa1hKNEdQV2hhZ2l5ZTlX?=
 =?utf-8?B?emZvQnRqSURxYnlyMVduTC9pNUs5TXZTSldpNU1VOCt1Ui94K2x3dU1wenVO?=
 =?utf-8?B?bkxzNkVVRTc0NVdzZ1BKT05NWXdrVFJySzd1Z2NFLzVldzBsUU5Ebk40M1Bu?=
 =?utf-8?B?RTdDMHlOR0JFTUM0a2tsOVhXeDZyaEIrQ0VoYndwZ2ZqZ0FEdHAyam5mVS92?=
 =?utf-8?B?cE5KK1pNWlBsWWFTWnZ6N3R3QTI5WFR4djg2aS83OTFxYzkxbGhrbEV3MW91?=
 =?utf-8?B?Nk13d3dUUE5MRW5zUy9pU3J6OWZhUzN6dzlUdG5TU2dDYzhEUUUyZnNHYStq?=
 =?utf-8?B?Q2V1d3M4aUtaMEVHWkVLUllBMXdiUkhsVzBvU3c3QVNlakRpODYyY3hJTFlz?=
 =?utf-8?B?ZU92TnRPelhQcWpMdmN0ckJJN3Q4NmhsL3Z1RGVFVStkazltYVNwaHdiYWRk?=
 =?utf-8?B?U1J0OGZ1ZlIweGpKeEgwZHlrV1FBcUdCMUdKRHg0Q0pheVlOVnN6U3prT3p3?=
 =?utf-8?B?TzBLL2Q0ZWFTNUU4eFNHcXVad1dqZnRLVU1JVXU4d2t2OHh6RUVaWUl6MFYz?=
 =?utf-8?B?NkVKSkVBcXdOSk0zWU9oTXRtRFlhV0thajhIRnNRQUlxUGdXajA0T2JvUm42?=
 =?utf-8?B?TVQ0ZTYvNXJiVU05RmxVRk41eVl0WVdBYStocnd0T2FVUldRVG1vWGJ1RXdh?=
 =?utf-8?B?aHZyQVNueFpDTlhFcm8wZ1NuaHJQWndDTkRMZjlrYnJmbkNBZUg0OXJJcHRx?=
 =?utf-8?B?eFBrVXdrSmN0VHEyNWMxTFRUMGZVMk4vRnFIUFRCaXFLaG5Md211SGtwTkxX?=
 =?utf-8?Q?8UFcp4tBuT6NlZd2y/y4aozpfG3QOgFl?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UE1SMEdnSWk1YjQ1N3cvaUR6WHZ2WEthVjFqZjZvZXExMHNqUURBR21Pa2tt?=
 =?utf-8?B?bEgzUVIxTUx3UUZ1M2IrQnFDVlFULzJYSFNYYncwSlVrQm1IMjc5U3MvbGp5?=
 =?utf-8?B?anhKSzFtRzRaYXdEMExCc3UxUVlKWnhQQ2QvZkJyK20wbk05UkpkM3JYbmdw?=
 =?utf-8?B?bGFFV3RBdGpLbXFldk8vRHFFYjNNTU5iU3V4WVVCRE5yUGxOZGljK0x4VERO?=
 =?utf-8?B?YnRzYVZUdEpEMnBrWnRRVWx6ajNQZC9qVjJoQjFhajhRKzJ4YXFIemN1YzBK?=
 =?utf-8?B?NG1uUWR6MVJrUkVSY3ZNK3VYb2VscWhZcE5kM2pMcENremdlVXhuRDhDU2tK?=
 =?utf-8?B?STBvbTFrRi9kb0N5bTFRaThvL1BBU1k5eWlwOWFLV3RJd2dVU1NCbzhpcmNw?=
 =?utf-8?B?RFVvZjh1TU5CS0NkY2xVRE90RFp0UVk2TXFvSnVTVTA3OVZ6TGcvSVZGdEx5?=
 =?utf-8?B?RUwzcWtnS3ozeWJMamFXRTM5QmxXZU9ubG9tVUxTbytIZ0JTcjR1Z1c0d0pt?=
 =?utf-8?B?YXdxb1M5RGlJNUdDaFl3S3RjT1VreElzajdmWVNxQ2Y3VVdSMElsVS9qS3ZQ?=
 =?utf-8?B?QmpkRkN2czBuVUk3M1B4N1VOZEhJMTFOdllJTFpkM2JhcjcwemsySzFZWmVv?=
 =?utf-8?B?NWdDU1Z6V3VEUlk5K0JYNDMzeEl1Z3Z3UWlkVU5ZU3NEUzgrNmVkZ1ZpV1R6?=
 =?utf-8?B?WWJvdy9CQVlhN2lZVU5BZ1o3VE05TGo0THFPNHgvVW5QZkdEdkhQZnZNWlF3?=
 =?utf-8?B?T2lPb2hJdzlqMXJEbXRVTXVVaWlLV0NVNmlROGpZVC9xcjN1Vm9LWFp1aWlk?=
 =?utf-8?B?M2cyR0xycGYxRFQzK29vTlBibW40NnNyMi9YblVsUjBidVVIYXQ3S1pmOE8x?=
 =?utf-8?B?ZUJUYlA1MGR2NGlZQVFqdnplQVRBZWtxUm1aSEVMRlFJY1JINkdiSXI2UW9w?=
 =?utf-8?B?cGk2aGEzZXUrUlpPamFxWUpCdEY1bnVnaU15UXpHSFNleVVDU3A5ZE5NRG8y?=
 =?utf-8?B?ckU4RmI1czJNU2kzY3RDWkFIb2RudDcwdmxhZkYzcGo0aU1MeGhCSmh3WjJO?=
 =?utf-8?B?UGFLMkJOOC8rOEFDOCtvcnJHOUFLNFNXb0lIR01hMkVLYWxkWTFQempKK3Z1?=
 =?utf-8?B?MDYzUER5OUpCdGh1Y2R6Vkt0cGhJb3JqZEQvSldDYks3TzR1dGk3eWg5ak5v?=
 =?utf-8?B?RlhOVndWTDMwaXEySTBRT1VZaVdwTHNHNElaOVRMbHh1SnEyTHAwVkxHUUhG?=
 =?utf-8?B?RUJWdXNmNXRiemo5Vy9TM0hnYittbjBFYlR6Ykc0K0pJSHpka2F0RjduNDE5?=
 =?utf-8?B?ckJhcmhvWkV5Q29MZ2pETDI5ZGwzOWZOMjcxZU9LZWp6ejUvTjdLZmRpd2dQ?=
 =?utf-8?B?b0dXV1IwSnl2YjAremdYZm9BYzBqQ3pZQTQwVVlSVFFEaG1rUjl5MDF0WUZj?=
 =?utf-8?B?L29VcU5HMzVIRy9pN3I0WW5jWlBudFh0T3BRVk9ocWlkL3Bnc25ibWV5UmdV?=
 =?utf-8?B?anNYenExKzZFeXpBc3gxZVlVdjc0WXk0dXJEb1FFdCswM2V1a2Y4bmkvWWsz?=
 =?utf-8?B?OTRPckI1Ky80MWFXK3dYVlRFTUkzK0NRWTh3c1JVV0x4aUJCNk8rNkpUUEdv?=
 =?utf-8?B?cDFBbDhZNThueHZVemdrcEFzTXFvb09xYTM4all5ZysyS09Hb2ZHSG1SVTVB?=
 =?utf-8?B?M0Z1Zm9Sb0N6WVUvano0S3UyMVByZEMrUHY4YnZvNkNiU3NDZTBrT0tpNUhW?=
 =?utf-8?B?eURtdS9NK0o4ckk4SDNaWHMzOHQ0d3dxTGVDMU5ER2lTSlUxa3MzL05kOEQ3?=
 =?utf-8?B?SzNOS0VIUzcyMFZqYnYramhWOEpCTXc4dzI2ejVsN0Z0NDEyWHlKMU4rQTRR?=
 =?utf-8?B?aWJZQWFrTmVGeXZMNVdDbzYzZ3pFb0h1cXZaYmhTb1BmcVJYZVMxTzE4V0dl?=
 =?utf-8?B?ZWNkOU54cER3UHJEVU1VYzZ1bU9TeG50dWhnYXVVSEtVeksxMTlKZS9DdjZC?=
 =?utf-8?B?RVg2OTlSbE5HV3V6WXhzN3YvRVd6dVJwLzZtQVFZVVY1bXVLbFQ5eXNJYXFZ?=
 =?utf-8?B?dWx2SmhDUVVtT05wZzRQV0o5SlY2QjNkNDFVb2RYY1RnTk5xTjlrdVlEN1Ar?=
 =?utf-8?B?ZnM1TzRDR0o3Z1hxUEZhdVhrTXA1eEpoNW8xdC85a005eDdnYXJJZVNLZmNp?=
 =?utf-8?B?ZGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8df1b338-3df3-437e-b4b4-08de3e2cb322
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 11:58:04.3835 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EQuD10LR+Ah1XCMKe3O1AaA+UcQXYfFLDse5UXKXC0Vn/imHAwuRSjiB3Ggme3pXEg6bVoxyQxMw2Llt5IpY83f7+i8OFepoIaZwDeBI5s0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6126
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


On 12/18/2025 4:06 PM, Jani Nikula wrote:
> On Thu, 18 Dec 2025, Ankit Nautiyal <ankit.k.nautiyal@intel.com> wrote:
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
>>
>> v2:
>>   - Expose API to check if pipe is valid rather than the runtime info
>>     pipe mask. (Jani)
>>   - Rename the macro to `gvt_for_each_pipe` to resolve build error.
>>
>> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>> ---
>>   drivers/gpu/drm/i915/display/intel_gvt_api.c | 11 +++++++++++
>>   drivers/gpu/drm/i915/display/intel_gvt_api.h |  1 +
>>   drivers/gpu/drm/i915/gvt/display.c           |  6 +++---
>>   drivers/gpu/drm/i915/gvt/display_helpers.h   |  4 ++++
>>   4 files changed, 19 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_gvt_api.c b/drivers/gpu/drm/i915/display/intel_gvt_api.c
>> index 8abea318fbc2..45f12f239a2d 100644
>> --- a/drivers/gpu/drm/i915/display/intel_gvt_api.c
>> +++ b/drivers/gpu/drm/i915/display/intel_gvt_api.c
>> @@ -32,3 +32,14 @@ u32 intel_display_device_mmio_base(struct intel_display *display)
>>   	return DISPLAY_MMIO_BASE(display);
>>   }
>>   EXPORT_SYMBOL_GPL(intel_display_device_mmio_base);
>> +
>> +bool intel_display_device_pipe_valid(struct intel_display *display, enum pipe pipe)
>> +{
>> +	u8 pipe_mask = DISPLAY_RUNTIME_INFO(display)->pipe_mask;
>> +
>> +	if (pipe < PIPE_A || pipe >= I915_MAX_PIPES)
>> +		return false;
>> +
>> +	return !!(pipe_mask & BIT(pipe));
> Nitpick, return pipe_mask & BIT(pipe); is sufficient, the !! is
> superfluous.

Ok sure, will drop this.


>
>> +}
>> +EXPORT_SYMBOL_GPL(intel_display_device_pipe_valid);
> EXPORT_SYMBOL_NS_GPL(..., "I915_GVT");

Will change this as suggested.


>
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
>> index 9d6b22b2e4d0..11855c71e05e 100644
>> --- a/drivers/gpu/drm/i915/gvt/display.c
>> +++ b/drivers/gpu/drm/i915/gvt/display.c
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
>> @@ -672,7 +672,7 @@ void intel_vgpu_emulate_vblank(struct intel_vgpu *vgpu)
>>   	int pipe;
>>   
>>   	mutex_lock(&vgpu->vgpu_lock);
>> -	for_each_pipe(display, pipe)
>> +	gvt_for_each_pipe(display, pipe)
>>   		emulate_vblank_on_pipe(vgpu, pipe);
>>   	mutex_unlock(&vgpu->vgpu_lock);
>>   }
>> diff --git a/drivers/gpu/drm/i915/gvt/display_helpers.h b/drivers/gpu/drm/i915/gvt/display_helpers.h
>> index 3af878e3d78e..a910f8b8833d 100644
>> --- a/drivers/gpu/drm/i915/gvt/display_helpers.h
>> +++ b/drivers/gpu/drm/i915/gvt/display_helpers.h
>> @@ -32,4 +32,8 @@
>>   #define INTEL_DISPLAY_DEVICE_CURSOR_OFFSET(display, pipe) \
>>   	intel_display_device_cursor_offset((display), (pipe))
>>   
>> +#define gvt_for_each_pipe(display, __p) \
>> +	for ((__p) = 0; (__p) < I915_MAX_PIPES; (__p)++) \
>> +		for_each_if(intel_display_device_pipe_valid((display), (enum pipe)(__p)))
> I think the caller should use enum pipe instead of int pipe and casting
> here.

Hmm.. ok will change this in the caller.

Besides this, does the rename of macro to gvt_for_each_pipe() makes 
sense? Or can there be any way we can retain for_each_pipe without using 
the #ifdefs/#undefs?

Thanks again for the comments and suggestions.


Regards,

Ankit

>
> BR,
> Jani.
>
>> +
>>   #endif /* __DISPLAY_HELPERS_H__ */
