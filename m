Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABE14104CD
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 18 Sep 2021 09:35:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C72E66E0E9;
	Sat, 18 Sep 2021 07:35:05 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B4716E0E9;
 Sat, 18 Sep 2021 07:35:04 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10110"; a="202421990"
X-IronPort-AV: E=Sophos;i="5.85,303,1624345200"; 
 d="asc'?scan'208";a="202421990"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2021 00:35:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,303,1624345200"; 
 d="asc'?scan'208";a="472547845"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.143])
 by fmsmga007.fm.intel.com with ESMTP; 18 Sep 2021 00:34:58 -0700
Date: Sat, 18 Sep 2021 15:11:05 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>,
 Zhi Wang <zhi.a.wang@intel.com>, "Lv, Zhiyuan" <zhiyuan.lv@intel.com>,
 "Yuan, Hang" <hang.yuan@intel.com>
Subject: [PULL] gvt-fixes
Message-ID: <20210918071105.GY14689@zhen-hp.sh.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="JP+T4n/bALQSJXh8"
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


--JP+T4n/bALQSJXh8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Hi,

Here's one ww lock fini fix from Zhi which resolved recent regression
with i915 change.

Thanks
--
The following changes since commit 71de496cc489b6bae2f51f89da7f28849bf2836e:

  drm/i915/dp: Drop redundant debug print (2021-08-26 07:31:52 -0400)

are available in the Git repository at:

  https://github.com/intel/gvt-linux tags/gvt-fixes-2021-09-18

for you to fetch changes up to d168cd797982db9db617113644c87b8f5f3cf27e:

  drm/i915/gvt: fix the usage of ww lock in gvt scheduler. (2021-09-13 21:59:31 +0800)

----------------------------------------------------------------
gvt-fixes-2021-09-18

- ww locking fix from Zhi

----------------------------------------------------------------
Zhi A Wang (1):
      drm/i915/gvt: fix the usage of ww lock in gvt scheduler.

 drivers/gpu/drm/i915/gvt/scheduler.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--JP+T4n/bALQSJXh8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCYUWRBAAKCRCxBBozTXgY
J1PJAJwKnf5blAPxydslLivIrdp4QVJtewCeP0eJC0AYSu3CjmfCM9tVIoltXvo=
=tN2f
-----END PGP SIGNATURE-----

--JP+T4n/bALQSJXh8--
