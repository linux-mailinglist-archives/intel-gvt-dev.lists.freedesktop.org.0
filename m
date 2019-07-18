Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A426C8DB
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 18 Jul 2019 07:44:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 015526E30B;
	Thu, 18 Jul 2019 05:44:46 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFFDD6E30B
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 18 Jul 2019 05:44:44 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jul 2019 22:44:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,276,1559545200"; 
 d="asc'?scan'208";a="169755439"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by fmsmga007.fm.intel.com with ESMTP; 17 Jul 2019 22:44:42 -0700
Date: Thu, 18 Jul 2019 13:41:32 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: fred gao <fred.gao@intel.com>
Subject: Re: [PATCH v1 1/3] drm/i915/gvt: Utility for valid command length
 check
Message-ID: <20190718054132.GH16681@zhen-hp.sh.intel.com>
References: <20190714220704.13812-1-fred.gao@intel.com>
MIME-Version: 1.0
In-Reply-To: <20190714220704.13812-1-fred.gao@intel.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: intel-gvt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0437955633=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0437955633==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tauoZ0QFNrdllat7"
Content-Disposition: inline


--tauoZ0QFNrdllat7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.07.15 06:07:04 +0800, fred gao wrote:
> From: "Gao, Fred" <fred.gao@intel.com>
>=20
> Add utility for valid command length check.
>=20
> v2: Add F_VAL_CONST flag to identify the value is const
>     although LEN maybe variable. (Zhenyu)
> v3: unused code removal, flag rename/conflict. (Zhenyu)
> v4: redefine F_IP_ADVANCE_CUSTOM and move the check function to
>     next patch. (Zhenyu)
>=20
> Signed-off-by: Gao, Fred <fred.gao@intel.com>
> ---

I just try to test this series as I haven't checked all definition correctn=
ess
for these cmds. On latest gvt-staging for host/guest, I got below error that
failed linux guest.

[  578.692201] vfio_mdev 59f41f94-a91e-11e9-bca5-77e06e0f5813: Adding to io=
mmu group 0
[  578.692204] vfio_mdev 59f41f94-a91e-11e9-bca5-77e06e0f5813: MDEV: group_=
id =3D 0
[  602.103214] [drm:drm_mode_addfb2] [FB:104]
[  603.301618] gvt: len is not valid:  len=3D19  valid_len=3D3
[  603.301621] gvt: vgpu 1: cmd parser error
[  603.301622] 0x0=20
[  603.301622] 0x22=20

[  603.301624] gvt: vgpu 1: scan workload error
[  603.301625] GVT Internal error  for the guest
[  603.301626] Now vgpu 1 will enter failsafe mode.
[  603.301627] gvt: vgpu 1: failed to submit desc 0
[  603.301628] gvt: vgpu 1: fail submit workload on ring 0
[  603.301629] gvt: vgpu 1: fail to emulate MMIO write 00002230 len 4

Pls verify this series against latest gvt-staging.

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--tauoZ0QFNrdllat7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXTAGjAAKCRCxBBozTXgY
J7H0AJ425FxFh9jxrpfw0i7YBnaFTJRohQCfT0Dil5IAI9stYeviZU9o6m2hhi0=
=2Q4h
-----END PGP SIGNATURE-----

--tauoZ0QFNrdllat7--

--===============0437955633==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============0437955633==--
