Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F05B262529
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  9 Sep 2020 04:26:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 527A96E90C;
	Wed,  9 Sep 2020 02:26:20 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4508D6E90B;
 Wed,  9 Sep 2020 02:26:18 +0000 (UTC)
IronPort-SDR: 06gUYsPB0mtWVR7G+U3VllcfbSFFkYupLU4DyTAkhSDK0sHO3yeV4ZoicUW8Vd18xHq9j/kcg5
 y32vIQPnvOVQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9738"; a="137774318"
X-IronPort-AV: E=Sophos;i="5.76,408,1592895600"; 
 d="asc'?scan'208";a="137774318"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2020 19:26:16 -0700
IronPort-SDR: fjXekW4zPAo0eK/gD6yeRGrt/z1wodFkOGiqmRR1t948MS97pO/NCLanqbRlG1syjTmgLbDgPw
 BX3YqHTMXntw==
X-IronPort-AV: E=Sophos;i="5.76,408,1592895600"; 
 d="asc'?scan'208";a="449028307"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2020 19:26:13 -0700
Date: Wed, 9 Sep 2020 10:06:58 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Colin Xu <Colin.Xu@intel.com>
Subject: Re: [PATCH] drm/i915/gvt: Introduce per object locking in GVT
 scheduler.
Message-ID: <20200909020658.GF28614@zhen-hp.sh.intel.com>
References: <20200907200203.535-1-zhi.a.wang@intel.com>
 <8e0f7bf0-ce43-7a29-6766-24836e60326f@intel.com>
MIME-Version: 1.0
In-Reply-To: <8e0f7bf0-ce43-7a29-6766-24836e60326f@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Zhi Wang <zhi.a.wang@intel.com>
Content-Type: multipart/mixed; boundary="===============1308529464=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1308529464==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yEPQxsgoJgBvi8ip"
Content-Disposition: inline


--yEPQxsgoJgBvi8ip
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.09.09 09:43:21 +0800, Colin Xu wrote:
> I tested this patch on the suspend/resume case with vGPU created (no need
> really activate), can still observer the system freeze issue as mentioned=
 in
> another patch I sent. So I suppose we still need decouple context pin/unp=
in
> with submission setup/clean, but move to workload create/destroy?
>

yeah, I observed that conflict too. How about merging Zhi's ww lock fix fir=
st
then next for left suspend/resume fixes? And better if you could pack all f=
ixes
in one series.

Thanks

> After made similar changes based on this one, plus the suspend/resume
> support patch, below tests can pass:
>=20
> - Create vGPU then suspend/resume.
>=20
> - Run VM w/ vGPU then suspend/resume.
>=20
> https://lists.freedesktop.org/archives/intel-gvt-dev/2020-September/00706=
1.html
>=20
> On 2020-09-08 04:02, Zhi Wang wrote:
> > To support ww locking and per-object implemented in i915, GVT scheduler=
 needs
> > to be refined. Most of the changes are located in shadow batch buffer, =
shadow
> > wa context in GVT-g, where use quite a lot of i915 gem object APIs.
> >=20
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
> > Signed-off-by: Zhi Wang <zhi.a.wang@intel.com>
> > ---
> >   drivers/gpu/drm/i915/gvt/scheduler.c | 68 +++++++++++++++++++++++++++=
+++------
> >   1 file changed, 57 insertions(+), 11 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c b/drivers/gpu/drm/i91=
5/gvt/scheduler.c
> > index 1570eb8..fe7ee10 100644
> > --- a/drivers/gpu/drm/i915/gvt/scheduler.c
> > +++ b/drivers/gpu/drm/i915/gvt/scheduler.c
> > @@ -396,7 +396,9 @@ static void release_shadow_wa_ctx(struct intel_shad=
ow_wa_ctx *wa_ctx)
> >   	if (!wa_ctx->indirect_ctx.obj)
> >   		return;
> > +	i915_gem_object_lock(wa_ctx->indirect_ctx.obj, NULL);
> >   	i915_gem_object_unpin_map(wa_ctx->indirect_ctx.obj);
> > +	i915_gem_object_unlock(wa_ctx->indirect_ctx.obj);
> >   	i915_gem_object_put(wa_ctx->indirect_ctx.obj);
> >   	wa_ctx->indirect_ctx.obj =3D NULL;
> > @@ -504,6 +506,7 @@ static int prepare_shadow_batch_buffer(struct intel=
_vgpu_workload *workload)
> >   	struct intel_gvt *gvt =3D workload->vgpu->gvt;
> >   	const int gmadr_bytes =3D gvt->device_info.gmadr_bytes_in_cmd;
> >   	struct intel_vgpu_shadow_bb *bb;
> > +	struct i915_gem_ww_ctx ww;
> >   	int ret;
> >   	list_for_each_entry(bb, &workload->shadow_bb, list) {
> > @@ -528,10 +531,19 @@ static int prepare_shadow_batch_buffer(struct int=
el_vgpu_workload *workload)
> >   		 * directly
> >   		 */
> >   		if (!bb->ppgtt) {
> > -			bb->vma =3D i915_gem_object_ggtt_pin(bb->obj,
> > -							   NULL, 0, 0, 0);
> > +			i915_gem_ww_ctx_init(&ww, false);
> > +retry:
> > +			i915_gem_object_lock(bb->obj, &ww);
> > +
> > +			bb->vma =3D i915_gem_object_ggtt_pin_ww(bb->obj, &ww,
> > +							      NULL, 0, 0, 0);
> >   			if (IS_ERR(bb->vma)) {
> >   				ret =3D PTR_ERR(bb->vma);
> > +				if (ret =3D=3D -EDEADLK) {
> > +					ret =3D i915_gem_ww_ctx_backoff(&ww);
> > +					if (!ret)
> > +						goto retry;
> > +				}
> >   				goto err;
> >   			}
> > @@ -545,13 +557,18 @@ static int prepare_shadow_batch_buffer(struct int=
el_vgpu_workload *workload)
> >   						      0);
> >   			if (ret)
> >   				goto err;
> > +
> > +			/* No one is going to touch shadow bb from now on. */
> > +			i915_gem_object_flush_map(bb->obj);
> > +
> > +			i915_gem_object_unlock(bb->obj);
> > +			i915_gem_ww_ctx_fini(&ww);
> >   		}
> > -		/* No one is going to touch shadow bb from now on. */
> > -		i915_gem_object_flush_map(bb->obj);
> >   	}
> >   	return 0;
> >   err:
> > +	i915_gem_ww_ctx_fini(&ww);
> >   	release_shadow_batch_buffer(workload);
> >   	return ret;
> >   }
> > @@ -578,14 +595,30 @@ static int prepare_shadow_wa_ctx(struct intel_sha=
dow_wa_ctx *wa_ctx)
> >   	unsigned char *per_ctx_va =3D
> >   		(unsigned char *)wa_ctx->indirect_ctx.shadow_va +
> >   		wa_ctx->indirect_ctx.size;
> > +	struct i915_gem_ww_ctx ww;
> > +	int ret;
> >   	if (wa_ctx->indirect_ctx.size =3D=3D 0)
> >   		return 0;
> > -	vma =3D i915_gem_object_ggtt_pin(wa_ctx->indirect_ctx.obj, NULL,
> > -				       0, CACHELINE_BYTES, 0);
> > -	if (IS_ERR(vma))
> > -		return PTR_ERR(vma);
> > +	i915_gem_ww_ctx_init(&ww, false);
> > +retry:
> > +	i915_gem_object_lock(wa_ctx->indirect_ctx.obj, &ww);
> > +
> > +	vma =3D i915_gem_object_ggtt_pin_ww(wa_ctx->indirect_ctx.obj, &ww, NU=
LL,
> > +					  0, CACHELINE_BYTES, 0);
> > +	if (IS_ERR(vma)) {
> > +		ret =3D PTR_ERR(vma);
> > +		if (ret =3D=3D -EDEADLK) {
> > +			ret =3D i915_gem_ww_ctx_backoff(&ww);
> > +			if (!ret)
> > +				goto retry;
> > +		}
> > +		return ret;
> > +	}
> > +
> > +	i915_gem_object_unlock(wa_ctx->indirect_ctx.obj);
> > +	i915_gem_ww_ctx_fini(&ww);
> >   	/* FIXME: we are not tracking our pinned VMA leaving it
> >   	 * up to the core to fix up the stray pin_count upon
> > @@ -619,12 +652,14 @@ static void release_shadow_batch_buffer(struct in=
tel_vgpu_workload *workload)
> >   	list_for_each_entry_safe(bb, pos, &workload->shadow_bb, list) {
> >   		if (bb->obj) {
> > +			i915_gem_object_lock(bb->obj, NULL);
> >   			if (bb->va && !IS_ERR(bb->va))
> >   				i915_gem_object_unpin_map(bb->obj);
> >   			if (bb->vma && !IS_ERR(bb->vma))
> >   				i915_vma_unpin(bb->vma);
> > +			i915_gem_object_unlock(bb->obj);
> >   			i915_gem_object_put(bb->obj);
> >   		}
> >   		list_del(&bb->list);
> > @@ -1337,6 +1372,7 @@ int intel_vgpu_setup_submission(struct intel_vgpu=
 *vgpu)
> >   	struct intel_vgpu_submission *s =3D &vgpu->submission;
> >   	struct intel_engine_cs *engine;
> >   	struct i915_ppgtt *ppgtt;
> > +	struct i915_gem_ww_ctx ww;
> >   	enum intel_engine_id i;
> >   	int ret;
> > @@ -1368,11 +1404,20 @@ int intel_vgpu_setup_submission(struct intel_vg=
pu *vgpu)
> >   			ce->ring =3D __intel_context_ring_size(ring_size);
> >   		}
> Cut here
> > +		i915_gem_ww_ctx_init(&ww, false);
> > +retry:
> > +		ret =3D intel_context_pin_ww(ce, &ww);
> > +		if (ret) {
> > +			if (ret =3D=3D -EDEADLK) {
> > +				ret =3D i915_gem_ww_ctx_backoff(&ww);
> > +				if (!ret)
> > +					goto retry;
> > +			}
> > +			goto out_shadow_ctx;
> > +		}
> I move the piece to create_workload. Similar to the change I made in my
> patch sent.
> > -		ret =3D intel_context_pin(ce);
> >   		intel_context_put(ce);
> > -		if (ret)
> > -			goto out_shadow_ctx;
> > +		i915_gem_ww_ctx_fini(&ww);
> >   		s->shadow[i] =3D ce;
> >   	}
> > @@ -1400,6 +1445,7 @@ int intel_vgpu_setup_submission(struct intel_vgpu=
 *vgpu)
> >   	return 0;
> >   out_shadow_ctx:
> > +	i915_gem_ww_ctx_fini(&ww);
> >   	i915_context_ppgtt_root_restore(s, ppgtt);
> >   	for_each_engine(engine, vgpu->gvt->gt, i) {
> >   		if (IS_ERR(s->shadow[i]))
>=20
> --=20
> Best Regards,
> Colin Xu
>=20

--=20

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--yEPQxsgoJgBvi8ip
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCX1g4wgAKCRCxBBozTXgY
J6BEAKCdhVkWD1Pei3Ml7U+IqpjzpR1PWwCfVNcMcYF7K6j6H/vHwYN21LB1uf4=
=TiB/
-----END PGP SIGNATURE-----

--yEPQxsgoJgBvi8ip--

--===============1308529464==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============1308529464==--
