Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BEC1A71A3
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 14 Apr 2020 05:18:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 501A56E44A;
	Tue, 14 Apr 2020 03:18:32 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BDAF6E445;
 Tue, 14 Apr 2020 03:18:30 +0000 (UTC)
IronPort-SDR: K3oVFp5elou2E00piEvz4aej4T05SqD9U6UYdhobnZMs5gRh76MVnUvNap1vfzeoOwUjP7uBSQ
 Sau2ulq55IDw==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2020 20:18:30 -0700
IronPort-SDR: A6dvFsKAF+nMYpB5Nxql8OZD8ESyhZEcZnZf1S7cpOWdTRI4yLKnP5sujEava2jQgnZvzsGGKH
 8bIyy78zkIAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,381,1580803200"; 
 d="asc'?scan'208";a="256373748"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by orsmga006.jf.intel.com with ESMTP; 13 Apr 2020 20:18:25 -0700
Date: Tue, 14 Apr 2020 11:04:44 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 3/6] i915/gvt: remove unused xen bits
Message-ID: <20200414030444.GO11247@zhen-hp.sh.intel.com>
References: <20200404094101.672954-1-hch@lst.de>
 <20200404094101.672954-4-hch@lst.de>
 <20200408014437.GF11247@zhen-hp.sh.intel.com>
 <20200413130806.GA14455@lst.de>
MIME-Version: 1.0
In-Reply-To: <20200413130806.GA14455@lst.de>
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
Cc: Jens Axboe <axboe@kernel.dk>, Felipe Balbi <balbi@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 intel-gvt-dev@lists.freedesktop.org, Felix Kuehling <Felix.Kuehling@amd.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, Al Viro <viro@zeniv.linux.org.uk>,
 intel-gfx@lists.freedesktop.org, linux-fsdevel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, io-uring@vger.kernel.org,
 Zhi Wang <zhi.a.wang@intel.com>
Content-Type: multipart/mixed; boundary="===============1784549137=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1784549137==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3eH4Qcq5fItR5cpy"
Content-Disposition: inline


--3eH4Qcq5fItR5cpy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.04.13 15:08:06 +0200, Christoph Hellwig wrote:
> On Wed, Apr 08, 2020 at 09:44:37AM +0800, Zhenyu Wang wrote:
> > On 2020.04.04 11:40:58 +0200, Christoph Hellwig wrote:
> > > No Xen support anywhere here.  Remove a dead declaration and an unused
> > > include.
> > >=20
> > > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > > ---
> >=20
> > We'll keep that off-tree.
> >=20
> > Acked-by: Zhenyu Wang <zhenyuw@linux.intel.com>
>=20
> Can you pick this up through the i915 tree?

Yes, I'll pick this.

Thanks

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--3eH4Qcq5fItR5cpy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXpUoTAAKCRCxBBozTXgY
JygxAJ9JZICeCzXSNp8YPszWNoMERUV94ACeJJLziuDjCDenyBchPPCAYkP+EtI=
=56PP
-----END PGP SIGNATURE-----

--3eH4Qcq5fItR5cpy--

--===============1784549137==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============1784549137==--
