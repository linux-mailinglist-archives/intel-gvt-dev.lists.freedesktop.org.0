Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C182154C1F8
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 15 Jun 2022 08:34:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71BF010F154;
	Wed, 15 Jun 2022 06:34:43 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97BA810F154
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 15 Jun 2022 06:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655274881; x=1686810881;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=MbHPNnGlDxuDessM8Cx675Vo8Ix4YcS8iHifZIiU9+4=;
 b=BtvJYQAGcyFWhO/DGSEqoG5Fd57A8X8FgtY/ya5joPKpFzxUNA6FcQTA
 cS7PKQo8iSkR3RDubYMxu8L7Wj1EFQYNbmtLVNa+Td/SHXGSHshCukH/R
 M4idRPTqFFjBUaKPyRt6QXHLkShi+w8WC01Ds1PjBWFdVh2Jh343Lfvmc
 rAO/f0DeGV5IMljoryYsdoJhDgetemvSVv9NW1uvnf2JqN3gottAJpg/v
 mRqqm6Xz9uHH3Wc4ybZCWY0coGNbSPd4NIWKlGoRreBdjQEIvMpCmY8Wt
 dlvs1pqBK8QmyEWqIQpASt3lX7XeTYomGOm7eFzd3W2G3PnLbpZXthBBf A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10378"; a="267543653"
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; 
 d="asc'?scan'208";a="267543653"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2022 23:34:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; 
 d="asc'?scan'208";a="911456112"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.159.108])
 by fmsmga005.fm.intel.com with ESMTP; 14 Jun 2022 23:34:23 -0700
Date: Wed, 15 Jun 2022 14:11:56 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 03/13] vfio/mdev: simplify mdev_type handling
Message-ID: <20220615061156.GU1089@zhen-hp.sh.intel.com>
References: <20220614045428.278494-1-hch@lst.de>
 <20220614045428.278494-4-hch@lst.de>
 <BN9PR11MB5276A3DCE429292860FD85F58CAA9@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20220615062840.GB22728@lst.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="dJyWBSYfjLochwFK"
Content-Disposition: inline
In-Reply-To: <20220615062840.GB22728@lst.de>
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
Cc: Tony Krowiak <akrowiak@linux.ibm.com>, Jason Herne <jjherne@linux.ibm.com>,
 "Tian, Kevin" <kevin.tian@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 Eric Farman <farman@linux.ibm.com>, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Halil Pasic <pasic@linux.ibm.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Wang, Zhi A" <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--dJyWBSYfjLochwFK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2022.06.15 08:28:40 +0200, Christoph Hellwig wrote:
> On Tue, Jun 14, 2022 at 10:06:16AM +0000, Tian, Kevin wrote:
> > > +	gvt->mdev_types =3D kcalloc(num_types, sizeof(*gvt->mdev_types),
> > > +			     GFP_KERNEL);
> > > +	if (!gvt->mdev_types) {
> > > +		kfree(gvt->types);
> > > +		return -ENOMEM;
> > > +	}
> > > +
> > >  	min_low =3D MB_TO_BYTES(32);
> > >  	for (i =3D 0; i < num_types; ++i) {
> > >  		if (low_avail / vgpu_types[i].low_mm =3D=3D 0)
> > > @@ -150,19 +157,21 @@ int intel_gvt_init_vgpu_types(struct intel_gvt =
*gvt)
> > >  						   high_avail /
> > > vgpu_types[i].high_mm);
> >=20
> > there is a memory leak a few lines above:
> >=20
> > if (vgpu_types[i].weight < 1 ||
> > 	vgpu_types[i].weight > VGPU_MAX_WEIGHT)
> > 	return -EINVAL;
> >=20
> > both old code and this patch forgot to free the buffers upon error.

Sorry about that! It should be my original fault...

>=20
> Yeah.  I'll add a patch to the beginning of the series to fix the
> existing leak and will then make sure to not leak the new allocation
> either.

Thanks a lot!

--dJyWBSYfjLochwFK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCYql4JQAKCRCxBBozTXgY
JyXDAKCKZtJH0+Er/ocmCAzJewO/46Bj1gCfaTZHC9zqGahEkP/COKdZH5NCzrQ=
=m2Vj
-----END PGP SIGNATURE-----

--dJyWBSYfjLochwFK--
