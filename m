Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B36262D2A9
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 17 Nov 2022 06:29:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1203B10E04C;
	Thu, 17 Nov 2022 05:29:35 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2031610E04C;
 Thu, 17 Nov 2022 05:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668662972; x=1700198972;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=bhCDKPgpR2yy5+PTv3AaUGBOceteA8AW7Da92hyfQmM=;
 b=GoPEqqx0k4br9mKUFSPokHM+S2QwN4EgCdpsaQ7vGozosDcVOWUhlFp2
 YwuDzLOsr67sXJSzGvofqdeGZxdVo9eoIjNXPWdpqqt87X01jtncR8r/K
 bOAhz1EgVt540ekJ2GugrVdR0UITgBdyQaPt0cLuTph9dPyd4JHB309kF
 Oue9i/jAYP/E3pDoOfyxeYy/Dk7rPRPSNUS1Ode9RUOiSUckZv3Nr5ygB
 x6V2DHJTLwnkU31gi3QnSV7RUT8KmA4ZW2yyPiHMvITz2Bf8IxzhRXVFV
 WhkgeXvpX2GXZV1HF2S9C9J9+2YAZHLwe1aw+PjSuow8piFcXhbUwAcIN w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="312775605"
X-IronPort-AV: E=Sophos;i="5.96,169,1665471600"; 
 d="asc'?scan'208";a="312775605"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2022 21:29:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="670787191"
X-IronPort-AV: E=Sophos;i="5.96,169,1665471600"; 
 d="asc'?scan'208";a="670787191"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.159.108])
 by orsmga008.jf.intel.com with ESMTP; 16 Nov 2022 21:29:28 -0800
Date: Thu, 17 Nov 2022 13:28:43 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: Re: [PULL] gvt-next
Message-ID: <20221117052843.GS30028@zhen-hp.sh.intel.com>
References: <20221111085903.GP30028@zhen-hp.sh.intel.com>
 <Y3OyGyJLhL7k8EV+@intel.com>
 <20221117030215.GR30028@zhen-hp.sh.intel.com>
 <6d9f565acb5bd57ee2df79fc5a9cf802724a3333.camel@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="3FyYKcuUbgqNYeqV"
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


--3FyYKcuUbgqNYeqV
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
> > > > Thanks!
> > > > ---
> > > > The following changes since commit
> > > > a6ebd538364b1e9e6048faaafbc0188172ed50c3:
> > > >=20
> > > > ?? drm/i915/sdvo: Fix debug print (2022-10-28 14:46:21 +0300)
> > > >=20
> > > > are available in the Git repository at:
> > > >=20
> > > > ?? https://github.com/intel/gvt-linux.git??tags/gvt-next-2022-11-11
> > > >=20
> > > > for you to fetch changes up to
> > > > 50468ca2e2e1ce882f060a8c263f678affe112db:
> > > >=20
> > > > ?? drm/i915/gvt: Remove the unused function get_pt_type() (2022-
> > > > 11-08 15:34:06 +0800)
> > > >=20
> > > > ----------------------------------------------------------------
> > > > gvt-next-2022-11-11
> > > >=20
> > > > - kernel doc fixes
> > > > - remove vgpu->released sanity check
> > > > - small clean up
> > > >=20
> > > > ----------------------------------------------------------------
> > > > Colin Ian King (1):
> > > > ?????????? drm/i915/reg: Fix spelling mistake "Unsupport" ->
> > > > "Unsupported"
> > >=20
> > > dim: d7e4e9579f01 ("drm/i915/reg: Fix spelling mistake "Unsupport"
> > > -> "Unsupported""): committer Signed-off-by missing.
> > >=20
> > > could you please fix this before we can merge this pr?
> > >=20
> >=20
> > That should still be .mailmap issue for Colin's email...
> > But could we improve our dim script to grep mailmap in that case? So
> > if s-o-b mail is valid
> > in mailmap, we should still allow it, right?
>=20
> Based on what I could verify the commiter signature is really not
> there. It looks like you later forced a rebase and while
> rebasing you forgot to re-sign everything.
>

Oops! Sorry for that. I'll redo this.

> We need to fix this in your tree to avoid propagating that to other
> trees later:
>=20
> From tig view:
> Commit:     Zhenyu Wang <zhenyuw@linux.intel.com>
> CommitDate: Tue Nov 8 15:04:53 2022 +0800
>=20
>     drm/i915/reg: Fix spelling mistake "Unsupport" -> "Unsupported"
>=20
>     There is a spelling mistake in a gvt_vgpu_err error message. Fix
> it.
>=20
>     Fixes: 695fbc08d80f ("drm/i915/gvt: replace the gvt_err with
> gvt_vgpu_err")
>     Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
>     Signed-off-by: Zhi Wang <zhi.a.wang@intel.com>
>     Link:
> http://patchwork.freedesktop.org/patch/msgid/20220315202449.2952845-1-col=
in.i.king@gmail.com
>     Reviewed-by: Zhi Wang <zhi.a.wang@intel.com>
>=20
> no signature from you.
>=20
> >=20
> > > >=20
> > > > Jiapeng Chong (4):
> > > > ?????????? drm/i915/gvt: Fix kernel-doc
> > > > ?????????? drm/i915/gvt: Fix kernel-doc
> > > > ?????????? drm/i915/gvt: Fix kernel-doc
> > > > ?????????? drm/i915/gvt: Remove the unused function get_pt_type()
> > > >=20
> > > > Julia Lawall (1):
> > > > ?????????? drm/i915/gvt: fix typo in comment
> > > >=20
> > > > Mauro Carvalho Chehab (1):
> > > > ?????????? drm/i915: gvt: fix kernel-doc trivial warnings
> > > >=20
> > > > Paulo Miguel Almeida (1):
> > > > ?????????? i915/gvt: remove hardcoded value on crc32_start calculat=
ion
> > > >=20
> > > > Zhi Wang (1):
> > > > ?????????? drm/i915/gvt: remove the vgpu->released and its sanity
> > > > check
> > > >=20
> > > > wangjianli (1):
> > > > ?????????? drm/i915: fix repeated words in comments
> > > >=20
> > > > ??drivers/gpu/drm/i915/gvt/aperture_gm.c?? | 4 ++--
> > > > ??drivers/gpu/drm/i915/gvt/cfg_space.c?????? | 2 +-
> > > > ??drivers/gpu/drm/i915/gvt/dmabuf.h???????????? | 2 +-
> > > > ??drivers/gpu/drm/i915/gvt/firmware.c???????? | 2 +-
> > > > ??drivers/gpu/drm/i915/gvt/gtt.c?????????????????? | 9 ++-------
> > > > ??drivers/gpu/drm/i915/gvt/gvt.h?????????????????? | 2 --
> > > > ??drivers/gpu/drm/i915/gvt/handlers.c???????? | 4 ++--
> > > > ??drivers/gpu/drm/i915/gvt/kvmgt.c?????????????? | 4 ----
> > > > ??drivers/gpu/drm/i915/gvt/mmio_context.c | 2 +-
> > > > ??drivers/gpu/drm/i915/gvt/page_track.c???? | 2 +-
> > > > ??drivers/gpu/drm/i915/gvt/vgpu.c???????????????? | 6 +++---
> > > > ??11 files changed, 14 insertions(+), 25 deletions(-)
> > >=20
> > >=20
>=20

--3FyYKcuUbgqNYeqV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCY3XGhwAKCRCxBBozTXgY
J5eMAJ4mODZi2zXN0tDz+4sccTLa6JOy/wCfSuHdvNPUJWLBOG5C/vNBXgTWizc=
=GofN
-----END PGP SIGNATURE-----

--3FyYKcuUbgqNYeqV--
