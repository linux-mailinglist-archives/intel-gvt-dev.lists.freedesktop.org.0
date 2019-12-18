Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4D6123EC4
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 18 Dec 2019 06:18:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B78496E21F;
	Wed, 18 Dec 2019 05:18:51 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 873B36E132;
 Wed, 18 Dec 2019 05:18:50 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Dec 2019 21:18:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,328,1571727600"; 
 d="asc'?scan'208";a="218029698"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by orsmga003.jf.intel.com with ESMTP; 17 Dec 2019 21:18:47 -0800
Date: Wed, 18 Dec 2019 13:16:57 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PULL] gvt-fixes
Message-ID: <20191218051657.GA21662@zhen-hp.sh.intel.com>
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
Content-Type: multipart/mixed; boundary="===============1378012697=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1378012697==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TG7lY2/6mW/akb80"
Content-Disposition: inline


--TG7lY2/6mW/akb80
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi,

Here's current gvt fixes which has fix for vGPU display dmabuf,
one guest reset warning and one locking issue. Details below.

Thanks
--
The following changes since commit f26a9e959a7b1588c59f7a919b41b67175b211d8:

  drm/i915/gt: Detect if we miss WaIdleLiteRestore (2019-12-10 12:37:53 +02=
00)

are available in the Git repository at:

  https://github.com/intel/gvt-linux tags/gvt-fixes-2019-12-18

for you to fetch changes up to 5e822e44cecec1ea48925630aa31dfac827fd202:

  drm/i915/gvt: Fix guest boot warning (2019-12-17 11:19:58 +0800)

----------------------------------------------------------------
gvt-fixes-2019-12-18

- vGPU state setting locking fix (Zhenyu)
- Fix vGPU display dmabuf as read-only (Zhenyu)
- Properly handle vGPU display dmabuf page pin when rendering (Tina)
- Fix one guest boot warning to handle guc reset state (Fred)

----------------------------------------------------------------
Gao Fred (1):
      drm/i915/gvt: Fix guest boot warning

Tina Zhang (1):
      drm/i915/gvt: Pin vgpu dma address before using

Zhenyu Wang (2):
      drm/i915/gvt: use vgpu lock for active state setting
      drm/i915/gvt: set guest display buffer as readonly

 drivers/gpu/drm/i915/gvt/dmabuf.c    | 64 ++++++++++++++++++++++++++++++++=
+---
 drivers/gpu/drm/i915/gvt/handlers.c  | 16 +++++++++
 drivers/gpu/drm/i915/gvt/hypercall.h |  2 ++
 drivers/gpu/drm/i915/gvt/kvmgt.c     | 23 +++++++++++++
 drivers/gpu/drm/i915/gvt/mpt.h       | 15 +++++++++
 drivers/gpu/drm/i915/gvt/vgpu.c      |  4 +--
 6 files changed, 118 insertions(+), 6 deletions(-)

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--TG7lY2/6mW/akb80
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXfm2SQAKCRCxBBozTXgY
Jz04AJ4wlkX6sfBP1Ppg62ymecjICJijOACglD3jPJe6aYB7TWblpqdgCVneQ28=
=wOxx
-----END PGP SIGNATURE-----

--TG7lY2/6mW/akb80--

--===============1378012697==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============1378012697==--
