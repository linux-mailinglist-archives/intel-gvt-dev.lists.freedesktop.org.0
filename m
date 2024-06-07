Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE52900555
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  7 Jun 2024 15:44:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D07310EC54;
	Fri,  7 Jun 2024 13:44:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="epXTHqtT";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38DCA10EC4F;
 Fri,  7 Jun 2024 13:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717767857; x=1749303857;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=kMV6bfmaqUd+y7CQMu+qIZU7aRus2AVUxv4a+iCeCw0=;
 b=epXTHqtTc38vvAnACJADkQovOoGk04Vf7yPsr6Fw1i02CbaSlsewSPhR
 WxmvmhwRoTI/Igw53CxLns4dMKdtGq7qBL5fshja5zrTV+CAq/PJ/zzzy
 PjxxJxC2f1Nzrp5RVcQDL24Usi7O+KN/H0KkY62EmcH72QRyElMeAwFJG
 hrsTUnjLj8ygkEteWzRkZ4F5dccf26TJ53WqFT6ZltEkmwzjAhPvVT9Sl
 I++0QvRAmb1vZAgDRZM+vfNuM50vN/Yj8HNR7Vc4V/KGC+YPyOSExYWFP
 +n3IzR2HY82C0uYmNFM25KO41LYhxI5zCbU54uo8XUVuq1k6uEy25at+F w==;
X-CSE-ConnectionGUID: MabyF2MxSQ+iwCdAFr4/8g==
X-CSE-MsgGUID: 6BzVzBy5QTivWsiiyJNJLQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="25115454"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="25115454"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 06:44:16 -0700
X-CSE-ConnectionGUID: zfWZRcpaTS6daGqdddKqWg==
X-CSE-MsgGUID: petuVDeRT+2K/ufbSWHLvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38320485"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 07 Jun 2024 06:44:14 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 07 Jun 2024 16:44:13 +0300
Date: Fri, 7 Jun 2024 16:44:13 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 rodrigo.vivi@intel.com
Subject: Re: [PATCH 6/6] drm/i915: remove unused HSW_STEREO_3D_CTL register
 macros
Message-ID: <ZmMOrVL9sxg5x6F9@intel.com>
References: <cover.1717757337.git.jani.nikula@intel.com>
 <991806d10ff182220c0b2f4681ee5a76a1b3ef8b.1717757337.git.jani.nikula@intel.com>
 <ZmLwmxPly3lKZRhp@intel.com> <87r0d9kkot.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87r0d9kkot.fsf@intel.com>
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

On Fri, Jun 07, 2024 at 03:21:22PM +0300, Jani Nikula wrote:
> On Fri, 07 Jun 2024, Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> > On Fri, Jun 07, 2024 at 01:51:29PM +0300, Jani Nikula wrote:
> >> Remove the unused HSW_STEREO_3D_CTL register macros.
> >
> > I don't enjoy having to trawl the specs to find registers.
> > So I prefer to keep everything that isn't actually wrong.
> 
> Shall I apply this [1] then?

Works for me.

> 
> BR,
> Jani.
> 
> 
> [1] https://lore.kernel.org/r/76f980f5ed3638746c6b58dec7d0bd8c43a37987.1717514638.git.jani.nikula@intel.com
> 
> 
> >
> >> 
> >> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> >> ---
> >>  drivers/gpu/drm/i915/i915_reg.h | 6 ------
> >>  1 file changed, 6 deletions(-)
> >> 
> >> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> >> index 2d834c32a3fa..127b113189ef 100644
> >> --- a/drivers/gpu/drm/i915/i915_reg.h
> >> +++ b/drivers/gpu/drm/i915/i915_reg.h
> >> @@ -3385,12 +3385,6 @@
> >>  #define ADL_TVIDEO_DIP_AS_SDP_DATA(dev_priv, trans, i)	_MMIO_TRANS2(dev_priv, trans,\
> >>  							     _ADL_VIDEO_DIP_AS_DATA_A + (i) * 4)
> >>  
> >> -#define _HSW_STEREO_3D_CTL_A		0x70020
> >> -#define   S3D_ENABLE			(1 << 31)
> >> -#define _HSW_STEREO_3D_CTL_B		0x71020
> >> -
> >> -#define HSW_STEREO_3D_CTL(trans)	_MMIO_PIPE2(dev_priv, trans, _HSW_STEREO_3D_CTL_A)
> >> -
> >>  #define _PCH_TRANS_HTOTAL_B          0xe1000
> >>  #define _PCH_TRANS_HBLANK_B          0xe1004
> >>  #define _PCH_TRANS_HSYNC_B           0xe1008
> >> -- 
> >> 2.39.2
> 
> -- 
> Jani Nikula, Intel

-- 
Ville Syrjälä
Intel
