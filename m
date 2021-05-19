Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0762E3889BC
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 19 May 2021 10:50:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 837F86ECE9;
	Wed, 19 May 2021 08:50:54 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCB2E6ECE9;
 Wed, 19 May 2021 08:50:53 +0000 (UTC)
IronPort-SDR: nPS++wt2IOVfB/6xPICkUQMy21yvGViFFzZeNf/dKAYNggd1+5D0eAMqhQ+ViCw62K9PZO3Mfv
 UfX5beWdej4w==
X-IronPort-AV: E=McAfee;i="6200,9189,9988"; a="180528352"
X-IronPort-AV: E=Sophos;i="5.82,312,1613462400"; d="scan'208";a="180528352"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2021 01:50:53 -0700
IronPort-SDR: 4N6wef4i9zfnejH1AY4vLZX2fASVcpZMjuGdiC09xd2S4ssW4Iv46NwnaUveBaHU/YkV6g4LHL
 LuNTjwOQ6Uuw==
X-IronPort-AV: E=Sophos;i="5.82,312,1613462400"; d="scan'208";a="439879254"
Received: from akrolak-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.37.74])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2021 01:50:49 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, "Vivi\,
 Rodrigo" <rodrigo.vivi@intel.com>
Subject: Re: [PULL] gvt-fixes
In-Reply-To: <20210519074912.GG4589@zhen-hp.sh.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210519074912.GG4589@zhen-hp.sh.intel.com>
Date: Wed, 19 May 2021 11:50:46 +0300
Message-ID: <87lf8bds49.fsf@intel.com>
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

On Wed, 19 May 2021, Zhenyu Wang <zhenyuw@linux.intel.com> wrote:
> Hi,
>
> This is to fix GVT config workaround introduced during -rc1 via
> vfio/mdev change, which exposed dependency issue explicitly that
> made current GVT config nasty. So this is to fix dependency issue
> and get back original config sanity.

Pulled to drm-intel-fixes, thanks.

BR,
Jani.

>
> Thanks
> --
> The following changes since commit e4527420ed087f99c6aa2ac22c6d3458c7dc1a94:
>
>   drm/i915: Use correct downstream caps for check Src-Ctl mode for PCON (2021-05-12 20:53:08 +0300)
>
> are available in the Git repository at:
>
>   https://github.com/intel/gvt-linux tags/gvt-fixes-2021-05-19
>
> for you to fetch changes up to 145e06b58f8625becc61792a0554726314297a85:
>
>   drm/i915/gvt: Move mdev attribute groups into kvmgt module (2021-05-17 16:37:09 +0800)
>
> ----------------------------------------------------------------
> gvt-fixes-2021-05-19
>
> - Fix workaround in -rc1 for GVT config (Zhenyu)
>
> ----------------------------------------------------------------
> Zhenyu Wang (1):
>       drm/i915/gvt: Move mdev attribute groups into kvmgt module
>
>  drivers/gpu/drm/i915/Kconfig         |   1 -
>  drivers/gpu/drm/i915/gvt/gvt.c       | 124 +----------------------------------
>  drivers/gpu/drm/i915/gvt/gvt.h       |   3 -
>  drivers/gpu/drm/i915/gvt/hypercall.h |   2 +-
>  drivers/gpu/drm/i915/gvt/kvmgt.c     | 122 +++++++++++++++++++++++++++++++---
>  drivers/gpu/drm/i915/gvt/mpt.h       |   4 +-
>  6 files changed, 118 insertions(+), 138 deletions(-)
>

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
