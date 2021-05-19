Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D9B388907
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 19 May 2021 10:08:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17C886ECD7;
	Wed, 19 May 2021 08:08:27 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36EFD6ECD7;
 Wed, 19 May 2021 08:08:26 +0000 (UTC)
IronPort-SDR: OstYQhgNYjXT3jSuKdPXo1hKkK5afucAMcC8an/QGCgGz7USwJGxp6Ng/W+FS/HyxuBhdWW0kG
 umtP17BYQ6fA==
X-IronPort-AV: E=McAfee;i="6200,9189,9988"; a="262148989"
X-IronPort-AV: E=Sophos;i="5.82,312,1613462400"; 
 d="asc'?scan'208";a="262148989"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2021 01:08:25 -0700
IronPort-SDR: 5MiHVO8p0jOQAwyemEMFRoCqlkIewJwEnPtYTyD7TY8w2u3UDo6mVSpcUgK7aN+uu5MAgDcYM8
 DHPQZyzR0KCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,312,1613462400"; 
 d="asc'?scan'208";a="627525913"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by fmsmga006.fm.intel.com with ESMTP; 19 May 2021 01:08:23 -0700
Date: Wed, 19 May 2021 15:49:12 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: [PULL] gvt-fixes
Message-ID: <20210519074912.GG4589@zhen-hp.sh.intel.com>
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
Content-Type: multipart/mixed; boundary="===============0330436154=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0330436154==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gJNQRAHI5jiYqw2y"
Content-Disposition: inline


--gJNQRAHI5jiYqw2y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Hi,

This is to fix GVT config workaround introduced during -rc1 via
vfio/mdev change, which exposed dependency issue explicitly that
made current GVT config nasty. So this is to fix dependency issue
and get back original config sanity.

Thanks
--
The following changes since commit e4527420ed087f99c6aa2ac22c6d3458c7dc1a94:

  drm/i915: Use correct downstream caps for check Src-Ctl mode for PCON (2021-05-12 20:53:08 +0300)

are available in the Git repository at:

  https://github.com/intel/gvt-linux tags/gvt-fixes-2021-05-19

for you to fetch changes up to 145e06b58f8625becc61792a0554726314297a85:

  drm/i915/gvt: Move mdev attribute groups into kvmgt module (2021-05-17 16:37:09 +0800)

----------------------------------------------------------------
gvt-fixes-2021-05-19

- Fix workaround in -rc1 for GVT config (Zhenyu)

----------------------------------------------------------------
Zhenyu Wang (1):
      drm/i915/gvt: Move mdev attribute groups into kvmgt module

 drivers/gpu/drm/i915/Kconfig         |   1 -
 drivers/gpu/drm/i915/gvt/gvt.c       | 124 +----------------------------------
 drivers/gpu/drm/i915/gvt/gvt.h       |   3 -
 drivers/gpu/drm/i915/gvt/hypercall.h |   2 +-
 drivers/gpu/drm/i915/gvt/kvmgt.c     | 122 +++++++++++++++++++++++++++++++---
 drivers/gpu/drm/i915/gvt/mpt.h       |   4 +-
 6 files changed, 118 insertions(+), 138 deletions(-)


--gJNQRAHI5jiYqw2y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCYKTC8gAKCRCxBBozTXgY
J432AJ0Wr1m2CJX/M/gQx2s4aKltr3OUOwCfUsNI2FSmHZka3sRu4cfD/na9cBE=
=muTk
-----END PGP SIGNATURE-----

--gJNQRAHI5jiYqw2y--

--===============0330436154==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0330436154==--
