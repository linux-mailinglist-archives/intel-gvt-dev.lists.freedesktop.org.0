Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D6CA6D785
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 24 Mar 2025 10:34:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4178710E284;
	Mon, 24 Mar 2025 09:34:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="huNX8NvZ";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7402F10E27E;
 Mon, 24 Mar 2025 09:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742808869; x=1774344869;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=r1dQEktHFkwsHLZgPuYKuaEXWfGQeaDIxWwGvGdmQco=;
 b=huNX8NvZitAUg3uk8AYN/GPhWR/6+l/AASX+TS7fibuNVoFJ5OeMIkW6
 BlWesm2ZWmxpEERpNWdB/r7mhbdOiFTOStoB9LWqxEN2/0LzxXVz4EI98
 B1PNQ+3Vfm1u9C14tjHZGKiDgCePjPlSOdJK/xxFKTZtxePzCGk/t/pzi
 BLt9IM8T8TqJCuvBfE080ERGuSO53+gOWt+Ski6DJ1lok+aSMO3PmQoJW
 hvi/ek43UIqJMG8tXVNIR6Kmj08pVff251KmSa+9UdkWwZ7suvM3s5IxV
 0xh2EDC7uzIv7Dkq+F6sgRrjaxCta9tj++wjwipugcIGQx97ZCByWMA3Q g==;
X-CSE-ConnectionGUID: CgE5QMpjSmWv/aIj6et0uA==
X-CSE-MsgGUID: Lr1Z9HQpSHmBxZVT8etHlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11382"; a="55002550"
X-IronPort-AV: E=Sophos;i="6.14,271,1736841600"; d="scan'208";a="55002550"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 02:34:28 -0700
X-CSE-ConnectionGUID: okwWYH7EQAy7N3jMonWbgw==
X-CSE-MsgGUID: /24OaiqRQNiTHJ0ws0yTKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,271,1736841600"; d="scan'208";a="129070606"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.30])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 02:34:25 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Nicolas Chauvet <kwizart@gmail.com>, Zhenyu Wang
 <zhenyuw@linux.intel.com>, Zhi Wang <zhi.wang.linux@gmail.com>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>
Cc: intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Nicolas Chauvet <kwizart@gmail.com>, stable@vger.kernel.org
Subject: Re: [PATCH 2/3] [RFC] drm/i915/gvt: Fix opregion_header->signature
 size
In-Reply-To: <87pli6bwxi.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250324083755.12489-1-kwizart@gmail.com>
 <20250324083755.12489-3-kwizart@gmail.com> <87pli6bwxi.fsf@intel.com>
Date: Mon, 24 Mar 2025 11:34:21 +0200
Message-ID: <87h63ibwma.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Mon, 24 Mar 2025, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Mon, 24 Mar 2025, Nicolas Chauvet <kwizart@gmail.com> wrote:
>> Enlarge the signature field to accept the string termination.
>>
>> Cc: stable@vger.kernel.org
>> Fixes: 93615d59912 ("Revert drm/i915/gvt: Fix out-of-bounds buffer write into opregion->signature[]")
>> Signed-off-by: Nicolas Chauvet <kwizart@gmail.com>
>
> Nope, can't do that. The packed struct is used for parsing data in
> memory.

Okay, so I mixed this up with display/intel_opregion.c. So it's not used
for parsing here... but it's used for generating the data in memory, and
we can't change the layout or contents.

Regardless, we can't do either patch 2 or patch 3.

BR,
Jani.


>
> BR,
> Jani.
>
>
>> ---
>>  drivers/gpu/drm/i915/gvt/opregion.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gvt/opregion.c b/drivers/gpu/drm/i915/gvt/opregion.c
>> index 9a8ead6039e2..0f11cd6ba383 100644
>> --- a/drivers/gpu/drm/i915/gvt/opregion.c
>> +++ b/drivers/gpu/drm/i915/gvt/opregion.c
>> @@ -43,7 +43,7 @@
>>  #define DEVICE_TYPE_EFP4   0x10
>>  
>>  struct opregion_header {
>> -	u8 signature[16];
>> +	u8 signature[32];
>>  	u32 size;
>>  	u32 opregion_ver;
>>  	u8 bios_ver[32];

-- 
Jani Nikula, Intel
