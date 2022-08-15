Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9585927F4
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 15 Aug 2022 05:04:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B06011245A;
	Mon, 15 Aug 2022 03:04:02 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58FA49A65B;
 Mon, 15 Aug 2022 03:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660532635; x=1692068635;
 h=date:from:to:cc:subject:message-id:reply-to:mime-version;
 bh=9f/OOpMSGtX8BHgDl0vexvNUROWYw8AvnLx91KyvASc=;
 b=IAM1JbVXSfGhO4PZnUHuH5IL0ob+7m2zSxmr5Dt95QM+RUXZCuvnjFWf
 +URdIGklmRiGEXoE2IT1FQNcy0VfgsTE26Y16GX14zviHwBP/5hjbP4pa
 FN0qLkFMUjKpFfAUi+PWGUlB1mXdFktXqtd6ky2OKrRthM0YVkL0chxar
 fWXdYoRkJEg+zZ+jSJ8GCpPfZWFfO6Yk4wDV3Wgl7ooo+wEdDB9sBBIIj
 729Pt6pPGd4ZkWuhz+nOZoFF51JCg36a82ieDEIqNQH2fIkEJ8SttEsbY
 EczpIg3aPg/+GVdLnQO7BLhzzbUQxPWpBhcFSJGxfaHlDlrUOkmbWQDQX Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10439"; a="292675049"
X-IronPort-AV: E=Sophos;i="5.93,237,1654585200"; 
 d="asc'?scan'208";a="292675049"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2022 20:03:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,237,1654585200"; 
 d="asc'?scan'208";a="666510773"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.159.108])
 by fmsmga008.fm.intel.com with ESMTP; 14 Aug 2022 20:03:39 -0700
Date: Mon, 15 Aug 2022 10:38:55 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PULL] gvt-fixes
Message-ID: <20220815023855.GF1089@zhen-hp.sh.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="NAwUDtUPse4omjmu"
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


--NAwUDtUPse4omjmu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Hi,

Here's one gvt-fixes pull for 6.0-rc. Major one is Cometlake regression
fix for mmio table rework, and others are left kernel doc fixes not pushed yet.

Thanks
--
The following changes since commit a7a47a5dfa9a9692a41764ee9ab4054f12924a42:

  drm/i915/reset: Add additional steps for Wa_22011802037 for execlist backend (2022-07-25 15:57:54 +0100)

are available in the Git repository at:

  https://github.com/intel/gvt-linux.git tags/gvt-fixes-2022-08-15

for you to fetch changes up to 394f0560a76298842defd1d95bd64b203a5fdcc4:

  drm/i915/gvt: Fix Comet Lake (2022-08-15 10:54:03 +0800)

----------------------------------------------------------------
gvt-fixes-2022-08-15

- CometLake regression fix in mmio table rework (Alex)
- misc kernel doc and typo fixes

----------------------------------------------------------------
Alex Williamson (1):
      drm/i915/gvt: Fix Comet Lake

Colin Ian King (1):
      drm/i915/reg: Fix spelling mistake "Unsupport" -> "Unsupported"

Jiapeng Chong (3):
      drm/i915/gvt: Fix kernel-doc
      drm/i915/gvt: Fix kernel-doc
      drm/i915/gvt: Fix kernel-doc

Julia Lawall (1):
      drm/i915/gvt: fix typo in comment

 drivers/gpu/drm/i915/gvt/aperture_gm.c      | 4 ++--
 drivers/gpu/drm/i915/gvt/gtt.c              | 2 +-
 drivers/gpu/drm/i915/gvt/handlers.c         | 4 ++--
 drivers/gpu/drm/i915/gvt/mmio_context.c     | 2 +-
 drivers/gpu/drm/i915/intel_gvt_mmio_table.c | 3 ++-
 5 files changed, 8 insertions(+), 7 deletions(-)

--NAwUDtUPse4omjmu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCYvmxswAKCRCxBBozTXgY
J/i/AJ4hOrWVcZnn0ZMSOye7lhAmHikylQCgm+E71w3I0pcfZJmKPCYcaZDqIgI=
=hDAq
-----END PGP SIGNATURE-----

--NAwUDtUPse4omjmu--
