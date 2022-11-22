Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D2B6334A2
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 22 Nov 2022 06:13:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8320610E14F;
	Tue, 22 Nov 2022 05:13:16 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6207A10E14F;
 Tue, 22 Nov 2022 05:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669093993; x=1700629993;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=30JP6bg60b6iAglsNgFSsC4N1VE3xbst2mbQbW5Hwpg=;
 b=b5CdaLM9ZxsA7jMQ/olL1lKqfBy3b4zx+rk1Pb68ZwFxYOlxCEPK2BI7
 KKxqye2mztnd0Fxf6lICkCSa+YTXoYlbinapKiIH7YPQcc5JsXrC1gx1K
 bz57jE9RG8swCd0eESXfTpp3vN5OMFC/0iYEfnaGUmFXIQl485Zx6yDP2
 AzXY70nvD0GhrVdnEDCte0XPB/VY4bFbnBOvhfSTCdMFasxp6S7qvFl7J
 NgkBDaVNgIUY+jmOhgH4rFASeFPs7HG5MJf2fzvG7vQACKqfl6l8/AOUo
 P7qR2vFZ5IMKHWl99wrhk3CXThcuxAnGx+3B29NqoKZWHYpO0Ij9AdRY2 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="375877577"
X-IronPort-AV: E=Sophos;i="5.96,182,1665471600"; 
 d="asc'?scan'208";a="375877577"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2022 21:12:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="643585814"
X-IronPort-AV: E=Sophos;i="5.96,182,1665471600"; 
 d="asc'?scan'208";a="643585814"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.159.108])
 by fmsmga007.fm.intel.com with ESMTP; 21 Nov 2022 21:12:07 -0800
Date: Tue, 22 Nov 2022 13:11:11 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PULL] gvt-fixes
Message-ID: <20221122051111.GU30028@zhen-hp.sh.intel.com>
References: <20221111090208.GQ30028@zhen-hp.sh.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="XVTPT6MZt3zd/C+/"
Content-Disposition: inline
In-Reply-To: <20221111090208.GQ30028@zhen-hp.sh.intel.com>
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
 Zhiyuan" <zhiyuan.lv@intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--XVTPT6MZt3zd/C+/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


ping for this fix pull...

On 2022.11.11 17:02:08 +0800, Zhenyu Wang wrote:
> Hi,
>=20
> Here's two fixes from Sean for 6.1 kernel, which is to fix kvm
> reference in gvt. No regression found in our test.
>=20
> Thanks!
> ---
> The following changes since commit f0c4d9fc9cc9462659728d168387191387e903=
cc:
>=20
>   Linux 6.1-rc4 (2022-11-06 15:07:11 -0800)
>=20
> are available in the Git repository at:
>=20
>   https://github.com/intel/gvt-linux.git tags/gvt-fixes-2022-11-11
>=20
> for you to fetch changes up to 3c9fd44b9330adc5006653566f3d386784b2080e:
>=20
>   drm/i915/gvt: Unconditionally put reference to KVM when detaching vGPU =
(2022-11-11 13:21:52 +0800)
>=20
> ----------------------------------------------------------------
> gvt-fixes-2022-11-11
>=20
> - kvm reference fix from Sean
>=20
> ----------------------------------------------------------------
> Sean Christopherson (2):
>       drm/i915/gvt: Get reference to KVM iff attachment to VM is successf=
ul
>       drm/i915/gvt: Unconditionally put reference to KVM when detaching v=
GPU
>=20
>  drivers/gpu/drm/i915/gvt/kvmgt.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>=20



--XVTPT6MZt3zd/C+/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCY3xZ6wAKCRCxBBozTXgY
J6qoAJ9vqt7/1DiqkfxO30IWpZYWaQFhJgCgilZW+4qTtBdcIG6X0GfWRmxcoog=
=QKxN
-----END PGP SIGNATURE-----

--XVTPT6MZt3zd/C+/--
