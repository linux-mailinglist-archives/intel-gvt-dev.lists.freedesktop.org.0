Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1617B2C972C
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  1 Dec 2020 06:50:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBD2B6E4AD;
	Tue,  1 Dec 2020 05:50:41 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0C4E6E4AD
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  1 Dec 2020 05:50:40 +0000 (UTC)
IronPort-SDR: JR9bDw8y+tB/XG9w8N2IV0iHDtCiik4x5ThwedOOP79qGhtEfoFac0UlL5q26of+P/JSHmVHIs
 WXgiSSb546jw==
X-IronPort-AV: E=McAfee;i="6000,8403,9821"; a="172869126"
X-IronPort-AV: E=Sophos;i="5.78,383,1599548400"; 
 d="asc'?scan'208";a="172869126"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2020 21:50:40 -0800
IronPort-SDR: zqh48PWT/Nxt9xVyq3Pvn8YBH3kWWztI+6qR9YqSe/ebOkZ+wJheYzMBQspUEZKUuguZzYuNSd
 WMNSh5HOJURw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,383,1599548400"; 
 d="asc'?scan'208";a="364559652"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by fmsmga004.fm.intel.com with ESMTP; 30 Nov 2020 21:50:38 -0800
Date: Tue, 1 Dec 2020 13:35:37 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Colin Xu <colin.xu@intel.com>
Subject: Re: [PATCH] drm/i915/gvt: Fix vfio_edid issue for BXT/APL
Message-ID: <20201201053537.GP16939@zhen-hp.sh.intel.com>
References: <20201118025326.198338-1-colin.xu@intel.com>
MIME-Version: 1.0
In-Reply-To: <20201118025326.198338-1-colin.xu@intel.com>
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
Content-Type: multipart/mixed; boundary="===============0509541056=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0509541056==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dMyqICaxQaaUjrCL"
Content-Disposition: inline


--dMyqICaxQaaUjrCL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.11.18 10:53:26 +0800, Colin Xu wrote:
> BXT/APL has different isr/irr/hpd regs compared with other GEN9. If not
> setting these regs bits correctly according to the emulated monitor
> (currently a DP on PORT_B), although gvt still triggers a virtual HPD
> event, the guest driver won't detect a valid HPD pulse thus no full
> display detection will be executed to read the updated EDID.
>=20
> With this patch, the vfio_edid is enabled again on BXT/APL, which is
> previously disabled by:
> '642403e3599e (drm/i915/gvt: Temporarily disable vfio_edid for BXT/APL)'

So needs a Fixes tag. Otherwise looks fine to me. Thanks!

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

>=20
> Signed-off-by: Colin Xu <colin.xu@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/display.c | 81 +++++++++++++++++++++---------
>  drivers/gpu/drm/i915/gvt/vgpu.c    |  5 +-
>  2 files changed, 59 insertions(+), 27 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/display.c b/drivers/gpu/drm/i915/gv=
t/display.c
> index a15f87539657..62a5b0dd2003 100644
> --- a/drivers/gpu/drm/i915/gvt/display.c
> +++ b/drivers/gpu/drm/i915/gvt/display.c
> @@ -217,6 +217,15 @@ static void emulate_monitor_status_change(struct int=
el_vgpu *vgpu)
>  				  DDI_BUF_CTL_ENABLE);
>  			vgpu_vreg_t(vgpu, DDI_BUF_CTL(port)) |=3D DDI_BUF_IS_IDLE;
>  		}
> +		vgpu_vreg_t(vgpu, PCH_PORT_HOTPLUG) &=3D
> +			~(PORTA_HOTPLUG_ENABLE | PORTA_HOTPLUG_STATUS_MASK);
> +		vgpu_vreg_t(vgpu, PCH_PORT_HOTPLUG) &=3D
> +			~(PORTB_HOTPLUG_ENABLE | PORTB_HOTPLUG_STATUS_MASK);
> +		vgpu_vreg_t(vgpu, PCH_PORT_HOTPLUG) &=3D
> +			~(PORTC_HOTPLUG_ENABLE | PORTC_HOTPLUG_STATUS_MASK);
> +		/* No hpd_invert set in vgpu vbt, need to clear invert mask */
> +		vgpu_vreg_t(vgpu, PCH_PORT_HOTPLUG) &=3D ~BXT_DDI_HPD_INVERT_MASK;
> +		vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) &=3D ~BXT_DE_PORT_HOTPLUG_MASK;
> =20
>  		vgpu_vreg_t(vgpu, BXT_P_CR_GT_DISP_PWRON) &=3D ~(BIT(0) | BIT(1));
>  		vgpu_vreg_t(vgpu, BXT_PORT_CL1CM_DW0(DPIO_PHY0)) &=3D
> @@ -273,6 +282,8 @@ static void emulate_monitor_status_change(struct inte=
l_vgpu *vgpu)
>  			vgpu_vreg_t(vgpu, TRANS_DDI_FUNC_CTL(TRANSCODER_EDP)) |=3D
>  				(TRANS_DDI_BPC_8 | TRANS_DDI_MODE_SELECT_DP_SST |
>  				 TRANS_DDI_FUNC_ENABLE);
> +			vgpu_vreg_t(vgpu, PCH_PORT_HOTPLUG) |=3D
> +				PORTA_HOTPLUG_ENABLE;
>  			vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) |=3D
>  				GEN8_DE_PORT_HOTPLUG(HPD_PORT_A);
>  		}
> @@ -301,6 +312,8 @@ static void emulate_monitor_status_change(struct inte=
l_vgpu *vgpu)
>  				(TRANS_DDI_BPC_8 | TRANS_DDI_MODE_SELECT_DP_SST |
>  				 (PORT_B << TRANS_DDI_PORT_SHIFT) |
>  				 TRANS_DDI_FUNC_ENABLE);
> +			vgpu_vreg_t(vgpu, PCH_PORT_HOTPLUG) |=3D
> +				PORTB_HOTPLUG_ENABLE;
>  			vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) |=3D
>  				GEN8_DE_PORT_HOTPLUG(HPD_PORT_B);
>  		}
> @@ -329,6 +342,8 @@ static void emulate_monitor_status_change(struct inte=
l_vgpu *vgpu)
>  				(TRANS_DDI_BPC_8 | TRANS_DDI_MODE_SELECT_DP_SST |
>  				 (PORT_B << TRANS_DDI_PORT_SHIFT) |
>  				 TRANS_DDI_FUNC_ENABLE);
> +			vgpu_vreg_t(vgpu, PCH_PORT_HOTPLUG) |=3D
> +				PORTC_HOTPLUG_ENABLE;
>  			vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) |=3D
>  				GEN8_DE_PORT_HOTPLUG(HPD_PORT_C);
>  		}
> @@ -661,44 +676,62 @@ void intel_vgpu_emulate_hotplug(struct intel_vgpu *=
vgpu, bool connected)
>  				PORTD_HOTPLUG_STATUS_MASK;
>  		intel_vgpu_trigger_virtual_event(vgpu, DP_D_HOTPLUG);
>  	} else if (IS_BROXTON(i915)) {
> -		if (connected) {
> -			if (intel_vgpu_has_monitor_on_port(vgpu, PORT_A)) {
> +		if (intel_vgpu_has_monitor_on_port(vgpu, PORT_A)) {
> +			if (connected) {
>  				vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) |=3D
>  					GEN8_DE_PORT_HOTPLUG(HPD_PORT_A);
> +			} else {
> +				vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) &=3D
> +					~GEN8_DE_PORT_HOTPLUG(HPD_PORT_A);
>  			}
> -			if (intel_vgpu_has_monitor_on_port(vgpu, PORT_B)) {
> -				vgpu_vreg_t(vgpu, SFUSE_STRAP) |=3D
> -					SFUSE_STRAP_DDIB_DETECTED;
> +			vgpu_vreg_t(vgpu, GEN8_DE_PORT_IIR) |=3D
> +				GEN8_DE_PORT_HOTPLUG(HPD_PORT_A);
> +			vgpu_vreg_t(vgpu, PCH_PORT_HOTPLUG) &=3D
> +				~PORTA_HOTPLUG_STATUS_MASK;
> +			vgpu_vreg_t(vgpu, PCH_PORT_HOTPLUG) |=3D
> +				PORTA_HOTPLUG_LONG_DETECT;
> +			intel_vgpu_trigger_virtual_event(vgpu, DP_A_HOTPLUG);
> +		}
> +		if (intel_vgpu_has_monitor_on_port(vgpu, PORT_B)) {
> +			if (connected) {
>  				vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) |=3D
>  					GEN8_DE_PORT_HOTPLUG(HPD_PORT_B);
> -			}
> -			if (intel_vgpu_has_monitor_on_port(vgpu, PORT_C)) {
>  				vgpu_vreg_t(vgpu, SFUSE_STRAP) |=3D
> -					SFUSE_STRAP_DDIC_DETECTED;
> -				vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) |=3D
> -					GEN8_DE_PORT_HOTPLUG(HPD_PORT_C);
> -			}
> -		} else {
> -			if (intel_vgpu_has_monitor_on_port(vgpu, PORT_A)) {
> +					SFUSE_STRAP_DDIB_DETECTED;
> +			} else {
>  				vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) &=3D
> -					~GEN8_DE_PORT_HOTPLUG(HPD_PORT_A);
> -			}
> -			if (intel_vgpu_has_monitor_on_port(vgpu, PORT_B)) {
> +					~GEN8_DE_PORT_HOTPLUG(HPD_PORT_B);
>  				vgpu_vreg_t(vgpu, SFUSE_STRAP) &=3D
>  					~SFUSE_STRAP_DDIB_DETECTED;
> -				vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) &=3D
> -					~GEN8_DE_PORT_HOTPLUG(HPD_PORT_B);
>  			}
> -			if (intel_vgpu_has_monitor_on_port(vgpu, PORT_C)) {
> -				vgpu_vreg_t(vgpu, SFUSE_STRAP) &=3D
> -					~SFUSE_STRAP_DDIC_DETECTED;
> +			vgpu_vreg_t(vgpu, GEN8_DE_PORT_IIR) |=3D
> +				GEN8_DE_PORT_HOTPLUG(HPD_PORT_B);
> +			vgpu_vreg_t(vgpu, PCH_PORT_HOTPLUG) &=3D
> +				~PORTB_HOTPLUG_STATUS_MASK;
> +			vgpu_vreg_t(vgpu, PCH_PORT_HOTPLUG) |=3D
> +				PORTB_HOTPLUG_LONG_DETECT;
> +			intel_vgpu_trigger_virtual_event(vgpu, DP_B_HOTPLUG);
> +		}
> +		if (intel_vgpu_has_monitor_on_port(vgpu, PORT_C)) {
> +			if (connected) {
> +				vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) |=3D
> +					GEN8_DE_PORT_HOTPLUG(HPD_PORT_C);
> +				vgpu_vreg_t(vgpu, SFUSE_STRAP) |=3D
> +					SFUSE_STRAP_DDIC_DETECTED;
> +			} else {
>  				vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) &=3D
>  					~GEN8_DE_PORT_HOTPLUG(HPD_PORT_C);
> +				vgpu_vreg_t(vgpu, SFUSE_STRAP) &=3D
> +					~SFUSE_STRAP_DDIC_DETECTED;
>  			}
> +			vgpu_vreg_t(vgpu, GEN8_DE_PORT_IIR) |=3D
> +				GEN8_DE_PORT_HOTPLUG(HPD_PORT_C);
> +			vgpu_vreg_t(vgpu, PCH_PORT_HOTPLUG) &=3D
> +				~PORTC_HOTPLUG_STATUS_MASK;
> +			vgpu_vreg_t(vgpu, PCH_PORT_HOTPLUG) |=3D
> +				PORTC_HOTPLUG_LONG_DETECT;
> +			intel_vgpu_trigger_virtual_event(vgpu, DP_C_HOTPLUG);
>  		}
> -		vgpu_vreg_t(vgpu, PCH_PORT_HOTPLUG) |=3D
> -			PORTB_HOTPLUG_STATUS_MASK;
> -		intel_vgpu_trigger_virtual_event(vgpu, DP_B_HOTPLUG);
>  	}
>  }
> =20
> diff --git a/drivers/gpu/drm/i915/gvt/vgpu.c b/drivers/gpu/drm/i915/gvt/v=
gpu.c
> index e49944fde333..cbe5931906e0 100644
> --- a/drivers/gpu/drm/i915/gvt/vgpu.c
> +++ b/drivers/gpu/drm/i915/gvt/vgpu.c
> @@ -437,10 +437,9 @@ static struct intel_vgpu *__intel_gvt_create_vgpu(st=
ruct intel_gvt *gvt,
>  	if (ret)
>  		goto out_clean_sched_policy;
> =20
> -	if (IS_BROADWELL(dev_priv))
> +	if (IS_BROADWELL(dev_priv) || IS_BROXTON(dev_priv))
>  		ret =3D intel_gvt_hypervisor_set_edid(vgpu, PORT_B);
> -	/* FixMe: Re-enable APL/BXT once vfio_edid enabled */
> -	else if (!IS_BROXTON(dev_priv))
> +	else
>  		ret =3D intel_gvt_hypervisor_set_edid(vgpu, PORT_D);
>  	if (ret)
>  		goto out_clean_sched_policy;
> --=20
> 2.29.2
>=20
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--=20

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--dMyqICaxQaaUjrCL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCX8XWKQAKCRCxBBozTXgY
J1KEAKCaUxDcAAZyTZAqG6cGTnKPgp+eYQCdG1ijb4AC+v4X2ek/yVynPKm+33M=
=5yhq
-----END PGP SIGNATURE-----

--dMyqICaxQaaUjrCL--

--===============0509541056==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0509541056==--
