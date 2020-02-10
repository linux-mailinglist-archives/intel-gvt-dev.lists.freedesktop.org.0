Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD1F156D76
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 10 Feb 2020 02:55:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3A1F6E0DB;
	Mon, 10 Feb 2020 01:55:53 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 794B16E0DB;
 Mon, 10 Feb 2020 01:55:52 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Feb 2020 17:55:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,423,1574150400"; 
 d="asc'?scan'208";a="405439459"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.14])
 by orsmga005.jf.intel.com with ESMTP; 09 Feb 2020 17:55:49 -0800
Date: Mon, 10 Feb 2020 09:43:14 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Subject: Re: [PATCH] drm/i915/gvt: more locking for ppgtt mm LRU list
Message-ID: <20200210014314.GA28133@zhen-hp.sh.intel.com>
References: <1580742421-25194-1-git-send-email-igor.druzhinin@citrix.com>
MIME-Version: 1.0
In-Reply-To: <1580742421-25194-1-git-send-email-igor.druzhinin@citrix.com>
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
Cc: airlied@linux.ie, intel-gfx@lists.freedesktop.org,
 joonas.lahtinen@linux.intel.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, zhenyuw@linux.intel.com,
 jani.nikula@linux.intel.com, daniel@ffwll.ch, rodrigo.vivi@intel.com,
 intel-gvt-dev@lists.freedesktop.org, zhi.a.wang@intel.com
Content-Type: multipart/mixed; boundary="===============0762943665=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0762943665==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KsGdsel6WgEHnImy"
Content-Disposition: inline


--KsGdsel6WgEHnImy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.02.03 15:07:01 +0000, Igor Druzhinin wrote:
> When the lock was introduced in 72aabfb862e40 ("drm/i915/gvt: Add mutual
> lock for ppgtt mm LRU list") one place got lost.
>=20
> Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
> ---
>  drivers/gpu/drm/i915/gvt/gtt.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gt=
t.c
> index 34cb404..4a48280 100644
> --- a/drivers/gpu/drm/i915/gvt/gtt.c
> +++ b/drivers/gpu/drm/i915/gvt/gtt.c
> @@ -1956,7 +1956,11 @@ void _intel_vgpu_mm_release(struct kref *mm_ref)
> =20
>  	if (mm->type =3D=3D INTEL_GVT_MM_PPGTT) {
>  		list_del(&mm->ppgtt_mm.list);
> +
> +		mutex_lock(&mm->vgpu->gvt->gtt.ppgtt_mm_lock);
>  		list_del(&mm->ppgtt_mm.lru_list);
> +		mutex_unlock(&mm->vgpu->gvt->gtt.ppgtt_mm_lock);
> +
>  		invalidate_ppgtt_mm(mm);
>  	} else {
>  		vfree(mm->ggtt_mm.virtual_ggtt);
> --=20

Thanks for the fix!

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--KsGdsel6WgEHnImy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXkC1MQAKCRCxBBozTXgY
J4abAJ9rGEjuKM3P5001pSAgbWTxt3gc1gCfQm1iVfei/7raZuyFiFZ7OkbVwJE=
=y1cr
-----END PGP SIGNATURE-----

--KsGdsel6WgEHnImy--

--===============0762943665==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0762943665==--
