Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 800FA1EBD9C
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  2 Jun 2020 16:04:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6CC16E3E1;
	Tue,  2 Jun 2020 14:04:48 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D33496E3C1;
 Tue,  2 Jun 2020 14:04:46 +0000 (UTC)
IronPort-SDR: dzIIg2tXv2Qj6ixV702afWpSIJlOr/7VjEZsyVkwXnq6Kme8PreY638cXSF5j57FZ6rXlSONhi
 cSGdkuetlqrw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2020 07:04:45 -0700
IronPort-SDR: 7h7Kvx18xqX939MM1JLbdthTWfp4n2FsX5T05kW+jn/UZwDd0oQoxFc5HLZjmew0EAfxlY+6+G
 z44kqi5f1WhQ==
X-IronPort-AV: E=Sophos;i="5.73,464,1583222400"; d="scan'208";a="416192081"
Received: from jlahtine-desk.ger.corp.intel.com (HELO localhost)
 ([10.252.9.244])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2020 07:04:41 -0700
MIME-Version: 1.0
In-Reply-To: <20200528033559.GG23961@zhen-hp.sh.intel.com>
References: <20200528033559.GG23961@zhen-hp.sh.intel.com>
Subject: Re: [PULL] gvt-next-fixes
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Tue, 02 Jun 2020 17:04:38 +0300
Message-ID: <159110667839.24106.18398193602690473504@jlahtine-desk.ger.corp.intel.com>
User-Agent: alot/0.8.1
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

Quoting Zhenyu Wang (2020-05-28 06:35:59)
> 
> Hi,
> 
> Here's two queued warning fixes for gvt-next. One is for clang warning
> on debug only function and another one from coccicheck to use ARRAY_SIZE.

Pulled now, thanks for the PR.

Regards, Joonas

> 
> Thanks
> --
> The following changes since commit 3a36aa237e4ed04553c0998cf5f47eda3e206e4f:
> 
>   drm/i915: Update DRIVER_DATE to 20200515 (2020-05-15 14:49:24 +0300)
> 
> are available in the Git repository at:
> 
>   https://github.com/intel/gvt-linux tags/gvt-next-fixes-2020-05-28
> 
> for you to fetch changes up to cb7ee52284a244fd14caec73df0d49e02891aac4:
> 
>   drm/i915/gvt: Use ARRAY_SIZE for vgpu_types (2020-05-19 17:18:50 +0800)
> 
> ----------------------------------------------------------------
> gvt-next-fixes-2020-05-28
> 
> - Fix one clang warning on debug only function (Nathan)
> - Use ARRAY_SIZE for coccicheck warn (Aishwarya)
> 
> ----------------------------------------------------------------
> Aishwarya Ramakrishnan (1):
>       drm/i915/gvt: Use ARRAY_SIZE for vgpu_types
> 
> Nathan Chancellor (1):
>       drm/i915: Mark check_shadow_context_ppgtt as maybe unused
> 
>  drivers/gpu/drm/i915/gvt/scheduler.c | 2 +-
>  drivers/gpu/drm/i915/gvt/vgpu.c      | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> 
> -- 
> Open Source Technology Center, Intel ltd.
> 
> $gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
