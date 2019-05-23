Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 847482748C
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 23 May 2019 04:50:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20B7E89307;
	Thu, 23 May 2019 02:50:31 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEC2B89C53
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 23 May 2019 02:50:29 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 May 2019 19:50:28 -0700
X-ExtLoop1: 1
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by orsmga006.jf.intel.com with ESMTP; 22 May 2019 19:50:27 -0700
Date: Thu, 23 May 2019 10:49:23 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Xiaolin Zhang <xiaolin.zhang@intel.com>
Subject: Re: [PATCH V3] drm/i915/gvt: save RING_HEAD into vreg when vgpu
 switched out
Message-ID: <20190523024923.GO12913@zhen-hp.sh.intel.com>
References: <1558574501-8229-1-git-send-email-xiaolin.zhang@intel.com>
MIME-Version: 1.0
In-Reply-To: <1558574501-8229-1-git-send-email-xiaolin.zhang@intel.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Content-Type: multipart/mixed; boundary="===============1410949303=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1410949303==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Ii0/ZdEIJWgTBNV2"
Content-Disposition: inline


--Ii0/ZdEIJWgTBNV2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.05.23 09:21:41 +0800, Xiaolin Zhang wrote:
> to save RING_HEAD into vgpu reg when vgpu switched out and report
> it's value back to guest.
>=20
> v3: save RING HEAD/TAIL vgpu reg in save_ring_hw_state. (Zhenyu Wang)
> v2: save RING_TAIL as well during vgpu mmio switch to meet ring_is_idle
> condition. (Fred Gao)
> v1: based on input from Weinan. (Weinan Li)
>=20
> Fixes: 519a019491b8 ("drm/i915/hangcheck: Replace hangcheck.seqno with RI=
NG_HEAD")
>=20
> Signed-off-by: Xiaolin Zhang <xiaolin.zhang@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/scheduler.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c b/drivers/gpu/drm/i915/=
gvt/scheduler.c
> index 38897d2..353b4d0 100644
> --- a/drivers/gpu/drm/i915/gvt/scheduler.c
> +++ b/drivers/gpu/drm/i915/gvt/scheduler.c
> @@ -218,6 +218,10 @@ static void save_ring_hw_state(struct intel_vgpu *vg=
pu, int ring_id)
>  	vgpu_vreg(vgpu, i915_mmio_reg_offset(reg)) =3D I915_READ_FW(reg);
>  	reg =3D RING_ACTHD_UDW(ring_base);
>  	vgpu_vreg(vgpu, i915_mmio_reg_offset(reg)) =3D I915_READ_FW(reg);
> +	reg =3D RING_HEAD(ring_base);
> +	vgpu_vreg(vgpu, i915_mmio_reg_offset(reg)) =3D I915_READ_FW(reg);
> +	reg =3D RING_TAIL(ring_base);
> +	vgpu_vreg(vgpu, i915_mmio_reg_offset(reg)) =3D I915_READ_FW(reg);
>  }
>

Looks good to me.

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

>  static int shadow_context_status_change(struct notifier_block *nb,
> --=20
> 2.7.4
>=20
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--Ii0/ZdEIJWgTBNV2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXOYKMwAKCRCxBBozTXgY
J2w8AJ9eCR4eDGuXpAZcqD9hTYvombMQmgCfRsYDg/t3OY+VKt7AS9hWu7NMRKg=
=ngWv
-----END PGP SIGNATURE-----

--Ii0/ZdEIJWgTBNV2--

--===============1410949303==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============1410949303==--
