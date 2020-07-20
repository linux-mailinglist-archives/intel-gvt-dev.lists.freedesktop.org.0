Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7C52259F1
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 20 Jul 2020 10:23:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F16489E06;
	Mon, 20 Jul 2020 08:23:04 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 218CC89E06;
 Mon, 20 Jul 2020 08:23:03 +0000 (UTC)
IronPort-SDR: 2bbjL1fOwux/hRnmeCtFsHpSG1jldFIObFuEiyh0fP5y5FSlBZAHsza09PyBb0UICRSsaJk6VI
 G7ly0Ijn2dxA==
X-IronPort-AV: E=McAfee;i="6000,8403,9687"; a="151217019"
X-IronPort-AV: E=Sophos;i="5.75,374,1589266800"; 
 d="asc'?scan'208";a="151217019"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2020 01:23:02 -0700
IronPort-SDR: fzNvU1cMfYDQpHo1NOfeWxx91WEwTvytZDg2M1o4YwZ18eFI1dmzp2cc80qBLqHYdBiW4VhaMu
 k/nulwtHwwqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,374,1589266800"; 
 d="asc'?scan'208";a="317947493"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by orsmga008.jf.intel.com with ESMTP; 20 Jul 2020 01:23:00 -0700
Date: Mon, 20 Jul 2020 16:05:41 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: [PULL] gvt-next
Message-ID: <20200720080541.GT27035@zhen-hp.sh.intel.com>
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
Content-Type: multipart/mixed; boundary="===============0064610306=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0064610306==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pd495SECmvzXpBRb"
Content-Disposition: inline


--pd495SECmvzXpBRb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi,

Sorry that this might be a bit late as last week our QA people were
busy on something else..So this is gvt changes queued for 5.9 which is
to improve guest suspend/resume with proper PCI PM state tracking for
resource handling, e.g ppgtt. Hopefully this could still be in queue
for 5.9.

Thanks
--
The following changes since commit d524b87f77364db096855d7eb714ffacec974ddf:

  drm/i915: Update DRIVER_DATE to 20200702 (2020-07-02 21:25:28 +0300)

are available in the Git repository at:

  https://github.com/intel/gvt-linux tags/gvt-next-2020-07-20

for you to fetch changes up to 02b5fc1527c0bb26a1012c6a806dc033f3b125a6:

  drm/i915/gvt: Remove intel_vgpu_reset_gtt() since no one use it. (2020-07=
-14 16:42:14 +0800)

----------------------------------------------------------------
gvt-next-2020-07-20

- Improve guest suspend/resume handling (Colin)

----------------------------------------------------------------
Colin Xu (3):
      drm/i915/gvt: Do not destroy ppgtt_mm during vGPU D3->D0.
      drm/i915/gvt: Do not reset pv_notified when vGPU transit from D3->D0
      drm/i915/gvt: Remove intel_vgpu_reset_gtt() since no one use it.

 drivers/gpu/drm/i915/gvt/cfg_space.c | 24 ++++++++++++++++++++++++
 drivers/gpu/drm/i915/gvt/gtt.c       | 20 +-------------------
 drivers/gpu/drm/i915/gvt/gtt.h       |  3 ++-
 drivers/gpu/drm/i915/gvt/gvt.h       |  3 +++
 drivers/gpu/drm/i915/gvt/vgpu.c      | 20 +++++++++++++++++---
 5 files changed, 47 insertions(+), 23 deletions(-)
--=20

--pd495SECmvzXpBRb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXxVQVQAKCRCxBBozTXgY
J6cnAJ0d/ODdvDrSsY5gcaFLScA89r0O1gCeJgZ3DOwb2fv/olf4ISvioQuK44Q=
=fEL6
-----END PGP SIGNATURE-----

--pd495SECmvzXpBRb--

--===============0064610306==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0064610306==--
