Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33384187E3F
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 17 Mar 2020 11:26:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBD6389E3F;
	Tue, 17 Mar 2020 10:26:37 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AC2789C2C
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 17 Mar 2020 10:26:37 +0000 (UTC)
IronPort-SDR: xXzFc1YAM0SuIzsaGawFNFDltoTdV4YI17FWrE2otzxzKEnJhgYCGqRHI9bENXl2bN29VeAKZ8
 CVLaVmFHbthA==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2020 03:26:36 -0700
IronPort-SDR: mlzuPCbE6jnDOzeiqeLsF/QHWYzbRGgVjui1lrASP5/8WzQVuKpsBm+Ww5CJtitrRp7DSMutWw
 1NJBDOdtkQwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,564,1574150400"; 
 d="asc'?scan'208";a="290954383"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by FMSMGA003.fm.intel.com with ESMTP; 17 Mar 2020 03:26:35 -0700
Date: Tue, 17 Mar 2020 18:13:55 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Tina Zhang <tina.zhang@intel.com>
Subject: Re: [PATCH] drm/i915/gvt: Fix display port type issue
Message-ID: <20200317101355.GQ8880@zhen-hp.sh.intel.com>
References: <20200317093615.10538-1-tina.zhang@intel.com>
MIME-Version: 1.0
In-Reply-To: <20200317093615.10538-1-tina.zhang@intel.com>
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
Content-Type: multipart/mixed; boundary="===============0180983721=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0180983721==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="z9sQuz+HmDh2hVO4"
Content-Disposition: inline


--z9sQuz+HmDh2hVO4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.03.17 17:36:15 +0800, Tina Zhang wrote:
> According to the vbt provided by GVT-g, the display output type should
> be display port, instead of DVI. Currently, GVT-g display model only
> supports display port emulation, not DVI or HDMI. This patch fixes this
> by telling guest i915 the right output type supported by GVT-g.
>=20
> v3: make port_b and port_c use dp type connector too. (Zhenyu)
> v2: refine the commit message. (Zhenyu)
>

Good to me.

Acked-by: Zhenyu Wang <zhenyuw@linux.intel.com>

> Signed-off-by: Tina Zhang <tina.zhang@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/display.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/display.c b/drivers/gpu/drm/i915/gv=
t/display.c
> index 6e5c9885d9fe..a83df2f84eb9 100644
> --- a/drivers/gpu/drm/i915/gvt/display.c
> +++ b/drivers/gpu/drm/i915/gvt/display.c
> @@ -221,7 +221,7 @@ static void emulate_monitor_status_change(struct inte=
l_vgpu *vgpu)
>  			~(TRANS_DDI_BPC_MASK | TRANS_DDI_MODE_SELECT_MASK |
>  			TRANS_DDI_PORT_MASK);
>  		vgpu_vreg_t(vgpu, TRANS_DDI_FUNC_CTL(TRANSCODER_A)) |=3D
> -			(TRANS_DDI_BPC_8 | TRANS_DDI_MODE_SELECT_DVI |
> +			(TRANS_DDI_BPC_8 | TRANS_DDI_MODE_SELECT_DP_SST |
>  			(PORT_B << TRANS_DDI_PORT_SHIFT) |
>  			TRANS_DDI_FUNC_ENABLE);
>  		if (IS_BROADWELL(dev_priv)) {
> @@ -241,7 +241,7 @@ static void emulate_monitor_status_change(struct inte=
l_vgpu *vgpu)
>  			~(TRANS_DDI_BPC_MASK | TRANS_DDI_MODE_SELECT_MASK |
>  			TRANS_DDI_PORT_MASK);
>  		vgpu_vreg_t(vgpu, TRANS_DDI_FUNC_CTL(TRANSCODER_A)) |=3D
> -			(TRANS_DDI_BPC_8 | TRANS_DDI_MODE_SELECT_DVI |
> +			(TRANS_DDI_BPC_8 | TRANS_DDI_MODE_SELECT_DP_SST |
>  			(PORT_C << TRANS_DDI_PORT_SHIFT) |
>  			TRANS_DDI_FUNC_ENABLE);
>  		if (IS_BROADWELL(dev_priv)) {
> @@ -261,7 +261,7 @@ static void emulate_monitor_status_change(struct inte=
l_vgpu *vgpu)
>  			~(TRANS_DDI_BPC_MASK | TRANS_DDI_MODE_SELECT_MASK |
>  			TRANS_DDI_PORT_MASK);
>  		vgpu_vreg_t(vgpu, TRANS_DDI_FUNC_CTL(TRANSCODER_A)) |=3D
> -			(TRANS_DDI_BPC_8 | TRANS_DDI_MODE_SELECT_DVI |
> +			(TRANS_DDI_BPC_8 | TRANS_DDI_MODE_SELECT_DP_SST |
>  			(PORT_D << TRANS_DDI_PORT_SHIFT) |
>  			TRANS_DDI_FUNC_ENABLE);
>  		if (IS_BROADWELL(dev_priv)) {
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

--z9sQuz+HmDh2hVO4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXnCi4gAKCRCxBBozTXgY
JzokAJ0bed/LOKlCknaTTsfOQVJfopT19QCfYOu4ey1kqPDuWGXT6nTLqSZzlDQ=
=UnkW
-----END PGP SIGNATURE-----

--z9sQuz+HmDh2hVO4--

--===============0180983721==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0180983721==--
