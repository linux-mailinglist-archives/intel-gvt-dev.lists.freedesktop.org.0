Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0DB11DC81
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 13 Dec 2019 04:13:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 263A26E261;
	Fri, 13 Dec 2019 03:13:02 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5852D6E261
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 13 Dec 2019 03:13:01 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Dec 2019 19:13:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,308,1571727600"; 
 d="asc'?scan'208";a="216503217"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by orsmga003.jf.intel.com with ESMTP; 12 Dec 2019 19:12:59 -0800
Date: Fri, 13 Dec 2019 11:11:21 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: "Zhang, Tina" <tina.zhang@intel.com>
Subject: Re: [PATCH] drm/i915/gvt: set guest display buffer as readonly
Message-ID: <20191213031121.GF21662@zhen-hp.sh.intel.com>
References: <20191212081452.317-1-zhenyuw@linux.intel.com>
 <237F54289DF84E4997F34151298ABEBC877DAF0C@SHSMSX101.ccr.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <237F54289DF84E4997F34151298ABEBC877DAF0C@SHSMSX101.ccr.corp.intel.com>
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
Cc: "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0521554705=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0521554705==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="at6+YcpfzWZg/htY"
Content-Disposition: inline


--at6+YcpfzWZg/htY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.12.12 08:51:09 +0000, Zhang, Tina wrote:
>=20
>=20
> > -----Original Message-----
> > From: Zhenyu Wang <zhenyuw@linux.intel.com>
> > Sent: Thursday, December 12, 2019 4:15 PM
> > To: intel-gvt-dev@lists.freedesktop.org
> > Cc: Zhang, Tina <tina.zhang@intel.com>
> > Subject: [PATCH] drm/i915/gvt: set guest display buffer as readonly
> >=20
> > We shouldn't allow write for exporsed guest display buffer which doesn't
> > make sense. So explicitly set read only flag for display dmabuf allocat=
ed
> > object.
> >=20
> > Fixes: e546e281d33d ("drm/i915/gvt: Dmabuf support for GVT-g")
> > Cc: Tina Zhang <tina.zhang@intel.com>
> > Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>
> > ---
> >  drivers/gpu/drm/i915/gvt/dmabuf.c | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/drivers/gpu/drm/i915/gvt/dmabuf.c
> > b/drivers/gpu/drm/i915/gvt/dmabuf.c
> > index e451298d11c3..ee0f3094e6d0 100644
> > --- a/drivers/gpu/drm/i915/gvt/dmabuf.c
> > +++ b/drivers/gpu/drm/i915/gvt/dmabuf.c
> > @@ -163,6 +163,7 @@ static struct drm_i915_gem_object
> > *vgpu_create_gem(struct drm_device *dev,
> >  	drm_gem_private_object_init(dev, &obj->base,
> >  		roundup(info->size, PAGE_SIZE));
> >  	i915_gem_object_init(obj, &intel_vgpu_gem_ops, &lock_class);
> > +	i915_gem_object_set_readonly(obj);
>=20
> Looks good to me. Thanks.
>

I'll take this as acked-by. Thanks

> BR,
> Tina
> >=20
> >  	obj->read_domains =3D I915_GEM_DOMAIN_GTT;
> >  	obj->write_domain =3D 0;
> > --
> > 2.24.0
>=20
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--at6+YcpfzWZg/htY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXfMBWQAKCRCxBBozTXgY
J7lvAJ9ZPuwADg54e9C6dI3NTU8OEpVt8wCfT1LYEm71K9/IHXsSr9Z4VdwNpwE=
=tOSU
-----END PGP SIGNATURE-----

--at6+YcpfzWZg/htY--

--===============0521554705==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0521554705==--
