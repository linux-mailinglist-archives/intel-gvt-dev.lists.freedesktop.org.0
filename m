Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2A81AEF9
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 13 May 2019 04:41:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EE8E893D5;
	Mon, 13 May 2019 02:41:38 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC07C893D5
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 13 May 2019 02:41:36 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 May 2019 19:41:35 -0700
X-ExtLoop1: 1
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by orsmga004.jf.intel.com with ESMTP; 12 May 2019 19:41:35 -0700
Date: Mon, 13 May 2019 10:40:53 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Subject: Re: [PATCH v3 2/4] drm/i915/gvt: Tiled Resources mmios are
 in-context mmios for gen9+
Message-ID: <20190513024053.GY12913@zhen-hp.sh.intel.com>
References: <20190508021404.17218-1-yan.y.zhao@intel.com>
 <20190508021500.17272-1-yan.y.zhao@intel.com>
MIME-Version: 1.0
In-Reply-To: <20190508021500.17272-1-yan.y.zhao@intel.com>
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
Content-Type: multipart/mixed; boundary="===============0070718837=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0070718837==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Oodyc6ouB/5xmHkU"
Content-Disposition: inline


--Oodyc6ouB/5xmHkU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.05.07 22:15:00 -0400, Yan Zhao wrote:
> TRVATTL3PTRDW(0x4de0-0x4de4), TRNULLDETCT(0x4de8), TRINVTILEDETCT(0x4dec),
> TRTTE(0x4df0), TRVADR(0x4df4) are in-context mmios for gen9+
>=20
> v3: add fixes tag (zhenyu)
>=20
> Fixes: 178657139307 ("drm/i915/gvt: vGPU context switch")
> Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>

Ack for the TRTT fixes, thanks!

Acked-by: Zhenyu Wang <zhenyuw@linux.intel.com>

> ---
>  drivers/gpu/drm/i915/gvt/mmio_context.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/mmio_context.c b/drivers/gpu/drm/i9=
15/gvt/mmio_context.c
> index fe87fb87776c..46a6b461658d 100644
> --- a/drivers/gpu/drm/i915/gvt/mmio_context.c
> +++ b/drivers/gpu/drm/i915/gvt/mmio_context.c
> @@ -108,12 +108,12 @@ static struct engine_mmio gen9_engine_mmio_list[] _=
_cacheline_aligned =3D {
>  	{RCS0, GEN9_HALF_SLICE_CHICKEN5, 0xffff, true}, /* 0xe188 */
>  	{RCS0, GEN9_HALF_SLICE_CHICKEN7, 0xffff, true}, /* 0xe194 */
>  	{RCS0, GEN8_ROW_CHICKEN, 0xffff, true}, /* 0xe4f0 */
> -	{RCS0, TRVATTL3PTRDW(0), 0, false}, /* 0x4de0 */
> -	{RCS0, TRVATTL3PTRDW(1), 0, false}, /* 0x4de4 */
> -	{RCS0, TRNULLDETCT, 0, false}, /* 0x4de8 */
> -	{RCS0, TRINVTILEDETCT, 0, false}, /* 0x4dec */
> -	{RCS0, TRVADR, 0, false}, /* 0x4df0 */
> -	{RCS0, TRTTE, 0, false}, /* 0x4df4 */
> +	{RCS0, TRVATTL3PTRDW(0), 0, true}, /* 0x4de0 */
> +	{RCS0, TRVATTL3PTRDW(1), 0, true}, /* 0x4de4 */
> +	{RCS0, TRNULLDETCT, 0, true}, /* 0x4de8 */
> +	{RCS0, TRINVTILEDETCT, 0, true}, /* 0x4dec */
> +	{RCS0, TRVADR, 0, true}, /* 0x4df0 */
> +	{RCS0, TRTTE, 0, true}, /* 0x4df4 */
> =20
>  	{BCS0, RING_GFX_MODE(BLT_RING_BASE), 0xffff, false}, /* 0x2229c */
>  	{BCS0, RING_MI_MODE(BLT_RING_BASE), 0xffff, false}, /* 0x2209c */
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

--Oodyc6ouB/5xmHkU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXNjZNAAKCRCxBBozTXgY
J+aqAJ9V39NNBG/lnMT0MMMRmY/KKtX+zwCdEvP+FyIxXdepORaSaVSrug/NAJE=
=xl5U
-----END PGP SIGNATURE-----

--Oodyc6ouB/5xmHkU--

--===============0070718837==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============0070718837==--
