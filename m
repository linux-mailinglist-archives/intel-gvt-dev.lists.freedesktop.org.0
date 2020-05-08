Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D361CA429
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  8 May 2020 08:39:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 934186EA7D;
	Fri,  8 May 2020 06:39:01 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DB2F6EA7D
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  8 May 2020 06:39:00 +0000 (UTC)
IronPort-SDR: w3WL/I4wj/M+PxEiQjyEJoV1Zs5aV8ny5LP1+twaZ9uQPUTP5grWbOss1o9ySQRLRXrP92cEuS
 uF6HAQh0kySw==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2020 23:39:00 -0700
IronPort-SDR: 685wShUivO9UAiBTMyKUAS/qcrUAlWr1u/48KzRXrmzPRAwtB92APghb6dgfYtPSJojDqPE0fk
 U4tUsZ48Wlgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,366,1583222400"; 
 d="asc'?scan'208";a="435576394"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by orsmga005.jf.intel.com with ESMTP; 07 May 2020 23:38:58 -0700
Date: Fri, 8 May 2020 14:24:24 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Colin Xu <colin.xu@intel.com>
Subject: Re: [PATCH] drm/i915/gvt: Init DPLL/DDI vreg for virtual display
 instead of inheritance.
Message-ID: <20200508062424.GA18545@zhen-hp.sh.intel.com>
References: <20200508060506.216250-1-colin.xu@intel.com>
MIME-Version: 1.0
In-Reply-To: <20200508060506.216250-1-colin.xu@intel.com>
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
Content-Type: multipart/mixed; boundary="===============2143652810=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============2143652810==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="v6YRErhBvjoBjrPV"
Content-Disposition: inline


--v6YRErhBvjoBjrPV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.05.08 14:05:06 +0800, Colin Xu wrote:
> Init value of some display vregs rea inherited from host pregs. When
> host display in different status, i.e. all monitors unpluged, different
> display configurations, etc., GVT virtual display setup don't consistent
> thus may lead to guest driver consider display goes malfunctional.
>=20
> The added init vreg values are based on PRMs and fixed by calcuation
> from current configuration (only PIPE_A) and the virtual EDID.
>=20
> Signed-off-by: Colin Xu <colin.xu@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/display.c | 49 +++++++++++++++++++++++++++---
>  1 file changed, 44 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/display.c b/drivers/gpu/drm/i915/gv=
t/display.c
> index a83df2f84eb9..a1696e9ce4b6 100644
> --- a/drivers/gpu/drm/i915/gvt/display.c
> +++ b/drivers/gpu/drm/i915/gvt/display.c
> @@ -208,14 +208,41 @@ static void emulate_monitor_status_change(struct in=
tel_vgpu *vgpu)
>  				SKL_FUSE_PG_DIST_STATUS(SKL_PG0) |
>  				SKL_FUSE_PG_DIST_STATUS(SKL_PG1) |
>  				SKL_FUSE_PG_DIST_STATUS(SKL_PG2);
> -		vgpu_vreg_t(vgpu, LCPLL1_CTL) |=3D
> -				LCPLL_PLL_ENABLE |
> -				LCPLL_PLL_LOCK;
> -		vgpu_vreg_t(vgpu, LCPLL2_CTL) |=3D LCPLL_PLL_ENABLE;

Is this not required?

> -
> +		/*
> +		 * Only 1 PIPE enabled in current vGPU display and PIPE_A is
> +		 *  tied to TRANSCODER_A in HW, so it's safe to assume PIPE_A,
> +		 *   TRANSCODER_A can be enabled. PORT_x depends on the input of
> +		 *   setup_virtual_dp_monitor, we can bind DPLL0 to any PORT_x
> +		 *   so we fixed to DPLL0 here.
> +		 * Setup DPLL0: DP link clk 1620 MHz, non SSC, DP Mode
> +		 */
> +		vgpu_vreg_t(vgpu, DPLL_CTRL1) =3D
> +			DPLL_CTRL1_OVERRIDE(DPLL_ID_SKL_DPLL0);
> +		vgpu_vreg_t(vgpu, DPLL_CTRL1) |=3D
> +			DPLL_CTRL1_LINK_RATE(DPLL_CTRL1_LINK_RATE_1620, DPLL_ID_SKL_DPLL0);
> +		vgpu_vreg_t(vgpu, LCPLL1_CTL) =3D
> +			LCPLL_PLL_ENABLE | LCPLL_PLL_LOCK;
> +		vgpu_vreg_t(vgpu, DPLL_STATUS) =3D DPLL_LOCK(DPLL_ID_SKL_DPLL0);
> +		/*
> +		 * Golden M/N are calculated based on:
> +		 *   24 bpp, 4 lanes, 154000 pixel clk (from virtual EDID),
> +		 *   DP link clk 1620 MHz and non-constant_n.
> +		 * TODO: calculate DP link symbol clk and stream clk m/n.
> +		 */
> +		vgpu_vreg_t(vgpu, PIPE_DATA_M1(TRANSCODER_A)) =3D 63 << TU_SIZE_SHIFT;
> +		vgpu_vreg_t(vgpu, PIPE_DATA_M1(TRANSCODER_A)) |=3D 0x5b425e;
> +		vgpu_vreg_t(vgpu, PIPE_DATA_N1(TRANSCODER_A)) =3D 0x800000;
> +		vgpu_vreg_t(vgpu, PIPE_LINK_M1(TRANSCODER_A)) =3D 0x3cd6e;
> +		vgpu_vreg_t(vgpu, PIPE_LINK_N1(TRANSCODER_A)) =3D 0x80000;
>  	}
> =20
>  	if (intel_vgpu_has_monitor_on_port(vgpu, PORT_B)) {
> +		vgpu_vreg_t(vgpu, DPLL_CTRL2) &=3D
> +			~DPLL_CTRL2_DDI_CLK_OFF(PORT_B);
> +		vgpu_vreg_t(vgpu, DPLL_CTRL2) |=3D
> +			DPLL_CTRL2_DDI_CLK_SEL(DPLL_ID_SKL_DPLL0, PORT_B);
> +		vgpu_vreg_t(vgpu, DPLL_CTRL2) |=3D
> +			DPLL_CTRL2_DDI_SEL_OVERRIDE(PORT_B);
>  		vgpu_vreg_t(vgpu, SFUSE_STRAP) |=3D SFUSE_STRAP_DDIB_DETECTED;
>  		vgpu_vreg_t(vgpu, TRANS_DDI_FUNC_CTL(TRANSCODER_A)) &=3D
>  			~(TRANS_DDI_BPC_MASK | TRANS_DDI_MODE_SELECT_MASK |
> @@ -236,6 +263,12 @@ static void emulate_monitor_status_change(struct int=
el_vgpu *vgpu)
>  	}
> =20
>  	if (intel_vgpu_has_monitor_on_port(vgpu, PORT_C)) {
> +		vgpu_vreg_t(vgpu, DPLL_CTRL2) &=3D
> +			~DPLL_CTRL2_DDI_CLK_OFF(PORT_C);
> +		vgpu_vreg_t(vgpu, DPLL_CTRL2) |=3D
> +			DPLL_CTRL2_DDI_CLK_SEL(DPLL_ID_SKL_DPLL0, PORT_C);
> +		vgpu_vreg_t(vgpu, DPLL_CTRL2) |=3D
> +			DPLL_CTRL2_DDI_SEL_OVERRIDE(PORT_C);
>  		vgpu_vreg_t(vgpu, SDEISR) |=3D SDE_PORTC_HOTPLUG_CPT;
>  		vgpu_vreg_t(vgpu, TRANS_DDI_FUNC_CTL(TRANSCODER_A)) &=3D
>  			~(TRANS_DDI_BPC_MASK | TRANS_DDI_MODE_SELECT_MASK |
> @@ -256,6 +289,12 @@ static void emulate_monitor_status_change(struct int=
el_vgpu *vgpu)
>  	}
> =20
>  	if (intel_vgpu_has_monitor_on_port(vgpu, PORT_D)) {
> +		vgpu_vreg_t(vgpu, DPLL_CTRL2) &=3D
> +			~DPLL_CTRL2_DDI_CLK_OFF(PORT_D);
> +		vgpu_vreg_t(vgpu, DPLL_CTRL2) |=3D
> +			DPLL_CTRL2_DDI_CLK_SEL(DPLL_ID_SKL_DPLL0, PORT_D);
> +		vgpu_vreg_t(vgpu, DPLL_CTRL2) |=3D
> +			DPLL_CTRL2_DDI_SEL_OVERRIDE(PORT_D);
>  		vgpu_vreg_t(vgpu, SDEISR) |=3D SDE_PORTD_HOTPLUG_CPT;
>  		vgpu_vreg_t(vgpu, TRANS_DDI_FUNC_CTL(TRANSCODER_A)) &=3D
>  			~(TRANS_DDI_BPC_MASK | TRANS_DDI_MODE_SELECT_MASK |
> --=20
> 2.26.2
>=20
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--v6YRErhBvjoBjrPV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXrT7GAAKCRCxBBozTXgY
J659AJ9DM7lHZBvoZD+fjBdBCtnsKlSSwgCcD3BXC1QW9dfVc93oemIwOrAqi8I=
=Gsnx
-----END PGP SIGNATURE-----

--v6YRErhBvjoBjrPV--

--===============2143652810==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============2143652810==--
