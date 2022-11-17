Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BAC62DD29
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 17 Nov 2022 14:49:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60FB010E5FF;
	Thu, 17 Nov 2022 13:49:44 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76FFC10E5FF;
 Thu, 17 Nov 2022 13:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668692979; x=1700228979;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=P5jnIL4UxfC47L/LoqhMUVA0xvO66uRT8L2buFRi+ek=;
 b=ZoTSOnxUn7kt4L0/mLSXpEfesfOB1yxsOdT8BsO3/omvOTuI9fNFDJh8
 ihFShryas+cx8n9Z3UcPEDVZsfRMtkJ6iSVPVd+20M8QHeVMeARRDguiP
 UAr7h5cdyHlaHtV/JBiJG/1wGB7LiV1iOdujKWa1uADorh4045Lh9eYzj
 aduWqcptMfwqFnyajDpJ3lEvQu05joRyDVroH2TzKPKSLvmxQvn4TDM7U
 aBpmMLWjTKLIgjJUghxbDI82JlRqaDGLXVjEUYXFnGvJSVGTuHZu/KAav
 qQuNuD8eGcV4uTyI7ArB4/MvmlxVOuHPvcKd23+wiJg5wuok3gQwjj5qD g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="310482905"
X-IronPort-AV: E=Sophos;i="5.96,171,1665471600"; d="scan'208";a="310482905"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2022 05:49:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="814519696"
X-IronPort-AV: E=Sophos;i="5.96,171,1665471600"; d="scan'208";a="814519696"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga005.jf.intel.com with ESMTP; 17 Nov 2022 05:49:38 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 17 Nov 2022 05:49:37 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 17 Nov 2022 05:49:37 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 17 Nov 2022 05:49:37 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 17 Nov 2022 05:49:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iEQ3TartpHEUwvRg2Ac+Srx6GMyGr2unvdKC516kkGXu33v0NS/92pq7YK+cHN0b04Zx4IrlBjQElG207ByqL9uO1847ky5XWZ+DMscASdDDWOCQ3ubk/28WPSwVMsQ+k0n/g7afKPQUHttETcMowdnc5FXn6h+oDjFPLrijRezGDb2hJR0LUKEOk8oeHQ7/fLR8Jrl66w5zU090STIrjNOVy7yTCth5t2JGPn1/BXBTkSSdiNT3KOxaG4v7wZ7sZIb+4o0tJJh6p5TPCKqJGtHwAXh9dt8NwDDK7cvzWTBMx8lc2jGxi1iLhiuoYuh+1sYH/GrdBcySYgHKGnOvig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s3vnLf33d0JKzBLp0inuJzAKoO7F/pN5mvdBrTw2J7I=;
 b=OlhTS0+XK+zYBUhYDgc4dQhq7k5FZ1N/93wlmndVyK2ayGx9a/UbJEppjFD/ZhDjhT7x7Ro8yHztLX2bU0TrmcjJ8XKabN663Ubth5TgZH5UgVQKgMq3CJfuQOy7msOJE8AXkIFmXZq96pjhe8NnuGcQ5z7VWAKS1zmWqsvAf7h1KfWiE5fUTJUkMwvXvlnPERKHb9XSg33/MhBKDBc6fmo9wtE3dGYaip1nqLSQBXgd+4JW6newimIDq2Ac4nhgBXs5fh8AuF1fQnwQ6cwTWeR7wZTgXEg+oHpCYePQOdRnUL2efZdJMidwudv0SoY6fTNVjSUnCuNflJnZSSRPwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MN2PR11MB4662.namprd11.prod.outlook.com (2603:10b6:208:263::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.20; Thu, 17 Nov
 2022 13:49:34 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f4b9:901c:6882:c286]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f4b9:901c:6882:c286%5]) with mapi id 15.20.5813.020; Thu, 17 Nov 2022
 13:49:34 +0000
Date: Thu, 17 Nov 2022 08:49:29 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [PULL] gvt-next
Message-ID: <Y3Y76R0dJvuIokFb@intel.com>
References: <20221111085903.GP30028@zhen-hp.sh.intel.com>
 <Y3OyGyJLhL7k8EV+@intel.com>
 <20221117030215.GR30028@zhen-hp.sh.intel.com>
 <6d9f565acb5bd57ee2df79fc5a9cf802724a3333.camel@intel.com>
 <20221117064106.GT30028@zhen-hp.sh.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221117064106.GT30028@zhen-hp.sh.intel.com>
X-ClientProxiedBy: SJ0PR03CA0218.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::13) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MN2PR11MB4662:EE_
X-MS-Office365-Filtering-Correlation-Id: c8ffaeed-6006-473c-8da7-08dac8a28f45
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aeCGCBunqYa7kQ87pfeb8LzYrFbZvLembv+sPYAKIZkVemlPGvwyK4inkHaavObdzipSZouCNG4JVQJpIKUw87ZLZuW5XDx0yKIPi082xssrIKvLtc6fWbecnBIPpNmPM3tskpRts93FrLEtBduEWog8Y+EdokqJkZ1P1wzTnrGrtkgL1Eve2n69atxVu51D03ON9UcFijiheaxEzn4TD3w0xk8bIunYkgwxhihjcfQuVa2RrULN/oGjCZwPWFiUFBTfcWWbnExI/N9IJKXX0IQuYdkSP7HiXhUMSvvirnE22KeJjjvn+aELOlSmU5lZjtifxPN0NOuYxpxp6Eu1wkW2IDpQHaBwZ9w9QG7Le3JxFNlqYYgpJ4oeT2yjr/vbP3/AX7mxFpyKLSE9/5jkXhm1tx1Eve3zyBSWz8ZW+pRhjaflbKRVdpUOHm4dwoWc+27AcNYTXfkNceBLxVWBwcjCVilAMBWpSunkG25uhSRcAJvq2foo/mEdNNQ3OQ/bsNsE0n8ERPAo1gYY9w0wLsPxUzVjYoHO4G3g2+5KTTSwEZzRg9kd+qusGvspD+vHclMRJ9Of/EefvzwCYpX7Xg05B3nee/qMfJ7y8ckB3zBZUKLdOdbwkEYCioAD3S1Vuzy86SRYT4NjAiVzl32wQ0MYox+8CABj3+Gn2sd5mqM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(39860400002)(366004)(396003)(136003)(346002)(451199015)(86362001)(36756003)(38100700002)(82960400001)(316002)(6512007)(26005)(53546011)(6916009)(6666004)(54906003)(2906002)(6506007)(478600001)(44832011)(4001150100001)(83380400001)(41300700001)(8676002)(66946007)(66556008)(66476007)(966005)(4326008)(8936002)(6486002)(186003)(5660300002)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pFQu609zwT0Ezp90jsORM5/bvKUmVb4CPrMzMaNyySjkfnhS4dxqDCOFEzOZ?=
 =?us-ascii?Q?IDcwQIrO4o5ezxmAGhA7+uIkcEZYfQOFZx82xb8z8qxLM7HyI9YopkIU7Hk3?=
 =?us-ascii?Q?X0B1++xHQUcsBYBafodc65oar+EG9SbZSnsPHY80wLmKNey7Fp8aTxblL0Id?=
 =?us-ascii?Q?2extcnmD2IYyTN1jyYVT9mAMobjDDcxTGfWRWsw6YMeeHGplPSix9BeVQmzB?=
 =?us-ascii?Q?ngjeS7A8M/VFVs26yc+q6c6LoeWGgpRduKe/+TOUqHKLI6oxa6O2IxfUDV3k?=
 =?us-ascii?Q?srTDIuCh14LYaHXeiSA//x3eN3qqphsrzTvpzbPCWvRJp7tBs5CxfJEQzKQ0?=
 =?us-ascii?Q?52/4c8JN27ZoYcoqyD5pfLJMSxFWW+nLT+P5PHQqezsCSsIBzKr1acf1XJAS?=
 =?us-ascii?Q?ukwPaj/sUVKQ6oIOKvGEyBW6tu+TUK079/pkIbmfsqtnkZyioEVt4s0z+8mv?=
 =?us-ascii?Q?qAk/ar98uk0JNFHUf8gJ4x0USFPkgKqeb/Wo+fxOufHW4Nx7kw4IIvwO88rR?=
 =?us-ascii?Q?tB5gi/hqcYw3zl8BdyeOLnLIXVINruO1xGYi1yYUkqnjeOzIu2JnNRElAnxL?=
 =?us-ascii?Q?uBTBWoPmzC8CSU1/QyAzx2X5YREYlR8mLUP6sis+8P9a75Z0MSSwhkXFhBSg?=
 =?us-ascii?Q?JHG3ITtAXSTtRLDSA+hnXVwy5qTCP0a0BURkTfVmECAsm4ZVgPj6CaFUreAp?=
 =?us-ascii?Q?z6K6uHy2nX5NULSXIdlYreGB8s45ILuOa6gkQjCtxnvsil7IDaQSh6U7EsVv?=
 =?us-ascii?Q?I8DK1AL75FZ+mpg+GazA3mU1oAdaZB1YOvUQCvf4ROjIbOsJbCaBmldwQvxM?=
 =?us-ascii?Q?I4TvYrdeKrA/hEh/7d9w6zU71dM8t0u3YzgkxjwanDR3jA4SUep3WsZyzStr?=
 =?us-ascii?Q?GqYrWPIlNs/8+uuTN9eBSVgaRlOlxsek9F0swf1BX/DsvPJbPoYuO9SocIXr?=
 =?us-ascii?Q?xrQwkcIWBEK4g6aWZivModO9fTTtaU9Peq8ZJ9j7kzHiUMgS8dVCocKopc8A?=
 =?us-ascii?Q?epeedcF8hmvrdEGb/OUXKbazTMFvvpGaBTSINJQMLvU/kLC+Davoay+D2sSi?=
 =?us-ascii?Q?9Io/FJ1rbk0tuBhfOojFmGQ+ou20VS/V6D3NuEBGdQADCwudtfP4Ds0stOK/?=
 =?us-ascii?Q?nzzjCF8+gJH607OTrftR7JLTWWJXueRRmDdbN/fMetKyCHD1JW216b8dX3ZN?=
 =?us-ascii?Q?EgsJMywMSexcNxl7ho+3D8qMwCo1iiWxY3hR78cBsv//tJpKUCq2TGnmXNgw?=
 =?us-ascii?Q?tfIPItyZJdsujJ6lbwk1srfH5ycA6GEDaFOK+4yszkxfTLxRaAbkYoH7KyKB?=
 =?us-ascii?Q?VWkef3pJs6UOjRQTMtVhikEgwx4m09epTZmd4LS+6235lxb5YGSPa1uxFT3f?=
 =?us-ascii?Q?FfcqqSg4zbuVc4oqOefgU8qQmKLCJSj95w54Ichl0OShfB5dmjfalMKiDGkU?=
 =?us-ascii?Q?H8QXJD2hTLhU+6hXdGMdn8QXVG3R/o9C5JO5wjg2vOtWGrwCXlt183Fv1MBt?=
 =?us-ascii?Q?vidMeun3i15BiB+fSFfrsRmrakpunSNk6jDI4hVXChshXtsnLwco40PRdBMU?=
 =?us-ascii?Q?5anGY1meIcGydUwKdhQQl9bPBF896voYXaxi5eOG?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c8ffaeed-6006-473c-8da7-08dac8a28f45
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2022 13:49:34.2816 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jAinnjROSxoXJz1+MtY8Yo1jE00KSgs4yg43Hcu7lEUL5J5hulL/dThSPDkv1zrLRVzhdzztOc0cxqqywWkd8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4662
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
Cc: "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>, "Nikula,
 Jani" <jani.nikula@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>, "Lv,
 Zhiyuan" <zhiyuan.lv@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Wang, Zhi A" <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Thu, Nov 17, 2022 at 02:41:06PM +0800, Zhenyu Wang wrote:
> On 2022.11.17 03:37:17 +0000, Vivi, Rodrigo wrote:
> > On Thu, 2022-11-17 at 11:02 +0800, Zhenyu Wang wrote:
> > > On 2022.11.15 10:36:59 -0500, Rodrigo Vivi wrote:
> > > > On Fri, Nov 11, 2022 at 04:59:03PM +0800, Zhenyu Wang wrote:
> > > > > Hi,
> > > > > 
> > > > > Here's current accumulated changes in gvt-next. Sorry that I
> > > > > delayed
> > > > > to refresh them on time for upstream...It contains mostly kernel
> > > > > doc,
> > > > > typo fixes and small code cleanups, as details below.
> > > > > 
> > > > > btw, one gvt change for next
> > > > > https://patchwork.freedesktop.org/patch/511118/
> > > > > is still pending, I need a backmerge from linus tree e.g with
> > > > > recent vfio/mdev
> > > > > consolidate change with gvt and Jason's fix for destroy device,
> > > > > to apply Zhi's
> > > > > change cleanly. Pls help on that.
> > > > > 
> 
> > 
> > Based on what I could verify the commiter signature is really not
> > there. It looks like you later forced a rebase and while
> > rebasing you forgot to re-sign everything.
> > 
> 
> Hi, pls re-pull this one.

This one worked out. Pulled, thanks!

> 
> thanks!
> ---
> The following changes since commit a6ebd538364b1e9e6048faaafbc0188172ed50c3:
> 
>   drm/i915/sdvo: Fix debug print (2022-10-28 14:46:21 +0300)
> 
> are available in the Git repository at:
> 
>   https://github.com/intel/gvt-linux.git tags/gvt-next-2022-11-17
> 
> for you to fetch changes up to 04ec334e1a0381c3305da4d277cef9250769ca43:
> 
>   drm/i915/gvt: Remove the unused function get_pt_type() (2022-11-17 14:07:09 +0800)
> 
> ----------------------------------------------------------------
> gvt-next-2022-11-17
> 
> - kernel doc fixes
> - remove vgpu->released sanity check
> - small clean up
> 
> ----------------------------------------------------------------
> Colin Ian King (1):
>       drm/i915/reg: Fix spelling mistake "Unsupport" -> "Unsupported"
> 
> Jiapeng Chong (4):
>       drm/i915/gvt: Fix kernel-doc
>       drm/i915/gvt: Fix kernel-doc
>       drm/i915/gvt: Fix kernel-doc
>       drm/i915/gvt: Remove the unused function get_pt_type()
> 
> Julia Lawall (1):
>       drm/i915/gvt: fix typo in comment
> 
> Mauro Carvalho Chehab (1):
>       drm/i915: gvt: fix kernel-doc trivial warnings
> 
> Paulo Miguel Almeida (1):
>       i915/gvt: remove hardcoded value on crc32_start calculation
> 
> Zhi Wang (1):
>       drm/i915/gvt: remove the vgpu->released and its sanity check
> 
> wangjianli (1):
>       drm/i915: fix repeated words in comments
> 
>  drivers/gpu/drm/i915/gvt/aperture_gm.c  | 4 ++--
>  drivers/gpu/drm/i915/gvt/cfg_space.c    | 2 +-
>  drivers/gpu/drm/i915/gvt/dmabuf.h       | 2 +-
>  drivers/gpu/drm/i915/gvt/firmware.c     | 2 +-
>  drivers/gpu/drm/i915/gvt/gtt.c          | 9 ++-------
>  drivers/gpu/drm/i915/gvt/gvt.h          | 2 --
>  drivers/gpu/drm/i915/gvt/handlers.c     | 4 ++--
>  drivers/gpu/drm/i915/gvt/kvmgt.c        | 4 ----
>  drivers/gpu/drm/i915/gvt/mmio_context.c | 2 +-
>  drivers/gpu/drm/i915/gvt/page_track.c   | 2 +-
>  drivers/gpu/drm/i915/gvt/vgpu.c         | 6 +++---
>  11 files changed, 14 insertions(+), 25 deletions(-)


