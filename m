Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D05894B299
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 19 Jun 2019 09:06:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98C626E29E;
	Wed, 19 Jun 2019 07:06:06 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FF286E29E
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 19 Jun 2019 07:06:05 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Jun 2019 00:06:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,392,1557212400"; 
 d="asc'?scan'208";a="335107675"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by orsmga005.jf.intel.com with ESMTP; 19 Jun 2019 00:06:03 -0700
Date: Wed, 19 Jun 2019 15:03:58 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Xiaolin Zhang <xiaolin.zhang@intel.com>
Subject: Re: [PATCH] drm/i915/gvt: grab runtime pm first for forcewake use
Message-ID: <20190619070358.GN9684@zhen-hp.sh.intel.com>
References: <1560855098-70079-1-git-send-email-xiaolin.zhang@intel.com>
MIME-Version: 1.0
In-Reply-To: <1560855098-70079-1-git-send-email-xiaolin.zhang@intel.com>
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
Content-Type: multipart/mixed; boundary="===============0289701007=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0289701007==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LdJ1tWgGI9xhaWs5"
Content-Disposition: inline


--LdJ1tWgGI9xhaWs5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.06.18 06:51:38 -0400, Xiaolin Zhang wrote:
> in workload_thread, it should grab runtime pm wakelock and later
> uncore forcewake get will check rpm wakelock held successfully.
> otherwise, sometimes, rpm wakelock not hold and print call trace below:
>=20
>  Call Trace:
>   intel_uncore_forcewake_get+0x15/0x20 [i915]
>   workload_thread+0x5f9/0x16f0 [i915]
>   ? __switch_to_asm+0x34/0x70
>   ? __switch_to_asm+0x40/0x70
>   ? __switch_to_asm+0x34/0x70
>   ? __switch_to_asm+0x40/0x70
>   ? __switch_to_asm+0x34/0x70
>   ? __switch_to+0x85/0x3f0
>   ? __switch_to_asm+0x40/0x70
>   ? do_wait_intr_irq+0x90/0x90
>   kthread+0x121/0x140
>   ? intel_vgpu_clean_workloads+0x100/0x100 [i915]
>   ? kthread_park+0x90/0x90
>   ret_from_fork+0x35/0x40
>  --[ end trace 86525f742a02e12c ]--
>=20
> Signed-off-by: Xiaolin Zhang <xiaolin.zhang@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/scheduler.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c b/drivers/gpu/drm/i915/=
gvt/scheduler.c
> index a1580df..7cfcaf5 100644
> --- a/drivers/gpu/drm/i915/gvt/scheduler.c
> +++ b/drivers/gpu/drm/i915/gvt/scheduler.c
> @@ -1012,6 +1012,8 @@ static int workload_thread(void *priv)
>  				workload->ring_id, workload,
>  				workload->vgpu->id);
> =20
> +		intel_runtime_pm_get(gvt->dev_priv);
> +
>  		gvt_dbg_sched("ring id %d will dispatch workload %p\n",
>  				workload->ring_id, workload);
> =20
> @@ -1041,6 +1043,7 @@ static int workload_thread(void *priv)
>  			intel_uncore_forcewake_put(&gvt->dev_priv->uncore,
>  					FORCEWAKE_ALL);
> =20
> +		intel_runtime_pm_put_unchecked(gvt->dev_priv);
>  		if (ret && (vgpu_is_vm_unhealthy(ret)))
>  			enter_failsafe_mode(vgpu, GVT_FAILSAFE_GUEST_ERR);
>  	}

Looks correct to me.

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--LdJ1tWgGI9xhaWs5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXQneXgAKCRCxBBozTXgY
J/bSAJ9SnXpo80lJsalIMpz/BnwDwNPdZwCfdTBD3oj9eswSaI/QzWsOYR1pKLM=
=EO9Q
-----END PGP SIGNATURE-----

--LdJ1tWgGI9xhaWs5--

--===============0289701007==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============0289701007==--
