Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D30900239
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  7 Jun 2024 13:34:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BEFC10E00C;
	Fri,  7 Jun 2024 11:34:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qw5HTbvw";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 821EE10E00C;
 Fri,  7 Jun 2024 11:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717760063; x=1749296063;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=jGhl0vrJpFM+CseTMpcnzvTK6hHpYlQ/vyqmLqAFRRc=;
 b=Qw5HTbvwFcUdUDds8A7IrzepPwUjZPdSCTqCQlVzvjtz2kfWFR7bErz1
 p/K9XrTM8IyM5pm1uPciuJqGdwJ0XxU6WwsOdjYbetyi8MYdxIyM6u2vA
 PTFJKZ+pOTEsB3RSXwIvo/MVvCBsPXm3Uigd9Ziu/b46Ep4cefEQl4esR
 C+lAQ1CrRoSMSzLXZPWag/gqlwmejFLX1aIdNtO9ulhG6oiXScfwsB6N5
 vN3z9ibJplfRnjNk7ZeuPUfnFkgLCE2dmXWLMNGri4QvOvp+7bkxVjEB7
 LfIGLp+V6aa/qKBFngpvuHcWuzGSrArcodZBrMGhzRUt8VZyOe/NPvp2r w==;
X-CSE-ConnectionGUID: VSd1giVcSq+JZ1M36k3Eww==
X-CSE-MsgGUID: mqwyLTChTR2UpozserLjhg==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14632733"
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; d="scan'208";a="14632733"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 04:34:23 -0700
X-CSE-ConnectionGUID: 6DENcrAMQ5Kvn7KK1ni48A==
X-CSE-MsgGUID: 1/uf2yoUQMm4qCuCBcgHEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; d="scan'208";a="38292985"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 07 Jun 2024 04:34:20 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 07 Jun 2024 14:34:19 +0300
Date: Fri, 7 Jun 2024 14:34:19 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 rodrigo.vivi@intel.com
Subject: Re: [PATCH 5/6] drm/i915: remove unused pipe/plane B register macros
Message-ID: <ZmLwOzZO4e4gaXIS@intel.com>
References: <cover.1717757337.git.jani.nikula@intel.com>
 <cd207b8bcaf883bded4178e2b54f9463c0eb7b36.1717757337.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cd207b8bcaf883bded4178e2b54f9463c0eb7b36.1717757337.git.jani.nikula@intel.com>
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

On Fri, Jun 07, 2024 at 01:51:28PM +0300, Jani Nikula wrote:
> None of these are used. The parametrized register macros all depend on
> the pipe/plane A offset macros alone. Remove the unused ones.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_reg.h | 23 -----------------------
>  1 file changed, 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index 15ad35178f1a..2d834c32a3fa 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -2214,29 +2214,6 @@
>  #define SWF3(dev_priv, i)	_MMIO(DISPLAY_MMIO_BASE(dev_priv) + 0x72414 + (i) * 4)
>  #define SWF_ILK(i)	_MMIO(0x4F000 + (i) * 4)
>  
> -/* Pipe B */
> -#define _PIPEBDSL		(DISPLAY_MMIO_BASE(dev_priv) + 0x71000)
> -#define _TRANSBCONF		(DISPLAY_MMIO_BASE(dev_priv) + 0x71008)
> -#define _PIPEBSTAT		(DISPLAY_MMIO_BASE(dev_priv) + 0x71024)
> -#define _PIPEBFRAMEHIGH		0x71040
> -#define _PIPEBFRAMEPIXEL	0x71044
> -#define _PIPEB_FRMCOUNT_G4X	(DISPLAY_MMIO_BASE(dev_priv) + 0x71040)
> -#define _PIPEB_FLIPCOUNT_G4X	(DISPLAY_MMIO_BASE(dev_priv) + 0x71044)
> -

All the _ stuff should go for sure.

> -
> -/* Display B control */
> -#define _DSPBCNTR		(DISPLAY_MMIO_BASE(dev_priv) + 0x71180)
> -#define   DISP_ALPHA_TRANS_ENABLE	REG_BIT(15)

Unlikely we'll ever use this, but if desired we could relocate
this next to all the other DSPCNTR bits. With perhaps a note that
it only applies to plane B.

> -#define   DISP_SPRITE_ABOVE_OVERLAY	REG_BIT(0)

This too could be relocated, with a note that it only applies to plane
B/C. Though as far as plane Z order goes I think there's at least one
more bit for that we've not even defined, so this isn't super useful
as is.

> -#define _DSPBADDR		(DISPLAY_MMIO_BASE(dev_priv) + 0x71184)
> -#define _DSPBSTRIDE		(DISPLAY_MMIO_BASE(dev_priv) + 0x71188)
> -#define _DSPBPOS		(DISPLAY_MMIO_BASE(dev_priv) + 0x7118C)
> -#define _DSPBSIZE		(DISPLAY_MMIO_BASE(dev_priv) + 0x71190)
> -#define _DSPBSURF		(DISPLAY_MMIO_BASE(dev_priv) + 0x7119C)
> -#define _DSPBTILEOFF		(DISPLAY_MMIO_BASE(dev_priv) + 0x711A4)
> -#define _DSPBOFFSET		(DISPLAY_MMIO_BASE(dev_priv) + 0x711A4)
> -#define _DSPBSURFLIVE		(DISPLAY_MMIO_BASE(dev_priv) + 0x711AC)
> -
>  /* ICL DSI 0 and 1 */
>  #define _PIPEDSI0CONF		0x7b008
>  #define _PIPEDSI1CONF		0x7b808
> -- 
> 2.39.2

-- 
Ville Syrjälä
Intel
