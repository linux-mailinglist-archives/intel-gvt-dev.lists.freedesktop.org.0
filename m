Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABE52682C9
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 14 Sep 2020 04:53:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67CCB89F19;
	Mon, 14 Sep 2020 02:53:52 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94AB889F19;
 Mon, 14 Sep 2020 02:53:51 +0000 (UTC)
IronPort-SDR: +LWNwKojkb0eocxcra40H8wxcmnpeLBOYA1HfRQJ9StzvxIQuSviIsPGgbxKWk6cwt/sD0vl0o
 pgw2I3C/oyqA==
X-IronPort-AV: E=McAfee;i="6000,8403,9743"; a="146756442"
X-IronPort-AV: E=Sophos;i="5.76,424,1592895600"; 
 d="asc'?scan'208";a="146756442"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2020 19:53:49 -0700
IronPort-SDR: 9VnnaciymmbzptFtHFGZ4QLAVbLCHCvUkwb393gibGVv/c1PSslIJttCwQLjteAsvJs437dQzj
 sX6snGqnfupw==
X-IronPort-AV: E=Sophos;i="5.76,424,1592895600"; 
 d="asc'?scan'208";a="482165132"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2020 19:53:47 -0700
Date: Mon, 14 Sep 2020 10:34:20 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PULL] gvt-next
Message-ID: <20200914023420.GY28614@zhen-hp.sh.intel.com>
References: <20200910053720.GK28614@zhen-hp.sh.intel.com>
 <20200911235825.GA259925@intel.com>
MIME-Version: 1.0
In-Reply-To: <20200911235825.GA259925@intel.com>
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
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, "Yuan, Hang" <hang.yuan@intel.com>, "Lv,
 Zhiyuan" <zhiyuan.lv@intel.com>,
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>,
 Zhi Wang <zhi.a.wang@intel.com>
Content-Type: multipart/mixed; boundary="===============0285174441=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0285174441==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+QwZB9vYiNIzNXIj"
Content-Disposition: inline


--+QwZB9vYiNIzNXIj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.09.11 19:58:25 -0400, Rodrigo Vivi wrote:
> On Thu, Sep 10, 2020 at 01:37:20PM +0800, Zhenyu Wang wrote:
> >=20
> > Hi,
> >=20
> > As we split pull request for 5.10 this time, here's gvt-next pull
> > for 5.10. For gvt ww lock fix, Zhi would send another pull based
> > on gem-next.
> >=20
> > This includes current command access flag cleanup for
> > handlers which would be used for next refined cmd scan. And also
> > two more recent fixes on workaround cmd access and MIA reset state.
> >=20
> > Thanks
> > --
> > The following changes since commit ced026e959bec5046afa310d6474e147b629=
4da2:
> >=20
> >   drm/i915: Update DRIVER_DATE to 20200824 (2020-08-24 14:26:38 -0400)
> >=20
> > are available in the Git repository at:
> >=20
> >   https://github.com/intel/gvt-linux tags/gvt-next-2020-09-10
>=20
> This is a malformed pull request line which dim doesn't recognize.
> Could you please regenerate it?
>=20
> $ cat /tmp/gvt-next/cur/1599868544.259925_1.rdvivi-losangeles\:2\,S | dim=
 apply-pull drm-intel-next-queued
> dim: no pull request found
>

Hmm, strange, it pulls fine here when I tried this in local. I just copied =
in mutt and
     cat /tmp/gvt-next.0910 | ./dim apply-pull drm-intel-next-queued

> >=20
> > for you to fetch changes up to df398e33b8fd3ac28b3c7166de555e38d26e7391:
> >=20
> >   drm/i915/gvt: Init vreg GUC_STATUS to GS_MIA_IN_RESET (2020-09-10 13:=
49:05 +0800)
> >=20
> > ----------------------------------------------------------------
> > gvt-next-2020-09-10
> >=20
> > - Cleanup command access flag (Yan)
> > - New workaround cmd access fix (Colin)
> > - MIA reset state fix (Colin)
> >=20
> > ----------------------------------------------------------------
> > Colin Xu (2):
> >       drm/i915/gvt: Add F_CMD_ACCESS for some GEN9 SKU WA MMIO access
> >       drm/i915/gvt: Init vreg GUC_STATUS to GS_MIA_IN_RESET
> >=20
> > Yan Zhao (4):
> >       drm/i915/gvt: rename F_IN_CTX flag to F_SR_IN_CTX
> >       drm/i915/gvt: remove flag F_CMD_ACCESSED
> >       drm/i915/gvt: add/modify interfaces for flag F_CMD_ACCESS
> >       drm/i915/gvt: remove F_CMD_ACCESS flag for some registers
> >=20
> >  drivers/gpu/drm/i915/gvt/cmd_parser.c   |  6 ++---
> >  drivers/gpu/drm/i915/gvt/gvt.h          | 44 +++++++++++++++++++------=
--------
> >  drivers/gpu/drm/i915/gvt/handlers.c     | 32 +++++++++++++-----------
> >  drivers/gpu/drm/i915/gvt/mmio.c         |  3 +++
> >  drivers/gpu/drm/i915/gvt/mmio_context.c |  2 +-
> >  5 files changed, 49 insertions(+), 38 deletions(-)
> >=20
> > --=20
> >=20
> > $gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827
>=20
>=20
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--=20

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--+QwZB9vYiNIzNXIj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCX17WrAAKCRCxBBozTXgY
JzGtAKCPg9PHTKNLykNEdlSr92a17vGIswCfajTburOeEsP2IXoy2D2Qe2JhtFI=
=J904
-----END PGP SIGNATURE-----

--+QwZB9vYiNIzNXIj--

--===============0285174441==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0285174441==--
