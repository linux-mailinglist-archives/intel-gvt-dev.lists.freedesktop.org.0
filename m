Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D255C1E54CA
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 28 May 2020 05:51:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F2056E177;
	Thu, 28 May 2020 03:51:22 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E6696E177;
 Thu, 28 May 2020 03:51:21 +0000 (UTC)
IronPort-SDR: tfWxKzgxew+DsmC0jaJ7mOa+/Lc6bClCoHKlw6z4vV+1PLyCsnyQUOK6MZqzLZDKUbPmjc5ZgE
 WSxYlzwC3GWw==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2020 20:51:20 -0700
IronPort-SDR: ucLGaXFqt+9IBq4/mMvoeTqTez8ThpLnocncFpBX/vn0Rwyhj7Sedu35h+4Zbcu+zYE2/kET51
 +XbyE8lI1/Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,443,1583222400"; 
 d="asc'?scan'208";a="267074074"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by orsmga003.jf.intel.com with ESMTP; 27 May 2020 20:51:18 -0700
Date: Thu, 28 May 2020 11:35:59 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PULL] gvt-next-fixes
Message-ID: <20200528033559.GG23961@zhen-hp.sh.intel.com>
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
Content-Type: multipart/mixed; boundary="===============0901652699=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0901652699==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="x4pBfXISqBoDm8sr"
Content-Disposition: inline


--x4pBfXISqBoDm8sr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi,

Here's two queued warning fixes for gvt-next. One is for clang warning
on debug only function and another one from coccicheck to use ARRAY_SIZE.

Thanks
--
The following changes since commit 3a36aa237e4ed04553c0998cf5f47eda3e206e4f:

  drm/i915: Update DRIVER_DATE to 20200515 (2020-05-15 14:49:24 +0300)

are available in the Git repository at:

  https://github.com/intel/gvt-linux tags/gvt-next-fixes-2020-05-28

for you to fetch changes up to cb7ee52284a244fd14caec73df0d49e02891aac4:

  drm/i915/gvt: Use ARRAY_SIZE for vgpu_types (2020-05-19 17:18:50 +0800)

----------------------------------------------------------------
gvt-next-fixes-2020-05-28

- Fix one clang warning on debug only function (Nathan)
- Use ARRAY_SIZE for coccicheck warn (Aishwarya)

----------------------------------------------------------------
Aishwarya Ramakrishnan (1):
      drm/i915/gvt: Use ARRAY_SIZE for vgpu_types

Nathan Chancellor (1):
      drm/i915: Mark check_shadow_context_ppgtt as maybe unused

 drivers/gpu/drm/i915/gvt/scheduler.c | 2 +-
 drivers/gpu/drm/i915/gvt/vgpu.c      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)


--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--x4pBfXISqBoDm8sr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXs8xnwAKCRCxBBozTXgY
Jy1kAKCEIBPFOLwbxGZS1FOUMyxO80ISfACgj1i4AjkSJReL2V67s/l0Hn/qGW8=
=IaYU
-----END PGP SIGNATURE-----

--x4pBfXISqBoDm8sr--

--===============0901652699==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0901652699==--
