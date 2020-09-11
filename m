Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2722676A4
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 12 Sep 2020 01:56:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 375CE6E0A1;
	Fri, 11 Sep 2020 23:56:13 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 334776E040;
 Fri, 11 Sep 2020 23:56:11 +0000 (UTC)
IronPort-SDR: +xUNlcgWJI5ny4zGoa57Jmxoofcpe6KeiQEI+n2YFa1gl6hNiYPxMVKRjN/MY4e1LUFNMvVFUE
 tc1p6mPU19xQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9741"; a="146608709"
X-IronPort-AV: E=Sophos;i="5.76,418,1592895600"; d="scan'208";a="146608709"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2020 16:56:06 -0700
IronPort-SDR: W85jOg1COy4RXznRCHwbHh/ZXhkhWw57vXYDOozA3yhBVFevZhBpmz/7gb0BN++USGlDOmZyml
 yPNZDK2Mm5vA==
X-IronPort-AV: E=Sophos;i="5.76,418,1592895600"; d="scan'208";a="450147801"
Received: from rdvivi-losangeles.jf.intel.com (HELO intel.com)
 ([10.165.21.201])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2020 16:56:03 -0700
Date: Fri, 11 Sep 2020 19:58:25 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [PULL] gvt-next
Message-ID: <20200911235825.GA259925@intel.com>
References: <20200910053720.GK28614@zhen-hp.sh.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200910053720.GK28614@zhen-hp.sh.intel.com>
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

On Thu, Sep 10, 2020 at 01:37:20PM +0800, Zhenyu Wang wrote:
> 
> Hi,
> 
> As we split pull request for 5.10 this time, here's gvt-next pull
> for 5.10. For gvt ww lock fix, Zhi would send another pull based
> on gem-next.
> 
> This includes current command access flag cleanup for
> handlers which would be used for next refined cmd scan. And also
> two more recent fixes on workaround cmd access and MIA reset state.
> 
> Thanks
> --
> The following changes since commit ced026e959bec5046afa310d6474e147b6294da2:
> 
>   drm/i915: Update DRIVER_DATE to 20200824 (2020-08-24 14:26:38 -0400)
> 
> are available in the Git repository at:
> 
>   https://github.com/intel/gvt-linux tags/gvt-next-2020-09-10

This is a malformed pull request line which dim doesn't recognize.
Could you please regenerate it?

$ cat /tmp/gvt-next/cur/1599868544.259925_1.rdvivi-losangeles\:2\,S | dim apply-pull drm-intel-next-queued
dim: no pull request found

> 
> for you to fetch changes up to df398e33b8fd3ac28b3c7166de555e38d26e7391:
> 
>   drm/i915/gvt: Init vreg GUC_STATUS to GS_MIA_IN_RESET (2020-09-10 13:49:05 +0800)
> 
> ----------------------------------------------------------------
> gvt-next-2020-09-10
> 
> - Cleanup command access flag (Yan)
> - New workaround cmd access fix (Colin)
> - MIA reset state fix (Colin)
> 
> ----------------------------------------------------------------
> Colin Xu (2):
>       drm/i915/gvt: Add F_CMD_ACCESS for some GEN9 SKU WA MMIO access
>       drm/i915/gvt: Init vreg GUC_STATUS to GS_MIA_IN_RESET
> 
> Yan Zhao (4):
>       drm/i915/gvt: rename F_IN_CTX flag to F_SR_IN_CTX
>       drm/i915/gvt: remove flag F_CMD_ACCESSED
>       drm/i915/gvt: add/modify interfaces for flag F_CMD_ACCESS
>       drm/i915/gvt: remove F_CMD_ACCESS flag for some registers
> 
>  drivers/gpu/drm/i915/gvt/cmd_parser.c   |  6 ++---
>  drivers/gpu/drm/i915/gvt/gvt.h          | 44 +++++++++++++++++++--------------
>  drivers/gpu/drm/i915/gvt/handlers.c     | 32 +++++++++++++-----------
>  drivers/gpu/drm/i915/gvt/mmio.c         |  3 +++
>  drivers/gpu/drm/i915/gvt/mmio_context.c |  2 +-
>  5 files changed, 49 insertions(+), 38 deletions(-)
> 
> -- 
> 
> $gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827


_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
