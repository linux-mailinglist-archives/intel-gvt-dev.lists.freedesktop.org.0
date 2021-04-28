Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DB936D1D4
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 28 Apr 2021 07:51:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 112B16EAA0;
	Wed, 28 Apr 2021 05:51:09 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 684006EAA0;
 Wed, 28 Apr 2021 05:51:07 +0000 (UTC)
IronPort-SDR: lKAPTJSXJxPOgUzkkjybU7vB5iIR0cpBqR59ZKZzTZbw1lxXnPpyUV8tjjfVrXzoSpm1qKhJHA
 rLN9jO42oZRQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9967"; a="196723597"
X-IronPort-AV: E=Sophos;i="5.82,257,1613462400"; 
 d="asc'?scan'208";a="196723597"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2021 22:51:06 -0700
IronPort-SDR: UnjUfxQi+9H2MRWbvY7J9YbIlG5esP4WDIJWGwmBqo0jlIDBGYoVLuha44h0mdi0AXfS3KwRhB
 zckc2x4J6nGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,257,1613462400"; 
 d="asc'?scan'208";a="447850619"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by fmsmga004.fm.intel.com with ESMTP; 27 Apr 2021 22:51:04 -0700
Date: Wed, 28 Apr 2021 13:32:43 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 1/2] drm/i915/gvt: Move mdev attribute groups into kvmgt
 module
Message-ID: <20210428053243.GQ1551@zhen-hp.sh.intel.com>
References: <20210426094143.4031527-1-zhenyuw@linux.intel.com>
 <20210426133924.GK2047089@ziepe.ca>
 <20210427024506.GL1551@zhen-hp.sh.intel.com>
 <20210427121235.GM2047089@ziepe.ca>
MIME-Version: 1.0
In-Reply-To: <20210427121235.GM2047089@ziepe.ca>
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
Content-Type: multipart/mixed; boundary="===============2032325850=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============2032325850==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vgqGEEhIUeLzQgKp"
Content-Disposition: inline


--vgqGEEhIUeLzQgKp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2021.04.27 09:12:35 -0300, Jason Gunthorpe wrote:
> On Tue, Apr 27, 2021 at 10:45:06AM +0800, Zhenyu Wang wrote:
> > On 2021.04.26 10:39:24 -0300, Jason Gunthorpe wrote:
> > > On Mon, Apr 26, 2021 at 05:41:42PM +0800, Zhenyu Wang wrote:
> > > > @@ -1667,19 +1773,26 @@ static struct mdev_parent_ops intel_vgpu_op=
s =3D {
> > > > =20
> > > >  static int kvmgt_host_init(struct device *dev, void *gvt, const vo=
id *ops)
> > > >  {
> > > > -	struct attribute_group **kvm_vgpu_type_groups;
> > > > +	int ret;
> > > > +
> > > > +	ret =3D intel_gvt_init_vgpu_type_groups((struct intel_gvt *)gvt);
> > > > +	if (ret)
> > > > +		return ret;
> > > > =20
> > > >  	intel_gvt_ops =3D ops;
> > > > -	if (!intel_gvt_ops->get_gvt_attrs(&kvm_vgpu_type_groups))
> > > > -		return -EFAULT;
> > > > -	intel_vgpu_ops.supported_type_groups =3D kvm_vgpu_type_groups;
> > > > +	intel_vgpu_ops.supported_type_groups =3D gvt_vgpu_type_groups;
> > >=20
> > > This patch is an improvement, but this fictional dynamic behavior is
> > > still wrong. The supported_type_groups directly flows from the
> > > vgpu_types array in vgpu.c and it should not be split up like this
> > >=20
> > > The code copies the rodata vgpu_types into dynamic memory gvt->types
> > > then copies that dynamic memory into a dynamic gvt_vgpu_type_groups,
> > > which makes very little sense at all.
> >=20
> > vgpu_types is static for we want fixed vgpu mdev type, but actual suppo=
rted
> > types depend on HW resources e.g aperture mem, fence, etc, that's dynam=
ic for
> > gvt->types, so gvt_vgpu_type_groups is dynamic from gvt->types.
>=20
> Well, that's worse then, intel_vgpu_ops.supported_type_groups is a
> static global, it cannot depend on HW variable calculations.
>=20

sorry, maybe I didn't describe this properly, gvt_vgpu_type_groups is
static global, but the actual supported types is determined from
gvt->types and initialized before mdev device register.

--vgqGEEhIUeLzQgKp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCYIjzdgAKCRCxBBozTXgY
J7bZAJ9WzqdCt7pyV/vPAh0sJRzs6kb3ygCfRuQuRMws2PKZQ0vZnm6NIZepC6A=
=y5ed
-----END PGP SIGNATURE-----

--vgqGEEhIUeLzQgKp--

--===============2032325850==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============2032325850==--
