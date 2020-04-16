Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 538381AB719
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 16 Apr 2020 07:11:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE83A6E22D;
	Thu, 16 Apr 2020 05:11:01 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EB766E22D
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 16 Apr 2020 05:11:00 +0000 (UTC)
IronPort-SDR: fvLlE51GmF9mV7Hr8UHGnA87aLmeO4fFzbwNAbFFsSpzSaHy/hXvXGq4AAMFwgHTJUP/HS6R78
 K8bJVZ6adu2Q==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2020 22:10:59 -0700
IronPort-SDR: 73t+feJO3oI54XkvoWH76Lhc2+Lr2NIQrWJgdxzqlnk3KjV4dZa0q1j3CNA3/8LtSPSWk9z/nb
 m9loPKXGb+bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,388,1580803200"; 
 d="asc'?scan'208";a="455144064"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by fmsmga006.fm.intel.com with ESMTP; 15 Apr 2020 22:10:56 -0700
Date: Thu, 16 Apr 2020 12:57:11 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Subject: Re: [PATCH v4 0/3] drm/i915/gvt: optimizaton on shadow context
 population
Message-ID: <20200416045711.GT11247@zhen-hp.sh.intel.com>
References: <20200415075355.23308-1-yan.y.zhao@intel.com>
MIME-Version: 1.0
In-Reply-To: <20200415075355.23308-1-yan.y.zhao@intel.com>
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
Content-Type: multipart/mixed; boundary="===============1954345806=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1954345806==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BOhpupldhMlYbdva"
Content-Disposition: inline


--BOhpupldhMlYbdva
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.04.15 03:53:55 -0400, Yan Zhao wrote:
> This patchset skips population of shadow contexts if their corresponding
> guest contexts are known not changed.
>=20
> patch 1 implements the skipping logic, though intentionally disabled the
> skip.
> patch 2 checks ggtt entry to verify guest contexts are not changed.
> patch 3 turns on the skipping logic
>=20
> Yan Zhao (3):
>   drm/i915/gvt: skip populate shadow context if guest context not
>     changed
>   drm/i915/gvt: check ggtt entry modification status for guest ctxs
>   drm/i915/gvt: turn on shadow context skipping
>=20
>  drivers/gpu/drm/i915/gvt/gtt.c       | 17 ++++++++++++++
>  drivers/gpu/drm/i915/gvt/gvt.h       |  5 ++++
>  drivers/gpu/drm/i915/gvt/scheduler.c | 35 ++++++++++++++++++++++++----
>  3 files changed, 52 insertions(+), 5 deletions(-)
>=20

The patch order looks strange to me... either order it as 1) new track
struct; 2) ggtt update track; 3) actual optimization or just in one patch.

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--BOhpupldhMlYbdva
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXpflpgAKCRCxBBozTXgY
J/v+AKCBnGaRErZ9TQdD7W25N6xY6gWxXACgiTz0me2FBJ/3nX062NgIZodgcJM=
=cklJ
-----END PGP SIGNATURE-----

--BOhpupldhMlYbdva--

--===============1954345806==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============1954345806==--
