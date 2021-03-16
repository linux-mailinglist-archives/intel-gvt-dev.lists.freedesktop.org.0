Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 989BC33CF0F
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 16 Mar 2021 09:00:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38DBB6E213;
	Tue, 16 Mar 2021 08:00:18 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42B0A6E213;
 Tue, 16 Mar 2021 08:00:17 +0000 (UTC)
IronPort-SDR: SJfvsu/Z4HJ2TYnM0z211Wt+d+kaVkX0fWNLdD7uO11vN2b1blZ4THo4zgAUY7rStJYSFsRNt+
 x6S4dl3NH4NA==
X-IronPort-AV: E=McAfee;i="6000,8403,9924"; a="274261701"
X-IronPort-AV: E=Sophos;i="5.81,251,1610438400"; 
 d="asc'?scan'208";a="274261701"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2021 01:00:16 -0700
IronPort-SDR: YcoE56Qr7+9yNAFvgBWQCl+TcWdfISTfdm5DRE2MSTWAky9d/nuWV2NRSCI5H6fo3xQcb3w+8/
 3vNCYWC2yrfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,251,1610438400"; 
 d="asc'?scan'208";a="432925047"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by fmsmga004.fm.intel.com with ESMTP; 16 Mar 2021 01:00:14 -0700
Date: Tue, 16 Mar 2021 15:43:30 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PULL] gvt-next
Message-ID: <20210316074330.GC1551@zhen-hp.sh.intel.com>
MIME-Version: 1.0
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
Content-Type: multipart/mixed; boundary="===============1179468449=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1179468449==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qp4W5+cUSnZs0RIF"
Content-Disposition: inline


--qp4W5+cUSnZs0RIF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Hi,

This is queued gvt-next pull for 5.13. Mostly it's for accurate
vGPU virtual display rate tracking and change for per-vGPU vblank
timer based on that, which brings accurate vblank injection.

Thanks
--
The following changes since commit c73927183f2b85bf1a06d75d2b51be72aff42358:

  drm/i915/tgl+: Sanitize the DDI LANES/IO and AUX power domain names (2021-02-24 14:05:39 +0200)

are available in the Git repository at:

  https://github.com/intel/gvt-linux.git tags/gvt-next-2021-03-16

for you to fetch changes up to 9317f356df83a5caeccae2e343d1a569929bcfc9:

  drm/i915/gvt: Fixed couple of spellings in the file gtt.c (2021-03-01 14:02:14 +0800)

----------------------------------------------------------------
gvt-next-2021-03-16

- Parse accurate vGPU virtual display rate (Colin)
- Convert vblank timer as per-vGPU based on current rate (Colin)
- spelling fix (Bhaskar)

----------------------------------------------------------------
Bhaskar Chowdhury (1):
      drm/i915/gvt: Fixed couple of spellings in the file gtt.c

Colin Xu (2):
      drm/i915/gvt: Get accurate vGPU virtual display refresh rate from vreg
      drm/i915/gvt: Refactor GVT vblank emulator for vGPU virtual display

 drivers/gpu/drm/i915/gvt/display.c   | 107 +++++++-------
 drivers/gpu/drm/i915/gvt/display.h   |  14 +-
 drivers/gpu/drm/i915/gvt/gtt.c       |   4 +-
 drivers/gpu/drm/i915/gvt/gvt.c       |  25 +++-
 drivers/gpu/drm/i915/gvt/gvt.h       |  13 +-
 drivers/gpu/drm/i915/gvt/handlers.c  | 261 ++++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/i915/gvt/interrupt.c |  37 -----
 drivers/gpu/drm/i915/gvt/interrupt.h |   7 -
 drivers/gpu/drm/i915/gvt/vgpu.c      |   2 -
 9 files changed, 355 insertions(+), 115 deletions(-)


--qp4W5+cUSnZs0RIF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCYFBhnQAKCRCxBBozTXgY
JxnjAKCUs+tiBUByF2q9SIxv1OJbQ/anJwCglNuimtvM7nCHDr/IfGQR8M+dU0M=
=x5M4
-----END PGP SIGNATURE-----

--qp4W5+cUSnZs0RIF--

--===============1179468449==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============1179468449==--
