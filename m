Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0AE3340BC
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  4 Jun 2019 09:53:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C45A89791;
	Tue,  4 Jun 2019 07:53:31 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B98F89791
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  4 Jun 2019 07:53:30 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Jun 2019 00:53:29 -0700
X-ExtLoop1: 1
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by fmsmga001.fm.intel.com with ESMTP; 04 Jun 2019 00:53:28 -0700
Date: Tue, 4 Jun 2019 15:51:56 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Colin Xu <colin.xu@intel.com>
Subject: Re: [PATCH] drm/i915/gvt: Set up-limit of BB size to 2GB.
Message-ID: <20190604075156.GQ9684@zhen-hp.sh.intel.com>
References: <20190603064744.7298-1-colin.xu@intel.com>
MIME-Version: 1.0
In-Reply-To: <20190603064744.7298-1-colin.xu@intel.com>
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
Content-Type: multipart/mixed; boundary="===============0948139940=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0948139940==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="w1A23YewkF9s+fLd"
Content-Disposition: inline


--w1A23YewkF9s+fLd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.06.03 14:47:44 +0800, Colin Xu wrote:
> Set default maximum batch buffer size to 2GB to prevent overflow.
>=20
> Signed-off-by: Colin Xu <colin.xu@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/cmd_parser.c | 6 ++++++
>  drivers/gpu/drm/i915/gvt/gvt.h        | 2 ++
>  2 files changed, 8 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i915=
/gvt/cmd_parser.c
> index 7c7b711942cd..02cedb34b859 100644
> --- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
> +++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
> @@ -1710,6 +1710,12 @@ static int find_bb_size(struct parser_exec_state *=
s, unsigned long *bb_size)
>  		}
>  		cmd_len =3D get_cmd_length(info, cmd) << 2;
>  		*bb_size +=3D cmd_len;
> +		if (*bb_size > INTEL_GVT_MAX_BB_LENGTH_DEFAULT) {
> +			gvt_vgpu_err("BB len exceeds max limit 0x%llx\n",
> +				     INTEL_GVT_MAX_BB_LENGTH_DEFAULT);
> +			*bb_size =3D 0;
> +			return -EOVERFLOW;
> +		}
>  		gma +=3D cmd_len;
>  	} while (!bb_end);
> =20
> diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gv=
t.h
> index b54f2bdc13a4..a5e3ec97993b 100644
> --- a/drivers/gpu/drm/i915/gvt/gvt.h
> +++ b/drivers/gpu/drm/i915/gvt/gvt.h
> @@ -231,6 +231,8 @@ struct intel_vgpu {
>  	u32 scan_nonprivbb;
>  };
> =20
> +#define INTEL_GVT_MAX_BB_LENGTH_DEFAULT	0x80000000
> +

Could we use more readable form e.g GB(2)?

>  /* validating GM healthy status*/
>  #define vgpu_is_vm_unhealthy(ret_val) \
>  	(((ret_val) =3D=3D -EBADRQC) || ((ret_val) =3D=3D -EFAULT))
> --=20
> 2.21.0
>=20
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--w1A23YewkF9s+fLd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXPYjHAAKCRCxBBozTXgY
J9wEAJ9tp8uwQPa1qrMiNlW8WJdAXPCuRwCeN9Yv3N0bDZEa/jOITgyamOszO4I=
=5Zn/
-----END PGP SIGNATURE-----

--w1A23YewkF9s+fLd--

--===============0948139940==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============0948139940==--
