Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B532065EC83
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  5 Jan 2023 14:11:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7668010E712;
	Thu,  5 Jan 2023 13:11:03 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 322BD10E710;
 Thu,  5 Jan 2023 13:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672924261; x=1704460261;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=O651ACm6VTuhIngCabF18gWcguGyiykLyAn2NenKhkI=;
 b=ZVvtRqm05+iBVWUqbqqw0dSnPsjByIb2TUcCxPbZnTKlu97iPAp+wnxv
 HqqlmC3YMqX3+OYuVQyTn+wxm5HGdmG5BuS3815ngkuxLnmIqepCnt+Pw
 0YHle6rHIB/1LCXF61GS4Waunnj0LdMI2X2Pl7ogLAnc+KACRGCXdVCub
 7aNEusmIvPEa8q88thsPjkSadWQQQxjk4w3cJ0z8uhTGe0x3C3UrPjM25
 pUbMxEjC2XI/me+kRD5sm5NmaqEocrgg1BNr2SpoU2QOlW5FqV3pYoyZq
 6+ZVzTXBwZwkBBDJ8S0JmSRG29a8ABwrfBm4VwoPfcbOFFb98iga2O07L g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="302568529"
X-IronPort-AV: E=Sophos;i="5.96,303,1665471600"; d="scan'208";a="302568529"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2023 05:11:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="655564034"
X-IronPort-AV: E=Sophos;i="5.96,303,1665471600"; d="scan'208";a="655564034"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga002.jf.intel.com with ESMTP; 05 Jan 2023 05:11:00 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 5 Jan 2023 05:10:59 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 5 Jan 2023 05:10:59 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 5 Jan 2023 05:10:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dsjf3vTraogDbCtA+tSzSyyQumYK5sP9st7aBZc6UMnAiu5ZrRZZxkHnz6Yb//zUX8yuj86fMw4a/EDADF6j8a07gPMe30ixsdgHqjp1Fv65LenERvKFm45+0yfxv5S6UDIjDCf92KqDIwYROByc+vrvqpeV4Kr39gukNQm2hTFS0mo7j2uR3bL+PAxGKAIX3mUpqA1vLFLd1h3KXXjxY9A73jyC182DCT59qfc6RL+cBZKlQwEUHDKIRC50sbHmccPzd3UtScl+hr8tjjX41F8B8cwHOCYrwOG9zo5TYgE63Xh6Wxz+9iKIDe+kZsZnDTxZGaQMfbiRVXaF+Dayuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bFUBAcI4DXyCrfJV3JoFha48VAhf2ycelesQJ2cXTMU=;
 b=TaD6drHJMFSH3+RfV0DKd6B9rsENWFbINljtYzqlhNPacTyL3PfIrkb137pg7/yR42CtWHQsNlGqUQkP0op2c8lJaDqaHhD5yR14JT42A/Xh2SfgWXuADtpEHTQ/efps9c3wRe/MYSO/SFbviUHcspY1JrvjRia8TLwHdXGN8BfaErakcIwr3SrL/vgmL7R5CwTSU9qfy7ubN7n0YlJh21SsQPZTxOvtnfXamRy51pV2kAtf706mojnP8cq2NPPOntlp2iYJz3XZHdgvjIip7DnyHRvifl7m1zcPYUXmkBpdC/Ai+U5U5soCtMTJzQbVTrZnJ465C+n8M3oIJEAWTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH8PR11MB6732.namprd11.prod.outlook.com (2603:10b6:510:1c8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 13:10:54 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::499c:efe3:4397:808]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::499c:efe3:4397:808%8]) with mapi id 15.20.5944.019; Thu, 5 Jan 2023
 13:10:54 +0000
Date: Thu, 5 Jan 2023 08:10:49 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [PULL] gvt-fixes
Message-ID: <Y7bMWQoMOBCY4rM0@intel.com>
References: <Y7UzOf7O8AaLTwHQ@zhen-hp.sh.intel.com>
 <Y7VkRDNBOJU4qkYY@intel.com>
 <Y7YWoFpz4plnSLCd@zhen-hp.sh.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Y7YWoFpz4plnSLCd@zhen-hp.sh.intel.com>
X-ClientProxiedBy: BY5PR17CA0042.namprd17.prod.outlook.com
 (2603:10b6:a03:167::19) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH8PR11MB6732:EE_
X-MS-Office365-Filtering-Correlation-Id: 2faaa706-1a6c-4eff-180c-08daef1e46d8
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B/Ah9v4tQkX5dtWWlsmqFu0uKF1sQFDJuIB61YYfk90IwY5XARSFYB3BW5joC4ZpODBn8F8/rWXlUJgHwIpTUjW15Bw5udxSajFvkMB3LQ2G4Kb08ChXQDYFc/cQUSP614aQpRyWo5VvLgWCSXfocFZOGHZ2lAy4Wyavb3/lifJranFKPGYfIbhc7Lg3gpC55ReAyxIEZoQko/9jiVfrxOAqnwEgrKzFR+8xqDawoc2vdJ8XNo6BbjulI6dhk3Wmo0zRO7lXHy6fB/wpmVWg1A+nJatxW9UwlJlxVzykLDsPjmFVt8tam3jGj3F1PxVjeEUG/U8HSE6QX1JMs0b4/Tv4hQ9Rqb5ZG5G3oqbLAT02uCvO/EF+E101iMCtfTr51oMjets7ANYi6d8sEG+CyDoVjHyUJq1P+Ky2EX3XXlbeTRKYoTsADF0N6qukGkZXke2r/KnNgoAglb9aWyHsLGmmd0YluTHr9gFX8hBCCQVIHD9txXSRixe5Y/YGXgyDTlSIughJVR6DCos8I04WuQngI05xfF0vTIwnBxZaL/3IBM2+1HWDT4Gwtt9UgEsMpZ/OuMODlE1tSbMBq9H+R2JGFmx9ESiPSBR/47w/7NxNjHo7akKGhS8FrzG16cZASZiNsJnG7+6rbXgZ3oN2roudjNMwEN7K01RKOKNSNKRvH2KDlorYHQQYprUeAFii
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(376002)(39860400002)(396003)(366004)(346002)(451199015)(53546011)(66476007)(4326008)(66946007)(66556008)(41300700001)(6506007)(8676002)(86362001)(186003)(54906003)(2906002)(83380400001)(316002)(6666004)(4001150100001)(26005)(6916009)(478600001)(44832011)(966005)(6486002)(6512007)(82960400001)(38100700002)(8936002)(36756003)(5660300002)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2adkBEv0UdCY/h2HmNWGYfNBS9ZggKULg/VAOlkWYou1MHMkTpkRC98DFu2g?=
 =?us-ascii?Q?40qmvAhQAC/pr9gkctJe5MQd8xHLZTmnz6F8zSyNy/bXR+JNlgQqw10dqchi?=
 =?us-ascii?Q?8kZN298/eHYiHOiz7pIgcn0O+0nNn0mvBheJpQJAl2fJeAVSPYFjUAiPphtt?=
 =?us-ascii?Q?VSkoT3wAH92nFQzyBToFCCuSuVrKKua5JHJK1Lf+309Gc+ocnmA4CMypSw7k?=
 =?us-ascii?Q?SAj3QMd2grloNk3tXD/3epTIS7DRVfJEUSJqcI6M4GtUbdQaizDmb9qh1PFY?=
 =?us-ascii?Q?THYNN56ZwaOivoVEwvjp2ck5Z7OrVqM/Le5fW2Fml1GTTzT/l2/rXCbbohZK?=
 =?us-ascii?Q?cAfvZq4UJ5fiy7xPZnpnix7H8JyUoR6n0TljJ/NJuhlcC0tlORi9vhPfRF1s?=
 =?us-ascii?Q?pr2x/TljySH0qeGlqmdjWbhbmZuLh3cjYwpX9CWGVD0c+xhVbjewv1safvr1?=
 =?us-ascii?Q?C2VyfM8GDchuTMKB+u9GmA1r5UQkwf4NpcixSPbde1C8xxcKRD6EnvMEmFN0?=
 =?us-ascii?Q?FAdX6Jh1sMl0HcLJwEuaL1L+SauH/RPPmC3KdC5ail+qufnIJd6Z35wPm87f?=
 =?us-ascii?Q?NUFOl4kdrj3z68T7HHJ3/Eb5z1WbcZIWFD8pgoaV9mnIzAMiqwvvaD8p7tW5?=
 =?us-ascii?Q?bNPJPKmNVH/nmPdHdqOytoatekET7bSQhslUOlbY3BTQm0Jbk0+E0tYInq80?=
 =?us-ascii?Q?AGisnkwezi4LdBtUOPGVl59j/AH88qzJQEliIZaTzNAY+kdZOxRBoOLZ31Z8?=
 =?us-ascii?Q?4QxiMOV13J9sTA+BWF+j4LRO6P3Z/QpTPJIWSISlry+JBduQ5yc6SkY6QDWp?=
 =?us-ascii?Q?C/5HenSJZwVgZkYvU2oYdcqWpoh53CnnanHc3mQF5tgjlHdfQBGEUx7iCgHE?=
 =?us-ascii?Q?wGnL1vbRiP6YifyMk4YZX97epHO9KD98jh6i/GALOebE4prt3wHjq/FNg47H?=
 =?us-ascii?Q?TRFCZ8ruxNou92Es3JsKyH3FZ7UP8Xa7/Ius6OB6dKTVKYQA/bsikLiXZAtQ?=
 =?us-ascii?Q?Eqj2KIzVkYMzs4UFTm9UxL2kIb8WQYYQOvwe/FglTRuvKTUiYhsgtKkSeM8Z?=
 =?us-ascii?Q?DExzUFFPe/AxhIa+t1hyjXEFpFyCwJuO+JADo+w/GV3hU7LZpPucSGt0A5d1?=
 =?us-ascii?Q?SLvvNPtrTJEPTx2rKWX2LfP5z8RUPo8FR4Mu/XAxyeiNrRwEQdOpe59VQlg/?=
 =?us-ascii?Q?/leQQGTWYdHL3ipXMRF4UAqTjcAIGr+LyeT5UU3q9hhryxD9LWlyeCNjw6Fh?=
 =?us-ascii?Q?z34nABKWqLzNf1mO8VZlarAerlvWw2/kn2UtDiOEkNf13Fw4LdVfyWq2J0RF?=
 =?us-ascii?Q?URt/a4xnYU7xxKW0Xs05qNpOjyz5x4pBQbbdcFFBpibs2tc9KMyAGVm7FBIw?=
 =?us-ascii?Q?FBWIdyZ+cPTBXjEJN5Z4MHLiJG/rvJ7Ed7J7gFqoSr70aeyF1orJ/vN1a7A+?=
 =?us-ascii?Q?cQGD0U2LT8qBP8CHueODWDzh1bMSHANo1GlKnz8Oh//bYyfrQQjqSbmuIsau?=
 =?us-ascii?Q?wrnUIv6NEn67QGN4ITr142MNc+YV81tpaJLea4k7hxogum1XMEagk51QllKM?=
 =?us-ascii?Q?3PKADMb/ba15XW3ZA7hyzRwVrDm6pXDnlYUar6sd4N7Gws2qFTwS9cbFr0nS?=
 =?us-ascii?Q?Wg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2faaa706-1a6c-4eff-180c-08daef1e46d8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 13:10:54.6251 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6R5w7+eO4urAs9urW7nq8AbciiCH+kDX5rJ2sqxqdXKC3oLO8kAF26mAkTLSGSyeTrtapoLugUkZy8P8kiIJuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6732
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

On Thu, Jan 05, 2023 at 08:15:28AM +0800, Zhenyu Wang wrote:
> On 2023.01.04 06:34:28 -0500, Rodrigo Vivi wrote:
> > On Wed, Jan 04, 2023 at 04:05:13PM +0800, Zhenyu Wang wrote:
> > > 
> > > Hi,
> > > 
> > > Here's accumulated current gvt-fixes. Several of them handle
> > > for error or destroy path issues and one from Zhi to fix up
> > > left vgpu status tracking.
> > > 
> > > thanks!
> > > ---
> > > The following changes since commit 6217e9f05a74df48c77ee68993d587cdfdb1feb7:
> > 
> > I'm kind of confused on your baseline here.
> > 
> > It is including a strange merge commit in the middle of the commits:
> > Zhenyu Wang   ??? M?????? Merge tag 'drm-intel-fixes-2022-12-30' into gvt-fixes
> > commit c063c8c07864246ba3831b017cea8d3096e236a8
> > 
> > Please rebase on top of v6.2-rc2 so we have the same base here.
> > (and please remind to sign-off-by when pushing the commits)
> > 
> 
> oh, I tried to sycn up by back merge with vfio iommufd of gvt changes
> to apply Zhi's patch properly, so it should stand on that tag..but anyway

I'd say for the fixes branches probably a rebase is better than back merges.
Keep the rebase in sync with -rc tags is probably the best way. or rebase
on drm-intel-fixes.

> I just refresh with rebase and fixed two invalid r-b tags. Please pull
> below one.

pulled. Thanks

> 
> thanks!
> ---
> The following changes since commit 88603b6dc419445847923fcb7fe5080067a30f98:
> 
>   Linux 6.2-rc2 (2023-01-01 13:53:16 -0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/intel/gvt-linux.git tags/gvt-fixes-2023-01-05
> 
> for you to fetch changes up to 4a61648af68f5ba4884f0e3b494ee1cabc4b6620:
> 
>   drm/i915/gvt: fix double free bug in split_2MB_gtt_entry (2023-01-04 23:21:19 +0800)
> 
> ----------------------------------------------------------------
> gvt-fixes-2023-01-05
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
> Zhenyu Wang (2):
>       drm/i915/gvt: fix gvt debugfs destroy
>       drm/i915/gvt: fix vgpu debugfs clean in remove
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


