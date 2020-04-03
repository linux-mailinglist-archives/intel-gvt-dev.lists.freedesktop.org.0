Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4A919CED2
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  3 Apr 2020 05:18:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8AD86E1B2;
	Fri,  3 Apr 2020 03:18:28 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BA776E1A8;
 Fri,  3 Apr 2020 03:18:27 +0000 (UTC)
IronPort-SDR: fEicXeUKhGvC8mdPqk5iHY4rFOy4yX5CcKzCUteorm36G58pXMekU+z41RHofTl8Luqgne186z
 RUuvpaU2Q3wQ==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2020 20:18:26 -0700
IronPort-SDR: Abd3dkrg/XcK7LVMHXIvRKW+6hMciwJ2YBZXsEmkw8SABJ6TBM1MLpRCozAxl5b+TUNTB3Xj6S
 6LnALmnfCr8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,338,1580803200"; 
 d="asc'?scan'208";a="273805556"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by fmsmga004.fm.intel.com with ESMTP; 02 Apr 2020 20:18:24 -0700
Date: Fri, 3 Apr 2020 11:05:07 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PULL] gvt-next-fixes
Message-ID: <20200403030507.GQ16629@zhen-hp.sh.intel.com>
References: <20200331070025.GB16629@zhen-hp.sh.intel.com>
 <20200331162644.GA3779315@intel.com>
MIME-Version: 1.0
In-Reply-To: <20200331162644.GA3779315@intel.com>
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
Cc: "Zhao, Yan Y" <yan.y.zhao@intel.com>, Jani Nikula <jani.nikula@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, "Yuan,
 Hang" <hang.yuan@intel.com>, "Lv, Zhiyuan" <zhiyuan.lv@intel.com>,
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>,
 Zhi Wang <zhi.a.wang@intel.com>
Content-Type: multipart/mixed; boundary="===============0338329680=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0338329680==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bJ3jXuwtxrXxD2iT"
Content-Disposition: inline


--bJ3jXuwtxrXxD2iT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.03.31 09:26:44 -0700, Rodrigo Vivi wrote:
> On Tue, Mar 31, 2020 at 03:00:25PM +0800, Zhenyu Wang wrote:
> >=20
> > Hi,
> >=20
> > Here's more queued gvt fixes for 5.7. Please see details below.
> >=20
> > Thanks
> > --
> > The following changes since commit a61ac1e75105a077ec1efd6923ae3c619f86=
2304:
> >=20
> >   drm/i915/gvt: Wean gvt off using dev_priv (2020-03-06 10:08:10 +0800)
> >=20
> > are available in the Git repository at:
> >=20
> >   https://github.com/intel/gvt-linux.git tags/gvt-next-fixes-2020-03-31
> >=20
> > for you to fetch changes up to eb0ff8074e0baecba2cd0c7813f6cfa99bafc430:
> >=20
> >   drm/i915/gvt: Fix klocwork issues about data size (2020-03-27 15:37:5=
8 +0800)
>=20
> pulled, thanks

I forgot to mention one thing for 5.7. We've fixed to change guest mem r/w
=66rom KVM to use new VFIO dma r/w instead in this series: https://patchwor=
k.freedesktop.org/series/72038/

As this depends on VFIO tree and looks VFIO pull for 5.7 is not settled down
yet, we'd need to backmerge and send pull against vfio merge for 5.7.

thanks

>=20
> >=20
> > ----------------------------------------------------------------
> > gvt-next-fixes-2020-03-31
> >=20
> > - Fix non-privilege access warning (Tina)
> > - Fix display port type (Tina)
> > - BDW cmd parser missed SWTESS_BASE_ADDRESS (Yan)
> > - Bypass length check of LRI (Yan)
> > - Fix one klocwork warning (Tina)
> >=20
> > ----------------------------------------------------------------
> > Tina Zhang (3):
> >       drm/i915/gvt: Add some regs to force-to-nonpriv whitelist
> >       drm/i915/gvt: Fix display port type issue
> >       drm/i915/gvt: Fix klocwork issues about data size
> >=20
> > Yan Zhao (2):
> >       drm/i915/gvt: add support to command SWTESS_BASE_ADDRESS
> >       drm/i915/gvt: do not check len & max_len for lri
> >=20
> >  drivers/gpu/drm/i915/gvt/cmd_parser.c | 16 ++++------------
> >  drivers/gpu/drm/i915/gvt/display.c    |  6 +++---
> >  drivers/gpu/drm/i915/gvt/handlers.c   |  8 ++++++--
> >  drivers/gpu/drm/i915/gvt/scheduler.c  |  4 ++--
> >  4 files changed, 15 insertions(+), 19 deletions(-)
> >=20
> > --=20
> > Open Source Technology Center, Intel ltd.
> >=20
> > $gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827
>=20
>=20
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--bJ3jXuwtxrXxD2iT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXoan4wAKCRCxBBozTXgY
J6cEAJ9vtKzx0Qx4FsRzFvgVEWNDnW3+fQCeL2GVWZWydL7Y5OGg3irSAvBOJSo=
=5Kii
-----END PGP SIGNATURE-----

--bJ3jXuwtxrXxD2iT--

--===============0338329680==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0338329680==--
