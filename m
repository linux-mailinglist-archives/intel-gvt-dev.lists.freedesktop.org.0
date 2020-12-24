Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACA42E23AA
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 24 Dec 2020 03:28:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7ACC89EA6;
	Thu, 24 Dec 2020 02:28:23 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 758A889EA6
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 24 Dec 2020 02:28:22 +0000 (UTC)
IronPort-SDR: GG52QudN7b0Had8ZAgQZ1DhUujlCApj3fZNHxaqNA5tNEty54Yl83AKoGjVE8ExXG0kWC7QDks
 gLDnZhSmw6hw==
X-IronPort-AV: E=McAfee;i="6000,8403,9844"; a="237657470"
X-IronPort-AV: E=Sophos;i="5.78,443,1599548400"; 
 d="asc'?scan'208";a="237657470"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2020 18:28:21 -0800
IronPort-SDR: nhU/vpqr3RZuTokNgjX7h4bypeVO9eyY3wU6zZMXOyWDjb6tviptvKqxyaRpLMxVYbc3rzBw1a
 mp8SWl1qH6Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,443,1599548400"; 
 d="asc'?scan'208";a="393601878"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by fmsmga002.fm.intel.com with ESMTP; 23 Dec 2020 18:28:20 -0800
Date: Thu, 24 Dec 2020 10:12:27 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Subject: Re: [PATCH v5 00/11] cmd scanning optimization
Message-ID: <20201224021227.GC16939@zhen-hp.sh.intel.com>
References: <20201223034353.16882-1-yan.y.zhao@intel.com>
MIME-Version: 1.0
In-Reply-To: <20201223034353.16882-1-yan.y.zhao@intel.com>
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
Content-Type: multipart/mixed; boundary="===============0764692806=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0764692806==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="szlDyXxWT551m6yh"
Content-Disposition: inline


--szlDyXxWT551m6yh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.12.23 11:43:53 +0800, Yan Zhao wrote:
> hi
> This is a series that optimizes current command scanning logic.
>=20
> Patch 1 scans a init context to parse hardware context and set
> mmio cmd accessible flag accordingly.
>=20
> Patch 2 scans workload context pages.
>=20
> Patches 3-5 add extra commands scan policy for "srm", "lrm", "lrr".
>             "pipe-ctrl" is a TODO to be completed in future.
>=20
> patch 6 exports a find_mmio_info interface to be used in patch 10 and
>         patch 11
>=20
> patch 7 extends mmio_attribute from 8 bits to 16 bits as we have been
>         running out of bits for mmio flags.
>=20
> Patches 8-10 introduce a new mmio flag F_CMD_WRITE_PATCH and init this
>             flag in static handlers array and dynamically during parsing
>             init ctx.
>=20
> Patch 11 unifies lri command handler with MMIO handler
>

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

>=20
> changelogs:
> v5:
> - rebased to gvt-staging-2020y-12m-22d-13h-12m-37s
> =20
> v4:
> - fixed the error path handling in patch 1 that may leak context unpin
> (zhenyu)
>=20
> v3:
> - updated patch 7 to extend mmio_attribute to 16 bits instead of 32 bits.
>=20
> v2:
> - combined serial smaller loops into one big loop in
>   intel_gvt_update_reg_whitelist() in patch 1 (zhenyu)
> - updated comment style for "pipe_ctrl" and add description for TODO
>   item. (zhenyu)
> - changed intel_gvt_mmio_set_cmd_fix_write() and
>   intel_gvt_mmio_is_cmd_fix_write() to intel_gvt_mmio_set_cmd_write_patch=
()
>   and intel_gvt_mmio_is_cmd_write_patch() in order to align with mmio flag
>   name. (zhenyu)
> - added patch 7 to exend mmio_attribute in order to hold more mmio
>   flags. (zhenyu)
>=20
> Yan Zhao (11):
>   drm/i915/gvt: parse init context to update cmd accessible reg
>     whitelist
>   drm/i915/gvt: scan VM ctx pages
>   drm/i915/gvt: filter cmds "srm" and "lrm" in cmd_handler
>   drm/i915/gvt: filter cmds "lrr-src" and "lrr-dst" in cmd_handler
>   drm/i915/gvt: filter cmd "pipe-ctrl" in cmd_handler
>   drm/i915/gvt: export find_mmio_info
>   drm/i915/gvt: make width of mmio_attribute bigger
>   drm/i915/gvt: introduce a new flag F_CMD_WRITE_PATCH
>   drm/i915/gvt: statically set F_CMD_WRITE_PATCH flag
>   drm/i915/gvt: update F_CMD_WRITE_PATCH flag when parsing init ctx
>   drm/i915/gvt: unify lri cmd handler and mmio handlers
>=20
>  drivers/gpu/drm/i915/gvt/cmd_parser.c | 335 ++++++++++++++++++++------
>  drivers/gpu/drm/i915/gvt/cmd_parser.h |   4 +
>  drivers/gpu/drm/i915/gvt/gvt.h        |  37 ++-
>  drivers/gpu/drm/i915/gvt/handlers.c   |  15 +-
>  drivers/gpu/drm/i915/gvt/mmio.h       |   3 +
>  drivers/gpu/drm/i915/gvt/reg.h        |   2 +
>  drivers/gpu/drm/i915/gvt/scheduler.c  |  22 +-
>  drivers/gpu/drm/i915/gvt/vgpu.c       |   4 +-
>  8 files changed, 339 insertions(+), 83 deletions(-)
>=20
> --=20
> 2.17.1
>=20

--=20

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--szlDyXxWT551m6yh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCX+P5BgAKCRCxBBozTXgY
J+YPAJ9rM7ACwKtPHlSAAXmdxNw2hFRbFACgkPsZU0qDzEbvCq0HafkmuTzJLXE=
=Um/I
-----END PGP SIGNATURE-----

--szlDyXxWT551m6yh--

--===============0764692806==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0764692806==--
