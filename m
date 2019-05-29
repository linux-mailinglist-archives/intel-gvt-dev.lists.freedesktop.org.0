Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A81042D882
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 29 May 2019 11:07:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 554666E03C;
	Wed, 29 May 2019 09:07:30 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C0476E03C;
 Wed, 29 May 2019 09:07:29 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 May 2019 02:07:28 -0700
X-ExtLoop1: 1
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by orsmga006.jf.intel.com with ESMTP; 29 May 2019 02:07:26 -0700
Date: Wed, 29 May 2019 17:06:08 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PULL] gvt-fixes
Message-ID: <20190529090608.GB3211@zhen-hp.sh.intel.com>
MIME-Version: 1.0
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>, "Lv,
 Zhiyuan" <zhiyuan.lv@intel.com>, Zhi Wang <zhi.a.wang@intel.com>, "Yuan,
 Hang" <hang.yuan@intel.com>
Content-Type: multipart/mixed; boundary="===============0771268311=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0771268311==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NMuMz9nt05w80d4+"
Content-Disposition: inline


--NMuMz9nt05w80d4+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi,

Here's more gvt fixes for 5.2. This includes fixes for recently
seen arbitrary DMA map fault with sane gtt entry initialization,
and several enforcement fixes for e.g ggtt range validation, some
mode register handler and one cmd length fix for parser.

Thanks
--
The following changes since commit 591c39ffac4ab1ddf2ea6d49331cb614e0682b28:

  drm/i915/gvt: Fix an error code in ppgtt_populate_spt_by_guest_entry() (2=
019-05-21 10:58:16 +0800)

are available in the Git repository at:

  https://github.com/intel/gvt-linux tags/gvt-fixes-2019-05-29

for you to fetch changes up to 66b5cfa043e44eb15bcfd6488db7664ce7b3ac80:

  drm/i915/gvt: Fix cmd length of VEB_DI_IECP (2019-05-28 17:53:45 +0800)

----------------------------------------------------------------
gvt-fixes-2019-05-29

- Fix gtt entry update with sane initialization (Tina)
- Fix missed RING_HEAD/RING_TAIL update for vgpu state (Xiaolin)
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

Xiaolin Zhang (1):
      drm/i915/gvt: save RING_HEAD into vreg when vgpu switched out

Xiong Zhang (1):
      drm/i915/gvt: refine ggtt range validation

 drivers/gpu/drm/i915/gvt/cmd_parser.c |  2 +-
 drivers/gpu/drm/i915/gvt/gtt.c        | 26 ++++++++++++++++---------
 drivers/gpu/drm/i915/gvt/handlers.c   | 36 +++++++++++++++++++++++++++++++=
+++-
 drivers/gpu/drm/i915/gvt/scheduler.c  |  4 ++++
 4 files changed, 57 insertions(+), 11 deletions(-)

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--NMuMz9nt05w80d4+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXO5LgAAKCRCxBBozTXgY
J2V/AKCRUyb9vKkbEjuLKpcPufI23HVDSgCgh+xgnnLaVjUVDI/L4Y3+NKmlaIk=
=W4zV
-----END PGP SIGNATURE-----

--NMuMz9nt05w80d4+--

--===============0771268311==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============0771268311==--
