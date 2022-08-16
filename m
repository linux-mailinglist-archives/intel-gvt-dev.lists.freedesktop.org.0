Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CF05951AD
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 16 Aug 2022 07:08:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A30E7DC640;
	Tue, 16 Aug 2022 05:08:34 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED89ADC60F;
 Tue, 16 Aug 2022 05:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660626474; x=1692162474;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=vSRi+Jf2JV/T9akRB8hLZgdvatt/rN4sPPvI+m6QHJs=;
 b=OA5Uw8d5WDLDMSYlnID4cUkXO8Fz99XW6o04LuJNU0bWHBltrOkkXFdh
 zuGfsZ90GQwI1eUYz/WkvBvIBc+naZmigelVM3xcd0yP6XS6WktFLG06n
 E0juizTrihU76AEXieESbtraRG9foAnHXJzRUIdcDNErkLJvFlXhsd/DY
 Hw5uxVkrH1Eo91cRFHMtQhfFAJU9JsnzR5L9HIxB0eOND28wo2Qgk2bIT
 /zIWQ7UwksvTP36gf4y2/7w3i/j6zh1RyBw6bV2xl5ZdQ0hP+UungRXv2
 ItEU8J17awKsNDb7QtRGmdro83CRwDEr+PYS431NUyvY1QNREJCcB6nWr g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10440"; a="289696865"
X-IronPort-AV: E=Sophos;i="5.93,240,1654585200"; 
 d="asc'?scan'208";a="289696865"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2022 22:07:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,240,1654585200"; 
 d="asc'?scan'208";a="666951229"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.159.108])
 by fmsmga008.fm.intel.com with ESMTP; 15 Aug 2022 22:07:50 -0700
Date: Tue, 16 Aug 2022 12:43:03 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: Re: [PULL] gvt-fixes
Message-ID: <20220816044303.GH1089@zhen-hp.sh.intel.com>
References: <20220815023855.GF1089@zhen-hp.sh.intel.com>
 <YvrXnUnnot139qKL@intel.com>
 <20220816040508.GG1089@zhen-hp.sh.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="OPsOAWNf+lTlQ18+"
Content-Disposition: inline
In-Reply-To: <20220816040508.GG1089@zhen-hp.sh.intel.com>
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


--OPsOAWNf+lTlQ18+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2022.08.16 12:05:08 +0800, Zhenyu Wang wrote:
> On 2022.08.15 19:32:45 -0400, Rodrigo Vivi wrote:
> > On Mon, Aug 15, 2022 at 10:38:55AM +0800, Zhenyu Wang wrote:
> > >=20
> > > Hi,
> > >=20
> > > Here's one gvt-fixes pull for 6.0-rc. Major one is Cometlake regressi=
on
> > > fix for mmio table rework, and others are left kernel doc fixes not p=
ushed yet.
> > >=20
> > > Thanks
> > > --
> > > The following changes since commit a7a47a5dfa9a9692a41764ee9ab4054f12=
924a42:
> > >=20
> > >   drm/i915/reset: Add additional steps for Wa_22011802037 for execlis=
t backend (2022-07-25 15:57:54 +0100)
> > >=20
> > > are available in the Git repository at:
> > >=20
> > >   https://github.com/intel/gvt-linux.git tags/gvt-fixes-2022-08-15
> > >=20
> > > for you to fetch changes up to 394f0560a76298842defd1d95bd64b203a5fdc=
c4:
> > >=20
> > >   drm/i915/gvt: Fix Comet Lake (2022-08-15 10:54:03 +0800)
> > >=20
> > > ----------------------------------------------------------------
> > > gvt-fixes-2022-08-15
> > >=20
> > > - CometLake regression fix in mmio table rework (Alex)
> > > - misc kernel doc and typo fixes
> > >=20
> > > ----------------------------------------------------------------
> > > Alex Williamson (1):
> > >       drm/i915/gvt: Fix Comet Lake
> > >=20
> > > Colin Ian King (1):
> > >       drm/i915/reg: Fix spelling mistake "Unsupport" -> "Unsupported"
> >=20
> > dim: d6632370536d ("drm/i915/reg: Fix spelling mistake "Unsupport" -> "=
Unsupported""): committer Signed-off-by missing.
> >=20
> > is it possible to fix this in your tree?
>=20
> Sorry about that. Let me re-generate.

oh, surprise! I just found Colin's email is actually defined in .mailmap,
so all his commits in kernel are changed for @intel.com address as in mailm=
ap...

So maybe I can't change that?



--OPsOAWNf+lTlQ18+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCYvsgTwAKCRCxBBozTXgY
J7GhAJsFozYd6lKRn3ia5c6azULe9/I8XQCePunIQOaGyjPxHN6quyIwennogvI=
=vAIv
-----END PGP SIGNATURE-----

--OPsOAWNf+lTlQ18+--
