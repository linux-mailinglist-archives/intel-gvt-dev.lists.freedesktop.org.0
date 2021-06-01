Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA3C396F58
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  1 Jun 2021 10:47:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B0AA6E9A2;
	Tue,  1 Jun 2021 08:47:49 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23D536E99D;
 Tue,  1 Jun 2021 08:47:48 +0000 (UTC)
IronPort-SDR: V85gff1rkUnPef0TCK3uyFKtzRNn3aV+ISFemMj6USxg4XzuzDlkxYg/7FtrcGKZWwJMsRfZL8
 1E4fu+cgotiA==
X-IronPort-AV: E=McAfee;i="6200,9189,10001"; a="203538200"
X-IronPort-AV: E=Sophos;i="5.83,239,1616482800"; 
 d="asc'?scan'208";a="203538200"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2021 01:47:47 -0700
IronPort-SDR: LxtEFyZT6oTvdwGLVd1a0Onta12b4d1TAxSK0eoTLxy8TUX2UjkylYbL6xaqoHIiknf/mJHAWA
 +y7Jka9r+yOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,239,1616482800"; 
 d="asc'?scan'208";a="474169308"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.143])
 by FMSMGA003.fm.intel.com with ESMTP; 01 Jun 2021 01:47:44 -0700
Date: Tue, 1 Jun 2021 16:28:04 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2] drm/i915/gem: Use list_entry to access list members
Message-ID: <20210601082804.GS27293@zhen-hp.sh.intel.com>
References: <20210523172304.3033229-1-linux@roeck-us.net>
MIME-Version: 1.0
In-Reply-To: <20210523172304.3033229-1-linux@roeck-us.net>
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jani Nikula <jani.nikula@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 intel-gvt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0221670860=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0221670860==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Bqc0IY4JZZt50bUr"
Content-Disposition: inline


--Bqc0IY4JZZt50bUr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2021.05.23 10:23:04 -0700, Guenter Roeck wrote:
> Use list_entry() instead of container_of() to access list members.
> Also drop unnecessary and misleading NULL checks on the result of
> list_entry().
>=20
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> v2: Checkpatch fixes:
>     - Fix alignment
>     - Replace comparison against NULL with !
>=20
>  drivers/gpu/drm/i915/gvt/dmabuf.c | 18 +++++-------------
>  1 file changed, 5 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/dmabuf.c b/drivers/gpu/drm/i915/gvt=
/dmabuf.c
> index d4f883f35b95..e3f488681484 100644
> --- a/drivers/gpu/drm/i915/gvt/dmabuf.c
> +++ b/drivers/gpu/drm/i915/gvt/dmabuf.c
> @@ -148,8 +148,7 @@ static void dmabuf_gem_object_free(struct kref *kref)
> =20
>  	if (vgpu && vgpu->active && !list_empty(&vgpu->dmabuf_obj_list_head)) {
>  		list_for_each(pos, &vgpu->dmabuf_obj_list_head) {
> -			dmabuf_obj =3D container_of(pos,
> -					struct intel_vgpu_dmabuf_obj, list);
> +			dmabuf_obj =3D list_entry(pos, struct intel_vgpu_dmabuf_obj, list);
>  			if (dmabuf_obj =3D=3D obj) {
>  				list_del(pos);
>  				intel_gvt_hypervisor_put_vfio_device(vgpu);
> @@ -357,10 +356,8 @@ pick_dmabuf_by_info(struct intel_vgpu *vgpu,
>  	struct intel_vgpu_dmabuf_obj *ret =3D NULL;
> =20
>  	list_for_each(pos, &vgpu->dmabuf_obj_list_head) {
> -		dmabuf_obj =3D container_of(pos, struct intel_vgpu_dmabuf_obj,
> -						list);
> -		if ((dmabuf_obj =3D=3D NULL) ||
> -		    (dmabuf_obj->info =3D=3D NULL))
> +		dmabuf_obj =3D list_entry(pos, struct intel_vgpu_dmabuf_obj, list);
> +		if (!dmabuf_obj->info)
>  			continue;
> =20
>  		fb_info =3D (struct intel_vgpu_fb_info *)dmabuf_obj->info;
> @@ -387,11 +384,7 @@ pick_dmabuf_by_num(struct intel_vgpu *vgpu, u32 id)
>  	struct intel_vgpu_dmabuf_obj *ret =3D NULL;
> =20
>  	list_for_each(pos, &vgpu->dmabuf_obj_list_head) {
> -		dmabuf_obj =3D container_of(pos, struct intel_vgpu_dmabuf_obj,
> -						list);
> -		if (!dmabuf_obj)
> -			continue;
> -
> +		dmabuf_obj =3D list_entry(pos, struct intel_vgpu_dmabuf_obj, list);
>  		if (dmabuf_obj->dmabuf_id =3D=3D id) {
>  			ret =3D dmabuf_obj;
>  			break;
> @@ -600,8 +593,7 @@ void intel_vgpu_dmabuf_cleanup(struct intel_vgpu *vgp=
u)
> =20
>  	mutex_lock(&vgpu->dmabuf_lock);
>  	list_for_each_safe(pos, n, &vgpu->dmabuf_obj_list_head) {
> -		dmabuf_obj =3D container_of(pos, struct intel_vgpu_dmabuf_obj,
> -						list);
> +		dmabuf_obj =3D list_entry(pos, struct intel_vgpu_dmabuf_obj, list);
>  		dmabuf_obj->vgpu =3D NULL;
> =20
>  		idr_remove(&vgpu->object_idr, dmabuf_obj->dmabuf_id);
> --=20

Sorry for late reply! Looks good to me.

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

--Bqc0IY4JZZt50bUr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCYLXviAAKCRCxBBozTXgY
JwG7AJ9Pr/tLAdoR3m14OG9PG9UnCCEW9gCcDSBRdzRBnLpNffd7NifoU6gF4+0=
=aKMJ
-----END PGP SIGNATURE-----

--Bqc0IY4JZZt50bUr--

--===============0221670860==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0221670860==--
