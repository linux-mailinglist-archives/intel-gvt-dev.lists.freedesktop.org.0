Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F39F65CE05
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  4 Jan 2023 09:07:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6327410E436;
	Wed,  4 Jan 2023 08:07:47 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07BBA10E436;
 Wed,  4 Jan 2023 08:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672819666; x=1704355666;
 h=date:from:to:cc:subject:message-id:reply-to:mime-version;
 bh=nhxnU/mtKgJf31pdz2nDuYU/QnqHZzQQPJhgQ3Lafm0=;
 b=bCTA5HfnMAieklKiJKaNn64jsg2roWy5oP/NCpgtxhKsWfB/nkp+OiM8
 VTudU6c54+dhPmZmaHkd1qUpIssDFU1uMvxyE7ToG8ycAUcPh5EtTrsGk
 iqqP9D2AulXnuGOmN9wHLoBc+UeseSX1yin32zArfZPX41ZOMEsD081mP
 zjwaBZmemVR2dH1TLfG6lUqq896KJlGw2pZlgs24UODnvU6BpREFcOlHP
 ZksCZk4kQ8tu3ZfO+GkTVDflmIK+w99Gkz4yJPShKkJ6sJrRfoE7F5DTA
 GCpkL3nd09NKpLr5q6/ac//vgEKS0HMQLU1wUnNqVQ1VDZMUSiDnVPiYp g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="305377289"
X-IronPort-AV: E=Sophos;i="5.96,299,1665471600"; 
 d="asc'?scan'208";a="305377289"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2023 00:07:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="797447904"
X-IronPort-AV: E=Sophos;i="5.96,299,1665471600"; 
 d="asc'?scan'208";a="797447904"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.159.108])
 by fmsmga001.fm.intel.com with ESMTP; 04 Jan 2023 00:07:43 -0800
Date: Wed, 4 Jan 2023 16:05:13 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PULL] gvt-fixes
Message-ID: <Y7UzOf7O8AaLTwHQ@zhen-hp.sh.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="mYZcDp+F7plStESH"
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


--mYZcDp+F7plStESH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Hi,

Here's accumulated current gvt-fixes. Several of them handle
for error or destroy path issues and one from Zhi to fix up
left vgpu status tracking.

thanks!
---
The following changes since commit 6217e9f05a74df48c77ee68993d587cdfdb1feb7:

  drm/i915/dsi: fix MIPI_BKLT_EN_1 native GPIO index (2022-12-30 04:28:46 -0500)

are available in the Git repository at:

  https://github.com/intel/gvt-linux.git tags/gvt-fixes-2023-01-04

for you to fetch changes up to 601fd0f6b2a4c776a21ab8300fe0de0726937623:

  drm/i915/gvt: fix double free bug in split_2MB_gtt_entry (2023-01-04 15:20:09 +0800)

----------------------------------------------------------------
gvt-fixes-2023-01-04

- Fix one missed unpin in error of intel_vgpu_shadow_mm_pin()
- Fix two debugfs destroy oops issues for vgpu and gvt entries
- Fix one potential double free issue in gtt shadow pt code
- Fix to use atomic bit flag for vgpu status

----------------------------------------------------------------
Dan Carpenter (1):
      drm/i915: unpin on error in intel_vgpu_shadow_mm_pin()

Zheng Wang (1):
      drm/i915/gvt: fix double free bug in split_2MB_gtt_entry

Zhenyu Wang (3):
      drm/i915/gvt: fix gvt debugfs destroy
      drm/i915/gvt: fix vgpu debugfs clean in remove
      Merge tag 'drm-intel-fixes-2022-12-30' into gvt-fixes

Zhi Wang (1):
      drm/i915/gvt: use atomic operations to change the vGPU status

 drivers/gpu/drm/i915/gvt/debugfs.c   | 36 +++++++++++++++++++++++++++++++-----
 drivers/gpu/drm/i915/gvt/dmabuf.c    |  3 ++-
 drivers/gpu/drm/i915/gvt/gtt.c       | 21 +++++++++++++++------
 drivers/gpu/drm/i915/gvt/gvt.h       | 15 ++++++++++-----
 drivers/gpu/drm/i915/gvt/interrupt.c |  2 +-
 drivers/gpu/drm/i915/gvt/kvmgt.c     | 35 +++++++++++++----------------------
 drivers/gpu/drm/i915/gvt/scheduler.c |  4 +++-
 drivers/gpu/drm/i915/gvt/vgpu.c      | 12 +++++-------
 8 files changed, 80 insertions(+), 48 deletions(-)

--mYZcDp+F7plStESH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCY7UzLgAKCRCxBBozTXgY
JzX8AKCEfVOwT19OhiMWkjHRmEAJoOnKdwCfRakhQo6RJyNIYoOLBG0rTsTcTfQ=
=XUck
-----END PGP SIGNATURE-----

--mYZcDp+F7plStESH--
