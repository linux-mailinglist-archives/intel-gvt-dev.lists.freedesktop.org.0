Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E2C38DFE2
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 24 May 2021 05:28:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6E0289CAC;
	Mon, 24 May 2021 03:28:26 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69CF289C9C;
 Mon, 24 May 2021 03:28:25 +0000 (UTC)
IronPort-SDR: vBqYjoAdiAMMtBjgQHj4RLkn3zdg824kPxShEFS97fRwdksL/HfN1U5FAqI4uCRidE7aF0GTcG
 sJZD44bBPUEA==
X-IronPort-AV: E=McAfee;i="6200,9189,9993"; a="198786645"
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; 
 d="asc'?scan'208";a="198786645"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2021 20:28:24 -0700
IronPort-SDR: pQ0JIwmvZdCKQJzIhfRLE5iaXr3s35y98j5sion6eUkAsbxJHHjT4KTLtH4U/9zEkZoFC1Dwkf
 ix3rkkRzC3xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; 
 d="asc'?scan'208";a="463486853"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.143])
 by fmsmga004.fm.intel.com with ESMTP; 23 May 2021 20:28:22 -0700
Date: Mon, 24 May 2021 11:09:01 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: i915 gvt broke drm-tip; Fix ASAP
Message-ID: <20210524030901.GC27293@zhen-hp.sh.intel.com>
References: <58f039e1-225f-4542-8355-1ae91a225206@suse.de>
MIME-Version: 1.0
In-Reply-To: <58f039e1-225f-4542-8355-1ae91a225206@suse.de>
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
Cc: intel-gfx@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, jani.nikula@linux.intel.com,
 dri-devel <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 zhi.a.wang@intel.com
Content-Type: multipart/mixed; boundary="===============1676098099=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1676098099==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ikeVEW9yuYc//A+q"
Content-Disposition: inline


--ikeVEW9yuYc//A+q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2021.05.22 21:19:38 +0200, Thomas Zimmermann wrote:
> Hi,
>=20
> after creating drm-tip today as part of [1], building drm-tip is now brok=
en
> with the error message shown below.
>=20
> Some register constants appear to be missing from the GVT code. Please fix
> ASAP.
>

Thanks, Thomas. Looks DMC rename missed gvt part. We need to ask CI to have
at least build test with gvt.



--ikeVEW9yuYc//A+q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCYKsYuwAKCRCxBBozTXgY
J6NwAKCa2rjjnBGNrVRuRCdtKpJtR201tACfdi10uchM1GcmZ9HFs01z+eGhBSs=
=Kc4k
-----END PGP SIGNATURE-----

--ikeVEW9yuYc//A+q--

--===============1676098099==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============1676098099==--
