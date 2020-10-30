Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 929C229FC34
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 30 Oct 2020 04:30:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 225226E94A;
	Fri, 30 Oct 2020 03:30:50 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84B9B6E949;
 Fri, 30 Oct 2020 03:30:48 +0000 (UTC)
IronPort-SDR: Hn4IjgkUX9444u0code81TRRNAWAaqgFhXtfZ3YmCTbBsWhYFV0B4FGN4Ho2kV27A1/kCTmy2y
 ZPoB7CSuqDvQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9789"; a="253261534"
X-IronPort-AV: E=Sophos;i="5.77,432,1596524400"; 
 d="asc'?scan'208";a="253261534"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2020 20:30:48 -0700
IronPort-SDR: 4rS64l96f+aPKZZIFlMnklkj51UIJVMOpRBSL3mZB05JruRryhPGQwU3oLFtrmkeWN5P0N3lYb
 glCkZCLvivkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,432,1596524400"; 
 d="asc'?scan'208";a="525766315"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by fmsmga006.fm.intel.com with ESMTP; 29 Oct 2020 20:30:46 -0700
Date: Fri, 30 Oct 2020 11:09:35 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: Re: [Intel-gfx] [PULL] gvt-fixes
Message-ID: <20201030030935.GX27141@zhen-hp.sh.intel.com>
References: <20201027031740.GA27141@zhen-hp.sh.intel.com>
 <20201027204643.GE3771340@intel.com>
 <C9292B4F-9A82-46AF-BFAB-D372D202F314@intel.com>
MIME-Version: 1.0
In-Reply-To: <C9292B4F-9A82-46AF-BFAB-D372D202F314@intel.com>
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>, "Lv,
 Zhiyuan" <zhiyuan.lv@intel.com>, "Yuan, Hang" <hang.yuan@intel.com>
Content-Type: multipart/mixed; boundary="===============0488998476=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0488998476==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OUFKJBnicyeI7VqU"
Content-Disposition: inline


--OUFKJBnicyeI7VqU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.10.28 11:18:45 +0000, Vivi, Rodrigo wrote:
>=20
>=20
>     On Oct 27, 2020, at 1:46 PM, Rodrigo Vivi <rodrigo.vivi@intel.com> wr=
ote:
>=20
>     On Tue, Oct 27, 2020 at 11:17:40AM +0800, Zhenyu Wang wrote:
>=20
>=20
>         Hi,
>=20
>         Here's first gvt fixes for 5.10 which includes more vGPU
>         suspend/resume fix in HWSP reset handling, and also fix for host =
i915
>         suspend regression when vGPU is created (not need to be active), =
and
>         one workaround for APL guest hang issue.
>=20
>=20
>     pulled to drm-intel-fixes
>=20
>=20
> I'm actually pulling it off. I had bypassed dim, considering this was an =
old
> issue with our email decoder,
> but it happens that=20
>=20
> $ git show 401ccfa87856 | grep Fixes
> Fixes: e6ba76480299 (drm/i915: Remove i915->kernel_context)
>=20
> And this is what it should have:
>=20
> $ dim fixes e6ba76480299 | grep Fixes
> Fixes: e6ba76480299 ("drm/i915: Remove i915->kernel_context")
>=20
> Sorry for the trouble.
> Let's fix this in place so we don't propagate bad tag that might break ot=
her
> scripts on the way
>

Oops, sorry I missed this one. I'll refresh.

Thanks

>=20
>=20
>=20
>         Thanks
>         --
>         The following changes since commit
>         16cce04cdb200ba905d1241b425ac48da5a9ace5:
>=20
>          drm/i915/selftests: Push the fake iommu device from the stack to=
 data
>         (2020-09-23 10:15:46 +0300)
>=20
>         are available in the Git repository at:
>=20
>          https://github.com/intel/gvt-linux tags/gvt-fixes-2020-10-27
>=20
>         for you to fetch changes up to
>         401ccfa87856656b874c737522ea92721394a348:
>=20
>          drm/i915/gvt: Only pin/unpin intel_context along with workload
>         (2020-10-19 16:54:28 +0800)
>=20
>         ----------------------------------------------------------------
>         gvt-fixes-2020-10-27
>=20
>         - Fix HWSP reset handling during vGPU suspend/resume (Colin)
>         - Apply flush workaround on APL now for possible guest hang (Coli=
n)
>         - Fix vGPU context pin/unpin also for host suspend regression with
>          vGPU created (Colin)
>=20
>         ----------------------------------------------------------------
>         Colin Xu (3):
>              drm/i915/gvt: Allow zero out HWSP addr on hws_pga_write
>              drm/i915/gvt: Set SNOOP for PAT3 on BXT/APL to workaround GP=
U BB
>         hang
>              drm/i915/gvt: Only pin/unpin intel_context along with worklo=
ad
>=20
>         drivers/gpu/drm/i915/gvt/handlers.c  | 35
>         +++++++++++++++++++++++++++++++++--
>         drivers/gpu/drm/i915/gvt/scheduler.c | 15 ++++++++-------
>         2 files changed, 41 insertions(+), 9 deletions(-)
>=20
>=20
>         --=20
>=20
>         $gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827
>=20
>=20
>=20
>     _______________________________________________
>     Intel-gfx mailing list
>     Intel-gfx@lists.freedesktop.org
>     https://lists.freedesktop.org/mailman/listinfo/intel-gfx
>=20
>=20

--=20

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--OUFKJBnicyeI7VqU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCX5uD7gAKCRCxBBozTXgY
J+XVAKCOuDEq0+5jllB0v7BW56KmNgi1xACdF58jkOrRErcnzLx1L5/04FQ7uTs=
=VttD
-----END PGP SIGNATURE-----

--OUFKJBnicyeI7VqU--

--===============0488998476==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0488998476==--
