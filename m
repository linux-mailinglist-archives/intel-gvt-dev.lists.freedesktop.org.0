Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB8D29FD66
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 30 Oct 2020 06:42:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C6326E953;
	Fri, 30 Oct 2020 05:42:31 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DA526E953;
 Fri, 30 Oct 2020 05:42:30 +0000 (UTC)
IronPort-SDR: 7qeKUZgfaQfa1K/4l2x6D70hHmEOjDf5Eorqm/bxJHZKJS4n6o3rtQd+sj6BqFxwubXRBHDlQc
 yCjbgLHggzPQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9789"; a="168659394"
X-IronPort-AV: E=Sophos;i="5.77,432,1596524400"; 
 d="asc'?scan'208";a="168659394"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2020 22:42:29 -0700
IronPort-SDR: EKkTL95dlvh/5wJ204JPwEQYU9gGnNbxUjs29o6BCw7oh1i+cr2LKzxbsYa1m8BqQI+mOHz2Ho
 kw+4KDs4b+Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,432,1596524400"; 
 d="asc'?scan'208";a="361749206"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by FMSMGA003.fm.intel.com with ESMTP; 29 Oct 2020 22:42:27 -0700
Date: Fri, 30 Oct 2020 13:21:18 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: Re: [Intel-gfx] [PULL] gvt-fixes
Message-ID: <20201030052117.GC27141@zhen-hp.sh.intel.com>
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
Content-Type: multipart/mixed; boundary="===============1187520750=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1187520750==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nbmc0BhO2pdgImje"
Content-Disposition: inline


--nbmc0BhO2pdgImje
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.10.28 11:18:45 +0000, Vivi, Rodrigo wrote:

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
>=20

Hi, Rodrigo, here's re-generated pull. I also picked another fixes for
MMIO cmd access flag on BXT/APL, which required a backmerge.

Thanks!
--
The following changes since commit 61334ed227a5852100115180f5535b1396ed5227:

  drm/i915: Reject 90/270 degree rotated initial fbs (2020-10-29 14:20:24 -=
0400)

are available in the Git repository at:

  https://github.com/intel/gvt-linux tags/gvt-fixes-2020-10-30

for you to fetch changes up to 92010a97098c4c9fd777408cc98064d26b32695b:

  drm/i915/gvt: Fix mmio handler break on BXT/APL. (2020-10-30 11:50:06 +08=
00)

----------------------------------------------------------------
gvt-fixes-2020-10-30

- Fix HWSP reset handling during vGPU suspend/resume (Colin)
- Apply flush workaround on APL now for possible guest hang (Colin)
- Fix vGPU context pin/unpin also for host suspend regression with
  vGPU created (Colin)
- more BXT/APL mmio cmd access fixes (Colin)

----------------------------------------------------------------
Colin Xu (4):
      drm/i915/gvt: Allow zero out HWSP addr on hws_pga_write
      drm/i915/gvt: Set SNOOP for PAT3 on BXT/APL to workaround GPU BB hang
      drm/i915/gvt: Only pin/unpin intel_context along with workload
      drm/i915/gvt: Fix mmio handler break on BXT/APL.

Zhenyu Wang (1):
      Merge tag 'drm-intel-fixes-2020-10-29' into gvt-fixes

 drivers/gpu/drm/i915/gvt/handlers.c  | 47 ++++++++++++++++++++++++++++++++=
+---
 drivers/gpu/drm/i915/gvt/scheduler.c | 15 ++++++------
 2 files changed, 52 insertions(+), 10 deletions(-)


--=20

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--nbmc0BhO2pdgImje
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCX5uizQAKCRCxBBozTXgY
J3HHAJ4mn0HZ5TeGoh0OFlhH1t5+zafDDgCffV00K1t+JfgL/uTzZcIsQ6aPdRw=
=ntu9
-----END PGP SIGNATURE-----

--nbmc0BhO2pdgImje--

--===============1187520750==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============1187520750==--
