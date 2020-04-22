Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9841B36D3
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 22 Apr 2020 07:28:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D613F6E215;
	Wed, 22 Apr 2020 05:28:33 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38E256E0EB;
 Wed, 22 Apr 2020 05:28:32 +0000 (UTC)
IronPort-SDR: p/muaZwacvlFhZjM8x3TRmcSXiWgQCE8G1teGf3GafHSq0RcXnm1HZAYQuIk3pTfM1kTVyE7Qp
 pMX5rRvO4RdQ==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2020 22:26:31 -0700
IronPort-SDR: owKBpUx4zSsstgwgkvvKcUsAkZwcpKggtmms7p0570IaNRm1ewejILBeK5smLSHMczUj2op4N6
 V6abFp3o05oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,412,1580803200"; 
 d="asc'?scan'208";a="244403989"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by orsmga007.jf.intel.com with ESMTP; 21 Apr 2020 22:26:29 -0700
Date: Wed, 22 Apr 2020 13:12:30 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PULL] gvt-next
Message-ID: <20200422051230.GH11247@zhen-hp.sh.intel.com>
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
Content-Type: multipart/mixed; boundary="===============1251152168=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1251152168==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EyuBRJR0MsVMWKTf"
Content-Disposition: inline


--EyuBRJR0MsVMWKTf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi,

Here's current gvt-next. This removes left non-upstream xen support bits
which will be kept out of tree instead. And several guest context shadow
optimizations from Yan.

Thanks
--

The following changes since commit a61ac1e75105a077ec1efd6923ae3c619f862304:

  drm/i915/gvt: Wean gvt off using dev_priv (2020-03-06 10:08:10 +0800)

are available in the Git repository at:

  https://github.com/intel/gvt-linux tags/gvt-next-2020-04-22

for you to fetch changes up to fb55c735522352704c35d899d0b253453cf0e799:

  drm/i915/gvt: skip populate shadow context if guest context not changed (=
2020-04-17 17:31:22 +0800)

----------------------------------------------------------------
gvt-next-2020-04-22

- remove non-upstream xen support bits (Christoph)
- guest context shadow copy optimization (Yan)
- guest context tracking for shadow skip optimization (Yan)

----------------------------------------------------------------
Christoph Hellwig (1):
      i915/gvt: remove unused xen bits

Yan Zhao (3):
      drm/i915/gvt: access shadow ctx via its virtual address directly
      drm/i915/gvt: combine access to consecutive guest context pages
      drm/i915/gvt: skip populate shadow context if guest context not chang=
ed

 drivers/gpu/drm/i915/gvt/gtt.c       |  15 +++++
 drivers/gpu/drm/i915/gvt/gvt.c       |   1 -
 drivers/gpu/drm/i915/gvt/gvt.h       |   5 ++
 drivers/gpu/drm/i915/gvt/hypercall.h |   2 -
 drivers/gpu/drm/i915/gvt/scheduler.c | 127 ++++++++++++++++++++++++++-----=
----
 5 files changed, 114 insertions(+), 36 deletions(-)

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--EyuBRJR0MsVMWKTf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXp/SPgAKCRCxBBozTXgY
J/r9AJ4rmWtOO5ABwBjAuO1TT2kxBSXcIQCeLT4P4npcyB/qTIVCqH1JFkuPtT4=
=87MF
-----END PGP SIGNATURE-----

--EyuBRJR0MsVMWKTf--

--===============1251152168==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============1251152168==--
