Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEFEF59B807
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 22 Aug 2022 05:37:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5058312ACF7;
	Mon, 22 Aug 2022 03:37:34 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40C1812ACDC;
 Mon, 22 Aug 2022 03:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661139438; x=1692675438;
 h=date:from:to:cc:subject:message-id:reply-to:mime-version;
 bh=vorFodc2ORDr+tz5oBwG7AYUNb4s06FtmXto8psmF5E=;
 b=IgDkjZ0tKl50FR0B4kGTsab9TGtU0JZlMvW7zQcQHFthAUFYyCTlJo1q
 DShRdJOWyViIbmYZG5/9Dc5vEkeABNGM0ttxwSAKJ2caDjjqNds/MssR+
 8WGIDblhgZiTZ2gF5eNWRuO42XTdIP0NDuKKQUjUc9BsHwXmXxdpPJiWs
 i5JrhR8JgGd4J/oHdezmq5pSMDPggOnqb+6HloH0UvI1fuk0zwHtar4Z1
 6QY1nwZ/XN/B2wexyUtRg+vE7wgIJmlElOlvC9oBF53SOuQ/8mxBjnb5w
 JgdJ5PbLVOuIoEtSP//zpGdErtnFVw812XdQXZa3CJYOtXCmqAsinBP/F w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10446"; a="294100021"
X-IronPort-AV: E=Sophos;i="5.93,254,1654585200"; 
 d="asc'?scan'208";a="294100021"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2022 20:37:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,254,1654585200"; 
 d="asc'?scan'208";a="608804185"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.159.108])
 by orsmga002.jf.intel.com with ESMTP; 21 Aug 2022 20:37:15 -0700
Date: Mon, 22 Aug 2022 11:12:15 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PULL] gvt-fixes (resend)
Message-ID: <20220822031215.GJ1089@zhen-hp.sh.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="FvF9dqTwB4R3n80B"
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


--FvF9dqTwB4R3n80B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


(resend after fixing sign-off after rebase)

Hi,

Here's one gvt-fixes pull for 6.0-rc. Major one is Cometlake
regression fix for mmio table rework, and others are left kernel doc
fixes not pushed yet.

Thanks!
--
The following changes since commit a7a47a5dfa9a9692a41764ee9ab4054f12924a42:

  drm/i915/reset: Add additional steps for Wa_22011802037 for execlist backend (2022-07-25 15:57:54 +0100)

are available in the Git repository at:

  https://github.com/intel/gvt-linux tags/gvt-fixes-2022-08-22

for you to fetch changes up to b75ef35bb57791a5d675699ed4a40c870d1da12f:

  drm/i915/gvt: Fix Comet Lake (2022-08-22 11:33:12 +0800)

----------------------------------------------------------------
gvt-fixes-2022-08-22

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


--FvF9dqTwB4R3n80B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCYwL0BQAKCRCxBBozTXgY
J+WBAJ90VoCMhOIYp7QK7+0NNO4KkzMFRQCfWu0OANNCmGB0AN3RssjYMI/K1L0=
=opmC
-----END PGP SIGNATURE-----

--FvF9dqTwB4R3n80B--
