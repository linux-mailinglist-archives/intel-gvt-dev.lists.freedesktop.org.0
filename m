Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD848B491
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 13 Aug 2019 11:49:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A9C4891C0;
	Tue, 13 Aug 2019 09:49:30 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0827B88E45
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 13 Aug 2019 09:49:29 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Aug 2019 02:49:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,381,1559545200"; 
 d="asc'?scan'208";a="183826081"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by FMSMGA003.fm.intel.com with ESMTP; 13 Aug 2019 02:49:27 -0700
Date: Tue, 13 Aug 2019 17:45:18 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>
Subject: Re: [PATCH] drm/i915/gvt: Fix typo of VBLANK_TIMER_PERIOD
Message-ID: <20190813094518.GD19140@zhen-hp.sh.intel.com>
References: <20190610092750.11307-1-zhenyuw@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20190610092750.11307-1-zhenyuw@linux.intel.com>
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
Content-Type: multipart/mixed; boundary="===============1536532067=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1536532067==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JP+T4n/bALQSJXh8"
Content-Disposition: inline


--JP+T4n/bALQSJXh8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Anyone help for review?

On 2019.06.10 17:27:50 +0800, Zhenyu Wang wrote:
> This fixes typo for VBLANK_TIMER_PERIOD.
>=20
> Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/interrupt.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/interrupt.c b/drivers/gpu/drm/i915/=
gvt/interrupt.c
> index 951681813230..11accd3e1023 100644
> --- a/drivers/gpu/drm/i915/gvt/interrupt.c
> +++ b/drivers/gpu/drm/i915/gvt/interrupt.c
> @@ -672,7 +672,7 @@ void intel_gvt_clean_irq(struct intel_gvt *gvt)
>  	hrtimer_cancel(&irq->vblank_timer.timer);
>  }
> =20
> -#define VBLNAK_TIMER_PERIOD 16000000
> +#define VBLANK_TIMER_PERIOD 16000000
> =20
>  /**
>   * intel_gvt_init_irq - initialize GVT-g IRQ emulation subsystem
> @@ -704,7 +704,7 @@ int intel_gvt_init_irq(struct intel_gvt *gvt)
> =20
>  	hrtimer_init(&vblank_timer->timer, CLOCK_MONOTONIC, HRTIMER_MODE_ABS);
>  	vblank_timer->timer.function =3D vblank_timer_fn;
> -	vblank_timer->period =3D VBLNAK_TIMER_PERIOD;
> +	vblank_timer->period =3D VBLANK_TIMER_PERIOD;
> =20
>  	return 0;
>  }
> --=20
> 2.20.1
>=20
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--JP+T4n/bALQSJXh8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXVKGrgAKCRCxBBozTXgY
J+ffAJ92xg8i8XzXXh//OzyJ3tAVU0a38QCfe2o1/UNX39N9BQGyrMCXGRDnkks=
=PagP
-----END PGP SIGNATURE-----

--JP+T4n/bALQSJXh8--

--===============1536532067==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============1536532067==--
