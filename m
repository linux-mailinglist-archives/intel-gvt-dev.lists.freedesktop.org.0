Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C012EDEC
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 30 May 2019 05:43:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C641C6E30F;
	Thu, 30 May 2019 03:43:00 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88F0C6E13F;
 Thu, 30 May 2019 03:42:59 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 May 2019 20:42:58 -0700
X-ExtLoop1: 1
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by fmsmga001.fm.intel.com with ESMTP; 29 May 2019 20:42:56 -0700
Date: Thu, 30 May 2019 11:41:37 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Re: [PULL] gvt-fixes
Message-ID: <20190530034137.GE3211@zhen-hp.sh.intel.com>
References: <20190529090608.GB3211@zhen-hp.sh.intel.com>
 <155913162906.17581.459441953247054618@jlahtine-desk.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <155913162906.17581.459441953247054618@jlahtine-desk.ger.corp.intel.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Content-Type: multipart/mixed; boundary="===============2044009870=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============2044009870==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zaRBsRFn0XYhEU69"
Content-Disposition: inline


--zaRBsRFn0XYhEU69
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.05.29 15:07:09 +0300, Joonas Lahtinen wrote:
> Quoting Zhenyu Wang (2019-05-29 12:06:08)
> >=20
> > Hi,
> >=20
> > Here's more gvt fixes for 5.2. This includes fixes for recently
> > seen arbitrary DMA map fault with sane gtt entry initialization,
> > and several enforcement fixes for e.g ggtt range validation, some
> > mode register handler and one cmd length fix for parser.
>=20
> Applying the pull reveals that there is a patch with space missing from
> the Fixes: line. Could you fix it and re-generate?
>=20
> "
> From https://github.com/intel/gvt-linux
>  * tag                         gvt-fixes-2019-05-29 -> FETCH_HEAD
> dim: 5d43bc76ad97 ("drm/i915/gvt: Initialize intel_gvt_gtt_entry in stack=
"): Subject in fixes line doesn't match referenced commit:
> dim:     7598e8700e9a(drm/i915/gvt: Missed to cancel dma map for ggtt ent=
ries)
> dim: ERROR: issues in commits detected, aborting
> "
>=20

Sorry about that! Missed that.. Please check regenerated one below.
And I've dropped one commit for guest ring state update which had got
more thought that should be reworked.

Thanks
--
The following changes since commit 591c39ffac4ab1ddf2ea6d49331cb614e0682b28:

  drm/i915/gvt: Fix an error code in ppgtt_populate_spt_by_guest_entry() (2=
019-05-21 10:58:16 +0800)

are available in the Git repository at:

  https://github.com/intel/gvt-linux tags/gvt-fixes-2019-05-30

for you to fetch changes up to 3035e8cd6c316cb633b45bc9b38052ba2dfd299b:

  drm/i915/gvt: Fix cmd length of VEB_DI_IECP (2019-05-30 11:31:43 +0800)

----------------------------------------------------------------
gvt-fixes-2019-05-30

- Fix gtt entry update with sane initialization (Tina)
- Fix force-to-nonpriv warning from recent guest (Colin)
- Fix GFX_MODE and CSFE_CHICKEN1_REG handler for host only control (Colin)
- GGTT range validation enforced (Xiong)
- Fix cmd length for VEB_DI_IECP (Fred)

----------------------------------------------------------------
Colin Xu (3):
      drm/i915/gvt: Update force-to-nonpriv register whitelist
      drm/i915/gvt: Fix GFX_MODE handling
      drm/i915/gvt: Fix vGPU CSFE_CHICKEN1_REG mmio handler

Gao, Fred (1):
      drm/i915/gvt: Fix cmd length of VEB_DI_IECP

Tina Zhang (1):
      drm/i915/gvt: Initialize intel_gvt_gtt_entry in stack

Xiong Zhang (1):
      drm/i915/gvt: refine ggtt range validation

 drivers/gpu/drm/i915/gvt/cmd_parser.c |  2 +-
 drivers/gpu/drm/i915/gvt/gtt.c        | 26 ++++++++++++++++---------
 drivers/gpu/drm/i915/gvt/handlers.c   | 36 +++++++++++++++++++++++++++++++=
+++-
 3 files changed, 53 insertions(+), 11 deletions(-)


--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--zaRBsRFn0XYhEU69
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXO9Q8AAKCRCxBBozTXgY
J3TiAJsHmHVdmBXd4sNFlNU8fNxmjDfHHQCfamWPK28P2A7HSBZ3kjpZJ7XTxrw=
=5mMQ
-----END PGP SIGNATURE-----

--zaRBsRFn0XYhEU69--

--===============2044009870==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============2044009870==--
