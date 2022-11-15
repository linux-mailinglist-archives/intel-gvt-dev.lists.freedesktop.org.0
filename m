Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA13D629DAE
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 15 Nov 2022 16:37:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6909510E417;
	Tue, 15 Nov 2022 15:37:12 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D02F10E412;
 Tue, 15 Nov 2022 15:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668526628; x=1700062628;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=faIWJF6JWEoDqTWvXJWtFGJ35aqi5v6klzavk0kCieA=;
 b=KP13WSJdnIpPhYz+PAa/laSYLSHQOAWuSUVzk376I/ZPjG+5NIVlYnWH
 3Dkp6aDY+ErX8GaID8SPj8dF6RHOyfo7HW1JDGE2a7Ozla9xEbmmMxY1k
 5T83HUWQF7J5JW4T8VBACKnGFBqb9g5nC5kUpqu21n2RNtjMFItYWbCI9
 un/GcTPomfIKVrnsuWhOySpi9ZeeKvD3VKWrQD8O/vV0aKLSTZPiJuwGo
 pMGF+viqk6cKSFkHZ8E43kwEpbAB2IBktIQ7OhmUfg2koiWF6n7o6pM7j
 55hGHjFHXB1BOi4IOtV2EvLPMsu46CirJrygl1VQ+SDA9PSt3yFcDq221 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="295646276"
X-IronPort-AV: E=Sophos;i="5.96,166,1665471600"; d="scan'208";a="295646276"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2022 07:37:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="813717580"
X-IronPort-AV: E=Sophos;i="5.96,166,1665471600"; d="scan'208";a="813717580"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP; 15 Nov 2022 07:37:07 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 15 Nov 2022 07:37:06 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 15 Nov 2022 07:37:06 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 15 Nov 2022 07:37:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y/iOZKy96uG44k0itS7BlpbHK9ik0XQAjbp4WtXY0vj87z7M+VtNfsfZmN2d2t0EBplq28Kqc4UmsQX2JmvtUU1OZO6dWXUA67KGRlf+dz+aqJBk9DYRjLc4+gbTd2g6ixPW/q+An2nbSuzJs/sc3mV+awuuAWyeocl+Wz/2kq1eL5+N5wP9r4JHCMKvbpVsl18mS/KZh2j9ZXndNj/nahpvYLTyiBMIKNL1FIwT+XA11H+kcBh7TasLWszFv1w0I49r+XYYff1x2s8+Uf8g/dUtD7yA9+XpEtsCh7vNYuqpRYxH+vS8Az1UWgUwcAYZUJItV2jh8MhAnfVFV3rvwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m4SjuJwmdPIG5HjcmUu2loLhjExw8Zi7qPn/JS5USKc=;
 b=VRP1FBfAha27g04SYLUchBdqcJo2RysUW1oytmhbs1NkRnQXhA6ltuT+aNYjxHFuKBmqLJLh3f6h/8hkaIlNcQujYZl3WbY/26yrl3dH/cjErULLgW2pd3of74kh6jvGMy4jU042cuB4Ic4KhRTbbcBBiCNrFOVdAIs484ltUQvUTD8OO2GOA1CwotZKy3pZs2fgd5iv8gIlCMWTSNaQ++HOo+V6mnmydGEqI+6r0xQKl6tgOgUsL7GiaPoRgLcbk4+Iq6FlrGyZOTTSpQ4bbgcB0z58J0TqHd7fMB82auNv/AbXYiMX3XNuWO0yXWNkzo6JBvR9/oZ+e4FmT6vC9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS7PR11MB6295.namprd11.prod.outlook.com (2603:10b6:8:95::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.16; Tue, 15 Nov
 2022 15:37:04 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f4b9:901c:6882:c286]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f4b9:901c:6882:c286%4]) with mapi id 15.20.5813.017; Tue, 15 Nov 2022
 15:37:04 +0000
Date: Tue, 15 Nov 2022 10:36:59 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [PULL] gvt-next
Message-ID: <Y3OyGyJLhL7k8EV+@intel.com>
References: <20221111085903.GP30028@zhen-hp.sh.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221111085903.GP30028@zhen-hp.sh.intel.com>
X-ClientProxiedBy: SJ0PR03CA0164.namprd03.prod.outlook.com
 (2603:10b6:a03:338::19) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS7PR11MB6295:EE_
X-MS-Office365-Filtering-Correlation-Id: 511bf277-9e1a-484e-ba06-08dac71f3eb3
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W38V/5+6axPNAgtKURUyxoP5Tn1bGtkMCjsprabyVE/T6dVaVq7omYUSUVsb0W4ZAX5Z97GVE/PSynMSIMKUf9Jky3Xj6Usbb+fKAi/3Aub++TsaygZQ/2gT7UdVrmcp3/oF4mS4O+XSJlsS0r/iZw/cAyOX/aYQHwo6+36XDXy9JLjgKjPSvaZCS0e4tI0FLhaLpSHBtQq4+H2yAW9+gAu58fqCtQoLS+4jCBBjLoEShIwG+dNkFzQISoBuTGzLZ4x13sHJaqKeAs/y8rIdN+Vhg+/+z/NOJTquFDJDCrIciKbe53STkLVuwkJ9EXsSft3+iDZA+TM17qbIpDZ8PchSqkEjmf6p+/q/RX2ZfiS9/f5mQsMQNRHYmq/rLikrj9Mr3h29GoPln1MMZPKO+PBgeSBhQV9BF1OkwZ5EgmPDCOzGKqA9JO+cTy3GSfdqGi6bSGV8QpY3SFqauhy4vlaBM7dcnl4dJ0P86FkiMZy8x6G9SgsSOJggoPs38BZz6n0HJvObkHwMghocvQ/kJK3uT2Zt3/yQUR62MIZ/TseLMA/pH1t6zro/DXnrlqOvuU4CLyoRE7KDMf5sEPK46jK4lXX8nBm4jPw6KHkgeBDwTDTBod9RKJf3hPyBxbuKjSykX07NQ566BCJsVq/nof63nmLCwbdpOAsSu+dBa9DRtng5zNiDD9NqaP6TITNC4m4Yom+pxO1g42YnGh5Vn9fdcuHMXK6AglirGProNTj0S2M9sIao5KWn68ADu0AM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(396003)(366004)(376002)(39860400002)(346002)(451199015)(36756003)(4001150100001)(82960400001)(2906002)(41300700001)(54906003)(83380400001)(44832011)(86362001)(6916009)(966005)(478600001)(316002)(4326008)(2616005)(6486002)(186003)(66946007)(8936002)(5660300002)(26005)(6512007)(8676002)(38100700002)(66476007)(6666004)(66556008)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vUJHVU1Yq/7UVQspkn7Unj6YSpT4wXbfJ0I04j02NaXDA12uF10rPU/h6xrE?=
 =?us-ascii?Q?jwNMLifqam7BgbWG5y0we8iQvbdojFI7OYlKsFfsgZgkmGBr0Y9xqe4idVYB?=
 =?us-ascii?Q?grKNAvh4OHh+w32YfJhDofp6kV2tWokVxO02q/PA6hjR2DMvFGDg/Km2Yx+a?=
 =?us-ascii?Q?j7PDghU1hJ3jVVsUBQcdkNZxjbRuHojXAAYO5Y+e7OQMC7RYKVOgejzr6I3y?=
 =?us-ascii?Q?EuZm79TRltbO+GZCusPQgsjHbXAwt/40cOFv6mDtV9XXqdl3uxGhQuhrbnvC?=
 =?us-ascii?Q?7nFk/F8plPPmQPR9HfpFlKumBHVAxUUP9T/nKRAmXN/5BXNKKvaJ1/dvpE2B?=
 =?us-ascii?Q?y94LgJAjx+1aZaIbMeUwXDGg2CmmvEihpKerxNW+QzNi213cOW62o7FTeKhT?=
 =?us-ascii?Q?NwyNpS9Evc40KuHxl72hwOFoDVolkQ7ivavj75QJLQaiuKUYPcTBe9Tt3AQk?=
 =?us-ascii?Q?Xi/9bmOVvfN8lopaqmPiVvaOEVnmkqc8jdx+hPqnCDdVGJZDJKfTP6ALclyv?=
 =?us-ascii?Q?ZeGwhrABGuEuCgPzfgLugQFn5PhjZdtTUNApYsx534oXGIIFF3gV6yhc8yZt?=
 =?us-ascii?Q?an5qVUliUi2QLmwVTV6hgzvaiYpbBEPsllBYmiexq+W+1GxLwPuy6RxS4PLo?=
 =?us-ascii?Q?Qiuyb3skHNoTX2MNKgdVKXvJBWPzJgTFAM6WKyMH5JHaMOdGT6bojTDJXxVD?=
 =?us-ascii?Q?uqfy3d+s/zo/pzTIHCw5g6lH8m0aOKNuVuEZ9jhAmUsVdNrzLooQlaRLU3zL?=
 =?us-ascii?Q?SuSB4TeCA9vRfNkTOUdv5R6FrHUjd5Qdtr2kgUnpMTFGYp6Dv1bD8MxXm0Fe?=
 =?us-ascii?Q?zMfg2YFjT3ujtskXva+0lRDywOcEqiBFsZ2BOAt0maBGCpGy3UvFWvfAR60N?=
 =?us-ascii?Q?b1kjUjZuRODrh1EKpzyP5ACdOLH/bDBhOiBQ/8KFy3387F/NPOCTCxFgl7D4?=
 =?us-ascii?Q?G2pbBw3+FxGxPqLQEfPGAIhE6oCAdHKHv5zbfO75jTM+se3rcjpIesWDvE2J?=
 =?us-ascii?Q?P6GZOKP/HbL1orbOZ+CH8vhmaltp798cFvj7xygfapIM6sMe/ptw0LK1rd5q?=
 =?us-ascii?Q?U7BJ+hUpwUhm4RikvvknmgLnIQe9Ly0J0P33bqMHtLqKWq9rzAYbiQdIpEHQ?=
 =?us-ascii?Q?JkTo6zDvM3/EjFSUudjvS+WPsMKU7d3h6ZLy9LReqS3zZSBdhNpfz+96uuO5?=
 =?us-ascii?Q?BCVK5NJtJvk2FZ2yHpt5T3KhcEuIm4H4HdCt8o1R5iQd/y08/xhfQd3TX5nk?=
 =?us-ascii?Q?PPInrPFyWMGM1EymQJyYMOwE8WU6YIkFYPfisPFcMAP882LA5ge1vbIVwdIL?=
 =?us-ascii?Q?q4HDRKRPi2NLLTm35Jei7cjlQzYzQZdD3m0TUPy5mdily4ZCW7K1q0Ik7EVp?=
 =?us-ascii?Q?wR7G2t+dAX3VbfnpK9cfGMRhQaES4/Ofb942pUaXtCb6krlSe0+0Puhx6WFo?=
 =?us-ascii?Q?2HtcovcjHy45LbazsLoRVMnwaCHTfVmePUroftkxUEEmBrNE9hl+Hnztu7c+?=
 =?us-ascii?Q?WLGNS3aSjmIDLu58RtsNp9IDJru7tfumpoDOEhTE7xa6feRRuG00MCPTg3XV?=
 =?us-ascii?Q?SS7DxGXjc187ID6Jl3TfU8i0ED1vrNsPjwPTeE2e0cEbnfQVH6qD4Ih6k2jg?=
 =?us-ascii?Q?bA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 511bf277-9e1a-484e-ba06-08dac71f3eb3
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2022 15:37:03.9975 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 79TR56eUAWidRbsq/nFYOzUJ9Re7slNTKMc2t+ZGTpISeY4Q6Z29aqNFAsj29wHmh6VZ6NbS4zRfF1eAa3VlsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6295
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

On Fri, Nov 11, 2022 at 04:59:03PM +0800, Zhenyu Wang wrote:
> Hi,
> 
> Here's current accumulated changes in gvt-next. Sorry that I delayed
> to refresh them on time for upstream...It contains mostly kernel doc,
> typo fixes and small code cleanups, as details below.
> 
> btw, one gvt change for next https://patchwork.freedesktop.org/patch/511118/
> is still pending, I need a backmerge from linus tree e.g with recent vfio/mdev
> consolidate change with gvt and Jason's fix for destroy device, to apply Zhi's
> change cleanly. Pls help on that.
> 
> Thanks!
> ---
> The following changes since commit a6ebd538364b1e9e6048faaafbc0188172ed50c3:
> 
>   drm/i915/sdvo: Fix debug print (2022-10-28 14:46:21 +0300)
> 
> are available in the Git repository at:
> 
>   https://github.com/intel/gvt-linux.git tags/gvt-next-2022-11-11
> 
> for you to fetch changes up to 50468ca2e2e1ce882f060a8c263f678affe112db:
> 
>   drm/i915/gvt: Remove the unused function get_pt_type() (2022-11-08 15:34:06 +0800)
> 
> ----------------------------------------------------------------
> gvt-next-2022-11-11
> 
> - kernel doc fixes
> - remove vgpu->released sanity check
> - small clean up
> 
> ----------------------------------------------------------------
> Colin Ian King (1):
>       drm/i915/reg: Fix spelling mistake "Unsupport" -> "Unsupported"

dim: d7e4e9579f01 ("drm/i915/reg: Fix spelling mistake "Unsupport" -> "Unsupported""): committer Signed-off-by missing.

could you please fix this before we can merge this pr?

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


