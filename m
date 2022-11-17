Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A8162D38D
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 17 Nov 2022 07:41:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EBD610E544;
	Thu, 17 Nov 2022 06:41:57 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 519F710E544;
 Thu, 17 Nov 2022 06:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668667314; x=1700203314;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=fr8ELsOFIQZYDQYEMG5pwrAYYVpvTvmukwkblDdKLpk=;
 b=FNMR2Zm3iG8bzP5GAcalO+dzchGyr1sRIxBWx6URRZ+D0PzosdFWnv9Z
 V39uu9avBtJfJU5bJBYbZV3d2ebSBb+47bnJ9gs5/Hd6Favw+3w6KdGC8
 8n4D3Gkeg5gOcEpZC7UiIhaFH8vmPk3/0zXfrS+KomjKUTJVVUFa5clE6
 pXLkCKSw39/EMnNJSnRo59Qu7ll/i/GZWi25LYq8TBmno/APlgN16cMqI
 mhnQ4+mCnc4JQZvmcratt1DwVyf7w42AgJlnvgzEofnhYLpI6UBqhwjMR
 4XCgT+qpU3LeqcoV9MPcO84Cla1TJlfVBQBQySK3MMtXmkkhnT0bnOXFq Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="313922077"
X-IronPort-AV: E=Sophos;i="5.96,171,1665471600"; 
 d="asc'?scan'208";a="313922077"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2022 22:41:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="641974214"
X-IronPort-AV: E=Sophos;i="5.96,169,1665471600"; 
 d="asc'?scan'208";a="641974214"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.159.108])
 by fmsmga007.fm.intel.com with ESMTP; 16 Nov 2022 22:41:51 -0800
Date: Thu, 17 Nov 2022 14:41:06 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: Re: [PULL] gvt-next
Message-ID: <20221117064106.GT30028@zhen-hp.sh.intel.com>
References: <20221111085903.GP30028@zhen-hp.sh.intel.com>
 <Y3OyGyJLhL7k8EV+@intel.com>
 <20221117030215.GR30028@zhen-hp.sh.intel.com>
 <6d9f565acb5bd57ee2df79fc5a9cf802724a3333.camel@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="vDEbda84Uy/oId5W"
Content-Disposition: inline
In-Reply-To: <6d9f565acb5bd57ee2df79fc5a9cf802724a3333.camel@intel.com>
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
Cc: "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>, "Nikula,
 Jani" <jani.nikula@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>, "Lv,
 Zhiyuan" <zhiyuan.lv@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Wang, Zhi A" <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--vDEbda84Uy/oId5W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2022.11.17 03:37:17 +0000, Vivi, Rodrigo wrote:
> On Thu, 2022-11-17 at 11:02 +0800, Zhenyu Wang wrote:
> > On 2022.11.15 10:36:59 -0500, Rodrigo Vivi wrote:
> > > On Fri, Nov 11, 2022 at 04:59:03PM +0800, Zhenyu Wang wrote:
> > > > Hi,
> > > >=20
> > > > Here's current accumulated changes in gvt-next. Sorry that I
> > > > delayed
> > > > to refresh them on time for upstream...It contains mostly kernel
> > > > doc,
> > > > typo fixes and small code cleanups, as details below.
> > > >=20
> > > > btw, one gvt change for next
> > > > https://patchwork.freedesktop.org/patch/511118/
> > > > is still pending, I need a backmerge from linus tree e.g with
> > > > recent vfio/mdev
> > > > consolidate change with gvt and Jason's fix for destroy device,
> > > > to apply Zhi's
> > > > change cleanly. Pls help on that.
> > > >=20

>=20
> Based on what I could verify the commiter signature is really not
> there. It looks like you later forced a rebase and while
> rebasing you forgot to re-sign everything.
>=20

Hi, pls re-pull this one.

thanks!
---
The following changes since commit a6ebd538364b1e9e6048faaafbc0188172ed50c3:

  drm/i915/sdvo: Fix debug print (2022-10-28 14:46:21 +0300)

are available in the Git repository at:

  https://github.com/intel/gvt-linux.git tags/gvt-next-2022-11-17

for you to fetch changes up to 04ec334e1a0381c3305da4d277cef9250769ca43:

  drm/i915/gvt: Remove the unused function get_pt_type() (2022-11-17 14:07:=
09 +0800)

----------------------------------------------------------------
gvt-next-2022-11-17

- kernel doc fixes
- remove vgpu->released sanity check
- small clean up

----------------------------------------------------------------
Colin Ian King (1):
      drm/i915/reg: Fix spelling mistake "Unsupport" -> "Unsupported"

Jiapeng Chong (4):
      drm/i915/gvt: Fix kernel-doc
      drm/i915/gvt: Fix kernel-doc
      drm/i915/gvt: Fix kernel-doc
      drm/i915/gvt: Remove the unused function get_pt_type()

Julia Lawall (1):
      drm/i915/gvt: fix typo in comment

Mauro Carvalho Chehab (1):
      drm/i915: gvt: fix kernel-doc trivial warnings

Paulo Miguel Almeida (1):
      i915/gvt: remove hardcoded value on crc32_start calculation

Zhi Wang (1):
      drm/i915/gvt: remove the vgpu->released and its sanity check

wangjianli (1):
      drm/i915: fix repeated words in comments

 drivers/gpu/drm/i915/gvt/aperture_gm.c  | 4 ++--
 drivers/gpu/drm/i915/gvt/cfg_space.c    | 2 +-
 drivers/gpu/drm/i915/gvt/dmabuf.h       | 2 +-
 drivers/gpu/drm/i915/gvt/firmware.c     | 2 +-
 drivers/gpu/drm/i915/gvt/gtt.c          | 9 ++-------
 drivers/gpu/drm/i915/gvt/gvt.h          | 2 --
 drivers/gpu/drm/i915/gvt/handlers.c     | 4 ++--
 drivers/gpu/drm/i915/gvt/kvmgt.c        | 4 ----
 drivers/gpu/drm/i915/gvt/mmio_context.c | 2 +-
 drivers/gpu/drm/i915/gvt/page_track.c   | 2 +-
 drivers/gpu/drm/i915/gvt/vgpu.c         | 6 +++---
 11 files changed, 14 insertions(+), 25 deletions(-)

--vDEbda84Uy/oId5W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCY3XXfQAKCRCxBBozTXgY
JwWXAKCUXK3gO0z5Ls4vmLvLcygA3bPNKgCeMfx5MC5nZUrZgIcPDjG3qp4dSsw=
=pTnh
-----END PGP SIGNATURE-----

--vDEbda84Uy/oId5W--
