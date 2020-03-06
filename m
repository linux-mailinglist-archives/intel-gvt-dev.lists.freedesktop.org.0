Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A84E17B3C2
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  6 Mar 2020 02:29:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01A3C6EC4C;
	Fri,  6 Mar 2020 01:29:22 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 045186EC4C
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  6 Mar 2020 01:29:20 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Mar 2020 17:29:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,520,1574150400"; 
 d="asc'?scan'208";a="413729573"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by orsmga005.jf.intel.com with ESMTP; 05 Mar 2020 17:29:18 -0800
Date: Fri, 6 Mar 2020 09:17:03 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Tina Zhang <tina.zhang@intel.com>
Subject: Re: [PATCH v2] drm/i915/gvt: Fix display port type issue.
Message-ID: <20200306011703.GP28483@zhen-hp.sh.intel.com>
References: <20200305131600.29640-1-tina.zhang@intel.com>
 <20200305131600.29640-2-tina.zhang@intel.com>
MIME-Version: 1.0
In-Reply-To: <20200305131600.29640-2-tina.zhang@intel.com>
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
Content-Type: multipart/mixed; boundary="===============0582267126=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0582267126==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pFpMklMRdxwSC3Yi"
Content-Disposition: inline


--pFpMklMRdxwSC3Yi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.03.05 21:16:00 +0800, Tina Zhang wrote:
> According to the vbt provided by GVT-g, the display output type should
> be display port, instead of DVI. Currently, GVT-g display model only
> supports display port emulation, not DVI or HDMI. This patch fixes this
> by telling guest i915 the right output type supported by GVT-g.
>=20
> v2: refine the commit message. (Zhenyu)
>=20
> Signed-off-by: Tina Zhang <tina.zhang@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/display.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/display.c b/drivers/gpu/drm/i915/gv=
t/display.c
> index 14e139e66e45..86dc80405977 100644
> --- a/drivers/gpu/drm/i915/gvt/display.c
> +++ b/drivers/gpu/drm/i915/gvt/display.c
> @@ -261,7 +261,7 @@ static void emulate_monitor_status_change(struct inte=
l_vgpu *vgpu)
>  			~(TRANS_DDI_BPC_MASK | TRANS_DDI_MODE_SELECT_MASK |
>  			TRANS_DDI_PORT_MASK);
>  		vgpu_vreg_t(vgpu, TRANS_DDI_FUNC_CTL(TRANSCODER_A)) |=3D
> -			(TRANS_DDI_BPC_8 | TRANS_DDI_MODE_SELECT_DVI |
> +			(TRANS_DDI_BPC_8 | TRANS_DDI_MODE_SELECT_DP_SST |

Why does this only change for one port? what about others?

>  			(PORT_D << TRANS_DDI_PORT_SHIFT) |
>  			TRANS_DDI_FUNC_ENABLE);
>  		if (IS_BROADWELL(dev_priv)) {
> --=20
> 2.17.1
>=20


--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--pFpMklMRdxwSC3Yi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXmGkjwAKCRCxBBozTXgY
JzrUAJ9yNFB/cC4nD4qt0zUcdC8zA78PBwCfYZlgkebCwqxOxiDMzoHrlMK5jo4=
=u5LC
-----END PGP SIGNATURE-----

--pFpMklMRdxwSC3Yi--

--===============0582267126==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0582267126==--
