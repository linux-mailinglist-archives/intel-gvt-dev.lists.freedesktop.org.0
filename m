Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 465FF1CEB08
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 12 May 2020 05:02:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B86A46E08E;
	Tue, 12 May 2020 03:02:50 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 411A189E2B;
 Tue, 12 May 2020 03:02:49 +0000 (UTC)
IronPort-SDR: rR/6guOuQxqkkH/vislZJvGFsouBC82n0mDVd1oWb08Ufo9fdUoiPxCjoVSbpIMUdfukSFx2U8
 wlr+4gFxoquQ==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2020 20:02:48 -0700
IronPort-SDR: 1UTr17cxVi0CTEje5T2An1AGoV/t+ozu3oJJCn0W4C/VcLoqA27sBwb9w144ywqVf4N1bs28hu
 IS4lTOTOvwfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,381,1583222400"; 
 d="asc'?scan'208";a="436918249"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by orsmga005.jf.intel.com with ESMTP; 11 May 2020 20:02:46 -0700
Date: Tue, 12 May 2020 10:48:03 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PULL] gvt-fixes
Message-ID: <20200512024803.GQ18545@zhen-hp.sh.intel.com>
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
Content-Type: multipart/mixed; boundary="===============1812697442=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1812697442==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="emC2J5fP5T/4de5w"
Content-Disposition: inline


--emC2J5fP5T/4de5w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi,

Here's two more fixes for 5.7. One is for recent guest display probe failur=
e,
which is fixed by setting correct transcoder and DPLL clock against virtual
display. Another is regression to fix kernel oops for older aliasing ppgtt =
guest.

Thanks
--

The following changes since commit ec7301d5146c9abe8aaf6e16e420ea3951018503:

  drm/i915/gvt: switch to user vfio_group_pin/upin_pages (2020-04-14 16:30:=
17 +0800)

are available in the Git repository at:

  https://github.com/intel/gvt-linux tags/gvt-fixes-2020-05-12

for you to fetch changes up to 72a7a9925e2beea09b109dffb3384c9bf920d9da:

  drm/i915/gvt: Fix kernel oops for 3-level ppgtt guest (2020-05-11 17:07:2=
5 +0800)

----------------------------------------------------------------
gvt-fixes-2020-05-12

- Correct transcoder and DPLL initial clock to fix recent guest
  display probe failure. (Colin)
- Fix kernel oops on older guest using aliasing ppgtt. (Zhenyu)

----------------------------------------------------------------
Colin Xu (1):
      drm/i915/gvt: Init DPLL/DDI vreg for virtual display instead of inher=
itance.

Zhenyu Wang (1):
      drm/i915/gvt: Fix kernel oops for 3-level ppgtt guest

 drivers/gpu/drm/i915/gvt/display.c   | 49 ++++++++++++++++++++++++++++++++=
----
 drivers/gpu/drm/i915/gvt/scheduler.c |  6 ++++-
 2 files changed, 49 insertions(+), 6 deletions(-)


--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--emC2J5fP5T/4de5w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXroOYgAKCRCxBBozTXgY
J0LNAJ90qdhUOgFgMDE82+Qn+yN21MrfxwCePtQ+l6Y8+xq1jxT/m6tdPodvji8=
=bXL9
-----END PGP SIGNATURE-----

--emC2J5fP5T/4de5w--

--===============1812697442==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============1812697442==--
