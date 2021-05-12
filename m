Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9FC37B449
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 12 May 2021 04:50:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 957D56EB58;
	Wed, 12 May 2021 02:50:38 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70CC66EB52;
 Wed, 12 May 2021 02:50:37 +0000 (UTC)
IronPort-SDR: KsbpwRZUY8zp2wRGnng6X/6BPZn3ZeZaLx8EF12Ra94+wSQtBsADqQKZpBBR5/FIRYkqQ95Olz
 mirDlBHpwmyw==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="220570335"
X-IronPort-AV: E=Sophos;i="5.82,292,1613462400"; 
 d="asc'?scan'208";a="220570335"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 19:50:36 -0700
IronPort-SDR: U50Otymi1TI8iip3138dzJSDq00HEl22cCxcCD3hB6FSEZb6oypbEV/eTzljQKGmMsqK7XteTV
 e7phVPwlyIKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,292,1613462400"; 
 d="asc'?scan'208";a="625048502"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by fmsmga005.fm.intel.com with ESMTP; 11 May 2021 19:50:34 -0700
Date: Wed, 12 May 2021 10:31:41 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 1/3] drm/i915/gvt: Move mdev attribute groups into kvmgt
 module
Message-ID: <20210512023141.GN4589@zhen-hp.sh.intel.com>
References: <20210511083332.1740601-1-zhenyuw@linux.intel.com>
 <20210511083332.1740601-2-zhenyuw@linux.intel.com>
 <20210511155446.GB1096940@ziepe.ca>
MIME-Version: 1.0
In-Reply-To: <20210511155446.GB1096940@ziepe.ca>
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
Cc: Arnd Bergmann <arnd@kernel.org>, intel-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org,
 Alex Williamson <alex.williamson@redhat.com>
Content-Type: multipart/mixed; boundary="===============1040805300=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1040805300==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="iFRdW5/EC4oqxDHL"
Content-Disposition: inline


--iFRdW5/EC4oqxDHL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2021.05.11 12:54:46 -0300, Jason Gunthorpe wrote:
> On Tue, May 11, 2021 at 04:33:30PM +0800, Zhenyu Wang wrote:
> > As kvmgt module contains all handling for VFIO/mdev, leaving mdev attri=
bute
> > groups in gvt module caused dependency issue. Although it was there for=
 possible
> > other hypervisor usage, that turns out never to be true. So this moves =
all mdev
> > handling into kvmgt module completely to resolve dependency issue.
> >=20
> > Cc: Arnd Bergmann <arnd@kernel.org>
> > Cc: Jason Gunthorpe <jgg@ziepe.ca>
> > Cc: Alex Williamson <alex.williamson@redhat.com>
> > Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>
> > ---
> >  drivers/gpu/drm/i915/gvt/gvt.c       | 124 +------------------------
> >  drivers/gpu/drm/i915/gvt/gvt.h       |   3 -
> >  drivers/gpu/drm/i915/gvt/hypercall.h |   2 +-
> >  drivers/gpu/drm/i915/gvt/kvmgt.c     | 129 +++++++++++++++++++++++++--
> >  drivers/gpu/drm/i915/gvt/mpt.h       |   4 +-
> >  5 files changed, 126 insertions(+), 136 deletions(-)
>=20
> There is no reason to make this into three patches, just make the one
> line change to kconfig here.
>=20
> > +static struct intel_vgpu_type *
> > +intel_gvt_find_vgpu_type(struct intel_gvt *gvt, unsigned int type_grou=
p_id)
> > +{
> > +	if (WARN_ON(type_group_id >=3D gvt->num_types))
> > +		return NULL;
> > +	return &gvt->types[type_group_id];
> > +}
>=20
> The WARN_ON can't happen, all this error handling is code should be
> deleted, just use the simple
>=20
> struct intel_gvt *gvt =3D kdev_to_i915(mtype_get_parent_dev(mtype))->gvt;
> struct intel_vgpu_type *type =3D &gvt->types[mtype_get_type_group_id(mtyp=
e)]
>=20
> sequence like the other mdev drivers
>=20
> > +static ssize_t available_instances_show(struct mdev_type *mtype,
> > +					struct mdev_type_attribute *attr,
> > +					char *buf)
> > +{
> > +	struct intel_vgpu_type *type;
> > +	unsigned int num =3D 0;
> > +	void *gvt =3D kdev_to_i915(mtype_get_parent_dev(mtype))->gvt;
>=20
> Use proper types not 'void *'
> > +
> > +static int intel_gvt_init_vgpu_type_groups(struct intel_gvt *gvt)
> > +{
> > +	int i, j;
> > +	struct intel_vgpu_type *type;
> > +	struct attribute_group *group;
> > +
> > +	for (i =3D 0; i < gvt->num_types; i++) {
> > +		type =3D &gvt->types[i];
> > +
> > +		group =3D kzalloc(sizeof(struct attribute_group), GFP_KERNEL);
> > +		if (WARN_ON(!group))
> > +			goto unwind;
>=20
> WARN_ON at allocation failure is not good

Thanks for the comments! I left those during code move, will clean them up.

>=20
> This need to go into the vfio tree in some way, either directly
> through it, via rc or otherwise
>=20

As this is only for i915/gvt, once drm/i915 backmerge with linus master,
it should still go through normal i915/gvt merge path.

Thanks

--iFRdW5/EC4oqxDHL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCYJs+BwAKCRCxBBozTXgY
J87PAJsEO48hgiAwaDBVwxv3EJcwinfrewCfWlVNobcdq9ZrtoxgxplUOv3yfAg=
=UK/E
-----END PGP SIGNATURE-----

--iFRdW5/EC4oqxDHL--

--===============1040805300==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============1040805300==--
