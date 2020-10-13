Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E940028C731
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 13 Oct 2020 04:39:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D1568908C;
	Tue, 13 Oct 2020 02:39:20 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A8056E047
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 13 Oct 2020 02:39:19 +0000 (UTC)
IronPort-SDR: A8XgGYhvksccKSYrGHUKYO7ZyDjmQiTvVc3/X8JUJc5ZrrsJZgs4GZzMRGlOpgnFJfMU/JK91s
 lbhsbE8gQHtA==
X-IronPort-AV: E=McAfee;i="6000,8403,9772"; a="165047638"
X-IronPort-AV: E=Sophos;i="5.77,369,1596524400"; 
 d="asc'?scan'208";a="165047638"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2020 19:39:18 -0700
IronPort-SDR: 2ftevf3jIwrUky88//lZ39tUPqmUT35Qpn4I2lIgmg27Hjvr+zOSJCrAT8+ocg2ROaSXZWvnNv
 0oSLNmdp4F9w==
X-IronPort-AV: E=Sophos;i="5.77,369,1596524400"; 
 d="asc'?scan'208";a="463315901"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2020 19:39:17 -0700
Date: Tue, 13 Oct 2020 10:18:45 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Colin Xu <colin.xu@intel.com>
Subject: Re: [PATCH] drm/i915/gvt: Fix virtual display setup for BXT/APL
Message-ID: <20201013021845.GP27141@zhen-hp.sh.intel.com>
References: <20201012045159.226106-1-colin.xu@intel.com>
MIME-Version: 1.0
In-Reply-To: <20201012045159.226106-1-colin.xu@intel.com>
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
Content-Type: multipart/mixed; boundary="===============1938232849=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1938232849==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mrJd9p1Ce66CJMxE"
Content-Disposition: inline


--mrJd9p1Ce66CJMxE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.10.12 12:51:59 +0800, Colin Xu wrote:
> Program display related vregs to proper value at initialization, setup
> virtual monitor and hotplug.
>

What does this fix? Does it fix virtual display probe or make vfio edid
work properly or others? Pls describe more in details.

> Signed-off-by: Colin Xu <colin.xu@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/display.c | 183 ++++++++++++++++++++++++++++-
>  drivers/gpu/drm/i915/gvt/mmio.c    |   5 +
>  2 files changed, 185 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/display.c b/drivers/gpu/drm/i915/gv=
t/display.c
> index 7ba16ddfe75f..f69e23b6218d 100644
> --- a/drivers/gpu/drm/i915/gvt/display.c
> +++ b/drivers/gpu/drm/i915/gvt/display.c
> @@ -173,21 +173,162 @@ static void emulate_monitor_status_change(struct i=
ntel_vgpu *vgpu)
>  	int pipe;
> =20
>  	if (IS_BROXTON(dev_priv)) {
> -		vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) &=3D ~(BXT_DE_PORT_HP_DDIA |
> -			BXT_DE_PORT_HP_DDIB |
> -			BXT_DE_PORT_HP_DDIC);
> +		enum transcoder trans;
> +		enum port port;
> +
> +		/* Clear PIPE, DDI, PHY, HPD before setting new */
> +		vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) &=3D
> +			~(BXT_DE_PORT_HP_DDIA |
> +			  BXT_DE_PORT_HP_DDIB |
> +			  BXT_DE_PORT_HP_DDIC);
> +
> +		for_each_pipe(dev_priv, pipe) {
> +			vgpu_vreg_t(vgpu, PIPECONF(pipe)) &=3D
> +				~(PIPECONF_ENABLE | I965_PIPECONF_ACTIVE);
> +			vgpu_vreg_t(vgpu, DSPCNTR(pipe)) &=3D ~DISPLAY_PLANE_ENABLE;
> +			vgpu_vreg_t(vgpu, SPRCTL(pipe)) &=3D ~SPRITE_ENABLE;
> +			vgpu_vreg_t(vgpu, CURCNTR(pipe)) &=3D ~MCURSOR_MODE;
> +			vgpu_vreg_t(vgpu, CURCNTR(pipe)) |=3D MCURSOR_MODE_DISABLE;
> +		}
> +
> +		for (trans =3D TRANSCODER_A; trans <=3D TRANSCODER_EDP; trans++) {
> +			vgpu_vreg_t(vgpu, TRANS_DDI_FUNC_CTL(trans)) &=3D
> +				~(TRANS_DDI_BPC_MASK | TRANS_DDI_MODE_SELECT_MASK |
> +				  TRANS_DDI_PORT_MASK | TRANS_DDI_FUNC_ENABLE);
> +		}
> +		vgpu_vreg_t(vgpu, TRANS_DDI_FUNC_CTL(TRANSCODER_A)) &=3D
> +			~(TRANS_DDI_BPC_MASK | TRANS_DDI_MODE_SELECT_MASK |
> +			  TRANS_DDI_PORT_MASK);
> +
> +		for (port =3D PORT_A; port <=3D PORT_C; port++) {
> +			vgpu_vreg_t(vgpu, BXT_PHY_CTL(port)) &=3D
> +				~BXT_PHY_LANE_ENABLED;
> +			vgpu_vreg_t(vgpu, BXT_PHY_CTL(port)) |=3D
> +				(BXT_PHY_CMNLANE_POWERDOWN_ACK |
> +				 BXT_PHY_LANE_POWERDOWN_ACK);
> +
> +			vgpu_vreg_t(vgpu, BXT_PORT_PLL_ENABLE(port)) &=3D
> +				~(PORT_PLL_POWER_STATE | PORT_PLL_POWER_ENABLE |
> +				  PORT_PLL_REF_SEL | PORT_PLL_LOCK |
> +				  PORT_PLL_ENABLE);
> +
> +			vgpu_vreg_t(vgpu, DDI_BUF_CTL(port)) &=3D
> +				~(DDI_INIT_DISPLAY_DETECTED |
> +				  DDI_BUF_CTL_ENABLE);
> +			vgpu_vreg_t(vgpu, DDI_BUF_CTL(port)) |=3D DDI_BUF_IS_IDLE;
> +		}
> +
> +		vgpu_vreg_t(vgpu, BXT_P_CR_GT_DISP_PWRON) &=3D ~(BIT(0) | BIT(1));
> +		vgpu_vreg_t(vgpu, BXT_PORT_CL1CM_DW0(DPIO_PHY0)) &=3D
> +			~PHY_POWER_GOOD;
> +		vgpu_vreg_t(vgpu, BXT_PORT_CL1CM_DW0(DPIO_PHY1)) &=3D
> +			~PHY_POWER_GOOD;
> +		vgpu_vreg_t(vgpu, BXT_PHY_CTL_FAMILY(DPIO_PHY0)) &=3D ~BIT(30);
> +		vgpu_vreg_t(vgpu, BXT_PHY_CTL_FAMILY(DPIO_PHY1)) &=3D ~BIT(30);
> +
> +		vgpu_vreg_t(vgpu, SFUSE_STRAP) &=3D ~SFUSE_STRAP_DDIB_DETECTED;
> +		vgpu_vreg_t(vgpu, SFUSE_STRAP) &=3D ~SFUSE_STRAP_DDIC_DETECTED;
> +
> +		/*
> +		 * Only 1 PIPE enabled in current vGPU display and PIPE_A is
> +		 *  tied to TRANSCODER_A in HW, so it's safe to assume PIPE_A,
> +		 *   TRANSCODER_A can be enabled. PORT_x depends on the input of
> +		 *   setup_virtual_dp_monitor.
> +		 */
> +		vgpu_vreg_t(vgpu, PIPECONF(PIPE_A)) |=3D PIPECONF_ENABLE;
> +		vgpu_vreg_t(vgpu, PIPECONF(PIPE_A)) |=3D I965_PIPECONF_ACTIVE;
> =20
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
> +
> +		/* Enable per-DDI/PORT vreg */
>  		if (intel_vgpu_has_monitor_on_port(vgpu, PORT_A)) {
> +			vgpu_vreg_t(vgpu, BXT_P_CR_GT_DISP_PWRON) |=3D BIT(1);
> +			vgpu_vreg_t(vgpu, BXT_PORT_CL1CM_DW0(DPIO_PHY1)) |=3D
> +				PHY_POWER_GOOD;
> +			vgpu_vreg_t(vgpu, BXT_PHY_CTL_FAMILY(DPIO_PHY1)) |=3D
> +				BIT(30);
> +			vgpu_vreg_t(vgpu, BXT_PHY_CTL(PORT_A)) |=3D
> +				BXT_PHY_LANE_ENABLED;
> +			vgpu_vreg_t(vgpu, BXT_PHY_CTL(PORT_A)) &=3D
> +				~(BXT_PHY_CMNLANE_POWERDOWN_ACK |
> +				  BXT_PHY_LANE_POWERDOWN_ACK);
> +			vgpu_vreg_t(vgpu, BXT_PORT_PLL_ENABLE(PORT_A)) |=3D
> +				(PORT_PLL_POWER_STATE | PORT_PLL_POWER_ENABLE |
> +				 PORT_PLL_REF_SEL | PORT_PLL_LOCK |
> +				 PORT_PLL_ENABLE);
> +			vgpu_vreg_t(vgpu, DDI_BUF_CTL(PORT_A)) |=3D
> +				(DDI_BUF_CTL_ENABLE | DDI_INIT_DISPLAY_DETECTED);
> +			vgpu_vreg_t(vgpu, DDI_BUF_CTL(PORT_A)) &=3D
> +				~DDI_BUF_IS_IDLE;
> +			vgpu_vreg_t(vgpu, TRANS_DDI_FUNC_CTL(TRANSCODER_EDP)) |=3D
> +				(TRANS_DDI_BPC_8 | TRANS_DDI_MODE_SELECT_DP_SST |
> +				 TRANS_DDI_FUNC_ENABLE);
>  			vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) |=3D
>  				BXT_DE_PORT_HP_DDIA;
>  		}
> =20
>  		if (intel_vgpu_has_monitor_on_port(vgpu, PORT_B)) {
> +			vgpu_vreg_t(vgpu, SFUSE_STRAP) |=3D SFUSE_STRAP_DDIB_DETECTED;
> +			vgpu_vreg_t(vgpu, BXT_P_CR_GT_DISP_PWRON) |=3D BIT(0);
> +			vgpu_vreg_t(vgpu, BXT_PORT_CL1CM_DW0(DPIO_PHY0)) |=3D
> +				PHY_POWER_GOOD;
> +			vgpu_vreg_t(vgpu, BXT_PHY_CTL_FAMILY(DPIO_PHY0)) |=3D
> +				BIT(30);
> +			vgpu_vreg_t(vgpu, BXT_PHY_CTL(PORT_B)) |=3D
> +				BXT_PHY_LANE_ENABLED;
> +			vgpu_vreg_t(vgpu, BXT_PHY_CTL(PORT_B)) &=3D
> +				~(BXT_PHY_CMNLANE_POWERDOWN_ACK |
> +				  BXT_PHY_LANE_POWERDOWN_ACK);
> +			vgpu_vreg_t(vgpu, BXT_PORT_PLL_ENABLE(PORT_B)) |=3D
> +				(PORT_PLL_POWER_STATE | PORT_PLL_POWER_ENABLE |
> +				 PORT_PLL_REF_SEL | PORT_PLL_LOCK |
> +				 PORT_PLL_ENABLE);
> +			vgpu_vreg_t(vgpu, DDI_BUF_CTL(PORT_B)) |=3D
> +				DDI_BUF_CTL_ENABLE;
> +			vgpu_vreg_t(vgpu, DDI_BUF_CTL(PORT_B)) &=3D
> +				~DDI_BUF_IS_IDLE;
> +			vgpu_vreg_t(vgpu, TRANS_DDI_FUNC_CTL(TRANSCODER_A)) |=3D
> +				(TRANS_DDI_BPC_8 | TRANS_DDI_MODE_SELECT_DP_SST |
> +				 (PORT_B << TRANS_DDI_PORT_SHIFT) |
> +				 TRANS_DDI_FUNC_ENABLE);
>  			vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) |=3D
>  				BXT_DE_PORT_HP_DDIB;
>  		}
> =20
>  		if (intel_vgpu_has_monitor_on_port(vgpu, PORT_C)) {
> +			vgpu_vreg_t(vgpu, SFUSE_STRAP) |=3D SFUSE_STRAP_DDIC_DETECTED;
> +			vgpu_vreg_t(vgpu, BXT_P_CR_GT_DISP_PWRON) |=3D BIT(0);
> +			vgpu_vreg_t(vgpu, BXT_PORT_CL1CM_DW0(DPIO_PHY0)) |=3D
> +				PHY_POWER_GOOD;
> +			vgpu_vreg_t(vgpu, BXT_PHY_CTL_FAMILY(DPIO_PHY0)) |=3D
> +				BIT(30);
> +			vgpu_vreg_t(vgpu, BXT_PHY_CTL(PORT_C)) |=3D
> +				BXT_PHY_LANE_ENABLED;
> +			vgpu_vreg_t(vgpu, BXT_PHY_CTL(PORT_C)) &=3D
> +				~(BXT_PHY_CMNLANE_POWERDOWN_ACK |
> +				  BXT_PHY_LANE_POWERDOWN_ACK);
> +			vgpu_vreg_t(vgpu, BXT_PORT_PLL_ENABLE(PORT_C)) |=3D
> +				(PORT_PLL_POWER_STATE | PORT_PLL_POWER_ENABLE |
> +				 PORT_PLL_REF_SEL | PORT_PLL_LOCK |
> +				 PORT_PLL_ENABLE);
> +			vgpu_vreg_t(vgpu, DDI_BUF_CTL(PORT_C)) |=3D
> +				DDI_BUF_CTL_ENABLE;
> +			vgpu_vreg_t(vgpu, DDI_BUF_CTL(PORT_C)) &=3D
> +				~DDI_BUF_IS_IDLE;
> +			vgpu_vreg_t(vgpu, TRANS_DDI_FUNC_CTL(TRANSCODER_A)) |=3D
> +				(TRANS_DDI_BPC_8 | TRANS_DDI_MODE_SELECT_DP_SST |
> +				 (PORT_B << TRANS_DDI_PORT_SHIFT) |
> +				 TRANS_DDI_FUNC_ENABLE);
>  			vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) |=3D
>  				BXT_DE_PORT_HP_DDIC;
>  		}
> @@ -519,6 +660,42 @@ void intel_vgpu_emulate_hotplug(struct intel_vgpu *v=
gpu, bool connected)
>  		vgpu_vreg_t(vgpu, PCH_PORT_HOTPLUG) |=3D
>  				PORTD_HOTPLUG_STATUS_MASK;
>  		intel_vgpu_trigger_virtual_event(vgpu, DP_D_HOTPLUG);
> +	} else if (IS_BROXTON(i915)) {
> +		if (connected) {
> +			if (intel_vgpu_has_monitor_on_port(vgpu, PORT_A)) {
> +				vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) |=3D
> +					BXT_DE_PORT_HP_DDIA;
> +			}
> +			if (intel_vgpu_has_monitor_on_port(vgpu, PORT_B)) {
> +				vgpu_vreg_t(vgpu, SFUSE_STRAP) |=3D
> +					SFUSE_STRAP_DDIB_DETECTED;
> +				vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) |=3D
> +					BXT_DE_PORT_HP_DDIB;
> +			}
> +			if (intel_vgpu_has_monitor_on_port(vgpu, PORT_C)) {
> +				vgpu_vreg_t(vgpu, SFUSE_STRAP) |=3D
> +					SFUSE_STRAP_DDIC_DETECTED;
> +				vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) |=3D
> +					BXT_DE_PORT_HP_DDIC;
> +			}
> +		} else {
> +			if (intel_vgpu_has_monitor_on_port(vgpu, PORT_A)) {
> +				vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) &=3D
> +					~BXT_DE_PORT_HP_DDIA;
> +			}
> +			if (intel_vgpu_has_monitor_on_port(vgpu, PORT_B)) {
> +				vgpu_vreg_t(vgpu, SFUSE_STRAP) &=3D
> +					~SFUSE_STRAP_DDIB_DETECTED;
> +				vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) &=3D
> +					~BXT_DE_PORT_HP_DDIB;
> +			}
> +			if (intel_vgpu_has_monitor_on_port(vgpu, PORT_C)) {
> +				vgpu_vreg_t(vgpu, SFUSE_STRAP) &=3D
> +					~SFUSE_STRAP_DDIC_DETECTED;
> +				vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) &=3D
> +					~BXT_DE_PORT_HP_DDIC;
> +			}
> +		}
>  	}
>  }
> =20
> diff --git a/drivers/gpu/drm/i915/gvt/mmio.c b/drivers/gpu/drm/i915/gvt/m=
mio.c
> index b6811f6a230d..24210b1eaec5 100644
> --- a/drivers/gpu/drm/i915/gvt/mmio.c
> +++ b/drivers/gpu/drm/i915/gvt/mmio.c
> @@ -280,6 +280,11 @@ void intel_vgpu_reset_mmio(struct intel_vgpu *vgpu, =
bool dmlr)
>  			vgpu_vreg_t(vgpu, BXT_PHY_CTL(PORT_C)) |=3D
>  				    BXT_PHY_CMNLANE_POWERDOWN_ACK |
>  				    BXT_PHY_LANE_POWERDOWN_ACK;
> +			vgpu_vreg_t(vgpu, SKL_FUSE_STATUS) |=3D
> +				SKL_FUSE_DOWNLOAD_STATUS |
> +				SKL_FUSE_PG_DIST_STATUS(SKL_PG0) |
> +				SKL_FUSE_PG_DIST_STATUS(SKL_PG1) |
> +				SKL_FUSE_PG_DIST_STATUS(SKL_PG2);
>  		}
>  	} else {
>  #define GVT_GEN8_MMIO_RESET_OFFSET		(0x44200)
> --=20
> 2.28.0
>=20
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--=20

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--mrJd9p1Ce66CJMxE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCX4UOhQAKCRCxBBozTXgY
J1fwAKCXLODbtyT3c0dlfzq8oZKSSFTyuwCfa/n87CzAa2pM8dASFjMxcppGEEU=
=SWEF
-----END PGP SIGNATURE-----

--mrJd9p1Ce66CJMxE--

--===============1938232849==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============1938232849==--
