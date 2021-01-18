Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D0F2F9918
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 18 Jan 2021 06:24:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1386B89C49;
	Mon, 18 Jan 2021 05:24:31 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D740389C49;
 Mon, 18 Jan 2021 05:24:29 +0000 (UTC)
IronPort-SDR: 7pge3aXO3JCTm8uL+hCIqfRtsJ/CgWZNhEyZww5tf/TWpogTpyf2p365WKZY0hjK0TfpRf+KSm
 J6zZUy21x2NQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9867"; a="158533924"
X-IronPort-AV: E=Sophos;i="5.79,355,1602572400"; 
 d="asc'?scan'208";a="158533924"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2021 21:24:29 -0800
IronPort-SDR: lWBV5ZgGxUT9/rc+2wQ5doQsWTrdx/gqx9gs0v15oAjFId8ZtJz4Y6chgS9C5GvKginfSeQe11
 WAZSEYEJm07Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,355,1602572400"; 
 d="asc'?scan'208";a="406115866"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by FMSMGA003.fm.intel.com with ESMTP; 17 Jan 2021 21:24:27 -0800
Date: Mon, 18 Jan 2021 13:07:39 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PULL] gvt-gt-next
Message-ID: <20210118050739.GY15982@zhen-hp.sh.intel.com>
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
Content-Type: multipart/mixed; boundary="===============0822025287=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0822025287==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UPT3ojh+0CqEDtpF"
Content-Disposition: inline


--UPT3ojh+0CqEDtpF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Hi,

This is GVT next for 5.12 against drm-intel-gt-next which is mostly
for cmd parser enhancement which adds extra check on register load
depending on initial context and handles vGPU register state
accordingly.

Thanks.
--
The following changes since commit fe7bcfaeb2b775f257348dc7b935f8e80eef3e7d:

  drm/i915/gt: Refactor heartbeat request construction and submission (2020-12-24 18:07:26 +0000)

are available in the Git repository at:

  https://github.com/intel/gvt-linux tags/gvt-gt-next-2021-01-18

for you to fetch changes up to 02dd2b12a685944c4d52c569d05f636372a7b6c7:

  drm/i915/gvt: unify lri cmd handler and mmio handlers (2020-12-25 11:16:32 +0800)

----------------------------------------------------------------
gvt-gt-next-2021-01-18

- GVT cmd parser enhancement against guest context (Yan)

----------------------------------------------------------------
Yan Zhao (11):
      drm/i915/gvt: parse init context to update cmd accessible reg whitelist
      drm/i915/gvt: scan VM ctx pages
      drm/i915/gvt: filter cmds "srm" and "lrm" in cmd_handler
      drm/i915/gvt: filter cmds "lrr-src" and "lrr-dst" in cmd_handler
      drm/i915/gvt: filter cmd "pipe-ctrl" in cmd_handler
      drm/i915/gvt: export find_mmio_info
      drm/i915/gvt: make width of mmio_attribute bigger
      drm/i915/gvt: introduce a new flag F_CMD_WRITE_PATCH
      drm/i915/gvt: statically set F_CMD_WRITE_PATCH flag
      drm/i915/gvt: update F_CMD_WRITE_PATCH flag when parsing init ctx
      drm/i915/gvt: unify lri cmd handler and mmio handlers

 drivers/gpu/drm/i915/gvt/cmd_parser.c | 335 +++++++++++++++++++++++++++-------
 drivers/gpu/drm/i915/gvt/cmd_parser.h |   4 +
 drivers/gpu/drm/i915/gvt/gvt.h        |  37 +++-
 drivers/gpu/drm/i915/gvt/handlers.c   |  15 +-
 drivers/gpu/drm/i915/gvt/mmio.h       |   3 +
 drivers/gpu/drm/i915/gvt/reg.h        |   2 +
 drivers/gpu/drm/i915/gvt/scheduler.c  |  22 ++-
 drivers/gpu/drm/i915/gvt/vgpu.c       |   4 +-
 8 files changed, 339 insertions(+), 83 deletions(-)

--UPT3ojh+0CqEDtpF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCYAUXlgAKCRCxBBozTXgY
J0YSAJ4/8ej1m5fQcbNlEveP4mZ/AHvdQgCdEflyY9dwAuDGdP1lcBXNikNTXNc=
=KneK
-----END PGP SIGNATURE-----

--UPT3ojh+0CqEDtpF--

--===============0822025287==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0822025287==--
