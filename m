Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF6A36507C
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 20 Apr 2021 04:51:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B35A6E0C6;
	Tue, 20 Apr 2021 02:51:20 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C353E6E0A5;
 Tue, 20 Apr 2021 02:51:18 +0000 (UTC)
IronPort-SDR: Xk7VV9szf2dF9btDT45aGbNKRqShDgeU0XKq5EKkoc68PU3dUL8qKTbwrGwsGuqN4YWnykP7BP
 SzPXvORaNamA==
X-IronPort-AV: E=McAfee;i="6200,9189,9959"; a="195546111"
X-IronPort-AV: E=Sophos;i="5.82,235,1613462400"; 
 d="asc'?scan'208";a="195546111"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2021 19:51:17 -0700
IronPort-SDR: YPFiwrall01jqbm4EvKVWRURKfYw+wsTHY1hTmqBrk+Vb+koB8mYWrXM0mnS+pmnXfpOZXZA7i
 qgaIrFw/JWbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,235,1613462400"; 
 d="asc'?scan'208";a="385167209"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by orsmga006.jf.intel.com with ESMTP; 19 Apr 2021 19:51:15 -0700
Date: Tue, 20 Apr 2021 10:33:12 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PULL] gvt-fixes
Message-ID: <20210420023312.GL1551@zhen-hp.sh.intel.com>
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
Content-Type: multipart/mixed; boundary="===============0261143125=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0261143125==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="E75mJrUy8lRi9cGN"
Content-Disposition: inline


--E75mJrUy8lRi9cGN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Hi,

Here's one BDW regression fix for cmd parser rework in 5.12 on recent
Windows guest driver update. Sorry to be a bit late, hopefully can
still catch up.

Thanks!
---
The following changes since commit b6a37a93c9ac3900987c79b726d0bb3699d8db4e:

  drm/i915: Fix invalid access to ACPI _DSM objects (2021-04-07 19:07:44 -0400)

are available in the Git repository at:

  https://github.com/intel/gvt-linux tags/gvt-fixes-2021-04-20

for you to fetch changes up to 6b5b2a5bcfe9a250da19bac4ef7cabdc81d154ec:

  drm/i915/gvt: Fix BDW command parser regression (2021-04-16 13:41:41 +0800)

----------------------------------------------------------------
gvt-fixes-2021-04-20

- Fix cmd parser regression on BDW (Zhenyu)

----------------------------------------------------------------
Zhenyu Wang (1):
      drm/i915/gvt: Fix BDW command parser regression

 drivers/gpu/drm/i915/gvt/cmd_parser.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)


--E75mJrUy8lRi9cGN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCYH49YwAKCRCxBBozTXgY
JyLvAKCN8YNnY+37AxKefFWs1kNu6noOOwCeJfq1nqoU6G/ygBB+lDkZXZzWwOE=
=nvgk
-----END PGP SIGNATURE-----

--E75mJrUy8lRi9cGN--

--===============0261143125==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0261143125==--
