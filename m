Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B90D6189568
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 18 Mar 2020 06:38:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F2FC6E864;
	Wed, 18 Mar 2020 05:38:56 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 374D06E864
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 18 Mar 2020 05:38:55 +0000 (UTC)
IronPort-SDR: 3q2AJ8DF7kO12DQOIrfg4CkwB6Fnt++msfeosBxynR/Ux5yUpX5m/Q4Yeu82lAxbuc+xHIqmQX
 RhwOg177JbrQ==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2020 22:38:54 -0700
IronPort-SDR: hEfXEgmsyzJ8u9T2CazPcNQnmVpCs9QspGZPrkXS6f9YBhNskFkzUt3kNQlhrd9Buqa4N0WH+z
 ccqCIomHAG/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,566,1574150400"; 
 d="asc'?scan'208";a="391326531"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by orsmga004.jf.intel.com with ESMTP; 17 Mar 2020 22:38:53 -0700
Date: Wed, 18 Mar 2020 13:26:11 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Subject: Re: [PATCH] drm/i915/gvt: do not check len & max_len for lri
Message-ID: <20200318052611.GU8880@zhen-hp.sh.intel.com>
References: <20200304095121.21609-1-yan.y.zhao@intel.com>
MIME-Version: 1.0
In-Reply-To: <20200304095121.21609-1-yan.y.zhao@intel.com>
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
Content-Type: multipart/mixed; boundary="===============1399038769=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1399038769==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hHiQ9nAwW5IGN2dL"
Content-Disposition: inline


--hHiQ9nAwW5IGN2dL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.03.04 04:51:21 -0500, Yan Zhao wrote:
> lri ususally of variable len and far exceeding 127 dwords.
>=20
> Fixes: 00a33be40634 (drm/i915/gvt: Add valid length check for MI variable
> commands)
>=20
> Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>

Ack for this fix which seems true in practical, suppose our ring shadow alr=
eady
has sane range check.

Acked-by: Zhenyu Wang <zhenyuw@linux.intel.com>

> ---
>  drivers/gpu/drm/i915/gvt/cmd_parser.c | 12 ------------
>  1 file changed, 12 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i915=
/gvt/cmd_parser.c
> index 73a2891114a4..151fea215e5c 100644
> --- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
> +++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
> @@ -965,18 +965,6 @@ static int cmd_handler_lri(struct parser_exec_state =
*s)
>  	int i, ret =3D 0;
>  	int cmd_len =3D cmd_length(s);
>  	struct intel_gvt *gvt =3D s->vgpu->gvt;
> -	u32 valid_len =3D CMD_LEN(1);
> -
> -	/*
> -	 * Official intel docs are somewhat sloppy , check the definition of
> -	 * MI_LOAD_REGISTER_IMM.
> -	 */
> -	#define MAX_VALID_LEN 127
> -	if ((cmd_len < valid_len) || (cmd_len > MAX_VALID_LEN)) {
> -		gvt_err("len is not valid:  len=3D%u  valid_len=3D%u\n",
> -			cmd_len, valid_len);
> -		return -EFAULT;
> -	}
> =20
>  	for (i =3D 1; i < cmd_len; i +=3D 2) {
>  		if (IS_BROADWELL(gvt->dev_priv) && s->ring_id !=3D RCS0) {
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

--hHiQ9nAwW5IGN2dL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXnGw8wAKCRCxBBozTXgY
J5gkAKCe+QLNmXO05qF5nc26ESKccF3dGgCcDbVBK2R74DlRr2KlbA+eOZRAyPo=
=tq7U
-----END PGP SIGNATURE-----

--hHiQ9nAwW5IGN2dL--

--===============1399038769==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============1399038769==--
