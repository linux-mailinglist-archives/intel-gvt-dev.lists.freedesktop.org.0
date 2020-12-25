Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1F72E297D
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 25 Dec 2020 03:36:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2818489BAC;
	Fri, 25 Dec 2020 02:36:08 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BF7F89BAC;
 Fri, 25 Dec 2020 02:36:06 +0000 (UTC)
IronPort-SDR: y6H4r06DJ9FDh1M5LVHBMoh4JRorD8rJt1kMbU0FkyWXsS2N7d7Cxc6JqO0T23nTj1q8Noi9yl
 Fo74oeVlE++A==
X-IronPort-AV: E=McAfee;i="6000,8403,9845"; a="155398829"
X-IronPort-AV: E=Sophos;i="5.78,446,1599548400"; 
 d="asc'?scan'208";a="155398829"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Dec 2020 18:36:06 -0800
IronPort-SDR: tucc61tEHFQmJSbQhu8JXOadOwoHBaf9bG2MyBUbP8E+J7H9FidSOYi+nzVvKO+ZVTwTFERrRo
 XFb0Jxd8RqQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,446,1599548400"; 
 d="asc'?scan'208";a="399014257"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by FMSMGA003.fm.intel.com with ESMTP; 24 Dec 2020 18:36:04 -0800
Date: Fri, 25 Dec 2020 10:20:09 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: [PULL] gvt-next-fixes
Message-ID: <20201225022009.GF16939@zhen-hp.sh.intel.com>
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
Content-Type: multipart/mixed; boundary="===============1518299535=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1518299535==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aSM3KCOUSI0G0tph"
Content-Disposition: inline


--aSM3KCOUSI0G0tph
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi,

Here's queued fixes from Jani for one useless inline and fix
CONFIG_DRM_I915_WERROR for gvt headers.

Thanks and Merry Christmas!
--
The following changes since commit 9a3a238b3de97b4210c6de66aa88b2d7021ac086:

  drm/i915/gvt: treat intel_gvt_mpt as const in gvt code (2020-11-23 17:14:=
20 +0800)

are available in the Git repository at:

  https://github.com/intel/gvt-linux tags/gvt-next-fixes-2020-12-25

for you to fetch changes up to e056f669dbf76b8752b6cb0b8edd2f75cbdcabb1:

  drm/i915/gvt: make mpt.h self-contained (2020-12-22 11:41:35 +0800)

----------------------------------------------------------------
gvt-next-fixes-2020-12-25

- Avoid one useless inline (Jani)
- make gvt header self-contained, fix CONFIG_DRM_I915_WERROR (Jani)

----------------------------------------------------------------
Jani Nikula (9):
      drm/i915/gvt: avoid useless use of inline
      drm/i915/gvt: make execlist.h self-contained
      drm/i915/gvt: make fb_decoder.h self-contained
      drm/i915/gvt: make gtt.h self-contained
      drm/i915/gvt: make interrupt.h self-contained
      drm/i915/gvt: make mmio_context.h self-contained
      drm/i915/gvt: make gvt.h self-contained
      drm/i915/gvt: make scheduler.h self-contained
      drm/i915/gvt: make mpt.h self-contained

 drivers/gpu/drm/i915/Makefile           | 10 +---------
 drivers/gpu/drm/i915/gvt/execlist.h     |  3 ---
 drivers/gpu/drm/i915/gvt/fb_decoder.h   |  6 ++++--
 drivers/gpu/drm/i915/gvt/gtt.h          | 11 ++++++++++-
 drivers/gpu/drm/i915/gvt/gvt.h          |  4 ++++
 drivers/gpu/drm/i915/gvt/handlers.c     |  3 +--
 drivers/gpu/drm/i915/gvt/interrupt.h    |  5 ++++-
 drivers/gpu/drm/i915/gvt/mmio_context.h | 11 +++++++++++
 drivers/gpu/drm/i915/gvt/mpt.h          |  2 ++
 drivers/gpu/drm/i915/gvt/scheduler.h    |  5 +++++
 10 files changed, 42 insertions(+), 18 deletions(-)

--=20

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--aSM3KCOUSI0G0tph
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCX+VMVAAKCRCxBBozTXgY
J1miAJ9OI18JK+wfkkoP+JmRZGGn08wJOwCgmq+Yakn4dTyjnyEo55NIfUoYeE8=
=xG2a
-----END PGP SIGNATURE-----

--aSM3KCOUSI0G0tph--

--===============1518299535==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============1518299535==--
