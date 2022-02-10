Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B2C4B08E0
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 10 Feb 2022 09:51:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70FFA10E788;
	Thu, 10 Feb 2022 08:51:57 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CABB410E788;
 Thu, 10 Feb 2022 08:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644483115; x=1676019115;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=4XdG7BzXTRswPTWDunGSiHJl0uavPy5Oti3kKRa7dhs=;
 b=H/hEZ3MToyOQzkF7ZfCgXD7TFABEuStSEvm3K9RuVRfAyRdFTVDwrJ7T
 WpbgvazZtfnsXE8k4KYhCsBtIhReer5QuApSO5nGSYQkC/vjbliJEv4SX
 B8CgHS3n66fw784LA2/b8T0wuThUMCbkszutX6jzPMAaf9So5ykteUKbH
 Ne06Bx7acln86CZXj53NCpLDdesslISaWfHnyZD57M0nxBd4ZmTdxnD/L
 Fkdib2sZte42A01jT6J7WtnbJWzzeszL1bXno9C5OVuaQaEhfOUQyZ5qi
 MZH0ofEH7Z99DzEoEBRtkIyBd8VqJcB6LvdqfiRcwf6kPiZrCVrzY8zbA A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10253"; a="236848195"
X-IronPort-AV: E=Sophos;i="5.88,358,1635231600"; d="scan'208";a="236848195"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 00:51:51 -0800
X-IronPort-AV: E=Sophos;i="5.88,358,1635231600"; d="scan'208";a="701609720"
Received: from dhogarty-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.10.221])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 00:51:48 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Wang, Zhi A" <zhi.a.wang@intel.com>, Zhi Wang
 <zhi.wang.linux@gmail.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Subject: RE: [GVT PULL] gvt-fixes for drm-intel-fixes
In-Reply-To: <DM4PR11MB5549FFC6FF4AA53549199770CA2E9@DM4PR11MB5549.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <1f619581-e3da-3899-09ac-f714d954a580@gmail.com>
 <DM4PR11MB5549FFC6FF4AA53549199770CA2E9@DM4PR11MB5549.namprd11.prod.outlook.com>
Date: Thu, 10 Feb 2022 10:51:45 +0200
Message-ID: <87mtiz85pa.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


+Tvrtko

On Wed, 09 Feb 2022, "Wang, Zhi A" <zhi.a.wang@intel.com> wrote:
> Hi folks:
>
> Ping. This pull seems not got merged.
>
> Thanks,
> Zhi.
>
> -----Original Message-----
> From: Zhi Wang <zhi.wang.linux@gmail.com> 
> Sent: Saturday, January 15, 2022 12:46 PM
> To: Vivi, Rodrigo <rodrigo.vivi@intel.com>; jani.nikula@linux.intel.com; joonas.lahtinen@linux.intel.com
> Cc: intel-gvt-dev@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; Wang, Zhi A <zhi.a.wang@intel.com>
> Subject: [GVT PULL] gvt-fixes for drm-intel-fixes
>
> Hi folks:
>
> Here is the gvt-fixes pull for drm-intel-fixes. It contains:
>
> - Make DRM_I915_GVT depend on X86 (Siva Mullati)
> - Clean kernel doc in gtt.c (Randy Dunlap)
>
> This pull has been tested by: dim apply-pull drm-intel-fixes < this_email.eml
>
> Zhi.
>
> The following changes since commit d46f329a3f6048e04736e86cb13c880645048792:
>
>   drm/i915: Increment composite fence seqno (2021-12-27 11:33:40 +0200)
>
> are available in the Git repository at:
>
>   https://github.com/intel/gvt-linux.git tags/gvt-fixes-2022-01-13
>
> for you to fetch changes up to d72d69abfdb6e0375981cfdda8eb45143f12c77d:
>
>   drm/i915/gvt: Make DRM_I915_GVT depend on X86 (2022-01-13 18:13:12 +0000)
>
> ----------------------------------------------------------------
> gvt-fixes-2022-01-13
>
> - Make DRM_I915_GVT depend on X86 (Siva Mullati)
> - Clean kernel doc in gtt.c (Randy Dunlap)
>
> ----------------------------------------------------------------
> Randy Dunlap (1):
>       drm/i915/gvt: clean up kernel-doc in gtt.c
>
> Siva Mullati (1):
>       drm/i915/gvt: Make DRM_I915_GVT depend on X86
>
>  drivers/gpu/drm/i915/Kconfig   | 1 +
>  drivers/gpu/drm/i915/gvt/gtt.c | 4 ++--
>  2 files changed, 3 insertions(+), 2 deletions(-)

-- 
Jani Nikula, Intel Open Source Graphics Center
