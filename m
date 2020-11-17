Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CBD2B5716
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 17 Nov 2020 03:54:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0309C6EA91;
	Tue, 17 Nov 2020 02:54:02 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B7A46E0DC;
 Tue, 17 Nov 2020 02:54:00 +0000 (UTC)
IronPort-SDR: sMdJkm68jHMtGV64N9CGoZWGrYSWzma3vBdnsva6mqZBHYsltK/A5dpxdT6yqNFCQe5n5U/U+J
 I24uEG4KVVMA==
X-IronPort-AV: E=McAfee;i="6000,8403,9807"; a="188904463"
X-IronPort-AV: E=Sophos;i="5.77,484,1596524400"; 
 d="asc'?scan'208";a="188904463"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2020 18:53:50 -0800
IronPort-SDR: juYwcmBhWqBjBcHAiQ0+BmF6pTQgfGBt45xQtNVjpl3jtibp0M/szGE/RtoovN1V/nYWBpQ325
 UXHA10xMCGuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,484,1596524400"; 
 d="asc'?scan'208";a="358709560"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by fmsmga004.fm.intel.com with ESMTP; 16 Nov 2020 18:53:47 -0800
Date: Tue, 17 Nov 2020 10:39:18 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PULL] gvt-fixes
Message-ID: <20201117023918.GB23899@zhen-hp.sh.intel.com>
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
Content-Type: multipart/mixed; boundary="===============1245437541=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1245437541==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5I6of5zJg18YgZEa"
Content-Disposition: inline


--5I6of5zJg18YgZEa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi,

Here's more gvt fixes for 5.10. It temporarily disables VFIO edid
feature on BXT/APL until its virtual display is really fixed to make
it work properly. And fixes for DPCD 1.2 and error return in taking
module reference.

Thanks
--
The following changes since commit 92010a97098c4c9fd777408cc98064d26b32695b:

  drm/i915/gvt: Fix mmio handler break on BXT/APL. (2020-10-30 11:50:06 +08=
00)

are available in the Git repository at:

  https://github.com/intel/gvt-linux tags/gvt-fixes-2020-11-17

for you to fetch changes up to 4ec2b69da5e1544dbadb30cddb49c8df60209b0c:

  drm/i915/gvt: return error when failing to take the module reference (202=
0-11-13 12:16:52 +0800)

----------------------------------------------------------------
gvt-fixes-2020-11-17

- Temporarily disable VFIO edid on BXT/APL (Colin)
- Fix emulated DPCD for version 1.2 (Tina)
- Fix error return when failing to take module reference (Xiongfeng)

----------------------------------------------------------------
Colin Xu (1):
      drm/i915/gvt: Temporarily disable vfio_edid for BXT/APL

Tina Zhang (1):
      drm/i915/gvt: Set ENHANCED_FRAME_CAP bit

Xiongfeng Wang (1):
      drm/i915/gvt: return error when failing to take the module reference

 drivers/gpu/drm/i915/gvt/display.c | 2 +-
 drivers/gpu/drm/i915/gvt/kvmgt.c   | 4 +++-
 drivers/gpu/drm/i915/gvt/vgpu.c    | 3 ++-
 3 files changed, 6 insertions(+), 3 deletions(-)

--=20

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--5I6of5zJg18YgZEa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCX7M3zwAKCRCxBBozTXgY
JytHAJ0btP8+P3WCnh73lciq4cEXns+7EACeKb2XoYw/LhPiRNUVq7PxKK2To2Y=
=SHWC
-----END PGP SIGNATURE-----

--5I6of5zJg18YgZEa--

--===============1245437541==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============1245437541==--
