Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IDetCrGbcWmdKAAAu9opvQ
	(envelope-from <intel-gvt-dev-bounces@lists.freedesktop.org>)
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 22 Jan 2026 04:38:25 +0100
X-Original-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2CB61632
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 22 Jan 2026 04:38:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3EEF10E8B6;
	Thu, 22 Jan 2026 03:38:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gN0BZsDq";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ED3910E8B6;
 Thu, 22 Jan 2026 03:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769053102; x=1800589102;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Xz/onlUejogfpCPM9L+q3juVNHNshzH+QYy6jmymIOw=;
 b=gN0BZsDqPQV+ts23AYE/P7V46JYz5jTzFNJLVTsasnvTgVpZnbPRf2oy
 d666HZdkGuMjHxCiOC1gNGmib0XjBjLmBDW8jKy5yuTfNp4YCmuMFiHXE
 t0YXFqsJ6k16EWFJ9aHwADBwWg+doBjD+PuvvdX+mf+N7E8C2cVVUCOCN
 k0bodL6EELnC+Niub7gnlh7ivhFSikiO15LmZFX4kq2VKh4e1GX3ktsol
 MgIIRoCAQQQvwGqkV/aWM27eus2+geJKNnTzJANTKu24MreNhJR8Tbhuo
 58jCb9jMT6NJRsSdShfgPS5iDf4zMiC1Q7PSoHUJP/AbckVFb4Bbfg8gB A==;
X-CSE-ConnectionGUID: UfP15MxLRxmNw6tOAfBPEA==
X-CSE-MsgGUID: BY+BgIZsSyKUhCgDlOef/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="81007892"
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; d="scan'208";a="81007892"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 19:38:21 -0800
X-CSE-ConnectionGUID: 0AwGE5sTQCyCj5E5LAtRkw==
X-CSE-MsgGUID: 2gZZZ9oYSg6kX/IoVuwefA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; d="scan'208";a="211473581"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 19:38:21 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 21 Jan 2026 19:38:20 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 21 Jan 2026 19:38:20 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.27)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 21 Jan 2026 19:38:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EJNs2g+38wYmZMX2U9Bbenpkx5tfgktH/iGULMIHptKHHvv1zxGD+K2sav+VzjpRGHtogTeankm/qr3uh3iTZi4ZAj3bMkTqjSWJDGCGYWUZUHTT8kptyQh+2mtOMMiUhiO+jDv2xjWdt6zUCEWxM6hH1Deo0K6nUv3sQMfg3puMQ1eiv3F8sdMex6OxK2boGNh8RZnDDIuCA6HL6jvZQnp0Gqw486GXtqvcg6+Wx6SOEMMHJ1A7XageRMsoN27tGHqWT5fC0LQRu48tNZ2mrPMZMls4N1hAi09Jory5/+B9QdQHU5IuI4ITUQFA5vPUt/+OZIJl9JO8asrUewRqEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=laGn/pZPiPS2LiA/fM34OBW+Uufi0mKMfIvYDMeQjHM=;
 b=ImqMB8k9+WwqZtHP3gzacXv5PEwk9M9A9865cmqQZ43/Us+L+yB2jAZSZ3+B6QoxdEciStyUe69lmE+Xj00DCJyalFaXl21vtt2fCeeBR5wtCmBhhPhxvlqcm/ZFrXQq+lPMG3sdDnl2ToUNLiCwgjVok9AQ0Rwku0uLYHRRYEQR9upQ6aUxmnW9V4zP1OxUYfEY68z0+D21oCJ1bLRMYEj/dkCCyoE01Y/W/FQ0CoG2SFhap6xo6KAp2nM6pa22LlhuHGR75v7Z+6YBwYU5boeNGl3z28rvnJ9ynwpmrjfOKut4uOe86c7j+n/SgbNE3OPJnCZAS+kBztf3n7mb6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Thu, 22 Jan
 2026 03:38:18 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%3]) with mapi id 15.20.9542.009; Thu, 22 Jan 2026
 03:38:18 +0000
Message-ID: <daefe852-53c4-402b-b0bd-e56737a06bb4@intel.com>
Date: Thu, 22 Jan 2026 09:08:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/gvt_mmio_table: Use the gvt versions of the
 display macros
To: Jani Nikula <jani.nikula@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>, <intel-gvt-dev@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
References: <20260114025456.1639171-1-ankit.k.nautiyal@intel.com>
 <0bc65f08b4bc32eeaaa0b96d8b56a3db80253d40@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <0bc65f08b4bc32eeaaa0b96d8b56a3db80253d40@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0074.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b7::15) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|SN7PR11MB6677:EE_
X-MS-Office365-Filtering-Correlation-Id: 709fcd56-201e-410e-3624-08de5967aed5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WENtSysrNm9hMkVZbWVmN3J6V2V3d3FGam1PN3JCbFlGcVRxN0R3REg2NnVi?=
 =?utf-8?B?MTFlamRRdWUzeUpQMEc2S0pqMzZScDMwcDZScFFUV2VENjJhQ091RWRoVkZJ?=
 =?utf-8?B?blg3U1BlVEZJMkxuTWVZc3FDNFhRbmNiM0ZhTnRNbVlmRFlnOG5XbGhHZC82?=
 =?utf-8?B?dU5xTFpMZkpteHBoRjhUWFBic2Jid1RHQ1kzNG0xRjBSMy96b2Y5b1dnMUZH?=
 =?utf-8?B?bTZ5NUNyNW9SSGZleTRwMkR3R0prdW1BK1RqRXFHUndrYTRhZjhQRW1rS1c3?=
 =?utf-8?B?VGpYbTB5QktSNndLUFB1NWlsS0lia04vMDN6ejVPWFQ4VUg1Y2FYV2poYXZE?=
 =?utf-8?B?RktkVDRBUlV0c2dyNnJpRnNkbzJXSVVaSFhKNzc0SEFEbUlhRUluZDRaMXM4?=
 =?utf-8?B?K0svMkZIS3JRSVZSLzhhK3JlQk5FNlJtTFVBcTQ2SHhoSjNLN1J0dDQ5NHEz?=
 =?utf-8?B?UEhrVXRSczdRLzZOU0pYanpmdUs2dFpSZ3ozY205SGZVMmg1Rk5VTHFzcXVl?=
 =?utf-8?B?SXBmT2VieWwrNG9takRNdm9uaTB0U2s0T09QNTdwVFp1cDN5Uklrc0lSQXVS?=
 =?utf-8?B?eVJ2bFFsSkVwUWpDZzIrS2g3Z0UvWmE0Z0J3ZGtYUFpEVkJmYXlLNWFsaVhN?=
 =?utf-8?B?SkVEajdTdEhJYjQ1YkZYRjV1cFFxR3kyMmxJS2sxdGFaQUxBREw0SXJQczRY?=
 =?utf-8?B?T3dOTjlxVmZaL0ZFRHBOT2F4KzJkemxOdXVmOXNwL0FJVVgrVnJNYTBvcWVr?=
 =?utf-8?B?WTRQNFFhL2xLSVhzN1ozd0I4ZzlEblRsK2RpaWEzV2grMHVaQS9JcmI2MlE2?=
 =?utf-8?B?OEJxRnorZVlUVVFtcWJDUGZBNlVjbWdoVEhHaGtJYi9Mcjg2K05KWnhXbjZT?=
 =?utf-8?B?T1psZVN4ajB0UzM0dHR6dnovV25oM3g4ckVIaVRMT21sdkhUQVpmaDgxVFdj?=
 =?utf-8?B?bWU0VE1HNmVNWGRtMjhFSlVmK1lpalRhTjU2U2NiN0FuZ3pJZ0tFQ0lWSWx6?=
 =?utf-8?B?WitIY29KVTRPZXpJUkd0d0hqQ1RYSytTQTg0SWVWT1F5WHFiZit6emk2K2hW?=
 =?utf-8?B?V1FvQWtpSXJGcS9BY0RmZ0tKQ0tyN3QyVm43clRvaVFzRVJLNExsRVJXM0Z6?=
 =?utf-8?B?Qkp5Wlk4cjI1S0c2ZHhyU2VncGNBOXozZTUwVE5QZE90bHZZRDZWMjBIYkll?=
 =?utf-8?B?aHY4TW5INzVLR0xZdWdHYmRESHkwdFVKdkJTMVAwZ3pNU0tmR3pSWkpxUVpT?=
 =?utf-8?B?M01wb1hvUUZYK0hTbk9Xd3g1d0JUbDFZWVZVbVF4R2JqSGwwMFVINk1jSFBI?=
 =?utf-8?B?ZXAwOXpDa3hQaFM3RjlIaHNOZ01nNGh4NUFPZDM3N2FXMzlBeGVkVHdTQUx3?=
 =?utf-8?B?YysxMTdOZi9EZUtXbkYxbXl6SGxKY3ErRE8yY3NZWTFjbUFiazV0NEJoeXFM?=
 =?utf-8?B?R1hnY3pQNHREaVJvUFYxUXlNMXNFdm16dEdWNnZ5K3BGdUJjUVNRNE5PTDdK?=
 =?utf-8?B?V3d3L290elpoaUZFdk1Mdi9XbmNOMk5hOVpxZk84L3BkWjhaR2pURXdoYW9E?=
 =?utf-8?B?VVNvdGxLYVc5bWx4YVJHZzUvN1BXYmdlLzc2QTFqbHdoS0VKYWVMcGZramIw?=
 =?utf-8?B?TWV6TmVIRUZ3cjZZMjlOZWlaU3BXMnpFRVFEazN3cXBQMml2N3Q5OFRKYXlM?=
 =?utf-8?B?bnM2cnR3amV5aHFlVElCbW1xZTVya1hCU3RlL3hqRkF6NjBETUZzUFNuQWNh?=
 =?utf-8?B?Z3BObVVFVEtnMnlUbE1iUnJjc3ZpU1p0TmsxSGVHZjYwaXVaelZPbm5BbGtv?=
 =?utf-8?B?amVkNXVZbFFOSGxRNlRIL0s4ekwyMXhPZ01FTHFhMGg5ZzNRV1AxamRzNjQ4?=
 =?utf-8?B?cStkeExJb2hpeHVWdG1GMWVEekRBOVljNVVlcjI4cmRJUVA0OEhycmxvdmpP?=
 =?utf-8?B?K0UvWmNWTXgyejNWVVJlbHQwTER4eS9XalhOajlYSzMyenhJc29yRXBlaDNu?=
 =?utf-8?B?am1saGhuOFdIdWNMMHBjejBYSDZxaVRVTXA0WE0zVEtvZnZNQ1Jab1FpMUN4?=
 =?utf-8?B?TTlTMmJhSkg2UWN2Y0pNL3dCMXQ3MlgzR3AwWjEwUWJIM2x6alBzcFNndkJy?=
 =?utf-8?Q?4ZGk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QlQ1T2xQeVNsVWJ3U0FIY1NONHVVOGJiSGFmNGhlbHNiOCtTMkNPZ1RqWUFS?=
 =?utf-8?B?MG54aHBtY3dGNFZSN25UdllMcjB1Q3FUd1JoNUJuYkdpYnM3SGE5RE5RTnF0?=
 =?utf-8?B?eDVRR08xWHNTQjVXSTJYRDg4YXlaN01JSFZWanU5LysxZ3h2VUhKMnNnQ1Fo?=
 =?utf-8?B?Rmhzc05hZDAvbndqVEFZcFNxakFHa0dublNiUkVLYVBOanZNZTQvcGFpWXRJ?=
 =?utf-8?B?Y2ZVZDNnd3JxeUdUa1d4WmFndGkxTUZGemdXMEh3RjgwdlczUlZoSlplZUI3?=
 =?utf-8?B?RVllN25MQlRTUkFCRWRTU0VINnVydUw0Qk43LzVDSDhUUTBzU0t1SmlHNTJs?=
 =?utf-8?B?Ri83SHYxcURpZFNQaVNvb1dreUdVZjI1Ym5tMmpzSW1sRlVNTHVQQ005RDFD?=
 =?utf-8?B?aHlsVE5PZm8xcmZONzNXcUVtdk5tODZsd3NFbmxMYXFlamI0Y2FPMG5reFcr?=
 =?utf-8?B?RkxtWTVtUEhESXBQWlU5YWtTRnNZK0QzY3NqSWxDOHdwRjJXQzQ0bmNsdzZ2?=
 =?utf-8?B?OGNUeVV2bStFdTBVSENNNmhyZVdKeWdpMDJoRzVnRzBmdVVjdXM1OEdnaUU3?=
 =?utf-8?B?MXdmMHRKTW8xdEFqeG9kTmJPbFFmcGg4ZUNEdVE0R1g5K0VSOUlkV3FHRW44?=
 =?utf-8?B?R2xOYzZib2hzTUppUmdnaW9WaW1ueHhVdHNzT0dVeUhEVlRPL3NWY09WTHJH?=
 =?utf-8?B?Y3FHZmlKOHlYV2d1RGNkYXFIczZTQ0hNa1g0WC9SaS84NnVIUEpFY3Z5Vkxv?=
 =?utf-8?B?RnhhUVV4QXNNd21PV0VCUDBSZTdscG13dDRmeFNON1VzbkEyZmhZL0c2czBU?=
 =?utf-8?B?TW5sSWUyei82ZUJURE5lVjcxandkM2NnRkxtcFJySW51U0JScUV5QjN4MjVH?=
 =?utf-8?B?T0RnV2xDU01tSDl4Mmwxb0c2NXhzQm9yVjgwMzVqaDl0MU0yRWRZMDNQTVAz?=
 =?utf-8?B?Ty82cHlWUVh6ZzhuVmNHUWYveHNQWit6Uk8rdzhYYUc0MGJQNDBEdWJaTm0r?=
 =?utf-8?B?SjAyYWFLZmJsSWFvMEpTbWx1dUUzNlRHa1Ywc1NZQVNrZGJiczdScC8vSVFm?=
 =?utf-8?B?L0cwR1g0UHR3M3RRUHhaQ3IyV2gyYkhGZWRMVDV5cEN0TXVSNjZJUDFlTFpD?=
 =?utf-8?B?eFdpdjJtaVNBVDhid2ZSWVlmR2p3MW1rZkZEbmcwdWxQODVybXEzU0xreGhB?=
 =?utf-8?B?bzBhczZNUUJoNnZVZHRDcS9UUUh6MnNFdVVJdlZWNEtkWU16RDc0dGtpc0xL?=
 =?utf-8?B?MlROb3oxMkZIalhZZFBydEhqWFNoSDVIamtEelY0TWdIZnRXeFB0aERNdk9X?=
 =?utf-8?B?RUxPQys3RFRPenRWRFlGVDF4UjRBbkp1OXpTd2d2QWh1aXk1bG53RWVISmhE?=
 =?utf-8?B?SEpIM3Jsc3IzVmw4N09BYjRTQURtWDQ2ZWJLZ2NFWS82STdDMDlVeCtyd1Bu?=
 =?utf-8?B?QlptcjB2cTBKZDd1YWZLVFZrYTRGQnpqU0srT2xuZnpTSWVGSTZUL0pZS3Vy?=
 =?utf-8?B?Q3NidlNmSHpUc0pRYXhBZkwzZnRra3prODdibC93bUFIZDJtdUd3Y2RxOEZK?=
 =?utf-8?B?RDBhNG42QzMzZjA0Y0V5ZW9TUXJoUWM0RU0yQmd5ajdvWUZHSDk3cDErQ1dZ?=
 =?utf-8?B?OUpqeVYrd0cvNTJXSndrWDlTRTVMUTB5a29PclhFbXk4dmNDNjdaVUtYL3pW?=
 =?utf-8?B?NUJPTDlDZHpKUDZPMmh3R0tlOFAzc3Y4UkM1bVFFQUI5eHRTSDk3ekpHMENo?=
 =?utf-8?B?WEVPd09yQkhRMW1ucDRYYWRzUVBWT1dLMkJ0dXd3MkRNQ2dFMzQrSlN6Rjdm?=
 =?utf-8?B?VnM4ZTQzOGhRRXRsb3ZlS3JZODhrTzF4eHN2emtoR2FpNFcrUTZheFZrbzg5?=
 =?utf-8?B?eUhtRzV3NE1TNDF3MFJDblJQaE9kNC9ndGRDYVFyeFh3L0lDUjdJL3ZpT2dE?=
 =?utf-8?B?UnBlaEtic1g0VGZ0T1ZBaU0vVUtLZFZLZmFzRDBqc0k4S0QzaGk5MXFMZ1RJ?=
 =?utf-8?B?SGt6UmduRFJoWXFsSlpNaEw1Z29YNThIQzlDb1lGZ2FUUEU2Y0MzSld0QzlK?=
 =?utf-8?B?S0pORWZyNXVqMGNzMHRadFZUZ2tUQzRGeWtBSmltR2tuWGtLVXdFNDYrTy8w?=
 =?utf-8?B?MUVaeWFZL2cwWkVFREhLWGEyMUdyNEx5dldBU0lYV1FJUU01aG13TXE2VElQ?=
 =?utf-8?B?Rkx4UmVDVVV2S2V3UWRjRzZQSlhwTXNQNWp1ZUp1VEFmWnFqR0gvMGswbkRE?=
 =?utf-8?B?NVAwLzk0eDAyLzAxWTBvM3lZQm9vOTd2Y2pDUmcrckQ0SFRWd2pjeWZqMVds?=
 =?utf-8?B?b2hQT0JFeW1wQ3l6QjhvSUZhR2JEd3ZPaEtrWUQ4UTFxNnFnVkhseHU2dnJE?=
 =?utf-8?Q?mW2bZGC1nD/1Pml4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 709fcd56-201e-410e-3624-08de5967aed5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 03:38:18.8135 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Eear9kQL5xmLSmrWNHVX/982DkC0dmidWbBeX2uxhrds16eFrnLd4U0sLLg5wKlJk7ihreH0Km67vzxTzMMbJMJTNNagIt2XS56SHp0U4M4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6677
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[intel-gvt-dev];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[intel.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ankit.k.nautiyal@intel.com,intel-gvt-dev-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 2E2CB61632
X-Rspamd-Action: no action


On 1/21/2026 7:15 PM, Jani Nikula wrote:
> On Wed, 14 Jan 2026, Ankit Nautiyal <ankit.k.nautiyal@intel.com> wrote:
>> Include gvt/display_helpers.h so that the display register macros in
>> intel_gvt_mmio_table.c expand through the exported display functions.
>> This lets us keep the existing macro calls while avoiding direct
>> access to display internals, helping the display modularization work.
>>
>> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>

Thanks for the review, pushed to drm-intel-next.


Regards,

Ankit

>
>> ---
>>   drivers/gpu/drm/i915/intel_gvt_mmio_table.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/intel_gvt_mmio_table.c b/drivers/gpu/drm/i915/intel_gvt_mmio_table.c
>> index 478d00f89a4b..052596ac83a0 100644
>> --- a/drivers/gpu/drm/i915/intel_gvt_mmio_table.c
>> +++ b/drivers/gpu/drm/i915/intel_gvt_mmio_table.c
>> @@ -11,12 +11,12 @@
>>   #include "display/intel_color_regs.h"
>>   #include "display/intel_crt_regs.h"
>>   #include "display/intel_cursor_regs.h"
>> -#include "display/intel_display_core.h"
>>   #include "display/intel_display_regs.h"
>>   #include "display/intel_display_types.h"
>>   #include "display/intel_dmc_regs.h"
>>   #include "display/intel_dp_aux_regs.h"
>>   #include "display/intel_dpio_phy.h"
>> +#include "display/intel_fbc.h"
>>   #include "display/intel_fbc_regs.h"
>>   #include "display/intel_fdi_regs.h"
>>   #include "display/intel_lvds_regs.h"
>> @@ -32,6 +32,7 @@
>>   #include "gt/intel_engine_regs.h"
>>   #include "gt/intel_gt_regs.h"
>>   
>> +#include "gvt/display_helpers.h"
>>   #include "gvt/reg.h"
>>   
>>   #include "i915_drv.h"
