Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E25D62D165
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 17 Nov 2022 04:03:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6895710E530;
	Thu, 17 Nov 2022 03:03:09 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 086C510E52C;
 Thu, 17 Nov 2022 03:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668654184; x=1700190184;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=BbdmkUxT67PVM+xHsx6o6w1hwfhk2+gn2uuUsUVFaaA=;
 b=Ctjy3G9RRGOXEI27yyA9bJPl9jwt37JtdDdIdVRLTnwRD9jTdttH5YBv
 i60t9BEHjM3TLcXZZLXLkEjMWtiM2mvk1jIisVmNhVf9QFpjh7szwiOD5
 AmprVIC2zkt+ONETnXWtqvUM1wJj1/J9A4LrdRLz1KSO9fkIw2WX1APVI
 ttU36HnFHidYxIYqbKyQAJ4ZJyDEJJSIjFrxoKsV7pH7nWhbbWMFFoy8J
 Oo8K/wdaLVz3tNKQ005A7flsT6N0rE5b/74xY88vKQPzN34InnDeRV98M
 TmOjl0terT9eDNoyvzeI6BbmLlWpd4+YRg7rhRzxxr94T/HHd+XSsAOuw A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="293135680"
X-IronPort-AV: E=Sophos;i="5.96,169,1665471600"; 
 d="asc'?scan'208";a="293135680"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2022 19:03:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="590445395"
X-IronPort-AV: E=Sophos;i="5.96,169,1665471600"; 
 d="asc'?scan'208";a="590445395"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.159.108])
 by orsmga003.jf.intel.com with ESMTP; 16 Nov 2022 19:03:00 -0800
Date: Thu, 17 Nov 2022 11:02:15 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PULL] gvt-next
Message-ID: <20221117030215.GR30028@zhen-hp.sh.intel.com>
References: <20221111085903.GP30028@zhen-hp.sh.intel.com>
 <Y3OyGyJLhL7k8EV+@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="I4VOKWutKNZEOIPu"
Content-Disposition: inline
In-Reply-To: <Y3OyGyJLhL7k8EV+@intel.com>
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


--I4VOKWutKNZEOIPu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2022.11.15 10:36:59 -0500, Rodrigo Vivi wrote:
> On Fri, Nov 11, 2022 at 04:59:03PM +0800, Zhenyu Wang wrote:
> > Hi,
> >=20
> > Here's current accumulated changes in gvt-next. Sorry that I delayed
> > to refresh them on time for upstream...It contains mostly kernel doc,
> > typo fixes and small code cleanups, as details below.
> >=20
> > btw, one gvt change for next https://patchwork.freedesktop.org/patch/51=
1118/
> > is still pending, I need a backmerge from linus tree e.g with recent vf=
io/mdev
> > consolidate change with gvt and Jason's fix for destroy device, to appl=
y Zhi's
> > change cleanly. Pls help on that.
> >=20
> > Thanks!
> > ---
> > The following changes since commit a6ebd538364b1e9e6048faaafbc0188172ed=
50c3:
> >=20
> >   drm/i915/sdvo: Fix debug print (2022-10-28 14:46:21 +0300)
> >=20
> > are available in the Git repository at:
> >=20
> >   https://github.com/intel/gvt-linux.git tags/gvt-next-2022-11-11
> >=20
> > for you to fetch changes up to 50468ca2e2e1ce882f060a8c263f678affe112db:
> >=20
> >   drm/i915/gvt: Remove the unused function get_pt_type() (2022-11-08 15=
:34:06 +0800)
> >=20
> > ----------------------------------------------------------------
> > gvt-next-2022-11-11
> >=20
> > - kernel doc fixes
> > - remove vgpu->released sanity check
> > - small clean up
> >=20
> > ----------------------------------------------------------------
> > Colin Ian King (1):
> >       drm/i915/reg: Fix spelling mistake "Unsupport" -> "Unsupported"
>=20
> dim: d7e4e9579f01 ("drm/i915/reg: Fix spelling mistake "Unsupport" -> "Un=
supported""): committer Signed-off-by missing.
>=20
> could you please fix this before we can merge this pr?
>

That should still be .mailmap issue for Colin's email...
But could we improve our dim script to grep mailmap in that case? So if s-o=
-b mail is valid
in mailmap, we should still allow it, right?

> >=20
> > Jiapeng Chong (4):
> >       drm/i915/gvt: Fix kernel-doc
> >       drm/i915/gvt: Fix kernel-doc
> >       drm/i915/gvt: Fix kernel-doc
> >       drm/i915/gvt: Remove the unused function get_pt_type()
> >=20
> > Julia Lawall (1):
> >       drm/i915/gvt: fix typo in comment
> >=20
> > Mauro Carvalho Chehab (1):
> >       drm/i915: gvt: fix kernel-doc trivial warnings
> >=20
> > Paulo Miguel Almeida (1):
> >       i915/gvt: remove hardcoded value on crc32_start calculation
> >=20
> > Zhi Wang (1):
> >       drm/i915/gvt: remove the vgpu->released and its sanity check
> >=20
> > wangjianli (1):
> >       drm/i915: fix repeated words in comments
> >=20
> >  drivers/gpu/drm/i915/gvt/aperture_gm.c  | 4 ++--
> >  drivers/gpu/drm/i915/gvt/cfg_space.c    | 2 +-
> >  drivers/gpu/drm/i915/gvt/dmabuf.h       | 2 +-
> >  drivers/gpu/drm/i915/gvt/firmware.c     | 2 +-
> >  drivers/gpu/drm/i915/gvt/gtt.c          | 9 ++-------
> >  drivers/gpu/drm/i915/gvt/gvt.h          | 2 --
> >  drivers/gpu/drm/i915/gvt/handlers.c     | 4 ++--
> >  drivers/gpu/drm/i915/gvt/kvmgt.c        | 4 ----
> >  drivers/gpu/drm/i915/gvt/mmio_context.c | 2 +-
> >  drivers/gpu/drm/i915/gvt/page_track.c   | 2 +-
> >  drivers/gpu/drm/i915/gvt/vgpu.c         | 6 +++---
> >  11 files changed, 14 insertions(+), 25 deletions(-)
>=20
>=20

--I4VOKWutKNZEOIPu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCY3WkMwAKCRCxBBozTXgY
JydeAJ0aWL6OT0NXbad5DOK2Laa1C1dmhgCcCpzFyRZ7BJcrhd85ubf3Ps5HREs=
=YoWm
-----END PGP SIGNATURE-----

--I4VOKWutKNZEOIPu--
