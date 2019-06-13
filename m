Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB3043432
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 13 Jun 2019 10:38:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A227D897E7;
	Thu, 13 Jun 2019 08:38:37 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43596897E9
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 13 Jun 2019 08:38:36 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Jun 2019 01:38:35 -0700
X-ExtLoop1: 1
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by fmsmga004.fm.intel.com with ESMTP; 13 Jun 2019 01:38:36 -0700
Date: Thu, 13 Jun 2019 16:36:43 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: "Li, Weinan Z" <weinan.z.li@intel.com>
Subject: Re: [PATCH] drm/i915/gvt: always return zero if read pvinfo failed
Message-ID: <20190613083643.GO9684@zhen-hp.sh.intel.com>
References: <20190613030517.30539-1-weinan.z.li@intel.com>
 <20190613081510.GN9684@zhen-hp.sh.intel.com>
 <9BD218709B5F2A4F96F08B4A3B98A89773451256@SHSMSX101.ccr.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <9BD218709B5F2A4F96F08B4A3B98A89773451256@SHSMSX101.ccr.corp.intel.com>
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
Cc: "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1581955527=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1581955527==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7AfkfStYJxYILZKr"
Content-Disposition: inline


--7AfkfStYJxYILZKr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.06.13 08:34:37 +0000, Li, Weinan Z wrote:
> > -----Original Message-----
> > From: Zhenyu Wang [mailto:zhenyuw@linux.intel.com]
> > Sent: Thursday, June 13, 2019 4:15 PM
> > To: Li, Weinan Z <weinan.z.li@intel.com>
> > Cc: intel-gvt-dev@lists.freedesktop.org
> > Subject: Re: [PATCH] drm/i915/gvt: always return zero if read pvinfo fa=
iled
> >=20
> > On 2019.06.13 11:05:17 +0800, Weinan Li wrote:
> > > There is pvinfo reading come from vgpu might be failed, like reading
> > > from one unknown address, now GVT-g returns the vreg which is one
> > > uncertain value. To avoid misunderstanding, GVT-g will always return
> > > zero if reading failed occurred.
> > >
> > > Signed-off-by: Weinan Li <weinan.z.li@intel.com>
> > > ---
> > >  drivers/gpu/drm/i915/gvt/handlers.c | 7 +++++--
> > >  1 file changed, 5 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/i915/gvt/handlers.c
> > > b/drivers/gpu/drm/i915/gvt/handlers.c
> > > index a6ade66349bd..eab657d65276 100644
> > > --- a/drivers/gpu/drm/i915/gvt/handlers.c
> > > +++ b/drivers/gpu/drm/i915/gvt/handlers.c
> > > @@ -1199,9 +1199,12 @@ static int pvinfo_mmio_read(struct intel_vgpu
> > *vgpu, unsigned int offset,
> > >  		invalid_read =3D true;
> > >  		break;
> > >  	}
> > > -	if (invalid_read)
> > > -		gvt_vgpu_err("invalid pvinfo read: [%x:%x] =3D %x\n",
> > > +	if (invalid_read) {
> > > +		gvt_vgpu_err("invalid pvinfo read: [0x%x:0x%x] =3D 0x0 instead of
> > > +0x%x\n",
> > >  				offset, bytes, *(u32 *)p_data);
> > > +		memset(p_data, 0, bytes);
> > > +	}
> > > +
> >=20
> > Shouldn't we make sure to set zero for undefined pvinfo memory?
> > Instead of keep setting return value like this?
> >=20
> There might be usage like this, write first then read back and check the =
return value.
>=20

yeah, better we can follow like reserved bit definition, discard
write for undefined bits and return zero.=20

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--7AfkfStYJxYILZKr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXQILGwAKCRCxBBozTXgY
JzWpAJ4/7pErk3Wm0WvSp4DjssBbnqcaLwCdGmEoYRK/mexbQIRIPhibwo8dWbo=
=+sZ7
-----END PGP SIGNATURE-----

--7AfkfStYJxYILZKr--

--===============1581955527==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============1581955527==--
