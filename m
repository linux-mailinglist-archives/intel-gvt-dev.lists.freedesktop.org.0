Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5241438042C
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 14 May 2021 09:27:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0589A6EE1B;
	Fri, 14 May 2021 07:27:11 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A84C86EE19;
 Fri, 14 May 2021 07:27:09 +0000 (UTC)
IronPort-SDR: dspuF2inPzbIrifYih81VvsA6WFYk0mbgG9I3hKmzmJwUjKe9FFNxVB7K4WjsxqLjCovaXDJ1b
 Os8ITNfF5yIg==
X-IronPort-AV: E=McAfee;i="6200,9189,9983"; a="261369493"
X-IronPort-AV: E=Sophos;i="5.82,299,1613462400"; 
 d="asc'?scan'208";a="261369493"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2021 00:27:08 -0700
IronPort-SDR: /2CUr416hsxZEFJzvNSSZcwQAXHG+hhttZBO66BpG2BgNVXcSBMxLuS2ocrAhR5kW8MwheJ5O4
 u/Ev88EgzQgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,299,1613462400"; 
 d="asc'?scan'208";a="393529228"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by orsmga006.jf.intel.com with ESMTP; 14 May 2021 00:27:07 -0700
Date: Fri, 14 May 2021 15:08:08 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 1/3] drm/i915/gvt: Move mdev attribute groups into kvmgt
 module
Message-ID: <20210514070808.GW4589@zhen-hp.sh.intel.com>
References: <20210511083332.1740601-1-zhenyuw@linux.intel.com>
 <20210511083332.1740601-2-zhenyuw@linux.intel.com>
 <20210511155446.GB1096940@ziepe.ca>
 <20210512023141.GN4589@zhen-hp.sh.intel.com>
 <20210512124739.GC1096940@ziepe.ca>
 <20210513045647.GQ4589@zhen-hp.sh.intel.com>
 <20210513120249.GH1096940@ziepe.ca>
MIME-Version: 1.0
In-Reply-To: <20210513120249.GH1096940@ziepe.ca>
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
Content-Type: multipart/mixed; boundary="===============1457713288=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1457713288==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0z5c7mBtSy1wdr4F"
Content-Disposition: inline


--0z5c7mBtSy1wdr4F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2021.05.13 09:02:49 -0300, Jason Gunthorpe wrote:
> On Thu, May 13, 2021 at 12:56:47PM +0800, Zhenyu Wang wrote:
> > On 2021.05.12 09:47:39 -0300, Jason Gunthorpe wrote:
> > > On Wed, May 12, 2021 at 10:31:41AM +0800, Zhenyu Wang wrote:
> > >=20
> > > > > This need to go into the vfio tree in some way, either directly
> > > > > through it, via rc or otherwise
> > > >=20
> > > > As this is only for i915/gvt, once drm/i915 backmerge with linus ma=
ster,
> > > > it should still go through normal i915/gvt merge path.
> > >=20
> > > Don't do this, you will create conflicts with ongoing vfio work.
> > >=20
> >=20
> > Sure, there always could be conflict, which means you need to rebase on=
to
> > this cleanup. Would that a problem?=20
>=20
> Yes.
>=20
> > I'd want to fix current workaround in 5.13-rc.
>=20
> This doesn't seem like a rc candiate to me, but going to -rc is also
> fine.
>=20
> > Merging i915/gvt only change through vfio doesn't make sense to me,
>=20
> You need to do it to avoid major conflicts for stuff that will go into
> the vfio tree this cycle.

Looks apply to vfio/for-linus is fine, and vfio/next missed gvt change to
apply...but not conflict with any new stuff. Alex, pls let me know if you
have any concern of this.

>=20
> VFIO drivers should not be outside drivers/vfio/ in the first place,
> and this shows why.
>=20

Well, I can't agree, otherwise that'll be dependency nightmare for device
driver writer. ;)


--0z5c7mBtSy1wdr4F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCYJ4h0QAKCRCxBBozTXgY
J5qhAJ4wnUbFCxgVPi7+gbWLXR4UFO0QBQCdGuqANsOlLWqyftWJYlUYabo/CDo=
=YhZJ
-----END PGP SIGNATURE-----

--0z5c7mBtSy1wdr4F--

--===============1457713288==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============1457713288==--
