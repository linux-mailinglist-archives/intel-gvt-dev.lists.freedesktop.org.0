Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C08035D511
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 13 Apr 2021 04:01:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 361566E141;
	Tue, 13 Apr 2021 02:01:52 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 350A86E113;
 Tue, 13 Apr 2021 02:01:50 +0000 (UTC)
IronPort-SDR: fanyHd/PPF86f7qWiIENmiYfq28Fy9BiHzqRFayt3f0vfWEMzShE4K9EfcROu/RRlCBme2pijc
 nC0ZNWeTJCnA==
X-IronPort-AV: E=McAfee;i="6200,9189,9952"; a="194350500"
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
 d="asc'?scan'208";a="194350500"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2021 19:01:48 -0700
IronPort-SDR: dpnk/tYDwYO3SVEi7HM2vnrFb6nowJMHhcesGzOnnSfRR6NRFYEwTf0/OwTmkwgzqynM+dJXTU
 cuhHkS5Ff9hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
 d="asc'?scan'208";a="443268676"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by fmsmga004.fm.intel.com with ESMTP; 12 Apr 2021 19:01:46 -0700
Date: Tue, 13 Apr 2021 09:43:58 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: Regression: gvt: vgpu 1: MI_LOAD_REGISTER_MEM handler error
Message-ID: <20210413014358.GB14309@zhen-hp.sh.intel.com>
References: <20210412103214.337d521a@omen>
 <20210412192347.042fbc14@x1.home.shazbot.org>
MIME-Version: 1.0
In-Reply-To: <20210412192347.042fbc14@x1.home.shazbot.org>
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
Cc: yan.y.zhao@intel.com, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, zhenyuw@linux.intel.com,
 intel-gvt-dev@lists.freedesktop.org, zhi.a.wang@intel.com
Content-Type: multipart/mixed; boundary="===============1837014829=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1837014829==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YiEDa0DAkWCtVeE4"
Content-Disposition: inline


--YiEDa0DAkWCtVeE4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2021.04.12 19:23:47 -0600, Alex Williamson wrote:
> On Mon, 12 Apr 2021 10:32:14 -0600
> Alex Williamson <alex.williamson@redhat.com> wrote:
>=20
> > Running a Windows guest on a i915-GVTg_V4_2 from an HD 5500 IGD on
> > v5.12-rc6 results in host logs:
> >=20
> > gvt: vgpu 1: lrm access to register (20c0)
> > gvt: vgpu 1: MI_LOAD_REGISTER_MEM handler error
> > gvt: vgpu 1: cmd parser error
> > 0x0=20
> > 0x29=20
> >=20
> > gvt: vgpu 1: scan wa ctx error
> > gvt: vgpu 1: failed to submit desc 0
> > gvt: vgpu 1: fail submit workload on ring rcs0
> > gvt: vgpu 1: fail to emulate MMIO write 00002230 len 4
> >=20
> > The guest goes into a boot loop triggering this error before reaching
> > the desktop and rebooting.  Guest using Intel driver 20.19.15.5171
> > dated 11/4/2020 (from driver file 15.40.5171).
> >=20
> > This VM works well with the same guest and userspace software stack on
> > Fedora's kernel 5.11.11-200.fc33.x86_64.  Thanks,
>=20
> Bisected to:

Looks we didn't hit this one on Broadwell with recent testing. I'll double
check, maybe Broadwell missed something after our cmd parser rework.

Thanks for reporting!

>=20
> commit f18d417a57438498e0de481d3a0bc900c2b0e057
> Author: Yan Zhao <yan.y.zhao@intel.com>
> Date:   Wed Dec 23 11:45:08 2020 +0800
>=20
>     drm/i915/gvt: filter cmds "srm" and "lrm" in cmd_handler
>    =20
>     do not allow "srm" and "lrm" except for GEN8_L3SQCREG4 and 0x21f0.
>    =20
>     Cc: Colin Xu <colin.xu@intel.com>
>     Cc: Kevin Tian <kevin.tian@intel.com>
>     Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
>     Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>
>     Link: http://patchwork.freedesktop.org/patch/msgid/20201223034508.170=
31-1-yan.y.zhao@intel.com
>     Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>
>=20

--YiEDa0DAkWCtVeE4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCYHT3WgAKCRCxBBozTXgY
JyIjAJ4qyEyXGFa1EIPUsVJohueGVLPmjQCeLZxe4LsLldAUVXy+DRZNan125N4=
=mNfW
-----END PGP SIGNATURE-----

--YiEDa0DAkWCtVeE4--

--===============1837014829==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============1837014829==--
