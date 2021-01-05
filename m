Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C306E2EA658
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  5 Jan 2021 09:13:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42CFB6E054;
	Tue,  5 Jan 2021 08:13:58 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ABDE6E054
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  5 Jan 2021 08:13:56 +0000 (UTC)
IronPort-SDR: +WAP/NBmq2RfKMjoNpBL5IM7uVpSTkUZHo5ONYTFhiL7IZSq2p8LW615pEDMUxhyQCJpmXi1He
 j5/FDa83g1BQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9854"; a="173560570"
X-IronPort-AV: E=Sophos;i="5.78,476,1599548400"; 
 d="asc'?scan'208";a="173560570"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2021 00:13:56 -0800
IronPort-SDR: jOQiMh8q8sRuaZQSoSGfbtsZbS5ERoxasKdGuSrYZ1ffAUEQPpnCUjpRAE9yYuznEWqt9tTBBK
 I2afnsXzAzTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,476,1599548400"; 
 d="asc'?scan'208";a="402256897"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by FMSMGA003.fm.intel.com with ESMTP; 05 Jan 2021 00:13:55 -0800
Date: Tue, 5 Jan 2021 15:57:35 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Colin Xu <Colin.Xu@intel.com>
Subject: Re: [PATCH V2] drm/i915/gvt: Fix vfio_edid issue for BXT/APL
Message-ID: <20210105075735.GW16939@zhen-hp.sh.intel.com>
References: <20201201060329.142375-1-colin.xu@intel.com>
 <d73213b0-2ccf-d1a7-b89f-c96d8f95ea60@intel.com>
MIME-Version: 1.0
In-Reply-To: <d73213b0-2ccf-d1a7-b89f-c96d8f95ea60@intel.com>
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
Content-Type: multipart/mixed; boundary="===============1971363571=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1971363571==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vuDFP+lnL2KW5uet"
Content-Disposition: inline


--vuDFP+lnL2KW5uet
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.12.30 18:01:48 +0800, Colin Xu wrote:
> Ping. Seems we missed this reviewed patch in gvt-staging.
>

Sorry looks I missed this one, will push for -fixes.
And pls carry any previous r-b for new sendings.

> On 12/1/20 2:03 PM, Colin Xu wrote:
> > BXT/APL has different isr/irr/hpd regs compared with other GEN9. If not
> > setting these regs bits correctly according to the emulated monitor
> > (currently a DP on PORT_B), although gvt still triggers a virtual HPD
> > event, the guest driver won't detect a valid HPD pulse thus no full
> > display detection will be executed to read the updated EDID.
> >=20
> > With this patch, the vfio_edid is enabled again on BXT/APL, which is
> > previously disabled:
> > Fixes: 642403e3599e (drm/i915/gvt: Temporarily disable vfio_edid for BX=
T/APL)
> >=20
> > V2:
> > Use Fixes tag.
> >=20
> > Signed-off-by: Colin Xu <colin.xu@intel.com>
> > ---
> >   drivers/gpu/drm/i915/gvt/display.c | 81 +++++++++++++++++++++---------
> >   drivers/gpu/drm/i915/gvt/vgpu.c    |  5 +-
> >   2 files changed, 59 insertions(+), 27 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/i915/gvt/display.c b/drivers/gpu/drm/i915/=
gvt/display.c
> > index a15f87539657..62a5b0dd2003 100644
> > --- a/drivers/gpu/drm/i915/gvt/display.c
> > +++ b/drivers/gpu/drm/i915/gvt/display.c
> > @@ -217,6 +217,15 @@ static void emulate_monitor_status_change(struct i=
ntel_vgpu *vgpu)
> >   				  DDI_BUF_CTL_ENABLE);
> >   			vgpu_vreg_t(vgpu, DDI_BUF_CTL(port)) |=3D DDI_BUF_IS_IDLE;
> >   		}
> > +		vgpu_vreg_t(vgpu, PCH_PORT_HOTPLUG) &=3D
> > +			~(PORTA_HOTPLUG_ENABLE | PORTA_HOTPLUG_STATUS_MASK);
> > +		vgpu_vreg_t(vgpu, PCH_PORT_HOTPLUG) &=3D
> > +			~(PORTB_HOTPLUG_ENABLE | PORTB_HOTPLUG_STATUS_MASK);
> > +		vgpu_vreg_t(vgpu, PCH_PORT_HOTPLUG) &=3D
> > +			~(PORTC_HOTPLUG_ENABLE | PORTC_HOTPLUG_STATUS_MASK);
> > +		/* No hpd_invert set in vgpu vbt, need to clear invert mask */
> > +		vgpu_vreg_t(vgpu, PCH_PORT_HOTPLUG) &=3D ~BXT_DDI_HPD_INVERT_MASK;
> > +		vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) &=3D ~BXT_DE_PORT_HOTPLUG_MASK;
> >   		vgpu_vreg_t(vgpu, BXT_P_CR_GT_DISP_PWRON) &=3D ~(BIT(0) | BIT(1));
> >   		vgpu_vreg_t(vgpu, BXT_PORT_CL1CM_DW0(DPIO_PHY0)) &=3D
> > @@ -273,6 +282,8 @@ static void emulate_monitor_status_change(struct in=
tel_vgpu *vgpu)
> >   			vgpu_vreg_t(vgpu, TRANS_DDI_FUNC_CTL(TRANSCODER_EDP)) |=3D
> >   				(TRANS_DDI_BPC_8 | TRANS_DDI_MODE_SELECT_DP_SST |
> >   				 TRANS_DDI_FUNC_ENABLE);
> > +			vgpu_vreg_t(vgpu, PCH_PORT_HOTPLUG) |=3D
> > +				PORTA_HOTPLUG_ENABLE;
> >   			vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) |=3D
> >   				GEN8_DE_PORT_HOTPLUG(HPD_PORT_A);
> >   		}
> > @@ -301,6 +312,8 @@ static void emulate_monitor_status_change(struct in=
tel_vgpu *vgpu)
> >   				(TRANS_DDI_BPC_8 | TRANS_DDI_MODE_SELECT_DP_SST |
> >   				 (PORT_B << TRANS_DDI_PORT_SHIFT) |
> >   				 TRANS_DDI_FUNC_ENABLE);
> > +			vgpu_vreg_t(vgpu, PCH_PORT_HOTPLUG) |=3D
> > +				PORTB_HOTPLUG_ENABLE;
> >   			vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) |=3D
> >   				GEN8_DE_PORT_HOTPLUG(HPD_PORT_B);
> >   		}
> > @@ -329,6 +342,8 @@ static void emulate_monitor_status_change(struct in=
tel_vgpu *vgpu)
> >   				(TRANS_DDI_BPC_8 | TRANS_DDI_MODE_SELECT_DP_SST |
> >   				 (PORT_B << TRANS_DDI_PORT_SHIFT) |
> >   				 TRANS_DDI_FUNC_ENABLE);
> > +			vgpu_vreg_t(vgpu, PCH_PORT_HOTPLUG) |=3D
> > +				PORTC_HOTPLUG_ENABLE;
> >   			vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) |=3D
> >   				GEN8_DE_PORT_HOTPLUG(HPD_PORT_C);
> >   		}
> > @@ -661,44 +676,62 @@ void intel_vgpu_emulate_hotplug(struct intel_vgpu=
 *vgpu, bool connected)
> >   				PORTD_HOTPLUG_STATUS_MASK;
> >   		intel_vgpu_trigger_virtual_event(vgpu, DP_D_HOTPLUG);
> >   	} else if (IS_BROXTON(i915)) {
> > -		if (connected) {
> > -			if (intel_vgpu_has_monitor_on_port(vgpu, PORT_A)) {
> > +		if (intel_vgpu_has_monitor_on_port(vgpu, PORT_A)) {
> > +			if (connected) {
> >   				vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) |=3D
> >   					GEN8_DE_PORT_HOTPLUG(HPD_PORT_A);
> > +			} else {
> > +				vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) &=3D
> > +					~GEN8_DE_PORT_HOTPLUG(HPD_PORT_A);
> >   			}
> > -			if (intel_vgpu_has_monitor_on_port(vgpu, PORT_B)) {
> > -				vgpu_vreg_t(vgpu, SFUSE_STRAP) |=3D
> > -					SFUSE_STRAP_DDIB_DETECTED;
> > +			vgpu_vreg_t(vgpu, GEN8_DE_PORT_IIR) |=3D
> > +				GEN8_DE_PORT_HOTPLUG(HPD_PORT_A);
> > +			vgpu_vreg_t(vgpu, PCH_PORT_HOTPLUG) &=3D
> > +				~PORTA_HOTPLUG_STATUS_MASK;
> > +			vgpu_vreg_t(vgpu, PCH_PORT_HOTPLUG) |=3D
> > +				PORTA_HOTPLUG_LONG_DETECT;
> > +			intel_vgpu_trigger_virtual_event(vgpu, DP_A_HOTPLUG);
> > +		}
> > +		if (intel_vgpu_has_monitor_on_port(vgpu, PORT_B)) {
> > +			if (connected) {
> >   				vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) |=3D
> >   					GEN8_DE_PORT_HOTPLUG(HPD_PORT_B);
> > -			}
> > -			if (intel_vgpu_has_monitor_on_port(vgpu, PORT_C)) {
> >   				vgpu_vreg_t(vgpu, SFUSE_STRAP) |=3D
> > -					SFUSE_STRAP_DDIC_DETECTED;
> > -				vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) |=3D
> > -					GEN8_DE_PORT_HOTPLUG(HPD_PORT_C);
> > -			}
> > -		} else {
> > -			if (intel_vgpu_has_monitor_on_port(vgpu, PORT_A)) {
> > +					SFUSE_STRAP_DDIB_DETECTED;
> > +			} else {
> >   				vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) &=3D
> > -					~GEN8_DE_PORT_HOTPLUG(HPD_PORT_A);
> > -			}
> > -			if (intel_vgpu_has_monitor_on_port(vgpu, PORT_B)) {
> > +					~GEN8_DE_PORT_HOTPLUG(HPD_PORT_B);
> >   				vgpu_vreg_t(vgpu, SFUSE_STRAP) &=3D
> >   					~SFUSE_STRAP_DDIB_DETECTED;
> > -				vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) &=3D
> > -					~GEN8_DE_PORT_HOTPLUG(HPD_PORT_B);
> >   			}
> > -			if (intel_vgpu_has_monitor_on_port(vgpu, PORT_C)) {
> > -				vgpu_vreg_t(vgpu, SFUSE_STRAP) &=3D
> > -					~SFUSE_STRAP_DDIC_DETECTED;
> > +			vgpu_vreg_t(vgpu, GEN8_DE_PORT_IIR) |=3D
> > +				GEN8_DE_PORT_HOTPLUG(HPD_PORT_B);
> > +			vgpu_vreg_t(vgpu, PCH_PORT_HOTPLUG) &=3D
> > +				~PORTB_HOTPLUG_STATUS_MASK;
> > +			vgpu_vreg_t(vgpu, PCH_PORT_HOTPLUG) |=3D
> > +				PORTB_HOTPLUG_LONG_DETECT;
> > +			intel_vgpu_trigger_virtual_event(vgpu, DP_B_HOTPLUG);
> > +		}
> > +		if (intel_vgpu_has_monitor_on_port(vgpu, PORT_C)) {
> > +			if (connected) {
> > +				vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) |=3D
> > +					GEN8_DE_PORT_HOTPLUG(HPD_PORT_C);
> > +				vgpu_vreg_t(vgpu, SFUSE_STRAP) |=3D
> > +					SFUSE_STRAP_DDIC_DETECTED;
> > +			} else {
> >   				vgpu_vreg_t(vgpu, GEN8_DE_PORT_ISR) &=3D
> >   					~GEN8_DE_PORT_HOTPLUG(HPD_PORT_C);
> > +				vgpu_vreg_t(vgpu, SFUSE_STRAP) &=3D
> > +					~SFUSE_STRAP_DDIC_DETECTED;
> >   			}
> > +			vgpu_vreg_t(vgpu, GEN8_DE_PORT_IIR) |=3D
> > +				GEN8_DE_PORT_HOTPLUG(HPD_PORT_C);
> > +			vgpu_vreg_t(vgpu, PCH_PORT_HOTPLUG) &=3D
> > +				~PORTC_HOTPLUG_STATUS_MASK;
> > +			vgpu_vreg_t(vgpu, PCH_PORT_HOTPLUG) |=3D
> > +				PORTC_HOTPLUG_LONG_DETECT;
> > +			intel_vgpu_trigger_virtual_event(vgpu, DP_C_HOTPLUG);
> >   		}
> > -		vgpu_vreg_t(vgpu, PCH_PORT_HOTPLUG) |=3D
> > -			PORTB_HOTPLUG_STATUS_MASK;
> > -		intel_vgpu_trigger_virtual_event(vgpu, DP_B_HOTPLUG);
> >   	}
> >   }
> > diff --git a/drivers/gpu/drm/i915/gvt/vgpu.c b/drivers/gpu/drm/i915/gvt=
/vgpu.c
> > index e49944fde333..cbe5931906e0 100644
> > --- a/drivers/gpu/drm/i915/gvt/vgpu.c
> > +++ b/drivers/gpu/drm/i915/gvt/vgpu.c
> > @@ -437,10 +437,9 @@ static struct intel_vgpu *__intel_gvt_create_vgpu(=
struct intel_gvt *gvt,
> >   	if (ret)
> >   		goto out_clean_sched_policy;
> > -	if (IS_BROADWELL(dev_priv))
> > +	if (IS_BROADWELL(dev_priv) || IS_BROXTON(dev_priv))
> >   		ret =3D intel_gvt_hypervisor_set_edid(vgpu, PORT_B);
> > -	/* FixMe: Re-enable APL/BXT once vfio_edid enabled */
> > -	else if (!IS_BROXTON(dev_priv))
> > +	else
> >   		ret =3D intel_gvt_hypervisor_set_edid(vgpu, PORT_D);
> >   	if (ret)
> >   		goto out_clean_sched_policy;
>=20
> --=20
> Best Regards,
> Colin Xu
>=20
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--=20

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--vuDFP+lnL2KW5uet
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCX/Qb7wAKCRCxBBozTXgY
J2mBAJ0RVQ95Fk4kz+QxJ0Z775gnn6IGDQCeJBB2sSPlXUUF7t9lzZmm8rKFbFU=
=yzv1
-----END PGP SIGNATURE-----

--vuDFP+lnL2KW5uet--

--===============1971363571==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============1971363571==--
