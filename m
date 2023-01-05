Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A0E65E160
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  5 Jan 2023 01:18:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 038D010E0ED;
	Thu,  5 Jan 2023 00:18:14 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63ABA10E060;
 Thu,  5 Jan 2023 00:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672877893; x=1704413893;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=C+BtmEyybYL8AdwVN1G54XFB73xtzvch+aI1L/3qeKs=;
 b=hgnsY0dlaBj8UzZUfxGHPPnR1FOgayyrh5sCgZwANOr1iA/GasUVdZ8j
 p1QGa+ma/+6rrem/7pxFykmaU93ETfM4CcCgguiSGXqaJFbnGmkidghqs
 uO0Lxx0/cCGQjUEN2qjpGcRNt7tZhZxUdy3b8GxVKVUEpp63ybfn6lo6K
 UXoDdejRgnMJ6TW6IsIrTtlaOrwX0BilA4lwtirkXpytTgs/4oyKGTY+s
 ApZ0Jcz+vaUSqfExkrWiHqhTyz2Wod5UkH2p/+t9JoZ9Zn71b7XBwzyRD
 FzAzWQc8tGBHMKx7DEvQDYcecWvtbsJtHnpYbaeqyeVxJZymeT7AyBeyT Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="384372164"
X-IronPort-AV: E=Sophos;i="5.96,301,1665471600"; 
 d="asc'?scan'208";a="384372164"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2023 16:18:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="762879521"
X-IronPort-AV: E=Sophos;i="5.96,301,1665471600"; 
 d="asc'?scan'208";a="762879521"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.159.108])
 by fmsmga002.fm.intel.com with ESMTP; 04 Jan 2023 16:17:59 -0800
Date: Thu, 5 Jan 2023 08:15:28 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PULL] gvt-fixes
Message-ID: <Y7YWoFpz4plnSLCd@zhen-hp.sh.intel.com>
References: <Y7UzOf7O8AaLTwHQ@zhen-hp.sh.intel.com>
 <Y7VkRDNBOJU4qkYY@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="K63yn0fsYXkOS0fw"
Content-Disposition: inline
In-Reply-To: <Y7VkRDNBOJU4qkYY@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, "Lv,
 Zhiyuan" <zhiyuan.lv@intel.com>,
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>,
 Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--K63yn0fsYXkOS0fw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2023.01.04 06:34:28 -0500, Rodrigo Vivi wrote:
> On Wed, Jan 04, 2023 at 04:05:13PM +0800, Zhenyu Wang wrote:
> >=20
> > Hi,
> >=20
> > Here's accumulated current gvt-fixes. Several of them handle
> > for error or destroy path issues and one from Zhi to fix up
> > left vgpu status tracking.
> >=20
> > thanks!
> > ---
> > The following changes since commit 6217e9f05a74df48c77ee68993d587cdfdb1=
feb7:
>=20
> I'm kind of confused on your baseline here.
>=20
> It is including a strange merge commit in the middle of the commits:
> Zhenyu Wang   ??? M?????? Merge tag 'drm-intel-fixes-2022-12-30' into gvt=
-fixes
> commit c063c8c07864246ba3831b017cea8d3096e236a8
>=20
> Please rebase on top of v6.2-rc2 so we have the same base here.
> (and please remind to sign-off-by when pushing the commits)
>=20

oh, I tried to sycn up by back merge with vfio iommufd of gvt changes
to apply Zhi's patch properly, so it should stand on that tag..but anyway
I just refresh with rebase and fixed two invalid r-b tags. Please pull
below one.

thanks!
---
The following changes since commit 88603b6dc419445847923fcb7fe5080067a30f98:

  Linux 6.2-rc2 (2023-01-01 13:53:16 -0800)

are available in the Git repository at:

  https://github.com/intel/gvt-linux.git tags/gvt-fixes-2023-01-05

for you to fetch changes up to 4a61648af68f5ba4884f0e3b494ee1cabc4b6620:

  drm/i915/gvt: fix double free bug in split_2MB_gtt_entry (2023-01-04 23:2=
1:19 +0800)

----------------------------------------------------------------
gvt-fixes-2023-01-05

- Fix one missed unpin in error of intel_vgpu_shadow_mm_pin()
- Fix two debugfs destroy oops issues for vgpu and gvt entries
- Fix one potential double free issue in gtt shadow pt code
- Fix to use atomic bit flag for vgpu status

----------------------------------------------------------------
Dan Carpenter (1):
      drm/i915: unpin on error in intel_vgpu_shadow_mm_pin()

Zheng Wang (1):
      drm/i915/gvt: fix double free bug in split_2MB_gtt_entry

Zhenyu Wang (2):
      drm/i915/gvt: fix gvt debugfs destroy
      drm/i915/gvt: fix vgpu debugfs clean in remove

Zhi Wang (1):
      drm/i915/gvt: use atomic operations to change the vGPU status

 drivers/gpu/drm/i915/gvt/debugfs.c   | 36 +++++++++++++++++++++++++++++++-=
----
 drivers/gpu/drm/i915/gvt/dmabuf.c    |  3 ++-
 drivers/gpu/drm/i915/gvt/gtt.c       | 21 +++++++++++++++------
 drivers/gpu/drm/i915/gvt/gvt.h       | 15 ++++++++++-----
 drivers/gpu/drm/i915/gvt/interrupt.c |  2 +-
 drivers/gpu/drm/i915/gvt/kvmgt.c     | 35 +++++++++++++-------------------=
---
 drivers/gpu/drm/i915/gvt/scheduler.c |  4 +++-
 drivers/gpu/drm/i915/gvt/vgpu.c      | 12 +++++-------
 8 files changed, 80 insertions(+), 48 deletions(-)

--K63yn0fsYXkOS0fw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCY7YWmQAKCRCxBBozTXgY
J2p2AJ9zja5S9q3+Buh3U14ot/RQLrxpSQCeKpMBtatLU4JLVEZ5TC+1URG0lsg=
=X6sJ
-----END PGP SIGNATURE-----

--K63yn0fsYXkOS0fw--
