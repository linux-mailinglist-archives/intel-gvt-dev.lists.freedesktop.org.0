Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEC5A6DA82
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 24 Mar 2025 13:56:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11FD910E2FC;
	Mon, 24 Mar 2025 12:56:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RZPwQE7h";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B07D410E300;
 Mon, 24 Mar 2025 12:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742821004; x=1774357004;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=Yw8mKDKj4A5P3nno8n0/AvNsmNsgLb9K768q7zqzFrw=;
 b=RZPwQE7hhW8d9ZXfYqEJenbqekR+Elw0Y8/nByB1PEg3lrjPhPNTJmTU
 xerx9pz/B5rsAp2Yt3wNZ2XelSf537qIbQj1W5hAXfu7BpccPVXh+/fxy
 ZmksXXlr4pYnRSketbpfvjaXIlgZ81h8UZzT152BwqH4AZKvLxwMSrZfu
 Zm+OEd5T+8Qx4T9n37KFl4M9i3sGvUXBjOZIwjlv9B3m6OagRLbRmfiKj
 Shy9K6IH0u0zxNYVPEiB7SKxWMIdJwaRApFjTqV/0FFKQJKxOt1PKFiGY
 jB6Q3HSF8ZhoVMW7MW3YrRiC7bcADXRrjc2XHACB1+wl4sxjUPZsiy+oh A==;
X-CSE-ConnectionGUID: HEKigRmiQzGJBC3MNHyglA==
X-CSE-MsgGUID: 4yq/WqSHRXeGBkran+xZhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="47897238"
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="47897238"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 05:56:42 -0700
X-CSE-ConnectionGUID: MEoT5RkMRFiEdaKjS/hAkg==
X-CSE-MsgGUID: PIRSDpiYSi2Ywp9dx8LvHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="128732811"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.30])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 05:56:38 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Nicolas Chauvet <kwizart@gmail.com>
Cc: Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang
 <zhi.wang.linux@gmail.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 stable@vger.kernel.org, Kees Cook <kees@kernel.org>
Subject: Re: [PATCH 2/3] [RFC] drm/i915/gvt: Fix opregion_header->signature
 size
In-Reply-To: <CABr+WTmQ3rZ-UZH2Wv0R6qKegyjCovn3R7PWBeWiciAj+NbtnQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250324083755.12489-1-kwizart@gmail.com>
 <20250324083755.12489-3-kwizart@gmail.com> <87pli6bwxi.fsf@intel.com>
 <87h63ibwma.fsf@intel.com>
 <CABr+WTmQ3rZ-UZH2Wv0R6qKegyjCovn3R7PWBeWiciAj+NbtnQ@mail.gmail.com>
Date: Mon, 24 Mar 2025 14:56:35 +0200
Message-ID: <87msdaa8os.fsf@intel.com>
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

On Mon, 24 Mar 2025, Nicolas Chauvet <kwizart@gmail.com> wrote:
> Le lun. 24 mars 2025 =C3=A0 10:34, Jani Nikula
> <jani.nikula@linux.intel.com> a =C3=A9crit :
>>
>> On Mon, 24 Mar 2025, Jani Nikula <jani.nikula@linux.intel.com> wrote:
>> > On Mon, 24 Mar 2025, Nicolas Chauvet <kwizart@gmail.com> wrote:
>> >> Enlarge the signature field to accept the string termination.
>> >>
>> >> Cc: stable@vger.kernel.org
>> >> Fixes: 93615d59912 ("Revert drm/i915/gvt: Fix out-of-bounds buffer wr=
ite into opregion->signature[]")
>> >> Signed-off-by: Nicolas Chauvet <kwizart@gmail.com>
>> >
>> > Nope, can't do that. The packed struct is used for parsing data in
>> > memory.
>>
>> Okay, so I mixed this up with display/intel_opregion.c. So it's not used
>> for parsing here... but it's used for generating the data in memory, and
>> we can't change the layout or contents.
>>
>> Regardless, we can't do either patch 2 or patch 3.
>
> Thanks for review.
> So does it means the only "Fix" is to drop Werror, at least for intel/gvt=
 code ?

Of course not. The fix is to address the warning.

There's another thread about this, see my suggestion there [1].

BR,
Jani.


[1] https://lore.kernel.org/r/87r02ma8s3.fsf@intel.com


> I have CONFIG_DRM_I915_WERROR not set but CONFIG_DRM_WERROR=3Dy, (same as=
 Fedora)
> Unsure why the current Fedora kernel is unaffected by this build failure.

--=20
Jani Nikula, Intel
