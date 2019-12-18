Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C1C123DD8
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 18 Dec 2019 04:24:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C24A6E152;
	Wed, 18 Dec 2019 03:24:26 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B00E46E10C;
 Wed, 18 Dec 2019 03:24:24 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Dec 2019 19:24:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,328,1571727600"; 
 d="asc'?scan'208";a="218010520"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by orsmga003.jf.intel.com with ESMTP; 17 Dec 2019 19:24:23 -0800
Date: Wed, 18 Dec 2019 11:22:33 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH] drm/i915: Fix vGPU kernel context kmemleak
Message-ID: <20191218032233.GZ21662@zhen-hp.sh.intel.com>
References: <20191217071354.20006-1-zhenyuw@linux.intel.com>
 <157657117607.12377.8590488414017933825@skylake-alporthouse-com>
MIME-Version: 1.0
In-Reply-To: <157657117607.12377.8590488414017933825@skylake-alporthouse-com>
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
Cc: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1695418940=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1695418940==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="niUlcCfh/sMBwTxc"
Content-Disposition: inline


--niUlcCfh/sMBwTxc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.12.17 08:26:16 +0000, Chris Wilson wrote:
> Quoting Zhenyu Wang (2019-12-17 07:13:54)
> > Current GVT allocates kernel context as vGPU submission context.
> > For vGPU destroy, the kernel context needs to be close then released,
> > otherwise context's vm ppgtt resource would cause memleak issue like
> > below. This trys to add new helper to destroy kernel context for that.
>=20
> There's only been patches to remove the last of the kernel context for
> that last year, after which this is moot.

Could you point me to the patch?

thanks

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--niUlcCfh/sMBwTxc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXfmbeQAKCRCxBBozTXgY
J5uZAJ4meEFahAAdjCc8rTus0wZhtAC0SACeLcVR638+QeoqQdE4J2ZyT3Drmu8=
=7PFt
-----END PGP SIGNATURE-----

--niUlcCfh/sMBwTxc--

--===============1695418940==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============1695418940==--
