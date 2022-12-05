Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA46F642162
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  5 Dec 2022 03:08:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51F8A10E093;
	Mon,  5 Dec 2022 02:08:47 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C27710E093
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  5 Dec 2022 02:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670206125; x=1701742125;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=Uwb0j0vOSLTTI1yh+/S8G5w86vEZ102AbpppaI2wcK8=;
 b=IgqfUtPyXS1d74gHJ50eoBjyMktbfczowhczqGPcwZY6nUC2aSFrXgVN
 Ow0Y8JWWJv8RmVK5hLhK77ALd+iAQ2EkGgv0JWJZ5UEC7hu1r9mYIXLE1
 pAopteTUt3SHIY0fEV4QUqG/5eH9ybBP7KZ7gqkw6ZW+v68FwINhLWbLR
 t3UX9rb4ajS37bT9q1MICGv4d5FLnlV3ubLylrQVf0H6e76rFKidW8vbe
 rTSrbBJ2evLJiFlf/ITtwJtJiQ2VpqQrtpN1ShnVGmo2oUJ5hy/gsx+dA
 Dl/LaKGB3puuB9QLRwrqVtW8hJtcGypfKS+9M2LO9peBG1/6SjkPuynTv A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10551"; a="343232985"
X-IronPort-AV: E=Sophos;i="5.96,218,1665471600"; 
 d="asc'?scan'208";a="343232985"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2022 18:08:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10551"; a="596028083"
X-IronPort-AV: E=Sophos;i="5.96,218,1665471600"; 
 d="asc'?scan'208";a="596028083"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.159.108])
 by orsmga003.jf.intel.com with ESMTP; 04 Dec 2022 18:08:32 -0800
Date: Mon, 5 Dec 2022 10:07:08 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Yi Liu <yi.l.liu@intel.com>
Subject: Re: [[iommufd] PATCH v3 1/2] i915/gvt: Move gvt mapping cache
 initialization to intel_vgpu_init_dev()
Message-ID: <20221205020708.GA30028@zhen-hp.sh.intel.com>
References: <20221202135402.756470-1-yi.l.liu@intel.com>
 <20221202135402.756470-2-yi.l.liu@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="f6M9UaX53EEZorp0"
Content-Disposition: inline
In-Reply-To: <20221202135402.756470-2-yi.l.liu@intel.com>
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
Cc: linux-s390@vger.kernel.org, kevin.tian@intel.com, yi.y.sun@linux.intel.com,
 kvm@vger.kernel.org, mjrosato@linux.ibm.com,
 Zhenyu Wang <zhenyuw@linux.intel.com>, alex.williamson@redhat.com,
 jgg@nvidia.com, chao.p.peng@linux.intel.com,
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--f6M9UaX53EEZorp0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2022.12.02 05:54:01 -0800, Yi Liu wrote:
> vfio container registers .dma_unmap() callback after the device is opened.
> So it's fine for mdev drivers to initialize internal mapping cache in
> .open_device(). See vfio_device_container_register().
>=20
> Now with iommufd an access ops with an unmap callback is registered
> when the device is bound to iommufd which is before .open_device()
> is called. This implies gvt's .dma_unmap() could be called before its
> internal mapping cache is initialized.
>=20
> The fix is moving gvt mapping cache initialization to vGPU init. While
> at it also move ptable initialization together.
>=20
> Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
> Cc: Zhi Wang <zhi.a.wang@intel.com>
> Cc: Kevin Tian <kevin.tian@intel.com>
> Cc: intel-gvt-dev@lists.freedesktop.org
> Reviewed-by: Zhi Wang <zhi.a.wang@intel.com>
> Signed-off-by: Yi Liu <yi.l.liu@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/kvmgt.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/=
kvmgt.c
> index 7a45e5360caf..aaf0d9e8da95 100644
> --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
> @@ -671,9 +671,6 @@ static int intel_vgpu_open_device(struct vfio_device =
*vfio_dev)
> =20
>  	vgpu->attached =3D true;
> =20
> -	kvmgt_protect_table_init(vgpu);
> -	gvt_cache_init(vgpu);
> -
>  	vgpu->track_node.track_write =3D kvmgt_page_track_write;
>  	vgpu->track_node.track_flush_slot =3D kvmgt_page_track_flush_slot;
>  	kvm_page_track_register_notifier(vgpu->vfio_device.kvm,
> @@ -718,6 +715,11 @@ static void intel_vgpu_close_device(struct vfio_devi=
ce *vfio_dev)
>  	kvmgt_protect_table_destroy(vgpu);
>  	gvt_cache_destroy(vgpu);
> =20
> +	WARN_ON(vgpu->nr_cache_entries);
> +
> +	vgpu->gfn_cache =3D RB_ROOT;
> +	vgpu->dma_addr_cache =3D RB_ROOT;
> +
>  	intel_vgpu_release_msi_eventfd_ctx(vgpu);
> =20
>  	vgpu->attached =3D false;
> @@ -1451,9 +1453,17 @@ static int intel_vgpu_init_dev(struct vfio_device =
*vfio_dev)
>  	struct intel_vgpu *vgpu =3D vfio_dev_to_vgpu(vfio_dev);
>  	struct intel_vgpu_type *type =3D
>  		container_of(mdev->type, struct intel_vgpu_type, type);
> +	int ret;
> =20
>  	vgpu->gvt =3D kdev_to_i915(mdev->type->parent->dev)->gvt;
> -	return intel_gvt_create_vgpu(vgpu, type->conf);
> +	ret =3D intel_gvt_create_vgpu(vgpu, type->conf);
> +	if (ret)
> +		return ret;
> +
> +	kvmgt_protect_table_init(vgpu);
> +	gvt_cache_init(vgpu);
> +
> +	return 0;
>  }
> =20
>  static void intel_vgpu_release_dev(struct vfio_device *vfio_dev)
> --=20

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

thanks!

--f6M9UaX53EEZorp0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCY41SRgAKCRCxBBozTXgY
Jz/rAKCf2XCkaQP0WhdwmGPDUwLtuGdwAgCfekY0SY9P43VoLP1yapxS6J6QSro=
=Ndmv
-----END PGP SIGNATURE-----

--f6M9UaX53EEZorp0--
