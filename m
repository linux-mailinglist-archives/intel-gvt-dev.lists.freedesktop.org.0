Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 688882C96C4
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  1 Dec 2020 06:11:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E3086E423;
	Tue,  1 Dec 2020 05:11:32 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6160C6E423
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  1 Dec 2020 05:11:31 +0000 (UTC)
IronPort-SDR: CxVNcxh/4QqnAPN2oZ57v4wqJZ4PDHEvONyzeogvAP6HYuFEzZhC1YStz5BWMZHddU5+H/aizC
 f9ilaHs0vPXA==
X-IronPort-AV: E=McAfee;i="6000,8403,9821"; a="236892633"
X-IronPort-AV: E=Sophos;i="5.78,383,1599548400"; 
 d="asc'?scan'208";a="236892633"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2020 21:11:30 -0800
IronPort-SDR: QTAEjZtsW2df7Hb6Fw4YHesly0EKJ8xA97wv6tvT9MbTBrloHn9jh8Ced+ahNIUQXkgVRAsmjY
 0mH+ealIss0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,383,1599548400"; 
 d="asc'?scan'208";a="364549679"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by fmsmga004.fm.intel.com with ESMTP; 30 Nov 2020 21:11:29 -0800
Date: Tue, 1 Dec 2020 12:56:28 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Colin Xu <colin.xu@intel.com>
Subject: Re: [PATCH 1/2] drm/i915/gvt: Get accurate vGPU virtual display
 refresh rate from vreg
Message-ID: <20201201045628.GN16939@zhen-hp.sh.intel.com>
References: <20201109080011.813032-1-colin.xu@intel.com>
MIME-Version: 1.0
In-Reply-To: <20201109080011.813032-1-colin.xu@intel.com>
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
Content-Type: multipart/mixed; boundary="===============1032209987=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1032209987==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bGR76rFJjkSxVeRa"
Content-Disposition: inline


--bGR76rFJjkSxVeRa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.11.09 16:00:11 +0800, Colin Xu wrote:
> Guest OS builds up its timing mode list based on the virtual EDID as
> simulated by GVT. However since there are several timings supported in
> the virtual EDID, and each timing can also support several modes
> (resolution and refresh rate), current emulated vblank peroid (16ms)
> may not always be correct and could lead to miss-sync behavior in guest.
>=20
> Guest driver will setup new resolution and program vregs accordingly and
> it should always follows GEN PRM. Based on the simulated display regs by
> GVT, it's safe to decode the actual refresh rate using by guest from
> vreg only.

yeah, that's right.

>=20
> Current implementation only enables PIPE_A and PIPE_A is always tied to
> TRANSCODER_A in HW. GVT may simulate DP monitor on PORT_B or PORT_D
> based on the caller. So we can find out which DPLL is used by PROT_x

PORT_X

> which connected to TRANSCODER_A and calculate the DP bit rate from the
> DPLL frequency. Then DP stream clock (pixel clock) can be calculated
> from DP link M/N and DP bit rate. Finally, get the refresh rate from
> pixel clock, H total and V total.
>=20
> Refer to PRM for GEN display and VESA timing standard for more details.
>=20
> Signed-off-by: Colin Xu <colin.xu@intel.com>
> ---

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

>  drivers/gpu/drm/i915/gvt/display.c  |   2 +
>  drivers/gpu/drm/i915/gvt/display.h  |   2 +
>  drivers/gpu/drm/i915/gvt/gvt.h      |   1 +
>  drivers/gpu/drm/i915/gvt/handlers.c | 107 +++++++++++++++++++++++++++-
>  4 files changed, 110 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/display.c b/drivers/gpu/drm/i915/gv=
t/display.c
> index 5b5c71a0b4af..bc208355662a 100644
> --- a/drivers/gpu/drm/i915/gvt/display.c
> +++ b/drivers/gpu/drm/i915/gvt/display.c
> @@ -389,6 +389,8 @@ static int setup_virtual_dp_monitor(struct intel_vgpu=
 *vgpu, int port_num,
>  	port->dpcd->data[DPCD_SINK_COUNT] =3D 0x1;
>  	port->type =3D type;
>  	port->id =3D resolution;
> +	port->vrefresh_k =3D 60 * MSEC_PER_SEC;
> +	vgpu->display.port_num =3D port_num;
> =20
>  	emulate_monitor_status_change(vgpu);
> =20
> diff --git a/drivers/gpu/drm/i915/gvt/display.h b/drivers/gpu/drm/i915/gv=
t/display.h
> index b59b34046e1e..17e83bf5826c 100644
> --- a/drivers/gpu/drm/i915/gvt/display.h
> +++ b/drivers/gpu/drm/i915/gvt/display.h
> @@ -164,6 +164,8 @@ struct intel_vgpu_port {
>  	struct intel_vgpu_dpcd_data *dpcd;
>  	int type;
>  	enum intel_vgpu_edid id;
> +	/* x1000 to get accurate 59.94, 24.976, 29.94, etc. in timing std. */
> +	u32 vrefresh_k;
>  };
> =20
>  static inline char *vgpu_edid_str(enum intel_vgpu_edid id)
> diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gv=
t.h
> index a81cf0f01e78..2b75b3b3ea12 100644
> --- a/drivers/gpu/drm/i915/gvt/gvt.h
> +++ b/drivers/gpu/drm/i915/gvt/gvt.h
> @@ -129,6 +129,7 @@ struct intel_vgpu_display {
>  	struct intel_vgpu_i2c_edid i2c_edid;
>  	struct intel_vgpu_port ports[I915_MAX_PORTS];
>  	struct intel_vgpu_sbi sbi;
> +	enum port port_num;
>  };
> =20
>  struct vgpu_sched_ctl {
> diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/g=
vt/handlers.c
> index ce93079cf933..ec88a6329329 100644
> --- a/drivers/gpu/drm/i915/gvt/handlers.c
> +++ b/drivers/gpu/drm/i915/gvt/handlers.c
> @@ -443,6 +443,107 @@ static int dpy_reg_mmio_read(struct intel_vgpu *vgp=
u, unsigned int offset,
>  	return 0;
>  }
> =20
> +/*
> +* Only PIPE_A is enabled in current vGPU display and PIPE_A is tied to
> +*   TRANSCODER_A in HW. DDI/PORT could be PORT_x depends on
> +*   setup_virtual_dp_monitor().
> +* emulate_monitor_status_change() set up DPLL0 for PORT_x as the initial=
 enabled
> +*   DPLL. Later guest driver may setup a different DPLLx when setting mo=
de.
> +* So the correct sequence to find DP stream clock is:
> +*   Check TRANS_DDI_FUNC_CTL on TRANSCODER_A to get PORT_x.
> +*   Check DPLL_CTRL2 at PORT_x to find out the selected ON DPLLx.
> +*   Check DPLLx to get PLL frequency and DP bitrate.
> +*     DP bitrate =3D DPLL output frequency * 2.
> +* Then Refresh rate can be calcuated by:
> +*   Pixel clock =3D h_total * v_total * refresh_rate
> +*   stream clock =3D Pixel clock
> +*   Link M/N =3D strm_clk / ls_clk
> +*/
> +static void vgpu_update_refresh_rate(struct intel_vgpu *vgpu)
> +{
> +	struct drm_i915_private *dev_priv =3D vgpu->gvt->gt->i915;
> +	enum port port;
> +	enum intel_dpll_id dpll_id =3D DPLL_ID_SKL_DPLL0;
> +	u32 dp_br, link_m, link_n, htotal, vtotal, vrefresh_k;
> +	u64 pixel_clk;
> +
> +	/* Find DDI/PORT assigned to TRANSCODER_A, expect B or D */
> +	port =3D (vgpu_vreg_t(vgpu, TRANS_DDI_FUNC_CTL(TRANSCODER_A)) &
> +		TRANS_DDI_PORT_MASK) >> TRANS_DDI_PORT_SHIFT;
> +	if (port !=3D PORT_B && port !=3D PORT_D) {
> +		gvt_dbg_dpy("vgpu-%d unsupported PORT_%c\n",
> +			    vgpu->id, port_name(port));
> +		return;
> +	}
> +
> +	/* Find the enabled DPLL for the DDI/PORT */
> +	if (!(vgpu_vreg_t(vgpu, DPLL_CTRL2) & DPLL_CTRL2_DDI_CLK_OFF(port)) &&
> +	    (vgpu_vreg_t(vgpu, DPLL_CTRL2) & DPLL_CTRL2_DDI_SEL_OVERRIDE(port))=
) {
> +		dpll_id +=3D (vgpu_vreg_t(vgpu, DPLL_CTRL2) &
> +			DPLL_CTRL2_DDI_CLK_SEL_MASK(port)) >>
> +			DPLL_CTRL2_DDI_CLK_SEL_SHIFT(port);
> +	} else {
> +		gvt_dbg_dpy("vgpu-%d DPLL for PORT_%c isn't turned on\n",
> +			    vgpu->id, port_name(port));
> +		return;
> +	}
> +
> +	/* Find PLL output frequency from correct DPLL, and get bir rate */
> +	switch ((vgpu_vreg_t(vgpu, DPLL_CTRL1) &
> +		DPLL_CTRL1_LINK_RATE_MASK(dpll_id)) >>
> +		DPLL_CTRL1_LINK_RATE_SHIFT(dpll_id)) {
> +		case DPLL_CTRL1_LINK_RATE_810:
> +			dp_br =3D 81000 * 2;
> +			break;
> +		case DPLL_CTRL1_LINK_RATE_1080:
> +			dp_br =3D 108000 *2;
> +			break;
> +		case DPLL_CTRL1_LINK_RATE_1350:
> +			dp_br =3D 135000 * 2;
> +			break;
> +		case DPLL_CTRL1_LINK_RATE_1620:
> +			dp_br =3D 162000 * 2;
> +			break;
> +		case DPLL_CTRL1_LINK_RATE_2160:
> +			dp_br =3D 216000 * 2;
> +			break;
> +		case DPLL_CTRL1_LINK_RATE_2700:
> +			dp_br =3D 270000 * 2;
> +			break;
> +		default:
> +			dp_br =3D 0;
> +			gvt_dbg_dpy("vgpu-%d fail to get DPLL-%d freq\n",
> +				    vgpu->id, dpll_id);
> +			return;
> +	}
> +
> +	/* Get DP link symbol clock M/N */
> +	link_m =3D vgpu_vreg_t(vgpu, PIPE_LINK_M1(TRANSCODER_A));
> +	link_n =3D vgpu_vreg_t(vgpu, PIPE_LINK_N1(TRANSCODER_A));
> +
> +	/* Get H/V total from transcoder timing */
> +	htotal =3D (vgpu_vreg_t(vgpu, HTOTAL(TRANSCODER_A)) >> TRANS_HTOTAL_SHI=
FT) + 1;
> +	vtotal =3D (vgpu_vreg_t(vgpu, VTOTAL(TRANSCODER_A)) >> TRANS_VTOTAL_SHI=
FT) + 1;
> +
> +	if (link_n && htotal && vtotal) {
> +		u32 *old =3D &(intel_vgpu_port(vgpu, vgpu->display.port_num)->vrefresh=
_k);
> +
> +		/* Calcuate pixel clock by (ls_clk * M / N) */
> +		pixel_clk =3D div_u64(mul_u32_u32(link_m, dp_br), link_n);
> +		pixel_clk *=3D MSEC_PER_SEC;
> +
> +		/* Calcuate refresh rate by (pixel_clk / (h_total * v_total)) */
> +		vrefresh_k =3D DIV64_U64_ROUND_CLOSEST(pixel_clk,
> +			div64_u64(mul_u32_u32(htotal, vtotal), MSEC_PER_SEC));
> +
> +		if (*old !=3D vrefresh_k)
> +			*old =3D vrefresh_k;
> +
> +		gvt_dbg_dpy("vgpu-%d PIPE_%c refresh rate updated to %d\n",
> +			    vgpu->id, pipe_name(PIPE_A), vrefresh_k);
> +	}
> +}
> +
>  static int pipeconf_mmio_write(struct intel_vgpu *vgpu, unsigned int off=
set,
>  		void *p_data, unsigned int bytes)
>  {
> @@ -451,9 +552,11 @@ static int pipeconf_mmio_write(struct intel_vgpu *vg=
pu, unsigned int offset,
>  	write_vreg(vgpu, offset, p_data, bytes);
>  	data =3D vgpu_vreg(vgpu, offset);
> =20
> -	if (data & PIPECONF_ENABLE)
> +	if (data & PIPECONF_ENABLE) {
>  		vgpu_vreg(vgpu, offset) |=3D I965_PIPECONF_ACTIVE;
> -	else
> +		vgpu_update_refresh_rate(vgpu);
> +
> +	} else
>  		vgpu_vreg(vgpu, offset) &=3D ~I965_PIPECONF_ACTIVE;
>  	/* vgpu_lock already hold by emulate mmio r/w */
>  	mutex_unlock(&vgpu->vgpu_lock);
> --=20
> 2.29.2
>=20
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--=20

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--bGR76rFJjkSxVeRa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCX8XM9wAKCRCxBBozTXgY
Jw4VAJ0XKcOcajQ1ponAzFOqTFEHODNMZgCeL9Y6+P/1DUJ2iku4CEjVNDbL+Js=
=0VRT
-----END PGP SIGNATURE-----

--bGR76rFJjkSxVeRa--

--===============1032209987==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============1032209987==--
