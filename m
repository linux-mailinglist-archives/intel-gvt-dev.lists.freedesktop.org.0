Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A8E56693C
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  5 Jul 2022 13:31:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 940BA10F079;
	Tue,  5 Jul 2022 11:29:58 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3CB410E021
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  5 Jul 2022 08:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657010488; x=1688546488;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=10zTO6cjRHm5YSu4wYIH1EEbhmOcJUB5ss5nZC1yDkY=;
 b=WVOBML7GrzRe3rbt/SCTlDsXaG/7Ukl0bEpxl/rAPPaFdCfkYKRjOHie
 sw807Uo0JOPMo0M6MxyLxgETzzn58QutPLwJr2CGkRbCTY6yHXBnnPO8z
 MXhCpeftF0D/eh249cuHTLmB2K78Zzb75KGRRc8NcktuvNrtilfb0UGxX
 Sl2Z0PUmPQ4n1OacyVV5HfrO6sK5F/WWlOwXXrATZhGhmM7ODWW7rIlQb
 FAomIpPcUmcrtMpUC5sFBvfv66/52H6I033PhzNGtJZnT2mFgTbm7ulOz
 6nV/lF9wI+M2DnVhleWxyUzHOTZmY/Xj7xIp3KmG2eCQpN7/cgbooiRQE Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10398"; a="263085004"
X-IronPort-AV: E=Sophos;i="5.92,245,1650956400"; 
 d="asc'?scan'208";a="263085004"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2022 01:41:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,245,1650956400"; 
 d="asc'?scan'208";a="650015050"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.159.108])
 by fmsmga008.fm.intel.com with ESMTP; 05 Jul 2022 01:41:25 -0700
Date: Tue, 5 Jul 2022 16:18:14 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 02/14] drm/i915/gvt: simplify vgpu configuration management
Message-ID: <20220705081814.GX1089@zhen-hp.sh.intel.com>
References: <20220704125144.157288-1-hch@lst.de>
 <20220704125144.157288-3-hch@lst.de>
 <20220705075938.GW1089@zhen-hp.sh.intel.com>
 <20220705082559.GA18584@lst.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="f0Ums9VvOMUG7syy"
Content-Disposition: inline
In-Reply-To: <20220705082559.GA18584@lst.de>
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
 Eric Farman <farman@linux.ibm.com>, kvm@vger.kernel.org,
 Matthew Rosato <mjrosato@linux.ibm.com>, linux-s390@vger.kernel.org,
 Alex Williamson <alex.williamson@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>, intel-gvt-dev@lists.freedesktop.org,
 Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--f0Ums9VvOMUG7syy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2022.07.05 10:25:59 +0200, Christoph Hellwig wrote:
> On Tue, Jul 05, 2022 at 03:59:38PM +0800, Zhenyu Wang wrote:
> > On 2022.07.04 14:51:32 +0200, Christoph Hellwig wrote:
> > > Instead of copying the information from the vgpu_types arrays into ea=
ch
> > > intel_vgpu_type structure, just reference this constant information
> > > with a pointer to the already existing data structure, and pass it in=
to
> > > the low-level VGPU creation helpers intead of copying the data into y=
et
> > > anothe params data structure.
> > >=20
> > > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > > ---
> >=20
> > Looks fine to me. We still carry some legacy codes like vgpu create par=
am
> > originally used for other hypervisor. Thanks for cleaning this up!
>=20
> Note that even there I think this structure makes more sense:
>=20
> The generic config structure that has not vfio-related bits as the
> lowest layer.  vfio/kvm specific structures then carry a pointer to
> it can can pass it to lower layers.

yes, I'm also fine with that part which makes it more straight forward
to link between mdev type and lower level info.

Thanks

--f0Ums9VvOMUG7syy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCYsPzwAAKCRCxBBozTXgY
J6CtAJ9Q3QqM6rUZuDmkhYaWgL6vVPQ0twCfY2mwPeSPyzVbdH9M+sIWLy4kObA=
=f7tM
-----END PGP SIGNATURE-----

--f0Ums9VvOMUG7syy--
