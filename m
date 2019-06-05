Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C715358F9
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  5 Jun 2019 10:50:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE1E6896C7;
	Wed,  5 Jun 2019 08:50:41 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAF4B8967B;
 Wed,  5 Jun 2019 08:50:39 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Jun 2019 01:50:39 -0700
X-ExtLoop1: 1
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by orsmga003.jf.intel.com with ESMTP; 05 Jun 2019 01:50:37 -0700
Date: Wed, 5 Jun 2019 16:49:03 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PULL] gvt-fixes
Message-ID: <20190605084903.GX9684@zhen-hp.sh.intel.com>
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
Reply-To: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>, "Lv,
 Zhiyuan" <zhiyuan.lv@intel.com>, Zhi Wang <zhi.a.wang@intel.com>, "Yuan,
 Hang" <hang.yuan@intel.com>
Content-Type: multipart/mixed; boundary="===============1579012456=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1579012456==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2+K7TauFN1Oc3ugB"
Content-Disposition: inline


--2+K7TauFN1Oc3ugB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi,

More gvt fixes for 5.2-rc. This fixed one regression when enabling
debug build of i915 guest, guest ring state fix after execution
for hang check, and with two misc fixes from klocwork check.

Thanks
--
The following changes since commit 3035e8cd6c316cb633b45bc9b38052ba2dfd299b:

  drm/i915/gvt: Fix cmd length of VEB_DI_IECP (2019-05-30 11:31:43 +0800)

are available in the Git repository at:

  https://github.com/intel/gvt-linux tags/gvt-fixes-2019-06-05

for you to fetch changes up to 15e7f52a4596b496ce3da2fa4c1f94c6fb0023f2:

  drm/i915/gvt: save RING_HEAD into vreg when vgpu switched out (2019-06-03=
 13:18:36 +0800)

----------------------------------------------------------------
gvt-fixes-2019-06-05

- Fix i915 guest debug build for register command access (Weinan)
- Fix guest ring state after execution for hangcheck (Xiaolin)
- klocwork static check fixes (Alek)

----------------------------------------------------------------
Aleksei Gimbitskii (2):
      drm/i915/gvt: Check if cur_pt_type is valid
      drm/i915/gvt: Assign NULL to the pointer after memory free.

Weinan Li (1):
      drm/i915/gvt: add F_CMD_ACCESS flag for wa regs

Xiaolin Zhang (1):
      drm/i915/gvt: save RING_HEAD into vreg when vgpu switched out

 drivers/gpu/drm/i915/gvt/gtt.c       | 12 +++++++++++-
 drivers/gpu/drm/i915/gvt/handlers.c  | 13 +++++++------
 drivers/gpu/drm/i915/gvt/reg.h       |  2 ++
 drivers/gpu/drm/i915/gvt/scheduler.c | 25 +++++++++++++++++++++++++
 drivers/gpu/drm/i915/gvt/scheduler.h |  1 +
 5 files changed, 46 insertions(+), 7 deletions(-)

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--2+K7TauFN1Oc3ugB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXPeB/wAKCRCxBBozTXgY
JyOrAJ9WlmWwH9JWEerCXLhmIaSw+hx4LQCdEZZUuUFKI0M2UrHWPHQXfHYXce4=
=bm4e
-----END PGP SIGNATURE-----

--2+K7TauFN1Oc3ugB--

--===============1579012456==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============1579012456==--
