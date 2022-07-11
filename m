Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3424356D45B
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 11 Jul 2022 07:43:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE5E510EC97;
	Mon, 11 Jul 2022 05:43:49 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35B2E10E6D3;
 Mon, 11 Jul 2022 05:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657518228; x=1689054228;
 h=date:from:to:cc:subject:message-id:reply-to:mime-version;
 bh=NNNv9wotnyWTvqaDusWNRSfGm76FrlL8i6Bgub+Yn2M=;
 b=Qy2BlWwVkq5oo/LHTKjzQq1dIceUbhqii/qX0cB/EYGipncuYzADWOrQ
 0qGPNjafHNlZFYeAhnJCLgikBN5wqZDW25kVvj/C8AyWcyb/5m7yAKd4/
 RKzNM3XDpSTXZ7eKkFCpbH9b2rqrvaoOaL4WfcqzgeYn6paDw0VLI8YCS
 kCey6RqDi3mkBF6zifeRxR5ieJwy9qVj5hNO7UyaG36/TYmU7fCVdD3+y
 /iA7GJW22OR7t7H9qGjzHiHhpaQIz+l4z4SAK4ojcFo0yy6OqMO6p1yUp
 H7UFKJGaPfFil1bjM4xwqymUExvOGzWLepbvw14vz6XWGBGXiEElXhCKl g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10404"; a="284606601"
X-IronPort-AV: E=Sophos;i="5.92,262,1650956400"; 
 d="asc'?scan'208";a="284606601"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2022 22:43:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,262,1650956400"; 
 d="asc'?scan'208";a="598920006"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.159.108])
 by fmsmga007.fm.intel.com with ESMTP; 10 Jul 2022 22:43:45 -0700
Date: Mon, 11 Jul 2022 13:20:21 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PULL] gvt-fixes
Message-ID: <20220711052021.GV1089@zhen-hp.sh.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="ynll37MX3Fmyj3VY"
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
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>, "Lv,
 Zhiyuan" <zhiyuan.lv@intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--ynll37MX3Fmyj3VY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Hi,

Here's one gvt fix for 5.19, from Dan for shmem_pin_map() return check bug.

Thanks!
---

The following changes since commit d72d69abfdb6e0375981cfdda8eb45143f12c77d:

  drm/i915/gvt: Make DRM_I915_GVT depend on X86 (2022-01-13 18:13:12 +0000)

are available in the Git repository at:

  https://github.com/intel/gvt-linux.git tags/gvt-fixes-2022-07-11

for you to fetch changes up to e87197fbd137c888fd6c871c72fe7e89445dd015:

  drm/i915/gvt: IS_ERR() vs NULL bug in intel_gvt_update_reg_whitelist() (2022-07-11 13:05:05 +0800)

----------------------------------------------------------------
gvt-fixes-2022-07-11

- Fix return value for shmem_pin_map()

----------------------------------------------------------------
Dan Carpenter (1):
      drm/i915/gvt: IS_ERR() vs NULL bug in intel_gvt_update_reg_whitelist()

 drivers/gpu/drm/i915/gvt/cmd_parser.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

--ynll37MX3Fmyj3VY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCYsuzCwAKCRCxBBozTXgY
J6MZAJwOFIppSSP7yG37UTLmXsSckWO/jwCfSM/lt2X3x4eEDCpMx9hjMzRIBDE=
=mfy7
-----END PGP SIGNATURE-----

--ynll37MX3Fmyj3VY--
