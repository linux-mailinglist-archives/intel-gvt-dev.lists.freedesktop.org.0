Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D7A18C644
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 20 Mar 2020 05:08:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48D856EA2F;
	Fri, 20 Mar 2020 04:08:40 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54EB16EA2F
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 20 Mar 2020 04:08:38 +0000 (UTC)
IronPort-SDR: K0cOCn8fm8vPJu/cm51y0DQzXt0SKftS4LvdtlIny0a8ff5SP+PaBHovOBzIe9NZKk2kt2wMfS
 lRg4vGeEHmNQ==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2020 21:08:37 -0700
IronPort-SDR: 6zaYWSv6ZrqT3BVj1p/e6XcewoQOPh4diT2Ezi1FQW0jzQQZMM/ce34a9P0Jn8JzbhMtwGGuNj
 qoz8/X4S60kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,283,1580803200"; 
 d="asc'?scan'208";a="248755070"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by orsmga006.jf.intel.com with ESMTP; 19 Mar 2020 21:08:36 -0700
Date: Fri, 20 Mar 2020 11:55:50 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Tina Zhang <tina.zhang@intel.com>
Subject: Re: [PATCH] drm/i915/gvt: Set defaults to transcoder mn reg
Message-ID: <20200320035550.GC8880@zhen-hp.sh.intel.com>
References: <20200320030249.5759-1-tina.zhang@intel.com>
MIME-Version: 1.0
In-Reply-To: <20200320030249.5759-1-tina.zhang@intel.com>
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
Content-Type: multipart/mixed; boundary="===============0942478621=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0942478621==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ngiTnHdmUEG79yp6"
Content-Disposition: inline


--ngiTnHdmUEG79yp6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.03.20 11:02:49 +0800, Tina Zhang wrote:
> GVT-g provides guest with dp type connectors and does the dp emulations.
> For crtc timing, GVT-g just copys the parameters from host, which is fine
> when host has dp type connectors as the vgpu's crtc timing never goes to
> hardware and the reasonable data got by guest is mostly for the sanity
> checking and clock related calculating.
>=20
> But when host doesn't have any dp ports, GVT-g may get invalid data from =
dp
> related timing registers on host. And those invalid data cannot let guest
> pass the sanity checking.
>=20
> So, solve the issue by providing reasonable defauts for the transcoder mn
> registers no matter whether host has or has not dp type connectors.
>=20
> Signed-off-by: Tina Zhang <tina.zhang@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/display.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/display.c b/drivers/gpu/drm/i915/gv=
t/display.c
> index a83df2f84eb9..44185cda0905 100644
> --- a/drivers/gpu/drm/i915/gvt/display.c
> +++ b/drivers/gpu/drm/i915/gvt/display.c
> @@ -167,6 +167,17 @@ static u8 dpcd_fix_data[DPCD_HEADER_SIZE] =3D {
>  	0x12, 0x014, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
>  };
> =20
> +/* Set defaults to transcoder nm registers to gererate reasonable crtc c=
lock */
> +#define PIPE_MN_REG_NUM	0x4
> +
> +static u32 trans_m_n[4] =3D {
> +	/*
> +	 * PIPE_LINK_M1, PIPE_LINK_N1, PIPE_DATA_M1, PIPE_DATA_N1
> +	 * generate crtc.clock =3D 89099 kHz
> +	 */
> +	0x46666, 0x80000, 0x7e34cccc, 0x800000

I can't remember clearly, but is this clock related to our virtual EDID mode
timing? Would that be different for different mode? e.g If we want to exten=
d for
4k resolution, does this need to be changed as well?

> +};
> +
>  static void emulate_monitor_status_change(struct intel_vgpu *vgpu)
>  {
>  	struct drm_i915_private *dev_priv =3D vgpu->gvt->gt->i915;
> @@ -233,6 +244,10 @@ static void emulate_monitor_status_change(struct int=
el_vgpu *vgpu)
>  		vgpu_vreg_t(vgpu, DDI_BUF_CTL(PORT_B)) |=3D DDI_BUF_CTL_ENABLE;
>  		vgpu_vreg_t(vgpu, DDI_BUF_CTL(PORT_B)) &=3D ~DDI_BUF_IS_IDLE;
>  		vgpu_vreg_t(vgpu, SDEISR) |=3D SDE_PORTB_HOTPLUG_CPT;
> +		vgpu_vreg_t(vgpu, PIPE_LINK_M1(TRANSCODER_A)) =3D trans_m_n[0];
> +		vgpu_vreg_t(vgpu, PIPE_LINK_N1(TRANSCODER_A)) =3D trans_m_n[1];
> +		vgpu_vreg_t(vgpu, PIPE_DATA_M1(TRANSCODER_A)) =3D trans_m_n[2];
> +		vgpu_vreg_t(vgpu, PIPE_DATA_N1(TRANSCODER_A)) =3D trans_m_n[3];
>  	}
> =20
>  	if (intel_vgpu_has_monitor_on_port(vgpu, PORT_C)) {
> @@ -253,6 +268,10 @@ static void emulate_monitor_status_change(struct int=
el_vgpu *vgpu)
>  		vgpu_vreg_t(vgpu, DDI_BUF_CTL(PORT_C)) |=3D DDI_BUF_CTL_ENABLE;
>  		vgpu_vreg_t(vgpu, DDI_BUF_CTL(PORT_C)) &=3D ~DDI_BUF_IS_IDLE;
>  		vgpu_vreg_t(vgpu, SFUSE_STRAP) |=3D SFUSE_STRAP_DDIC_DETECTED;
> +		vgpu_vreg_t(vgpu, PIPE_LINK_M1(TRANSCODER_A)) =3D trans_m_n[0];
> +		vgpu_vreg_t(vgpu, PIPE_LINK_N1(TRANSCODER_A)) =3D trans_m_n[1];
> +		vgpu_vreg_t(vgpu, PIPE_DATA_M1(TRANSCODER_A)) =3D trans_m_n[2];
> +		vgpu_vreg_t(vgpu, PIPE_DATA_N1(TRANSCODER_A)) =3D trans_m_n[3];
>  	}
> =20
>  	if (intel_vgpu_has_monitor_on_port(vgpu, PORT_D)) {
> @@ -273,6 +292,10 @@ static void emulate_monitor_status_change(struct int=
el_vgpu *vgpu)
>  		vgpu_vreg_t(vgpu, DDI_BUF_CTL(PORT_D)) |=3D DDI_BUF_CTL_ENABLE;
>  		vgpu_vreg_t(vgpu, DDI_BUF_CTL(PORT_D)) &=3D ~DDI_BUF_IS_IDLE;
>  		vgpu_vreg_t(vgpu, SFUSE_STRAP) |=3D SFUSE_STRAP_DDID_DETECTED;
> +		vgpu_vreg_t(vgpu, PIPE_LINK_M1(TRANSCODER_A)) =3D trans_m_n[0];
> +		vgpu_vreg_t(vgpu, PIPE_LINK_N1(TRANSCODER_A)) =3D trans_m_n[1];
> +		vgpu_vreg_t(vgpu, PIPE_DATA_M1(TRANSCODER_A)) =3D trans_m_n[2];
> +		vgpu_vreg_t(vgpu, PIPE_DATA_N1(TRANSCODER_A)) =3D trans_m_n[3];
>  	}
> =20
>  	if ((IS_SKYLAKE(dev_priv) || IS_KABYLAKE(dev_priv) ||
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

--ngiTnHdmUEG79yp6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXnQ+xgAKCRCxBBozTXgY
JwaqAJ0d8xy9f5blZ30csNHdQ2rGzgiQKACgjj5NDA6tMyhtHJo7bVpHJBBcWM4=
=bjYs
-----END PGP SIGNATURE-----

--ngiTnHdmUEG79yp6--

--===============0942478621==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0942478621==--
