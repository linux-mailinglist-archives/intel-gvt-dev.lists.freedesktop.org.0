Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE81B10A9D2
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 27 Nov 2019 06:07:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FCF5896EB;
	Wed, 27 Nov 2019 05:07:34 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4965D8915F
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 27 Nov 2019 05:07:33 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Nov 2019 21:07:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,248,1571727600"; 
 d="asc'?scan'208";a="291952710"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by orsmga001.jf.intel.com with ESMTP; 26 Nov 2019 21:07:31 -0800
Date: Wed, 27 Nov 2019 13:06:27 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: "Gao, Fred" <fred.gao@intel.com>
Subject: Re: [PATCH v2 1/2] drm/i915/gvt: Refine non privilege register
 address calucation
Message-ID: <20191127050627.GO4196@zhen-hp.sh.intel.com>
References: <20191126160735.1026-1-fred.gao@intel.com>
 <20191127050248.GN4196@zhen-hp.sh.intel.com>
MIME-Version: 1.0
In-Reply-To: <20191127050248.GN4196@zhen-hp.sh.intel.com>
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
Content-Type: multipart/mixed; boundary="===============1254564146=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1254564146==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8djcGuIVq2u9Llbi"
Content-Disposition: inline


--8djcGuIVq2u9Llbi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.11.27 13:02:48 +0800, Zhenyu Wang wrote:
>=20
> On 2019.11.27 00:07:35 +0800, Gao, Fred wrote:
> > The BitField of non privilege register address is only from bit 2 to 25.
> >=20
> > v2: use REG_GENMASK instead. (Zhenyu)
> >=20
> > Signed-off-by: Gao Fred <fred.gao@intel.com>
>=20
> For two in this series.
>=20
> Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>
>=20
> Thanks!
>

btw, git apply warns about
WARNING: Missing Signed-off-by: line by nominal patch author 'Gao, Fred <fr=
ed.gao@intel.com>'

Pls setup your git user properly and use normal git send email practice.

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--8djcGuIVq2u9Llbi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXd4EUwAKCRCxBBozTXgY
J+HgAJ9IgZalIVkhb3g6nEfPw4MrIMdQDACghGuP1dlItSPeGPM4OVzLGw1YVuk=
=mf4K
-----END PGP SIGNATURE-----

--8djcGuIVq2u9Llbi--

--===============1254564146==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============1254564146==--
