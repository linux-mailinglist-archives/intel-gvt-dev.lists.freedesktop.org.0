Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4CC578F65
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 19 Jul 2022 02:46:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B24D8113C7D;
	Tue, 19 Jul 2022 00:46:26 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B043113C95
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 19 Jul 2022 00:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658191586; x=1689727586;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=hyF5/QVeyyEx7k2cC1g6wG/l/r4YcdMqKEwUQCPZNls=;
 b=aLRp5xYnk1z1PYpiypfhci221zxAFMdVpJdpkFmRmLvha5J2Ow2zNbOy
 gt4VRF8pnT+sTn0DXoWk0uuw2/0NnXzluMmZSiGeBuzXzN7iwacNv+J9H
 YUI+SVNtsLVGuanfImxmUXD+nnO9oEHvpSdZn1KruR7Fcfi4f1cyUsmjO
 zYHEu+bOFcrQVIlWa+Rsq1uTIZxgbWZ6coeAH5UPUA3VAdu2lafO1zubn
 8de960cht8vdrpNH5H9ciTYw8Ghc9kd0sMdHnR8es43HMFd0YP3dw+lj4
 qUBa9g0StJJGfUhw+2rK/XcxI5mZif7o/HzIFquV8zayhOKt6u+puIFcL w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10412"; a="350318557"
X-IronPort-AV: E=Sophos;i="5.92,282,1650956400"; 
 d="asc'?scan'208";a="350318557"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2022 17:46:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,282,1650956400"; 
 d="asc'?scan'208";a="655514201"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.159.108])
 by fmsmga008.fm.intel.com with ESMTP; 18 Jul 2022 17:46:22 -0700
Date: Tue, 19 Jul 2022 08:22:40 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: simplify the mdev interface v6
Message-ID: <20220719002240.GD1089@zhen-hp.sh.intel.com>
References: <20220709045450.609884-1-hch@lst.de>
 <20220718054348.GA22345@lst.de>
 <20220718153331.18a52e31.alex.williamson@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="bJBxXK1kQfYiHILX"
Content-Disposition: inline
In-Reply-To: <20220718153331.18a52e31.alex.williamson@redhat.com>
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
 Zhenyu Wang <zhenyuw@linux.intel.com>, Halil Pasic <pasic@linux.ibm.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 intel-gvt-dev@lists.freedesktop.org, Christoph Hellwig <hch@lst.de>,
 Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--bJBxXK1kQfYiHILX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2022.07.18 15:33:31 -0600, Alex Williamson wrote:
> On Mon, 18 Jul 2022 07:43:48 +0200
> Christoph Hellwig <hch@lst.de> wrote:
>=20
> > Alex, does this series look good to you now?
>=20
> It does.  I was hoping we'd get a more complete set acks from the mdev
> driver owners, but I'll grab this within the next day or two with
> whatever additional reviews come in by then.  Thanks,
>=20

No problem for me to merge gvt changes through your pull. Thanks!

--bJBxXK1kQfYiHILX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCYtX5RwAKCRCxBBozTXgY
JzTyAJ0TuYiKA/2YyFpOV9JjQNJFujxvAgCfQg9MD1AzSUfXw+c98NHNX9rB+DE=
=vjqj
-----END PGP SIGNATURE-----

--bJBxXK1kQfYiHILX--
