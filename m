Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 921C310A97B
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 27 Nov 2019 05:54:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F6606E126;
	Wed, 27 Nov 2019 04:54:35 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C94F26E126
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 27 Nov 2019 04:54:33 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Nov 2019 20:54:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,248,1571727600"; 
 d="asc'?scan'208";a="206662232"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by fmsmga008.fm.intel.com with ESMTP; 26 Nov 2019 20:54:32 -0800
Date: Wed, 27 Nov 2019 12:53:29 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: "Gao, Fred" <fred.gao@intel.com>
Subject: Re: [PATCH v1] drm/i915/gvt: Fix guest boot warning
Message-ID: <20191127045329.GM4196@zhen-hp.sh.intel.com>
References: <20191126161904.25281-1-fred.gao@intel.com>
MIME-Version: 1.0
In-Reply-To: <20191126161904.25281-1-fred.gao@intel.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Content-Type: multipart/mixed; boundary="===============0202023742=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0202023742==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fGgPh72jpYMjtj0O"
Content-Disposition: inline


--fGgPh72jpYMjtj0O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.11.27 00:19:04 +0800, Gao, Fred wrote:
> Simulate MIA core in reset status once GUC engine is reset.
>=20
> Signed-off-by: Gao Fred <fred.gao@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/handlers.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/g=
vt/handlers.c
> index 3de664deb2f8..78f4d41b9005 100644
> --- a/drivers/gpu/drm/i915/gvt/handlers.c
> +++ b/drivers/gpu/drm/i915/gvt/handlers.c
> @@ -341,6 +341,11 @@ static int gdrst_mmio_write(struct intel_vgpu *vgpu,=
 unsigned int offset,
>  			gvt_dbg_mmio("vgpu%d: request VCS2 Reset\n", vgpu->id);
>  			engine_mask |=3D BIT(VCS1);
>  		}
> +		if (data & GEN9_GRDOM_GUC) {
> +			gvt_dbg_mmio("vgpu%d: request GUC Reset\n", vgpu->id);
> +			vgpu_vreg(vgpu, i915_mmio_reg_offset(GUC_STATUS))
> +				|=3D GS_MIA_IN_RESET;
> +		}

Can write as vgpu_vreg_t(vgpu, GUC_STATUS) =3D ...

Looks we can do this better in GUC_STATUS handler that we can clear
IN_RESET value after reading.


>  		engine_mask &=3D INTEL_INFO(vgpu->gvt->dev_priv)->engine_mask;
>  	}
> =20
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

--fGgPh72jpYMjtj0O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXd4BSQAKCRCxBBozTXgY
J0PxAJ9/fL4juqVAQqo40KWi3KubNy0G6ACff3fdjCEp71AugyeEHxGsKcX2nSw=
=0b7u
-----END PGP SIGNATURE-----

--fGgPh72jpYMjtj0O--

--===============0202023742==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============0202023742==--
