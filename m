Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA132ECF1
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 30 May 2019 05:29:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC1776E30F;
	Thu, 30 May 2019 03:29:19 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 635BB6E30F
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 30 May 2019 03:29:18 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 May 2019 20:29:17 -0700
X-ExtLoop1: 1
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by fmsmga005.fm.intel.com with ESMTP; 29 May 2019 20:29:17 -0700
Date: Thu, 30 May 2019 11:27:57 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Xiaolin Zhang <xiaolin.zhang@intel.com>
Subject: Re: [PATCH V3] drm/i915/gvt: save RING_HEAD into vreg when vgpu
 switched out
Message-ID: <20190530032757.GC3211@zhen-hp.sh.intel.com>
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
Cc: "Zhao, Yan Y" <yan.y.zhao@intel.com>, intel-gvt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1897951241=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1897951241==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lMM8JwqTlfDpEaS6"
Content-Disposition: inline


--lMM8JwqTlfDpEaS6
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

Yan reminded me that we don't actually align guest vs. host ring
buffer, so they don't have same head/tail, this directly updates guest
value with host value is not correct. Although it might work around
current hang check issue for processed head, we should keep guest ring
correctly with its vreg value. Could you update this?

thanks

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--lMM8JwqTlfDpEaS6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iFwEARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXO9NvQAKCRCxBBozTXgY
J5prAJi1YhC2m7S4kQ2AtXNjtwowCwl6AJ0SKKpJb48H7hXU7vKmaDcIwPbV1A==
=FOif
-----END PGP SIGNATURE-----

--lMM8JwqTlfDpEaS6--

--===============1897951241==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============1897951241==--
