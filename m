Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6ECC900354
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  7 Jun 2024 14:21:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C223310E00A;
	Fri,  7 Jun 2024 12:21:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Arq6tinB";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4E6D10E00A;
 Fri,  7 Jun 2024 12:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717762887; x=1749298887;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=RksYlvdpBsIdfUmwECGneXIj7y29D14ypOhwtpBtbLs=;
 b=Arq6tinB97UO4codgezIcB5YkBS9s+caKkZKHrHn8j7mMipqyWRplyb1
 W/n5OFfKcTFsjGux7JMUHCDZ9Z3fhW2sTJ73YeDy3e6eK9liN7erckG6w
 FbaRQ+wuXNiUt+ndVuiA6QKy/z+/KiYlj3KfHIapLHsA1+j+qE5cstJCs
 9p0IuOsJDsnPIRKU1/WjmHp9R5EsTuetUOVg1GxkaBjW0N7kj3w7vyDCb
 spwPaF90aFz9C+xlb7VjRTeR7hMiDnLrhkQ1530A98P1L6cJCQJnWPKk5
 9EGDEB0rJCfAbpckwqvGCehPE/3nXSLmMIG/HYA7oN6l6xlxXEcr9kZmU g==;
X-CSE-ConnectionGUID: j7DgizVPQDm/ePFEptEjhw==
X-CSE-MsgGUID: tBrp+CwoQCeP3EKs1pN/bw==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14598390"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="14598390"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 05:21:27 -0700
X-CSE-ConnectionGUID: DFAWEUrgRym5ORE9K8ryWA==
X-CSE-MsgGUID: UkHtwxhDRtqsbCT4w3uiRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="75789617"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.72])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 05:21:25 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 rodrigo.vivi@intel.com
Subject: Re: [PATCH 6/6] drm/i915: remove unused HSW_STEREO_3D_CTL register
 macros
In-Reply-To: <ZmLwmxPly3lKZRhp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1717757337.git.jani.nikula@intel.com>
 <991806d10ff182220c0b2f4681ee5a76a1b3ef8b.1717757337.git.jani.nikula@intel.com>
 <ZmLwmxPly3lKZRhp@intel.com>
Date: Fri, 07 Jun 2024 15:21:22 +0300
Message-ID: <87r0d9kkot.fsf@intel.com>
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
> On Fri, Jun 07, 2024 at 01:51:29PM +0300, Jani Nikula wrote:
>> Remove the unused HSW_STEREO_3D_CTL register macros.
>
> I don't enjoy having to trawl the specs to find registers.
> So I prefer to keep everything that isn't actually wrong.

Shall I apply this [1] then?

BR,
Jani.


[1] https://lore.kernel.org/r/76f980f5ed3638746c6b58dec7d0bd8c43a37987.1717=
514638.git.jani.nikula@intel.com


>
>>=20
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  drivers/gpu/drm/i915/i915_reg.h | 6 ------
>>  1 file changed, 6 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915=
_reg.h
>> index 2d834c32a3fa..127b113189ef 100644
>> --- a/drivers/gpu/drm/i915/i915_reg.h
>> +++ b/drivers/gpu/drm/i915/i915_reg.h
>> @@ -3385,12 +3385,6 @@
>>  #define ADL_TVIDEO_DIP_AS_SDP_DATA(dev_priv, trans, i)	_MMIO_TRANS2(dev=
_priv, trans,\
>>  							     _ADL_VIDEO_DIP_AS_DATA_A + (i) * 4)
>>=20=20
>> -#define _HSW_STEREO_3D_CTL_A		0x70020
>> -#define   S3D_ENABLE			(1 << 31)
>> -#define _HSW_STEREO_3D_CTL_B		0x71020
>> -
>> -#define HSW_STEREO_3D_CTL(trans)	_MMIO_PIPE2(dev_priv, trans, _HSW_STER=
EO_3D_CTL_A)
>> -
>>  #define _PCH_TRANS_HTOTAL_B          0xe1000
>>  #define _PCH_TRANS_HBLANK_B          0xe1004
>>  #define _PCH_TRANS_HSYNC_B           0xe1008
>> --=20
>> 2.39.2

--=20
Jani Nikula, Intel
