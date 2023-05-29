Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A48D5714C32
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 29 May 2023 16:37:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 286DE10E2C9;
	Mon, 29 May 2023 14:37:11 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBE0410E2C3;
 Mon, 29 May 2023 14:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685371019; x=1716907019;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=G7gJyuhFaGRILYR2RM5p6+D3e5QNITAOF4tOi/zcjZo=;
 b=SXVORaySXaosWjXzBZpik71fAz9gkNBfjMgiMfJK5uCfKCsJvUcblYcf
 0PPo6PhF5MuhSMtL9TS+an4yK72A0/l8xAuZL+nPsggf1LxNplJXcw+cv
 2e5kXXuRSzjmH2fyXgfeCBob5RDE/KkBRpR22VxeETgS7TSintSTb+Y/A
 U0bQlN/evnBxtrM9hh7yRMYscEWvzUtdWg5WAt1L5zkqD72JQfp/2rNfA
 oEYYKHaBzXrnjSORh4zZVs9Z9ihYbxO2jyPf/WiPIqsxFhub1CE0DclAP
 ZHQoPAc88THv6meZp0CNVjyxj2voDEPRO6+m63l6HODXkcO4rq49ubJ3a g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="420475234"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; d="scan'208";a="420475234"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2023 07:36:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="850422633"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; d="scan'208";a="850422633"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP; 29 May 2023 07:36:58 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 29 May 2023 07:36:53 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 29 May 2023 07:36:53 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 29 May 2023 07:36:52 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 29 May 2023 07:36:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q2QSls9DeC3DFWmbWhJOAhEnvkw3zwCS0KiS/jIp8gNa21NyizkmCLcwQybAyFP8E547CJF8Xs552kURN0WBgcBTg6WlaXOZYbUvB8raEhMYTRTbKuQ7dPNPX+v/IsO5k4CXE1DWYtcwtErOrUiXBj0pEhGhFZqPXZLh9GpgC/Q8wT9Gl+W5TxBcdmwCBVw8P3vVTVgTLElDbFgjdY7GxVUQoolZ4EOwgGQP8RAVq+p+NFi3hQoIc9DS1tRO6PifY6dhAP5VxZCyf5O04x33M76UR++680M9wBchwmoTL7fkqhlSGbCJSgHSrzJ8uQbeV0LQYIQngC1jWYVRL3LlYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gSkTVNbHgaexMCFEqaCM1d0uq1jXIB4jC2QBt8IVoUI=;
 b=DRGyFVs26RbqT/07TZw/N1XZbZ8vNX3WpBYbhzIKBXY1ZBavh4amz0g9UEcfQtJ85004yk3wY+J+63UXJqMizGuhxsPxnLN07BGbhSaeozuPc2ogHktpXQZhw1waj2+sfcBtrVbtQeh3RlGp9595l2M3/dudzR0orfZM2tYrxhAN3SNIyugE7yBBsE2USaFWjvVGtNgKGPwwqvcgDtW5F5vBaVRFjGXrYyDa4/l+uhwzvu4mnBxwdUp0zYCp4WHgaXuj1HfTlVuaJ14oc/2N9eucfx1pd9F+23+TyaKTCUfNXTgLYAH2FMkysxWRZWRxjxZJ5E95pcQbm7XGmblVNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5549.namprd11.prod.outlook.com (2603:10b6:5:388::7) by
 PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.22; Mon, 29 May 2023 14:36:44 +0000
Received: from DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::1fb5:ca10:6240:e80]) by DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::1fb5:ca10:6240:e80%3]) with mapi id 15.20.6433.022; Mon, 29 May 2023
 14:36:44 +0000
Message-ID: <3e5b2e4f-b022-5fe6-b49d-6fba24a75bfe@intel.com>
Date: Mon, 29 May 2023 22:36:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 14/15] drm/i915/gvt: annotate maybe unused gma_bottom
 variables
Content-Language: en-US
To: Jani Nikula <jani.nikula@intel.com>, <intel-gfx@lists.freedesktop.org>
References: <cover.1685119006.git.jani.nikula@intel.com>
 <7e1c475bf123eca6935a1be099cc0608bed49b0b.1685119007.git.jani.nikula@intel.com>
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
In-Reply-To: <7e1c475bf123eca6935a1be099cc0608bed49b0b.1685119007.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2P153CA0007.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::8)
 To DM4PR11MB5549.namprd11.prod.outlook.com
 (2603:10b6:5:388::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5549:EE_|PH7PR11MB7605:EE_
X-MS-Office365-Filtering-Correlation-Id: 71b21ceb-6b84-4f6f-11d9-08db60521fe2
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H7pMrUAYKz6I1nnryCvVjePJKugmjHmaOkRZNvtjLIC5NxLP+/hwer3IH3dVjFajzNDuZMTUHxU1e9ChFSYp1nymZBSSoyw8lK8rMKUZvJTaJVGZ/qJa2usxsPadKfen8FKESTz6/+/YQJyH8H+ncmsKJOfqa5D0k/rTwiOUQCWzV9dT0d6PhXcQ9287nmlsmhgNDqfMRR2ckwHxpQO+tnkiY+8Qi1WO/1eM87hUMvLNSzpBCCX4xRMFwIQaPHgfpQ+Cp9H89CCPw11NJmtrFnV8clfaDPBudKePxOBjGb9ezOEtHiUe3gBwxOrL+C9qEqVdFALvWY/EFVB8hMaiyicQuDY++lliDSI65QVrvFGpftvOr1bBW/SxQzxpaGGBkYijAIJP2DcJrOraWLAFiojcyU0/ZGYxf45K3c0v2mjCIhByeFHDP+ZPqbuNDbNfPatcbpx2QenGAsO4b6n0Doq0o7AODsJRU+Ght9qtsUygMNf/x6IQ6Hbsv1R5Gk6HB7NvrElTmBF0xdP8scdjpqjxI/gSd0KbJPh9PEJrqsWBHxr7ZymiKCG+JVa24mD+00/2Cmo3Bpl0imRLSEjtLXIte7+9in2MYFAhi1kPEpRfPQw8SeAqzyfUglZAIEsv2ozy+FdVry5xpMWMDXMa8w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5549.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(136003)(396003)(366004)(346002)(376002)(451199021)(6506007)(6512007)(186003)(31686004)(2906002)(2616005)(53546011)(26005)(478600001)(83380400001)(86362001)(8936002)(6486002)(31696002)(82960400001)(38100700002)(41300700001)(8676002)(5660300002)(36756003)(66476007)(6666004)(316002)(66946007)(66556008)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TG1jdy91ZzRmeU9weEJJR1h6dkJyNE9LbFA2eDBpMngxSEpuKzY1UlVMMlNZ?=
 =?utf-8?B?d0hLQTc0YiticFdoTEczcUZkYUEySit6cnhvcmdsTDdyRzFZbjBDcEk4c1Zh?=
 =?utf-8?B?TUFyQ1NLQ0FNekg5VTBoYk16bk5UbmtzS1RveHN4SlJHcGhRUVBEUWkveTVp?=
 =?utf-8?B?R3ltUTY5Q0EzM1VqWkRzYk9iZit1RFNvcmF0TzBSU3NyRmZQaXdKZXlLeW5W?=
 =?utf-8?B?YjJ6c1VpU0V4ODhrbkFkNnBnWHJCRkRPS2NPbzBRTytjelg2QlBTaUUyOXZx?=
 =?utf-8?B?LytZZFdIdzBDYWVwWExyejdldllvZ3hQMEl4K3RITFNFU2ZXeUsyUG5leWhB?=
 =?utf-8?B?cGtsNEE5KzU5cmNVdmNqNWxORDF0N0NYTUdsamp4WEM2V3JVcThWbUNrWGlK?=
 =?utf-8?B?bGM5dDc0bElvK2RVS3BSekZOcWZOcnl1YVRGYW5QWlFWZnRFc2VpRzE1cElS?=
 =?utf-8?B?dEF5cGNQOW9GNUxrM0pIUHRVekVQN0EyMG44OGV3bEppMTVqUTVvc0IxWmxj?=
 =?utf-8?B?OTJHeGpTdWEwVndRd0NDWDA3dnZ4YWNaZzVGTVk3NU1lUDJuWExLWjRVejhN?=
 =?utf-8?B?S3VySFFZclMvaDRIRmI1U3dpZWQvT3dJdFZqR2pVNkhWTmFBb1MvUDNST2s4?=
 =?utf-8?B?aFBibnRzTzFGMW13Q3VsbjNpZnJTTCtjVTBYZ1hkbFRhL3FRVTNuaG1FRmpJ?=
 =?utf-8?B?cnRBdWFmenExN3hWQm1vZlUzZmN4OGRGdSs5ckR3OWZGdzE3WXhNMmRySXhk?=
 =?utf-8?B?ZzVnL3plWGNvRkh1Mko0S1RDSTc0YVlwemhzZm1YeFFZUjdFdXZLVm9zcHVq?=
 =?utf-8?B?M0d2VkpSRmVlRjQzT1VVb1FVVWVpeWFSOTVsYjFNZXhsbVFNdE1Wb1VaQVlW?=
 =?utf-8?B?SWprUkwzK05DZWZKOUxsSVpoYW91M3RPcWJUZG1qN1Exd2JUbzRuemF2aFRI?=
 =?utf-8?B?MVFaNUw3V215b3dNZllpcURsZlpSWUs3Nk9jYmovUElISk1jS1NXSFR3dXNO?=
 =?utf-8?B?Z3dNTWZDTXFXS0tGZXVxL0RwOWIxYWFNcDkrcXg1djNyelVGeFltTVVnSmhs?=
 =?utf-8?B?NHVoTDRKN2NOREwrZDBraERhVytTQkhwWXhtcWZjWWVDbjE0NFNLZ3ZLbnRM?=
 =?utf-8?B?YjZuVnF1em9RRGdvT0Z5clIrRUZIcll2MmE2bXVUL2RJOG9tT1VsdEUySjVU?=
 =?utf-8?B?d1AvSllJdk0zeEQ0RTIxVTA2TTVkelpTSU9MNlpqbXBVVXRqVjV2M1lCV0Jj?=
 =?utf-8?B?N1NqdlBmSEFIdndVdlNRUi9tdThGTWVPM3loand0OHhVUHZSZ1ZncDVCUE9F?=
 =?utf-8?B?bWVLaFV6aW1oMnJ0d0ZRNGIwTVJhZ1hXRlA4U0lTZ0hMYVZaMmhMM1kwTlRq?=
 =?utf-8?B?N2RqLy81SXlZcjRINFZsMVhMTFhab01JeWMxaW96MFFBdmZYZnp3M3NLS0JY?=
 =?utf-8?B?aXlnT0NtS3ppcjlKd2xXZ3gyWXNDN2JwbXJwUFdUL29oNFQ3dTY4SUw1UEI4?=
 =?utf-8?B?YzhiUmdCaVJBaHNFc01na2loM0JZc0E2NzVId0tLN3o1TjBYNVdYR3VMV2ZW?=
 =?utf-8?B?VkMwaEwrTytWN0c4MW9VU0tVMkUxSkJITW9QL1FLZndySS9KYk1XU2dnclR6?=
 =?utf-8?B?UFJ4QVcxRVVZMlFqREZUQTU0MUU5T1F6dmZ0UDlPdndzY1BaRG92OU91R1pI?=
 =?utf-8?B?bHBuUUdsYy9rcWpFYzZIV3hndjFGcnVBZ1VaUG1xeTliQ3U4V25yOGtVVkR0?=
 =?utf-8?B?TGp5M0dqcGhEVnBTMXJScDd1NkFCQ0Z6Z1BRMUNnZU9vS3FVY1VuNE5rYUVm?=
 =?utf-8?B?TkczQUltQ2tHVzQ2TTBONFFZL3JDU3Zra1ZZNkFiQnZzelRrVkFUWWE0TnZD?=
 =?utf-8?B?TlpZYWNHZm9ZQUpGMzJPWGVVUnlwRGU0czFEYnhmcjl3cUQvcERvaUpiVHR3?=
 =?utf-8?B?dXRxb2JLTUpKVHExNGh5enB3MEpCTktBRHRqZWNMZzdkd2d2bHpFNFFwQ0U0?=
 =?utf-8?B?MVhOT1hENzc0M0swa3pjU1NRWXZGL0FnSmozL3pGdTB5TmtaZmZMcnhWSFYz?=
 =?utf-8?B?SW9NaTRXdHoxRWttTlRSZUlUY1ZPV29YL3dBTTFVOVNqanE3L2NmQWJXQm0x?=
 =?utf-8?Q?MzOl3jPB3JyJYE5Aa/YF5MAPB?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 71b21ceb-6b84-4f6f-11d9-08db60521fe2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5549.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2023 14:36:44.5306 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9GWkdZNVUhiu8JQO989TANY+X8LANEGVUN6NuwqCaEMFljUvR+zB+ghEv9vt8L+HsoqLR8GynDsi71rDzEnVpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7605
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
Cc: intel-gvt-dev@lists.freedesktop.org, Zhenyu Wang <zhenyuw@linux.intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On 5/27/2023 12:38 AM, Jani Nikula wrote:
> Prepare for re-enabling -Wunused-but-set-variable.
>
> Lacking a better idea, annotate the gma_bottom variables with
> __maybe_unused.
>
> Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
> Cc: Zhi Wang <zhi.a.wang@intel.com>
> Cc: intel-gvt-dev@lists.freedesktop.org
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> ---
>
> Frankly I'm not sure what to do with these. Maybe the variables should
> be dropped altogether?

I sent an patch to fix the warnings. You can include that one in the 
series. Zhenyu, can you give an rb?

> ---
>   drivers/gpu/drm/i915/gvt/cmd_parser.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i915/gvt/cmd_parser.c
> index 3c4ae1da0d41..2801e17e5522 100644
> --- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
> +++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
> @@ -2833,7 +2833,7 @@ static int command_scan(struct parser_exec_state *s,
>   
>   static int scan_workload(struct intel_vgpu_workload *workload)
>   {
> -	unsigned long gma_head, gma_tail, gma_bottom;
> +	unsigned long gma_head, gma_tail, __maybe_unused gma_bottom;
>   	struct parser_exec_state s;
>   	int ret = 0;
>   
> @@ -2874,7 +2874,7 @@ static int scan_workload(struct intel_vgpu_workload *workload)
>   static int scan_wa_ctx(struct intel_shadow_wa_ctx *wa_ctx)
>   {
>   
> -	unsigned long gma_head, gma_tail, gma_bottom, ring_size, ring_tail;
> +	unsigned long gma_head, gma_tail, __maybe_unused gma_bottom, ring_size, ring_tail;
>   	struct parser_exec_state s;
>   	int ret = 0;
>   	struct intel_vgpu_workload *workload = container_of(wa_ctx,


