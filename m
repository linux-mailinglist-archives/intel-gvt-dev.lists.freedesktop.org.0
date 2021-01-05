Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8CB2EA650
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  5 Jan 2021 09:10:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A5816E048;
	Tue,  5 Jan 2021 08:10:48 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C40C6E041;
 Tue,  5 Jan 2021 08:10:46 +0000 (UTC)
IronPort-SDR: GuiEzIBE0lBwetfQACbZxTu7eypyJ0l/HSD2pqCfuGje3Pq9Y58vHARjLIOk0ohcYw+U0EGPus
 hN5eZaqYtYfw==
X-IronPort-AV: E=McAfee;i="6000,8403,9854"; a="174493419"
X-IronPort-AV: E=Sophos;i="5.78,476,1599548400"; 
 d="asc'?scan'208";a="174493419"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2021 00:10:46 -0800
IronPort-SDR: wdvXe6lE/uPY1pS3IV7tXH25EmkkHBaCKTQwKJ8qaFurzaoTG6s4UOoLcSDdp2WWy4Gz6NCHdt
 2uymNgmFQZ+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,476,1599548400"; 
 d="asc'?scan'208";a="395187541"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by fmsmga004.fm.intel.com with ESMTP; 05 Jan 2021 00:10:44 -0800
Date: Tue, 5 Jan 2021 15:54:24 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Re: [Intel-gfx] [PULL] gvt-next-fixes
Message-ID: <20210105075424.GV16939@zhen-hp.sh.intel.com>
References: <20201225022009.GF16939@zhen-hp.sh.intel.com>
MIME-Version: 1.0
In-Reply-To: <20201225022009.GF16939@zhen-hp.sh.intel.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>, "Yuan,
 Hang" <hang.yuan@intel.com>,
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>, "Lv,
 Zhiyuan" <zhiyuan.lv@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Content-Type: multipart/mixed; boundary="===============1981617133=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1981617133==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="g9DrFxK9lbE4xtT+"
Content-Disposition: inline


--g9DrFxK9lbE4xtT+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Ping...

On 2020.12.25 10:20:09 +0800, Zhenyu Wang wrote:
>=20
> Hi,
>=20
> Here's queued fixes from Jani for one useless inline and fix
> CONFIG_DRM_I915_WERROR for gvt headers.
>=20
> Thanks and Merry Christmas!
> --
> The following changes since commit 9a3a238b3de97b4210c6de66aa88b2d7021ac0=
86:
>=20
>   drm/i915/gvt: treat intel_gvt_mpt as const in gvt code (2020-11-23 17:1=
4:20 +0800)
>=20
> are available in the Git repository at:
>=20
>   https://github.com/intel/gvt-linux tags/gvt-next-fixes-2020-12-25
>=20
> for you to fetch changes up to e056f669dbf76b8752b6cb0b8edd2f75cbdcabb1:
>=20
>   drm/i915/gvt: make mpt.h self-contained (2020-12-22 11:41:35 +0800)
>=20
> ----------------------------------------------------------------
> gvt-next-fixes-2020-12-25
>=20
> - Avoid one useless inline (Jani)
> - make gvt header self-contained, fix CONFIG_DRM_I915_WERROR (Jani)
>=20
> ----------------------------------------------------------------
> Jani Nikula (9):
>       drm/i915/gvt: avoid useless use of inline
>       drm/i915/gvt: make execlist.h self-contained
>       drm/i915/gvt: make fb_decoder.h self-contained
>       drm/i915/gvt: make gtt.h self-contained
>       drm/i915/gvt: make interrupt.h self-contained
>       drm/i915/gvt: make mmio_context.h self-contained
>       drm/i915/gvt: make gvt.h self-contained
>       drm/i915/gvt: make scheduler.h self-contained
>       drm/i915/gvt: make mpt.h self-contained
>=20
>  drivers/gpu/drm/i915/Makefile           | 10 +---------
>  drivers/gpu/drm/i915/gvt/execlist.h     |  3 ---
>  drivers/gpu/drm/i915/gvt/fb_decoder.h   |  6 ++++--
>  drivers/gpu/drm/i915/gvt/gtt.h          | 11 ++++++++++-
>  drivers/gpu/drm/i915/gvt/gvt.h          |  4 ++++
>  drivers/gpu/drm/i915/gvt/handlers.c     |  3 +--
>  drivers/gpu/drm/i915/gvt/interrupt.h    |  5 ++++-
>  drivers/gpu/drm/i915/gvt/mmio_context.h | 11 +++++++++++
>  drivers/gpu/drm/i915/gvt/mpt.h          |  2 ++
>  drivers/gpu/drm/i915/gvt/scheduler.h    |  5 +++++
>  10 files changed, 42 insertions(+), 18 deletions(-)
>=20
> --=20
>=20
> $gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827



> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx


--=20

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--g9DrFxK9lbE4xtT+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCX/QbLAAKCRCxBBozTXgY
J9kbAKCJT3dIrY84DoY9caB5I0eeaQnNrgCgh3gxcXWG19T4EvmE8948BjGgOqY=
=pxZe
-----END PGP SIGNATURE-----

--g9DrFxK9lbE4xtT+--

--===============1981617133==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============1981617133==--
