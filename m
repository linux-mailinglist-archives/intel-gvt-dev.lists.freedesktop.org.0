Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD04F29160
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 24 May 2019 08:58:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E1FA89E32;
	Fri, 24 May 2019 06:58:23 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 067996E090
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 24 May 2019 06:58:22 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 May 2019 23:58:22 -0700
X-ExtLoop1: 1
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by fmsmga001.fm.intel.com with ESMTP; 23 May 2019 23:58:21 -0700
Date: Fri, 24 May 2019 14:57:14 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Tina Zhang <tina.zhang@intel.com>
Subject: Re: [PATCH] drm/i915/gvt: Pin vgpu dma address before using
Message-ID: <20190524065714.GX12913@zhen-hp.sh.intel.com>
References: <20190524025954.3031-1-tina.zhang@intel.com>
MIME-Version: 1.0
In-Reply-To: <20190524025954.3031-1-tina.zhang@intel.com>
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
Cc: intel-gvt-dev@lists.freedesktop.org, hang.yuan@intel.com
Content-Type: multipart/mixed; boundary="===============1728390492=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1728390492==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9LE97oNtwtUIpsaR"
Content-Disposition: inline


--9LE97oNtwtUIpsaR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.05.24 10:59:54 +0800, Tina Zhang wrote:
> Dma-buf display uses the vgpu dma address saved in the guest part GGTT
> table which is updated by vCPU thread. In host side, when the dma
> address is used by qemu ui thread, gvt-g must make sure the dma address
> is validated before letting it go to the HW. Invalid guest dma address
> will easily cause DMA fault and make GPU hang.
>=20
> Signed-off-by: Tina Zhang <tina.zhang@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/dmabuf.c    | 59 ++++++++++++++++++++++++++--
>  drivers/gpu/drm/i915/gvt/hypercall.h |  2 +
>  drivers/gpu/drm/i915/gvt/kvmgt.c     | 27 +++++++++++++
>  drivers/gpu/drm/i915/gvt/mpt.h       | 14 +++++++
>  4 files changed, 99 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/dmabuf.c b/drivers/gpu/drm/i915/gvt=
/dmabuf.c
> index b6d93175bddf..9db4328e9732 100644
> --- a/drivers/gpu/drm/i915/gvt/dmabuf.c
> +++ b/drivers/gpu/drm/i915/gvt/dmabuf.c
> @@ -36,10 +36,28 @@
> =20
>  #define GEN8_DECODE_PTE(pte) (pte & GENMASK_ULL(63, 12))
> =20
> +static int vgpu_pin_dma_address(struct intel_vgpu *vgpu, unsigned long s=
ize,
> +		dma_addr_t dma_addr)
> +{
> +	int ret =3D 0;
> +
> +	if (intel_gvt_hypervisor_dma_get_guest_page(vgpu, dma_addr))
> +		ret =3D -ENOMEM;
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
>  	int i, ret;
> @@ -50,6 +68,10 @@ static int vgpu_gem_get_pages(
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
> @@ -62,21 +84,51 @@ static int vgpu_gem_get_pages(
>  	gtt_entries =3D (gen8_pte_t __iomem *)dev_priv->ggtt.gsm +
>  		(fb_info->start >> PAGE_SHIFT);
>  	for_each_sg(st->sgl, sg, fb_info->size, i) {
> +		dma_addr_t dma_addr =3D
> +			GEN8_DECODE_PTE(readq(&gtt_entries[i]));
> +		if (vgpu_pin_dma_address(vgpu, PAGE_SIZE, dma_addr)) {
> +			ret =3D -ENOMEM;

What we really want to track here? Is it that if guest plane flip to new
buffer, we need to make sure old exposed dmabuf can't be accessed for displ=
ay
purpose?

This only checks if some guest ggtt range has been mapped with guest pages,
how could that translate to display buffer tracking? e.g how do you know
fb_info->start is still a valid offset then?

I think we need to do active tracking of guest plane change, which we don't=
 do
now as for polling mode of gfx dmabuf interface, and besides plane mmio reg=
 tracking
we need to track ggtt range used for display plane too, e.g if guest doesn'=
t change
ggtt offset but only backing pages, we need to force unpin, and let further=
 action
to get new pages, etc.=20

> +			goto out;
> +		}
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
> =20
> -	return 0;
> +		for_each_sg(st->sgl, sg, fb_info->size, i) {
> +			dma_addr =3D sg_dma_address(sg);
> +			if (dma_addr)
> +				vgpu_unpin_dma_address(vgpu, dma_addr);
> +		}
> +		sg_free_table(st);
> +		kfree(st);
> +	}
> +
> +	return ret;
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
> @@ -108,6 +160,7 @@ static void dmabuf_gem_object_free(struct kref *kref)
>  		kfree(obj->info);
>  		kfree(obj);
>  	}
> +
>  }
> =20
> =20
> diff --git a/drivers/gpu/drm/i915/gvt/hypercall.h b/drivers/gpu/drm/i915/=
gvt/hypercall.h
> index 4862fb12778e..756adcc71602 100644
> --- a/drivers/gpu/drm/i915/gvt/hypercall.h
> +++ b/drivers/gpu/drm/i915/gvt/hypercall.h
> @@ -62,6 +62,8 @@ struct intel_gvt_mpt {
>  				  unsigned long size, dma_addr_t *dma_addr);
>  	void (*dma_unmap_guest_page)(unsigned long handle, dma_addr_t dma_addr);
> =20
> +	int (*dma_get_guest_page)(unsigned long handle, dma_addr_t dma_addr);
> +
>  	int (*map_gfn_to_mfn)(unsigned long handle, unsigned long gfn,
>  			      unsigned long mfn, unsigned int nr, bool map);
>  	int (*set_trap_area)(unsigned long handle, u64 start, u64 end,
> diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/=
kvmgt.c
> index 2911818286a5..e33f240ea9d6 100644
> --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
> @@ -213,6 +213,10 @@ static void gvt_dma_unmap_page(struct intel_vgpu *vg=
pu, unsigned long gfn,
>  	struct device *dev =3D &vgpu->gvt->dev_priv->drm.pdev->dev;
> =20
>  	dma_unmap_page(dev, dma_addr, size, PCI_DMA_BIDIRECTIONAL);
> +	if (dma_mapping_error(dev, dma_addr)) {
> +		gvt_vgpu_err("DMA unmapping failed for dma_addr 0x%llx\n",
> +			     dma_addr);
> +	}
>  	gvt_unpin_guest_page(vgpu, gfn, size);
>  }
> =20
> @@ -1964,6 +1968,28 @@ static int kvmgt_dma_map_guest_page(unsigned long =
handle, unsigned long gfn,
>  	return ret;
>  }
> =20
> +static int kvmgt_dma_get_guest_page(unsigned long handle, dma_addr_t dma=
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
> @@ -2075,6 +2101,7 @@ static struct intel_gvt_mpt kvmgt_mpt =3D {
>  	.gfn_to_mfn =3D kvmgt_gfn_to_pfn,
>  	.dma_map_guest_page =3D kvmgt_dma_map_guest_page,
>  	.dma_unmap_guest_page =3D kvmgt_dma_unmap_guest_page,
> +	.dma_get_guest_page =3D kvmgt_dma_get_guest_page,
>  	.set_opregion =3D kvmgt_set_opregion,
>  	.set_edid =3D kvmgt_set_edid,
>  	.get_vfio_device =3D kvmgt_get_vfio_device,
> diff --git a/drivers/gpu/drm/i915/gvt/mpt.h b/drivers/gpu/drm/i915/gvt/mp=
t.h
> index 0f9440128123..4e9391a52098 100644
> --- a/drivers/gpu/drm/i915/gvt/mpt.h
> +++ b/drivers/gpu/drm/i915/gvt/mpt.h
> @@ -254,6 +254,20 @@ static inline void intel_gvt_hypervisor_dma_unmap_gu=
est_page(
>  	intel_gvt_host.mpt->dma_unmap_guest_page(vgpu->handle, dma_addr);
>  }
> =20
> +/**
> + * intel_gvt_hypervisor_dma_get_guest_page - get guest dma map addr
> + * @vgpu: a vGPU
> + * @dma_addr: guest dma addr
> + *
> + * Returns:
> + * 0 on success, negative error code if failed.
> + */
> +static inline int intel_gvt_hypervisor_dma_get_guest_page(
> +		struct intel_vgpu *vgpu, dma_addr_t dma_addr)
> +{
> +	return intel_gvt_host.mpt->dma_get_guest_page(vgpu->handle, dma_addr);
> +}
> +
>  /**
>   * intel_gvt_hypervisor_map_gfn_to_mfn - map a GFN region to MFN
>   * @vgpu: a vGPU
> --=20
> 2.17.1
>=20

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--9LE97oNtwtUIpsaR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXOeVygAKCRCxBBozTXgY
J9pEAJ9103C41xcIZbWBS8F2yuJWecFnKwCfQyO7BdAQZB3EZTwB+ZRs4DYZgpI=
=nmry
-----END PGP SIGNATURE-----

--9LE97oNtwtUIpsaR--

--===============1728390492==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============1728390492==--
