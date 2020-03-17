Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E20187E38
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 17 Mar 2020 11:25:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 443A489FFD;
	Tue, 17 Mar 2020 10:25:00 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5103789FFD
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 17 Mar 2020 10:24:57 +0000 (UTC)
IronPort-SDR: wwWvjKnl5jg3g7aL2bPaPlxtxN094/Uoe6WFFZVCT/JTYpljqJTQnp3ilBOmT0pLuFxRRwZYdj
 iZhfrbLM7cCw==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2020 03:24:57 -0700
IronPort-SDR: AbmHs9pZDSNBSHrfLAhv3JLHJVftw+WD456Ws8Ceud8IHQqXbB0jxAloSMnofY0LRY8rP+RKd9
 MJoKYztl9B1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,564,1574150400"; 
 d="asc'?scan'208";a="247773296"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by orsmga006.jf.intel.com with ESMTP; 17 Mar 2020 03:24:55 -0700
Date: Tue, 17 Mar 2020 18:12:15 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Tina Zhang <tina.zhang@intel.com>
Subject: Re: [PATCH] drm/i915/gvt: Add some regs to force-to-nonpriv whitelist
Message-ID: <20200317101215.GP8880@zhen-hp.sh.intel.com>
References: <20200317091414.10246-1-tina.zhang@intel.com>
MIME-Version: 1.0
In-Reply-To: <20200317091414.10246-1-tina.zhang@intel.com>
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
Content-Type: multipart/mixed; boundary="===============0070450395=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0070450395==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="n83H03bbH672hrlY"
Content-Disposition: inline


--n83H03bbH672hrlY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.03.17 17:14:14 +0800, Tina Zhang wrote:
> Those regs are added in order to slove the following complains:
>=20
>  [70811.201818] gvt: vgpu(1) Invalid FORCE_NONPRIV write 2341 at offset 2=
4d8
>  [70811.201825] gvt: vgpu(1) Invalid FORCE_NONPRIV write 2351 at offset 2=
4dc
>  [70811.201831] gvt: vgpu(1) Invalid FORCE_NONPRIV write 10000d82 at offs=
et 24e0
>  [70811.201837] gvt: vgpu(1) Invalid FORCE_NONPRIV write 10064844 at offs=
et 24e4
>=20
> So solve them by adding the required regs to the whitelist.
>=20
> v2: give name to 0x64844 mmio (zhenyu)
>=20
> Signed-off-by: Tina Zhang <tina.zhang@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/handlers.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/g=
vt/handlers.c
> index 0182e2a5acff..35f432e68364 100644
> --- a/drivers/gpu/drm/i915/gvt/handlers.c
> +++ b/drivers/gpu/drm/i915/gvt/handlers.c
> @@ -462,11 +462,16 @@ static int pipeconf_mmio_write(struct intel_vgpu *v=
gpu, unsigned int offset,
>  	return 0;
>  }
> =20
> -/* ascendingly sorted */
> +#define SRD_PERF_CNT _MMIO(0x64844)
> +
> +/* sorted in ascending order */
>  static i915_reg_t force_nonpriv_white_list[] =3D {
> +	_MMIO(0xd80),
>  	GEN9_CS_DEBUG_MODE1, //_MMIO(0x20ec)
>  	GEN9_CTX_PREEMPT_REG,//_MMIO(0x2248)
> -	PS_INVOCATION_COUNT,//_MMIO(0x2348)
> +	CL_PRIMITIVES_COUNT, //_MMIO(0x2340)
> +	PS_INVOCATION_COUNT, //_MMIO(0x2348)
> +	PS_DEPTH_COUNT, //_MMIO(0x2350)
>  	GEN8_CS_CHICKEN1,//_MMIO(0x2580)
>  	_MMIO(0x2690),
>  	_MMIO(0x2694),
> @@ -491,6 +496,7 @@ static i915_reg_t force_nonpriv_white_list[] =3D {
>  	_MMIO(0xe18c),
>  	_MMIO(0xe48c),
>  	_MMIO(0xe5f4),
> +	SRD_PERF_CNT, //_MMIO(0x64844),
>  };

oh, I just picked original version, if i915 hasn't defined that,
better can add in i915_reg.h, otherwise can live with the reg value.

> =20
>  /* a simple bsearch */
> --=20
> 2.17.1
>=20
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--n83H03bbH672hrlY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXnCifwAKCRCxBBozTXgY
J+09AKCajXBAkm0VPNwhbx5bqLQPfjCVrwCfe+QU6gcoiYilTQlI9vvx08CHEa8=
=YJAL
-----END PGP SIGNATURE-----

--n83H03bbH672hrlY--

--===============0070450395==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0070450395==--
