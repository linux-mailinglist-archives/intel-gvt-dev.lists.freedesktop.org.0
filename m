Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B77636BD9D
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 27 Apr 2021 05:03:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C709A6E8E1;
	Tue, 27 Apr 2021 03:03:28 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 888056E8E1;
 Tue, 27 Apr 2021 03:03:27 +0000 (UTC)
IronPort-SDR: Q4KDA/POy3Cz7uv4j2tPiK+9Spkzs01Ctet2ZIa9RdIIsiXXN7ADvn6h7942Zrj/VgAMyoKBOy
 YkXZ5isTufCg==
X-IronPort-AV: E=McAfee;i="6200,9189,9966"; a="217142902"
X-IronPort-AV: E=Sophos;i="5.82,252,1613462400"; 
 d="asc'?scan'208";a="217142902"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2021 20:03:27 -0700
IronPort-SDR: CQ5ieFRbxplKSLTDOnlfQzNGIv+CG1WcG5/OBJF5kf2Rkf5qzcJ2rSJVDQqsrmJ1d2jOWF/CQS
 0gdUmZ7npklw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,252,1613462400"; 
 d="asc'?scan'208";a="447464673"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by fmsmga004.fm.intel.com with ESMTP; 26 Apr 2021 20:03:25 -0700
Date: Tue, 27 Apr 2021 10:45:06 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 1/2] drm/i915/gvt: Move mdev attribute groups into kvmgt
 module
Message-ID: <20210427024506.GL1551@zhen-hp.sh.intel.com>
References: <20210426094143.4031527-1-zhenyuw@linux.intel.com>
 <20210426133924.GK2047089@ziepe.ca>
MIME-Version: 1.0
In-Reply-To: <20210426133924.GK2047089@ziepe.ca>
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
Content-Type: multipart/mixed; boundary="===============1286533429=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1286533429==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="p1zSJVlfBL7BTggM"
Content-Disposition: inline


--p1zSJVlfBL7BTggM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2021.04.26 10:39:24 -0300, Jason Gunthorpe wrote:
> On Mon, Apr 26, 2021 at 05:41:42PM +0800, Zhenyu Wang wrote:
> > @@ -1667,19 +1773,26 @@ static struct mdev_parent_ops intel_vgpu_ops =
=3D {
> > =20
> >  static int kvmgt_host_init(struct device *dev, void *gvt, const void *=
ops)
> >  {
> > -	struct attribute_group **kvm_vgpu_type_groups;
> > +	int ret;
> > +
> > +	ret =3D intel_gvt_init_vgpu_type_groups((struct intel_gvt *)gvt);
> > +	if (ret)
> > +		return ret;
> > =20
> >  	intel_gvt_ops =3D ops;
> > -	if (!intel_gvt_ops->get_gvt_attrs(&kvm_vgpu_type_groups))
> > -		return -EFAULT;
> > -	intel_vgpu_ops.supported_type_groups =3D kvm_vgpu_type_groups;
> > +	intel_vgpu_ops.supported_type_groups =3D gvt_vgpu_type_groups;
>=20
> This patch is an improvement, but this fictional dynamic behavior is
> still wrong. The supported_type_groups directly flows from the
> vgpu_types array in vgpu.c and it should not be split up like this
>=20
> The code copies the rodata vgpu_types into dynamic memory gvt->types
> then copies that dynamic memory into a dynamic gvt_vgpu_type_groups,
> which makes very little sense at all.

vgpu_types is static for we want fixed vgpu mdev type, but actual supported
types depend on HW resources e.g aperture mem, fence, etc, that's dynamic f=
or
gvt->types, so gvt_vgpu_type_groups is dynamic from gvt->types.

>=20
> vgpu_types should be moved to kvmgt and everything should be static,
> like every other mdev driver. Copy the 'type' information from the
> gpu_types static when the mdev is created.
>=20

I don't think that's necessary, as it's not static for gvt at all.
The logic to handle type resource change can still be in vgpu.c


--p1zSJVlfBL7BTggM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCYId6rQAKCRCxBBozTXgY
J3/oAKCLU5oUCRkt03y8cjON92fbcSKKOACfR1jUU3WYmaNEX054Zjp8jKNtXTI=
=YeC2
-----END PGP SIGNATURE-----

--p1zSJVlfBL7BTggM--

--===============1286533429==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============1286533429==--
