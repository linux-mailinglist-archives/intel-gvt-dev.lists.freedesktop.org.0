Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4F771545
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 23 Jul 2019 11:34:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FC9A6E193;
	Tue, 23 Jul 2019 09:34:15 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1208689EF7;
 Tue, 23 Jul 2019 09:34:14 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Jul 2019 02:33:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,298,1559545200"; 
 d="asc'?scan'208";a="197061461"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by fmsmga002.fm.intel.com with ESMTP; 23 Jul 2019 02:33:20 -0700
Date: Tue, 23 Jul 2019 17:29:58 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: [PULL] gvt-fixes
Message-ID: <20190723092958.GD8319@zhen-hp.sh.intel.com>
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
Content-Type: multipart/mixed; boundary="===============0882442618=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0882442618==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eqp4TxRxnD4KrmFZ"
Content-Disposition: inline


--eqp4TxRxnD4KrmFZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi,

Here's recent gvt-fixes for 5.3-rc. It includes safety guard
for possible ggtt access error with related checks, includecheck
fix and one cache entry size fix for 2MB ppgtt guest.

Thanks.
--
The following changes since commit d7e8a19b38c8ac1a32b6b03af049e2c88d4155db:

  drm/i915: Don't dereference request if it may have been retired when prin=
ting (2019-07-09 16:16:18 +0300)

are available in the Git repository at:

  https://github.com/intel/gvt-linux.git tags/gvt-fixes-2019-07-23

for you to fetch changes up to 8642656299cf86cfeceb1a48b0e1874de6874a2b:

  drm/i915/gvt: fix incorrect cache entry for guest page mapping (2019-07-1=
8 11:06:41 +0800)

----------------------------------------------------------------
gvt-fixes-2019-07-23

- Guard against potential ggtt access error (Xiong)
- Fix includecheck (Zhenyu)
- Fix cache entry for guest page mapping found by 2M ppgtt guest (Xiaolin)

----------------------------------------------------------------
Xiaolin Zhang (1):
      drm/i915/gvt: fix incorrect cache entry for guest page mapping

Xiong Zhang (3):
      drm/i915/gvt: Warning for invalid ggtt access
      drm/i915/gvt: Don't use ggtt_validdate_range() with size=3D0
      drm/i915/gvt: Checking workload's gma earlier

Zhenyu Wang (1):
      drm/i915/gvt: remove duplicate include of trace.h

 drivers/gpu/drm/i915/gvt/cmd_parser.c   | 10 ----------
 drivers/gpu/drm/i915/gvt/fb_decoder.c   |  6 +++---
 drivers/gpu/drm/i915/gvt/gtt.c          |  9 +++++++++
 drivers/gpu/drm/i915/gvt/kvmgt.c        | 12 ++++++++++++
 drivers/gpu/drm/i915/gvt/scheduler.c    | 28 ++++++++++++++++++++++++++++
 drivers/gpu/drm/i915/gvt/trace_points.c |  2 --
 6 files changed, 52 insertions(+), 15 deletions(-)

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--eqp4TxRxnD4KrmFZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXTbTlgAKCRCxBBozTXgY
JyD0AJ4zCBiLnoqviISTZxhz2nNIYV821wCgnZMKbEFO/vNfJj3U+vobFHbOhA8=
=L3k7
-----END PGP SIGNATURE-----

--eqp4TxRxnD4KrmFZ--

--===============0882442618==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============0882442618==--
