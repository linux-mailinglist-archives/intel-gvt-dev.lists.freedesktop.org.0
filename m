Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 068D859C536
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 22 Aug 2022 19:42:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23F3C9A8A3;
	Mon, 22 Aug 2022 17:41:58 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EFCC9A836;
 Mon, 22 Aug 2022 17:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661190102; x=1692726102;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=49R9aVrD+NUl1qDA+RzLGCN3mnmTdyX2D5zwIv5pauM=;
 b=ONqla04Z95sgOTLz8SWBGerq34NqcwCeZRajH122OEcijs4hSuKB/BYT
 XM88RHdVV6eZpvPYb8ed0jXFUGhZYppTkKpnAAoCZDJKWgjcZxGcwsIKE
 8mvgEYjfpD7bdaZjho+RXwD7CT+lSRu9FTDJJYUTpwbbdkzoPHr2fknp7
 l9ui+mo1jmZjdQMjkZfNU9bhnzE1P7qZo97TzLuW1IXFuKbkfBdUQkhMU
 81/Fx0S15IIdk/p9PCqcyqRORrlgGEhcIkidXPjTKd1c5nHYXGh3t0qHi
 nmIGZfcXLKTwiSvOXQG+8KIy48OhbkLD9pEGqScxYEGNv5W9cRXR1yhl7 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="280451467"
X-IronPort-AV: E=Sophos;i="5.93,255,1654585200"; d="scan'208";a="280451467"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2022 10:41:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,255,1654585200"; d="scan'208";a="609046707"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga002.jf.intel.com with ESMTP; 22 Aug 2022 10:41:41 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 22 Aug 2022 10:41:41 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 22 Aug 2022 10:41:40 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 22 Aug 2022 10:41:40 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 22 Aug 2022 10:41:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gwB4CVv1ZnNoMNOBQw8zXckAqEmI0g4ULEO+3BnPvwA94VJJpO+xw2tY15tUxmASUTNZZCQyDpAW4bJZjzwq4PWmBgHeiuDqfnJmUhd83xHnMrVUL+05QXvb99QhaTyUoBnvdijj2KZuiOGvOeosRk3tkF6PYQSPBoOEg0A8GKGihVuR6dyRdKBLi5F9zEKIsVsAM81i/y2ImdX+hHvroldolI5F1zd23YCDL5oCDYTLiFrKipz72zAgYlTblhghN7GdV9Eb0qFCPc2NhsV5s4srQZ5KJi9n/udGqNI9cQ45KxMvvFIMi3vo7KsL5PiXCeHKs8+rEutma9YN6177wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/9fSL14u5xamOOLzmwaAWo+xjzC6Flun+K3x6IJItmw=;
 b=P9/R8V2XyfAEQI6gaKqEyU0pQfSeKSoNjXf2uA86PL48r4bgNuCw4YI942MuPwnfbLpshGBcldK0kKcJk/zZ2ZEW68GdR3/d3LJ85oOHtL+/CIG43P/tdXU9g2F1Kld7PWUvGimgAQPsV5ChHXml1K0cXT6a5VEPou1xRtwFrd/9162ywzJBIB1i+QYmSf7d/cSwe0Q8mQ+ExTSwpNXTIf3P1hpokinPkdaHyRPzZhAyZHjtVHsVG6eYqZopzNg1RULnJWkBH6NkA7apcM0vyqFQUHdes/unX8Z0r3EK5ROCXgw1U8nUn4ugKvxbmuOMzrSQbrBHr5qMaIxBg43Z5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by MWHPR1101MB2079.namprd11.prod.outlook.com (2603:10b6:301:50::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Mon, 22 Aug
 2022 17:41:38 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::74cf:583e:62fc:a7a9]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::74cf:583e:62fc:a7a9%9]) with mapi id 15.20.5504.027; Mon, 22 Aug 2022
 17:41:38 +0000
Date: Mon, 22 Aug 2022 13:41:33 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [PULL] gvt-fixes (resend)
Message-ID: <YwO/zYqlpnqNMGgC@intel.com>
References: <20220822031215.GJ1089@zhen-hp.sh.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220822031215.GJ1089@zhen-hp.sh.intel.com>
X-ClientProxiedBy: BY5PR13CA0020.namprd13.prod.outlook.com
 (2603:10b6:a03:180::33) To PH7PR11MB6053.namprd11.prod.outlook.com
 (2603:10b6:510:1d1::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 64282640-d940-4d5a-9bfe-08da8465909c
X-MS-TrafficTypeDiagnostic: MWHPR1101MB2079:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d77EszP3qdg43SWHdZaO3zrV1ge+vUtJD9Y2wuxTnMqyilfGpYGRFqcl7mR62t8jeU0bkoaVtEXhTE0pUvWXMpSy//g5WeYSopMtF1FIYktKd0tfUKG4/Vpt4r49SA4gvC0caAUTG7z3AplLCVJQpFLvEOBq3EocfUkYlVzI2VbyZbIkVP91kooaD62SqxxGqGABTryuZR7dzXSsI0ESbrVGLprLYmaFJMlunLnkC/xSGcpj++EvRlPv2siEhTONKOeCHLZR9oLQH1wXtavGVVQG0rfUgmz4Qot9bSahPz7DTJhLUgfNO5cgudD8lc8Npg8zg+iAvtXOrZlRyfe/Cs5wBqdKxQS0wbwBl836XHLvMQXLgasCiNRvGwhwZAxUlCk9uc0xsBjWUvIOM2s4WjT+GgOURoUqMqroevo33rUffIzIxVS4L8VERNioNqKZAYXGaSCvlTuvWJdCYvV/FnRibr6n0beYBxPskLdR48f/ONiOE68ijfXCHtcML7wUSyd0KHhz7zVtheIJJLk7pD8HfFjTJnrg7b6NVyl1Y2lPVmdZGvhkreVP1CTvO07dmPRjcFV0mghPMkxzJX08WtS4Jvf6eJ/XzlFDqqH6cfZQJxDhe582/1qK+D2bkeMbhbW/Cu6GFv6rwpLXesV7MnUO//foHhF/mcDs896Bj09xEUCEIuGmxiCIzJlla+nbM+41oYG0skfi9g+adbPGzg2OyfNScYGXotSgm2Je0Yk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(136003)(396003)(346002)(366004)(376002)(66476007)(66556008)(4326008)(8676002)(66946007)(38100700002)(86362001)(82960400001)(44832011)(5660300002)(8936002)(2906002)(6666004)(6506007)(41300700001)(6512007)(26005)(478600001)(6486002)(966005)(316002)(83380400001)(186003)(2616005)(6916009)(54906003)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q6das7UoPFalP4+ivZMPUyH1jqIAiZ1DqoOiyTrfNO+UNYNpWJ+s70PeqUpA?=
 =?us-ascii?Q?DsPoR7qUO0CZbaSVIElC8Hfl2B3CcNU+5+z8pFqi2MWY5Ud2LL3p6XYhJ3yN?=
 =?us-ascii?Q?KYsrNDRYpgs6N2Ytak8iyIZMsW5NSPnrGZnLWFiEbqypl5DR0kILf08NNWfE?=
 =?us-ascii?Q?Jb5hXZm3UqaGIa6TaLQ+b2TFLdYmf+NHU0LXbKWLtLz/HRtP8087szRC1g0v?=
 =?us-ascii?Q?KC3utBbUiM8RNTAV3V2F11sjhcyUohXYi2cMLembSUSIfbV6Lb8MoLNYE8iN?=
 =?us-ascii?Q?OgPI4UrR65OUBxO+Z/MHuzVHE0Xhkc4HyDsShHWFC40Kz2ZZPMD8R8mhzyt5?=
 =?us-ascii?Q?KFvYV1AavSgmkkSOUYkQAHN1D0r8LvdhoXJZLt6z/xRpC1nVzMlzeRK1xpOY?=
 =?us-ascii?Q?e8gBRd7faXye7OYYpMu4C3XkDbOVFAJd2jdNhyTbZ2j8QiLsUNmVHSApJGfS?=
 =?us-ascii?Q?TsYWy+Znq54a2hyMl7hd0g+jtIFvSlPiz7ua8BVk/mnxOzdaNClAZelFuFQA?=
 =?us-ascii?Q?m/UoOCDqdej6n6cA8H21TNN/dNwR5r6o8JI2OTvn65gGusWfyHC3lYjan1o3?=
 =?us-ascii?Q?jahUaU6i+0/JfSntOdCSbySlT5eDiaLo5mjr/ZIvK7tvr9UWYEw1px7IgI+B?=
 =?us-ascii?Q?1zG7GdyhJRxOeu5x3+w0jYYRRkHYOB2Sj/ZDIu7uL4Zz52Gwdq4CSpeV3gi/?=
 =?us-ascii?Q?vQGduIDhHeAlvCPxQX8hEnvT31X9Jv9rQgAZFyBtBOAmIlZR3yzFsZnHfG75?=
 =?us-ascii?Q?X2o+iJGxgXYbWapkgjY73Ompve2Qop5KAu9mByBWpM24FHt0FkFeYMM/xCon?=
 =?us-ascii?Q?L/sPJ2LLQs0sdWaD6rhiWrUTjY9BYr0G+qSEXdB2PoxB90KtA9Ua9Jis2K7d?=
 =?us-ascii?Q?h2GsHrHpoe5r69LIYQ+sFPP4oN5OiJyQ/HY6rfQF40h/ftrnZJNgBEsxtVh1?=
 =?us-ascii?Q?RDl7URjFDwKfA/IIYCQnETVQDjc7inGN99uJdLOYnvdLoTikskzvsAyanr//?=
 =?us-ascii?Q?mG0BhrMUIXJy5aCgVMu3Sy+kfDbMC5xOhlscVXfV2A93oU5JpaBDcpDuIQr7?=
 =?us-ascii?Q?yU1WWH4W+8P1YOYkhjC9G/G3w98sM7NiLT9UEyhLbH25jl1XkKHxY1H/c5ZF?=
 =?us-ascii?Q?gTPTJw2Xg4Qo50QMKqK0X+qBAVeHIw5qvMMlaYVqS6ukU50RAHtpnI+bryhL?=
 =?us-ascii?Q?EXGyaFa9C+XPOdjbDAGyekqKvWv1+aGB73AUZd1OnJy6CKHuOCiEvoEzPGya?=
 =?us-ascii?Q?xW0eN6dvJ2OeIThsyQ+dg0SPjY36gPqWo8v5ad/6dZQ6Je39vgrwBjkoeXKb?=
 =?us-ascii?Q?/74BXhxfimH9DmP45cGC/nkoQnIVey1SVRNfneNKo9Lx5Ljj2nah4TAE3VUH?=
 =?us-ascii?Q?+gf41emG6rY21x5jbhKXt9k/ZPekKnaFBJeWhcO4xMWNzKfIMeVnsNIeoS3d?=
 =?us-ascii?Q?L5/giU0h0LcYjFGPePU5HqV7aXIQKnLUb5UHjkJBZmXgAyXW4OubBuwvo9X7?=
 =?us-ascii?Q?l2cjN5fKfDtODOBr/PN6+Btcz4WhAAsFiZh/J6xWkKX0sHiuzLB3W5j/+YA0?=
 =?us-ascii?Q?AWQKc6fd9ybzgPESUiBSKjmidsGe07HapSTOzfnFMKDXQozRqCHmy4SMplIP?=
 =?us-ascii?Q?GQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 64282640-d940-4d5a-9bfe-08da8465909c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 17:41:38.2841 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VFclX997z3Vwz+ijw/H1I8xotU2Jnie0BheCzX5RlhHZ5DCtY1IUANgQguEleJfcIAtT0bD1yupfpME04lhREQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2079
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

On Mon, Aug 22, 2022 at 11:12:15AM +0800, Zhenyu Wang wrote:
> 
> (resend after fixing sign-off after rebase)
> 
> Hi,
> 
> Here's one gvt-fixes pull for 6.0-rc. Major one is Cometlake
> regression fix for mmio table rework, and others are left kernel doc
> fixes not pushed yet.

Pulled, thanks!

> 
> Thanks!
> --
> The following changes since commit a7a47a5dfa9a9692a41764ee9ab4054f12924a42:
> 
>   drm/i915/reset: Add additional steps for Wa_22011802037 for execlist backend (2022-07-25 15:57:54 +0100)
> 
> are available in the Git repository at:
> 
>   https://github.com/intel/gvt-linux tags/gvt-fixes-2022-08-22
> 
> for you to fetch changes up to b75ef35bb57791a5d675699ed4a40c870d1da12f:
> 
>   drm/i915/gvt: Fix Comet Lake (2022-08-22 11:33:12 +0800)
> 
> ----------------------------------------------------------------
> gvt-fixes-2022-08-22
> 
> - CometLake regression fix in mmio table rework (Alex)
> - misc kernel doc and typo fixes
> 
> ----------------------------------------------------------------
> Alex Williamson (1):
>       drm/i915/gvt: Fix Comet Lake
> 
> Colin Ian King (1):
>       drm/i915/reg: Fix spelling mistake "Unsupport" -> "Unsupported"
> 
> Jiapeng Chong (3):
>       drm/i915/gvt: Fix kernel-doc
>       drm/i915/gvt: Fix kernel-doc
>       drm/i915/gvt: Fix kernel-doc
> 
> Julia Lawall (1):
>       drm/i915/gvt: fix typo in comment
> 
>  drivers/gpu/drm/i915/gvt/aperture_gm.c      | 4 ++--
>  drivers/gpu/drm/i915/gvt/gtt.c              | 2 +-
>  drivers/gpu/drm/i915/gvt/handlers.c         | 4 ++--
>  drivers/gpu/drm/i915/gvt/mmio_context.c     | 2 +-
>  drivers/gpu/drm/i915/intel_gvt_mmio_table.c | 3 ++-
>  5 files changed, 8 insertions(+), 7 deletions(-)
> 


