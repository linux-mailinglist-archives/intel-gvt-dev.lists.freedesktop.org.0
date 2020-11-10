Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3A82ACFE9
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 10 Nov 2020 07:42:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DA7489857;
	Tue, 10 Nov 2020 06:42:08 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 715D589856
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 10 Nov 2020 06:42:06 +0000 (UTC)
IronPort-SDR: 3sWauWUZ2auvxWWOxozToF9yUqnbZeH5Z4uAgi9ZEJt+jz63DZkpMitKaHStHSWSTTAriQxCic
 L/15BOgOljKg==
X-IronPort-AV: E=McAfee;i="6000,8403,9800"; a="170079547"
X-IronPort-AV: E=Sophos;i="5.77,465,1596524400"; 
 d="asc'?scan'208";a="170079547"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2020 22:42:05 -0800
IronPort-SDR: zIqNWAKmez4rfnuzPK01LvU1VqJj8iwRcqcFuXCP23A5XUOW9sta4m91MMsMocLNzsiUMduo2n
 /QGAHLdLIWrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,465,1596524400"; 
 d="asc'?scan'208";a="359981668"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by fmsmga002.fm.intel.com with ESMTP; 09 Nov 2020 22:42:04 -0800
Date: Tue, 10 Nov 2020 14:27:51 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Colin Xu <colin.xu@intel.com>
Subject: Re: [PATCH V5] drm/i915/gvt: Fix virtual display setup for BXT/APL
Message-ID: <20201110062751.GK1239@zhen-hp.sh.intel.com>
References: <20201109073922.757759-1-colin.xu@intel.com>
MIME-Version: 1.0
In-Reply-To: <20201109073922.757759-1-colin.xu@intel.com>
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
Content-Type: multipart/mixed; boundary="===============0070081695=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0070081695==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4f28nU6agdXSinmL"
Content-Disposition: inline


--4f28nU6agdXSinmL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.11.09 15:39:22 +0800, Colin Xu wrote:
> Program display related vregs to proper value at initialization, setup
> virtual monitor and hotplug.
>=20
> vGPU virtual display vregs inherit the value from pregs. The virtual DP
> monitor is always setup on PORT_B for BXT/APL. However the host may
> connect monitor on other PORT or without any monitor connected. Without
> properly setup PIPE/DDI/PLL related vregs, guest driver may not setup
> the virutal display as expected, and the guest desktop may not be
> created.
> Since only one virtual display is supported, enable PIPE_A only. And
> enable transcoder/DDI/PLL based on which port is setup for BXT/APL.
>=20
> V2:
> Revise commit message.
>=20
> V3:
> set_edid should on PORT_B for BXT.
> Inject hpd event for BXT.
>=20
> V4:
> Temporarily disable vfio edid on BXT/APL until issue fixed.
>=20
> V5:
> Rebase to use new HPD define GEN8_DE_PORT_HOTPLUG for BXT.
> Put vfio edid disabling on BXT/APL to a separate patch.
>=20
> Signed-off-by: Colin Xu <colin.xu@intel.com>
> ---

Acked-by: Zhenyu Wang <zhenyuw@linux.intel.com>

>  drivers/gpu/drm/i915/gvt/display.c | 179 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/i915/gvt/mmio.c    |   5 +
>  2 files changed, 184 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/display.c b/drivers/gpu/drm/i915/gv=
t/display.c
> index 5b5c71a0b4af..5c1fcac260d3 100644
> --- a/drivers/gpu/drm/i915/gvt/display.c
> +++ b/drivers/gpu/drm/i915/gvt/display.c
> @@ -173,22 +173,162 @@ static void emulate_monitor_status_change(struct i=
ntel_vgpu *vgpu)
>  	int pipe;
> =20
>  	if (IS_BROXTON(dev_priv)) {
> +		enum transcoder trans;
> +		enum port port;
> +
> +		/* Clear PIPE, DDI, PHY, HPD before setting new */
>  		vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) &=3D
>  			~(GEN8_DE_PORT_HOTPLUG(HPD_PORT_A) |
>  			  GEN8_DE_PORT_HOTPLUG(HPD_PORT_B) |
>  			  GEN8_DE_PORT_HOTPLUG(HPD_PORT_C));
> =20
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
> +
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
>  				GEN8_DE_PORT_HOTPLUG(HPD_PORT_A);
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
>  				GEN8_DE_PORT_HOTPLUG(HPD_PORT_B);
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
>  				GEN8_DE_PORT_HOTPLUG(HPD_PORT_C);
>  		}
> @@ -520,6 +660,45 @@ void intel_vgpu_emulate_hotplug(struct intel_vgpu *v=
gpu, bool connected)
>  		vgpu_vreg_t(vgpu, PCH_PORT_HOTPLUG) |=3D
>  				PORTD_HOTPLUG_STATUS_MASK;
>  		intel_vgpu_trigger_virtual_event(vgpu, DP_D_HOTPLUG);
> +	} else if (IS_BROXTON(i915)) {
> +		if (connected) {
> +			if (intel_vgpu_has_monitor_on_port(vgpu, PORT_A)) {
> +				vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) |=3D
> +					GEN8_DE_PORT_HOTPLUG(HPD_PORT_A);
> +			}
> +			if (intel_vgpu_has_monitor_on_port(vgpu, PORT_B)) {
> +				vgpu_vreg_t(vgpu, SFUSE_STRAP) |=3D
> +					SFUSE_STRAP_DDIB_DETECTED;
> +				vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) |=3D
> +					GEN8_DE_PORT_HOTPLUG(HPD_PORT_B);
> +			}
> +			if (intel_vgpu_has_monitor_on_port(vgpu, PORT_C)) {
> +				vgpu_vreg_t(vgpu, SFUSE_STRAP) |=3D
> +					SFUSE_STRAP_DDIC_DETECTED;
> +				vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) |=3D
> +					GEN8_DE_PORT_HOTPLUG(HPD_PORT_C);
> +			}
> +		} else {
> +			if (intel_vgpu_has_monitor_on_port(vgpu, PORT_A)) {
> +				vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) &=3D
> +					~GEN8_DE_PORT_HOTPLUG(HPD_PORT_A);
> +			}
> +			if (intel_vgpu_has_monitor_on_port(vgpu, PORT_B)) {
> +				vgpu_vreg_t(vgpu, SFUSE_STRAP) &=3D
> +					~SFUSE_STRAP_DDIB_DETECTED;
> +				vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) &=3D
> +					~GEN8_DE_PORT_HOTPLUG(HPD_PORT_B);
> +			}
> +			if (intel_vgpu_has_monitor_on_port(vgpu, PORT_C)) {
> +				vgpu_vreg_t(vgpu, SFUSE_STRAP) &=3D
> +					~SFUSE_STRAP_DDIC_DETECTED;
> +				vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) &=3D
> +					~GEN8_DE_PORT_HOTPLUG(HPD_PORT_C);
> +			}
> +		}
> +		vgpu_vreg_t(vgpu, PCH_PORT_HOTPLUG) |=3D
> +			PORTB_HOTPLUG_STATUS_MASK;
> +		intel_vgpu_trigger_virtual_event(vgpu, DP_B_HOTPLUG);
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
> 2.29.2
>=20
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--=20

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--4f28nU6agdXSinmL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iFwEARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCX6oy5wAKCRCxBBozTXgY
J/N7AJdQEHg0GofuePxKFc8YhZpH/VGNAJwOPl+I5rMT1CjVNqQLdNP+2N0BcQ==
=b90i
-----END PGP SIGNATURE-----

--4f28nU6agdXSinmL--

--===============0070081695==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0070081695==--
