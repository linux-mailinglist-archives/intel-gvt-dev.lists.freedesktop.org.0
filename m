Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D795578456
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 29 Jul 2019 07:14:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8515D89C52;
	Mon, 29 Jul 2019 05:14:00 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6421989C52
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 29 Jul 2019 05:13:59 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Jul 2019 22:13:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,321,1559545200"; 
 d="asc'?scan'208";a="322743387"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by orsmga004.jf.intel.com with ESMTP; 28 Jul 2019 22:13:57 -0700
Date: Mon, 29 Jul 2019 13:10:22 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: fred gao <fred.gao@intel.com>
Subject: Re: [PATCH v3 1/3] drm/i915/gvt: Utility for valid command length
 check
Message-ID: <20190729051022.GR8319@zhen-hp.sh.intel.com>
References: <20190718013901.3267-1-fred.gao@intel.com>
MIME-Version: 1.0
In-Reply-To: <20190718013901.3267-1-fred.gao@intel.com>
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
Content-Type: multipart/mixed; boundary="===============1854033110=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1854033110==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="iKKZt69u2Wx/rspf"
Content-Disposition: inline


--iKKZt69u2Wx/rspf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.07.18 09:39:01 +0800, fred gao wrote:
> From: "Gao, Fred" <fred.gao@intel.com>
>=20
> Add utility for valid command length check.
>=20
> v2: Add F_VAL_CONST flag to identify the value is const
>     although LEN maybe variable. (Zhenyu)
> v3: unused code removal, flag rename/conflict. (Zhenyu)
> v4: redefine F_IP_ADVANCE_CUSTOM and move the check function to
>     next patch. (Zhenyu)
>=20
> Signed-off-by: Gao, Fred <fred.gao@intel.com>

Double checked this w/o regression so far. Thanks.

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

> ---
>  drivers/gpu/drm/i915/gvt/cmd_parser.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i915=
/gvt/cmd_parser.c
> index b09dc315e2da..42a10b200744 100644
> --- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
> +++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
> @@ -378,17 +378,17 @@ struct cmd_info {
>  	const char *name;
>  	u32 opcode;
> =20
> -#define F_LEN_MASK	(1U<<0)
> +#define F_LEN_MASK	3U
>  #define F_LEN_CONST  1U
>  #define F_LEN_VAR    0U
> +/* value is const although LEN maybe variable */
> +#define F_LEN_VAR_FIXED    (1<<1)
> =20
>  /*
>   * command has its own ip advance logic
>   * e.g. MI_BATCH_START, MI_BATCH_END
>   */
> -#define F_IP_ADVANCE_CUSTOM (1<<1)
> -
> -#define F_POST_HANDLE	(1<<2)
> +#define F_IP_ADVANCE_CUSTOM (1<<2)
>  	u32 flag;
> =20
>  #define R_RCS	BIT(RCS0)
> @@ -418,9 +418,12 @@ struct cmd_info {
>  	 * flag =3D=3D F_LEN_VAR : length bias bits
>  	 * Note: length is in DWord
>  	 */
> -	u8 len;
> +	u32 len;
> =20
>  	parser_cmd_handler handler;
> +
> +	/* valid length in DWord */
> +	u32 valid_len;
>  };
> =20
>  struct cmd_entry {
> @@ -1912,7 +1915,7 @@ static const struct cmd_info cmd_info[] =3D {
>  	{"MI_RS_CONTEXT", OP_MI_RS_CONTEXT, F_LEN_CONST, R_RCS, D_ALL, 0, 1,
>  		NULL},
> =20
> -	{"MI_DISPLAY_FLIP", OP_MI_DISPLAY_FLIP, F_LEN_VAR | F_POST_HANDLE,
> +	{"MI_DISPLAY_FLIP", OP_MI_DISPLAY_FLIP, F_LEN_VAR,
>  		R_RCS | R_BCS, D_ALL, 0, 8, cmd_handler_mi_display_flip},
> =20
>  	{"MI_SEMAPHORE_MBOX", OP_MI_SEMAPHORE_MBOX, F_LEN_VAR, R_ALL, D_ALL,
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

--iKKZt69u2Wx/rspf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXT5/vgAKCRCxBBozTXgY
JwIiAJ9OrFMLVEi9R7+gMxLGEyH/2EYoRgCfaOQ2sXUjUpNrq2a+m4xNWTSTfrU=
=J5w6
-----END PGP SIGNATURE-----

--iKKZt69u2Wx/rspf--

--===============1854033110==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============1854033110==--
