Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B46D017B411
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  6 Mar 2020 02:55:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E9E46EC4F;
	Fri,  6 Mar 2020 01:55:15 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C3FD6EC4F
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  6 Mar 2020 01:55:14 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Mar 2020 17:55:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,520,1574150400"; 
 d="asc'?scan'208";a="275356221"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by fmsmga002.fm.intel.com with ESMTP; 05 Mar 2020 17:55:11 -0800
Date: Fri, 6 Mar 2020 09:42:56 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [PATCH 1/3] drm/i915/gvt: cleanup debugfs scan_nonprivbb
Message-ID: <20200306014256.GQ28483@zhen-hp.sh.intel.com>
References: <20200304032307.2983-1-zhenyuw@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20200304032307.2983-1-zhenyuw@linux.intel.com>
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
Cc: Ding Zhuocheng <zhuocheng.ding@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: multipart/mixed; boundary="===============1789718298=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1789718298==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BjavXC7V3ilNTWHC"
Content-Disposition: inline


--BjavXC7V3ilNTWHC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


As no regression found for this series, I'll merge them.

Acked-by: Zhenyu Wang <zhenyuw@linux.intel.com>

On 2020.03.04 11:23:05 +0800, Zhenyu Wang wrote:
> From: Chris Wilson <chris@chris-wilson.co.uk>
>=20
> Remove extra chatty message for debugfs scan_nonprivbb which is used
> to enable scan for non privileged batch on specific engine. Just write
> target i915 engine mask instead.
>=20
> Cc: Ding Zhuocheng <zhuocheng.ding@intel.com>
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/debugfs.c | 36 +-----------------------------
>  1 file changed, 1 insertion(+), 35 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/debugfs.c b/drivers/gpu/drm/i915/gv=
t/debugfs.c
> index 285f6011a537..874ee1de6b49 100644
> --- a/drivers/gpu/drm/i915/gvt/debugfs.c
> +++ b/drivers/gpu/drm/i915/gvt/debugfs.c
> @@ -128,6 +128,7 @@ static int
>  vgpu_scan_nonprivbb_get(void *data, u64 *val)
>  {
>  	struct intel_vgpu *vgpu =3D (struct intel_vgpu *)data;
> +
>  	*val =3D vgpu->scan_nonprivbb;
>  	return 0;
>  }
> @@ -142,42 +143,7 @@ static int
>  vgpu_scan_nonprivbb_set(void *data, u64 val)
>  {
>  	struct intel_vgpu *vgpu =3D (struct intel_vgpu *)data;
> -	struct drm_i915_private *dev_priv =3D vgpu->gvt->dev_priv;
> -	enum intel_engine_id id;
> -	char buf[128], *s;
> -	int len;
> -
> -	val &=3D (1 << I915_NUM_ENGINES) - 1;
> -
> -	if (vgpu->scan_nonprivbb =3D=3D val)
> -		return 0;
> -
> -	if (!val)
> -		goto done;
> -
> -	len =3D sprintf(buf,
> -		"gvt: vgpu %d turns on non-privileged batch buffers scanning on Engine=
s:",
> -		vgpu->id);
> -
> -	s =3D buf + len;
> -
> -	for (id =3D 0; id < I915_NUM_ENGINES; id++) {
> -		struct intel_engine_cs *engine;
> -
> -		engine =3D dev_priv->engine[id];
> -		if (engine && (val & (1 << id))) {
> -			len =3D snprintf(s, 4, "%d, ", engine->id);
> -			s +=3D len;
> -		} else
> -			val &=3D  ~(1 << id);
> -	}
> -
> -	if (val)
> -		sprintf(s, "low performance expected.");
> -
> -	pr_warn("%s\n", buf);
> =20
> -done:
>  	vgpu->scan_nonprivbb =3D val;
>  	return 0;
>  }
> --=20
> 2.25.1
>=20
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--BjavXC7V3ilNTWHC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXmGqoAAKCRCxBBozTXgY
J+a6AJ9oVthXD3025dv4iV+PlBJidZfhkACfaj+ROo5Z2UqKQSmjzqRMoB2OGaQ=
=IE4N
-----END PGP SIGNATURE-----

--BjavXC7V3ilNTWHC--

--===============1789718298==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============1789718298==--
