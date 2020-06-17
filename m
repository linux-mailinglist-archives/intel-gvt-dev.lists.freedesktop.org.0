Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 140081FC560
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 17 Jun 2020 06:50:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CBEE6EA84;
	Wed, 17 Jun 2020 04:50:25 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF18F6EA84;
 Wed, 17 Jun 2020 04:50:24 +0000 (UTC)
IronPort-SDR: W41cuYbZaCZwqrnw7dR8CKWBaUUFxR3kiNQ3eKvskOd/fEePuVMgjg8c1AtZV2r7tZi7dQsteM
 476+W0qTY2Zg==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2020 21:50:24 -0700
IronPort-SDR: BuZz+b6Pnu3kD1JmAb/rKSSm00k4UTwuYDdr4O3urYnjTQZGiNqFJV2Ru679M2N5bzZkEFC7MX
 N8tdnfP+H/oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,521,1583222400"; 
 d="asc'?scan'208";a="273392282"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by orsmga003.jf.intel.com with ESMTP; 16 Jun 2020 21:50:21 -0700
Date: Wed, 17 Jun 2020 12:34:18 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PULL] gvt-fixes
Message-ID: <20200617043418.GQ5687@zhen-hp.sh.intel.com>
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
Content-Type: multipart/mixed; boundary="===============1096027429=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1096027429==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="iamKNtDj9HjMhSdE"
Content-Disposition: inline


--iamKNtDj9HjMhSdE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Hi,

This contains misc fixes for gvt. Two MMIO handler fixes on SKL/CFL,
one mask register bit checking fix exposed in suspend/resume path and
one lockdep error fix for debugfs entry access.

Thanks.
--
The following changes since commit 8e68c6340d5833077b3753eabedab40755571383:

  drm/i915/display: Fix the encoder type check (2020-06-16 11:34:24 +0300)

are available in the Git repository at:

  https://github.com/intel/gvt-linux tags/gvt-fixes-2020-06-17

for you to fetch changes up to a291e4fba259a56a6a274c1989997acb6f0bb03a:

  drm/i915/gvt: Use GFP_ATOMIC instead of GFP_KERNEL in atomic context (2020-06-17 12:36:19 +0800)

----------------------------------------------------------------
gvt-fixes-2020-06-17

- Two missed MMIO handler fixes for SKL/CFL (Colin)
- Fix mask register bits check (Colin)
- Fix one lockdep error for debugfs entry access (Colin)

----------------------------------------------------------------
Colin Xu (4):
      drm/i915/gvt: Add one missing MMIO handler for D_SKL_PLUS
      drm/i915/gvt: Fix two CFL MMIO handling caused by regression.
      drm/i915/gvt: Fix incorrect check of enabled bits in mask registers
      drm/i915/gvt: Use GFP_ATOMIC instead of GFP_KERNEL in atomic context

 drivers/gpu/drm/i915/gvt/debugfs.c      |  2 +-
 drivers/gpu/drm/i915/gvt/handlers.c     | 24 +++++++++++++-----------
 drivers/gpu/drm/i915/gvt/mmio_context.h |  6 +++---
 drivers/gpu/drm/i915/gvt/reg.h          |  5 +++++
 4 files changed, 22 insertions(+), 15 deletions(-)

--iamKNtDj9HjMhSdE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXumdSQAKCRCxBBozTXgY
J/+EAJ413mMP090zW3PGhPFlhN629uS/wwCfRuEL9kDm1+q7PK9SWLNMwb0QIqU=
=fs6w
-----END PGP SIGNATURE-----

--iamKNtDj9HjMhSdE--

--===============1096027429==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============1096027429==--
