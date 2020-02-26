Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F97616FC7E
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 26 Feb 2020 11:50:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C7196E25E;
	Wed, 26 Feb 2020 10:50:42 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB4946E245;
 Wed, 26 Feb 2020 10:50:40 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Feb 2020 02:50:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,487,1574150400"; 
 d="asc'?scan'208";a="231359427"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by orsmga008.jf.intel.com with ESMTP; 26 Feb 2020 02:50:37 -0800
Date: Wed, 26 Feb 2020 18:38:40 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PULL] gvt-next
Message-ID: <20200226103840.GD10413@zhen-hp.sh.intel.com>
MIME-Version: 1.0
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>, "Lv,
 Zhiyuan" <zhiyuan.lv@intel.com>, Zhi Wang <zhi.a.wang@intel.com>, "Yuan,
 Hang" <hang.yuan@intel.com>
Content-Type: multipart/mixed; boundary="===============1768781040=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1768781040==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VrqPEDrXMn8OVzN4"
Content-Disposition: inline


--VrqPEDrXMn8OVzN4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi,

Here's gvt-next pull. Mostly for cleanup and kvmgt specific struct
has been moved to its own module, also enable VFIO edid for all platform
including CML. Pls see details below.

Thanks
--
The following changes since commit e24bcd34c1dd7dabde4a8546920537f7137e3c5f:

  drm/i915/dp: Add all tiled and port sync conns to modeset (2020-02-20 13:=
55:02 +0530)

are available in the Git repository at:

  https://github.com/intel/gvt-linux tags/gvt-next-2020-02-26

for you to fetch changes up to a8bb49b64c4f4284fb36169bdd9fc6efd62eb26a:

  drm/i915/gvt: Fix drm_WARN issue where vgpu ptr is unavailable (2020-02-2=
5 16:13:04 +0800)

----------------------------------------------------------------
gvt-next-2020-02-26

- Enable VFIO edid for all platform (Zhenyu)
- Code cleanup for attr group and unused vblank complete (Zhenyu, Julian)
- Make gvt oblivious of kvmgt data structures (Julian)
- Make WARN* drm specific (Pankaj)

----------------------------------------------------------------
Julian Stecklina (2):
      drm/i915/gvt: remove unused vblank_done completion
      drm/i915/gvt: make gvt oblivious of kvmgt data structures

Pankaj Bharadiya (2):
      drm/i915/gvt: Make WARN* drm specific where drm_priv ptr is available
      drm/i915/gvt: Make WARN* drm specific where vgpu ptr is available

Tina Zhang (1):
      drm/i915/gvt: Fix drm_WARN issue where vgpu ptr is unavailable

Zhenyu Wang (3):
      drm/i915/gvt: remove unused type attributes
      drm/i915/gvt: Enable vfio edid for all GVT supported platform
      Merge drm-intel-next-queued into gvt-next

 drivers/gpu/drm/i915/gvt/aperture_gm.c  |   6 +-
 drivers/gpu/drm/i915/gvt/cfg_space.c    |  23 ++-
 drivers/gpu/drm/i915/gvt/cmd_parser.c   |   4 +-
 drivers/gpu/drm/i915/gvt/display.c      |   6 +-
 drivers/gpu/drm/i915/gvt/dmabuf.c       |   4 +-
 drivers/gpu/drm/i915/gvt/edid.c         |  19 +-
 drivers/gpu/drm/i915/gvt/gtt.c          |  21 ++-
 drivers/gpu/drm/i915/gvt/gvt.c          |   8 +-
 drivers/gpu/drm/i915/gvt/gvt.h          |  37 +---
 drivers/gpu/drm/i915/gvt/handlers.c     |  22 ++-
 drivers/gpu/drm/i915/gvt/interrupt.c    |  15 +-
 drivers/gpu/drm/i915/gvt/kvmgt.c        | 303 +++++++++++++++++++---------=
----
 drivers/gpu/drm/i915/gvt/mmio.c         |  30 ++--
 drivers/gpu/drm/i915/gvt/mmio_context.c |   6 +-
 drivers/gpu/drm/i915/gvt/scheduler.c    |   6 +-
 drivers/gpu/drm/i915/gvt/vgpu.c         |  10 +-
 16 files changed, 304 insertions(+), 216 deletions(-)


--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--VrqPEDrXMn8OVzN4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXlZKsAAKCRCxBBozTXgY
Jz0GAJ0YnRKRIwmkrmKFrGaWVsMwoQPU3QCdGdnU5XTSZ5J4r7c7J90nTHrP398=
=KHJI
-----END PGP SIGNATURE-----

--VrqPEDrXMn8OVzN4--

--===============1768781040==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============1768781040==--
