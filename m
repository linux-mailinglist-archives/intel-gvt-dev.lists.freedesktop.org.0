Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 481F55946FB
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 16 Aug 2022 01:33:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC3C3D7194;
	Mon, 15 Aug 2022 23:33:07 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B3DED7197;
 Mon, 15 Aug 2022 23:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660606373; x=1692142373;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=t2GXrCjV6J7yZ8xZdrrkWs+ilF8flC9HVdTz1QTDWdo=;
 b=aUFHgqqn1ccDaF41DcG/zqn6LyV2yDuJCuDjXyK+ORFzk/VAsULqvi6F
 Nc++zZ3Zvfo8afF0alA0npvHQn32IKEC2gpXDpzZUO5eR8XZGr+lvGE3Z
 dpH4ak5dDg58bUcThaIMQi+o+tot96NrfmkI3JqO+zwyXRP8zOXtx7/TL
 RRi5XFOCHsb+5gRf9E5LnYZ2xS2u1CRSn2H41VYUIJ0eV3eMfpqXbElvb
 Glp4kzK7qQHv2lKtHSJh2/XYQk/iaOjUpf2N5y1Uqak0BsJHjP1Tgn2LH
 UUWonHX6hEt0q4nVt5tmsZBJBuhfBsE6XX41hO6gVzgNx6NIyrZCf7USv Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10440"; a="275134023"
X-IronPort-AV: E=Sophos;i="5.93,239,1654585200"; d="scan'208";a="275134023"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2022 16:32:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,239,1654585200"; d="scan'208";a="674997482"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP; 15 Aug 2022 16:32:51 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 15 Aug 2022 16:32:51 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 15 Aug 2022 16:32:51 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Mon, 15 Aug 2022 16:32:51 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Mon, 15 Aug 2022 16:32:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UTvgm3r98t7MySj4RgwUsnyqEfZP+GpMS7gCXs6WEt8L1Tg1y/1Xx+p3NpP3RpEmggNbvLJB6sMSGleUnOSf7lU+iFlt3HKhxNcLQRVXI1A04wDidbzbiNrZhaznC+P5ZNMTOJ8hcgZ3/JtU2DniAbp4/O08zdC9lL5HKD0hiNqszwhUXr4/1y1X511OQkjV/SmFLLXVZymz1AILRWlCD6cHsaiLntGSB4eCGrOSy4+ojvfsFe79Cn6p90fMsq/BZiHS89cxfl032h8W5ubQ7yxIJ4O+ucpqb7NPhjLj8ITOSFDnP7GFCJT0teY1glyS655Le7xrwhLaVpv9Jtz6dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2uykS5UmVBdlFbI6QIuRJQx4hrlV9+SGVzBGEO4b7is=;
 b=h6QRUu337UkZ8QqK3kegO9PxmqRnGuqJSdmB3w4Y6qy2AWn9EwmmaWF68KUOk8HtXD0qAeIOxtRW9yEcqcnuWTbcCmkK/ifFGgaLV30XtpJSgTMTW00qPxZGFfz1LRR8DRXj4vIMkx/+pPe/3kAVaoBtnplkQr9IXIRmrhuvMs70/WSlCbYnJ/GPnYnv288XkB3Syl/8DDhL/2byrYK5eCnumLQJPjJRzPt2t0aHj+WLGy5tHgZWHZBTY4IcgT8mfnvwEgSeeKwkVLEGHMZN+CHy6KGEMTb3jkvKz5GJGw1gn22KcrhNtX0sS8IVhISy2dlVfQY17fuJeWzsddIwWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB5359.namprd11.prod.outlook.com (2603:10b6:5:396::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Mon, 15 Aug
 2022 23:32:49 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a968:40aa:6163:5c79]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a968:40aa:6163:5c79%6]) with mapi id 15.20.5504.027; Mon, 15 Aug 2022
 23:32:49 +0000
Date: Mon, 15 Aug 2022 19:32:45 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [PULL] gvt-fixes
Message-ID: <YvrXnUnnot139qKL@intel.com>
References: <20220815023855.GF1089@zhen-hp.sh.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220815023855.GF1089@zhen-hp.sh.intel.com>
X-ClientProxiedBy: SJ0PR05CA0115.namprd05.prod.outlook.com
 (2603:10b6:a03:334::30) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d989cb6f-2b07-44d5-4927-08da7f16773a
X-MS-TrafficTypeDiagnostic: DM4PR11MB5359:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b8DczvqhyCsd5m8a75YfjTqPg+MkA6JuM7i9CgrSzgI5mS9zIytTbEVy2FD8/KZThxBECLNt8qjuZ0mg4A7ywUjffQ4Cd52ga06P0QkxAoLbLxUKG/QdZ4KU/UjKmfECu2Iyn0q0wY3EnbL0A6aUUFQ0rsY1XhOaGeLNOkgehn7iSen+SaJLZNwSTd1/kH6TtH1ix4TCk68BQOGxp00lwblQh4+3bOJ6yaBHbFq18gswG68+o1DduoFfIDb+gKv6+d9gyLyYXmlgqyqql3HUxGBUYaGCb2FahMbwBEGs3T37393sMuhE0AOIa4j/7FSpSAJoFpyttnmwcPt0QxEL3S22plo1n3E1ag4Le/BnmMsIYU3p3VdxIiBddE2NDvHKklR1AKaBSOgXDYpJxtIfLBrUQOiI/VOEQklqikEPnPntEPIGpgiTSw/9gT3wNZz6sVAMvckwHuC9pJ2ligYK2XdMZtNPq55z0tuhstHNRoDUBHKNaap5XnpJqMBuKO7P+EIAU6Lwg8aT9Dg0rejFXa1ZVous1Id3B/CWdvgQY0/RASdbGJ2h+CDxTo2OtqgGpALs+q7rY46wTJN1x2uQUulJTDBE7hZS/kWtfRTYe2IOxRHujrTJrX3kRN2U8X6mJJVVS3YebH8yHw7D5+QkP2LzCJfXzOr5L35fvuI7rgKuJRH0Txszk3kK3qVypIFrAYO3746GOPtasU+BQQxByM7l8WHh7l4qOEWi2yN/AMfS2Aq1ktZnO1dgKvVtfkJ8A/ZzwsFT6jXxemRjOXRpmw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(39860400002)(346002)(366004)(136003)(376002)(86362001)(54906003)(6916009)(316002)(36756003)(4326008)(8676002)(66556008)(66946007)(38100700002)(83380400001)(66476007)(26005)(2616005)(41300700001)(186003)(478600001)(966005)(6506007)(6666004)(6512007)(8936002)(44832011)(6486002)(2906002)(82960400001)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?exKTbItCeoFOBKYxifc9hBmmdER8MmVt/ZreK8equKVFsN4xcOLIk/mVQxBz?=
 =?us-ascii?Q?PMzLnXReR4AwzpS2+9qCnAR7kVCM+t3kbQ/YridpZvunlzbox6JOb/WbFgNX?=
 =?us-ascii?Q?7AoJw829p7W7yUnRCV25tfKPT/5YyROKFrupIkbRaH1c/8AD7k2jmKqrfPK+?=
 =?us-ascii?Q?8Jcj5NUFuvUaFNCPaMeq1bhK4jso3h/ZBghOcm4m3tN/jPrQjronhce4Nm+9?=
 =?us-ascii?Q?OSYJJqYdpqfHJrin85zSqCCmshcvOp/X7vS18+zMTFg6BpZSs47ZJgVUnsnd?=
 =?us-ascii?Q?GfbByjdNmzc8aWX98qolwIdJGikQfDwv2G9pmkHXiP3j8VoXZTr0mfgUj72N?=
 =?us-ascii?Q?5z6rgpsDeaxTaGE8Of6/a+mE3np2AXAiUhLAbN+9qcU6KCmbNgWoqOoNTc7n?=
 =?us-ascii?Q?qGuyTFDx16Mx90cTiVt2+PuVpE0aNKxTmf3T6zYWsJF9l0ma9q+YYNVPR0Do?=
 =?us-ascii?Q?YdpSmaUUGswmVLoIUGcrQ1FLK4VGhl6fT8IEJf4rvHFrnuubun97l90ehR31?=
 =?us-ascii?Q?kzvM3OZsmfMQQgSySjWBhuGR3PQBCTd51syPP8lUSlO7fzwP292ih7qHJ5Nb?=
 =?us-ascii?Q?yHs4Bll3lG/hMr9tFHSpElBEVgnEXgCFPFVSTgM36cFydcmQc25mRQYqTK96?=
 =?us-ascii?Q?7ccidTXHQVbiyhivoJTWPhHHALtd6mm0L/YhCZJTwToLMLc0WdL5Wnpn6gLc?=
 =?us-ascii?Q?0Se7LXzYdurL/NIOyxUsaJPvjg7ATOHwUUR2drCBcshdZQa8w1L7Cq0r9pMB?=
 =?us-ascii?Q?vZfD4WmNnXKpKHyTlL6ZmNvGbFz3RJpv6eObMIVG+0h7QfTSomaMTvOPinbr?=
 =?us-ascii?Q?5LcvfERosAC/p+aeyyx3nT+q3cHTNAbpfO7e665wxpVbVxZ5EcuoMdqobivS?=
 =?us-ascii?Q?L0DiBdeZmD7S/RT50LfOPixg5356QiaeRhh8GN395HFMypRglGokOqcFQnoj?=
 =?us-ascii?Q?UlfVCxSiVynUOSN3NZj5sgMJwGyO5pi8n8g2xPNmAcc7lDbHWVVAGy+W9NUD?=
 =?us-ascii?Q?O9ipjf3mCRFR+3nXqJ4NeiYUa6FoXZZ50YlzqFKQx7oE6YuvduDRD3LrWYPs?=
 =?us-ascii?Q?CH2oktJxxBDl8VjeFb9thS1WMH0evwm2aVvNYt+SNbfXpwrO6bS2MsdQtdFx?=
 =?us-ascii?Q?qagUka8agGEOu9ir7DOYCaPxFx+6NH8SNLHgdNlDGtCXevCwxZcemU8z4Kt9?=
 =?us-ascii?Q?RozG/VS6oW/4DK72UqIfpYAanJGucWCZ75Ut9dwIvRNzCehb3CZmJyNMGsTo?=
 =?us-ascii?Q?fZzOikN0efrO96QRpZjsLy14TOpy7z+WKNdXdZgqSDj+WvDlQk8GtUDeMLUf?=
 =?us-ascii?Q?Jr6qffcGbzgvbFXUYl/MSF8pdriLgMh3CGbg5ceBUn+bAZcHTxKZScNDGH7d?=
 =?us-ascii?Q?FwkXrHbE39c7nuo2OSDpgQdpoV4aJ0diLgnGIko/EspPvSIyIbKSOfpgNG5s?=
 =?us-ascii?Q?LV47Fh6kFcegyvZ4dfvkAxIg5bc6QgP+q+oAAZRJYfxF9Gc/ZWmvnYQNFg/n?=
 =?us-ascii?Q?CVum9AUaYHi2yw7g67Kb+JwIfYLpI5dke3xyiqwwtZ3QcfZ/VXhzBYz2oebl?=
 =?us-ascii?Q?dpXTzR3r8Y0OWxJrDGeK1IOsUnvSqEIUZlXAS2lcS4Wfb99NMdop6bLMVGYy?=
 =?us-ascii?Q?yQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d989cb6f-2b07-44d5-4927-08da7f16773a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 23:32:49.5006 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 51f1Ab83IggM6IkIe1kUNpg92tE8aF5CCuD307S9+OfNELb38OGDNR/cvfsgIsXVCaOqxw2dTEVAxli2z594ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5359
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

On Mon, Aug 15, 2022 at 10:38:55AM +0800, Zhenyu Wang wrote:
> 
> Hi,
> 
> Here's one gvt-fixes pull for 6.0-rc. Major one is Cometlake regression
> fix for mmio table rework, and others are left kernel doc fixes not pushed yet.
> 
> Thanks
> --
> The following changes since commit a7a47a5dfa9a9692a41764ee9ab4054f12924a42:
> 
>   drm/i915/reset: Add additional steps for Wa_22011802037 for execlist backend (2022-07-25 15:57:54 +0100)
> 
> are available in the Git repository at:
> 
>   https://github.com/intel/gvt-linux.git tags/gvt-fixes-2022-08-15
> 
> for you to fetch changes up to 394f0560a76298842defd1d95bd64b203a5fdcc4:
> 
>   drm/i915/gvt: Fix Comet Lake (2022-08-15 10:54:03 +0800)
> 
> ----------------------------------------------------------------
> gvt-fixes-2022-08-15
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

dim: d6632370536d ("drm/i915/reg: Fix spelling mistake "Unsupport" -> "Unsupported""): committer Signed-off-by missing.

is it possible to fix this in your tree?

Thanks,
Rodrigo.

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


