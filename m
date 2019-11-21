Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 542731049EC
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 21 Nov 2019 06:14:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05B656E0B6;
	Thu, 21 Nov 2019 05:14:16 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ED4E6E0B6
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 21 Nov 2019 05:14:14 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Nov 2019 21:14:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,224,1571727600"; 
 d="asc'?scan'208";a="209978705"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by orsmga006.jf.intel.com with ESMTP; 20 Nov 2019 21:14:12 -0800
Date: Thu, 21 Nov 2019 13:13:22 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: KVM/VFIO GVT-g broken on 5.4.0-rc8?
Message-ID: <20191121051322.GL4196@zhen-hp.sh.intel.com>
References: <20191120213544.307fc1c4@x1.home>
MIME-Version: 1.0
In-Reply-To: <20191120213544.307fc1c4@x1.home>
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
Content-Type: multipart/mixed; boundary="===============1652077981=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1652077981==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PMnBCHLB6K0Tl81y"
Content-Disposition: inline


--PMnBCHLB6K0Tl81y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.11.20 21:35:44 -0700, Alex Williamson wrote:
> I was trying to test John Hubbard's latest gup series[1] with GVT-g,
> but I'm unable to run a Windows 10 VM with a i915-GVTg_V4_2 on
> af42d3466bdc ("Linux 5.4-rc8").  The host kernel prints:
>=20
> [   64.402671] gvt: len is not valid:  len=3D11  valid_len=3D3
> [   64.407932] gvt: vgpu 2: MI_OP_2F handler error
> [   64.412502] gvt: vgpu 2: cmd parser error
> [   64.416591] 0x0=20
> [   64.416592] 0x2f=20
>=20
> [   64.421930] gvt: vgpu 2: scan wa ctx error
> [   64.426088] GVT Internal error  for the guest
> [   64.430486] Now vgpu 2 will enter failsafe mode.
> [   64.435179] gvt: vgpu 2: failed to submit desc 0
> [   64.439853] gvt: vgpu 2: fail submit workload on ring 0
> [   64.445125] gvt: vgpu 2: fail to emulate MMIO write 00002230 len 4
> [  103.522117] gvt: len is not valid:  len=3D11  valid_len=3D3
> [  103.527419] gvt: vgpu 2: MI_OP_2F handler error
> [  103.532004] gvt: vgpu 2: cmd parser error
> [  103.536062] 0x0=20
> [  103.536063] 0x2f=20
>=20
> [  103.541342] gvt: vgpu 2: scan wa ctx error
> [  103.545466] GVT Internal error  for the guest
> [  103.549863] Now vgpu 2 will enter failsafe mode.
> [  103.554502] gvt: vgpu 2: failed to submit desc 0
> [  103.559156] gvt: vgpu 2: fail submit workload on ring 0
> [  103.564388] gvt: vgpu 2: fail to emulate MMIO write 00002230 len 4
>=20
> And the VM reboots before reaching the desktop, possibly with a BSOD.
> The same VM configuration works on host kernel 5.3.11-200.fc30.x86_64.
> Device manager reports HD Graphics 5500 driver version 20.19.15.4624,
> which was installed by Windows update.  Thanks,

Need to double check with our validation team for this windows driver versi=
on,
we didn't meet this for 5.4 testing cycle..

>=20
> Alex
>=20
> [1]https://lore.kernel.org/linux-rdma/20191119081643.1866232-1-jhubbard@n=
vidia.com/T/#t
>=20
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--PMnBCHLB6K0Tl81y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXdYc8gAKCRCxBBozTXgY
J2zUAKCfjcB09cxyxxGeeE/Z3yqvz1yTVACfYML2jD8JwmuAWUWUN7zeEwh2oKo=
=0Td+
-----END PGP SIGNATURE-----

--PMnBCHLB6K0Tl81y--

--===============1652077981==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============1652077981==--
