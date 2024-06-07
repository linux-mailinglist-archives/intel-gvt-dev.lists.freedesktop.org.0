Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D778D900242
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  7 Jun 2024 13:36:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B534C10E00C;
	Fri,  7 Jun 2024 11:36:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mGJIy5NC";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 934E510E00C;
 Fri,  7 Jun 2024 11:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717760159; x=1749296159;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=JTGhWzxyuF6slKgaavvy59rQlsFQ6DqronJoklS3dmU=;
 b=mGJIy5NCsgRI7uRq52uAREopAwqnKaLdDzMAuxZU6M6NEpf2plUDVX3X
 o8biwrqjGH1aPErh0CA/LTyTRlnwhFP9YlKJruCRHnfIow/JCYgORjBs6
 Dm/FKZErxoAwOI+Qdy+X2NugMhDtp5M4YdqwMLWNRplAgRQmjeqnIsdNI
 UDehSVhQbNCQJ29QLoxYC/4WlP3b/MbbMKcD/uceOkk+KIPs0UJZQqF1U
 25doP46k0fna0yma181IrZMjqkzJguxkTbCESJ5bOcIXQJjf+/4+JrdHY
 akJbhhmG82jzedn5fURRvvZKptD5Q8oa0mzeWV53pHkavXu1bgrIh06XO A==;
X-CSE-ConnectionGUID: kEJ8E3SaT0Cge8FkyYBVSA==
X-CSE-MsgGUID: nSG9M6DQQU6T/sY1DPiDJQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14632846"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="14632846"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 04:35:59 -0700
X-CSE-ConnectionGUID: x+EOyA9sRrS9Z6eyZ4PqVg==
X-CSE-MsgGUID: 7nS0VE5UR2KHjYOJppIsGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38293323"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 07 Jun 2024 04:35:56 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 07 Jun 2024 14:35:55 +0300
Date: Fri, 7 Jun 2024 14:35:55 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 rodrigo.vivi@intel.com
Subject: Re: [PATCH 6/6] drm/i915: remove unused HSW_STEREO_3D_CTL register
 macros
Message-ID: <ZmLwmxPly3lKZRhp@intel.com>
References: <cover.1717757337.git.jani.nikula@intel.com>
 <991806d10ff182220c0b2f4681ee5a76a1b3ef8b.1717757337.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <991806d10ff182220c0b2f4681ee5a76a1b3ef8b.1717757337.git.jani.nikula@intel.com>
X-Patchwork-Hint: comment
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
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Fri, Jun 07, 2024 at 01:51:29PM +0300, Jani Nikula wrote:
> Remove the unused HSW_STEREO_3D_CTL register macros.

I don't enjoy having to trawl the specs to find registers.
So I prefer to keep everything that isn't actually wrong.

> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_reg.h | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index 2d834c32a3fa..127b113189ef 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -3385,12 +3385,6 @@
>  #define ADL_TVIDEO_DIP_AS_SDP_DATA(dev_priv, trans, i)	_MMIO_TRANS2(dev_priv, trans,\
>  							     _ADL_VIDEO_DIP_AS_DATA_A + (i) * 4)
>  
> -#define _HSW_STEREO_3D_CTL_A		0x70020
> -#define   S3D_ENABLE			(1 << 31)
> -#define _HSW_STEREO_3D_CTL_B		0x71020
> -
> -#define HSW_STEREO_3D_CTL(trans)	_MMIO_PIPE2(dev_priv, trans, _HSW_STEREO_3D_CTL_A)
> -
>  #define _PCH_TRANS_HTOTAL_B          0xe1000
>  #define _PCH_TRANS_HBLANK_B          0xe1004
>  #define _PCH_TRANS_HSYNC_B           0xe1008
> -- 
> 2.39.2

-- 
Ville Syrjälä
Intel
