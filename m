Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D6E1601F
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  7 May 2019 11:06:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B03789E98;
	Tue,  7 May 2019 09:06:31 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B041B89E98;
 Tue,  7 May 2019 09:06:30 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 May 2019 02:06:30 -0700
X-ExtLoop1: 1
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by fmsmga006.fm.intel.com with ESMTP; 07 May 2019 02:06:28 -0700
Date: Tue, 7 May 2019 17:05:58 +0800
From: Zhenyu Wang <zhenyu.z.wang@intel.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PULL] gvt-next-fixes
Message-ID: <20190507090558.GE12913@zhen-hp.sh.intel.com>
MIME-Version: 1.0
User-Agent: Mutt/1.10.0 (2018-05-17)
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Reply-To: Zhenyu Wang <zhenyu.z.wang@intel.com>
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>, "Lv,
 Zhiyuan" <zhiyuan.lv@intel.com>, Zhi Wang <zhi.a.wang@intel.com>, "Yuan,
 Hang" <hang.yuan@intel.com>
Content-Type: multipart/mixed; boundary="===============0336596322=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0336596322==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dQ+ozEaLk2y6HH72"
Content-Disposition: inline


--dQ+ozEaLk2y6HH72
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi,

Here's gvt-next-fixes for 5.2-rc, which includes one revert for BXT
regression, one missed context mmio reg after RCS renaming, sanitize
display buffer size calculation and some klocwork warning/error fixes.

Thanks
--
The following changes since commit 447811a686e8da7325516a78069ccfbd139ef1a7:

  drm/i915/icl: Fix MG_DP_MODE() register programming (2019-04-24 09:39:11 =
+0300)

are available in the Git repository at:

  https://github.com/intel/gvt-linux.git tags/gvt-next-fixes-2019-05-07

for you to fetch changes up to 75fdb811d93c8aa4a9f73b63db032b1e6a8668ef:

  drm/i915/gvt: Add in context mmio 0x20D8 to gen9 mmio list (2019-05-05 17=
:02:25 +0800)

----------------------------------------------------------------
gvt-next-fixes-2019-05-07

- Revert MCHBAR save range change for BXT regression (Yakui)
- Align display dmabuf size for bytes instead of error-prone pages (Xiong)
- Fix one context MMIO save/restore after RCS0 name change (Colin)
- Misc klocwork warning/errors fixes (Aleksei)

----------------------------------------------------------------
Aleksei Gimbitskii (4):
      drm/i915/gvt: Remove typedef and let the enumeration starts from zero
      drm/i915/gvt: Do not copy the uninitialized pointer from fb_info
      drm/i915/gvt: Use snprintf() to prevent possible buffer overflow.
      drm/i915/gvt: Check if get_next_pt_type() always returns a valid value

Colin Xu (1):
      drm/i915/gvt: Add in context mmio 0x20D8 to gen9 mmio list

Xiong Zhang (1):
      drm/i915/gvt: Change fb_info->size from pages to bytes

Zhao Yakui (1):
      drm/i915/gvt: Revert "drm/i915/gvt: Refine the snapshort range of I91=
5 MCHBAR to optimize gvt-g boot time"

 drivers/gpu/drm/i915/gvt/debugfs.c      |  4 ++--
 drivers/gpu/drm/i915/gvt/dmabuf.c       | 19 ++++++++-----------
 drivers/gpu/drm/i915/gvt/gtt.c          | 15 +++++++++------
 drivers/gpu/drm/i915/gvt/gtt.h          | 16 ++++++++--------
 drivers/gpu/drm/i915/gvt/handlers.c     |  4 ++--
 drivers/gpu/drm/i915/gvt/mmio_context.c |  1 +
 drivers/gpu/drm/i915/gvt/reg.h          |  3 ---
 drivers/gpu/drm/i915/gvt/scheduler.c    |  2 +-
 8 files changed, 31 insertions(+), 33 deletions(-)

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--dQ+ozEaLk2y6HH72
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXNFKdgAKCRCxBBozTXgY
J+kGAJwLh4FpHsIaOVSMSpYL+tA0IJLUfwCfZx66arNEK5DuTgOvSJeAJ0fCHzM=
=KX+W
-----END PGP SIGNATURE-----

--dQ+ozEaLk2y6HH72--

--===============0336596322==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============0336596322==--
