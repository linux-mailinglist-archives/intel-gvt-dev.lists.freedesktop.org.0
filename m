Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBF517B3B6
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  6 Mar 2020 02:24:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 017D96EC49;
	Fri,  6 Mar 2020 01:24:16 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0EB86EC49
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  6 Mar 2020 01:24:14 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Mar 2020 17:24:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,520,1574150400"; 
 d="asc'?scan'208";a="352623520"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by fmsmga001.fm.intel.com with ESMTP; 05 Mar 2020 17:24:12 -0800
Date: Fri, 6 Mar 2020 09:11:57 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Tina Zhang <tina.zhang@intel.com>
Subject: Re: [PATCH v2] drm/i915/gvt: Fix emulated vbt size issue
Message-ID: <20200306011157.GO28483@zhen-hp.sh.intel.com>
References: <20200305131600.29640-1-tina.zhang@intel.com>
MIME-Version: 1.0
In-Reply-To: <20200305131600.29640-1-tina.zhang@intel.com>
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
Content-Type: multipart/mixed; boundary="===============0118097203=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0118097203==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aYrjF+tKt+ApYAdb"
Content-Disposition: inline


--aYrjF+tKt+ApYAdb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.03.05 21:15:59 +0800, Tina Zhang wrote:
> The emulated vbt doesn't tell its size correctly. According to the
> intel_vbt_defs.h, vbt_header.vbt_size should the size of VBT (VBT Header,
> BDB Header and data blocks), and bdb_header.bdb_size should be the size
> of BDB (BDB Header and data blocks).
>=20
> This patch fixes the issue and lets vbt provided by GVT-g pass the guest
> i915's sanity test.
>=20
> v2: refine the commit message. (Zhenyu)
>=20
> Signed-off-by: Tina Zhang <tina.zhang@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/opregion.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/opregion.c b/drivers/gpu/drm/i915/g=
vt/opregion.c
> index 867e7629025b..33569b910ed5 100644
> --- a/drivers/gpu/drm/i915/gvt/opregion.c
> +++ b/drivers/gpu/drm/i915/gvt/opregion.c
> @@ -147,15 +147,14 @@ static void virt_vbt_generation(struct vbt *v)
>  	/* there's features depending on version! */
>  	v->header.version =3D 155;
>  	v->header.header_size =3D sizeof(v->header);
> -	v->header.vbt_size =3D sizeof(struct vbt) - sizeof(v->header);
> +	v->header.vbt_size =3D sizeof(struct vbt);
>  	v->header.bdb_offset =3D offsetof(struct vbt, bdb_header);
> =20
>  	strcpy(&v->bdb_header.signature[0], "BIOS_DATA_BLOCK");
>  	v->bdb_header.version =3D 186; /* child_dev_size =3D 33 */
>  	v->bdb_header.header_size =3D sizeof(v->bdb_header);
> =20
> -	v->bdb_header.bdb_size =3D sizeof(struct vbt) - sizeof(struct vbt_heade=
r)
> -		- sizeof(struct bdb_header);
> +	v->bdb_header.bdb_size =3D sizeof(struct vbt) - sizeof(struct vbt_heade=
r);
> =20
>  	/* general features */
>  	v->general_features_header.id =3D BDB_GENERAL_FEATURES;
> --=20
> 2.17.1
>=20

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--aYrjF+tKt+ApYAdb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXmGjXQAKCRCxBBozTXgY
J97xAJ40kLPCYc/eeHxB5QNzQMChPcvbBACdHghdqF/xwSPQOEDCs6ofYcOqC+0=
=bolv
-----END PGP SIGNATURE-----

--aYrjF+tKt+ApYAdb--

--===============0118097203==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0118097203==--
