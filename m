Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8D63BB555
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  5 Jul 2021 04:54:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BBE789BB0;
	Mon,  5 Jul 2021 02:54:01 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4306989856
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  5 Jul 2021 02:54:00 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10035"; a="188596876"
X-IronPort-AV: E=Sophos;i="5.83,325,1616482800"; 
 d="asc'?scan'208";a="188596876"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2021 19:53:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,325,1616482800"; 
 d="asc'?scan'208";a="495966469"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.143])
 by fmsmga002.fm.intel.com with ESMTP; 04 Jul 2021 19:53:58 -0700
Date: Mon, 5 Jul 2021 10:33:00 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Colin Xu <colin.xu@intel.com>
Subject: Re: [PATCH] drm/i915/gvt: Clear d3_entered on elsp cmd submission.
Message-ID: <20210705023300.GK12150@zhen-hp.sh.intel.com>
References: <20210701025423.312943-1-colin.xu@intel.com>
MIME-Version: 1.0
In-Reply-To: <20210701025423.312943-1-colin.xu@intel.com>
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
Content-Type: multipart/mixed; boundary="===============1202219724=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1202219724==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hQiwHBbRI9kgIhsi"
Content-Disposition: inline


--hQiwHBbRI9kgIhsi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2021.07.01 10:54:23 +0800, Colin Xu wrote:
> d3_entered flag is used to mark for vgpu_reset a previous power
> transition from D3->D0, typically for VM resume from S3, so that gvt
> could skip PPGTT invalidation in current vgpu_reset during resuming.
>=20
> In case S0ix exit, although there is D3->D0, guest driver continue to
> use vgpu as normal, with d3_entered set, until next shutdown/reboot or
> power transition.
>=20
> If a reboot follows a S0ix exit, device power state transite as:
> D0->D3->D0->D0(reboot), while system power state transites as:
> S0->S0 (reboot). There is no vgpu_reset until D0(reboot), thus
> d3_entered won't be cleared, the vgpu_reset will skip PPGTT invalidation
> however those PPGTT entries are no longer valid. Err appears like:
>=20
> gvt: vgpu 2: vfio_pin_pages failed for gfn 0xxxxx, ret -22
> gvt: vgpu 2: fail: spt xxxx guest entry 0xxxxx type 2
> gvt: vgpu 2: fail: shadow page xxxx guest entry 0xxxxx type 2.
>=20
> Give gvt a chance to clear d3_entered on elsp cmd submission so that the
> states before & after S0ix enter/exit are consistent.
>=20
> Fixes: ba25d977571e ("drm/i915/gvt: Do not destroy ppgtt_mm during vGPU D=
3->D0.")
>=20
> Signed-off-by: Colin Xu <colin.xu@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/handlers.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/g=
vt/handlers.c
> index 98eb48c24c46..f3e044521aa6 100644
> --- a/drivers/gpu/drm/i915/gvt/handlers.c
> +++ b/drivers/gpu/drm/i915/gvt/handlers.c
> @@ -1977,6 +1977,9 @@ static int elsp_mmio_write(struct intel_vgpu *vgpu,=
 unsigned int offset,
>  	if (drm_WARN_ON(&i915->drm, !engine))
>  		return -EINVAL;
> =20
> +	if (vgpu->d3_entered)
> +		vgpu->d3_entered =3D false;

Pls add comment to explain why to trigger this here, so easier to find out =
why..

> +
>  	execlist =3D &vgpu->submission.execlist[engine->id];
> =20
>  	execlist->elsp_dwords.data[3 - execlist->elsp_dwords.index] =3D data;
> --=20
> 2.32.0
>=20
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--hQiwHBbRI9kgIhsi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCYOJvUwAKCRCxBBozTXgY
J7/bAJ9WhtjdRBYb0Rg9Zp3asNuedsMKBACdHSduwxd2/uAuPKVY3oGn3U1C3gE=
=V6yh
-----END PGP SIGNATURE-----

--hQiwHBbRI9kgIhsi--

--===============1202219724==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============1202219724==--
