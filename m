Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBAF2FE08D
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 21 Jan 2021 05:25:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC1256E4D2;
	Thu, 21 Jan 2021 04:25:25 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78B936E4CF;
 Thu, 21 Jan 2021 04:25:24 +0000 (UTC)
IronPort-SDR: Ashjm6d9zqMBPcTKKh68kCXG6mE0IEJxSTOJS/RZW/3DphlbY6DKNoBgkvZIpCl1a2LWSsqXp0
 It6ozLjPxqVw==
X-IronPort-AV: E=McAfee;i="6000,8403,9870"; a="264029887"
X-IronPort-AV: E=Sophos;i="5.79,363,1602572400"; 
 d="asc'?scan'208";a="264029887"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2021 20:25:23 -0800
IronPort-SDR: HouJadK6x1wqvTyK1HVhidPTFE9SgoeYIhZyTwL0rpoARUGshumW9JyVNVBSmTcW1IUlBkpasU
 QFt5eYXdizGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,363,1602572400"; 
 d="asc'?scan'208";a="571559510"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by fmsmga006.fm.intel.com with ESMTP; 20 Jan 2021 20:25:20 -0800
Date: Thu, 21 Jan 2021 12:08:25 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Re: [PULL] gvt-gt-next
Message-ID: <20210121040825.GG15982@zhen-hp.sh.intel.com>
References: <20210118050739.GY15982@zhen-hp.sh.intel.com>
 <161114531233.12022.4976651928998688735@jlahtine-mobl.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <161114531233.12022.4976651928998688735@jlahtine-mobl.ger.corp.intel.com>
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
Content-Type: multipart/mixed; boundary="===============0806715170=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0806715170==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GV0iVqYguTV4Q9ER"
Content-Disposition: inline


--GV0iVqYguTV4Q9ER
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2021.01.20 14:21:53 +0200, Joonas Lahtinen wrote:
> Quoting Zhenyu Wang (2021-01-18 07:07:39)
> >=20
> > Hi,
> >=20
> > This is GVT next for 5.12 against drm-intel-gt-next which is mostly
> > for cmd parser enhancement which adds extra check on register load
> > depending on initial context and handles vGPU register state
> > accordingly.
>=20
> I think we were bit inconclusive on this last time.
>

Sorry about that, I was thinking we might just follow your previous idea.

> Even if this does not have any dependency to drm-intel-gt-next I can
> pull this to drm-intel-gt-next. The only caveat is that for any -fixes,
> there needs to be a backmerge to drm-intel-next.
>=20
> Not sure if this is a problem. Do we want to make it a recurring practice
> to backmerge drm-intel-gt-next into drm-intel-next after it lands in
> drm-next?
>

So -gt-next won't do -gt-next-fixes, right? For -next-fixes, we always do
drm-next backmerge, right?

> So to recap: Do we want to pull to drm-intel-next whenever there are no
> dependencies to drm-intel-gt-next, to avoid a backmerge?

yeah, that's fine to me. But for this time gvt-next pull, it's really targe=
ting
for -gt-next which has some dependency, I can double check to confirm.

Thanks.

> Or do we want
> to always do a backmerge in anticipation of -fixes.
>=20
> Regards, Joonas
>=20
> > Thanks.
> > --
> > The following changes since commit fe7bcfaeb2b775f257348dc7b935f8e80eef=
3e7d:
> >=20
> >   drm/i915/gt: Refactor heartbeat request construction and submission (=
2020-12-24 18:07:26 +0000)
> >=20
> > are available in the Git repository at:
> >=20
> >   https://github.com/intel/gvt-linux tags/gvt-gt-next-2021-01-18
> >=20
> > for you to fetch changes up to 02dd2b12a685944c4d52c569d05f636372a7b6c7:
> >=20
> >   drm/i915/gvt: unify lri cmd handler and mmio handlers (2020-12-25 11:=
16:32 +0800)
> >=20
> > ----------------------------------------------------------------
> > gvt-gt-next-2021-01-18
> >=20
> > - GVT cmd parser enhancement against guest context (Yan)
> >=20
> > ----------------------------------------------------------------
> > Yan Zhao (11):
> >       drm/i915/gvt: parse init context to update cmd accessible reg whi=
telist
> >       drm/i915/gvt: scan VM ctx pages
> >       drm/i915/gvt: filter cmds "srm" and "lrm" in cmd_handler
> >       drm/i915/gvt: filter cmds "lrr-src" and "lrr-dst" in cmd_handler
> >       drm/i915/gvt: filter cmd "pipe-ctrl" in cmd_handler
> >       drm/i915/gvt: export find_mmio_info
> >       drm/i915/gvt: make width of mmio_attribute bigger
> >       drm/i915/gvt: introduce a new flag F_CMD_WRITE_PATCH
> >       drm/i915/gvt: statically set F_CMD_WRITE_PATCH flag
> >       drm/i915/gvt: update F_CMD_WRITE_PATCH flag when parsing init ctx
> >       drm/i915/gvt: unify lri cmd handler and mmio handlers
> >=20
> >  drivers/gpu/drm/i915/gvt/cmd_parser.c | 335 ++++++++++++++++++++++++++=
+-------
> >  drivers/gpu/drm/i915/gvt/cmd_parser.h |   4 +
> >  drivers/gpu/drm/i915/gvt/gvt.h        |  37 +++-
> >  drivers/gpu/drm/i915/gvt/handlers.c   |  15 +-
> >  drivers/gpu/drm/i915/gvt/mmio.h       |   3 +
> >  drivers/gpu/drm/i915/gvt/reg.h        |   2 +
> >  drivers/gpu/drm/i915/gvt/scheduler.c  |  22 ++-
> >  drivers/gpu/drm/i915/gvt/vgpu.c       |   4 +-
> >  8 files changed, 339 insertions(+), 83 deletions(-)

--GV0iVqYguTV4Q9ER
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCYAj+NQAKCRCxBBozTXgY
J4JzAJ401rluF67Du7mlSySPw0qe7x6zJwCgjeIe30awyMLe8MM06inxD4mAQ9A=
=ayv3
-----END PGP SIGNATURE-----

--GV0iVqYguTV4Q9ER--

--===============0806715170==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0806715170==--
