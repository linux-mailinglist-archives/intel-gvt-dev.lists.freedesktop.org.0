Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06035594F94
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 16 Aug 2022 06:30:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA81DA3864;
	Tue, 16 Aug 2022 04:30:21 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18D6BDBB41;
 Tue, 16 Aug 2022 04:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660624198; x=1692160198;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=ewHDIaB2Vx2zFphgi36ayLPsPBGRV2XbvJ8UqzL96+I=;
 b=VHm7j1Ofa1C8EW4ShJ5tkOfrNYtyM1dpLCEaTN95+jBqpSRtfDVn6SQj
 JNQw0dPCNyoPiaYkQwgeVOzzCi9b6vsfElQKkRQm0THZB/ZJ6DdLC7bu8
 KaRn1KtWvLsIEcQ5R6RZkEnaOPXsLl6SBjlwZxNEqb3YkQ1D77YQ24d0/
 uU01kTSW59gLCgJXYj/7wCWPovFvbVAvt5h2GfQ9Y7rWjIDdSL/wdaTY8
 uR5EBteyuV8TtoVtHytxjFtaxid5/tiT0OghSlB/+tnPoXJ4NnT6FRal/
 j7SgoD1T7gAIpK+L7qe3/SLXuABfho+OKu+u2O94QaHIK+4l3lmR1LF/F A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10440"; a="279083460"
X-IronPort-AV: E=Sophos;i="5.93,240,1654585200"; 
 d="asc'?scan'208";a="279083460"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2022 21:29:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,240,1654585200"; 
 d="asc'?scan'208";a="635733454"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.159.108])
 by orsmga008.jf.intel.com with ESMTP; 15 Aug 2022 21:29:55 -0700
Date: Tue, 16 Aug 2022 12:05:08 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PULL] gvt-fixes
Message-ID: <20220816040508.GG1089@zhen-hp.sh.intel.com>
References: <20220815023855.GF1089@zhen-hp.sh.intel.com>
 <YvrXnUnnot139qKL@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="+bs7B30DeWCM5QK8"
Content-Disposition: inline
In-Reply-To: <YvrXnUnnot139qKL@intel.com>
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


--+bs7B30DeWCM5QK8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2022.08.15 19:32:45 -0400, Rodrigo Vivi wrote:
> On Mon, Aug 15, 2022 at 10:38:55AM +0800, Zhenyu Wang wrote:
> >=20
> > Hi,
> >=20
> > Here's one gvt-fixes pull for 6.0-rc. Major one is Cometlake regression
> > fix for mmio table rework, and others are left kernel doc fixes not pus=
hed yet.
> >=20
> > Thanks
> > --
> > The following changes since commit a7a47a5dfa9a9692a41764ee9ab4054f1292=
4a42:
> >=20
> >   drm/i915/reset: Add additional steps for Wa_22011802037 for execlist =
backend (2022-07-25 15:57:54 +0100)
> >=20
> > are available in the Git repository at:
> >=20
> >   https://github.com/intel/gvt-linux.git tags/gvt-fixes-2022-08-15
> >=20
> > for you to fetch changes up to 394f0560a76298842defd1d95bd64b203a5fdcc4:
> >=20
> >   drm/i915/gvt: Fix Comet Lake (2022-08-15 10:54:03 +0800)
> >=20
> > ----------------------------------------------------------------
> > gvt-fixes-2022-08-15
> >=20
> > - CometLake regression fix in mmio table rework (Alex)
> > - misc kernel doc and typo fixes
> >=20
> > ----------------------------------------------------------------
> > Alex Williamson (1):
> >       drm/i915/gvt: Fix Comet Lake
> >=20
> > Colin Ian King (1):
> >       drm/i915/reg: Fix spelling mistake "Unsupport" -> "Unsupported"
>=20
> dim: d6632370536d ("drm/i915/reg: Fix spelling mistake "Unsupport" -> "Un=
supported""): committer Signed-off-by missing.
>=20
> is it possible to fix this in your tree?

Sorry about that. Let me re-generate.

--+bs7B30DeWCM5QK8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCYvsXagAKCRCxBBozTXgY
J4H6AJwIm0U+hWDANaLPCaYSS2vTVz/ApwCffuS2f+1XjbMA6Si5J/iVXwCAsf4=
=wI4g
-----END PGP SIGNATURE-----

--+bs7B30DeWCM5QK8--
