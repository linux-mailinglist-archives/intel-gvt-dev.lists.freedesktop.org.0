Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FEA1AD8B6
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 17 Apr 2020 10:35:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D309E6E3CE;
	Fri, 17 Apr 2020 08:35:49 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5F916E3CE
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 17 Apr 2020 08:35:48 +0000 (UTC)
IronPort-SDR: JMVYHx8M8UA7I2RtF6EtpU20rMFPXT7snqrJvo25gfB68pM8UdIULjbn0t5aKQwWJKQnSGd+ov
 i7h8IbIUWKYg==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2020 01:35:48 -0700
IronPort-SDR: 7vCF8CWfZsFJMPvNO8mnuwXyA2U2BVV1nSy9lVt7k9M/jEzGFmGfYLHMSLIAPr6KejgxRYxKJC
 89DuY40lSUNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,394,1580803200"; 
 d="asc'?scan'208";a="254145606"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by orsmga003.jf.intel.com with ESMTP; 17 Apr 2020 01:35:46 -0700
Date: Fri, 17 Apr 2020 16:21:58 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Subject: Re: [PATCH v6] drm/i915/gvt: skip populate shadow context if guest
 context not changed
Message-ID: <20200417082158.GY11247@zhen-hp.sh.intel.com>
References: <20200417064448.10807-1-yan.y.zhao@intel.com>
MIME-Version: 1.0
In-Reply-To: <20200417064448.10807-1-yan.y.zhao@intel.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 zhenyuw@linux.intel.com
Content-Type: multipart/mixed; boundary="===============0405712868=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0405712868==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8N0TQpGUCeEQshoq"
Content-Disposition: inline


--8N0TQpGUCeEQshoq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.04.17 02:44:48 -0400, Yan Zhao wrote:
> Software is not expected to populate engine context except when using
> restore inhibit bit or golden state to initialize it for the first time.
>=20
> Therefore, if a newly submitted guest context is the same as the last
> shadowed one, no need to populate its engine context from guest again.
>=20
> Currently using lrca + ring_context_gpa to identify whether two guest
> contexts are the same.
>=20
> The reason of why context id is not included as an identifier is that
> i915 recently changed the code and context id is only unique for a
> context when OA is enabled. And when OA is on, context id is generated
> based on lrca. Therefore, in that case, if two contexts are of the same
> lrca, they have identical context ids as well.
> (This patch also works with old guest kernel like 4.20.)
>=20
> for guest context, if its ggtt entry is modified after last context
> shadowing, it is also deemed as not the same context as last shadowed one.
>=20
> v6:
> -change type of lrca of last ctx to be u32. as currently it's all
> protected by vgpu lock (Kevin Tian)
> -reset valid of last ctx to false once it needs to be repopulated before
> population completes successfully (Kevin Tian)
>=20
> v5:
> -merge all 3 patches into one patch  (Zhenyu Wang)
>=20
> v4:
> - split the series into 3 patches.
> - don't turn on optimization until last patch in this series (Kevin Tian)
> - define lrca to be atomic in this patch rather than update its type in
> the second patch (Kevin Tian)
>=20
> v3: updated commit message to describe engine context and context id
> clearly (Kevin Tian)
> v2: rebased to 5.6.0-rc4+Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
>

Thanks for updating this. Looks much fine to me.

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

> Cc: Kevin Tian <kevin.tian@intel.com>
> Suggested-by: Zhenyu Wang <zhenyuw@linux.intel.com>
> Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/gtt.c       | 15 ++++++++++++
>  drivers/gpu/drm/i915/gvt/gvt.h       |  5 ++++
>  drivers/gpu/drm/i915/gvt/scheduler.c | 36 ++++++++++++++++++++++++----
>  3 files changed, 51 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gt=
t.c
> index 2a4b23f8aa74..d2b0d85b39bc 100644
> --- a/drivers/gpu/drm/i915/gvt/gtt.c
> +++ b/drivers/gpu/drm/i915/gvt/gtt.c
> @@ -2341,12 +2341,27 @@ int intel_vgpu_emulate_ggtt_mmio_write(struct int=
el_vgpu *vgpu,
>  {
>  	const struct intel_gvt_device_info *info =3D &vgpu->gvt->device_info;
>  	int ret;
> +	struct intel_vgpu_submission *s =3D &vgpu->submission;
> +	struct intel_engine_cs *engine;
> +	int i;
> =20
>  	if (bytes !=3D 4 && bytes !=3D 8)
>  		return -EINVAL;
> =20
>  	off -=3D info->gtt_start_offset;
>  	ret =3D emulate_ggtt_mmio_write(vgpu, off, p_data, bytes);
> +
> +	/* if ggtt of last submitted context is written,
> +	 * that context is probably got unpinned.
> +	 * Set last shadowed ctx to invalid.
> +	 */
> +	for_each_engine(engine, vgpu->gvt->gt, i) {
> +		if (!s->last_ctx[i].valid)
> +			continue;
> +
> +		if (s->last_ctx[i].lrca =3D=3D (off >> info->gtt_entry_size_shift))
> +			s->last_ctx[i].valid =3D false;
> +	}
>  	return ret;
>  }
> =20
> diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gv=
t.h
> index 58c2c7932e3f..a4a6db6b7f90 100644
> --- a/drivers/gpu/drm/i915/gvt/gvt.h
> +++ b/drivers/gpu/drm/i915/gvt/gvt.h
> @@ -163,6 +163,11 @@ struct intel_vgpu_submission {
>  	const struct intel_vgpu_submission_ops *ops;
>  	int virtual_submission_interface;
>  	bool active;
> +	struct {
> +		u32 lrca;
> +		bool valid;
> +		u64 ring_context_gpa;
> +	} last_ctx[I915_NUM_ENGINES];
>  };
> =20
>  struct intel_vgpu {
> diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c b/drivers/gpu/drm/i915/=
gvt/scheduler.c
> index f939ec3be39e..d13204658b57 100644
> --- a/drivers/gpu/drm/i915/gvt/scheduler.c
> +++ b/drivers/gpu/drm/i915/gvt/scheduler.c
> @@ -135,7 +135,11 @@ static int populate_shadow_context(struct intel_vgpu=
_workload *workload)
>  	unsigned long context_gpa, context_page_num;
>  	unsigned long gpa_base; /* first gpa of consecutive GPAs */
>  	unsigned long gpa_size; /* size of consecutive GPAs */
> +	struct intel_vgpu_submission *s =3D &vgpu->submission;
>  	int i;
> +	bool skip =3D false;
> +	int ring_id =3D workload->engine->id;
> +	bool valid;
> =20
>  	GEM_BUG_ON(!intel_context_is_pinned(ctx));
> =20
> @@ -175,13 +179,31 @@ static int populate_shadow_context(struct intel_vgp=
u_workload *workload)
> =20
>  	sr_oa_regs(workload, (u32 *)shadow_ring_context, false);
> =20
> -	if (IS_RESTORE_INHIBIT(shadow_ring_context->ctx_ctrl.val))
> -		return 0;
> +	gvt_dbg_sched("ring %s workload lrca %x, ctx_id %x, ctx gpa %llx",
> +			workload->engine->name, workload->ctx_desc.lrca,
> +			workload->ctx_desc.context_id,
> +			workload->ring_context_gpa);
> =20
> -	gvt_dbg_sched("ring %s workload lrca %x",
> -		      workload->engine->name,
> -		      workload->ctx_desc.lrca);
> +	/* only need to ensure this context is not pinned/unpinned during the
> +	 * period from last submission to this this submission.
> +	 * Upon reaching this function, the currently submitted context is not
> +	 * supposed to get unpinned. If a misbehaving guest driver ever does
> +	 * this, it would corrupt itself.
> +	 */
> +	valid =3D s->last_ctx[ring_id].valid;
> +	if (valid && (s->last_ctx[ring_id].lrca =3D=3D
> +				workload->ctx_desc.lrca) &&
> +			(s->last_ctx[ring_id].ring_context_gpa =3D=3D
> +				workload->ring_context_gpa))
> +		skip =3D true;
> =20
> +	s->last_ctx[ring_id].lrca =3D workload->ctx_desc.lrca;
> +	s->last_ctx[ring_id].ring_context_gpa =3D workload->ring_context_gpa;
> +
> +	if (IS_RESTORE_INHIBIT(shadow_ring_context->ctx_ctrl.val) || skip)
> +		return 0;
> +
> +	s->last_ctx[ring_id].valid =3D false;
>  	context_page_num =3D workload->engine->context_size;
>  	context_page_num =3D context_page_num >> PAGE_SHIFT;
> =20
> @@ -220,6 +242,8 @@ static int populate_shadow_context(struct intel_vgpu_=
workload *workload)
>  		gpa_size =3D I915_GTT_PAGE_SIZE;
>  		dst =3D context_base + (i << I915_GTT_PAGE_SHIFT);
>  	}
> +	if (!valid)
> +		s->last_ctx[ring_id].valid =3D true;
>  	return 0;
>  }
> =20
> @@ -1297,6 +1321,8 @@ int intel_vgpu_setup_submission(struct intel_vgpu *=
vgpu)
>  	atomic_set(&s->running_workload_num, 0);
>  	bitmap_zero(s->tlb_handle_pending, I915_NUM_ENGINES);
> =20
> +	memset(s->last_ctx, 0, sizeof(s->last_ctx));
> +
>  	i915_vm_put(&ppgtt->vm);
>  	return 0;
> =20
> --=20
> 2.17.1
>=20

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--8N0TQpGUCeEQshoq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXplnJgAKCRCxBBozTXgY
J8mGAJ9TyrBT9rpEALkMhrWO0RXTCcqTKACdHHndTn8vGl27bncnWXakx9Otvyg=
=wyiS
-----END PGP SIGNATURE-----

--8N0TQpGUCeEQshoq--

--===============0405712868==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0405712868==--
