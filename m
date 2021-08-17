Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 828063EE2D0
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 17 Aug 2021 03:31:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11CE06E0E9;
	Tue, 17 Aug 2021 01:31:35 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 289CE6E0DF;
 Tue, 17 Aug 2021 01:31:33 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10078"; a="238049580"
X-IronPort-AV: E=Sophos;i="5.84,327,1620716400"; 
 d="asc'?scan'208";a="238049580"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2021 18:31:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,327,1620716400"; 
 d="asc'?scan'208";a="510166288"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.143])
 by fmsmga004.fm.intel.com with ESMTP; 16 Aug 2021 18:31:29 -0700
Date: Tue, 17 Aug 2021 09:08:51 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Jason Gunthorpe <jgg@nvidia.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Greg KH <gregkh@linuxfoundation.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Wang, Zhi A" <zhi.a.wang@intel.com>, Jani Nikula <jani.nikula@intel.com>
Subject: Re: refactor the i915 GVT support
Message-ID: <20210817010851.GW13928@zhen-hp.sh.intel.com>
References: <DM4PR11MB55496531B246A4604FC86998CAE49@DM4PR11MB5549.namprd11.prod.outlook.com>
 <20210722112636.wj277vqhg4dez5ug@sirius.home.kraxel.org>
 <20210727121224.GA2145868@nvidia.com>
 <DM4PR11MB5549EC882AA6076F3468274DCAEA9@DM4PR11MB5549.namprd11.prod.outlook.com>
 <20210728175925.GU1721383@nvidia.com>
 <20210729072022.GB31896@lst.de>
 <20210803094315.GF13928@zhen-hp.sh.intel.com>
 <20210803143058.GA1721383@nvidia.com>
 <20210804052606.GG13928@zhen-hp.sh.intel.com>
 <20210816173458.GA9183@lst.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="VouvK5X/VR+fp5FT"
Content-Disposition: inline
In-Reply-To: <20210816173458.GA9183@lst.de>
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
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--VouvK5X/VR+fp5FT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2021.08.16 19:34:58 +0200, Christoph Hellwig wrote:
> On Wed, Aug 04, 2021 at 01:26:06PM +0800, Zhenyu Wang wrote:
> > On 2021.08.03 11:30:58 -0300, Jason Gunthorpe wrote:
> > > On Tue, Aug 03, 2021 at 05:43:15PM +0800, Zhenyu Wang wrote:
> > > > Acked-by: Zhenyu Wang <zhenyuw@linux.intel.com>
> > > >=20
> > > > Thanks a lot for this effort!
> > >=20
> > > Great, do we have a submission plan for this? how much does it clash
> > > with my open_device/etc patch? ie does the whole thing have to go
> > > through the vfio tree?
> > >=20
> >=20
> > I think Alex would determine when to merge open_device series, gvt part
> > can be through vfio tree without problem. For this refactor, I would fi=
rst
> > merge for gvt staging to do more regression testing before sending thro=
ugh
> > i915 tree.
>=20
> Any updates on this?  I'd really hate to miss this merge window.

I'm still waiting for our validation team's report on this. I'm afraid
it might be missing for next version as i915 merge window is mostly
till rc5...and for any change outside of gvt, it still needs to be
acked by i915 maintainers.

--VouvK5X/VR+fp5FT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCYRsMHgAKCRCxBBozTXgY
J/uZAJ9O1Xv+jB7s4e9+XWerKNMKnBieGACZAXpb2Wyjk+BSDBYt8ZZFoPvmEAw=
=wtSd
-----END PGP SIGNATURE-----

--VouvK5X/VR+fp5FT--
