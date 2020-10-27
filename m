Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3DD29A363
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 27 Oct 2020 04:38:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B092A6EAC1;
	Tue, 27 Oct 2020 03:38:47 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7F926EAC0;
 Tue, 27 Oct 2020 03:38:45 +0000 (UTC)
IronPort-SDR: kzcPYB4aFwiRVkfmVt3//cMlhFZ+9doQl7EiX4vuCNNVK6hrXVRLIXBFUJnu4y3PsiJ+YvWBd5
 MdCqMUuOr0HQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9786"; a="229658689"
X-IronPort-AV: E=Sophos;i="5.77,422,1596524400"; 
 d="asc'?scan'208";a="229658689"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2020 20:38:45 -0700
IronPort-SDR: rYD4q+/uRuUXv5zFXvVKuiTb7Fa9yBDAXG5PSLUWxFsjiSbwpdjhY010vMf/+lOn3VUHKLTDil
 Yq3S4MkizPpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,422,1596524400"; 
 d="asc'?scan'208";a="350127270"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by orsmga008.jf.intel.com with ESMTP; 26 Oct 2020 20:38:43 -0700
Date: Tue, 27 Oct 2020 11:17:40 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PULL] gvt-fixes
Message-ID: <20201027031740.GA27141@zhen-hp.sh.intel.com>
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
Content-Type: multipart/mixed; boundary="===============0985265116=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0985265116==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ri7MIv52hxsKkbzo"
Content-Disposition: inline


--ri7MIv52hxsKkbzo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi,

Here's first gvt fixes for 5.10 which includes more vGPU
suspend/resume fix in HWSP reset handling, and also fix for host i915
suspend regression when vGPU is created (not need to be active), and
one workaround for APL guest hang issue.

Thanks
--
The following changes since commit 16cce04cdb200ba905d1241b425ac48da5a9ace5:

  drm/i915/selftests: Push the fake iommu device from the stack to data (20=
20-09-23 10:15:46 +0300)

are available in the Git repository at:

  https://github.com/intel/gvt-linux tags/gvt-fixes-2020-10-27

for you to fetch changes up to 401ccfa87856656b874c737522ea92721394a348:

  drm/i915/gvt: Only pin/unpin intel_context along with workload (2020-10-1=
9 16:54:28 +0800)

----------------------------------------------------------------
gvt-fixes-2020-10-27

- Fix HWSP reset handling during vGPU suspend/resume (Colin)
- Apply flush workaround on APL now for possible guest hang (Colin)
- Fix vGPU context pin/unpin also for host suspend regression with
  vGPU created (Colin)

----------------------------------------------------------------
Colin Xu (3):
      drm/i915/gvt: Allow zero out HWSP addr on hws_pga_write
      drm/i915/gvt: Set SNOOP for PAT3 on BXT/APL to workaround GPU BB hang
      drm/i915/gvt: Only pin/unpin intel_context along with workload

 drivers/gpu/drm/i915/gvt/handlers.c  | 35 ++++++++++++++++++++++++++++++++=
+--
 drivers/gpu/drm/i915/gvt/scheduler.c | 15 ++++++++-------
 2 files changed, 41 insertions(+), 9 deletions(-)


--=20

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--ri7MIv52hxsKkbzo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCX5eRVAAKCRCxBBozTXgY
JwBpAJ9w/PhFwAJCfEEnYz4/3zmGBHGpKwCfWW+ILCCfAYFQiNYp5YAD3iToAk8=
=+trd
-----END PGP SIGNATURE-----

--ri7MIv52hxsKkbzo--

--===============0985265116==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0985265116==--
