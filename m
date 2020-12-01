Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BEAE2C98B4
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  1 Dec 2020 08:55:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C3EB6E4B1;
	Tue,  1 Dec 2020 07:55:33 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B11389D57
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  1 Dec 2020 07:55:32 +0000 (UTC)
IronPort-SDR: 12Tb/XNhE1ovhCYZz3ouEFp8Ki2VvQNr0E3X5Rb/WcSTtJ7nmcXipmubJK3hIT30p5QCcdHg3z
 W8IxkYDlfu/Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9821"; a="169283631"
X-IronPort-AV: E=Sophos;i="5.78,383,1599548400"; 
 d="asc'?scan'208";a="169283631"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2020 23:55:31 -0800
IronPort-SDR: pxsb0CH2/umkS2RQR5tst96AWGAXjTgk69JYJ4v4WVtuOqmbP8mu8nMZ2+bCb5pt0LacOWjYa/
 /pe8FMsoPWQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,383,1599548400"; 
 d="asc'?scan'208";a="372809116"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by FMSMGA003.fm.intel.com with ESMTP; 30 Nov 2020 23:55:30 -0800
Date: Tue, 1 Dec 2020 15:40:29 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Subject: Re: [PATCH 05/10] drm/i915/gvt: filter cmd "pipe-ctrl" in cmd_handler
Message-ID: <20201201074029.GT16939@zhen-hp.sh.intel.com>
References: <20201125003626.17806-1-yan.y.zhao@intel.com>
 <20201125003943.18081-1-yan.y.zhao@intel.com>
MIME-Version: 1.0
In-Reply-To: <20201125003943.18081-1-yan.y.zhao@intel.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Colin Xu <colin.xu@intel.com>
Content-Type: multipart/mixed; boundary="===============0174248331=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0174248331==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eWbcAUUbgrfSEG1c"
Content-Disposition: inline


--eWbcAUUbgrfSEG1c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.11.25 08:39:43 +0800, Yan Zhao wrote:
> "pipe-ctrl" is still a TODO. allow it here.
>=20
> Cc: Colin Xu <colin.xu@intel.com>
> Cc: Kevin Tian <kevin.tian@intel.com>
> Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/cmd_parser.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i915=
/gvt/cmd_parser.c
> index f898c8b2064d..e9013b9f3344 100644
> --- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
> +++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
> @@ -997,6 +997,11 @@ static int cmd_reg_handler(struct parser_exec_state =
*s,
>  		return -EPERM;
>  	}
> =20
> +	if (!strncmp(cmd, "pipe_ctrl", 9)) {
> +		//TODO

Let's write more on what should be for TODO and use proper comment
style /* ... */. So for pipe_ctrl, only thing to care in this case is
LRI post operation, which is just like another LRI cmd, so should be
applied with same check as in the last patch of this series.

It'll be ideal if we can add this before merging the series, hopefully
not much for extra effort.

> +		return 0;
> +	}
> +
>  	if (is_cmd_update_pdps(offset, s) &&
>  	    cmd_pdp_mmio_update_handler(s, offset, index))
>  		return -EINVAL;
> --=20
> 2.17.1
>=20
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--=20

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--eWbcAUUbgrfSEG1c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCX8XzaAAKCRCxBBozTXgY
J6zEAJ4+qrSIzw5nndGaOQH/9j1VORymHwCaA4fccStVG/qcrLp8AQ9Ij2/ODTM=
=LL8h
-----END PGP SIGNATURE-----

--eWbcAUUbgrfSEG1c--

--===============0174248331==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0174248331==--
