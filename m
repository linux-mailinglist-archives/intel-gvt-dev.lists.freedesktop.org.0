Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E143824AA
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 17 May 2021 08:46:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E9FD6E483;
	Mon, 17 May 2021 06:46:12 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD41F6E185;
 Mon, 17 May 2021 06:46:10 +0000 (UTC)
IronPort-SDR: +NsBvBmBC+g0TXG76QyFiGCrUQxi6YRDno939fAivKEl5rlCTKL3yX+31R9n0JvMAx426QnVx8
 bWIVrSJlXfJQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9986"; a="200447665"
X-IronPort-AV: E=Sophos;i="5.82,306,1613462400"; d="scan'208";a="200447665"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2021 23:46:10 -0700
IronPort-SDR: orpjl26aGEusaqmhcN0z/ik+ANGCFvnEfgVrVKPetfkrnCt6guNE3a6g+MPC2Y5liK0ZRL5Jue
 HQ8jortuYqzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,306,1613462400"; d="scan'208";a="438762866"
Received: from unknown (HELO coxu-arch-shz) ([10.239.160.26])
 by orsmga008.jf.intel.com with ESMTP; 16 May 2021 23:46:08 -0700
Date: Mon, 17 May 2021 14:46:07 +0800 (CST)
From: Colin Xu <colin.xu@intel.com>
X-X-Sender: coxu_arch@coxu-arch-shz
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [PATCH 3/3] Revert "vfio/gvt: Make DRM_I915_GVT depend on
 VFIO_MDEV"
In-Reply-To: <20210511083332.1740601-4-zhenyuw@linux.intel.com>
Message-ID: <alpine.LNX.2.22.419.2105171446020.16753@coxu-arch-shz>
References: <20210511083332.1740601-1-zhenyuw@linux.intel.com>
 <20210511083332.1740601-4-zhenyuw@linux.intel.com>
User-Agent: Alpine 2.22 (LNX 419 2020-04-12)
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
Cc: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 Jason Gunthorpe <jgg@nvidia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Tue, 11 May 2021, Zhenyu Wang wrote:

> This reverts commit 07e543f4f9d116d6b4240644191dee6388ef4a85.
>
> As I915_GVT dependency issue is resolved, revert this.
>
> Cc: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>
> ---
> drivers/gpu/drm/i915/Kconfig | 1 -
> 1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
> index 8f15bfb5faac..93f4d059fc89 100644
> --- a/drivers/gpu/drm/i915/Kconfig
> +++ b/drivers/gpu/drm/i915/Kconfig
> @@ -102,7 +102,6 @@ config DRM_I915_GVT
> 	bool "Enable Intel GVT-g graphics virtualization host support"
> 	depends on DRM_I915
> 	depends on 64BIT
> -	depends on VFIO_MDEV
> 	default n
> 	help
> 	  Choose this option if you want to enable Intel GVT-g graphics
> -- 
> 2.31.0
>
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
>

Reviewed-by: Colin Xu <colin.xu@intel.com>

--
Best Regards,
Colin Xu
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
