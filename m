Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6EE63EA3C
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  1 Dec 2022 08:22:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7BFA10E53E;
	Thu,  1 Dec 2022 07:22:43 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A03610E53E
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  1 Dec 2022 07:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669879360; x=1701415360;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=8iutSBSwv2isV04FKcwf/O2ymTiTu3KDIqYbJFYhJZg=;
 b=DBMHOop75g6CfN41bbaWmEnWLXvgjAIpNQImG7FkqSjhJ4fj2nqjYcKy
 HoRZi4YJBDAdy9qaUYbz6uCE074pLcwV+eA8l2hpixeYwhTa20mriZ+4e
 SID3g01GwRqDtFQrvvcT/AsbibdgEqvJ3/7qUwDjGi76rWYohMILR7rCK
 r04eVfS9bSRPlUx6LkRqCEl66lcYflkN0p4BfUoSy8HTeFFqK79mGD+jH
 xxTkykh7Uodr1/TSDVYGltF67jWKOXCt5mQw4b6XMpdm6MjmizlTNdX0s
 SGPjMWz4ERhXkJd728ttICtyqAkIEHx57+zSk2xb5UcqeBslIcMyzrVy7 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="303217134"
X-IronPort-AV: E=Sophos;i="5.96,207,1665471600"; 
 d="asc'?scan'208";a="303217134"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2022 23:22:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="707961135"
X-IronPort-AV: E=Sophos;i="5.96,207,1665471600"; 
 d="asc'?scan'208";a="707961135"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.159.108])
 by fmsmga008.fm.intel.com with ESMTP; 30 Nov 2022 23:22:35 -0800
Date: Thu, 1 Dec 2022 15:21:19 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Yi Liu <yi.l.liu@intel.com>
Subject: Re: [[RESEND] iommufd PATCH v2 1/2] i915/gvt: Move gvt mapping cache
 initialization to intel_vgpu_init_dev()
Message-ID: <20221201072119.GZ30028@zhen-hp.sh.intel.com>
References: <20221129105831.466954-1-yi.l.liu@intel.com>
 <20221129105831.466954-2-yi.l.liu@intel.com>
 <20221201032531.GY30028@zhen-hp.sh.intel.com>
 <47b0f601-5022-c083-44e8-4048031dddd4@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="vru7fAags9pVPvn5"
Content-Disposition: inline
In-Reply-To: <47b0f601-5022-c083-44e8-4048031dddd4@intel.com>
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
 kvm@vger.kernel.org, mjrosato@linux.ibm.com, alex.williamson@redhat.com,
 jgg@nvidia.com, chao.p.peng@linux.intel.com,
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--vru7fAags9pVPvn5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2022.12.01 12:18:29 +0800, Yi Liu wrote:
> On 2022/12/1 11:25, Zhenyu Wang wrote:
> > On 2022.11.29 02:58:30 -0800, Yi Liu wrote:
> > > vfio container registers .dma_unmap() callback after the device is op=
ened.
> > > So it's fine for mdev drivers to initialize internal mapping cache in
> > > .open_device(). See vfio_device_container_register().
> > >=20
> > > Now with iommufd an access ops with an unmap callback is registered
> > > when the device is bound to iommufd which is before .open_device()
> > > is called. This implies gvt's .dma_unmap() could be called before its
> > > internal mapping cache is initialized.
> > >=20
> > > The fix is moving gvt mapping cache initialization to vGPU init. While
> > > at it also move ptable initialization together.
> > >=20
> > > Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
> > > Cc: Zhi Wang <zhi.a.wang@intel.com>
> > > Cc: Kevin Tian <kevin.tian@intel.com>
> > > Cc: intel-gvt-dev@lists.freedesktop.org
> > > Reviewed-by: Zhi Wang <zhi.a.wang@intel.com>
> > > Signed-off-by: Yi Liu <yi.l.liu@intel.com>
> > > ---
> > >   drivers/gpu/drm/i915/gvt/kvmgt.c | 13 +++++++++----
> > >   1 file changed, 9 insertions(+), 4 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/=
gvt/kvmgt.c
> > > index 7a45e5360caf..f563e5dbe66f 100644
> > > --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> > > +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
> > > @@ -671,9 +671,6 @@ static int intel_vgpu_open_device(struct vfio_dev=
ice *vfio_dev)
> > >   	vgpu->attached =3D true;
> > > -	kvmgt_protect_table_init(vgpu);
> > > -	gvt_cache_init(vgpu);
> > > -
> > >   	vgpu->track_node.track_write =3D kvmgt_page_track_write;
> > >   	vgpu->track_node.track_flush_slot =3D kvmgt_page_track_flush_slot;
> > >   	kvm_page_track_register_notifier(vgpu->vfio_device.kvm,
> > > @@ -1451,9 +1448,17 @@ static int intel_vgpu_init_dev(struct vfio_dev=
ice *vfio_dev)
> > >   	struct intel_vgpu *vgpu =3D vfio_dev_to_vgpu(vfio_dev);
> > >   	struct intel_vgpu_type *type =3D
> > >   		container_of(mdev->type, struct intel_vgpu_type, type);
> > > +	int ret;
> > >   	vgpu->gvt =3D kdev_to_i915(mdev->type->parent->dev)->gvt;
> > > -	return intel_gvt_create_vgpu(vgpu, type->conf);
> > > +	ret =3D intel_gvt_create_vgpu(vgpu, type->conf);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	kvmgt_protect_table_init(vgpu);
> > > +	gvt_cache_init(vgpu);
> > > +
> > > +	return 0;
> >=20
> > I'm fine with this change, but could we add some sanity check at close
> > time to ensure we clean up any internal cache? Btw, do we need to reset
> > rbtree root pointer?
>=20
> I noticed there is gvt_cache_destroy() in intel_vgpu_close_device(). This
> cleans up the internal cache. So even the rbtree root is valid, it is an
> empty per close_device(). isn't it?
>

I'd like to see an explicit sanity check on vgpu->nr_cache_entries and
reset rb root at close time, which matches current code behavior, but
not need to do re-init.

> > >   }
> > >   static void intel_vgpu_release_dev(struct vfio_device *vfio_dev)
> > > --=20
> > > 2.34.1
> > >=20
>=20
> --=20
> Regards,
> Yi Liu

--vru7fAags9pVPvn5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCY4hV6gAKCRCxBBozTXgY
J8/aAJ9kQlNMWvwUjNrY85ogji/JzmD/1gCeM/7UbFQNw5OwbodmZrFSaoj96ZQ=
=BUv/
-----END PGP SIGNATURE-----

--vru7fAags9pVPvn5--
