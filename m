Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E7F6209E8
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  8 Nov 2022 08:15:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED87D10E20B;
	Tue,  8 Nov 2022 07:15:46 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE29F10E20B
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  8 Nov 2022 07:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667891743; x=1699427743;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=W6JK14ZIIXOl4qqMHN2iO99NeJsdlvf6fnL3g4SGVxc=;
 b=eq8IwZZNDfJTmak55CFIUG6/NkZnMplg0Je8cFm740Y2rWPqCq83UFfI
 vCStFdNM4FH5VCrjw5Zhu0zLvpwSWWyoIs0TVhE328K65v/48AR3rHL2f
 K2cSLRxlqbA/Vi87SJQe5ZHNtnCp6tfqrvQoe07/Ju/n5KFHqi0fKz3f9
 VZcUAdDRgJJxx90a8KhH084bZYTSBN/Hs9ozZ7N2/ea2k7PsRqZwRnxJF
 h81cSKX/iAxhqo7ddSuSWe8VXfxI0Mvt6LYdrec+XjZMQIqpDD9GG2i6b
 H99ydLpVdYGYSzC/aR3SQKgF+6rQWHATrnc6GqTrwKwtJsZI9gO5TS6JC A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="312416073"
X-IronPort-AV: E=Sophos;i="5.96,147,1665471600"; 
 d="asc'?scan'208";a="312416073"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 23:15:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="614177851"
X-IronPort-AV: E=Sophos;i="5.96,147,1665471600"; 
 d="asc'?scan'208";a="614177851"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.159.108])
 by orsmga006.jf.intel.com with ESMTP; 07 Nov 2022 23:15:37 -0800
Date: Tue, 8 Nov 2022 15:15:12 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Zhi Wang <zhi.a.wang@intel.com>
Subject: Re: [PATCH 1/3] drm/i915/gvt: remove the vgpu->released and its
 sanity check
Message-ID: <20221108071512.GK30028@zhen-hp.sh.intel.com>
References: <20221104145652.1570-1-zhi.a.wang@intel.com>
 <20221108061957.GG30028@zhen-hp.sh.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="hwvH6HDNit2nSK4j"
Content-Disposition: inline
In-Reply-To: <20221108061957.GG30028@zhen-hp.sh.intel.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Zhi Wang <zhi.wang.linux2@gmail.com>, intel-gvt-dev@lists.freedesktop.org,
 Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--hwvH6HDNit2nSK4j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2022.11.08 14:19:57 +0800, Zhenyu Wang wrote:
> On 2022.11.04 14:56:50 +0000, Zhi Wang wrote:
> > The life cycle of a vGPU, which is represented by a vfio_device, has be=
en
> > managed by the VFIO core logic. Remove the vgpu->released, which was us=
ed
> > for a sanity check on the removal path of the vGPU instance. The sanity
> > check has already been covered in the VFIO core logic.
> >=20
> > Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
> > Cc: Kevin Tian <kevin.tian@intel.com>
> > Cc: Jason Gunthorpe <jgg@nvidia.com>
> > Cc: intel-gvt-dev@lists.freedesktop.org
> > Suggested-by: Alex Williamson <alex.williamson@redhat.com>
> > Signed-off-by: Zhi Wang <zhi.a.wang@intel.com>
> > ---
> >  drivers/gpu/drm/i915/gvt/gvt.h   | 2 --
> >  drivers/gpu/drm/i915/gvt/kvmgt.c | 4 ----
> >  2 files changed, 6 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/=
gvt.h
> > index dbf8d7470b2c..62823c0e13ab 100644
> > --- a/drivers/gpu/drm/i915/gvt/gvt.h
> > +++ b/drivers/gpu/drm/i915/gvt/gvt.h
> > @@ -227,8 +227,6 @@ struct intel_vgpu {
> >  	unsigned long nr_cache_entries;
> >  	struct mutex cache_lock;
> > =20
> > -	atomic_t released;
> > -
> >  	struct kvm_page_track_notifier_node track_node;
> >  #define NR_BKT (1 << 18)
> >  	struct hlist_head ptable[NR_BKT];
> > diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gv=
t/kvmgt.c
> > index 7a45e5360caf..897b6fdbbaed 100644
> > --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> > +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
> > @@ -684,7 +684,6 @@ static int intel_vgpu_open_device(struct vfio_devic=
e *vfio_dev)
> > =20
> >  	intel_gvt_activate_vgpu(vgpu);
> > =20
> > -	atomic_set(&vgpu->released, 0);
> >  	return 0;
> >  }
> > =20
> > @@ -706,9 +705,6 @@ static void intel_vgpu_close_device(struct vfio_dev=
ice *vfio_dev)
> >  	if (!vgpu->attached)
> >  		return;
> > =20
> > -	if (atomic_cmpxchg(&vgpu->released, 0, 1))
> > -		return;
> > -
> >  	intel_gvt_release_vgpu(vgpu);
> > =20
> >  	debugfs_remove(debugfs_lookup(KVMGT_DEBUGFS_FILENAME, vgpu->debugfs));
> > --=20
> > 2.25.1
> >=20
>=20
> Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

Note that I met issue of your author mail zhi.wang.linux2@gmail.com is not =
the one
in signed-off-by, I fixed this one by hand. Could you use proper mail in fo=
llowing send?

thanks

--hwvH6HDNit2nSK4j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCY2oB+wAKCRCxBBozTXgY
J7MlAJ9zJ0hh6TL6tfu2SjyvHf2kpA0q+QCbBdL0/pKqTc2T3WMvB94GqggY3RM=
=9sQ9
-----END PGP SIGNATURE-----

--hwvH6HDNit2nSK4j--
