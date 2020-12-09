Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E62832D3C81
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  9 Dec 2020 08:52:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A6916E12B;
	Wed,  9 Dec 2020 07:52:15 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86F876E128;
 Wed,  9 Dec 2020 07:52:14 +0000 (UTC)
IronPort-SDR: x+PeLQ9xeyrB+xxL5W+S7I+SLWHOkthHpeiec957wFml3bJLBCoXS/kVVSl57y5oD3vZoNOkpB
 uqNh+JXnSszg==
X-IronPort-AV: E=McAfee;i="6000,8403,9829"; a="161087382"
X-IronPort-AV: E=Sophos;i="5.78,404,1599548400"; 
 d="asc'?scan'208";a="161087382"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 23:52:13 -0800
IronPort-SDR: 1uqYvliSGq6xaVhyp5z797fQLBmeMuZ4ZCSoWuVqLMvW2j/4Lv1tKfb8Vw7OZfkio6WFzaYTpc
 7IDFNAdJj1rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,404,1599548400"; 
 d="asc'?scan'208";a="376249313"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Dec 2020 23:52:12 -0800
Date: Wed, 9 Dec 2020 15:36:53 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [Intel-gfx] [PATCH 0/8] drm/i915/gvt: make headers self-contained
Message-ID: <20201209073653.GL16939@zhen-hp.sh.intel.com>
References: <cover.1607422863.git.jani.nikula@intel.com>
MIME-Version: 1.0
In-Reply-To: <cover.1607422863.git.jani.nikula@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1734482790=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1734482790==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="l2C7pJE7HE4aLL3l"
Content-Disposition: inline


--l2C7pJE7HE4aLL3l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.12.08 12:29:06 +0200, Jani Nikula wrote:
> For a long time now we've had a build option in i915 to ensure the
> headers in the driver are self-contained, i.e. they include and forward
> declare everything they need. Finally fix the gvt headers that aren't,
> and remove them from the exclude list.
>=20
> Please use the CONFIG_DRM_I915_WERROR=3Dy config option to ensure the
> driver remains warning free and headers stay self-contained.
>=20
> Please merge this via the gvt tree.
>=20

Thanks, Jani! Looks fine to me.

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

>=20
>=20
> Jani Nikula (8):
>   drm/i915/gvt: make execlist.h self-contained
>   drm/i915/gvt: make fb_decoder.h self-contained
>   drm/i915/gvt: make gtt.h self-contained
>   drm/i915/gvt: make interrupt.h self-contained
>   drm/i915/gvt: make mmio_context.h self-contained
>   drm/i915/gvt: make gvt.h self-contained
>   drm/i915/gvt: make scheduler.h self-contained
>   drm/i915/gvt: make mpt.h self-contained
>=20
>  drivers/gpu/drm/i915/Makefile           | 10 +---------
>  drivers/gpu/drm/i915/gvt/execlist.h     |  3 ---
>  drivers/gpu/drm/i915/gvt/fb_decoder.h   |  6 ++++--
>  drivers/gpu/drm/i915/gvt/gtt.h          | 11 ++++++++++-
>  drivers/gpu/drm/i915/gvt/gvt.h          |  4 ++++
>  drivers/gpu/drm/i915/gvt/interrupt.h    |  5 ++++-
>  drivers/gpu/drm/i915/gvt/mmio_context.h | 11 +++++++++++
>  drivers/gpu/drm/i915/gvt/mpt.h          |  2 ++
>  drivers/gpu/drm/i915/gvt/scheduler.h    |  5 +++++
>  9 files changed, 41 insertions(+), 16 deletions(-)
>=20
> --=20
> 2.20.1
>=20
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

--=20

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--l2C7pJE7HE4aLL3l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCX9B+kAAKCRCxBBozTXgY
J2pYAJ44rA4h9xu8bXNDKDZ+KDNhV2GhUACfWY/ChVpwb22IIZgGb5tHqURRMJA=
=zqZu
-----END PGP SIGNATURE-----

--l2C7pJE7HE4aLL3l--

--===============1734482790==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============1734482790==--
