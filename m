Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60561195223
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 27 Mar 2020 08:37:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18EB16E9BA;
	Fri, 27 Mar 2020 07:37:47 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89B746E9BD
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 27 Mar 2020 07:37:45 +0000 (UTC)
IronPort-SDR: yvfXIrgdISSV1QVm8LVLWlM8Khu5kKvtigwieAI+ZxVfwBVZYjBlenuf76ViQfp8H1cW7Vc58r
 Y+NhMZCoefrg==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2020 00:37:44 -0700
IronPort-SDR: l7cKWl8cmmuerxOG3ogfi2OUZCQGSnosI/xqeE7FwJ+FbJ0wYuRg7KZn4EDyzN1F+oXTtxRWPR
 z/hHx4Eg0yTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,311,1580803200"; 
 d="asc'?scan'208";a="421007912"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by orsmga005.jf.intel.com with ESMTP; 27 Mar 2020 00:37:43 -0700
Date: Fri, 27 Mar 2020 15:24:41 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Tina Zhang <tina.zhang@intel.com>
Subject: Re: [PATCH] drm/i915/gvt: Fix klocwork issues about data size
Message-ID: <20200327072441.GI8880@zhen-hp.sh.intel.com>
References: <20200324123021.15831-1-tina.zhang@intel.com>
MIME-Version: 1.0
In-Reply-To: <20200324123021.15831-1-tina.zhang@intel.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
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
Content-Type: multipart/mixed; boundary="===============1714331669=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1714331669==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zDL9gdIhmXu2QQXr"
Content-Disposition: inline


--zDL9gdIhmXu2QQXr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.03.24 20:30:21 +0800, Tina Zhang wrote:
> Add llu suffix and cast operator to fix the klocwork warning about
> "Operands in a bitwise operation have different size"
>=20
> Signed-off-by: Tina Zhang <tina.zhang@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/scheduler.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c b/drivers/gpu/drm/i915/=
gvt/scheduler.c
> index 8436984cd1f6..4e11cfaf41f0 100644
> --- a/drivers/gpu/drm/i915/gvt/scheduler.c
> +++ b/drivers/gpu/drm/i915/gvt/scheduler.c
> @@ -304,8 +304,8 @@ shadow_context_descriptor_update(struct intel_context=
 *ce,
>  	 * Update bits 0-11 of the context descriptor which includes flags
>  	 * like GEN8_CTX_* cached in desc_template
>  	 */
> -	desc &=3D ~(0x3 << GEN8_CTX_ADDRESSING_MODE_SHIFT);
> -	desc |=3D workload->ctx_desc.addressing_mode <<
> +	desc &=3D ~(0x3ull << GEN8_CTX_ADDRESSING_MODE_SHIFT);
> +	desc |=3D (u64)workload->ctx_desc.addressing_mode <<
>  		GEN8_CTX_ADDRESSING_MODE_SHIFT;
> =20
>  	ce->lrc_desc =3D desc;
> --=20

Acked-by: Zhenyu Wang <zhenyuw@linux.intel.com>

Applied, thanks!

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--zDL9gdIhmXu2QQXr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXn2qOQAKCRCxBBozTXgY
J7NaAKCQfv7z2fDm6/DNX2w+rek2LHQpbQCgiQhZ/MUk2QOaN7uOnNPGb9LJRzw=
=b2Ug
-----END PGP SIGNATURE-----

--zDL9gdIhmXu2QQXr--

--===============1714331669==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============1714331669==--
