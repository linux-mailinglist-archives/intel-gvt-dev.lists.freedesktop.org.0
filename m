Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C651D75A7
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 18 May 2020 12:55:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA07E899E7;
	Mon, 18 May 2020 10:55:36 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ED56899E7
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 18 May 2020 10:55:35 +0000 (UTC)
IronPort-SDR: ciOd65r+cwry+oC9Iouf1STrt1nhp0OdMIB+98FSpVzgsLjCEwMQU6+GYy6sB2Wzgs93ayDzKr
 bVm+L717bSsQ==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2020 03:55:34 -0700
IronPort-SDR: eimr7L826vHiGsz0xW3uY8DvKYK0f0X7P3ryG+mZET+RrBqaLG9mPCOskR8gCL3F3Dl23apzea
 3mDfMQeAQHHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,407,1583222400"; 
 d="asc'?scan'208";a="465534762"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by fmsmga005.fm.intel.com with ESMTP; 18 May 2020 03:55:33 -0700
Date: Mon, 18 May 2020 18:40:36 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Colin Xu <colin.xu@intel.com>
Subject: Re: [PATCH 0/2] Enable GVT enabled host S3/Resume.
Message-ID: <20200518104036.GX18545@zhen-hp.sh.intel.com>
References: <20200518062852.158709-1-colin.xu@intel.com>
MIME-Version: 1.0
In-Reply-To: <20200518062852.158709-1-colin.xu@intel.com>
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
Cc: intel-gvt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0706289120=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0706289120==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="O/bkIMqRIB4oFlYr"
Content-Disposition: inline


--O/bkIMqRIB4oFlYr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.05.18 14:28:50 +0800, Colin Xu wrote:
> Patch 1/2: Add necessary routine in gvt.
> Patch 2/2: Add suspend/resume routine to i915.
>=20
> Colin Xu (2):
>   drm/i915/gvt: Enable GVT enabled host S3/Resume
>   drm/i915/gvt: Add GVT suspend/resume routine to i915.
>=20
>  drivers/gpu/drm/i915/gvt/gtt.c      | 74 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/i915/gvt/gtt.h      |  2 +
>  drivers/gpu/drm/i915/gvt/gvt.c      | 14 ++++++
>  drivers/gpu/drm/i915/gvt/gvt.h      |  6 +++
>  drivers/gpu/drm/i915/gvt/handlers.c | 20 ++++++++
>  drivers/gpu/drm/i915/gvt/mmio.h     |  3 ++
>  drivers/gpu/drm/i915/gvt/vgpu.c     |  1 +
>  drivers/gpu/drm/i915/i915_drv.c     | 15 ++++++
>  8 files changed, 135 insertions(+)
>=20

For series touching other i915 or sub-directories part, need to
include intel-gfx list as well. Please re-send.

thanks

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--O/bkIMqRIB4oFlYr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXsJmJAAKCRCxBBozTXgY
J43NAJ4wZBlWk+JsQE2ElqUX6WnblSmoEACfcFuEU3ujFJvNMnkGsgvGVRzHxHc=
=NQPE
-----END PGP SIGNATURE-----

--O/bkIMqRIB4oFlYr--

--===============0706289120==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0706289120==--
