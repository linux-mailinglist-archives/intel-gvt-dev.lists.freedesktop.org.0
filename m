Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1E32B8BD2
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 19 Nov 2020 07:52:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB8E589CD8;
	Thu, 19 Nov 2020 06:52:43 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1D4F89CA8;
 Thu, 19 Nov 2020 06:52:41 +0000 (UTC)
IronPort-SDR: HAf+JM4DRv7wBtVfJnPQ6/vMlhu5yLyWL5A0TJKDhFrTQvUWIfLLS5W6p7lmxf+lThwnavhPMf
 aiaX+rh8KGUw==
X-IronPort-AV: E=McAfee;i="6000,8403,9809"; a="171340627"
X-IronPort-AV: E=Sophos;i="5.77,489,1596524400"; d="scan'208";a="171340627"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2020 22:52:41 -0800
IronPort-SDR: bsI3kmsVJUGt9P5VBn6aKchAkHetjmYAbaze6zhMacUPKXhhQAbdYnB5CZKkO/QOJEDNfr21Jz
 HPXj6nYe+jSA==
X-IronPort-AV: E=Sophos;i="5.77,489,1596524400"; d="scan'208";a="533051502"
Received: from rdvivi-losangeles.jf.intel.com (HELO intel.com)
 ([10.165.21.201])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2020 22:52:40 -0800
Date: Thu, 19 Nov 2020 01:53:46 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [PULL] gvt-fixes
Message-ID: <20201119065346.GA1747137@intel.com>
References: <20201117023918.GB23899@zhen-hp.sh.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201117023918.GB23899@zhen-hp.sh.intel.com>
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

On Tue, Nov 17, 2020 at 10:39:18AM +0800, Zhenyu Wang wrote:
> 
> Hi,
> 
> Here's more gvt fixes for 5.10. It temporarily disables VFIO edid
> feature on BXT/APL until its virtual display is really fixed to make
> it work properly. And fixes for DPCD 1.2 and error return in taking
> module reference.
> 
> Thanks
> --
> The following changes since commit 92010a97098c4c9fd777408cc98064d26b32695b:
> 
>   drm/i915/gvt: Fix mmio handler break on BXT/APL. (2020-10-30 11:50:06 +0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/intel/gvt-linux tags/gvt-fixes-2020-11-17
> 
> for you to fetch changes up to 4ec2b69da5e1544dbadb30cddb49c8df60209b0c:
> 
>   drm/i915/gvt: return error when failing to take the module reference (2020-11-13 12:16:52 +0800)
> 
> ----------------------------------------------------------------
> gvt-fixes-2020-11-17
> 
> - Temporarily disable VFIO edid on BXT/APL (Colin)
> - Fix emulated DPCD for version 1.2 (Tina)
> - Fix error return when failing to take module reference (Xiongfeng)

pulled, thanks!

> 
> ----------------------------------------------------------------
> Colin Xu (1):
>       drm/i915/gvt: Temporarily disable vfio_edid for BXT/APL
> 
> Tina Zhang (1):
>       drm/i915/gvt: Set ENHANCED_FRAME_CAP bit
> 
> Xiongfeng Wang (1):
>       drm/i915/gvt: return error when failing to take the module reference
> 
>  drivers/gpu/drm/i915/gvt/display.c | 2 +-
>  drivers/gpu/drm/i915/gvt/kvmgt.c   | 4 +++-
>  drivers/gpu/drm/i915/gvt/vgpu.c    | 3 ++-
>  3 files changed, 6 insertions(+), 3 deletions(-)
> 
> -- 
> 
> $gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827


_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
