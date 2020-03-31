Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79273198CC2
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 31 Mar 2020 09:13:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E6096E264;
	Tue, 31 Mar 2020 07:13:40 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A39A6E264;
 Tue, 31 Mar 2020 07:13:39 +0000 (UTC)
IronPort-SDR: SYmYrJODhBpwFn38jOTLwnmjupK5D4PNVGUHg14T3tTMJ3soeHSx192SQLRL3OFtk+hCrkC8x8
 0h/+4ei4JZZg==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2020 00:13:38 -0700
IronPort-SDR: epxaWChsaovu6LP13hOcJhaf9ePm57pW4b6Fr0Nu+74czL3biyIemQBVVqW6z0y01uhqFwM0T3
 Ax/PJfxNkb8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,327,1580803200"; 
 d="asc'?scan'208";a="248962943"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by orsmga003.jf.intel.com with ESMTP; 31 Mar 2020 00:13:36 -0700
Date: Tue, 31 Mar 2020 15:00:25 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PULL] gvt-next-fixes
Message-ID: <20200331070025.GB16629@zhen-hp.sh.intel.com>
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
Content-Type: multipart/mixed; boundary="===============1988707697=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1988707697==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="J2SCkAp4GZ/dPZZf"
Content-Disposition: inline


--J2SCkAp4GZ/dPZZf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi,

Here's more queued gvt fixes for 5.7. Please see details below.

Thanks
--
The following changes since commit a61ac1e75105a077ec1efd6923ae3c619f862304:

  drm/i915/gvt: Wean gvt off using dev_priv (2020-03-06 10:08:10 +0800)

are available in the Git repository at:

  https://github.com/intel/gvt-linux.git tags/gvt-next-fixes-2020-03-31

for you to fetch changes up to eb0ff8074e0baecba2cd0c7813f6cfa99bafc430:

  drm/i915/gvt: Fix klocwork issues about data size (2020-03-27 15:37:58 +0=
800)

----------------------------------------------------------------
gvt-next-fixes-2020-03-31

- Fix non-privilege access warning (Tina)
- Fix display port type (Tina)
- BDW cmd parser missed SWTESS_BASE_ADDRESS (Yan)
- Bypass length check of LRI (Yan)
- Fix one klocwork warning (Tina)

----------------------------------------------------------------
Tina Zhang (3):
      drm/i915/gvt: Add some regs to force-to-nonpriv whitelist
      drm/i915/gvt: Fix display port type issue
      drm/i915/gvt: Fix klocwork issues about data size

Yan Zhao (2):
      drm/i915/gvt: add support to command SWTESS_BASE_ADDRESS
      drm/i915/gvt: do not check len & max_len for lri

 drivers/gpu/drm/i915/gvt/cmd_parser.c | 16 ++++------------
 drivers/gpu/drm/i915/gvt/display.c    |  6 +++---
 drivers/gpu/drm/i915/gvt/handlers.c   |  8 ++++++--
 drivers/gpu/drm/i915/gvt/scheduler.c  |  4 ++--
 4 files changed, 15 insertions(+), 19 deletions(-)

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--J2SCkAp4GZ/dPZZf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXoLqiQAKCRCxBBozTXgY
J+FjAJ4iogpEw5mlKaWiFrI+7bEx/HdRNACfa19i7zwIvQkyazWiMUFpSaEFgtA=
=mm84
-----END PGP SIGNATURE-----

--J2SCkAp4GZ/dPZZf--

--===============1988707697==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============1988707697==--
