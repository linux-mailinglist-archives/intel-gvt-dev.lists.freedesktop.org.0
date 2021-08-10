Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FDE3E52D5
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 10 Aug 2021 07:24:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D14E489DFD;
	Tue, 10 Aug 2021 05:23:59 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78AD989DF7;
 Tue, 10 Aug 2021 05:23:58 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10070"; a="202016620"
X-IronPort-AV: E=Sophos;i="5.84,309,1620716400"; 
 d="asc'?scan'208";a="202016620"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2021 22:23:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,309,1620716400"; 
 d="asc'?scan'208";a="444936220"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.143])
 by fmsmga007.fm.intel.com with ESMTP; 09 Aug 2021 22:23:55 -0700
Date: Tue, 10 Aug 2021 13:01:33 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>,
 Zhi Wang <zhi.a.wang@intel.com>, "Lv, Zhiyuan" <zhiyuan.lv@intel.com>,
 "Yuan, Hang" <hang.yuan@intel.com>
Subject: [PULL] gvt-fixes
Message-ID: <20210810050133.GO13928@zhen-hp.sh.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="0et/Au7PJwzVwd4K"
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
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--0et/Au7PJwzVwd4K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Hi,

Here's one regression fix for windows VM hang issue on recent drivers.

Thanks
--
The following changes since commit c90b4503ccf42d9d367e843c223df44aa550e82a:

  drm/i915/gvt: Clear d3_entered on elsp cmd submission. (2021-07-08 16:42:34 +0800)

are available in the Git repository at:

  https://github.com/intel/gvt-linux tags/gvt-fixes-2021-08-10

for you to fetch changes up to 699aa57b35672c3b2f230e2b7e5d0ab8c2bde80a:

  drm/i915/gvt: Fix cached atomics setting for Windows VM (2021-08-09 14:42:09 +0800)

----------------------------------------------------------------
gvt-fixes-2021-08-10

- Fix windows VM hang issue for atomics workaround (Zhenyu)

----------------------------------------------------------------
Zhenyu Wang (1):
      drm/i915/gvt: Fix cached atomics setting for Windows VM

 drivers/gpu/drm/i915/gvt/handlers.c     | 1 +
 drivers/gpu/drm/i915/gvt/mmio_context.c | 2 ++
 2 files changed, 3 insertions(+)

--0et/Au7PJwzVwd4K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCYRIIIwAKCRCxBBozTXgY
J5VxAJ0Zq9s/40VlWt5Fc70UI/ws5rCSSwCfdXdE4mWH5k1gJjfQbcxkDpscSGY=
=oZVH
-----END PGP SIGNATURE-----

--0et/Au7PJwzVwd4K--
