Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64227EECB
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 30 Apr 2019 04:34:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9332A8936B;
	Tue, 30 Apr 2019 02:34:44 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD55589369;
 Tue, 30 Apr 2019 02:34:42 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Apr 2019 19:34:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,412,1549958400"; 
 d="asc'?scan'208";a="295654186"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by orsmga004.jf.intel.com with ESMTP; 29 Apr 2019 19:34:39 -0700
Date: Tue, 30 Apr 2019 10:34:26 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Xiaolin Zhang <xiaolin.zhang@intel.com>
Subject: Re: [PATCH v5 2/8] drm/i915: vgpu shared memory setup for pv
 optimization
Message-ID: <20190430023426.GH12913@zhen-hp.sh.intel.com>
References: <1556507458-24684-1-git-send-email-xiaolin.zhang@intel.com>
 <1556507458-24684-3-git-send-email-xiaolin.zhang@intel.com>
MIME-Version: 1.0
In-Reply-To: <1556507458-24684-3-git-send-email-xiaolin.zhang@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, joonas.lahtinen@linux.intel.com,
 chris@chris-wilson.co.uk, min.he@intel.com, zhiyuan.lv@intel.com,
 hang.yuan@intel.com, intel-gvt-dev@lists.freedesktop.org, zhi.a.wang@intel.com
Content-Type: multipart/mixed; boundary="===============0403144447=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0403144447==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Mjqg7Yu+0hL22rav"
Content-Disposition: inline


--Mjqg7Yu+0hL22rav
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.04.29 11:10:52 +0800, Xiaolin Zhang wrote:
> To enable vgpu pv features, we need to setup a shared memory page
> which will be used for data exchange directly accessed between both
> guest and backend i915 driver to avoid emulation trap cost.
>=20
> guest i915 will allocate this page memory and then pass it's physical
> address to backend i915 driver through PVINFO register so that backend i9=
15
> driver can access this shared page meory without any trap cost with the
> help form hyperviser's read guest gpa functionality.
>=20
> guest i915 will send VGT_G2V_SHARED_PAGE_SETUP notification to host GVT
> once shared memory setup finished.
>=20
> the layout of the shared_page also defined as well in this patch which
> is used for pv features implementation.
>

Problem is for compatibility. Looks you don't define anything to let guest
know the exact format of shared page that host can support, e.g if you want
to extend page format in future, how guest can know that? We need some kind
of version or compat bit alike.

> v0: RFC
> v1: addressed RFC comment to move both shared_page_lock and shared_page
> to i915_virtual_gpu structure
> v2: packed i915_virtual_gpu structure
> v3: added SHARED_PAGE_SETUP g2v notification for pv shared_page setup
> v4: added intel_vgpu_setup_shared_page() in i915_vgpu_pv.c
> v5: per engine desc data in shared memory
>=20
> Signed-off-by: Xiaolin Zhang <xiaolin.zhang@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_drv.h    |  4 +++-
>  drivers/gpu/drm/i915/i915_pvinfo.h |  5 ++++-
>  drivers/gpu/drm/i915/i915_vgpu.c   | 40 ++++++++++++++++++++++++++++++++=
++++++
>  drivers/gpu/drm/i915/i915_vgpu.h   | 20 +++++++++++++++++++
>  4 files changed, 67 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_=
drv.h
> index 91a16b35..acf9035 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -1244,7 +1244,9 @@ struct i915_virtual_gpu {
>  	bool active;
>  	u32 caps;
>  	u32 pv_caps;
> -};
> +	spinlock_t shared_page_lock[I915_NUM_ENGINES];
> +	struct gvt_shared_page *shared_page;
> +} __packed;
> =20
>  /* used in computing the new watermarks state */
>  struct intel_wm_config {
> diff --git a/drivers/gpu/drm/i915/i915_pvinfo.h b/drivers/gpu/drm/i915/i9=
15_pvinfo.h
> index 619305a..4657bf7 100644
> --- a/drivers/gpu/drm/i915/i915_pvinfo.h
> +++ b/drivers/gpu/drm/i915/i915_pvinfo.h
> @@ -46,6 +46,7 @@ enum vgt_g2v_type {
>  	VGT_G2V_PPGTT_L4_PAGE_TABLE_DESTROY,
>  	VGT_G2V_EXECLIST_CONTEXT_CREATE,
>  	VGT_G2V_EXECLIST_CONTEXT_DESTROY,
> +	VGT_G2V_SHARED_PAGE_SETUP,
>  	VGT_G2V_MAX,
>  };
> =20
> @@ -110,7 +111,9 @@ struct vgt_if {
> =20
>  	u32 pv_caps;
> =20
> -	u32  rsv7[0x200 - 25];    /* pad to one page */
> +	u64 shared_page_gpa;
> +
> +	u32  rsv7[0x200 - 27];    /* pad to one page */
>  } __packed;
> =20
>  #define vgtif_reg(x) \
> diff --git a/drivers/gpu/drm/i915/i915_vgpu.c b/drivers/gpu/drm/i915/i915=
_vgpu.c
> index 7329f5a..da439b1 100644
> --- a/drivers/gpu/drm/i915/i915_vgpu.c
> +++ b/drivers/gpu/drm/i915/i915_vgpu.c
> @@ -135,6 +135,9 @@ void intel_vgt_deballoon(struct drm_i915_private *dev=
_priv)
> =20
>  	for (i =3D 0; i < 4; i++)
>  		vgt_deballoon_space(&dev_priv->ggtt, &bl_info.space[i]);
> +
> +	if (dev_priv->vgpu.shared_page)
> +		free_page((unsigned long)dev_priv->vgpu.shared_page);
>  }
> =20
>  static int vgt_balloon_space(struct i915_ggtt *ggtt,
> @@ -286,6 +289,38 @@ int intel_vgt_balloon(struct drm_i915_private *dev_p=
riv)
>   * i915 vgpu PV support for Linux
>   */
> =20
> +/*
> + * shared_page setup for VGPU PV features
> + */
> +static int intel_vgpu_setup_shared_page(struct drm_i915_private *dev_pri=
v)
> +{
> +	struct intel_uncore *uncore =3D &dev_priv->uncore;
> +	u64 gpa;
> +	int i;
> +
> +	dev_priv->vgpu.shared_page =3D  (struct gvt_shared_page *)
> +			get_zeroed_page(GFP_KERNEL);
> +	if (!dev_priv->vgpu.shared_page) {
> +		DRM_ERROR("out of memory for shared page memory\n");
> +		return -ENOMEM;
> +	}
> +
> +	/* pass guest memory pa address to GVT and then read back to verify */
> +	gpa =3D __pa(dev_priv->vgpu.shared_page);
> +	__raw_uncore_write64(uncore, vgtif_reg(shared_page_gpa), gpa);
> +	if (gpa !=3D __raw_uncore_read64(uncore, vgtif_reg(shared_page_gpa))) {
> +		DRM_ERROR("vgpu: passed shared_page_gpa failed\n");
> +		free_page((unsigned long)dev_priv->vgpu.shared_page);
> +		return -EIO;
> +	}
> +	__raw_uncore_write32(uncore, vgtif_reg(g2v_notify),
> +			VGT_G2V_SHARED_PAGE_SETUP);
> +	for (i =3D 0; i < I915_NUM_ENGINES; i++)
> +		spin_lock_init(&dev_priv->vgpu.shared_page_lock[i]);
> +
> +	return 0;
> +}
> +
>  /**
>   * intel_vgpu_check_pv_caps - detect virtual GPU PV capabilities
>   * @dev_priv: i915 device private
> @@ -313,6 +348,11 @@ bool intel_vgpu_check_pv_caps(struct drm_i915_privat=
e *dev_priv)
>  	if (!pvcaps)
>  		return false;
> =20
> +	if (intel_vgpu_setup_shared_page(dev_priv)) {
> +		dev_priv->vgpu.pv_caps =3D 0;
> +		return false;
> +	}
> +
>  	__raw_uncore_write32(uncore, vgtif_reg(pv_caps), pvcaps);
> =20
>  	return true;
> diff --git a/drivers/gpu/drm/i915/i915_vgpu.h b/drivers/gpu/drm/i915/i915=
_vgpu.h
> index 91010fc..697c426 100644
> --- a/drivers/gpu/drm/i915/i915_vgpu.h
> +++ b/drivers/gpu/drm/i915/i915_vgpu.h
> @@ -26,6 +26,26 @@
> =20
>  #include "i915_pvinfo.h"
> =20
> +/*
> + * A shared page(4KB) between gvt and VM, could be allocated by guest dr=
iver
> + * or a fixed location in PCI bar 0 region
> + */
> +struct pv_ppgtt_update {
> +	u64 pdp;
> +	u64 start;
> +	u64 length;
> +	u32 cache_level;
> +};
> +
> +struct pv_submission {
> +	u64 descs[EXECLIST_MAX_PORTS];
> +};
> +
> +struct gvt_shared_page {
> +	struct pv_ppgtt_update pv_ppgtt;
> +	struct pv_submission pv_elsp[I915_NUM_ENGINES];
> +};
> +
>  void i915_check_vgpu(struct drm_i915_private *dev_priv);
> =20
>  bool intel_vgpu_has_full_ppgtt(struct drm_i915_private *dev_priv);
> --=20
> 2.7.4
>=20

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--Mjqg7Yu+0hL22rav
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXMe0MgAKCRCxBBozTXgY
J97GAKCIBKlGmE1kc1hE0pWk6tmtXp9o5ACgktQ3rAbAKRajIO7vOdPD3ZI9Ly4=
=rPQC
-----END PGP SIGNATURE-----

--Mjqg7Yu+0hL22rav--

--===============0403144447==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============0403144447==--
