Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB3C6A0439
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 23 Feb 2023 09:52:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E79BC10EAEF;
	Thu, 23 Feb 2023 08:52:33 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7347910EAEA;
 Thu, 23 Feb 2023 08:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677142351; x=1708678351;
 h=date:from:to:cc:subject:message-id:reply-to:mime-version;
 bh=yW0yLxeZVYr6+aQ49WULYQr9rDlcD/FL04bqo/2SA5k=;
 b=Z8mALhw8kCeH1v5bDQG/9exOYt+88Q1fbGviL26jUGQDbvnAkTCnhxaT
 OTMBkJmyverMGONUwfHlaAoC2QB+SLb0hVEvXD/Rf9fIHnmxJ8SYlyG2G
 Qa8OG4KcnVg6iR2otWXFv1daNOI1lQ1rnCIPetK7M0FPSUfXbvukpActm
 PP+cGAazKzkcs4vbguidzW5YZ9tbw05q5yJwXgwGyTlCqnjILOQsqMnB3
 eQ4hCettMtjCUDg7dM6vR8mk+gVsMsUmp3AT1Y+M3Ym7WkE48pD8cXDUE
 UkjwaP0yMcCKB7bcPguSNHSSaYrvbVH50Jn7XL1V7wyx2cF5fmkbZDJhs A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="395637650"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; 
 d="asc'?scan'208";a="395637650"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2023 00:52:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="704772017"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; 
 d="asc'?scan'208";a="704772017"
Received: from debian-skl.sh.intel.com (HELO debian-skl) ([10.239.159.40])
 by orsmga001.jf.intel.com with ESMTP; 23 Feb 2023 00:52:28 -0800
Date: Thu, 23 Feb 2023 16:50:41 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: [PULL] gvt-next-fixes
Message-ID: <Y/co4cy10KM1/2uX@debian-scheme>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="+pXwTzjdKstQlErV"
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


--+pXwTzjdKstQlErV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Hi,

This is what are on gvt tree now for next kernel, including fixes for
gvt debugfs, one kconfig symbol fix for menu presentation and misc
typo fixes. Please check details below. This is generated against current
drm-intel-next-fixes.

Thanks!
--
The following changes since commit 8038510b1fe443ffbc0e356db5f47cbb8678a594:

  drm/i915: Fix system suspend without fbdev being initialized (2023-02-15 17:33:07 +0200)

are available in the Git repository at:

  https://github.com/intel/gvt-linux.git tags/gvt-next-fixes-2023-02-23

for you to fetch changes up to 0b93efca3659f6d55ed31cff6722dca5f6e4d6e2:

  drm/i915: move a Kconfig symbol to unbreak the menu presentation (2023-02-23 13:46:39 +0800)

----------------------------------------------------------------
gvt-next-fixes-2023-02-23

- use debugfs attribute for gvt debugfs entries (Deepak R Varma)
- fix memory leak in vgpu destroy for debugfs_lookup() then remove (Greg KH)
- fix DRM_I915_GVT kconfig symbol to unbreak menu presentation (Randy Dunlap)
- fix typos (Deepak R Varma, Colin Ian King)

----------------------------------------------------------------
Colin Ian King (1):
      i915/gvt: Fix spelling mistake "vender" -> "vendor"

Deepak R Varma (2):
      drm/i915/gvt: Avoid full proxy f_ops for debugfs attributes
      drm/i915/gvt: Remove extra semicolon

Greg Kroah-Hartman (1):
      i915: fix memory leak with using debugfs_lookup()

Randy Dunlap (1):
      drm/i915: move a Kconfig symbol to unbreak the menu presentation

 drivers/gpu/drm/i915/Kconfig        |  6 +++---
 drivers/gpu/drm/i915/gvt/debugfs.c  | 16 ++++++++--------
 drivers/gpu/drm/i915/gvt/firmware.c |  2 +-
 drivers/gpu/drm/i915/gvt/kvmgt.c    |  2 +-
 drivers/gpu/drm/i915/gvt/vgpu.c     |  2 +-
 5 files changed, 14 insertions(+), 14 deletions(-)

--+pXwTzjdKstQlErV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCY/co3AAKCRCxBBozTXgY
J+dnAJ9rKVLInJO2/5zS+J7SIy51gzwSZwCdEst2z0eUWY4Zi7V1eXzxPFAKKNM=
=JtZG
-----END PGP SIGNATURE-----

--+pXwTzjdKstQlErV--
