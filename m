Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD62F36E36E
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 29 Apr 2021 04:58:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AC286EC64;
	Thu, 29 Apr 2021 02:58:56 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B86176EC64;
 Thu, 29 Apr 2021 02:58:54 +0000 (UTC)
IronPort-SDR: 3sp3vKQQsS4f+gYAqUllRUYn6g3AeCv5Vx9rbrZFyL9vtb0zXmL+IcVY6R5txOAnXfNioAoGfL
 m8IMDFiMcogQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9968"; a="184381227"
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; 
 d="asc'?scan'208";a="184381227"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2021 19:58:53 -0700
IronPort-SDR: r0EPBfyNq+p45xcVM17eTYnqRp0l4drlqSR+DHe5XQzw+sjyZODgbr6cpUsWc+5VWXPwhnd3A6
 wHQUHJlhyBdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; 
 d="asc'?scan'208";a="448261295"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by fmsmga004.fm.intel.com with ESMTP; 28 Apr 2021 19:58:51 -0700
Date: Thu, 29 Apr 2021 10:40:27 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 1/2] drm/i915/gvt: Move mdev attribute groups into kvmgt
 module
Message-ID: <20210429024027.GR1551@zhen-hp.sh.intel.com>
References: <20210426094143.4031527-1-zhenyuw@linux.intel.com>
 <20210426133924.GK2047089@ziepe.ca>
 <20210427024506.GL1551@zhen-hp.sh.intel.com>
 <20210427121235.GM2047089@ziepe.ca>
 <20210428053243.GQ1551@zhen-hp.sh.intel.com>
 <20210428172141.GW2047089@ziepe.ca>
MIME-Version: 1.0
In-Reply-To: <20210428172141.GW2047089@ziepe.ca>
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
Content-Type: multipart/mixed; boundary="===============0568811380=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0568811380==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+RqgOR8y65RRYhVY"
Content-Disposition: inline


--+RqgOR8y65RRYhVY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2021.04.28 14:21:41 -0300, Jason Gunthorpe wrote:
> On Wed, Apr 28, 2021 at 01:32:43PM +0800, Zhenyu Wang wrote:
> > On 2021.04.27 09:12:35 -0300, Jason Gunthorpe wrote:
> > > On Tue, Apr 27, 2021 at 10:45:06AM +0800, Zhenyu Wang wrote:
> > > > On 2021.04.26 10:39:24 -0300, Jason Gunthorpe wrote:
> > > > > On Mon, Apr 26, 2021 at 05:41:42PM +0800, Zhenyu Wang wrote:
> > > > > > @@ -1667,19 +1773,26 @@ static struct mdev_parent_ops intel_vgp=
u_ops =3D {
> > > > > > =20
> > > > > >  static int kvmgt_host_init(struct device *dev, void *gvt, cons=
t void *ops)
> > > > > >  {
> > > > > > -	struct attribute_group **kvm_vgpu_type_groups;
> > > > > > +	int ret;
> > > > > > +
> > > > > > +	ret =3D intel_gvt_init_vgpu_type_groups((struct intel_gvt *)g=
vt);
> > > > > > +	if (ret)
> > > > > > +		return ret;
> > > > > > =20
> > > > > >  	intel_gvt_ops =3D ops;
> > > > > > -	if (!intel_gvt_ops->get_gvt_attrs(&kvm_vgpu_type_groups))
> > > > > > -		return -EFAULT;
> > > > > > -	intel_vgpu_ops.supported_type_groups =3D kvm_vgpu_type_groups;
> > > > > > +	intel_vgpu_ops.supported_type_groups =3D gvt_vgpu_type_groups;
> > > > >=20
> > > > > This patch is an improvement, but this fictional dynamic behavior=
 is
> > > > > still wrong. The supported_type_groups directly flows from the
> > > > > vgpu_types array in vgpu.c and it should not be split up like this
> > > > >=20
> > > > > The code copies the rodata vgpu_types into dynamic memory gvt->ty=
pes
> > > > > then copies that dynamic memory into a dynamic gvt_vgpu_type_grou=
ps,
> > > > > which makes very little sense at all.
> > > >=20
> > > > vgpu_types is static for we want fixed vgpu mdev type, but actual s=
upported
> > > > types depend on HW resources e.g aperture mem, fence, etc, that's d=
ynamic for
> > > > gvt->types, so gvt_vgpu_type_groups is dynamic from gvt->types.
> > >=20
> > > Well, that's worse then, intel_vgpu_ops.supported_type_groups is a
> > > static global, it cannot depend on HW variable calculations.
> >=20
> > sorry, maybe I didn't describe this properly, gvt_vgpu_type_groups is
> > static global, but the actual supported types is determined from
> > gvt->types and initialized before mdev device register.
>=20
> No, I got it, I saw the code too.
>=20
> Think about what happens if there are two GPUs in the system, you get
> two gvt's and with different properties and you are trying to squeeze
> that into a single static global - it doesn't work.=20
>=20

Well, that's not what this change trys to resolve and on gvt supported plat=
form
that's not an available hardware configuration for IGD. So I think this is =
fine.


--+RqgOR8y65RRYhVY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCYIoclQAKCRCxBBozTXgY
J8M3AJsHt9GkId1hjOgCuEVIzrJEOVnuvgCgl6EW2/4grHb4+OS5wqUxiqPAzUU=
=B8Om
-----END PGP SIGNATURE-----

--+RqgOR8y65RRYhVY--

--===============0568811380==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0568811380==--
