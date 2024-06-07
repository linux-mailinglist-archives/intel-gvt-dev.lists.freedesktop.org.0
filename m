Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 679D590084B
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  7 Jun 2024 17:09:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4456E10EC91;
	Fri,  7 Jun 2024 15:09:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JGjGlAKE";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4552710EC91;
 Fri,  7 Jun 2024 15:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717772989; x=1749308989;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=ZzH3X0tkjIeRGW6SpDyVs6lXLqG+m7UlGFt3DAygkOg=;
 b=JGjGlAKEsEFk645s103oOA2Q+2AYd99T7Xes7nFBVS8acutCm1HpJiYn
 bx1qXUEsaVEpemdYOv5WkuS+vtGnU/U9UxuFo7S8PtPxIuUbP6RTQssKX
 0P2fFtMOE1Ufs+7bDbg+WTf+1FNhSl5Uxb9U/dABOU2dQuggPLdmkFuGp
 fV6xFQEBMTar4f5o2jXIBYnKUp3dTxMIRJaBNk5ZnEsCJsGXAgedpd59F
 Uhn118GI3c638syAngC10Swu+ck+Gy7upxpGA+YCVVIxaUZeCj7wgTegQ
 J+p1DNiCXGX+jKo8+yzOe/E4bbDQT8U5LxT8SsJfwUCzide8v3pnYsHAW Q==;
X-CSE-ConnectionGUID: IAYEDaq/R3mCGGLrV4wmCQ==
X-CSE-MsgGUID: SllVTamcTpe7vt1NPAutYA==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="11965790"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="11965790"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 08:09:48 -0700
X-CSE-ConnectionGUID: 9JMUH1JdR9atzEQRUIOZEw==
X-CSE-MsgGUID: MKoLR/9tSHyhF+RKk2xItA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="69514194"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.72])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 08:09:47 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 rodrigo.vivi@intel.com
Subject: Re: [PATCH 6/6] drm/i915: remove unused HSW_STEREO_3D_CTL register
 macros
In-Reply-To: <ZmMOrVL9sxg5x6F9@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1717757337.git.jani.nikula@intel.com>
 <991806d10ff182220c0b2f4681ee5a76a1b3ef8b.1717757337.git.jani.nikula@intel.com>
 <ZmLwmxPly3lKZRhp@intel.com> <87r0d9kkot.fsf@intel.com>
 <ZmMOrVL9sxg5x6F9@intel.com>
Date: Fri, 07 Jun 2024 18:09:43 +0300
Message-ID: <87ikyklrgo.fsf@intel.com>
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
> On Fri, Jun 07, 2024 at 03:21:22PM +0300, Jani Nikula wrote:
>> On Fri, 07 Jun 2024, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.=
com> wrote:
>> > On Fri, Jun 07, 2024 at 01:51:29PM +0300, Jani Nikula wrote:
>> >> Remove the unused HSW_STEREO_3D_CTL register macros.
>> >
>> > I don't enjoy having to trawl the specs to find registers.
>> > So I prefer to keep everything that isn't actually wrong.
>>=20
>> Shall I apply this [1] then?
>
> Works for me.

Thanks, pushed that one to din.

BR,
Jani.

>
>>=20
>> BR,
>> Jani.
>>=20
>>=20
>> [1] https://lore.kernel.org/r/76f980f5ed3638746c6b58dec7d0bd8c43a37987.1=
717514638.git.jani.nikula@intel.com
>>=20
>>=20
>> >
>> >>=20
>> >> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> >> ---
>> >>  drivers/gpu/drm/i915/i915_reg.h | 6 ------
>> >>  1 file changed, 6 deletions(-)
>> >>=20
>> >> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i=
915_reg.h
>> >> index 2d834c32a3fa..127b113189ef 100644
>> >> --- a/drivers/gpu/drm/i915/i915_reg.h
>> >> +++ b/drivers/gpu/drm/i915/i915_reg.h
>> >> @@ -3385,12 +3385,6 @@
>> >>  #define ADL_TVIDEO_DIP_AS_SDP_DATA(dev_priv, trans, i)	_MMIO_TRANS2(=
dev_priv, trans,\
>> >>  							     _ADL_VIDEO_DIP_AS_DATA_A + (i) * 4)
>> >>=20=20
>> >> -#define _HSW_STEREO_3D_CTL_A		0x70020
>> >> -#define   S3D_ENABLE			(1 << 31)
>> >> -#define _HSW_STEREO_3D_CTL_B		0x71020
>> >> -
>> >> -#define HSW_STEREO_3D_CTL(trans)	_MMIO_PIPE2(dev_priv, trans, _HSW_S=
TEREO_3D_CTL_A)
>> >> -
>> >>  #define _PCH_TRANS_HTOTAL_B          0xe1000
>> >>  #define _PCH_TRANS_HBLANK_B          0xe1004
>> >>  #define _PCH_TRANS_HSYNC_B           0xe1008
>> >> --=20
>> >> 2.39.2
>>=20
>> --=20
>> Jani Nikula, Intel

--=20
Jani Nikula, Intel
