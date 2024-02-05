Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3518492BE
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  5 Feb 2024 04:20:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B08DF10F1BD;
	Mon,  5 Feb 2024 03:20:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c+z8W1OY";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDCD310F1BD;
 Mon,  5 Feb 2024 03:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707103220; x=1738639220;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=LnHwxn7ybecushgZynobgUCDKozvidjcdFTYFGxuKQI=;
 b=c+z8W1OYQAEKgKreGtwqZDZ3U6tXNXCYQPo4mEhFrZ9WFD53L3GSgdoZ
 UTFmKY/YOkcAam/vYQQe/OwdiL2xkh5zoHXRpcT4pGfYjC1tJ2y0ZvwYS
 xCZHn0vVUHrJEGbzs14PIUbeePkkE92nmwDCNkPnZVTjdwYqzirog/sUF
 ASk8eM/pdFW2wyDW9wYqpwG86/OEFSoG9MazrLApKxFd+8MOFEuG4clNP
 XkAv3UmbJVAYOQrYswd/tWfgQAZ4v4mLSrsfeGtuJMn+F6RpQmzWwwwQe
 Bd6wYheUZbj05a5hC3H6MNwWOk96aSYyO87N6tj7+jtz3A4QCj2QEq6Ml Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="4260454"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; d="asc'?scan'208";a="4260454"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2024 19:20:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="933032975"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
 d="asc'?scan'208";a="933032975"
Received: from debian-skl.sh.intel.com (HELO debian-skl) ([10.239.160.45])
 by fmsmga001.fm.intel.com with ESMTP; 04 Feb 2024 19:20:16 -0800
Date: Mon, 5 Feb 2024 11:21:18 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>,
 zhi.wang.linux@gmail.com
Subject: Re: [PULL] gvt-fixes
Message-ID: <ZcBULqJAL2CWJoHh@debian-scheme>
References: <ZboVK03/Eb/jt7wf@debian-scheme>
 <170679864541.42939.1205060851730493621@jlahtine-mobl.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="i4t0hrQN2UnHyzVl"
Content-Disposition: inline
In-Reply-To: <170679864541.42939.1205060851730493621@jlahtine-mobl.ger.corp.intel.com>
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
Reply-To: Zhenyu Wang <zhenyuw@linux.intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--i4t0hrQN2UnHyzVl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2024.02.01 16:44:05 +0200, Joonas Lahtinen wrote:
> Hi Zhenyu,
>=20
> I'm getting the following:
>=20
> dim: ff833b32ccc4 ("drm/i915: Replace dead 01.org link"): mandatory revie=
w missing.
> dim: ERROR: issues in commits detected, aborting
>=20
> Can you fix the commit?
>=20

Sorry, I missed to add review tag which had actually been done..
Here's the new generated one.

The following changes since commit f9f031dd21a7ce13a13862fa5281d32e1029c70f:

  drm/i915/psr: Only allow PSR in LPSP mode on HSW non-ULT (2024-01-25 10:4=
4:13 +0200)

are available in the Git repository at:

  https://github.com/intel/gvt-linux tags/gvt-fixes-2024-02-05

for you to fetch changes up to 44e4192f88978e32e4ac08b27141f3767366f79b:

  MAINTAINERS: Update Zhi Wang's email address (2024-02-05 11:16:26 +0800)

----------------------------------------------------------------
gvt-fixes-2024-02-05

- Fix broken gvt doc link (Zhenyu)
- Fix one uninitialized variable bug in warning (Dan)
- Update Zhi's new email address in MAINTAINERS file. (Zhi)

----------------------------------------------------------------
Dan Carpenter (1):
      drm/i915/gvt: Fix uninitialized variable in handle_mmio()

Zhenyu Wang (1):
      drm/i915: Replace dead 01.org link

Zhi Wang (1):
      MAINTAINERS: Update Zhi Wang's email address

 MAINTAINERS                         | 4 ++--
 drivers/gpu/drm/i915/Kconfig        | 2 +-
 drivers/gpu/drm/i915/gvt/handlers.c | 3 +--
 drivers/gpu/drm/i915/intel_gvt.c    | 2 +-
 4 files changed, 5 insertions(+), 6 deletions(-)

--i4t0hrQN2UnHyzVl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCZcBULgAKCRCxBBozTXgY
J+cWAJsHOXF4dBIG0eYPEkO1Gi/byWoNbgCfYJEXJKqriOAlWoqTRZL5mzEojQI=
=M00v
-----END PGP SIGNATURE-----

--i4t0hrQN2UnHyzVl--
