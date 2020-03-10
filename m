Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E8D17F1CC
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 10 Mar 2020 09:22:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDDE36E82B;
	Tue, 10 Mar 2020 08:22:02 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A18C6E81A;
 Tue, 10 Mar 2020 08:22:01 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Mar 2020 01:22:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,535,1574150400"; 
 d="asc'?scan'208";a="415118502"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by orsmga005.jf.intel.com with ESMTP; 10 Mar 2020 01:21:58 -0700
Date: Tue, 10 Mar 2020 16:09:33 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: [PULL] gvt-fixes
Message-ID: <20200310080933.GE28483@zhen-hp.sh.intel.com>
MIME-Version: 1.0
User-Agent: Mutt/1.10.0 (2018-05-17)
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
Content-Type: multipart/mixed; boundary="===============1764614707=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1764614707==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="e+JRL32uBeeWnrD4"
Content-Disposition: inline


--e+JRL32uBeeWnrD4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi,

Here's more gvt fixes for 5.6. Fix timer issue caused by idr destroy
change and VBT size error.

Thanks
--

The following changes since commit b549c252b1292aea959cd9b83537fcb9384a6112:

  drm/i915/gvt: Fix orphan vgpu dmabuf_objs' lifetime (2020-02-25 16:14:20 =
+0800)

are available in the Git repository at:

  https://github.com/intel/gvt-linux tags/gvt-fixes-2020-03-10

for you to fetch changes up to 2fa7e15c5f466fdd0c0b196b1dc4a65d191efd96:

  drm/i915/gvt: Fix emulated vbt size issue (2020-03-06 09:35:30 +0800)

----------------------------------------------------------------
gvt-fixes-2020-03-10

- Fix vgpu idr destroy causing timer destroy failure (Zhenyu)
- Fix VBT size (Tina)

----------------------------------------------------------------
Tina Zhang (1):
      drm/i915/gvt: Fix emulated vbt size issue

Zhenyu Wang (1):
      drm/i915/gvt: Fix unnecessary schedule timer when no vGPU exits

 drivers/gpu/drm/i915/gvt/opregion.c |  5 ++---
 drivers/gpu/drm/i915/gvt/vgpu.c     | 12 +++++++++---
 2 files changed, 11 insertions(+), 6 deletions(-)


--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--e+JRL32uBeeWnrD4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXmdLPQAKCRCxBBozTXgY
J8yaAJ4kqjDSeUIPYDweYSfTyJR9bsybEwCfS7eIi9dAgfiBTOs6v96DxBuMpMU=
=gE+p
-----END PGP SIGNATURE-----

--e+JRL32uBeeWnrD4--

--===============1764614707==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============1764614707==--
