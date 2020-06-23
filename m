Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A2A2047EE
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 23 Jun 2020 05:23:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B1CC6E0C2;
	Tue, 23 Jun 2020 03:23:34 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E11C06E0AC;
 Tue, 23 Jun 2020 03:23:32 +0000 (UTC)
IronPort-SDR: 1XN7Mk6w5uzQ//yp9MW6I+/0svmda8Frs9qchHkJl+N9VpAClZmdRCWNIb7nZcmF8BWKh2QY83
 A4T4HrqsO0jA==
X-IronPort-AV: E=McAfee;i="6000,8403,9660"; a="143012123"
X-IronPort-AV: E=Sophos;i="5.75,269,1589266800"; 
 d="asc'?scan'208";a="143012123"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2020 20:23:31 -0700
IronPort-SDR: F2Jn/PNcQlfDLyjjvhQ3Jo+FRFroVXmx+TQnRj6gLJxzfNftGHvvLMRFwiynv6ehYkJPxzPvqr
 Ab8BOQM3hwTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,269,1589266800"; 
 d="asc'?scan'208";a="301060731"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by fmsmga004.fm.intel.com with ESMTP; 22 Jun 2020 20:23:29 -0700
Date: Tue, 23 Jun 2020 11:07:11 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Re: [PULL] gvt-fixes
Message-ID: <20200623030711.GA5687@zhen-hp.sh.intel.com>
References: <20200617043418.GQ5687@zhen-hp.sh.intel.com>
 <159248448107.8757.1901135788098329902@jlahtine-desk.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <159248448107.8757.1901135788098329902@jlahtine-desk.ger.corp.intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, "Yuan, Hang" <hang.yuan@intel.com>, "Lv,
 Zhiyuan" <zhiyuan.lv@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>,
 Zhi Wang <zhi.a.wang@intel.com>
Content-Type: multipart/mixed; boundary="===============2024475370=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============2024475370==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Zqu75NDXmDJGUu04"
Content-Disposition: inline


--Zqu75NDXmDJGUu04
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.06.18 15:48:01 +0300, Joonas Lahtinen wrote:
> Quoting Zhenyu Wang (2020-06-17 07:34:18)
> >=20
> > Hi,
> >=20
> > This contains misc fixes for gvt. Two MMIO handler fixes on SKL/CFL,
> > one mask register bit checking fix exposed in suspend/resume path and
> > one lockdep error fix for debugfs entry access.
>=20
> Could not pull this one due to the extra hassle with CI this week.
>=20
> Jani, can you please pull this next week.
>=20

Got it. Please help to pull then.

One thing I forgot to mention that change in "drm/i915/gvt: Fix incorrect c=
heck of enabled bits in mask registers"
would cause a minor conflict if backmerging from linux master to dinq, which
is because of new IS_COMETLAKE. Change like below could resolve that.

diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt=
/handlers.c
index 9f48db0bf9d5..78ba2857144e 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -1734,14 +1734,9 @@ static int ring_mode_mmio_write(struct intel_vgpu *v=
gpu, unsigned int offset,
 		return 0;
 	}
=20
-<<<<<<< HEAD
 	if ((IS_COFFEELAKE(vgpu->gvt->gt->i915) ||
 	     IS_COMETLAKE(vgpu->gvt->gt->i915)) &&
-	    data & _MASKED_BIT_ENABLE(2)) {
-=3D=3D=3D=3D=3D=3D=3D
-	if (IS_COFFEELAKE(vgpu->gvt->gt->i915) &&
 	    IS_MASKED_BITS_ENABLED(data, 2)) {
->>>>>>> origin/gvt-next-fixes
 		enter_failsafe_mode(vgpu, GVT_FAILSAFE_UNSUPPORTED_GUEST);
 		return 0;
 	}

>=20
> > Thanks.
> > --
> > The following changes since commit 8e68c6340d5833077b3753eabedab4075557=
1383:
> >=20
> >   drm/i915/display: Fix the encoder type check (2020-06-16 11:34:24 +03=
00)
> >=20
> > are available in the Git repository at:
> >=20
> >   https://github.com/intel/gvt-linux tags/gvt-fixes-2020-06-17
> >=20
> > for you to fetch changes up to a291e4fba259a56a6a274c1989997acb6f0bb03a:
> >=20
> >   drm/i915/gvt: Use GFP_ATOMIC instead of GFP_KERNEL in atomic context =
(2020-06-17 12:36:19 +0800)
> >=20
> > ----------------------------------------------------------------
> > gvt-fixes-2020-06-17
> >=20
> > - Two missed MMIO handler fixes for SKL/CFL (Colin)
> > - Fix mask register bits check (Colin)
> > - Fix one lockdep error for debugfs entry access (Colin)
> >=20
> > ----------------------------------------------------------------
> > Colin Xu (4):
> >       drm/i915/gvt: Add one missing MMIO handler for D_SKL_PLUS
> >       drm/i915/gvt: Fix two CFL MMIO handling caused by regression.
> >       drm/i915/gvt: Fix incorrect check of enabled bits in mask registe=
rs
> >       drm/i915/gvt: Use GFP_ATOMIC instead of GFP_KERNEL in atomic cont=
ext
> >=20
> >  drivers/gpu/drm/i915/gvt/debugfs.c      |  2 +-
> >  drivers/gpu/drm/i915/gvt/handlers.c     | 24 +++++++++++++-----------
> >  drivers/gpu/drm/i915/gvt/mmio_context.h |  6 +++---
> >  drivers/gpu/drm/i915/gvt/reg.h          |  5 +++++
> >  4 files changed, 22 insertions(+), 15 deletions(-)
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--Zqu75NDXmDJGUu04
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXvFx3wAKCRCxBBozTXgY
J4JFAJ4+0JJ5MmD/Fq6el4KQJn67kibLkACfbFKxkbW3UngKKSNUs7V7DSekr/Y=
=mDTI
-----END PGP SIGNATURE-----

--Zqu75NDXmDJGUu04--

--===============2024475370==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============2024475370==--
