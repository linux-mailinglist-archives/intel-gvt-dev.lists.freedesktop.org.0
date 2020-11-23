Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 365282C0223
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 23 Nov 2020 10:20:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFEF289C80;
	Mon, 23 Nov 2020 09:20:04 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CE0B89C80;
 Mon, 23 Nov 2020 09:20:04 +0000 (UTC)
IronPort-SDR: 2kyV69qVUBWn3fQCp8anlBuWTrXlPRnsc7D3/sT4Mtlc5ELgXwL4ZFZmIuTqnNzCUlnUDWe3yr
 oOL4hlxpkV1g==
X-IronPort-AV: E=McAfee;i="6000,8403,9813"; a="171826202"
X-IronPort-AV: E=Sophos;i="5.78,363,1599548400"; 
 d="asc'?scan'208";a="171826202"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2020 01:20:03 -0800
IronPort-SDR: mOQGr3OS+AH9mEIMqg1bOWIaM6D1LBWv+/5d5DHHd2gN30Yo9KP8YEpZJ+lR/jptb5NAn3JqpN
 ACVLHgvgi2MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,363,1599548400"; 
 d="asc'?scan'208";a="536034726"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by fmsmga005.fm.intel.com with ESMTP; 23 Nov 2020 01:20:01 -0800
Date: Mon, 23 Nov 2020 17:05:17 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: [PULL] gvt-next
Message-ID: <20201123090517.GC16939@zhen-hp.sh.intel.com>
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
Content-Type: multipart/mixed; boundary="===============0847011081=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0847011081==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RASg3xLB4tUQ4RcS"
Content-Disposition: inline


--RASg3xLB4tUQ4RcS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi,

Here's gvt next pull for v5.11. Mostly it's for host suspend/resume
fix with vGPU active and with some other enhancement as details below.
Note that this includes some minor i915 driver change to add gvt hook
in suspend/resume function which has been sent and reviewed on
intel-gfx list.

I just generated against drm-intel-next-queued-2020-11-03 which this
tree bases on now. Let me know if there's any issue in merge.

Thanks
--
The following changes since commit 139caf7ca2866cd0a45814ff938cb0c33920a266:

  drm/i915: Update DRIVER_DATE to 20201103 (2020-11-03 14:21:25 +0200)

are available in the Git repository at:

  https://github.com/intel/gvt-linux tags/gvt-next-2020-11-23

for you to fetch changes up to 9a3a238b3de97b4210c6de66aa88b2d7021ac086:

  drm/i915/gvt: treat intel_gvt_mpt as const in gvt code (2020-11-23 17:14:=
20 +0800)

----------------------------------------------------------------
gvt-next-2020-11-23

- Fix host suspend/resume with vGPU (Colin)
- optimize idr init (Varma)
- Change intel_gvt_mpt as const (Julian)
- One comment error fix (Yan)

----------------------------------------------------------------
Colin Xu (3):
      drm/i915/gvt: Save/restore HW status to support GVT suspend/resume
      drm/i915: Add GVT resume routine to i915
      drm/i915/gvt: Fix virtual display setup for BXT/APL

Deepak R Varma (1):
      drm/i915/gvt: replace idr_init() by idr_init_base()

Julian Stecklina (1):
      drm/i915/gvt: treat intel_gvt_mpt as const in gvt code

Yan Zhao (1):
      drm/i915/gvt: correct a false comment of flag F_UNALIGN

 drivers/gpu/drm/i915/gvt/display.c  | 179 ++++++++++++++++++++++++++++++++=
++++
 drivers/gpu/drm/i915/gvt/gtt.c      |  64 +++++++++++++
 drivers/gpu/drm/i915/gvt/gtt.h      |   4 +
 drivers/gpu/drm/i915/gvt/gvt.c      |  13 ++-
 drivers/gpu/drm/i915/gvt/gvt.h      |   7 +-
 drivers/gpu/drm/i915/gvt/handlers.c |  44 ++++++++-
 drivers/gpu/drm/i915/gvt/kvmgt.c    |   2 +-
 drivers/gpu/drm/i915/gvt/mmio.c     |   5 +
 drivers/gpu/drm/i915/gvt/mmio.h     |   4 +
 drivers/gpu/drm/i915/gvt/mpt.h      |   2 +-
 drivers/gpu/drm/i915/gvt/vgpu.c     |   2 +-
 drivers/gpu/drm/i915/i915_drv.c     |   2 +
 drivers/gpu/drm/i915/intel_gvt.c    |  15 +++
 drivers/gpu/drm/i915/intel_gvt.h    |   5 +
 14 files changed, 338 insertions(+), 10 deletions(-)

--=20

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--RASg3xLB4tUQ4RcS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCX7t7SAAKCRCxBBozTXgY
JyNnAJ9nf8Sr3WYtgOwY32tR4WybfjNA0ACgn4EHkV20VZxt5Hjj33haDRTa1sM=
=yhQx
-----END PGP SIGNATURE-----

--RASg3xLB4tUQ4RcS--

--===============0847011081==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0847011081==--
