Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C1C900315
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  7 Jun 2024 14:12:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AB0B10EC21;
	Fri,  7 Jun 2024 12:12:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WnDNUiZ2";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8DEC10EC1F;
 Fri,  7 Jun 2024 12:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717762366; x=1749298366;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=CECaafpCGlMwmte6h9bxe6ru3g6Mu0iJYcn+Oulut24=;
 b=WnDNUiZ25TM+Uziluy2KmjP9O0jt1C+kbUjSi23boCkoZVt1AlBxgMR7
 W8VPD1+raPirkSzsuHLl4L6Zm2eM+5Y56vBwSKEw4iFGqplBxzMOqdFZt
 FVqf58aYuyQCAd87Neu3/fJkZqRP68IU69AQh/kVoUWtoGV8yc69u+8us
 CH6N/7OLvKjliIh0Ik3k6bfoZCiepMNiEg3odP2AKi4+vHsw4MXizA3E7
 wlz/JPjDsTTm1FjBTXhqC0MM8ZgRL9PoTfTvhHNMkpOwq9OBM6oc3ZG5T
 1g9AmyHe0vY2yYmMLzWxSCh7KugvC32wBdmCZT0UmtNGMmMiNAoHLbsWG w==;
X-CSE-ConnectionGUID: Ok/KHvRqTAOI5xkyyv4tgg==
X-CSE-MsgGUID: dIsVx70oREe3RCtMmCb2Tg==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="18333058"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="18333058"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 05:12:45 -0700
X-CSE-ConnectionGUID: mMzYcJQhQZmKelGj9ZyjOw==
X-CSE-MsgGUID: dTg5aR27Qw+v0Tr/soEqkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38406673"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.72])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 05:12:43 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 rodrigo.vivi@intel.com
Subject: Re: [PATCH 5/6] drm/i915: remove unused pipe/plane B register macros
In-Reply-To: <ZmLwOzZO4e4gaXIS@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1717757337.git.jani.nikula@intel.com>
 <cd207b8bcaf883bded4178e2b54f9463c0eb7b36.1717757337.git.jani.nikula@intel.com>
 <ZmLwOzZO4e4gaXIS@intel.com>
Date: Fri, 07 Jun 2024 15:12:40 +0300
Message-ID: <87tti5kl3b.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Fri, 07 Jun 2024, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Fri, Jun 07, 2024 at 01:51:28PM +0300, Jani Nikula wrote:
>> None of these are used. The parametrized register macros all depend on
>> the pipe/plane A offset macros alone. Remove the unused ones.
>>=20
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  drivers/gpu/drm/i915/i915_reg.h | 23 -----------------------
>>  1 file changed, 23 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915=
_reg.h
>> index 15ad35178f1a..2d834c32a3fa 100644
>> --- a/drivers/gpu/drm/i915/i915_reg.h
>> +++ b/drivers/gpu/drm/i915/i915_reg.h
>> @@ -2214,29 +2214,6 @@
>>  #define SWF3(dev_priv, i)	_MMIO(DISPLAY_MMIO_BASE(dev_priv) + 0x72414 +=
 (i) * 4)
>>  #define SWF_ILK(i)	_MMIO(0x4F000 + (i) * 4)
>>=20=20
>> -/* Pipe B */
>> -#define _PIPEBDSL		(DISPLAY_MMIO_BASE(dev_priv) + 0x71000)
>> -#define _TRANSBCONF		(DISPLAY_MMIO_BASE(dev_priv) + 0x71008)
>> -#define _PIPEBSTAT		(DISPLAY_MMIO_BASE(dev_priv) + 0x71024)
>> -#define _PIPEBFRAMEHIGH		0x71040
>> -#define _PIPEBFRAMEPIXEL	0x71044
>> -#define _PIPEB_FRMCOUNT_G4X	(DISPLAY_MMIO_BASE(dev_priv) + 0x71040)
>> -#define _PIPEB_FLIPCOUNT_G4X	(DISPLAY_MMIO_BASE(dev_priv) + 0x71044)
>> -
>
> All the _ stuff should go for sure.
>
>> -
>> -/* Display B control */
>> -#define _DSPBCNTR		(DISPLAY_MMIO_BASE(dev_priv) + 0x71180)
>> -#define   DISP_ALPHA_TRANS_ENABLE	REG_BIT(15)
>
> Unlikely we'll ever use this, but if desired we could relocate
> this next to all the other DSPCNTR bits. With perhaps a note that
> it only applies to plane B.

Huh. I can't actually find a platform where bit 15 would be "alpha trans
enable". It's either 180 degree rotation or decompression of compressed
surfaces.

>> -#define   DISP_SPRITE_ABOVE_OVERLAY	REG_BIT(0)
>
> This too could be relocated, with a note that it only applies to plane
> B/C. Though as far as plane Z order goes I think there's at least one
> more bit for that we've not even defined, so this isn't super useful
> as is.

And here it's either reserved or relocated rotation in bits 0-1.

What am I missing?

BR,
Jani.


>
>> -#define _DSPBADDR		(DISPLAY_MMIO_BASE(dev_priv) + 0x71184)
>> -#define _DSPBSTRIDE		(DISPLAY_MMIO_BASE(dev_priv) + 0x71188)
>> -#define _DSPBPOS		(DISPLAY_MMIO_BASE(dev_priv) + 0x7118C)
>> -#define _DSPBSIZE		(DISPLAY_MMIO_BASE(dev_priv) + 0x71190)
>> -#define _DSPBSURF		(DISPLAY_MMIO_BASE(dev_priv) + 0x7119C)
>> -#define _DSPBTILEOFF		(DISPLAY_MMIO_BASE(dev_priv) + 0x711A4)
>> -#define _DSPBOFFSET		(DISPLAY_MMIO_BASE(dev_priv) + 0x711A4)
>> -#define _DSPBSURFLIVE		(DISPLAY_MMIO_BASE(dev_priv) + 0x711AC)
>> -
>>  /* ICL DSI 0 and 1 */
>>  #define _PIPEDSI0CONF		0x7b008
>>  #define _PIPEDSI1CONF		0x7b808
>> --=20
>> 2.39.2

--=20
Jani Nikula, Intel
