Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D00B65D182
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  4 Jan 2023 12:34:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2611D10E1C8;
	Wed,  4 Jan 2023 11:34:44 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D63D610E09D;
 Wed,  4 Jan 2023 11:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672832080; x=1704368080;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=2ixaajJ9mxAHLXbAVwR2eHEH5k2YStRjfTWcuKvzJzc=;
 b=FGUiKUkTKAmQ4ZqZpug1tsAY99VqzKhc0u8TyYfjg7A5oXtbahU4PrNj
 hYGJmj4HNVmZ+m/z5kyoaVaGvcF+1utCuT1XxNG/NVogVqbhC/PfkvsJj
 Hk+8XzLoE50+VxHc8ws8FiSjbMuLb5ZDCbhz3KxFhsrYeRx42j6AM4XDE
 3IDM1rOLGe34z4EoiDSHx9+pPn/GlcWNfbYbEy9QM3OaX1FmKOSVayfTL
 TatC0zv2vVi+l/Q8JyQVEh8DYXvHuIMQWT4n9woqIuphrIDyI+seEkOTA
 ifybQpVGbzT32WZ/NCK5RaS02bwobVCYnvAaRgwaOc5IRTdMU4amCFlrv Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="323916076"
X-IronPort-AV: E=Sophos;i="5.96,299,1665471600"; d="scan'208";a="323916076"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2023 03:34:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="779188468"
X-IronPort-AV: E=Sophos;i="5.96,299,1665471600"; d="scan'208";a="779188468"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP; 04 Jan 2023 03:34:39 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 4 Jan 2023 03:34:38 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 4 Jan 2023 03:34:38 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 4 Jan 2023 03:34:38 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.44) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 4 Jan 2023 03:34:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RHeTh1YWbaAo4p4Gvcaq+7BKX0QM0gwQkYOXSWUuWHvxUKPcLN3ysU/wsk9BoNonJRTseyc4MTz6jYhC+/jPsNsbd35gCwxVQ223rzCsis85nF8GJxB0RI4/fiUY3nCzWX3JC/cpWEHfT50iMTILyR7337nrtoLyINe1vFe9Guc6tlufqCV9axTcHtKVgJt4eB262R86vG/8KFao4l2VmHqc5YX8pneB91Kkfp4G107QsB1VrXdGyItgw5IiO+D+4Hiu6/i7ja29BFxOEUxZbEaO5PdyTZroZ2MGbfyQv1JB3lId4Mw0H0/Ti5xcH16ZZ7T74HIx8PaceIYccItQ6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W2q0vv9eZqmhzRkYvX0jXiHU6hbkb/Fy2bUnJXjkHIM=;
 b=if+i8rFCtvMuqbuUk/10v/v0OhkxJEpLVbxbnH21WUWNBiRvBEkBZQL9PJ6CvCvZhNgwwoxdJm/w6b7Y/1eNdQr+8kiEF6Kzvgcehvtr6DWj3ypm3T5PpSdKczhE8FjYsXmskmbuYcPx0FlNueGnFzmZ2IJMVYzvTQSw/LsoXTPX3ds6mZzSuPt3uvs4jls3yy6+NOd93ukAhYELZjDqMxLSiiW3KXf0W7JQ3Lej/oxHyoQfDnNvLwP2NGESawrE7UPFCDz466IbnpRPelLpbvBfLrDv1xXrt+G4F5+jJh5zjSCfqc+ka6hryW2zqGV/tD8gmNpjMNbRRlMIQn1NlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB6743.namprd11.prod.outlook.com (2603:10b6:a03:47c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 11:34:34 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::499c:efe3:4397:808]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::499c:efe3:4397:808%8]) with mapi id 15.20.5944.019; Wed, 4 Jan 2023
 11:34:34 +0000
Date: Wed, 4 Jan 2023 06:34:28 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [PULL] gvt-fixes
Message-ID: <Y7VkRDNBOJU4qkYY@intel.com>
References: <Y7UzOf7O8AaLTwHQ@zhen-hp.sh.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y7UzOf7O8AaLTwHQ@zhen-hp.sh.intel.com>
X-ClientProxiedBy: BYAPR11CA0048.namprd11.prod.outlook.com
 (2603:10b6:a03:80::25) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB6743:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d3cec2b-3cd9-45f8-db09-08daee47a6d6
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AkSiPWwIJXd/L8RdBe645A1AlZ1lhcrhYKiCpcWonY7SH/XIXq/zdWHEKt+/ElMjxYyH4+W+1st7F5HS23sDzkK/F0CyB6YriFMbCqdyv+gJ45BFdeoTz9NKvyQb8sKsNB55LX/awGHcnTpMpOrBsRSeFPTedR/ztLBvrGAH28XEbN9EDrP8A/cDHcdZn7JhR7bXnhVSP8AZZpA3QyNaQkmD4QJ3XXx8RZOMDaa0Vz8tYdVoqjYqxad01ulbBWJKhxwCexLYVjarDiRq2Pq0mUMAlcA4XEnOBhVBjs9/qZLBoNtd4XiUm9Xp+W4OkdbrrzT7dC/2XdQsqdcjN+fGu79mLVxgX5rjPxQJs0FmvmWGofdROo+0Vp9yiaBQToM/TRGgBcsiS1ZSjnwQ2gtNmW7UNeQ4aw90gNxYbKXpnFCHSyFh4X79puBTNcxl3MzgE7VUqPZRDo13fNwSJ26c8y1Eu3XGAFAO9zuKiqNdQ7Won6uUaRthioRtiDN2zmwoiUtcMScB5SgonfTmwXHSNUg0OncQoFGAGD6b+DISI34uGjCe06UKHYQQYbJ/6RTYz1KNGYamrfQPxninkRyUJKgjWtarYQWprJStpOmK8wkJ5k+3I5SAj8VvtywhjSiNhh5XzL1iS7FzbLswg75E6xXwfyrE2gBiohHB6pZFKw67wXjtNVoxYNP/eIiuiL6e
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(396003)(366004)(39860400002)(136003)(376002)(451199015)(5660300002)(8676002)(4326008)(6666004)(66476007)(316002)(66556008)(66946007)(41300700001)(8936002)(4001150100001)(2906002)(6916009)(54906003)(478600001)(966005)(6486002)(6506007)(38100700002)(82960400001)(186003)(26005)(6512007)(2616005)(36756003)(44832011)(86362001)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmhNRyt5TUNsWE5QQ1Z6STdJemxKZGNra0luMU1CSHBzWDJWaXkrSTNwSXpW?=
 =?utf-8?B?SkpXZkVINS9Xc09kTHhlempNZy9rNjRERXpMdVBsM09ucVhBd3dzbk00akFo?=
 =?utf-8?B?T0RSV25aeGtsY045Uk1yT01jRk94QzI0cnVWblBCdFZIN0tHUk9LNC9lWkNy?=
 =?utf-8?B?ZjB1SEY2U1lMQlpEc0tYUnJZeER6eUlvRlNrb25MQ1hXR3hEc1JKWmpldi9t?=
 =?utf-8?B?N1pFdVlTeEVWSnhHbWJubzBYWHhYVFErMlhHejVqL3E4ZU9uamJCUHV6RVI3?=
 =?utf-8?B?T1gvZWlMT1hBQVNwQ0pRaGp6YUxXVWhjYzJXWEl6RGJMM2FSTzFnQWJrQUFP?=
 =?utf-8?B?QkY0NXo0dkF6eStCbTI4a01kNHdIMXQrWXRBdjVCTlBEWWNmNndDcDBIQXY1?=
 =?utf-8?B?OUpoQ2dvbjlmU1Myd1lBVWNFRTRTTWozZ3g0ZW1IVmR3RGpQNjhPc1FsbGhU?=
 =?utf-8?B?ejM1S0x1ODdtamNOVkw1dmdsRXJzZkN4K0cwWEFZQW8yTlhpRy9tS28rUDBy?=
 =?utf-8?B?YzZDL09NNGdDY2hGeVE2QXQ1NXNwcUFZNEF2TzNweFBhQy9qU2lFeGRkeHRY?=
 =?utf-8?B?bDY5T2tueC9JMWROaWVtYzlMUmJ6Mk1JQU5wYitMcmRsbEF0MmRPeGNrWVhE?=
 =?utf-8?B?cUhZMXRDd1B3dkNXZC9nbTJJZm9rQmdiUmwzbytHb25sUWltRHBxcm5ka2pJ?=
 =?utf-8?B?TEpkTW4vZEdpUW1QSDAxM3M4bjViR0JjNXRWekhKZmNwbUl2VFNDTjN6blBi?=
 =?utf-8?B?TFRuOHlwVnpXRUZkSkMzWGREak5aUTNCamhtVUhtUStLREx4aC9aTCtUNTk0?=
 =?utf-8?B?UEZJSlg2ZElaNXhQYUVBWG0rUU1GemFZWCtueCtHT1lieFhKVkRvTG9qbzll?=
 =?utf-8?B?ZHdjMytHUVJGZjRmSlByVldsTkNuQld4d2ZsMnE2ZG9EZ1RRSVA1TUpPaVJa?=
 =?utf-8?B?NUpnd29KR0x5Q0MrbjhHUG9EQWt0RUxIc2U1WTlDck5YVys1cGZZT1dIUmVw?=
 =?utf-8?B?SWJibkI0L3VYdFlSWVJRVkNHaWgyREZjeDBLd3BEUU1oenVOLy9qN3FxeUta?=
 =?utf-8?B?SzBoeUtUZ0JrTlBxc091WGJQekdtZnArZThWOHh3VmNnZCtmYksrakQrYm1w?=
 =?utf-8?B?SHB0SUtUUVlRcjNqVHgwbTlsZW96dG1TNkNMMmhDazFndjBtcG0zNDVLZjNY?=
 =?utf-8?B?emI5ZGJNMW53MFBQTHo3dDl4M2RQWTRIUTFWc0ZLV1lHOS9oVmRUWUpFRGNX?=
 =?utf-8?B?WVUvSFo5Y2I2OG5USVFFdnNHWUo3U3hTcVg2S1VrS01JWFBtaDQxbm5OZy80?=
 =?utf-8?B?V1h3Rk9PRDM4N2ZHaDNxWGZrTVB4QW1LSlN4Y3dhY1V4dUUxNTdDeHdlUnhs?=
 =?utf-8?B?emZKQUtsMVpHT3ZNdU5WcmF0eks5TVM1bndOOVpJSWozQnZiMlN2T1NyQzZQ?=
 =?utf-8?B?NVhOdkVvekZ6dXh0c0p6Rk55dHRTd2lCSkVVSWpDRDYxME5aMENKSUR1Y0Zq?=
 =?utf-8?B?b0RtdFNuUXV5ZlQ1YnB0dW1ZT0t6ckdPdytmV3hsMW5DNS83aXBxdkpWY3FZ?=
 =?utf-8?B?clowbHBRSGU0MVovMnl3Mnk5cWhxT0twbno0MGx2U05iY2IvZ2tDMlBZU2ZQ?=
 =?utf-8?B?WVVvTFczc1g3a2IrR3JOcUp5OW83WkR0aG9pS3Z1eWpVNDgwdzlRVEp4eVlr?=
 =?utf-8?B?Uk44N3ptdVAxYTU2d2E0WFZSNmY4RDYrcXBFdVFmUW1OWVNqMXVPRFB3Yi9z?=
 =?utf-8?B?dW5NeW51d2NITzIrbzNab3BnWjVYSktZdzBjZTZEUDlJOEJXYU5XOHN6RlI0?=
 =?utf-8?B?anU1N3JlU0NLK09wOFFJalNHTnRiTjd2OGc3ZGhJeEZoQmhXa1h1UG1naTds?=
 =?utf-8?B?OUxDQUExOG5CM3llSFQ4TE5sYiszY3B2YzhtRUR2SmdFb2NqMjExSTIzbFIy?=
 =?utf-8?B?TzFZY2xYYnNzRm52Ny9SYjVBUEw0ZEt1dnRLN0IwbzZMT3JzdUxyazJ6ZG5y?=
 =?utf-8?B?WFE4Y3pOVStPWi8vek5Ba3h4SDBZcU12V3d2bUtSait2d1hkWWE1RDVDMFZR?=
 =?utf-8?B?enQyK21kdmFUUFBSZTJuOGFqcC9hWkJ5REpTVHpVWUM4ZDBMaFhvOUxlckhE?=
 =?utf-8?B?SFJxZVZxR1ozNmpldXd5eGZFaDdud2h0Z3lQNnZ6V3ZyK3hWTGNTRnhKSE4r?=
 =?utf-8?B?WXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d3cec2b-3cd9-45f8-db09-08daee47a6d6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 11:34:33.9297 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NoCdhUA1ggL2hfckrmCF2VWBELrualG48fBCMaoui5Sxc9lDwj0ooo7C5NaRGLonvznfqAddWvr9j91hEy2Ttg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6743
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, "Lv, 
 Zhiyuan" <zhiyuan.lv@intel.com>,
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>,
 Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Wed, Jan 04, 2023 at 04:05:13PM +0800, Zhenyu Wang wrote:
> 
> Hi,
> 
> Here's accumulated current gvt-fixes. Several of them handle
> for error or destroy path issues and one from Zhi to fix up
> left vgpu status tracking.
> 
> thanks!
> ---
> The following changes since commit 6217e9f05a74df48c77ee68993d587cdfdb1feb7:

I'm kind of confused on your baseline here.

It is including a strange merge commit in the middle of the commits:
Zhenyu Wang   │ M─┐ Merge tag 'drm-intel-fixes-2022-12-30' into gvt-fixes
commit c063c8c07864246ba3831b017cea8d3096e236a8

Please rebase on top of v6.2-rc2 so we have the same base here.
(and please remind to sign-off-by when pushing the commits)

> 
>   drm/i915/dsi: fix MIPI_BKLT_EN_1 native GPIO index (2022-12-30 04:28:46 -0500)
> 
> are available in the Git repository at:
> 
>   https://github.com/intel/gvt-linux.git tags/gvt-fixes-2023-01-04
> 
> for you to fetch changes up to 601fd0f6b2a4c776a21ab8300fe0de0726937623:
> 
>   drm/i915/gvt: fix double free bug in split_2MB_gtt_entry (2023-01-04 15:20:09 +0800)
> 
> ----------------------------------------------------------------
> gvt-fixes-2023-01-04
> 
> - Fix one missed unpin in error of intel_vgpu_shadow_mm_pin()
> - Fix two debugfs destroy oops issues for vgpu and gvt entries
> - Fix one potential double free issue in gtt shadow pt code
> - Fix to use atomic bit flag for vgpu status
> 
> ----------------------------------------------------------------
> Dan Carpenter (1):
>       drm/i915: unpin on error in intel_vgpu_shadow_mm_pin()
> 
> Zheng Wang (1):
>       drm/i915/gvt: fix double free bug in split_2MB_gtt_entry
> 
> Zhenyu Wang (3):
>       drm/i915/gvt: fix gvt debugfs destroy
>       drm/i915/gvt: fix vgpu debugfs clean in remove
>       Merge tag 'drm-intel-fixes-2022-12-30' into gvt-fixes
> 
> Zhi Wang (1):
>       drm/i915/gvt: use atomic operations to change the vGPU status
> 
>  drivers/gpu/drm/i915/gvt/debugfs.c   | 36 +++++++++++++++++++++++++++++++-----
>  drivers/gpu/drm/i915/gvt/dmabuf.c    |  3 ++-
>  drivers/gpu/drm/i915/gvt/gtt.c       | 21 +++++++++++++++------
>  drivers/gpu/drm/i915/gvt/gvt.h       | 15 ++++++++++-----
>  drivers/gpu/drm/i915/gvt/interrupt.c |  2 +-
>  drivers/gpu/drm/i915/gvt/kvmgt.c     | 35 +++++++++++++----------------------
>  drivers/gpu/drm/i915/gvt/scheduler.c |  4 +++-
>  drivers/gpu/drm/i915/gvt/vgpu.c      | 12 +++++-------
>  8 files changed, 80 insertions(+), 48 deletions(-)


