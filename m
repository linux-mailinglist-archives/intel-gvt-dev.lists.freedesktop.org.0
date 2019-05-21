Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B65724804
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 21 May 2019 08:25:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6744789229;
	Tue, 21 May 2019 06:25:11 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 065DB8921B;
 Tue, 21 May 2019 06:25:09 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 May 2019 23:25:09 -0700
X-ExtLoop1: 1
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by FMSMGA003.fm.intel.com with ESMTP; 20 May 2019 23:25:07 -0700
Date: Tue, 21 May 2019 14:24:08 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PULL] gvt-fixes
Message-ID: <20190521062408.GH12913@zhen-hp.sh.intel.com>
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
Content-Type: multipart/mixed; boundary="===============1850133319=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1850133319==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ygbU922Pc5eyHI0n"
Content-Disposition: inline


--ygbU922Pc5eyHI0n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi,

Here's gvt-fixes for 5.2-rc. It contains vgpu reset fix with
proper timeline handling, fixes for guest TRTT setting which
should be handled in context state instead of pushing directly
to hardware and one error return fix.

Thanks.
--
The following changes since commit a491cc8e1597ea25803191cded49d3686702a406:

  drm/i915: Truly bump ready tasks ahead of busywaits (2019-05-20 18:29:20 =
+0300)

are available in the Git repository at:

  https://github.com/intel/gvt-linux.git tags/gvt-fixes-2019-05-21

for you to fetch changes up to 591c39ffac4ab1ddf2ea6d49331cb614e0682b28:

  drm/i915/gvt: Fix an error code in ppgtt_populate_spt_by_guest_entry() (2=
019-05-21 10:58:16 +0800)

----------------------------------------------------------------
gvt-fixes-2019-05-21

- vGPU reset fix with sane init breadcrumb (Weinan)
- Fix TRTT handling to use context state (Yan)
- Fix one error return (Dan)

----------------------------------------------------------------
Dan Carpenter (1):
      drm/i915/gvt: Fix an error code in ppgtt_populate_spt_by_guest_entry()

Weinan (1):
      drm/i915/gvt: emit init breadcrumb for gvt request

Yan Zhao (4):
      drm/i915/gvt: use cmd to restore in-context mmios to hw for gen9 plat=
form
      drm/i915/gvt: Tiled Resources mmios are in-context mmios for gen9+
      drm/i915/gvt: add 0x4dfc to gen9 save-restore list
      drm/i915/gvt: do not let TRTTE and 0x4dfc write passthrough to hardwa=
re

 drivers/gpu/drm/i915/gvt/cmd_parser.c   | 14 +++++++++-----
 drivers/gpu/drm/i915/gvt/gtt.c          |  4 +++-
 drivers/gpu/drm/i915/gvt/handlers.c     | 15 ---------------
 drivers/gpu/drm/i915/gvt/mmio_context.c | 23 ++++++++++-------------
 drivers/gpu/drm/i915/gvt/scheduler.c    | 23 ++++++++++++++++++++---
 5 files changed, 42 insertions(+), 37 deletions(-)


--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--ygbU922Pc5eyHI0n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXOOZhwAKCRCxBBozTXgY
J7O+AJ4w7Nbagv/sX9Jmv0pDe2AQtswQygCcC+ivARcyVbdetTEVREPEADZ9MDs=
=rr6a
-----END PGP SIGNATURE-----

--ygbU922Pc5eyHI0n--

--===============1850133319==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============1850133319==--
