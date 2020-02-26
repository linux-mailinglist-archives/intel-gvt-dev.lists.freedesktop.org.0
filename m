Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 021EB16FE79
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 26 Feb 2020 12:58:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA9BA6E8B7;
	Wed, 26 Feb 2020 11:58:40 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 857B06E8B7;
 Wed, 26 Feb 2020 11:58:39 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Feb 2020 03:58:38 -0800
X-IronPort-AV: E=Sophos;i="5.70,488,1574150400"; d="scan'208";a="231375364"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Feb 2020 03:58:35 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>, "Vivi\,
 Rodrigo" <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Re: [PULL] gvt-next
In-Reply-To: <20200226103840.GD10413@zhen-hp.sh.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200226103840.GD10413@zhen-hp.sh.intel.com>
Date: Wed, 26 Feb 2020 13:58:32 +0200
Message-ID: <877e09sgpj.fsf@intel.com>
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

On Wed, 26 Feb 2020, Zhenyu Wang <zhenyuw@linux.intel.com> wrote:
> Hi,
>
> Here's gvt-next pull. Mostly for cleanup and kvmgt specific struct
> has been moved to its own module, also enable VFIO edid for all platform
> including CML. Pls see details below.

What happened with [1]? Would've liked to see that moving forward.

BR,
Jani.


[1] http://patchwork.freedesktop.org/patch/msgid/20200117153554.3104278-1-chris@chris-wilson.co.uk

>
> Thanks
> --
> The following changes since commit e24bcd34c1dd7dabde4a8546920537f7137e3c5f:
>
>   drm/i915/dp: Add all tiled and port sync conns to modeset (2020-02-20 13:55:02 +0530)
>
> are available in the Git repository at:
>
>   https://github.com/intel/gvt-linux tags/gvt-next-2020-02-26
>
> for you to fetch changes up to a8bb49b64c4f4284fb36169bdd9fc6efd62eb26a:
>
>   drm/i915/gvt: Fix drm_WARN issue where vgpu ptr is unavailable (2020-02-25 16:13:04 +0800)
>
> ----------------------------------------------------------------
> gvt-next-2020-02-26
>
> - Enable VFIO edid for all platform (Zhenyu)
> - Code cleanup for attr group and unused vblank complete (Zhenyu, Julian)
> - Make gvt oblivious of kvmgt data structures (Julian)
> - Make WARN* drm specific (Pankaj)
>
> ----------------------------------------------------------------
> Julian Stecklina (2):
>       drm/i915/gvt: remove unused vblank_done completion
>       drm/i915/gvt: make gvt oblivious of kvmgt data structures
>
> Pankaj Bharadiya (2):
>       drm/i915/gvt: Make WARN* drm specific where drm_priv ptr is available
>       drm/i915/gvt: Make WARN* drm specific where vgpu ptr is available
>
> Tina Zhang (1):
>       drm/i915/gvt: Fix drm_WARN issue where vgpu ptr is unavailable
>
> Zhenyu Wang (3):
>       drm/i915/gvt: remove unused type attributes
>       drm/i915/gvt: Enable vfio edid for all GVT supported platform
>       Merge drm-intel-next-queued into gvt-next
>
>  drivers/gpu/drm/i915/gvt/aperture_gm.c  |   6 +-
>  drivers/gpu/drm/i915/gvt/cfg_space.c    |  23 ++-
>  drivers/gpu/drm/i915/gvt/cmd_parser.c   |   4 +-
>  drivers/gpu/drm/i915/gvt/display.c      |   6 +-
>  drivers/gpu/drm/i915/gvt/dmabuf.c       |   4 +-
>  drivers/gpu/drm/i915/gvt/edid.c         |  19 +-
>  drivers/gpu/drm/i915/gvt/gtt.c          |  21 ++-
>  drivers/gpu/drm/i915/gvt/gvt.c          |   8 +-
>  drivers/gpu/drm/i915/gvt/gvt.h          |  37 +---
>  drivers/gpu/drm/i915/gvt/handlers.c     |  22 ++-
>  drivers/gpu/drm/i915/gvt/interrupt.c    |  15 +-
>  drivers/gpu/drm/i915/gvt/kvmgt.c        | 303 +++++++++++++++++++-------------
>  drivers/gpu/drm/i915/gvt/mmio.c         |  30 ++--
>  drivers/gpu/drm/i915/gvt/mmio_context.c |   6 +-
>  drivers/gpu/drm/i915/gvt/scheduler.c    |   6 +-
>  drivers/gpu/drm/i915/gvt/vgpu.c         |  10 +-
>  16 files changed, 304 insertions(+), 216 deletions(-)

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
