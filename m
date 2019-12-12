Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD8011C84D
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 12 Dec 2019 09:35:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4A6989BD5;
	Thu, 12 Dec 2019 08:35:09 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9745089BD5
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 12 Dec 2019 08:35:08 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Dec 2019 00:35:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,305,1571727600"; 
 d="asc'?scan'208";a="203863441"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by orsmga007.jf.intel.com with ESMTP; 12 Dec 2019 00:35:06 -0800
Date: Thu, 12 Dec 2019 16:33:29 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Tina Zhang <tina.zhang@intel.com>
Subject: Re: [PATCH v2] drm/i915/gvt: Pin vgpu dma address before using
Message-ID: <20191212083329.GC21662@zhen-hp.sh.intel.com>
References: <20191212141342.3417-1-tina.zhang@intel.com>
MIME-Version: 1.0
In-Reply-To: <20191212141342.3417-1-tina.zhang@intel.com>
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
Content-Type: multipart/mixed; boundary="===============1815906625=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1815906625==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DKU6Jbt7q3WqK7+M"
Content-Disposition: inline


--DKU6Jbt7q3WqK7+M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.12.12 22:13:42 +0800, Tina Zhang wrote:
> Dma-buf display uses the vgpu dma address saved in the guest part GGTT
> table which is updated by vCPU thread. In host side, when the dma
> address is used by qemu ui thread, gvt-g must make sure the dma address
> is validated before letting it go to the HW. Invalid guest dma address
> will easily cause DMA fault and make GPU hang.
>=20
> v2: Rebase

Potentially we would be possible to pin undesired page longer even
that's not used by gpu, but still a mitigation for current fault
anyway. Hopefully this can work with display buffer tracking
gracefully with possible user event helper. So,

Acked-by: Zhenyu Wang <zhenyuw@linux.intel.com>

>=20
> Signed-off-by: Tina Zhang <tina.zhang@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/dmabuf.c    | 62 ++++++++++++++++++++++++++--
>  drivers/gpu/drm/i915/gvt/hypercall.h |  2 +
>  drivers/gpu/drm/i915/gvt/kvmgt.c     | 23 +++++++++++
>  drivers/gpu/drm/i915/gvt/mpt.h       | 14 +++++++
>  4 files changed, 97 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/dmabuf.c b/drivers/gpu/drm/i915/gvt=
/dmabuf.c
> index e451298d11c3..9836ce6119a8 100644
> --- a/drivers/gpu/drm/i915/gvt/dmabuf.c
> +++ b/drivers/gpu/drm/i915/gvt/dmabuf.c
> @@ -36,13 +36,31 @@
> =20
>  #define GEN8_DECODE_PTE(pte) (pte & GENMASK_ULL(63, 12))
> =20
> +static int vgpu_pin_dma_address(struct intel_vgpu *vgpu, unsigned long s=
ize,
> +		dma_addr_t dma_addr)
> +{
> +	int ret =3D 0;
> +
> +	if (intel_gvt_hypervisor_dma_pin_guest_page(vgpu, dma_addr))
> +		ret =3D -EINVAL;
> +
> +	return ret;
> +}
> +
> +static void vgpu_unpin_dma_address(struct intel_vgpu *vgpu,
> +				  dma_addr_t dma_addr)
> +{
> +	intel_gvt_hypervisor_dma_unmap_guest_page(vgpu, dma_addr);
> +}
> +
>  static int vgpu_gem_get_pages(
>  		struct drm_i915_gem_object *obj)
>  {
>  	struct drm_i915_private *dev_priv =3D to_i915(obj->base.dev);
> +	struct intel_vgpu *vgpu;
>  	struct sg_table *st;
>  	struct scatterlist *sg;
> -	int i, ret;
> +	int i, j, ret;
>  	gen8_pte_t __iomem *gtt_entries;
>  	struct intel_vgpu_fb_info *fb_info;
>  	u32 page_num;
> @@ -51,6 +69,10 @@ static int vgpu_gem_get_pages(
>  	if (WARN_ON(!fb_info))
>  		return -ENODEV;
> =20
> +	vgpu =3D fb_info->obj->vgpu;
> +	if (WARN_ON(!vgpu))
> +		return -ENODEV;
> +
>  	st =3D kmalloc(sizeof(*st), GFP_KERNEL);
>  	if (unlikely(!st))
>  		return -ENOMEM;
> @@ -64,21 +86,53 @@ static int vgpu_gem_get_pages(
>  	gtt_entries =3D (gen8_pte_t __iomem *)dev_priv->ggtt.gsm +
>  		(fb_info->start >> PAGE_SHIFT);
>  	for_each_sg(st->sgl, sg, page_num, i) {
> +		dma_addr_t dma_addr =3D
> +			GEN8_DECODE_PTE(readq(&gtt_entries[i]));
> +		if (vgpu_pin_dma_address(vgpu, PAGE_SIZE, dma_addr)) {
> +			ret =3D -EINVAL;
> +			goto out;
> +		}
> +
>  		sg->offset =3D 0;
>  		sg->length =3D PAGE_SIZE;
> -		sg_dma_address(sg) =3D
> -			GEN8_DECODE_PTE(readq(&gtt_entries[i]));
>  		sg_dma_len(sg) =3D PAGE_SIZE;
> +		sg_dma_address(sg) =3D dma_addr;
>  	}
> =20
>  	__i915_gem_object_set_pages(obj, st, PAGE_SIZE);
> +out:
> +	if (ret) {
> +		dma_addr_t dma_addr;
> +
> +		for_each_sg(st->sgl, sg, i, j) {
> +			dma_addr =3D sg_dma_address(sg);
> +			if (dma_addr)
> +				vgpu_unpin_dma_address(vgpu, dma_addr);
> +		}
> +		sg_free_table(st);
> +		kfree(st);
> +	}
> +
> +	return ret;
> =20
> -	return 0;
>  }
> =20
>  static void vgpu_gem_put_pages(struct drm_i915_gem_object *obj,
>  		struct sg_table *pages)
>  {
> +	struct scatterlist *sg;
> +
> +	if (obj->base.dma_buf) {
> +		struct intel_vgpu_fb_info *fb_info =3D obj->gvt_info;
> +		struct intel_vgpu_dmabuf_obj *obj =3D fb_info->obj;
> +		struct intel_vgpu *vgpu =3D obj->vgpu;
> +		int i;
> +
> +		for_each_sg(pages->sgl, sg, fb_info->size, i)
> +			vgpu_unpin_dma_address(vgpu,
> +					       sg_dma_address(sg));
> +	}
> +
>  	sg_free_table(pages);
>  	kfree(pages);
>  }
> diff --git a/drivers/gpu/drm/i915/gvt/hypercall.h b/drivers/gpu/drm/i915/=
gvt/hypercall.h
> index 9599c0a762b2..b17c4a1599cd 100644
> --- a/drivers/gpu/drm/i915/gvt/hypercall.h
> +++ b/drivers/gpu/drm/i915/gvt/hypercall.h
> @@ -66,6 +66,8 @@ struct intel_gvt_mpt {
>  				  unsigned long size, dma_addr_t *dma_addr);
>  	void (*dma_unmap_guest_page)(unsigned long handle, dma_addr_t dma_addr);
> =20
> +	int (*dma_pin_guest_page)(unsigned long handle, dma_addr_t dma_addr);
> +
>  	int (*map_gfn_to_mfn)(unsigned long handle, unsigned long gfn,
>  			      unsigned long mfn, unsigned int nr, bool map);
>  	int (*set_trap_area)(unsigned long handle, u64 start, u64 end,
> diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/=
kvmgt.c
> index a699ecade3fc..bd79a9718cc7 100644
> --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
> @@ -1914,6 +1914,28 @@ static int kvmgt_dma_map_guest_page(unsigned long =
handle, unsigned long gfn,
>  	return ret;
>  }
> =20
> +static int kvmgt_dma_pin_guest_page(unsigned long handle, dma_addr_t dma=
_addr)
> +{
> +	struct kvmgt_guest_info *info;
> +	struct gvt_dma *entry;
> +	int ret =3D 0;
> +
> +	if (!handle_valid(handle))
> +		return -ENODEV;
> +
> +	info =3D (struct kvmgt_guest_info *)handle;
> +
> +	mutex_lock(&info->vgpu->vdev.cache_lock);
> +	entry =3D __gvt_cache_find_dma_addr(info->vgpu, dma_addr);
> +	if (entry)
> +		kref_get(&entry->ref);
> +	else
> +		ret =3D -ENOMEM;
> +	mutex_unlock(&info->vgpu->vdev.cache_lock);
> +
> +	return ret;
> +}
> +
>  static void __gvt_dma_release(struct kref *ref)
>  {
>  	struct gvt_dma *entry =3D container_of(ref, typeof(*entry), ref);
> @@ -2025,6 +2047,7 @@ static struct intel_gvt_mpt kvmgt_mpt =3D {
>  	.gfn_to_mfn =3D kvmgt_gfn_to_pfn,
>  	.dma_map_guest_page =3D kvmgt_dma_map_guest_page,
>  	.dma_unmap_guest_page =3D kvmgt_dma_unmap_guest_page,
> +	.dma_pin_guest_page =3D kvmgt_dma_pin_guest_page,
>  	.set_opregion =3D kvmgt_set_opregion,
>  	.set_edid =3D kvmgt_set_edid,
>  	.get_vfio_device =3D kvmgt_get_vfio_device,
> diff --git a/drivers/gpu/drm/i915/gvt/mpt.h b/drivers/gpu/drm/i915/gvt/mp=
t.h
> index 0f9440128123..3bc40b0ba4cf 100644
> --- a/drivers/gpu/drm/i915/gvt/mpt.h
> +++ b/drivers/gpu/drm/i915/gvt/mpt.h
> @@ -254,6 +254,20 @@ static inline void intel_gvt_hypervisor_dma_unmap_gu=
est_page(
>  	intel_gvt_host.mpt->dma_unmap_guest_page(vgpu->handle, dma_addr);
>  }
> =20
> +/**
> + * intel_gvt_hypervisor_dma_pin_guest_page - pin guest dma buf
> + * @vgpu: a vGPU
> + * @dma_addr: guest dma addr
> + *
> + * Returns:
> + * 0 on success, negative error code if failed.
> + */
> +static inline int intel_gvt_hypervisor_dma_pin_guest_page(
> +		struct intel_vgpu *vgpu, dma_addr_t dma_addr)
> +{
> +	return intel_gvt_host.mpt->dma_pin_guest_page(vgpu->handle, dma_addr);
> +}
> +
>  /**
>   * intel_gvt_hypervisor_map_gfn_to_mfn - map a GFN region to MFN
>   * @vgpu: a vGPU
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

--DKU6Jbt7q3WqK7+M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXfH7WQAKCRCxBBozTXgY
J3Z2AJwLn3X1no4jaQ0OhCkM+i+3VgctKQCeJcaTX+0hE0yTsW/j/MByRaoB6QQ=
=Y0Bh
-----END PGP SIGNATURE-----

--DKU6Jbt7q3WqK7+M--

--===============1815906625==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============1815906625==--
