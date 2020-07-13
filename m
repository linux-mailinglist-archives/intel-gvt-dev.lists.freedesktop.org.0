Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 344EA21D15B
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 13 Jul 2020 10:08:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA329891A0;
	Mon, 13 Jul 2020 08:08:04 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79C55890C5
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 13 Jul 2020 08:08:03 +0000 (UTC)
IronPort-SDR: rvl6clhU4hE7Z0ph61mVreaUq0u3rmvV3lN5GOIfWvgYtFIJtQHjE8OpkgmR+NYpb+2TJyvnCd
 GuBNGXauqmNA==
X-IronPort-AV: E=McAfee;i="6000,8403,9680"; a="166684869"
X-IronPort-AV: E=Sophos;i="5.75,346,1589266800"; 
 d="asc'?scan'208";a="166684869"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2020 01:08:03 -0700
IronPort-SDR: QEDMEncZWZP7NSz0Bi/KlDUMuMFBFBwYjPTeGmKWzzcaRwIY8x46IMc9kHFa7QtTd3kbeDFQ25
 LrhGZTg450Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,346,1589266800"; 
 d="asc'?scan'208";a="317301587"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by fmsmga002.fm.intel.com with ESMTP; 13 Jul 2020 01:08:01 -0700
Date: Mon, 13 Jul 2020 15:50:59 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Stefan Hertrampf <stefan.hertrampf@cyberus-technology.de>
Subject: Re: Set custom EDID
Message-ID: <20200713075059.GI27035@zhen-hp.sh.intel.com>
References: <83a23f57-ee8b-6b39-3d99-ecb5ae36df8a@cyberus-technology.de>
MIME-Version: 1.0
In-Reply-To: <83a23f57-ee8b-6b39-3d99-ecb5ae36df8a@cyberus-technology.de>
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
Cc: Julian Stecklina <julian.stecklina@cyberus-technology.de>,
 Thomas Prescher <thomas.prescher@cyberus-technology.de>,
 intel-gvt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1969273851=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1969273851==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="x38akuY2VS0PywU3"
Content-Disposition: inline


--x38akuY2VS0PywU3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.07.10 10:10:36 +0200, Stefan Hertrampf wrote:
> Hello,
>=20
> we are developing a custom hypervisor backend for GVT which (from the med=
iators
> perspective) behaves like XEN.
>=20
> Currently, we are working with the Linux Kernel v5.4.41 and we are trying=
 to
> pass a custom EDID to a given vGPU.
>=20
> The code flow roughly looks like this:
>=20
> vgpu =3D intel_gvt_ops->vgpu_create();
>=20
> port =3D intel_vgpu_port(vgpu, port);
>=20
> edid_data =3D intel_vgpu_edid_block(port);
>=20
> memcpy(edid_data, custom_edid, EDID_SIZE);
>=20
> We are wondering how the set_edid callback of the intel_gvt_mpt is meant =
to be
> used to receive the correct port where the virtual display is attached. In
> v5.4.41 it seems, the default port is PORT_B and the mediator only calls
> set_edid on certain platforms where it is a different port. Is this corre=
ct?
>=20
> Is there any other method to receive the correct port?
>=20
> It seems that in v5.4.41 the mediator misses to call set_edid if the plat=
form=20
> IS_COFFEELAKE, which leads to a crash because we then assume the default =
PORT_B
> where no memory is allocated for the EDID data.
>

oh, I wasn't awared that actually caused crash but just thought it's a feat=
ure
enabling patch. If you like to backport, I'm fine with it.

> Also in some later commits [1] the behavior is changed and the set_edid
> callback is always called passing PORT_D. Does that mean that the virtual
> display is always attached at PORT_D on newer versions of GVT?
>=20

Yes.

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--x38akuY2VS0PywU3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXwwSYwAKCRCxBBozTXgY
JwUgAJwKW5x8Pv4RfKZ79Xbm0WCfLeqs2ACggjDcgHK6gTGyVJtWl8xY57k4iuk=
=q8CW
-----END PGP SIGNATURE-----

--x38akuY2VS0PywU3--

--===============1969273851==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============1969273851==--
