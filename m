Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A046268467
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 14 Sep 2020 08:09:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E41F6E0CC;
	Mon, 14 Sep 2020 06:09:20 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78F9A6E0CC
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 14 Sep 2020 06:09:18 +0000 (UTC)
IronPort-SDR: x9ypMjy2q+aS7/T6iIRsjdWn1XO808bB6akEv9ZGz8gYlU/ninpUWJZIbY7McgsPEIsWwnSBuC
 Datn9JP4GkrA==
X-IronPort-AV: E=McAfee;i="6000,8403,9743"; a="243860171"
X-IronPort-AV: E=Sophos;i="5.76,425,1592895600"; 
 d="asc'?scan'208";a="243860171"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2020 23:09:17 -0700
IronPort-SDR: SqGJb2cPEeQZp9pZNR+kQObwwFaCq6OTKpA6Bnw5uSxYkkmYyIbT2uhdDLSKfaCTTlyolZGJbU
 rU/REC4rFhFg==
X-IronPort-AV: E=Sophos;i="5.76,425,1592895600"; 
 d="asc'?scan'208";a="482212684"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2020 23:09:15 -0700
Date: Mon, 14 Sep 2020 13:49:49 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Subject: Re: [PATCH] drm/i915/gvt: correct a false comment of flag F_UNALIGN
Message-ID: <20200914054949.GZ28614@zhen-hp.sh.intel.com>
References: <20200910035405.20273-1-yan.y.zhao@intel.com>
MIME-Version: 1.0
In-Reply-To: <20200910035405.20273-1-yan.y.zhao@intel.com>
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
Content-Type: multipart/mixed; boundary="===============1661012658=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1661012658==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="poJSiGMzRSvrLGLs"
Content-Disposition: inline


--poJSiGMzRSvrLGLs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.09.10 11:54:05 +0800, Yan Zhao wrote:
> Correct falsely removed comment of flag F_UNALIGN.
>=20
> Fixes:85e5eaf20458 ("drm/i915/gvt: remove flag F_CMD_ACCESSED")
>=20
> Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/gvt.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gv=
t.h
> index 9831361f181e..a81cf0f01e78 100644
> --- a/drivers/gpu/drm/i915/gvt/gvt.h
> +++ b/drivers/gpu/drm/i915/gvt/gvt.h
> @@ -255,7 +255,7 @@ struct intel_gvt_mmio {
>  #define F_CMD_ACCESS	(1 << 3)
>  /* This reg has been accessed by a VM */
>  #define F_ACCESSED	(1 << 4)
> -/* This reg has been accessed through GPU commands */
> +/* This reg could be accessed by unaligned address */
>  #define F_UNALIGN	(1 << 6)
>  /* This reg is in GVT's mmio save-restor list and in hardware
>   * logical context image
> --=20

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

--=20

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--poJSiGMzRSvrLGLs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCX18EfQAKCRCxBBozTXgY
J8OJAJ9/34GXkbzEethPm+Luhhs5bDT8lQCbB7bklAtJV9V7nkQ1k6UNY9EL7SE=
=T4Sr
-----END PGP SIGNATURE-----

--poJSiGMzRSvrLGLs--

--===============1661012658==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============1661012658==--
