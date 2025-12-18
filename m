Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 977DECCBBAF
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 18 Dec 2025 13:09:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 009FE10EEB7;
	Thu, 18 Dec 2025 12:09:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UkJ85nE1";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EF9110EE03;
 Thu, 18 Dec 2025 12:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766059791; x=1797595791;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=g1J5+//KHu6T3iGt8V/3A/kLCtn7I+08er3kNW9kCQs=;
 b=UkJ85nE12NLG5k1OA0MA7jHVV8tfusMA8IHaaieMpxZia3wZE5lOcwWS
 SotwdcUc3D5/s7vbvNYEifV9cLNfweXZejMuSDH962I8QwSdQaWqDWkUw
 m/opzeAOUCSBIE63gZwWqcSVU/BNcarV/4AAyGBkAYeE4D8x1Y1fE+NuI
 mglXUN4rWPYM3HVzH/5iOlkVz5h4AVCvNSJXCfQ/7hUVr5lEgAXzIACt/
 IYKYQD7R/1bD18gYt3I4uo1ISL75JF2aaBgcv3ry7bXAVApuSZVrewmAU
 U6579jEvwwIGun89k364sWdhkF4Y/oGqz2zLMRrSEqkkptIwYhI5wNI2X Q==;
X-CSE-ConnectionGUID: Y0ucT1JUQ6+uj3scEnGGKw==
X-CSE-MsgGUID: lxiGRrIWRQ6k1nO7gS7C5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67949246"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; d="scan'208";a="67949246"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 04:09:50 -0800
X-CSE-ConnectionGUID: PcfayLUmRfmI8/1OuIm8uw==
X-CSE-MsgGUID: 9mMPrrAvTMa1RxgCmV5CQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="198170023"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 04:09:50 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 04:09:49 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 18 Dec 2025 04:09:49 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.20) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 04:09:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VhXMJvw/SKPLhTdDYTi+OrKZE1+nd8jnfzxUOfFaBexDoTPROi3EBepJka22WTa6lloEFBOThhxJpHMj8hZfsHySu1KduIN/GRGlzPKpIOU/xeWDuahNF2h36ymxsmxiXt855jcOWcsFgqp6AdQZVMR/nNlSV38YUQrra8pF8V8nJaKeTTI+f4wmMaxkrVQd7r5r+X9mQkt8tz5Bq/ii4cr4bVaBlsXIORJpyKLVPE3w0EiVz9eLg0uGh7A4MpUj5xkuBlGrlB+C96PQwRc++YIOUbvLlocLFH7XXPTjJH48nUGMTu3fQ+hJk8aIaNkTgBXP7aSmeZihZlWZb4k0Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UTIAg7O5Z0kqUosz+KpSiv18yiYprttTBWdpzvX1u+E=;
 b=yG05ZOXPa15P56lrO01tWHWPk4KhMaDXPzrH9jiAXIGbka2GiEJeS3Cn10YbhtJAbrJ+b4f0e4uFdPg/REriLdnAJAnlMvse38GGhOwBWXshNQjz5MQTipx5VSf9E7+l1/ifPA4epF4h/3ZUkYSRISSBpj+B0cK/qtrpZTpRz/qlLiMMY/GJGvS9oRia31gp+/B/D+0Ki22U+GA1I2iLCQj3R7a14kDer3rNXtuXbSar2HSyWHgIu4BskE9ZCRNvonqakUgpnNvAg8xO8EDXj6+DNQeni9iTcnzMr69d1VYbM6oQQaB5n1n+j+VVM5vgmH4b9vT6WXGXQNCr9mF5Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Thu, 18 Dec
 2025 12:09:47 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 12:09:47 +0000
Message-ID: <7bd5361c-2f50-41ac-af40-d005d0202c6c@intel.com>
Date: Thu, 18 Dec 2025 17:39:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] drm/i915/display: Add APIs to be used by gvt to get
 the register offsets
To: Jani Nikula <jani.nikula@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>, <intel-gvt-dev@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
References: <20251218082302.2327243-1-ankit.k.nautiyal@intel.com>
 <20251218082302.2327243-3-ankit.k.nautiyal@intel.com>
 <d3d285c5180e950b8189d7d96d06d21f1d88cf6f@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <d3d285c5180e950b8189d7d96d06d21f1d88cf6f@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0067.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b3::15) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|DS0PR11MB8718:EE_
X-MS-Office365-Filtering-Correlation-Id: f51f7259-2e53-474f-e5fd-08de3e2e5681
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RVJ2VXdOd0RqMkFHOURXUnI3aVpEVEF0eWh4YkR3S2JoZDhjbDNTT2RNdUVr?=
 =?utf-8?B?WndQQzltdytya09zVmdrSFBIN1hrYUIrc1RxN1Z6Q2lKK2dzYkxNOWJYSkd2?=
 =?utf-8?B?YmZpaVI1SGtZM2lEb05SV0x2QUszTmpaaHRMdHBUM2JYWmJTdEswTlJvYzB6?=
 =?utf-8?B?dWpGTHI5OFA4TUNSaUVzaTBOcER6TDc5bUJvLzBpSSs4bDkrSDA1czNvaEdo?=
 =?utf-8?B?OHdoWUpOa1FrRDRRNzFBWm9qZkJRVTcrQzAxZHFSYnZ5VW9xMGZWeTA3bjJw?=
 =?utf-8?B?a1ljc1RtOHlVQUFHYzBTUllXWkJTQUYzM3ZtMUkrWXM1YklHQ1Q3RGdnNjJt?=
 =?utf-8?B?S29SUW9ydEZWaEdJS0t5Um9TL3cvajNrdWNkUU81aGMzTXFGVnd3ZUFjRFhr?=
 =?utf-8?B?QU81R3BIejhJckZSQ096b3p1RGJ2V0pXeGxGSnBpMnZDQnJMU0tDeElqUmU3?=
 =?utf-8?B?L3ZzZkZtQ3BaYllzYng2QkdjZlVsZzgyWWVFR1I4UHZYVmZWVEp4TVVOTzVY?=
 =?utf-8?B?SWNYa2pZMWZDOFUrZFp5RUFqcjRWbmhiV21QRjhnQXlkdE84WU01d0loWWpx?=
 =?utf-8?B?M2tSTThqdmVHYkJkUFMyQTAyWjEwcWRPOTN0cEdzUGxDSnNEWnFUZys0bDJB?=
 =?utf-8?B?NGpNTVBuSFFEd003d3hKVE9DTHFjN09ROFp0Y1hZVmkrbjZjNmU5OS8rZCt2?=
 =?utf-8?B?Z0JSS3VCb2t0aWduVWtpZW40T1FXRzczMi9PSTI1SjRkMCtxSVpkNVUvb3Z3?=
 =?utf-8?B?TzlxT0ZYTkFPRkh2emZ5cUcvSkJiZGVNNDdLQmdneCs4L2FlZVk4d0FpSldH?=
 =?utf-8?B?SGVIWk5GWG5MRm9Id1BiS2FDek51U2VkTXVQVGhlQnBhOUxyby9GUFJNTDVN?=
 =?utf-8?B?NExBU2J6TEwxWDNLMUEySXQyaUZCMzZYSXdLaDh1NjkzQzhvcVU5WllQTzJz?=
 =?utf-8?B?NGZoTEVWSWpROURWVmJqVDVhQmNvcEcvYkg5TERINlVPTnp2d2dUVlZ5SWlR?=
 =?utf-8?B?L1drcDNnbG9PRjNhS2R1dnNIcDJMa1ZUeTFlM3JWaWZWbllPQ2UxWXpwTll3?=
 =?utf-8?B?WE5BVEk5OUVWMTNra05OTmRYejJZM0NkV3ltMmlHZnhRZzhLSEI2TUZmWnFT?=
 =?utf-8?B?NklpUFdXeDE4aDFWMlViM0ZlS2JuVGJKODErVjVJck5BM1Btc0ZmaUxjTVBM?=
 =?utf-8?B?ZTBOa2l0Ui93S3ZRclRVelV2YjRLbTZHTlZQM09CY2gvdGkwR2x1a1d3K1lY?=
 =?utf-8?B?VjBqVVp1S3dTTnBzaVYyVmJaWWpoZDB4amdZSHVIdVR5aThHSHhGZU9Jbk5O?=
 =?utf-8?B?ZDdiQUplZkFCOGhWd3BtdVBsQmI5WURrUjFWd1U0a0wxcnFVNjFvUVpta2Np?=
 =?utf-8?B?b3RnYWZCZEp4eGkyS081emFxb1c2dEJuWHpmUHRrekpIVjA4blRGKzBiZGpl?=
 =?utf-8?B?MzBUeWQ0THZwaGMyekRyVXg1REdTQkJRdmFaTW5xNGpQc0NqS29iL25zR3dU?=
 =?utf-8?B?Yk5TaVZZZERtREZ0OTl0QlZTOEFSSXBya0hKZi9CQlh1bDdNbURMeDN6T3F1?=
 =?utf-8?B?akJSNVY3K3J1bVhRL2NuWGpuL1ZIQnk0SXVmWHRlYnlZV2VOU1RxRitYYWZy?=
 =?utf-8?B?Q0o0TmY0TEdHcnV3ZDgyU2ZtNThzL0tGd01SNDFSWjN1RHU3NElXNFMyRDlz?=
 =?utf-8?B?VXFiSW4vSlVFOGxTNGhlMW96N0pZZGhPanJ2bWJZWWhIUWcwd3hOU1ZtRXN1?=
 =?utf-8?B?SldDQzQya2ZSWWNwNlR6clFCN1JBckw3NlRSTEpXcTlrYllzZ0xjMnFva3or?=
 =?utf-8?B?bjljWitJeE9lUG95WVRXR2VKNnU5WndEYVhmblUyUzVpTDlaQlRZbDh4aGRV?=
 =?utf-8?B?V29xcU00NTZ5d2hKOWJvazFwNVhaeDc1czdkanR4bmR0TCtva1BxeUdna1Zu?=
 =?utf-8?Q?h5GxKyVgd4LcMx8r4BdJqH+asu2P2ORQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUp0Q3JITnRjalkzeUpTTlhJcURTbTV3UzhVWWNkVXNlRk1pN3FJYXZiaEhV?=
 =?utf-8?B?aVZZTGUxNURib2NXMWFvWDEvZUR1UFR4TDgrTXlaQzBFc3VRVTRaMUVtZTFj?=
 =?utf-8?B?MUk5UDVDWmNZRDFabnd4NmJYZTIvTlZCYVNENS9ldkNVV21mZ3YveWVndkFI?=
 =?utf-8?B?YlJVVVA3WWROTThPTmVGMzNiTE5nZFBzd0paMGlabHNXUU1jUWg0MnJZM1VO?=
 =?utf-8?B?QWxRKzdNbmVjbHF5R29hcngyT2s5dVVuTm1HeWtXNmVTUWhFV2IvYUpIdWcx?=
 =?utf-8?B?c1p5dENkM3dzN1ozMGFicGcwTmZDNEN1UjJlNkZocllrcktHTGp1UDBTUko5?=
 =?utf-8?B?YkI0ZjRrRllrcFczbUE4Z0RHbk5Kay9HQm5Bc0FDQUJMMHJJNnZiMmp4b1lz?=
 =?utf-8?B?T0dpblJ5YXFxYUF5Ykd4YTNrOE84NE5GVmIrZjdBbkltZjJEZjZyVFpEKzBF?=
 =?utf-8?B?VVQ2QWY2MXpTK0VaUUNETGJmK0dsWi9CdHFaeHVZVk1DVWxGL08vN2VxODJO?=
 =?utf-8?B?TUxJZnhVam1ubzh6UjRxVzQwdlVZNW1zaTgxZ1NyNGk0ZS83eUphVkk4UDBQ?=
 =?utf-8?B?K24xL01XZzhLT0VHSmtnYWxpdG5iSEJ5QWJQWFFOcEdrZFErMC9hcWFkdXdQ?=
 =?utf-8?B?NUltWWlnRnlPUjFCWWdZR2lwaWF6TUx0K3ZWd0pVU3Z5ZWxIZU01K1ZSTlBX?=
 =?utf-8?B?RS9FNS9oQkUydkVTVkNEZktScWxEUENTMjF6ZGNRdkJtODJPRHdieGpBaWZn?=
 =?utf-8?B?ZHBTYjZvd0JiQ0tLaDdtbnJ3c0R6TDBLeDFlVjk2L1gvV3ZyT1dkZnhjaTVw?=
 =?utf-8?B?NmEvTnBiM0IyRGZvQ1VtWHFHYzVYa2REeHJFSVhtMGlTVXNuT2V5YXlYalFZ?=
 =?utf-8?B?MEJRNUNPMExFSjBMZlU4cko5RWhBUnBRaVV3V1hvWk1rYTRJVTlZUVkzM3dt?=
 =?utf-8?B?V2NqaHJhdDFXdGRmaHZXMlYxeERJeTBmZGpMMk5JbHB1WHluVnBxQ3hHRnV4?=
 =?utf-8?B?S3dyQTYrMDlJdS8rYW92SjhOREx3WEdMS2JiQm16TUh6YnQ2bDJVQ1ZkTTF4?=
 =?utf-8?B?bXdVNmxoNnVkQWwvVlhKR2RGdkZxNGZlOUlZWm9oS2xTL2V3WmhuUHovaWtV?=
 =?utf-8?B?MjJFTVB2dzVKTjc5Z3NUUXBwNWNjenhXQ2JwYVVNQTl4Nm5EbnBRNmpyR3Fu?=
 =?utf-8?B?V0llY2hoK2ZaQSt0L2hrbWpUampWSzFKKytpVmRLMmtmVEhJK0pIYjljakc5?=
 =?utf-8?B?VDZXMGRFOUtiOUtUVXJNV09yN1EyZzF3eHMvNFFQSVF3YWN4TERjMndJNGt3?=
 =?utf-8?B?SE9TcElxVFdpd21lay9UVE14c3FKU2Y5TVhtNGpQS3QwWjVwb3pJdnVpc3Zv?=
 =?utf-8?B?TmVwRG9ZbFhWWEhacGh0bGJxZklUdExxRmhZODdHUE9UMGtXMjA2MUYvY1k5?=
 =?utf-8?B?akJvRlRqN2lCMHR1YjlrYmlicmVzK0RGQUNyRUVQQU5xMXE2RmkwUkRnRGZ1?=
 =?utf-8?B?QVFCVXgwaStNYk9YKzl4K3VlaE1razhKMlQ1WVZWU1QxY0E2aGZETndZTnZX?=
 =?utf-8?B?S2svcXFqK0lPL0lqcjVwaHYrU0JrdjQ4YjZHclZtOGVselZ3cXh2bkdaRktt?=
 =?utf-8?B?NFMvZE9VUWVDTmlna0ZWVHNac09OVmVvZE80VVpLSjBCNGRZVEhOcEUwaks5?=
 =?utf-8?B?N21sNVpCWC9qRU56Tjg0MFo5Z0FsVTI3Mzd4U1g1Q1pzTEdVM21wRTFqeXlE?=
 =?utf-8?B?ZUIwVDBsT3dZa0RPSG9QaDVBSzY0M2xlZVpzeTBPSVJQUnJDOWRvSnh3VUtl?=
 =?utf-8?B?U2NOajZhTHpValJjRGdnME9hNkxuaUtJbzFYV01tOFVvaXVRRnFDdEJvZDVS?=
 =?utf-8?B?cHJNMzV6M1N5cjRWaXUrRmpBbTVSNnF2MXEveHdtR3ZERWNPdGU0UlRHb2JL?=
 =?utf-8?B?b1RvQ3hXQTdrd1F2R0JwdHFVRExNWEUvWWtvcWtOL0RZVjd0dEZUMHkrdFVj?=
 =?utf-8?B?cGVKQjUxSWNxNjgzN2FlYW0vSW1tL2RmaXplM25PSGNIQ1MrWW00NTZBckdw?=
 =?utf-8?B?NDdka0k0OE5XK1pCWlRsRDU4MURRRTlrMVNGUWtPOVBOWUNUSTY1S2s3Mi9C?=
 =?utf-8?B?VXgyMGY5UjlodkE1Y0czdElOWE00dGc0aWlLWnVKb1hBT3lSUVR5blhNRmVj?=
 =?utf-8?B?Wnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f51f7259-2e53-474f-e5fd-08de3e2e5681
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 12:09:47.7260 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DIrX69yt/VV1X5pBdqSkBWneV1o+qqNl2dtPTXw1mo7fvIYlA+ls3ZqrZETO4t+woWx8Q4V3bzsaGpmRaVWXpyCtzCecw8TNY3/RNy51jy0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8718
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


On 12/18/2025 4:02 PM, Jani Nikula wrote:
> On Thu, 18 Dec 2025, Ankit Nautiyal <ankit.k.nautiyal@intel.com> wrote:
>> GVT code uses macros for register offsets that require display internal
>> structures. This makes clean separation of display code and
>> modularization difficult.
>>
>> Introduce APIs to abstract offset calculations:
>> - intel_display_device_pipe_offset()
>> - intel_display_device_trans_offset()
>> - intel_display_device_cursor_offset()
>> - intel_display_device_mmio_base()
>>
>> These APIs return absolute base offsets for the respective register
>> groups, allowing GVT to compute MMIO addresses without using internal
>> macros or struct fields. This prepares the path to separate
>> display-dependent code from i915/gvt/*.
>>
>> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>   drivers/gpu/drm/i915/Makefile                 |  1 +
>>   .../drm/i915/display/intel_display_limits.c   |  0
>>   drivers/gpu/drm/i915/display/intel_gvt_api.c  | 34 +++++++++++++++++++
>>   drivers/gpu/drm/i915/display/intel_gvt_api.h  | 20 +++++++++++
>>   4 files changed, 55 insertions(+)
>>   create mode 100644 drivers/gpu/drm/i915/display/intel_display_limits.c
>>   create mode 100644 drivers/gpu/drm/i915/display/intel_gvt_api.c
>>   create mode 100644 drivers/gpu/drm/i915/display/intel_gvt_api.h
>>
>> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
>> index f01b5d8a07c7..7974f017f263 100644
>> --- a/drivers/gpu/drm/i915/Makefile
>> +++ b/drivers/gpu/drm/i915/Makefile
>> @@ -360,6 +360,7 @@ i915-y += \
>>   	display/intel_dvo.o \
>>   	display/intel_encoder.o \
>>   	display/intel_gmbus.o \
>> +	display/intel_gvt_api.o \
> Actually, this should be:
>
> i915-$(CONFIG_DRM_I915_GVT) += \
> 	display/intel_gvt_api.o
>
> i.e. let's not add this stuff unless GVT is actually enabled.


Got it. Will fix this.


>
>>   	display/intel_hdmi.o \
>>   	display/intel_lspcon.o \
>>   	display/intel_lt_phy.o \
>> diff --git a/drivers/gpu/drm/i915/display/intel_display_limits.c b/drivers/gpu/drm/i915/display/intel_display_limits.c
>> new file mode 100644
>> index 000000000000..e69de29bb2d1
>> diff --git a/drivers/gpu/drm/i915/display/intel_gvt_api.c b/drivers/gpu/drm/i915/display/intel_gvt_api.c
>> new file mode 100644
>> index 000000000000..8abea318fbc2
>> --- /dev/null
>> +++ b/drivers/gpu/drm/i915/display/intel_gvt_api.c
>> @@ -0,0 +1,34 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#include <linux/types.h>
>> +
>> +#include "intel_display_core.h"
>> +#include "intel_display_regs.h"
>> +#include "intel_gvt_api.h"
>> +
>> +u32 intel_display_device_pipe_offset(struct intel_display *display, enum pipe pipe)
>> +{
>> +	return INTEL_DISPLAY_DEVICE_PIPE_OFFSET(display, pipe);
>> +}
>> +EXPORT_SYMBOL_GPL(intel_display_device_pipe_offset);
> And the exports should be
>
> EXPORT_SYMBOL_NS_GPL(..., "I915_GVT");
>
> to limit the exposure.

Will take care of this in next version.


Thanks & Regards,

Ankit

>
> Sorry for not catching this earlier.
>
> BR,
> Jani.
>
>> +
>> +u32 intel_display_device_trans_offset(struct intel_display *display, enum transcoder trans)
>> +{
>> +	return INTEL_DISPLAY_DEVICE_TRANS_OFFSET(display, trans);
>> +}
>> +EXPORT_SYMBOL_GPL(intel_display_device_trans_offset);
>> +
>> +u32 intel_display_device_cursor_offset(struct intel_display *display, enum pipe pipe)
>> +{
>> +	return INTEL_DISPLAY_DEVICE_CURSOR_OFFSET(display, pipe);
>> +}
>> +EXPORT_SYMBOL_GPL(intel_display_device_cursor_offset);
>> +
>> +u32 intel_display_device_mmio_base(struct intel_display *display)
>> +{
>> +	return DISPLAY_MMIO_BASE(display);
>> +}
>> +EXPORT_SYMBOL_GPL(intel_display_device_mmio_base);
>> diff --git a/drivers/gpu/drm/i915/display/intel_gvt_api.h b/drivers/gpu/drm/i915/display/intel_gvt_api.h
>> new file mode 100644
>> index 000000000000..e9a1122a988d
>> --- /dev/null
>> +++ b/drivers/gpu/drm/i915/display/intel_gvt_api.h
>> @@ -0,0 +1,20 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#ifndef __INTEL_GVT_API_H__
>> +#define __INTEL_GVT_API_H__
>> +
>> +#include <linux/types.h>
>> +
>> +enum pipe;
>> +enum transcoder;
>> +struct intel_display;
>> +
>> +u32 intel_display_device_pipe_offset(struct intel_display *display, enum pipe pipe);
>> +u32 intel_display_device_trans_offset(struct intel_display *display, enum transcoder trans);
>> +u32 intel_display_device_cursor_offset(struct intel_display *display, enum pipe pipe);
>> +u32 intel_display_device_mmio_base(struct intel_display *display);
>> +
>> +#endif /* __INTEL_GVT_API_H__ */
