Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E0C18E729
	for <lists+intel-gvt-dev@lfdr.de>; Sun, 22 Mar 2020 07:52:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0A9C6E04A;
	Sun, 22 Mar 2020 06:52:34 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FB096E04A
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sun, 22 Mar 2020 06:52:33 +0000 (UTC)
IronPort-SDR: AIzuP6oVqXHUrXdhfkY//Pnr5p9XilTNYy5yE4ZuXp3UVRsivCsM/twJH+xu88ze9WxYEuHL+S
 Ov2KzfGDurjg==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2020 23:52:32 -0700
IronPort-SDR: j7sBxFkckpQdN3zLjLC4xiX3kMVycTS8VbRffSQ2Uyrx2dUGgo+etUVmmx+Q2MqkEUCPR8ZRXr
 pdJaNUAsO0Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,291,1580803200"; 
 d="asc'?scan'208";a="392573553"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by orsmga004.jf.intel.com with ESMTP; 21 Mar 2020 23:52:31 -0700
Date: Sun, 22 Mar 2020 14:39:40 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Julian Stecklina <julian.stecklina@cyberus-technology.de>
Subject: Re: Multi-monitor support
Message-ID: <20200322063940.GL8880@zhen-hp.sh.intel.com>
References: <d1dfb5c753abf0aa9eb2b9a1b2c7ae01e967373e.camel@cyberus-technology.de>
MIME-Version: 1.0
In-Reply-To: <d1dfb5c753abf0aa9eb2b9a1b2c7ae01e967373e.camel@cyberus-technology.de>
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
Cc: Thomas Prescher <thomas.prescher@cyberus-technology.de>,
 Intel GVT Dev <intel-gvt-dev@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0193271447=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0193271447==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="G/vVCphCGw+yuveY"
Content-Disposition: inline


--G/vVCphCGw+yuveY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.03.20 10:49:29 +0100, Julian Stecklina wrote:
> Hi everyone,
>=20
> We were wondering what would be required to enable monitor support with G=
VT.
> Does this only require plumbing for the guest to realize that there are m=
ultiple
> outputs or is there something more fundamental missing in the mediator?
>=20

For current virtual display in gvt upstream, you can multiplex virtual
DP output on another transcoder or pipe, that would make guest see
multiple active outputs. But current expose of guest display buffer
in VFIO gfx dmabuf interface has limit in multiple output info, which
need extra definition and user UI model support..

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--G/vVCphCGw+yuveY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXncILAAKCRCxBBozTXgY
J8KVAKCImtVD720xsyQBrQmVB15MPL6DgQCgmH1+NVWYw8D0Zg51dB9YDwedCrU=
=Z69F
-----END PGP SIGNATURE-----

--G/vVCphCGw+yuveY--

--===============0193271447==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0193271447==--
