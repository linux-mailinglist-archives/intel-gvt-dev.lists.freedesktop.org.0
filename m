Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA602923A8
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 19 Oct 2020 10:33:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12FF96E8EF;
	Mon, 19 Oct 2020 08:33:41 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65A856E8EF
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 19 Oct 2020 08:33:40 +0000 (UTC)
IronPort-SDR: m6VD488Jy1NcBiQufdUI/y4n7DwGvxmTOOSfJotVj6gN6OZcwyvPTi4sIoqaFCiDGfMM+4+mlr
 rtvZaZwad13w==
X-IronPort-AV: E=McAfee;i="6000,8403,9778"; a="167065642"
X-IronPort-AV: E=Sophos;i="5.77,394,1596524400"; 
 d="asc'?scan'208";a="167065642"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2020 01:33:38 -0700
IronPort-SDR: zzl+vrHhrL103tXLrdRb11Cc6uXGiFIF2MOBbsKAhNLlKAsUUhqcno8Idu+CZgnEl+gQcsi+WA
 SAYG7v8LBNrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,394,1596524400"; 
 d="asc'?scan'208";a="347358907"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by fmsmga004.fm.intel.com with ESMTP; 19 Oct 2020 01:33:37 -0700
Date: Mon, 19 Oct 2020 16:12:52 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Colin Xu <colin.xu@intel.com>
Subject: Re: [PATCH v2] drm/i915/gvt: Only pin/unpin intel_context along with
 workload
Message-ID: <20201019081252.GP27141@zhen-hp.sh.intel.com>
References: <20201016054059.238371-1-colin.xu@intel.com>
MIME-Version: 1.0
In-Reply-To: <20201016054059.238371-1-colin.xu@intel.com>
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
Content-Type: multipart/mixed; boundary="===============1221033874=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1221033874==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Y5wfsVCgeKAcINk2"
Content-Disposition: inline


--Y5wfsVCgeKAcINk2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.10.16 13:40:59 +0800, Colin Xu wrote:
> One issue exposed after below commit with which the system will freeze
> at suspend after vGPU is created (no need to activate the vGPU).
> commit e6ba76480299 ("drm/i915: Remove i915->kernel_context")
>=20
> Old implementation pin the intel_context at setup_submission and
> unpin it at clean_submission. So after some vGPU is created, the
> intel_context is always pinned there although no workload using it.
> It will then block i915 enter suspend state.
>=20
> There is no need to pin it all the time. Pin/unpin it around workload
> lifecycle is more reasonable. After GVT enabled suspend/resume, the
> pinned intel_context will also get unpined when userspace put VM process
> into suspend state since all workloads are retired, then it's safe to
> unpin all intel_context for workloads created. So move the pin/unpin to
> create_workload and destroy_workload, while still keep the
> create/destroy in old place.
>=20
> V2:
> Rebase.
>=20
> Fixes: e6ba76480299 (drm/i915: Remove i915->kernel_context)
> Signed-off-by: Colin Xu <colin.xu@intel.com>
> ---

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

>  drivers/gpu/drm/i915/gvt/scheduler.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c b/drivers/gpu/drm/i915/=
gvt/scheduler.c
> index 1570eb8aa978..aed2ef6466a2 100644
> --- a/drivers/gpu/drm/i915/gvt/scheduler.c
> +++ b/drivers/gpu/drm/i915/gvt/scheduler.c
> @@ -1277,7 +1277,7 @@ void intel_vgpu_clean_submission(struct intel_vgpu =
*vgpu)
> =20
>  	i915_context_ppgtt_root_restore(s, i915_vm_to_ppgtt(s->shadow[0]->vm));
>  	for_each_engine(engine, vgpu->gvt->gt, id)
> -		intel_context_unpin(s->shadow[id]);
> +		intel_context_put(s->shadow[id]);
> =20
>  	kmem_cache_destroy(s->workloads);
>  }
> @@ -1369,11 +1369,6 @@ int intel_vgpu_setup_submission(struct intel_vgpu =
*vgpu)
>  			ce->ring =3D __intel_context_ring_size(ring_size);
>  		}
> =20
> -		ret =3D intel_context_pin(ce);
> -		intel_context_put(ce);
> -		if (ret)
> -			goto out_shadow_ctx;
> -
>  		s->shadow[i] =3D ce;
>  	}
> =20
> @@ -1405,7 +1400,6 @@ int intel_vgpu_setup_submission(struct intel_vgpu *=
vgpu)
>  		if (IS_ERR(s->shadow[i]))
>  			break;
> =20
> -		intel_context_unpin(s->shadow[i]);
>  		intel_context_put(s->shadow[i]);
>  	}
>  	i915_vm_put(&ppgtt->vm);
> @@ -1479,6 +1473,7 @@ void intel_vgpu_destroy_workload(struct intel_vgpu_=
workload *workload)
>  {
>  	struct intel_vgpu_submission *s =3D &workload->vgpu->submission;
> =20
> +	intel_context_unpin(s->shadow[workload->engine->id]);
>  	release_shadow_batch_buffer(workload);
>  	release_shadow_wa_ctx(&workload->wa_ctx);
> =20
> @@ -1724,6 +1719,12 @@ intel_vgpu_create_workload(struct intel_vgpu *vgpu,
>  		return ERR_PTR(ret);
>  	}
> =20
> +	ret =3D intel_context_pin(s->shadow[engine->id]);
> +	if (ret) {
> +		intel_vgpu_destroy_workload(workload);
> +		return ERR_PTR(ret);
> +	}
> +
>  	return workload;
>  }
> =20
> --=20
> 2.28.0
>=20
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--=20

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--Y5wfsVCgeKAcINk2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCX41KgwAKCRCxBBozTXgY
J1fPAJ4qn/1gdK/4jvZdT0sLpdMZIOwl+QCgh22iJ5y8UA8OR48K+62g/Fckgb0=
=FvDJ
-----END PGP SIGNATURE-----

--Y5wfsVCgeKAcINk2--

--===============1221033874==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============1221033874==--
