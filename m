Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4552180BDE
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 10 Mar 2020 23:50:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE8296E8E5;
	Tue, 10 Mar 2020 22:50:16 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AEB26E8E3;
 Tue, 10 Mar 2020 22:50:15 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Mar 2020 15:50:14 -0700
X-IronPort-AV: E=Sophos;i="5.70,538,1574150400"; d="scan'208";a="415360835"
Received: from rdvivi-losangeles.jf.intel.com (HELO intel.com)
 ([10.165.21.202])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Mar 2020 15:50:14 -0700
Date: Tue, 10 Mar 2020 15:50:51 -0700
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [PULL] gvt-next
Message-ID: <20200310225051.GC3187880@intel.com>
References: <20200310081928.GG28483@zhen-hp.sh.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200310081928.GG28483@zhen-hp.sh.intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, "Yuan,
 Hang" <hang.yuan@intel.com>, "Lv, Zhiyuan" <zhiyuan.lv@intel.com>,
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>,
 Zhi Wang <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Tue, Mar 10, 2020 at 04:19:28PM +0800, Zhenyu Wang wrote:
> 
> Hi,
> 
> Here's more gvt change for -next. Mostly rebase and fix Chris's
> cleanup on intel engine and dev_priv usage. And also one fix for CFL
> after VFIO edid enabled in last gvt-next pull.

pulled to dinq,

Thanks,
Rodrigo.

> 
> thanks
> --
> The following changes since commit a8bb49b64c4f4284fb36169bdd9fc6efd62eb26a:
> 
>   drm/i915/gvt: Fix drm_WARN issue where vgpu ptr is unavailable (2020-02-25 16:13:04 +0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/intel/gvt-linux tags/gvt-next-2020-03-10
> 
> for you to fetch changes up to a61ac1e75105a077ec1efd6923ae3c619f862304:
> 
>   drm/i915/gvt: Wean gvt off using dev_priv (2020-03-06 10:08:10 +0800)
> 
> ----------------------------------------------------------------
> gvt-next-2020-03-10
> 
> - Fix CFL dmabuf display after vfio edid enabling (Tina)
> - Clean up scan non-priv batch debugfs entry (Chris)
> - Use intel engines initialized in gvt, cleanup previous ring id (Chris)
> - Use intel_gt instead (Chris)
> 
> ----------------------------------------------------------------
> Chris Wilson (3):
>       drm/i915/gvt: cleanup debugfs scan_nonprivbb
>       drm/i915/gvt: Wean gvt off dev_priv->engine[]
>       drm/i915/gvt: Wean gvt off using dev_priv
> 
> Tina Zhang (1):
>       drm/i915/gvt: Fix dma-buf display blur issue on CFL
> 
>  drivers/gpu/drm/i915/gvt/aperture_gm.c  |  84 ++++++-----
>  drivers/gpu/drm/i915/gvt/cfg_space.c    |   8 +-
>  drivers/gpu/drm/i915/gvt/cmd_parser.c   | 204 ++++++++++++--------------
>  drivers/gpu/drm/i915/gvt/debugfs.c      |  45 +-----
>  drivers/gpu/drm/i915/gvt/display.c      |  21 +--
>  drivers/gpu/drm/i915/gvt/dmabuf.c       |   4 +-
>  drivers/gpu/drm/i915/gvt/edid.c         |  16 +-
>  drivers/gpu/drm/i915/gvt/execlist.c     | 103 +++++++------
>  drivers/gpu/drm/i915/gvt/execlist.h     |   5 +-
>  drivers/gpu/drm/i915/gvt/fb_decoder.c   |   6 +-
>  drivers/gpu/drm/i915/gvt/firmware.c     |  16 +-
>  drivers/gpu/drm/i915/gvt/gtt.c          |  50 +++----
>  drivers/gpu/drm/i915/gvt/gvt.c          |  38 ++---
>  drivers/gpu/drm/i915/gvt/gvt.h          |  25 ++--
>  drivers/gpu/drm/i915/gvt/handlers.c     | 193 ++++++++++++-------------
>  drivers/gpu/drm/i915/gvt/interrupt.c    |  14 +-
>  drivers/gpu/drm/i915/gvt/kvmgt.c        |  10 +-
>  drivers/gpu/drm/i915/gvt/mmio.c         |   6 +-
>  drivers/gpu/drm/i915/gvt/mmio.h         |   4 +-
>  drivers/gpu/drm/i915/gvt/mmio_context.c | 127 ++++++++--------
>  drivers/gpu/drm/i915/gvt/mmio_context.h |   5 +-
>  drivers/gpu/drm/i915/gvt/sched_policy.c |  25 ++--
>  drivers/gpu/drm/i915/gvt/scheduler.c    | 249 +++++++++++++++-----------------
>  drivers/gpu/drm/i915/gvt/scheduler.h    |   9 +-
>  drivers/gpu/drm/i915/gvt/vgpu.c         |  12 +-
>  25 files changed, 601 insertions(+), 678 deletions(-)
> 
> -- 
> Open Source Technology Center, Intel ltd.
> 
> $gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827


_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
