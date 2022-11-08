Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C63620983
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  8 Nov 2022 07:20:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60FA810E1FB;
	Tue,  8 Nov 2022 06:20:37 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0849E10E1FB
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  8 Nov 2022 06:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667888432; x=1699424432;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=JtPtQveGJ8egC8PaYrVN7lFHsZd+HNlUQHks51bie4M=;
 b=KtCzem7F83XzbuUiZO3S1Z/i8QXoyt+bS9nMy6K+uFkzo3pRm9zAqfVZ
 m7oXaE/dG+2w1NF1xpWSdeDDZVRYa4fcZvexvsWfV88mEtDFCKcNgBtfF
 ErmI12fFhmnFAU+nJNut4OLQp+QgVl4AD8YHYE6gYTX9mrJ9kqXvwLuUu
 B4w7Gsge0g89zFUvjWjt7bkEPIUD6f574M/fB6k+RSjLUV1WSsVIlVMor
 jkPi7Zmhb2tEq4mTRia9CBnMAkfeo3vqfL9RFZD22DIShz2O3QHtDPInc
 rvuoTw4Dliebf2NKiEFML6QyEluwjI2r8Dl8SX2Jr5taOfzr1lPo4Gtc1 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="312405711"
X-IronPort-AV: E=Sophos;i="5.96,147,1665471600"; 
 d="asc'?scan'208";a="312405711"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 22:20:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="587257341"
X-IronPort-AV: E=Sophos;i="5.96,147,1665471600"; 
 d="asc'?scan'208";a="587257341"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.159.108])
 by orsmga003.jf.intel.com with ESMTP; 07 Nov 2022 22:20:22 -0800
Date: Tue, 8 Nov 2022 14:19:57 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Zhi Wang <zhi.wang.linux2@gmail.com>
Subject: Re: [PATCH 1/3] drm/i915/gvt: remove the vgpu->released and its
 sanity check
Message-ID: <20221108061957.GG30028@zhen-hp.sh.intel.com>
References: <20221104145652.1570-1-zhi.a.wang@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="FCuugMFkClbJLl1L"
Content-Disposition: inline
In-Reply-To: <20221104145652.1570-1-zhi.a.wang@intel.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Alex Williamson <alex.williamson@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--FCuugMFkClbJLl1L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2022.11.04 14:56:50 +0000, Zhi Wang wrote:
> The life cycle of a vGPU, which is represented by a vfio_device, has been
> managed by the VFIO core logic. Remove the vgpu->released, which was used
> for a sanity check on the removal path of the vGPU instance. The sanity
> check has already been covered in the VFIO core logic.
>=20
> Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
> Cc: Kevin Tian <kevin.tian@intel.com>
> Cc: Jason Gunthorpe <jgg@nvidia.com>
> Cc: intel-gvt-dev@lists.freedesktop.org
> Suggested-by: Alex Williamson <alex.williamson@redhat.com>
> Signed-off-by: Zhi Wang <zhi.a.wang@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/gvt.h   | 2 --
>  drivers/gpu/drm/i915/gvt/kvmgt.c | 4 ----
>  2 files changed, 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gv=
t.h
> index dbf8d7470b2c..62823c0e13ab 100644
> --- a/drivers/gpu/drm/i915/gvt/gvt.h
> +++ b/drivers/gpu/drm/i915/gvt/gvt.h
> @@ -227,8 +227,6 @@ struct intel_vgpu {
>  	unsigned long nr_cache_entries;
>  	struct mutex cache_lock;
> =20
> -	atomic_t released;
> -
>  	struct kvm_page_track_notifier_node track_node;
>  #define NR_BKT (1 << 18)
>  	struct hlist_head ptable[NR_BKT];
> diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/=
kvmgt.c
> index 7a45e5360caf..897b6fdbbaed 100644
> --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
> @@ -684,7 +684,6 @@ static int intel_vgpu_open_device(struct vfio_device =
*vfio_dev)
> =20
>  	intel_gvt_activate_vgpu(vgpu);
> =20
> -	atomic_set(&vgpu->released, 0);
>  	return 0;
>  }
> =20
> @@ -706,9 +705,6 @@ static void intel_vgpu_close_device(struct vfio_devic=
e *vfio_dev)
>  	if (!vgpu->attached)
>  		return;
> =20
> -	if (atomic_cmpxchg(&vgpu->released, 0, 1))
> -		return;
> -
>  	intel_gvt_release_vgpu(vgpu);
> =20
>  	debugfs_remove(debugfs_lookup(KVMGT_DEBUGFS_FILENAME, vgpu->debugfs));
> --=20
> 2.25.1
>=20

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

--FCuugMFkClbJLl1L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCY2n1BwAKCRCxBBozTXgY
J0ZIAJwIo4jGGYL+v//KQKqgy7uHmaNtKQCfWaimhVSs6dKrcDYa/9qeAKVaH3c=
=L7eS
-----END PGP SIGNATURE-----

--FCuugMFkClbJLl1L--
