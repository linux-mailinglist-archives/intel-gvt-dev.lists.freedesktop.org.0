Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C94CD228D54
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 22 Jul 2020 02:59:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 757AC6E108;
	Wed, 22 Jul 2020 00:59:44 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA8EB6E108;
 Wed, 22 Jul 2020 00:59:42 +0000 (UTC)
IronPort-SDR: FgDOBIPgLQ9njJWvCgZU0wkmNcWOcpxO3CZSdsWsZRi4BvkdeWmZdZfLJjgsiakEpH265FaFBN
 wRxVAAig7E2Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9689"; a="147750159"
X-IronPort-AV: E=Sophos;i="5.75,381,1589266800"; 
 d="asc'?scan'208";a="147750159"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2020 17:59:42 -0700
IronPort-SDR: N91k1odiky/YdRa9dCwvto2Btk7CTgEDyfcr/Kftphy1qWBTOoUI2T/Hs+TYdzYOMGo5WmdM8y
 jhxXLur9cPfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,381,1589266800"; 
 d="asc'?scan'208";a="328057858"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by orsmga007.jf.intel.com with ESMTP; 21 Jul 2020 17:59:39 -0700
Date: Wed, 22 Jul 2020 08:42:17 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Re: [PULL] gvt-next
Message-ID: <20200722004217.GA27035@zhen-hp.sh.intel.com>
References: <20200720080541.GT27035@zhen-hp.sh.intel.com>
 <159532948169.9008.15612685518487144837@jlahtine-desk.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <159532948169.9008.15612685518487144837@jlahtine-desk.ger.corp.intel.com>
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
Content-Type: multipart/mixed; boundary="===============0882219347=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0882219347==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cDkCB6tn7aZ2Gopm"
Content-Disposition: inline


--cDkCB6tn7aZ2Gopm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.07.21 14:04:41 +0300, Joonas Lahtinen wrote:
> Quoting Zhenyu Wang (2020-07-20 11:05:41)
> >=20
> > Hi,
> >=20
> > Sorry that this might be a bit late as last week our QA people were
> > busy on something else..So this is gvt changes queued for 5.9 which is
> > to improve guest suspend/resume with proper PCI PM state tracking for
> > resource handling, e.g ppgtt. Hopefully this could still be in queue
> > for 5.9.
>=20
> Is this a regression fix to a problem introduced by previous
> gvt-next PR targeting 5.9?
>=20
> Or is it an incremental improvement over 5.8?
>

Second case. This is incremental improvement. Guest suspend/resume
did work somehow before but has bad performance and possible failure
with some guest versions.

Thanks

>=20
> >=20
> > Thanks
> > --
> > The following changes since commit d524b87f77364db096855d7eb714ffacec97=
4ddf:
> >=20
> >   drm/i915: Update DRIVER_DATE to 20200702 (2020-07-02 21:25:28 +0300)
> >=20
> > are available in the Git repository at:
> >=20
> >   https://github.com/intel/gvt-linux tags/gvt-next-2020-07-20
> >=20
> > for you to fetch changes up to 02b5fc1527c0bb26a1012c6a806dc033f3b125a6:
> >=20
> >   drm/i915/gvt: Remove intel_vgpu_reset_gtt() since no one use it. (202=
0-07-14 16:42:14 +0800)
> >=20
> > ----------------------------------------------------------------
> > gvt-next-2020-07-20
> >=20
> > - Improve guest suspend/resume handling (Colin)
> >=20
> > ----------------------------------------------------------------
> > Colin Xu (3):
> >       drm/i915/gvt: Do not destroy ppgtt_mm during vGPU D3->D0.
> >       drm/i915/gvt: Do not reset pv_notified when vGPU transit from D3-=
>D0
> >       drm/i915/gvt: Remove intel_vgpu_reset_gtt() since no one use it.
> >=20
> >  drivers/gpu/drm/i915/gvt/cfg_space.c | 24 ++++++++++++++++++++++++
> >  drivers/gpu/drm/i915/gvt/gtt.c       | 20 +-------------------
> >  drivers/gpu/drm/i915/gvt/gtt.h       |  3 ++-
> >  drivers/gpu/drm/i915/gvt/gvt.h       |  3 +++
> >  drivers/gpu/drm/i915/gvt/vgpu.c      | 20 +++++++++++++++++---
> >  5 files changed, 47 insertions(+), 23 deletions(-)
> > --

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--cDkCB6tn7aZ2Gopm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXxeLaQAKCRCxBBozTXgY
J6xNAJ9nPkF3G4Nmax9IDwjg0KJI2jCYIQCeL+ijQTefGEhJ4peW92yDNk0pM68=
=mDRR
-----END PGP SIGNATURE-----

--cDkCB6tn7aZ2Gopm--

--===============0882219347==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0882219347==--
