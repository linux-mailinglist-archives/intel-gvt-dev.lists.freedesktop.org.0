Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 453D82C1C04
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 24 Nov 2020 04:28:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 924546E1B6;
	Tue, 24 Nov 2020 03:28:54 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF1266E1B6;
 Tue, 24 Nov 2020 03:28:53 +0000 (UTC)
IronPort-SDR: HP3bZ2D9fsDOxRqhWmAiY68DAK7cj/MrIu1NH2WDDz7esNNCK8r/x3DZB9XHw1DeKwkyP05m4K
 Acx4ICGDGtIA==
X-IronPort-AV: E=McAfee;i="6000,8403,9814"; a="171981124"
X-IronPort-AV: E=Sophos;i="5.78,364,1599548400"; 
 d="asc'?scan'208";a="171981124"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2020 19:28:47 -0800
IronPort-SDR: 8ofnhi7p/D0UtdgGm35xgRvTm6+YzGgRgO95Y3Yj5hweQ6G+FExUyP9pLJgWysWI2brsvoDoVM
 Q1hHlWXE/WQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,364,1599548400"; 
 d="asc'?scan'208";a="364872126"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by fmsmga002.fm.intel.com with ESMTP; 23 Nov 2020 19:28:44 -0800
Date: Tue, 24 Nov 2020 11:13:59 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Re: [PULL] gvt-next
Message-ID: <20201124031359.GE16939@zhen-hp.sh.intel.com>
References: <20201123090517.GC16939@zhen-hp.sh.intel.com>
 <160612395828.4926.14269845290017694082@jlahtine-mobl.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <160612395828.4926.14269845290017694082@jlahtine-mobl.ger.corp.intel.com>
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
Content-Type: multipart/mixed; boundary="===============1185426529=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1185426529==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pAwQNkOnpTn9IO2O"
Content-Disposition: inline


--pAwQNkOnpTn9IO2O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.11.23 11:32:38 +0200, Joonas Lahtinen wrote:
> Quoting Zhenyu Wang (2020-11-23 11:05:17)
> >=20
> > Hi,
> >=20
> > Here's gvt next pull for v5.11. Mostly it's for host suspend/resume
> > fix with vGPU active and with some other enhancement as details below.
> > Note that this includes some minor i915 driver change to add gvt hook
> > in suspend/resume function which has been sent and reviewed on
> > intel-gfx list.
> >=20
> > I just generated against drm-intel-next-queued-2020-11-03 which this
> > tree bases on now. Let me know if there's any issue in merge.
>=20
> Sometimes GVT changes are paired with changes related the i915 side
> to adjust the running virtual clients. The changes are more often
> related to GT side, but there's also been display related changes.
>=20
> Going forward, would we want to continue to apply gvt-next to
> drm-intel-next (-queued is planned to be deprecated) or
> should we use drm-intel-gt-next?
>

Is there any clear criteria on patches for -next or -gt-next now?
Something might be only gvt specific, e.g we'll have some enhancement patch=
es
for guest context parse, this might be considered as 'gt' part? I'm not sur=
e.
But yes, I hope we just stick with one, currently thinking drm-intel-next.

> Or should we always strictly apply the GVT changes to drm-intel-next,
> and then any related i915 changes to drm-intel-next or drm-intel-gt-next
> depending on which one they are related to?
>

How about basically we just apply to drm-intel-next, but there might be gvt
specific pull required for -gt-next e.g ww-lock fixes? I think we can do th=
at way
now to see if there'll be any real issue popup.

Thanks

>=20
> > Thanks
> > --
> > The following changes since commit 139caf7ca2866cd0a45814ff938cb0c33920=
a266:
> >=20
> >   drm/i915: Update DRIVER_DATE to 20201103 (2020-11-03 14:21:25 +0200)
> >=20
> > are available in the Git repository at:
> >=20
> >   https://github.com/intel/gvt-linux tags/gvt-next-2020-11-23
> >=20
> > for you to fetch changes up to 9a3a238b3de97b4210c6de66aa88b2d7021ac086:
> >=20
> >   drm/i915/gvt: treat intel_gvt_mpt as const in gvt code (2020-11-23 17=
:14:20 +0800)
> >=20
> > ----------------------------------------------------------------
> > gvt-next-2020-11-23
> >=20
> > - Fix host suspend/resume with vGPU (Colin)
> > - optimize idr init (Varma)
> > - Change intel_gvt_mpt as const (Julian)
> > - One comment error fix (Yan)
> >=20
> > ----------------------------------------------------------------
> > Colin Xu (3):
> >       drm/i915/gvt: Save/restore HW status to support GVT suspend/resume
> >       drm/i915: Add GVT resume routine to i915
> >       drm/i915/gvt: Fix virtual display setup for BXT/APL
> >=20
> > Deepak R Varma (1):
> >       drm/i915/gvt: replace idr_init() by idr_init_base()
> >=20
> > Julian Stecklina (1):
> >       drm/i915/gvt: treat intel_gvt_mpt as const in gvt code
> >=20
> > Yan Zhao (1):
> >       drm/i915/gvt: correct a false comment of flag F_UNALIGN
> >=20
> >  drivers/gpu/drm/i915/gvt/display.c  | 179 ++++++++++++++++++++++++++++=
++++++++
> >  drivers/gpu/drm/i915/gvt/gtt.c      |  64 +++++++++++++
> >  drivers/gpu/drm/i915/gvt/gtt.h      |   4 +
> >  drivers/gpu/drm/i915/gvt/gvt.c      |  13 ++-
> >  drivers/gpu/drm/i915/gvt/gvt.h      |   7 +-
> >  drivers/gpu/drm/i915/gvt/handlers.c |  44 ++++++++-
> >  drivers/gpu/drm/i915/gvt/kvmgt.c    |   2 +-
> >  drivers/gpu/drm/i915/gvt/mmio.c     |   5 +
> >  drivers/gpu/drm/i915/gvt/mmio.h     |   4 +
> >  drivers/gpu/drm/i915/gvt/mpt.h      |   2 +-
> >  drivers/gpu/drm/i915/gvt/vgpu.c     |   2 +-
> >  drivers/gpu/drm/i915/i915_drv.c     |   2 +
> >  drivers/gpu/drm/i915/intel_gvt.c    |  15 +++
> >  drivers/gpu/drm/i915/intel_gvt.h    |   5 +
> >  14 files changed, 338 insertions(+), 10 deletions(-)
> >=20
> > --=20
> >=20
> > $gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--=20

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--pAwQNkOnpTn9IO2O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCX7x6cwAKCRCxBBozTXgY
JzrSAJ9To+VmPSsp9iL/kXY1WrHl1c5YVwCfa9SrPxtRd9snXdWnxQnlXZZVhCo=
=Ut43
-----END PGP SIGNATURE-----

--pAwQNkOnpTn9IO2O--

--===============1185426529==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============1185426529==--
