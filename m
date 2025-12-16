Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B188CC1C98
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 16 Dec 2025 10:29:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D665810E93F;
	Tue, 16 Dec 2025 09:29:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZvwLCqi6";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C57310E92D;
 Tue, 16 Dec 2025 09:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765877348; x=1797413348;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=cckBCAel8VPAAM5jOBuwcS+kOF9Op+IZOr+WJdkPwRs=;
 b=ZvwLCqi6fIzhsKJF9f+Hn+DND7vRDTohKnGcExge2VDwyjLOpK0Cj5p1
 /dXmDyPFROS3lw5Kol/G7VRpCoHtJN8gY9a4ztBh6nf2lJWmuH2QzjcWX
 WG+V1AAIttSr+pEIgl/fWa7hKyLlRx7dzU9fQfSZKQXDChfrCODg6nK5X
 0HrGHwR5CyMHjYZ/JNT9NRRcImInUnfWEm/AuIGXv5OpMdvQlj1IIZS/C
 UBtnrMkTaWxNe3FDuRWHVWuD0fgtX1l+eHGAwglVAp1OZQlNrYhElm1DX
 pL3zvGucQm9+fMzOMq8f7FZ+/VcxmxDe2x7T0uAviEbe1O+nymJkbQQ4K w==;
X-CSE-ConnectionGUID: +64EfS8uRsKsJIx7KrOGyw==
X-CSE-MsgGUID: wJcs+4XbTHyQu9YG7tML/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="79159340"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; d="scan'208";a="79159340"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 01:29:08 -0800
X-CSE-ConnectionGUID: 1GgTCm6VRouCgtnjeMIpDg==
X-CSE-MsgGUID: x+nSlnPzR7Ca3xkJWn2t2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; d="scan'208";a="202881787"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 01:29:08 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 16 Dec 2025 01:29:07 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 16 Dec 2025 01:29:07 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.67)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 16 Dec 2025 01:29:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sdVd/hBwGRDCpEZjieD8mNGOT9u67gk5MQ6Vqq35MCjFG3KAtLsQc+vDTSsQonrr/Iaas9e+1vm2qcwoLpDC/jC/UKuT+9/0o/CHvSjIARBuINs4MmasICgv/XPDADmhqUDa/x20s9kg8VafiiARUagy/i/t25F12wuJiiIHKPMFWXO5aUAoMuM03TQKFmEOaLPTATggz4+spwAJMHiDOTpoQyZ1nITy7GfJs0iHORA/OQF39w3K5QzTuVYZhODJ1Dc3S9J/ocZ7dPUqReB28J7o/Tb1lk1ydFj7qB9QtceMPvICaSsEqnuDmnc47CQUfmpfVRI5soE/5dKS1aYjkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rgjjynrl/dG0yPr0e6ScbazjddgesKOHbYhFqM0V51A=;
 b=FSOUH7Iho/1SMF3lIqFNUJcRLfNMlTlP8/nk+/Yv1QALKIabQtz//GIJ9vzdcR/b+Cd/tjqwbFUNBecslTmNPz/OzcnUtGIPf3VuScPBJyPplhuafFwt8kXCQZe42w7i62kkElpFJcYyeb/PyXu+PxqPzvWk+8VcehkV7RiMe1Ceh6Phw+fR74oEH9uagqAGH0WeVHjXMinxZ6hBlBLDHsHucUIiAjiCTm/WEAW7IJR9hoMg/dXKsY+HDO5wKKTMEVGWngI76CY8hhHt+1eEiPepzAfxaFlgLD+vaO5yELOT+iwk3vo41dDZgI7c0MYipArbTIhrwbRN8FZdYvLrOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by DM4PR11MB7397.namprd11.prod.outlook.com (2603:10b6:8:103::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 09:29:06 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 09:29:05 +0000
Message-ID: <58141353-62c3-40aa-9cae-3d3805f0580e@intel.com>
Date: Tue, 16 Dec 2025 14:59:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] drm/i915/display: Abstract pipe/trans/cursor offset
 calculation
To: Jani Nikula <jani.nikula@linux.intel.com>,
 <intel-gvt-dev@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
References: <20251215111842.2099789-1-ankit.k.nautiyal@intel.com>
 <20251215111842.2099789-2-ankit.k.nautiyal@intel.com>
 <9c87d4900c7ab9aeeaaa3336544230e0f4e47cf5@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <9c87d4900c7ab9aeeaaa3336544230e0f4e47cf5@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0187.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ac::12) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|DM4PR11MB7397:EE_
X-MS-Office365-Filtering-Correlation-Id: 8be6dff6-78f5-4802-02d2-08de3c858eae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QWJTT2lnZXhHeXU4TS9WOS9UMUJHTEN3UDBoQnFuM2FldGpGSWFYc1dIVUZn?=
 =?utf-8?B?Z3FPM2txMWZIU1Bpd0lDaXY5aGM0dXZkLzh3d25lRVQ2ME0welIvYUdydkJ4?=
 =?utf-8?B?aDZoSG9Ec2Jma0cySzgwMFM4Q05ody93WnUzczlsYzdjMTlkTW9HYWJBMmZ2?=
 =?utf-8?B?b0xVUEhtZEMzaEh2TDZWNXJpMGJkLzdFUGtjV0lwOE53Zm9iRnpDeC9RWDly?=
 =?utf-8?B?WXY0NHZjR3lQTHAwSjgycTB6S1Vib2EvMFRlRDg1eVlRVEFnV1ZNNGJaUm5N?=
 =?utf-8?B?Vy9NVXlQS2dPN2dhS2I2WVFhRVhXTDhGSlVyZGl2SEtQRGM2bmdDUHlqNHRV?=
 =?utf-8?B?a3E5L1d6aDFHMUZMRG9KdW8yd0FvNmlZc0J5emRud1h6T2MyRU5BejlaemNU?=
 =?utf-8?B?VkNTK0hlaXlPYXRYUU1GS3NDOGhjR3RhVmJ4SXRuaVNPd3kwS2VaRzRjeXlw?=
 =?utf-8?B?SnRrcjJFeTVleFdsUGVkZlBJTTNxZStpY094M2tEZ1JqWUdDeFpvZ2JVc0RE?=
 =?utf-8?B?MXd5R1dOcC9OQTFXWnRLNFBPcjk0d1BsVjlZVHJKdklDb1k0Q24xREx5Q09H?=
 =?utf-8?B?ck1ycm5lbG51UUQxYzZFSWZYM2JnUTdTaDdFZjlEWWZHOE9tUTR0UW9JbHIw?=
 =?utf-8?B?YjhsK3FORjBvRVdTcXNkMkxsbm5mMTNZbk5ZejFicjdheFAvK2F6d0laUlRu?=
 =?utf-8?B?czU0NmVkVDFoa2xOc1BmeDlzcVhFcEJZL2dsbTVMZnlMTUYrSXZ2WkY3SEty?=
 =?utf-8?B?RkVwQWJsVjh3RFFDNXBHNHQ0RmJGSGhlY1pKWVUvUWZHUGplSHZLdlRISjhD?=
 =?utf-8?B?WE4valZ1aVA2MmszWWVvRUhISFF5L1lMbHdZdkhLMkdSRE1sMnUxQmVGYzd1?=
 =?utf-8?B?MksxanhkclNOcFdsbjU4NXFEbXNCK2JLVGQ0WUljSFhleFEvdzJxQy9UbFQw?=
 =?utf-8?B?RWVVb1puYjFnQ3E3MjhQQzBPdWVTTGVDQnQyVjJ2N0kxNE5uUnc4cUxGU1Nq?=
 =?utf-8?B?cTZoSllCL00zK1dlaUhVdVUycEFiMzR6ajhlVGI5Q3ljTkM4SXFzcThrUVA4?=
 =?utf-8?B?NWRkVU44T25wclM3ZGRqVnk2UzNnWWNiSTdpUzd6dktMOURwYXNwYkVQbXhB?=
 =?utf-8?B?KzhKNTZxVWFCNmhDMTZPT1Mya0tyeGtIVDNDT2FDR1R6amlLVXJSMU9GeFll?=
 =?utf-8?B?bjVqRkVyOW5vc3hIY05ZUEY5Z1ZTV3lXRHVaMmkreGxPU2kwN3BzV09VZ2NV?=
 =?utf-8?B?WVZjc2RBdDNqTmQrL3I1Q2tKSnR2cFNCSW9EMGtMWW9SRHNjZG11RjBhVldP?=
 =?utf-8?B?dkR0OHJBTTVMQ1ZFSXlPb282aDBXdThJNFZ3R2x4UnRwSk1RNG9YV3Axa3Yy?=
 =?utf-8?B?TjBXcTBOU2Flby9Ja3BVaTY3Q3cvemIvc2E2OU5TNG5YbkI0TWhMeFlpL1J4?=
 =?utf-8?B?OXFDdCtVMUhEMDEwaFEvRDh6Y3owc2dRVUpkTklWc1JtUlhCdzFzRE50dG4y?=
 =?utf-8?B?R1hmempFME5qYlRyWjZaY3VSZW93Mm95OFJ5d0g0OXNsZFVULzNDc0VTVlRI?=
 =?utf-8?B?ZXBkNHQ4M1orNDJlYmJqL1l4N1hqVGw5bGVCSDhMSm1QTENjT3pjaHl5M3pv?=
 =?utf-8?B?akpjRE5UeURxUy8wakRKUGlnZitKUkhLa1k0M1JlS2FpeUJmZjJzZEdQcS9h?=
 =?utf-8?B?VnlubncrOGxMeVZ3S2pTU2kvMmFyL2JxN3dVS05yYTFXaEY1Vnc1SHJ5OW1P?=
 =?utf-8?B?bU4yUjlsRmR4ZVhYUE5QejdqaFlvK2JVUU1UalFzYjF4UkErT0o5aFNIVnhJ?=
 =?utf-8?B?dkdUTElXMHkzUFpqeStENUJDV2Y1andmV0E0QkJHb0hmYWx1K2Z3dVhRTVhj?=
 =?utf-8?B?Um1ObVJCZ2ZaOHBWczRFOEdJdEc2OFlTQW5LZER2OEl0aTQrMDNlUkRVdlY5?=
 =?utf-8?Q?0Zvgyn9QG+fyalXbIYPgHYeJJJxwuIHf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2N6VEU2UzJ0N21acFl0RStMSVA0SVZncXBZSTJnVVF4Y3dvRnFjQmkzQmJC?=
 =?utf-8?B?M2poRUlvQW1SdkdCWjdkNHU4QmNxakdpai9jWE9CTHpUeUkxRXVYL2NuOWZp?=
 =?utf-8?B?RmFScXJLVXY1clRldllrMXY4MlMrNUVNYWZ1VDZzd3JjRE1KaTNadWJTNFVC?=
 =?utf-8?B?d1EyUnJXVGNIdFpMMkRjblFFandjd0hKT2V0aHNpeGtwQlYwWUQ5dFVwb1JT?=
 =?utf-8?B?ZDVyVTloRklJdU9QLzhMQlBHY1M3LzN0MlFNSWNBUE9GbEV1WHFIQjBDdE54?=
 =?utf-8?B?VldCWldOOUk3U1VXSFVwV0lsNzNCQ1Vpdjl4NmpmVFVGVTMydHM0K1FRZm9z?=
 =?utf-8?B?Lzg1OVVvcmtjN1Y3SmZsSHV2cmpaL1pOQVZuMzkyLzRhU1ZxZGkyeWlaNi9D?=
 =?utf-8?B?dzdDRjJqZldONWFDa3VBL3lycmJzV2RvTDJwSWhvSDhVazQycWZsQ2JOZlFk?=
 =?utf-8?B?Tm4zOGNmaUV6U0dQSm5tNlo4aEEycUtzNkRjLzJ3MUtpM09JdlZDa2Y4VEo1?=
 =?utf-8?B?REQxWURTQzIyUVZZSTN0YmFkSWZmRzMyYlFTR3ltZ3R3NXpkNmp4ZkdSQWZK?=
 =?utf-8?B?di9GTWVwdmtrU1JWZzAvTWtBK2RGWDFjcFlQTnl0RmNJK3djTXJyMzhEcEJK?=
 =?utf-8?B?eVptRkwrVkN1MHpTNlUwUGQrb21GSm05amliRWVhSlZkUzBtRkNrMXZydGIx?=
 =?utf-8?B?aTFpUUZ2bVFxWlVZNmtLc1NpcU91NXJLM3N6TXpBcnArTDV2RFdOa3ZDYlV0?=
 =?utf-8?B?WFNDa0FMaGZ5ZVFHamlTRVlBN0FBa0ZEZ2t6QmlEK2x5UjQ0UUc4L3VRUEdl?=
 =?utf-8?B?Rmx1MUl5bksvK1RaWEthb3hHR1hMS2E3MWZsbzBSd3BVUmYzdE9nN29xM0Rs?=
 =?utf-8?B?WVk3eGJzR1ljSzFKVTBuWFpQdTRsdWVzNFBITk1nTWd2ckNRTVRtNHlXQUQ5?=
 =?utf-8?B?SXdvelZ0dy93WnJRSThXQ2s4UmphMlhxdWQxN1ZQRWg3MHZ1SVlZY0RmWDhD?=
 =?utf-8?B?RnRqcnNMVXhvN05XUnErYS9pRnQydkxOQzFrUThaU2VwbFRMSnBvbERHLzlt?=
 =?utf-8?B?L2ZFRDBRZU00N1RmWERUSjQvaGZJK0ZqcFZkbW1WZTZBUTA4ZTdpQlRxVmFH?=
 =?utf-8?B?YjBvakdWSi9RZG03VHFVU1hVanpzZmhYSkFCcTlSZVg0dGlmK0FXZFJVL2M3?=
 =?utf-8?B?eW5YSmxVUW1CS2tVTS9YRXhzeTFpTXNwSVFTMUp6VDFwckNLcFBPajB4WDlX?=
 =?utf-8?B?cW5nT2NwK3h5VkZMS0VuQ1E0L0R0SmlQM1phTWF3dlZGTzVJVUlQMEczNFFp?=
 =?utf-8?B?aVM0OGVGazFBRlQ1VjhjdVo3U0ZiYzN2Y1N5cXJ1ZkVGSWcrYURtVGszeThi?=
 =?utf-8?B?Y3J1ZVJ0QzZIcFlsaFdPMTNoSWt2YU05aXlsbnVwWDFwSkVQV0ZKR09jOTVP?=
 =?utf-8?B?a2dPT0oyMUZxbW5vNytaREUxYjE3RUoyODRTY1ZDUk96WkdrdFdLV1VRUUtI?=
 =?utf-8?B?bEZTTFZxOTYxY3ZTRDJjdUV3clVQSlNzNkFxU0g3Y1lsTjdkTFZ3QlViYkVk?=
 =?utf-8?B?RmtxK0NmZURwVFlTeHFoV3RxVGhyMUlRblQ4L3pOY2RCR1M3NGNVZStzNzcx?=
 =?utf-8?B?cVhqSFZYRmNPNWJMMXR5NWhwNVBMVlJRbXlNK3cyaGlnS0dCc0NqYTZCa2Jl?=
 =?utf-8?B?N1E5WnRPblhPOTZjK2wwOFYzTnFkMXJpZW1GU2ZXbkpIVWNzTkpiTnZEZ2dn?=
 =?utf-8?B?L2s1bXoxQW5aN2xvWitjNVE5RTVraGpOWFJNak1FQmttUVY1bmVwU0ZOYW9F?=
 =?utf-8?B?MFZKcWNMaVU2ajNheW15d3ExRGJPQWU5Y05GWk90Yi8yQTIvOEtrSEQ3MkJl?=
 =?utf-8?B?VnRNZm1Bb1VBb2xybER3d09CT0hGd2dCNCtMR2pOMUlvM1dtTkpKb1FwY2tY?=
 =?utf-8?B?L25vSkxhbWdjdDRhNFRlajB2YUhjaExiRzViNUxXRlc2Y1ZpUXpvSDAzZnNp?=
 =?utf-8?B?djJLSmNPUHVhbEE2elNGQmU4Y1lxQkFHNWpBS3lJNEZUMDB5UWVHbStwUFZG?=
 =?utf-8?B?UE9Fb25aVG9DTHdVOWZJcEg2T3M3ZDFZZTVSckJaU0tvZTNKUG4ybXE5WEpr?=
 =?utf-8?B?WThtS2NpZTBFbGZ1V2pCQURndVNjZEVSM3VkWnZOa00rZ2c3aGU1dW5wakhE?=
 =?utf-8?B?Wmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8be6dff6-78f5-4802-02d2-08de3c858eae
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 09:29:05.8834 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wMBg82mq455IlQKzZ2F68PnNgjNUtjoF1E800KO7ODPzo9J2KW00R/i/jDym3pL3efmUAQzeV064DLLqB24HJLeNOAjIlT5fmWrj/DH2h1w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7397
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


On 12/15/2025 5:14 PM, Jani Nikula wrote:
> On Mon, 15 Dec 2025, Ankit Nautiyal <ankit.k.nautiyal@intel.com> wrote:
>> Introduce INTEL_DISPLAY_DEVICE_*_OFFSET() macros to compute absolute
>> MMIO offsets for pipe, transcoder, and cursor registers.
>>
>> Update _MMIO_PIPE2/_MMIO_TRANS2/_MMIO_CURSOR2 to use these macros
>> for cleaner abstraction and to prepare for external API usage (e.g. GVT).
>>
>> Also move DISPLAY_MMIO_BASE() to intel_display_device.h so it can be
>> abstracted in GVT, allowing register macros to resolve via
>> exported helpers rather than peeking into struct intel_display.
>>
>> Suggested-by: Jani Nikula <jani.nikula@intel.com>
>> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>> ---
>>   .../gpu/drm/i915/display/intel_display_device.h | 17 +++++++++++++++++
>>   .../drm/i915/display/intel_display_reg_defs.h   | 15 ++++-----------
>>   2 files changed, 21 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_display_device.h b/drivers/gpu/drm/i915/display/intel_display_device.h
>> index 50b2e9ae2c18..05bba7a9899a 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display_device.h
>> +++ b/drivers/gpu/drm/i915/display/intel_display_device.h
>> @@ -260,6 +260,23 @@ struct intel_display_platforms {
>>   	 ((id) == ARLS_HOST_BRIDGE_PCI_ID3) || \
>>   	 ((id) == ARLS_HOST_BRIDGE_PCI_ID4))
>>   
>> +#define INTEL_DISPLAY_DEVICE_PIPE_OFFSET(display, pipe) \
>> +	(DISPLAY_INFO(display)->pipe_offsets[(pipe)] - \
>> +	 DISPLAY_INFO(display)->pipe_offsets[PIPE_A] + \
>> +	 DISPLAY_MMIO_BASE(display))
>> +
>> +#define INTEL_DISPLAY_DEVICE_TRANS_OFFSET(display, trans) \
>> +	(DISPLAY_INFO(display)->trans_offsets[(trans)] - \
>> +	 DISPLAY_INFO(display)->trans_offsets[TRANSCODER_A] + \
>> +	 DISPLAY_MMIO_BASE(display))
>> +
>> +#define INTEL_DISPLAY_DEVICE_CURSOR_OFFSET(display, pipe) \
>> +	(DISPLAY_INFO(display)->cursor_offsets[(pipe)] - \
>> +	 DISPLAY_INFO(display)->cursor_offsets[PIPE_A] + \
>> +	 DISPLAY_MMIO_BASE(display))
>> +
>> +#define DISPLAY_MMIO_BASE(dev_priv)	(DISPLAY_INFO(dev_priv)->mmio_offset)
> Please s/dev_priv/display/ while at it.

Ohh yeah. sorry missed it while blindly copying/pasting. Will change this.

>
>> +
>>   struct intel_display_runtime_info {
>>   	struct intel_display_ip_ver {
>>   		u16 ver;
>> diff --git a/drivers/gpu/drm/i915/display/intel_display_reg_defs.h b/drivers/gpu/drm/i915/display/intel_display_reg_defs.h
>> index b83ad06f2ea7..74f572d3a202 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display_reg_defs.h
>> +++ b/drivers/gpu/drm/i915/display/intel_display_reg_defs.h
>> @@ -8,8 +8,6 @@
>>   
>>   #include "i915_reg_defs.h"
>>   
>> -#define DISPLAY_MMIO_BASE(dev_priv)	(DISPLAY_INFO(dev_priv)->mmio_offset)
>> -
>>   #define VLV_DISPLAY_BASE		0x180000
>>   
>>   /*
>> @@ -36,14 +34,9 @@
>>    * Device info offset array based helpers for groups of registers with unevenly
>>    * spaced base offsets.
>>    */
>> -#define _MMIO_PIPE2(display, pipe, reg)		_MMIO(DISPLAY_INFO(display)->pipe_offsets[(pipe)] - \
>> -						      DISPLAY_INFO(display)->pipe_offsets[PIPE_A] + \
>> -						      DISPLAY_MMIO_BASE(display) + (reg))
>> -#define _MMIO_TRANS2(display, tran, reg)	_MMIO(DISPLAY_INFO(display)->trans_offsets[(tran)] - \
>> -						      DISPLAY_INFO(display)->trans_offsets[TRANSCODER_A] + \
>> -						      DISPLAY_MMIO_BASE(display) + (reg))
>> -#define _MMIO_CURSOR2(display, pipe, reg)	_MMIO(DISPLAY_INFO(display)->cursor_offsets[(pipe)] - \
>> -						      DISPLAY_INFO(display)->cursor_offsets[PIPE_A] + \
>> -						      DISPLAY_MMIO_BASE(display) + (reg))
>> +
>> +#define _MMIO_PIPE2(display, pipe, reg)		_MMIO(INTEL_DISPLAY_DEVICE_PIPE_OFFSET(display, pipe) + (reg))
>> +#define _MMIO_TRANS2(display, trans, reg)	_MMIO(INTEL_DISPLAY_DEVICE_TRANS_OFFSET(display, trans) + (reg))
>> +#define _MMIO_CURSOR2(display, pipe, reg)	_MMIO(INTEL_DISPLAY_DEVICE_CURSOR_OFFSET(display, pipe) + (reg))
> Please wrap the macro argument usage in parenthesis, even if not
> strictly needed here. IMO it's just good code hygiene, and sets the
> example.

Sure.


Thanks & Regards,

Ankit

> With these fixed,
>
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
>
>
> BR,
> Jani.
>
>>   
>>   #endif /* __INTEL_DISPLAY_REG_DEFS_H__ */
