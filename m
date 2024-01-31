Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B0E843B3D
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 31 Jan 2024 10:38:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36F8C10FD38;
	Wed, 31 Jan 2024 09:38:02 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A441310F4D2;
 Wed, 31 Jan 2024 09:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706693881; x=1738229881;
 h=date:from:to:cc:subject:message-id:reply-to:mime-version;
 bh=OIorUhZBeReQVurTkeItZ8NMRYrqCLlP5LSALyijMvM=;
 b=QTuU+H+yEfvfI83DmZ9XsW7/FE3Fefdv1iUOustkDHu2+8bt+OYmnWjl
 96rlUnEWDEZK4Ks5zRDOC97l39eV2ICc+v67yO4Q4f6q8rTKO1JbbSEUb
 ArGMT6kBdWmMGjHkyl6tcPu9+wkDOBNxyQww68ZTtKaxJk2cW4x099mkD
 N7LfozGY3pc88R+uAWuwf105R/FKSw3ubHL/srDsHD8xOlD15U53jfIu+
 N6PbRVU7npYVPSWm5HantH8X00mnXfpo5ttG+51YBxNQk9EKpba89iMZF
 i9k5Q0wDlaOP/gkUKOzTA0c19yHmS8SJt/4/zTV+aSgOIMZSSQnNYBkFO A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="10215305"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
 d="asc'?scan'208";a="10215305"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 01:38:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="822505537"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
 d="asc'?scan'208";a="822505537"
Received: from debian-skl.sh.intel.com (HELO debian-skl) ([10.239.160.45])
 by orsmga001.jf.intel.com with ESMTP; 31 Jan 2024 01:37:57 -0800
Date: Wed, 31 Jan 2024 17:38:51 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: [PULL] gvt-fixes
Message-ID: <ZboVK03/Eb/jt7wf@debian-scheme>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="QQvuDcYg+aj5hqnK"
Content-Disposition: inline
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
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>, zhi.wang.linux@gmail.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--QQvuDcYg+aj5hqnK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Hi, Joonas

Here is another gvt-fixes pull which contains fixes on doc link and
one uninitialized variable in warning message, also update about Zhi's
new mail address in MAINTAINERS.

Thanks.
---
The following changes since commit f9f031dd21a7ce13a13862fa5281d32e1029c70f:

  drm/i915/psr: Only allow PSR in LPSP mode on HSW non-ULT (2024-01-25 10:44:13 +0200)

are available in the Git repository at:

  https://github.com/intel/gvt-linux tags/gvt-fixes-2024-01-31

for you to fetch changes up to 88569fa2c3bc83d77a96580da94dd35edee0f893:

  MAINTAINERS: Update Zhi Wang's email address (2024-01-31 17:19:15 +0800)

----------------------------------------------------------------
gvt-fixes-2024-01-31

- Fix broken gvt doc link (Zhenyu)
- Fix one uninitialized variable bug in warning (Dan)
- Update Zhi's new email address in MAINTAINERS file. (Zhi)

----------------------------------------------------------------
Dan Carpenter (1):
      drm/i915/gvt: Fix uninitialized variable in handle_mmio()

Zhenyu Wang (1):
      drm/i915: Replace dead 01.org link

Zhi Wang (1):
      MAINTAINERS: Update Zhi Wang's email address

 MAINTAINERS                         | 4 ++--
 drivers/gpu/drm/i915/Kconfig        | 2 +-
 drivers/gpu/drm/i915/gvt/handlers.c | 3 +--
 drivers/gpu/drm/i915/intel_gvt.c    | 2 +-
 4 files changed, 5 insertions(+), 6 deletions(-)

--QQvuDcYg+aj5hqnK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCZboVJAAKCRCxBBozTXgY
J6pKAJ0SCVZXC9bPKUlu5tg6BVbSEjrqQgCeKCTPSKD5rmhfPWUTssIEHlNr72g=
=GZlb
-----END PGP SIGNATURE-----

--QQvuDcYg+aj5hqnK--
