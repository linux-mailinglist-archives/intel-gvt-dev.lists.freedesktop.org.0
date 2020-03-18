Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DFA189554
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 18 Mar 2020 06:26:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82BD389B03;
	Wed, 18 Mar 2020 05:26:27 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDA1589B03
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 18 Mar 2020 05:26:25 +0000 (UTC)
IronPort-SDR: BGQX3ZxZ2sUNuy9vGf9uTmeba5oLGwzDba4qZ11W32/jxpFeAVEJ2I3scYCW8LE2zrKaLPLSWa
 jBBky1sQSZnA==
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2020 22:26:25 -0700
IronPort-SDR: zmFp6X7MLeZ6dWqegk58PP21vPtUO7amOyMbkdnGhb852zBqWoXgd3JtnLIZuv5nU4/LOroVZq
 pu8z73c4zLBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,566,1574150400"; 
 d="asc'?scan'208";a="263274010"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by orsmga002.jf.intel.com with ESMTP; 17 Mar 2020 22:26:24 -0700
Date: Wed, 18 Mar 2020 13:13:42 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Subject: Re: [PATCH] drm/i915/gvt: add support to command SWTESS_BASE_ADDRESS
Message-ID: <20200318051342.GS8880@zhen-hp.sh.intel.com>
References: <20200305055413.6833-1-yan.y.zhao@intel.com>
MIME-Version: 1.0
In-Reply-To: <20200305055413.6833-1-yan.y.zhao@intel.com>
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
Content-Type: multipart/mixed; boundary="===============0186409355=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0186409355==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aIbcA3MSwnGacr4f"
Content-Disposition: inline


--aIbcA3MSwnGacr4f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.03.05 00:54:13 -0500, Yan Zhao wrote:
> This cmd access is found on BDW.
>=20
> Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>

Acked-by: Zhenyu Wang <zhenyuw@linux.intel.com>

> ---
>  drivers/gpu/drm/i915/gvt/cmd_parser.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i915=
/gvt/cmd_parser.c
> index 151fea215e5c..e046878bd4d3 100644
> --- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
> +++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
> @@ -164,6 +164,7 @@ struct decode_info {
>  #define OP_STATE_BASE_ADDRESS                   OP_3D_MEDIA(0x0, 0x1, 0x=
01)
>  #define OP_STATE_SIP                            OP_3D_MEDIA(0x0, 0x1, 0x=
02)
>  #define OP_3D_MEDIA_0_1_4			OP_3D_MEDIA(0x0, 0x1, 0x04)
> +#define OP_SWTESS_BASE_ADDRESS			OP_3D_MEDIA(0x0, 0x1, 0x03)
> =20
>  #define OP_3DSTATE_VF_STATISTICS_GM45           OP_3D_MEDIA(0x1, 0x0, 0x=
0B)
> =20
> @@ -2468,6 +2469,9 @@ static const struct cmd_info cmd_info[] =3D {
>  	{"OP_3D_MEDIA_0_1_4", OP_3D_MEDIA_0_1_4, F_LEN_VAR, R_RCS, D_ALL,
>  		ADDR_FIX_1(1), 8, NULL},
> =20
> +	{"OP_SWTESS_BASE_ADDRESS", OP_SWTESS_BASE_ADDRESS,
> +		F_LEN_VAR, R_RCS, D_ALL, ADDR_FIX_2(1, 2), 3, NULL},
> +
>  	{"3DSTATE_VS", OP_3DSTATE_VS, F_LEN_VAR, R_RCS, D_ALL, 0, 8, NULL},
> =20
>  	{"3DSTATE_SF", OP_3DSTATE_SF, F_LEN_VAR, R_RCS, D_ALL, 0, 8, NULL},
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

--aIbcA3MSwnGacr4f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXnGuBgAKCRCxBBozTXgY
J9yRAKCO7pbPNUTkuA1tTQunhDa2vMTy7wCeJHzxhxxsBSamUYzD9SWL9djKl+o=
=GdIR
-----END PGP SIGNATURE-----

--aIbcA3MSwnGacr4f--

--===============0186409355==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0186409355==--
