Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C80036E966
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 29 Apr 2021 13:12:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3996A6EE1B;
	Thu, 29 Apr 2021 11:12:34 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC5666EE1B;
 Thu, 29 Apr 2021 11:12:32 +0000 (UTC)
IronPort-SDR: CwSNUGXQshg674PzO/v0gTwtVrsiE74LiGN4WLON+FmEvQRTWOfDqHg1GzsREFIb6wrLeMrZKM
 Tq+bHrwCEQIA==
X-IronPort-AV: E=McAfee;i="6200,9189,9968"; a="217708455"
X-IronPort-AV: E=Sophos;i="5.82,259,1613462400"; d="scan'208";a="217708455"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2021 04:12:32 -0700
IronPort-SDR: IWyEGbqLxF4U3sr75lwnv0eXlw3/cx6hm1Rllt0CG+02H2Tj2KjMTez+LxX+qiBGzaiaWkFAYX
 Fx9PZ5yUy1lg==
X-IronPort-AV: E=Sophos;i="5.82,259,1613462400"; d="scan'208";a="430792663"
Received: from auchter-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.38.190])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2021 04:12:29 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>, "Vivi\,
 Rodrigo" <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Re: [PULL] gvt-next-fixes
In-Reply-To: <20210429085142.GT1551@zhen-hp.sh.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210429085142.GT1551@zhen-hp.sh.intel.com>
Date: Thu, 29 Apr 2021 14:12:26 +0300
Message-ID: <87czud2vl1.fsf@intel.com>
MIME-Version: 1.0
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>, "Lv, 
 Zhiyuan" <zhiyuan.lv@intel.com>, Zhi Wang <zhi.a.wang@intel.com>, "Yuan,
 Hang" <hang.yuan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Thu, 29 Apr 2021, Zhenyu Wang <zhenyuw@linux.intel.com> wrote:
> Hi,
>
> Here's just another left fix for possible divide error in vgpu
> display rate calculation by Colin.

Thanks, pulled to drm-intel-next-fixes.

> btw, I'll need a backmerge of linus tree or maybe wait till rc1
> to apply gvt mdev dependency fix from https://patchwork.freedesktop.org/series/89479/

Note that we can't pull anything from you that has a newer baseline than
what we have.

BR,
Jani.


>
> Thanks
> --
> The following changes since commit e65a4d378480101f222e8f6978c22e590c1fb7b5:
>
>   Merge tag 'gvt-next-fixes-2021-04-21' of https://github.com/intel/gvt-linux into drm-intel-next-fixes (2021-04-21 13:22:30 +0300)
>
> are available in the Git repository at:
>
>   https://github.com/intel/gvt-linux tags/gvt-next-fixes-2021-04-29
>
> for you to fetch changes up to d385c16173f28a18866abf54c764200c276dace0:
>
>   drm/i915/gvt: Prevent divided by zero when calculating refresh rate (2021-04-29 17:00:09 +0800)
>
> ----------------------------------------------------------------
> gvt-next-fixes-2021-04-29
>
> - Fix possible divide error in vgpu display rate calculation (Colin)
>
> ----------------------------------------------------------------
> Colin Xu (1):
>       drm/i915/gvt: Prevent divided by zero when calculating refresh rate
>
>  drivers/gpu/drm/i915/gvt/handlers.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
