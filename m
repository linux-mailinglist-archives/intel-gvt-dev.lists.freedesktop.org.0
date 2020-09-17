Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 743DE26D412
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 17 Sep 2020 09:01:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E7726E143;
	Thu, 17 Sep 2020 07:01:47 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BED96E12F;
 Thu, 17 Sep 2020 07:01:45 +0000 (UTC)
IronPort-SDR: CV1f4RH0eiDvQqvi/2NJQVkySgVGZ3pN58G4KwQsQYfiImtwdFW2gTd76qI9JqzMgQ2ehr9K60
 UiOWZS2xRI7Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9746"; a="139149142"
X-IronPort-AV: E=Sophos;i="5.76,435,1592895600"; 
 d="asc'?scan'208";a="139149142"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2020 00:01:44 -0700
IronPort-SDR: ukBI2iGpF0qLQV+XK9eI0NxmvQpK6H+RmSGEMAkMlZXNUIW4ONM0HveK7AsjFDWMa+RQJGOf3F
 PBcs9p36BZ1g==
X-IronPort-AV: E=Sophos;i="5.76,435,1592895600"; 
 d="asc'?scan'208";a="344180526"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2020 00:01:42 -0700
Date: Thu, 17 Sep 2020 14:42:08 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: [PULL] gvt-fixes
Message-ID: <20200917064208.GF11592@zhen-hp.sh.intel.com>
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
Content-Type: multipart/mixed; boundary="===============1219127165=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1219127165==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="t0UkRYy7tHLRMCai"
Content-Disposition: inline


--t0UkRYy7tHLRMCai
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi,

Here's one left GVT fix against 5.9 is for kernel oops with VFIO edid
on BDW.

Thanks
--
The following changes since commit a291e4fba259a56a6a274c1989997acb6f0bb03a:

  drm/i915/gvt: Use GFP_ATOMIC instead of GFP_KERNEL in atomic context (202=
0-06-17 12:36:19 +0800)

are available in the Git repository at:

  https://github.com/intel/gvt-linux tags/gvt-fixes-2020-09-17

for you to fetch changes up to 28284943ac94014767ecc2f7b3c5747c4a5617a0:

  drm/i915/gvt: Fix port number for BDW on EDID region setup (2020-09-14 16=
:44:39 +0800)

----------------------------------------------------------------
gvt-fixes-2020-09-17

- Fix kernel oops for VFIO edid on BDW (Zhenyu)

----------------------------------------------------------------
Zhenyu Wang (1):
      drm/i915/gvt: Fix port number for BDW on EDID region setup

 drivers/gpu/drm/i915/gvt/vgpu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)


--=20

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--t0UkRYy7tHLRMCai
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCX2MFQAAKCRCxBBozTXgY
J1weAKCMYFM1ZqlKnkPDGc8e8/8+1ZqR3gCeKEhuomxM22xLX4Fonw6HTAPuSGw=
=Zs1w
-----END PGP SIGNATURE-----

--t0UkRYy7tHLRMCai--

--===============1219127165==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============1219127165==--
