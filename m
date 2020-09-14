Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CDD268499
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 14 Sep 2020 08:13:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69AF96E152;
	Mon, 14 Sep 2020 06:13:30 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 009BE6E152
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 14 Sep 2020 06:13:28 +0000 (UTC)
IronPort-SDR: L9IjQZp+W4I3GH/demEysxmVfB41p2ZGliF89acPFr4Jgv0kuP2bJoinkFgN+WSsU7bCAb5CpO
 yO/v5C3trMSg==
X-IronPort-AV: E=McAfee;i="6000,8403,9743"; a="243860609"
X-IronPort-AV: E=Sophos;i="5.76,425,1592895600"; 
 d="asc'?scan'208";a="243860609"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2020 23:13:28 -0700
IronPort-SDR: hrmVC2v3d+8eYun/dLxB7JF161jbMgjBEKszrBq0HEvW1kQGAyqNmuKS76kytGNXioAjAeu7my
 qBoYP5XjxF7w==
X-IronPort-AV: E=Sophos;i="5.76,425,1592895600"; 
 d="asc'?scan'208";a="450749404"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2020 23:13:26 -0700
Date: Mon, 14 Sep 2020 13:53:59 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Colin Xu <colin.xu@intel.com>
Subject: Re: [PATCH V3] drm/i915/gvt: Allow zero out HWSP addr on hws_pga_write
Message-ID: <20200914055359.GA28614@zhen-hp.sh.intel.com>
References: <20200911065239.147789-1-colin.xu@intel.com>
MIME-Version: 1.0
In-Reply-To: <20200911065239.147789-1-colin.xu@intel.com>
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
Cc: intel-gvt-dev@lists.freedesktop.org, zhenyuw@linux.intel.com
Content-Type: multipart/mixed; boundary="===============1096425663=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1096425663==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DesjdUuHQDwS2t4N"
Content-Disposition: inline


--DesjdUuHQDwS2t4N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.09.11 14:52:39 +0800, Colin Xu wrote:
> Guest driver may reset HWSP to 0 as init value during D3->D0:
> The full sequence is:
>  - Boot ->D0
>  - Update HWSP
>  - D0->D3
>  - ...In D3 state...
>  - D3->D0
>  - DMLR reset.
>  - Set engine HWSP to 0.
>  - Set engine ring mode to 0.
>  - Set engine HWSP to correct value.
>  - Set engine ring mode to correct value.
> Ring mode is masked register so set 0 won't take effect.
> However HWPS addr 0 is considered as invalid GGTT address which will
> report error like:
> gvt: vgpu 1: write invalid HWSP address, reg:0x2080, value:0x0
> gvt: vgpu 1: fail to emulate MMIO write 00002080 len 4
> Detected your guest driver doesn't support GVT-g.
> Now vgpu 2 will enter failsafe mode.
>=20
> Zero out HWSP addr is considered as a valid setting from device driver
> so don't treat it as invalid HWSP addr.
>=20
> V2:
> Treat HWSP addr 0 as valid. (zhenyu)
>=20
> V3:
> Change patch title.
>=20
> Signed-off-by: Colin Xu <colin.xu@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/handlers.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/g=
vt/handlers.c
> index 3be37e6fe33d..809429a35ec2 100644
> --- a/drivers/gpu/drm/i915/gvt/handlers.c
> +++ b/drivers/gpu/drm/i915/gvt/handlers.c
> @@ -1489,7 +1489,8 @@ static int hws_pga_write(struct intel_vgpu *vgpu, u=
nsigned int offset,
>  	const struct intel_engine_cs *engine =3D
>  		intel_gvt_render_mmio_to_engine(vgpu->gvt, offset);
> =20
> -	if (!intel_gvt_ggtt_validate_range(vgpu, value, I915_GTT_PAGE_SIZE)) {
> +	if (value !=3D 0 &&
> +	    !intel_gvt_ggtt_validate_range(vgpu, value, I915_GTT_PAGE_SIZE)) {
>  		gvt_vgpu_err("write invalid HWSP address, reg:0x%x, value:0x%x\n",
>  			      offset, value);
>  		return -EINVAL;
> --=20

Good to me. Thanks!

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

--=20

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--DesjdUuHQDwS2t4N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCX18FdwAKCRCxBBozTXgY
J8bYAJ9gfRbWxvHE5Hdaou+uMrUpeLoFlQCfdEDJYp6Dv7zVBNrzfsea5vDUpLg=
=ugN+
-----END PGP SIGNATURE-----

--DesjdUuHQDwS2t4N--

--===============1096425663==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============1096425663==--
