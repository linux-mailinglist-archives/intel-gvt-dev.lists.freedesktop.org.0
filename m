Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E39D5845A79
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  1 Feb 2024 15:44:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBA0D10E70B;
	Thu,  1 Feb 2024 14:44:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PaiibA03";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CF6E10E10E;
 Thu,  1 Feb 2024 14:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706798653; x=1738334653;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:from:to:cc:message-id:date;
 bh=kwkqjElahgLptw271BLWcXq1t2dP4CBdSW9XpPcO6Uo=;
 b=PaiibA03QzkH6IKu2PAoK/LYzeRCrBxKB/CbuEYmv6qUhVymJ7bcXvnW
 t7I6L8/Zmsdd/ziAKrJuoFNxcNq3GHtcGt5XJ4pAgTSitKQyUXq/wqnUQ
 v1TuisvzFlswlD0Lg/mH88OK+hu4L7LJ0zvkh4HTc/+oiVTZ8KQ5Un/aR
 hTSIqXKz4O929A63/fkSXOyLm2LkTCJGE2LvsQZmJHXTrAU64zzxVuwO1
 Noom/5/xrkpFO3cbXnN2wdgaDPT2ba6VjtgHgicDy9qXGYIrx5yKdRt5i
 F0HT/h2DEcSd1Nnx4YqgLgVEALnq/BSlAz5gjI2YyOxMu45pVQnhKtVwt A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="407625861"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="407625861"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 06:44:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="4402770"
Received: from unknown (HELO localhost) ([10.245.244.3])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 06:44:08 -0800
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ZboVK03/Eb/jt7wf@debian-scheme>
References: <ZboVK03/Eb/jt7wf@debian-scheme>
Subject: Re: [PULL] gvt-fixes
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>, zhi.wang.linux@gmail.com
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <170679864541.42939.1205060851730493621@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.8.1
Date: Thu, 01 Feb 2024 16:44:05 +0200
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

Hi Zhenyu,

I'm getting the following:

dim: ff833b32ccc4 ("drm/i915: Replace dead 01.org link"): mandatory review =
missing.
dim: ERROR: issues in commits detected, aborting

Can you fix the commit?

Regards, Joonas

Quoting Zhenyu Wang (2024-01-31 11:38:51)
>=20
> Hi, Joonas
>=20
> Here is another gvt-fixes pull which contains fixes on doc link and
> one uninitialized variable in warning message, also update about Zhi's
> new mail address in MAINTAINERS.
>=20
> Thanks.
> ---
> The following changes since commit f9f031dd21a7ce13a13862fa5281d32e1029c7=
0f:
>=20
>   drm/i915/psr: Only allow PSR in LPSP mode on HSW non-ULT (2024-01-25 10=
:44:13 +0200)
>=20
> are available in the Git repository at:
>=20
>   https://github.com/intel/gvt-linux tags/gvt-fixes-2024-01-31
>=20
> for you to fetch changes up to 88569fa2c3bc83d77a96580da94dd35edee0f893:
>=20
>   MAINTAINERS: Update Zhi Wang's email address (2024-01-31 17:19:15 +0800)
>=20
> ----------------------------------------------------------------
> gvt-fixes-2024-01-31
>=20
> - Fix broken gvt doc link (Zhenyu)
> - Fix one uninitialized variable bug in warning (Dan)
> - Update Zhi's new email address in MAINTAINERS file. (Zhi)
>=20
> ----------------------------------------------------------------
> Dan Carpenter (1):
>       drm/i915/gvt: Fix uninitialized variable in handle_mmio()
>=20
> Zhenyu Wang (1):
>       drm/i915: Replace dead 01.org link
>=20
> Zhi Wang (1):
>       MAINTAINERS: Update Zhi Wang's email address
>=20
>  MAINTAINERS                         | 4 ++--
>  drivers/gpu/drm/i915/Kconfig        | 2 +-
>  drivers/gpu/drm/i915/gvt/handlers.c | 3 +--
>  drivers/gpu/drm/i915/intel_gvt.c    | 2 +-
>  4 files changed, 5 insertions(+), 6 deletions(-)
