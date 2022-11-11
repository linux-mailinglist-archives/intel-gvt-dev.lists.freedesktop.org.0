Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E1262560A
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 11 Nov 2022 09:59:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D8C510E79F;
	Fri, 11 Nov 2022 08:59:44 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC5A310E798;
 Fri, 11 Nov 2022 08:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668157177; x=1699693177;
 h=date:from:to:cc:subject:message-id:reply-to:mime-version;
 bh=vojaZ5++KlMsQtNNwhgc54mv8jaqEcCcwpzFMANEVyk=;
 b=YqOiaQGYGAJYKC0j1NbrU9S/C0I1IcOao98twcWA1bUP8KhtzSaFhD3k
 3bdLe7qVKrC1GZs/AMzuJQ0CJO1pcqFWMQZhKJlBtCieQ97s9c03BHUvK
 no1wKbS0mgmtcd4NmPugNpAMbN7/LwqiVeFiI43r/mzzdyWxCjQDm0MZG
 n2dfwACcoUk9OoV8CDWSl0pRmPLkImvXC3afPvNP1zwMpzS9O+lrl8WQG
 GYrYG6CgYiCh+Tj+MBXrN7dYRnUVAugEDjA5+HfObPEbRKGLA2Si+gZqm
 dxwh6O/BAFM3ne8XRkAnU1uJ2+pZ7E4Y8SnIb9F5zDE78RBiAd4rAjKW5 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="310273493"
X-IronPort-AV: E=Sophos;i="5.96,156,1665471600"; 
 d="asc'?scan'208";a="310273493"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2022 00:59:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="701152711"
X-IronPort-AV: E=Sophos;i="5.96,156,1665471600"; 
 d="asc'?scan'208";a="701152711"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.159.108])
 by fmsmga008.fm.intel.com with ESMTP; 11 Nov 2022 00:59:35 -0800
Date: Fri, 11 Nov 2022 16:59:03 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PULL] gvt-next
Message-ID: <20221111085903.GP30028@zhen-hp.sh.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="M9pltayyoy9lWEMH"
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


--M9pltayyoy9lWEMH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Here's current accumulated changes in gvt-next. Sorry that I delayed
to refresh them on time for upstream...It contains mostly kernel doc,
typo fixes and small code cleanups, as details below.

btw, one gvt change for next https://patchwork.freedesktop.org/patch/511118/
is still pending, I need a backmerge from linus tree e.g with recent vfio/mdev
consolidate change with gvt and Jason's fix for destroy device, to apply Zhi's
change cleanly. Pls help on that.

Thanks!
---
The following changes since commit a6ebd538364b1e9e6048faaafbc0188172ed50c3:

  drm/i915/sdvo: Fix debug print (2022-10-28 14:46:21 +0300)

are available in the Git repository at:

  https://github.com/intel/gvt-linux.git tags/gvt-next-2022-11-11

for you to fetch changes up to 50468ca2e2e1ce882f060a8c263f678affe112db:

  drm/i915/gvt: Remove the unused function get_pt_type() (2022-11-08 15:34:06 +0800)

----------------------------------------------------------------
gvt-next-2022-11-11

- kernel doc fixes
- remove vgpu->released sanity check
- small clean up

----------------------------------------------------------------
Colin Ian King (1):
      drm/i915/reg: Fix spelling mistake "Unsupport" -> "Unsupported"

Jiapeng Chong (4):
      drm/i915/gvt: Fix kernel-doc
      drm/i915/gvt: Fix kernel-doc
      drm/i915/gvt: Fix kernel-doc
      drm/i915/gvt: Remove the unused function get_pt_type()

Julia Lawall (1):
      drm/i915/gvt: fix typo in comment

Mauro Carvalho Chehab (1):
      drm/i915: gvt: fix kernel-doc trivial warnings

Paulo Miguel Almeida (1):
      i915/gvt: remove hardcoded value on crc32_start calculation

Zhi Wang (1):
      drm/i915/gvt: remove the vgpu->released and its sanity check

wangjianli (1):
      drm/i915: fix repeated words in comments

 drivers/gpu/drm/i915/gvt/aperture_gm.c  | 4 ++--
 drivers/gpu/drm/i915/gvt/cfg_space.c    | 2 +-
 drivers/gpu/drm/i915/gvt/dmabuf.h       | 2 +-
 drivers/gpu/drm/i915/gvt/firmware.c     | 2 +-
 drivers/gpu/drm/i915/gvt/gtt.c          | 9 ++-------
 drivers/gpu/drm/i915/gvt/gvt.h          | 2 --
 drivers/gpu/drm/i915/gvt/handlers.c     | 4 ++--
 drivers/gpu/drm/i915/gvt/kvmgt.c        | 4 ----
 drivers/gpu/drm/i915/gvt/mmio_context.c | 2 +-
 drivers/gpu/drm/i915/gvt/page_track.c   | 2 +-
 drivers/gpu/drm/i915/gvt/vgpu.c         | 6 +++---
 11 files changed, 14 insertions(+), 25 deletions(-)

--M9pltayyoy9lWEMH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCY24O0QAKCRCxBBozTXgY
Jx2XAJ0ZqIlvsISeVQHlrFea9j34YfUbngCfacBa6KOFK+7olHbG2SRV5+m8ck4=
=pdw0
-----END PGP SIGNATURE-----

--M9pltayyoy9lWEMH--
