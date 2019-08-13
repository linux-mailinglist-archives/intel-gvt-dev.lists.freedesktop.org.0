Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9EF28B510
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 13 Aug 2019 12:10:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 950C56E0E9;
	Tue, 13 Aug 2019 10:10:16 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B76416E0E9;
 Tue, 13 Aug 2019 10:10:15 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Aug 2019 03:10:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,381,1559545200"; 
 d="asc'?scan'208";a="187730207"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by orsmga002.jf.intel.com with ESMTP; 13 Aug 2019 03:10:13 -0700
Date: Tue, 13 Aug 2019 18:06:04 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PULL] gvt-next
Message-ID: <20190813100604.GG19140@zhen-hp.sh.intel.com>
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
Content-Type: multipart/mixed; boundary="===============1272978916=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1272978916==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hxkXGo8AKqTJ+9QI"
Content-Disposition: inline


--hxkXGo8AKqTJ+9QI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi,

Here's gvt-next stuff for next kernel which include several enhancement
for cmd parser and batch buffer shadow, remove extra debugfs function
return check, and with other misc changes like typo, static check fix,
etc.

Thanks
--
The following changes since commit e0e712fe42ef67bdf45fc348767d1d0a4eeba77f:

  drm/i915: Update DRIVER_DATE to 20190730 (2019-07-30 11:50:24 -0700)

are available in the Git repository at:

  https://github.com/intel/gvt-linux.git tags/gvt-next-2019-08-13

for you to fetch changes up to 220b65d8009dff397a112ee560c297299ba5e423:

  drm/i915/gvt: Double check batch buffer size after copy (2019-08-13 17:55=
:06 +0800)

----------------------------------------------------------------
gvt-next-2019-08-13

- Enhance command parser for extra length check (Fred)
- remove debugfs function return check (Greg)
- batch buffer end double check after shadow copy (Tina)
- one typo fix (Zhenyu)
- klocwork warning fix (Zhi)
- use struct_size() helper (Gustavo)

----------------------------------------------------------------
Gao, Fred (3):
      drm/i915/gvt: Utility for valid command length check
      drm/i915/gvt: Add MI command valid length check
      drm/i915/gvt: Add valid length check for MI variable commands

Greg Kroah-Hartman (1):
      drm/i915/gvt: no need to check return value of debugfs_create functio=
ns

Gustavo A. R. Silva (1):
      drm/i915/kvmgt: Use struct_size() helper

Tina Zhang (1):
      drm/i915/gvt: Double check batch buffer size after copy

Zhenyu Wang (1):
      drm/i915/gvt: Fix typo of VBLANK_TIMER_PERIOD

Zhi Wang (1):
      drm/i915/gvt: factor out tlb and mocs register offset table

 drivers/gpu/drm/i915/gvt/cmd_parser.c   | 180 ++++++++++++++++++++++++++--=
----
 drivers/gpu/drm/i915/gvt/debugfs.c      |  47 ++-------
 drivers/gpu/drm/i915/gvt/gvt.c          |   4 +-
 drivers/gpu/drm/i915/gvt/gvt.h          |   8 +-
 drivers/gpu/drm/i915/gvt/interrupt.c    |   4 +-
 drivers/gpu/drm/i915/gvt/kvmgt.c        |  15 +--
 drivers/gpu/drm/i915/gvt/mmio_context.c |  57 ++++++----
 drivers/gpu/drm/i915/gvt/vgpu.c         |   4 +-
 8 files changed, 212 insertions(+), 107 deletions(-)


--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--hxkXGo8AKqTJ+9QI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXVKLjAAKCRCxBBozTXgY
J8TlAJ0fIm0XGn5kAK2S5Po9HwH+PtzqSgCfY9pOjLkjbJicBBq4GaHAh3csJ4g=
=5P70
-----END PGP SIGNATURE-----

--hxkXGo8AKqTJ+9QI--

--===============1272978916==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============1272978916==--
