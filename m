Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BBC1CF1F6
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 12 May 2020 11:55:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B60DE6E90A;
	Tue, 12 May 2020 09:55:06 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 674F16E0A1;
 Tue, 12 May 2020 09:55:04 +0000 (UTC)
IronPort-SDR: /Q22ZGzRoXCFI1vwtbFf2+EvNjzsv41V6Dn9mVAjQSxXv8gCKl+8M0kHDIE0AQli/PID8I0Wbe
 x5HtODjdmVTg==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2020 02:55:03 -0700
IronPort-SDR: H2S9UBY0givUN4wuvDL85XufH8gZYvmltx/kbdaOp6SsYBKhr2mpoEmjJR5DdW+IzD8c01YPdV
 +MxVHSoTLSUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,383,1583222400"; 
 d="asc'?scan'208";a="463711650"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by fmsmga006.fm.intel.com with ESMTP; 12 May 2020 02:55:01 -0700
Date: Tue, 12 May 2020 17:40:17 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PULL] gvt-next
Message-ID: <20200512094017.GX18545@zhen-hp.sh.intel.com>
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
Content-Type: multipart/mixed; boundary="===============1780619902=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1780619902==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="V2Kn1ZfDiPlyQ6Qk"
Content-Disposition: inline


--V2Kn1ZfDiPlyQ6Qk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi,

This includes support for ppgtt update by LRI command which gvt
replaces by shadow ppgtt, another small optimization for shadow
ctx and one workload destroy cleanup.

Thanks
--

The following changes since commit fb55c735522352704c35d899d0b253453cf0e799:

  drm/i915/gvt: skip populate shadow context if guest context not changed (=
2020-04-17 17:31:22 +0800)

are available in the Git repository at:

  https://github.com/intel/gvt-linux tags/gvt-next-2020-05-12

for you to fetch changes up to 47e51832ae93534d872511ba557115722582d94c:

  drm/i915/gvt: use context lrc_reg_state for shadow ppgtt override (2020-0=
5-08 12:37:14 +0800)

----------------------------------------------------------------
gvt-next-2020-05-12

- Support PPGTT update via LRI cmd (Zhenyu)
- Remove extra kmap for shadow ctx update (Zhenyu)
- Move workload cleanup out of execlist handling code (Zhenyu)

----------------------------------------------------------------
Zhenyu Wang (3):
      drm/i915/gvt: move workload destroy out of execlist complete
      drm/i915/gvt: Support PPGTT table load command
      drm/i915/gvt: use context lrc_reg_state for shadow ppgtt override

 drivers/gpu/drm/i915/gvt/cmd_parser.c |  45 +++++++++++++
 drivers/gpu/drm/i915/gvt/execlist.c   |   2 -
 drivers/gpu/drm/i915/gvt/gtt.c        |   1 +
 drivers/gpu/drm/i915/gvt/gtt.h        |   1 +
 drivers/gpu/drm/i915/gvt/handlers.c   |   2 +-
 drivers/gpu/drm/i915/gvt/scheduler.c  | 115 ++++++++++++++++++++++++++++++=
+---
 drivers/gpu/drm/i915/gvt/scheduler.h  |   1 +
 7 files changed, 155 insertions(+), 12 deletions(-)

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--V2Kn1ZfDiPlyQ6Qk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXrpvAQAKCRCxBBozTXgY
J5rjAKCLYmqSPT0RM8FbxlltSLiBCzRFQACfWIIIzjwy3gEQOpDis7i5HWcQG+U=
=N2B/
-----END PGP SIGNATURE-----

--V2Kn1ZfDiPlyQ6Qk--

--===============1780619902==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============1780619902==--
