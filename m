Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9AF5327734
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  1 Mar 2021 06:46:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 210C76E4DE;
	Mon,  1 Mar 2021 05:46:43 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 768F26E4DE
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  1 Mar 2021 05:46:42 +0000 (UTC)
IronPort-SDR: w1mBDH/VqAeHOw7GmngOHGr+7c3BMaBxQtcgmkQwxLrB5MstQiPfv3UrHVjCNmlVxhiF9fjSFF
 GOfMvtwPbmQg==
X-IronPort-AV: E=McAfee;i="6000,8403,9909"; a="250417615"
X-IronPort-AV: E=Sophos;i="5.81,214,1610438400"; 
 d="asc'?scan'208";a="250417615"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2021 21:46:41 -0800
IronPort-SDR: SI4kdU+LD+FciDChl9G8LxFSnejDoKa7s+uONm8Py2Gt6EjTWbIhymKcZhRj2utlOqmR2xsfX2
 rOHdw8MWAZsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,214,1610438400"; 
 d="asc'?scan'208";a="426813076"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by fmsmga004.fm.intel.com with ESMTP; 28 Feb 2021 21:46:40 -0800
Date: Mon, 1 Mar 2021 13:30:30 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Colin Xu <colin.xu@intel.com>
Subject: Re: [PATCH v2 0/2] drm/i915/gvt: Refactor to per-vGPU accurate
 vblank emulator
Message-ID: <20210301053030.GS1551@zhen-hp.sh.intel.com>
References: <20210226044523.282950-1-colin.xu@intel.com>
MIME-Version: 1.0
In-Reply-To: <20210226044523.282950-1-colin.xu@intel.com>
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
Cc: intel-gvt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0301646572=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0301646572==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3Gf/FFewwPeBMqCJ"
Content-Disposition: inline


--3Gf/FFewwPeBMqCJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2021.02.26 12:45:23 +0800, Colin Xu wrote:
> The patch set includes two patches:
> Patch 1/2: Get accurate vGPU virtual display refresh rate from vreg
> Patch 2/2: Use per-vGPU vblank emulator at dynamic & accurate refresh rat=
e.
>=20
> The patch set resovles below issues:
> - 16ms matches the refresh rate at 62.5Hz (instead of 60Hz) which isn't
>   belong to standard timing. This leads to some frame drop or glitch issue
>   during video playback. Since SW expect at least 16.667ms period for 60Hz
>   or may need higher resolution, however vblank emulator only works at 16.
> - Doesn't respect the fact that with current virtual EDID timing set,
>   not all resolutions are enabled at 60Hz. For example, current virtual
>   EDID actually supports refresh rate like 56Hz, 59.97Hz, 60Hz, 75Hz, etc.
> - Current vblank emulator use single hrtimer for all vGPUs. Regardsless
>   how guest changing the resolution, all vsync interrupts are injected at
>   16ms interval.
>=20
> With the patch set, the actual refresh rate from guest can now always
> match guest OS resolution settings.
> To run quick test, launch a web browser and goto URL: www.displayhz.com
>=20
> V2:
> Rebase to 5.11.
> Correctly calculate DP link rate for BDW and BXT.
> Simplify logic.
> Typo fix.
>=20
> Colin Xu (2):
>   drm/i915/gvt: Get accurate vGPU virtual display refresh rate from vreg
>   drm/i915/gvt: Refactor GVT vblank emulator for vGPU virtual display
>=20
>  drivers/gpu/drm/i915/gvt/display.c   | 107 ++++++-----
>  drivers/gpu/drm/i915/gvt/display.h   |  14 +-
>  drivers/gpu/drm/i915/gvt/gvt.c       |  25 ++-
>  drivers/gpu/drm/i915/gvt/gvt.h       |  13 +-
>  drivers/gpu/drm/i915/gvt/handlers.c  | 261 ++++++++++++++++++++++++++-
>  drivers/gpu/drm/i915/gvt/interrupt.c |  37 ----
>  drivers/gpu/drm/i915/gvt/interrupt.h |   7 -
>  drivers/gpu/drm/i915/gvt/vgpu.c      |   2 -
>  8 files changed, 353 insertions(+), 113 deletions(-)
>=20

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

Thanks!

--3Gf/FFewwPeBMqCJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCYDx78QAKCRCxBBozTXgY
J0dcAKCNON+6GYxFNEsGGgVEBPAbMWo7YgCcD7wpWzPdMmTFBF5AaYvGQ6eEse4=
=T0DO
-----END PGP SIGNATURE-----

--3Gf/FFewwPeBMqCJ--

--===============0301646572==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0301646572==--
