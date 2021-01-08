Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 180512EECD0
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  8 Jan 2021 06:15:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E2886E5D3;
	Fri,  8 Jan 2021 05:15:41 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AE4E6E5D3;
 Fri,  8 Jan 2021 05:15:40 +0000 (UTC)
IronPort-SDR: e+gNA8S/pXEkWhGihB/WRN9nyT+gDoZNrA92OkkIz45+vm5dmk8mgbamxvkeJOlsZHU0DVIsw4
 12EvER6sVYtw==
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="196109054"
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; 
 d="asc'?scan'208";a="196109054"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2021 21:15:39 -0800
IronPort-SDR: r6stLjdv7ABrJrbJcc4pEiJe3O56DZX0iwhM08+mzCj8l7jEP8EsM/+qjZr1KfEFJtHKPc43l7
 ssIPUroPFfIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; 
 d="asc'?scan'208";a="396217703"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by fmsmga004.fm.intel.com with ESMTP; 07 Jan 2021 21:15:37 -0800
Date: Fri, 8 Jan 2021 12:59:11 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: [PULL] gvt-fixes
Message-ID: <20210108045911.GF15982@zhen-hp.sh.intel.com>
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
Content-Type: multipart/mixed; boundary="===============0125244658=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0125244658==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GvXjxJ+pjyke8COw"
Content-Disposition: inline


--GvXjxJ+pjyke8COw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Hi,

Here's one gvt fixes for VFIO edid on APL/BXT with virtual display
hotplug fixed that feature is enabled again.

Thanks.
--
The following changes since commit e71ba9452f0b5b2e8dc8aa5445198cd9214a6a62:

  Linux 5.11-rc2 (2021-01-03 15:55:30 -0800)

are available in the Git repository at:

  https://github.com/intel/gvt-linux tags/gvt-fixes-2020-01-08

for you to fetch changes up to 4ceb06e7c336f4a8d3f3b6ac9a4fea2e9c97dc07:

  drm/i915/gvt: Fix vfio_edid issue for BXT/APL (2021-01-06 11:19:15 +0800)

----------------------------------------------------------------
gvt-fixes-2020-01-08

- Fix VFIO EDID on APL/BXT (Colin)

----------------------------------------------------------------
Colin Xu (1):
      drm/i915/gvt: Fix vfio_edid issue for BXT/APL

 drivers/gpu/drm/i915/gvt/display.c | 81 +++++++++++++++++++++++++++-----------
 drivers/gpu/drm/i915/gvt/vgpu.c    |  5 +--
 2 files changed, 59 insertions(+), 27 deletions(-)

--GvXjxJ+pjyke8COw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCX/fmmwAKCRCxBBozTXgY
J4PTAKCWd31a7ile3IwJ2iBXJGeALfAjDgCeOrPkgcd4Iv96XzjKFBGMhU688AM=
=oluL
-----END PGP SIGNATURE-----

--GvXjxJ+pjyke8COw--

--===============0125244658==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0125244658==--
