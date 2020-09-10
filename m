Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CCC263CD5
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 10 Sep 2020 07:56:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23F926E039;
	Thu, 10 Sep 2020 05:56:43 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1596D6E039;
 Thu, 10 Sep 2020 05:56:42 +0000 (UTC)
IronPort-SDR: gDbrDk+9QPMcR9cWjw+MH5/4mMSx9JoQe9JyAi5USDP4fdOrkjC58hhs7OJ2424NvMMGea6byQ
 p/eQVp6yW/5g==
X-IronPort-AV: E=McAfee;i="6000,8403,9739"; a="176535669"
X-IronPort-AV: E=Sophos;i="5.76,411,1592895600"; 
 d="asc'?scan'208";a="176535669"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2020 22:56:41 -0700
IronPort-SDR: 03MH4+b0cOOxl22PF6bsiSufpU0uc05f5y/1DDdHDgIaoMFzv8+aaduDqskyJ82jluUitBkFyy
 oeV3f0sA2jQg==
X-IronPort-AV: E=Sophos;i="5.76,411,1592895600"; 
 d="asc'?scan'208";a="505718959"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2020 22:56:39 -0700
Date: Thu, 10 Sep 2020 13:37:20 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PULL] gvt-next
Message-ID: <20200910053720.GK28614@zhen-hp.sh.intel.com>
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
Content-Type: multipart/mixed; boundary="===============2113923944=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============2113923944==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Km1U/tdNT/EmXiR1"
Content-Disposition: inline


--Km1U/tdNT/EmXiR1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi,

As we split pull request for 5.10 this time, here's gvt-next pull
for 5.10. For gvt ww lock fix, Zhi would send another pull based
on gem-next.

This includes current command access flag cleanup for
handlers which would be used for next refined cmd scan. And also
two more recent fixes on workaround cmd access and MIA reset state.

Thanks
--
The following changes since commit ced026e959bec5046afa310d6474e147b6294da2:

  drm/i915: Update DRIVER_DATE to 20200824 (2020-08-24 14:26:38 -0400)

are available in the Git repository at:

  https://github.com/intel/gvt-linux tags/gvt-next-2020-09-10

for you to fetch changes up to df398e33b8fd3ac28b3c7166de555e38d26e7391:

  drm/i915/gvt: Init vreg GUC_STATUS to GS_MIA_IN_RESET (2020-09-10 13:49:0=
5 +0800)

----------------------------------------------------------------
gvt-next-2020-09-10

- Cleanup command access flag (Yan)
- New workaround cmd access fix (Colin)
- MIA reset state fix (Colin)

----------------------------------------------------------------
Colin Xu (2):
      drm/i915/gvt: Add F_CMD_ACCESS for some GEN9 SKU WA MMIO access
      drm/i915/gvt: Init vreg GUC_STATUS to GS_MIA_IN_RESET

Yan Zhao (4):
      drm/i915/gvt: rename F_IN_CTX flag to F_SR_IN_CTX
      drm/i915/gvt: remove flag F_CMD_ACCESSED
      drm/i915/gvt: add/modify interfaces for flag F_CMD_ACCESS
      drm/i915/gvt: remove F_CMD_ACCESS flag for some registers

 drivers/gpu/drm/i915/gvt/cmd_parser.c   |  6 ++---
 drivers/gpu/drm/i915/gvt/gvt.h          | 44 +++++++++++++++++++----------=
----
 drivers/gpu/drm/i915/gvt/handlers.c     | 32 +++++++++++++-----------
 drivers/gpu/drm/i915/gvt/mmio.c         |  3 +++
 drivers/gpu/drm/i915/gvt/mmio_context.c |  2 +-
 5 files changed, 49 insertions(+), 38 deletions(-)

--=20

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--Km1U/tdNT/EmXiR1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCX1m7kAAKCRCxBBozTXgY
J16JAJ4+PoifD67jpATufUGiRJbwj7xihgCfZmWDfhoki+sWocO46Js65vGiC4U=
=aKHu
-----END PGP SIGNATURE-----

--Km1U/tdNT/EmXiR1--

--===============2113923944==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============2113923944==--
