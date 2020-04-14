Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97ECB1A766A
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 14 Apr 2020 10:50:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08D5D6E4A5;
	Tue, 14 Apr 2020 08:50:13 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36A576E4A2;
 Tue, 14 Apr 2020 08:50:11 +0000 (UTC)
IronPort-SDR: 4DJDAn+tYnHYNwce9wvJnikERY7ST1Sx9+f7D/efBPkg4L9/IrtZrw+ia14Y1pV59mAdKcORmb
 zOsjRRB9tc+w==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2020 01:50:10 -0700
IronPort-SDR: q0hvaMKfW/Y0+ztXDEBq4CDOUp6ylYPrQ9bm5Lm1c6Nlf8zLxvb+FttuwKboDUzeQJYARt11Ux
 1OCiI0VNagFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,382,1580803200"; 
 d="asc'?scan'208";a="256446161"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by orsmga006.jf.intel.com with ESMTP; 14 Apr 2020 01:50:07 -0700
Date: Tue, 14 Apr 2020 16:36:26 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PULL] gvt-fixes
Message-ID: <20200414083626.GQ11247@zhen-hp.sh.intel.com>
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
Content-Type: multipart/mixed; boundary="===============1611264078=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1611264078==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RUqJLqMNe5u4kDWT"
Content-Disposition: inline


--RUqJLqMNe5u4kDWT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi,

As I stated in last pull
(https://lists.freedesktop.org/archives/intel-gvt-dev/2020-April/006542.htm=
l),
this one includes gvt fixes for guest page access by using VFIO
interface instead, so remove the concern from KVM and do the right thing.

Thanks
--
The following changes since commit bcad588dea538a4fc173d16a90a005536ec8dbf2:

  drm/i915/perf: Do not clear pollin for small user read buffers (2020-04-1=
3 14:09:48 -0700)

are available in the Git repository at:

  https://github.com/intel/gvt-linux tags/gvt-fixes-2020-04-14

for you to fetch changes up to ec7301d5146c9abe8aaf6e16e420ea3951018503:

  drm/i915/gvt: switch to user vfio_group_pin/upin_pages (2020-04-14 16:30:=
17 +0800)

----------------------------------------------------------------
gvt-fixes-2020-04-14

- Fix guest page access by using VFIO dma r/w interface (Yan)

----------------------------------------------------------------
Yan Zhao (3):
      drm/i915/gvt: hold reference of VFIO group during opening of vgpu
      drm/i915/gvt: subsitute kvm_read/write_guest with vfio_dma_rw
      drm/i915/gvt: switch to user vfio_group_pin/upin_pages

 drivers/gpu/drm/i915/gvt/kvmgt.c | 46 +++++++++++++++++++-----------------=
----
 1 file changed, 22 insertions(+), 24 deletions(-)

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--RUqJLqMNe5u4kDWT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXpV2CgAKCRCxBBozTXgY
J8+RAKCdND6eHdP2aOXNq/AVUFXqDL7XdwCfThondAbPAupAXosPw8tDdLTI+9c=
=cX9V
-----END PGP SIGNATURE-----

--RUqJLqMNe5u4kDWT--

--===============1611264078==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============1611264078==--
