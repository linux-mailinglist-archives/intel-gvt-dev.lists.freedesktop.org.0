Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6399D37F284
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 13 May 2021 07:15:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A8746E81E;
	Thu, 13 May 2021 05:15:49 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B115E6E81C;
 Thu, 13 May 2021 05:15:47 +0000 (UTC)
IronPort-SDR: j6feI7QrfW7bB91dghv7eDumm6K8brkZIiDuMGdgzdqet3YifLFqmfjemcPq2Adxpzey4fRfkJ
 2/i98S04USRA==
X-IronPort-AV: E=McAfee;i="6200,9189,9982"; a="199926821"
X-IronPort-AV: E=Sophos;i="5.82,296,1613462400"; 
 d="asc'?scan'208";a="199926821"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2021 22:15:45 -0700
IronPort-SDR: ptpG0Smxq/+7Ch5x2vHeX7KXGi0mvp+KIx40jE5a+Z58GxdG4k2PAQinQ8SFh1KZ273p+zZ2YD
 RYkQyKPIiM4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,296,1613462400"; 
 d="asc'?scan'208";a="623150380"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by fmsmga006.fm.intel.com with ESMTP; 12 May 2021 22:15:44 -0700
Date: Thu, 13 May 2021 12:56:47 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 1/3] drm/i915/gvt: Move mdev attribute groups into kvmgt
 module
Message-ID: <20210513045647.GQ4589@zhen-hp.sh.intel.com>
References: <20210511083332.1740601-1-zhenyuw@linux.intel.com>
 <20210511083332.1740601-2-zhenyuw@linux.intel.com>
 <20210511155446.GB1096940@ziepe.ca>
 <20210512023141.GN4589@zhen-hp.sh.intel.com>
 <20210512124739.GC1096940@ziepe.ca>
MIME-Version: 1.0
In-Reply-To: <20210512124739.GC1096940@ziepe.ca>
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
Content-Type: multipart/mixed; boundary="===============1808888394=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1808888394==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wTWi5aaYRw9ix9vO"
Content-Disposition: inline


--wTWi5aaYRw9ix9vO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2021.05.12 09:47:39 -0300, Jason Gunthorpe wrote:
> On Wed, May 12, 2021 at 10:31:41AM +0800, Zhenyu Wang wrote:
>=20
> > > This need to go into the vfio tree in some way, either directly
> > > through it, via rc or otherwise
> >=20
> > As this is only for i915/gvt, once drm/i915 backmerge with linus master,
> > it should still go through normal i915/gvt merge path.
>=20
> Don't do this, you will create conflicts with ongoing vfio work.
>=20

Sure, there always could be conflict, which means you need to rebase onto
this cleanup. Would that a problem? I'd want to fix current workaround
in 5.13-rc.  Merging i915/gvt only change through vfio doesn't make sense
to me, I will handle that instead of Alex.

Thanks

--wTWi5aaYRw9ix9vO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCYJyxigAKCRCxBBozTXgY
J5ZGAJ43Pu4rw/FUxQEvPQmFN+YKvGHXNgCgmjxVRh5HsxQU3KcMB2tNuaQMKf8=
=KEp5
-----END PGP SIGNATURE-----

--wTWi5aaYRw9ix9vO--

--===============1808888394==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============1808888394==--
