Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F531B8FB0
	for <lists+intel-gvt-dev@lfdr.de>; Sun, 26 Apr 2020 14:05:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 256066E1E5;
	Sun, 26 Apr 2020 12:05:58 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D22E6E039
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sun, 26 Apr 2020 12:05:57 +0000 (UTC)
IronPort-SDR: yrMdhLWHXd3cxOOqBb/3n0EXX4twdCEqZL8BBCtB3OhPhkeOo2qIwW88q3Y2epc9GKbpKLUbvd
 2DBciEQzayFA==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2020 05:05:56 -0700
IronPort-SDR: Cy9QZEq9Ku4u+8DCeBLXVe11H+KoQW35CqEootF7hyILy0yhGVAS3l7WUUku6BGnvFPbZZuGie
 FziQl7NDSuDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,320,1583222400"; 
 d="asc'?scan'208";a="256944170"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by orsmga003.jf.intel.com with ESMTP; 26 Apr 2020 05:05:53 -0700
Date: Sun, 26 Apr 2020 19:51:45 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Subject: Re: [PATCH v2 2/2] drm/i915/gvt: Support PPGTT table load command
Message-ID: <20200426115145.GE18545@zhen-hp.sh.intel.com>
References: <20200318135322.13788-1-tina.zhang@intel.com>
 <20200426025802.2839-2-zhenyuw@linux.intel.com>
 <20200426052803.GD12879@joy-OptiPlex-7040>
 <20200426065823.GC18545@zhen-hp.sh.intel.com>
 <20200426071736.GD18545@zhen-hp.sh.intel.com>
 <20200426075928.GE12879@joy-OptiPlex-7040>
MIME-Version: 1.0
In-Reply-To: <20200426075928.GE12879@joy-OptiPlex-7040>
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
Cc: intel-gvt-dev@lists.freedesktop.org, Tina Zhang <tina.zhang@intel.com>
Content-Type: multipart/mixed; boundary="===============1982090787=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1982090787==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="a+b56+3nqLzpiR9O"
Content-Disposition: inline


--a+b56+3nqLzpiR9O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.04.26 03:59:28 -0400, Yan Zhao wrote:
> On Sun, Apr 26, 2020 at 03:17:36PM +0800, Zhenyu Wang wrote:
> > On 2020.04.26 14:58:23 +0800, Zhenyu Wang wrote:
> > > On 2020.04.26 01:28:03 -0400, Yan Zhao wrote:
> > > > On Sun, Apr 26, 2020 at 10:58:02AM +0800, Zhenyu Wang wrote:
> > > > > From: Tina Zhang <tina.zhang@intel.com>
> > > > >=20
> > > > > The PPGTT in context image can be overridden by LRI cmd with anot=
her
> > > > > PPGTT's pdps. In such case, the load mm is used instead of the on=
e in
> > > > > the context image. So we need to load its shadow mm in GVT and re=
place
> > > > > ppgtt pointers in command.
> > > > >=20
> > > > > This feature is used by guest IGD driver to share gfx VM between
> > > > > different contexts. Verified by IGT "gem_ctx_clone" test.
> > > > >=20
> > > > > v2: (Zhenyu Wang)
> > > > > - Change to list for handling possible multiple ppgtt table loads
> > > > >   in one submission. Make sure shadow mm is to replace for each o=
ne.
> > > > >=20
> > > > > Signed-off-by: Tina Zhang <tina.zhang@intel.com>
> > > > > Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>
> > > > > ---
> > > > >  drivers/gpu/drm/i915/gvt/cmd_parser.c | 79 +++++++++++++++++++++=
++++++
> > > > >  drivers/gpu/drm/i915/gvt/gtt.c        |  1 +
> > > > >  drivers/gpu/drm/i915/gvt/gtt.h        |  1 +
> > > > >  drivers/gpu/drm/i915/gvt/handlers.c   |  2 +-
> > > > >  drivers/gpu/drm/i915/gvt/scheduler.c  | 70 +++++++++++++++++++++=
+++
> > > > >  drivers/gpu/drm/i915/gvt/scheduler.h  |  1 +
> > > > >  6 files changed, 153 insertions(+), 1 deletion(-)
> > > > >=20
> > > > > diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/=
drm/i915/gvt/cmd_parser.c
> > > > > index a3cc080a46c6..3dc36299f989 100644
> > > > > --- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
> > > > > +++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
> > > > > @@ -882,6 +882,81 @@ static int mocs_cmd_reg_handler(struct parse=
r_exec_state *s,
> > > > >  	return 0;
> > > > >  }
> > > > > =20
> > > > > +#define IS_PDP_UDW_MMIO(offset, base, num)	\
> > > > > +	((offset) =3D=3D ((base) + 0x274 + (num) * 8))
> > > > > +
> > > > > +static int is_cmd_update_pdps(unsigned int offset,
> > > > > +			      struct parser_exec_state *s)
> > > > > +{
> > > > > +	return IS_PDP_UDW_MMIO(offset, s->workload->engine->mmio_base, =
0) ||
> > > > > +		IS_PDP_UDW_MMIO(offset, s->workload->engine->mmio_base, 3);
> > > > > +}
> > > > > +
> > > > > +static int cmd_pdp_mmio_update_handler(struct parser_exec_state =
*s,
> > > > > +				       unsigned int offset, unsigned int index)
> > > > > +{
> > > > > +	struct intel_vgpu *vgpu =3D s->vgpu;
> > > > > +	struct intel_vgpu_mm *shadow_mm =3D s->workload->shadow_mm;
> > > > > +	struct intel_vgpu_mm *mm;
> > > > > +	u64 pdps[GEN8_3LVL_PDPES];
> > > > > +
> > > > > +	if (shadow_mm->ppgtt_mm.root_entry_type =3D=3D
> > > > > +	    GTT_TYPE_PPGTT_ROOT_L4_ENTRY) {
> > > > > +		pdps[0] =3D (u64)cmd_val(s, 2) << 32;
> > > > > +		pdps[0] |=3D cmd_val(s, 4);
> > > > > +
> > > > > +		mm =3D intel_vgpu_find_ppgtt_mm(vgpu, pdps);
> > > > > +		if (!mm) {
> > > > > +			gvt_vgpu_err("failed to get the shadow vm\n");
> > > > > +			return -EINVAL;
> > > > > +		}
> > > > > +
> > > > > +		if (mm !=3D shadow_mm) {
> > > > > +			intel_vgpu_mm_get(mm);
> > > > > +			list_add_tail(&mm->ppgtt_mm.link,
> > > > > +				      &s->workload->lri_shadow_mm);
> > > > > +			*cmd_ptr(s, 2) =3D
> > > > > +				upper_32_bits(mm->ppgtt_mm.shadow_pdps[0]);
> > > > > +			*cmd_ptr(s, 4) =3D
> > > > > +				lower_32_bits(mm->ppgtt_mm.shadow_pdps[0]);
> > > > > +		}
> > > > > +	} else if (shadow_mm->ppgtt_mm.root_entry_type =3D=3D
> > > > > +		   GTT_TYPE_PPGTT_ROOT_L3_ENTRY) {
> > > > > +		int i, j;
> > > > > +
> > > > > +		for (i =3D GEN8_3LVL_PDPES, j =3D 2; i--; ) {
> > > > > +			pdps[i] =3D (u64)cmd_val(s, j) << 32;
> > > > > +			pdps[i] |=3D cmd_val(s, j+2);
> > > > > +			j +=3D 4;
> > > > > +		}
> > > > > +
> > > > > +		mm =3D intel_vgpu_find_ppgtt_mm(vgpu, pdps);
> > > > > +		if (!mm) {
> > > > > +			gvt_vgpu_err("failed to get the shadow vm\n");
> > > > > +			return -EINVAL;
> > > > > +		}
> > > > > +
> > > > > +		if (mm !=3D shadow_mm) {
> > > > > +			intel_vgpu_mm_get(mm);
> > > > > +			list_add_tail(&mm->ppgtt_mm.link,
> > > > > +				      &s->workload->lri_shadow_mm);
> > > > > +			for (i =3D GEN8_3LVL_PDPES, j =3D 2; i--; ) {
> > > > > +				*cmd_ptr(s, j) =3D
> > > > > +					upper_32_bits(
> > > > > +						mm->ppgtt_mm.shadow_pdps[i]);
> > > > > +				*cmd_ptr(s, j + 2) =3D
> > > > > +					lower_32_bits(
> > > > > +						mm->ppgtt_mm.shadow_pdps[i]);
> > > > > +				j +=3D 4;
> > > > > +			}
> > > > > +		}
> > > > > +	} else {
> > > > > +		gvt_vgpu_err("invalid shared shadow vm type\n");
> > > > > +		return -EINVAL;
> > > > > +	}
> > > > > +	return 0;
> > > > > +}
> > > > > +
> > > > >  static int cmd_reg_handler(struct parser_exec_state *s,
> > > > >  	unsigned int offset, unsigned int index, char *cmd)
> > > > >  {
> > > > > @@ -920,6 +995,10 @@ static int cmd_reg_handler(struct parser_exe=
c_state *s,
> > > > >  		patch_value(s, cmd_ptr(s, index), VGT_PVINFO_PAGE);
> > > > >  	}
> > > > > =20
> > > > > +	if (is_cmd_update_pdps(offset, s) &&
> > > > > +	    cmd_pdp_mmio_update_handler(s, offset, index))
> > > > > +		return -EINVAL;
> > > > > +
> > > > >  	/* TODO
> > > > >  	 * In order to let workload with inhibit context to generate
> > > > >  	 * correct image data into memory, vregs values will be loaded =
to
> > > > > diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i91=
5/gvt/gtt.c
> > > > > index d2b0d85b39bc..210016192ce7 100644
> > > > > --- a/drivers/gpu/drm/i915/gvt/gtt.c
> > > > > +++ b/drivers/gpu/drm/i915/gvt/gtt.c
> > > > > @@ -1900,6 +1900,7 @@ struct intel_vgpu_mm *intel_vgpu_create_ppg=
tt_mm(struct intel_vgpu *vgpu,
> > > > > =20
> > > > >  	INIT_LIST_HEAD(&mm->ppgtt_mm.list);
> > > > >  	INIT_LIST_HEAD(&mm->ppgtt_mm.lru_list);
> > > > > +	INIT_LIST_HEAD(&mm->ppgtt_mm.link);
> > > > > =20
> > > > >  	if (root_entry_type =3D=3D GTT_TYPE_PPGTT_ROOT_L4_ENTRY)
> > > > >  		mm->ppgtt_mm.guest_pdps[0] =3D pdps[0];
> > > > > diff --git a/drivers/gpu/drm/i915/gvt/gtt.h b/drivers/gpu/drm/i91=
5/gvt/gtt.h
> > > > > index 88789316807d..320b8d6ad92f 100644
> > > > > --- a/drivers/gpu/drm/i915/gvt/gtt.h
> > > > > +++ b/drivers/gpu/drm/i915/gvt/gtt.h
> > > > > @@ -160,6 +160,7 @@ struct intel_vgpu_mm {
> > > > > =20
> > > > >  			struct list_head list;
> > > > >  			struct list_head lru_list;
> > > > > +			struct list_head link; /* possible LRI shadow mm list */
> > > > >  		} ppgtt_mm;
> > > > >  		struct {
> > > > >  			void *virtual_ggtt;
> > > > > diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/dr=
m/i915/gvt/handlers.c
> > > > > index 2faf50e1b051..3e88e3b5c43a 100644
> > > > > --- a/drivers/gpu/drm/i915/gvt/handlers.c
> > > > > +++ b/drivers/gpu/drm/i915/gvt/handlers.c
> > > > > @@ -2812,7 +2812,7 @@ static int init_bdw_mmio_info(struct intel_=
gvt *gvt)
> > > > >  	MMIO_D(GAMTARBMODE, D_BDW_PLUS);
> > > > > =20
> > > > >  #define RING_REG(base) _MMIO((base) + 0x270)
> > > > > -	MMIO_RING_F(RING_REG, 32, 0, 0, 0, D_BDW_PLUS, NULL, NULL);
> > > > > +	MMIO_RING_F(RING_REG, 32, F_CMD_ACCESS, 0, 0, D_BDW_PLUS, NULL,=
 NULL);
> > > > >  #undef RING_REG
> > > > > =20
> > > > >  	MMIO_RING_GM_RDR(RING_HWS_PGA, D_BDW_PLUS, NULL, hws_pga_write);
> > > > > diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c b/drivers/gpu/d=
rm/i915/gvt/scheduler.c
> > > > > index c1c8f3f9bec4..ed91d021d9f0 100644
> > > > > --- a/drivers/gpu/drm/i915/gvt/scheduler.c
> > > > > +++ b/drivers/gpu/drm/i915/gvt/scheduler.c
> > > > > @@ -647,12 +647,48 @@ static void release_shadow_batch_buffer(str=
uct intel_vgpu_workload *workload)
> > > > >  	}
> > > > >  }
> > > > > =20
> > > > > +static int
> > > > > +cmd_shadow_mm_pin(struct intel_vgpu_workload *workload)
> > > > > +{
> > > > > +	int ret =3D 0;
> > > > > +	struct intel_vgpu_mm *m;
> > > > > +
> > > > > +	if (!list_empty(&workload->lri_shadow_mm)) {
> > > > > +		list_for_each_entry(m, &workload->lri_shadow_mm,
> > > > > +				    ppgtt_mm.link) {
> > > > > +			ret =3D intel_vgpu_pin_mm(m);
> > > > > +			if (ret)
> > > > > +				break;
> > > > > +		}
> > > > > +	}
> > > > > +
> > > > > +	return ret;
> > > > > +}
> > > > > +
> > > > > +static void
> > > > > +cmd_shadow_mm_unpin(struct intel_vgpu_workload *workload)
> > > > > +{
> > > > > +	struct intel_vgpu_mm *m;
> > > > > +
> > > > > +	if (!list_empty(&workload->lri_shadow_mm)) {
> > > > > +		list_for_each_entry(m, &workload->lri_shadow_mm,
> > > > > +				    ppgtt_mm.link)
> > > > > +			intel_vgpu_unpin_mm(m);
> > > > > +	}
> > > > > +}
> > > > > +
> > > > >  static int prepare_workload(struct intel_vgpu_workload *workload)
> > > > >  {
> > > > >  	struct intel_vgpu *vgpu =3D workload->vgpu;
> > > > >  	struct intel_vgpu_submission *s =3D &vgpu->submission;
> > > > >  	int ret =3D 0;
> > > > > =20
> > > > > +	ret =3D cmd_shadow_mm_pin(workload);
> > > > > +	if (ret) {
> > > > > +		gvt_vgpu_err("fail to vgpu pin cmd mm\n");
> > > > > +		return ret;
> > > > > +	}
> > > > > +
> > > > >  	ret =3D intel_vgpu_pin_mm(workload->shadow_mm);
> > > > >  	if (ret) {
> > > > >  		gvt_vgpu_err("fail to vgpu pin mm\n");
> > > > > @@ -712,6 +748,7 @@ static int prepare_workload(struct intel_vgpu=
_workload *workload)
> > > > >  	release_shadow_batch_buffer(workload);
> > > > >  err_unpin_mm:
> > > > >  	intel_vgpu_unpin_mm(workload->shadow_mm);
> > > > > +	cmd_shadow_mm_unpin(workload);
> > > > >  	return ret;
> > > > >  }
> > > > > =20
> > > > > @@ -821,6 +858,19 @@ pick_next_workload(struct intel_gvt *gvt, st=
ruct intel_engine_cs *engine)
> > > > >  	return workload;
> > > > >  }
> > > > > =20
> > > > > +static void update_guest_pdps(struct intel_vgpu *vgpu,
> > > > > +			      u64 ring_context_gpa, u32 pdp[8])
> > > > > +{
> > > > > +	u64 gpa;
> > > > > +	int i;
> > > > > +
> > > > > +	gpa =3D ring_context_gpa + RING_CTX_OFF(pdps[0].val);
> > > > > +
> > > > > +	for (i =3D 0; i < 8; i++)
> > > > > +		intel_gvt_hypervisor_write_gpa(vgpu,
> > > > > +				gpa + i * 8, &pdp[7 - i], 4);
> > > > > +}
> > > > > +
> > > > >  static void update_guest_context(struct intel_vgpu_workload *wor=
kload)
> > > > >  {
> > > > >  	struct i915_request *rq =3D workload->req;
> > > > > @@ -904,6 +954,14 @@ static void update_guest_context(struct inte=
l_vgpu_workload *workload)
> > > > >  	intel_gvt_hypervisor_write_gpa(vgpu, workload->ring_context_gpa=
 +
> > > > >  		RING_CTX_OFF(ring_header.val), &workload->rb_tail, 4);
> > > > > =20
> > > > > +	if (!list_empty(&workload->lri_shadow_mm)) {
> > > > > +		struct intel_vgpu_mm *m =3D list_last_entry(&workload->lri_sha=
dow_mm,
> > > > > +							  struct intel_vgpu_mm,
> > > > > +							  ppgtt_mm.link);
> > > > > +		update_guest_pdps(vgpu, workload->ring_context_gpa,
> > > > > +				  (void *)m->ppgtt_mm.guest_pdps);
> > > > > +	}
> > > > > +
> > > > after workload switching out, the pdp in workload context image sho=
uld
> > > > have the correct value already, right?
> > > > so why the update_guest_pdps() is required here?
> > >=20
> > > Suppose so, we might change this into a sanity check instead?
> > >
> >=20
> > Sorry that's not right. As HW just runs our shadow ppgtt so suppose
> > that shadow pdps would be in workload context instead of guest pdps. So
> > we still need to recover that.
> >
> should't we call update_guest_pdps() in cmd parser handler?
>

I think the step is just to restore guest context and run through
loaded shadow mm, we only need to recover last guest pdp after
workload run.

> > > >=20
> > > > and what's the reason for us to use a lri_shadow_mm list?
> > >=20
> > > As in theory there could be multiple ppgtt loads in one ring
> > > submission, and previous code always assumes one e.g put older scanned
> > > shadow mm if found another one, which was not right to me. So here
> > > just uses a link to track all possible loads.
> > >=20
> > > >=20
> > > >=20
> > > > Thanks
> > > > Yan
> > > > >  	shadow_ring_context =3D (void *) ctx->lrc_reg_state;
> > > > > =20
> > > > >  #define COPY_REG(name) \
> > > > > @@ -1014,6 +1072,7 @@ static void complete_current_workload(struc=
t intel_gvt *gvt, int ring_id)
> > > > > =20
> > > > >  	workload->complete(workload);
> > > > > =20
> > > > > +	cmd_shadow_mm_unpin(workload);
> > > > >  	intel_vgpu_unpin_mm(workload->shadow_mm);
> > > > >  	intel_vgpu_destroy_workload(workload);
> > > > > =20
> > > > > @@ -1410,6 +1469,16 @@ void intel_vgpu_destroy_workload(struct in=
tel_vgpu_workload *workload)
> > > > >  	release_shadow_batch_buffer(workload);
> > > > >  	release_shadow_wa_ctx(&workload->wa_ctx);
> > > > > =20
> > > > > +	if (!list_empty(&workload->lri_shadow_mm)) {
> > > > > +		struct intel_vgpu_mm *m, *mm;
> > > > > +		list_for_each_entry_safe(m, mm, &workload->lri_shadow_mm,
> > > > > +					 ppgtt_mm.link) {
> > > > > +			list_del(&m->ppgtt_mm.link);
> > > > > +			intel_vgpu_mm_put(m);
> > > > > +		}
> > > > > +	}
> > > > > +
> > > > > +	GEM_BUG_ON(!list_empty(&workload->lri_shadow_mm));
> > > > >  	if (workload->shadow_mm)
> > > > >  		intel_vgpu_mm_put(workload->shadow_mm);
> > > > > =20
> > > > > @@ -1428,6 +1497,7 @@ alloc_workload(struct intel_vgpu *vgpu)
> > > > > =20
> > > > >  	INIT_LIST_HEAD(&workload->list);
> > > > >  	INIT_LIST_HEAD(&workload->shadow_bb);
> > > > > +	INIT_LIST_HEAD(&workload->lri_shadow_mm);
> > > > > =20
> > > > >  	init_waitqueue_head(&workload->shadow_ctx_status_wq);
> > > > >  	atomic_set(&workload->shadow_ctx_active, 0);
> > > > > diff --git a/drivers/gpu/drm/i915/gvt/scheduler.h b/drivers/gpu/d=
rm/i915/gvt/scheduler.h
> > > > > index bf7fc0ca4cb1..15d317f2a4a4 100644
> > > > > --- a/drivers/gpu/drm/i915/gvt/scheduler.h
> > > > > +++ b/drivers/gpu/drm/i915/gvt/scheduler.h
> > > > > @@ -87,6 +87,7 @@ struct intel_vgpu_workload {
> > > > >  	int status;
> > > > > =20
> > > > >  	struct intel_vgpu_mm *shadow_mm;
> > > > > +	struct list_head lri_shadow_mm; /* For PPGTT load cmd */
> > > > > =20
> > > > >  	/* different submission model may need different handler */
> > > > >  	int (*prepare)(struct intel_vgpu_workload *);
> > > > > --=20
> > > > > 2.26.1
> > > > >=20
> > > > > _______________________________________________
> > > > > intel-gvt-dev mailing list
> > > > > intel-gvt-dev@lists.freedesktop.org
> > > > > https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
> > >=20
> > > --=20
> > > Open Source Technology Center, Intel ltd.
> > >=20
> > > $gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827
> >=20
> >=20
> >=20
> > > _______________________________________________
> > > intel-gvt-dev mailing list
> > > intel-gvt-dev@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
> >=20
> >=20
> > --=20
> > Open Source Technology Center, Intel ltd.
> >=20
> > $gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827
>=20
>=20

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--a+b56+3nqLzpiR9O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXqV10QAKCRCxBBozTXgY
J65AAJwOFp/ptY/8BWx6ejiC8voUhdqO4QCgldwPp2LVwX6DXJr1KX+O/0E89oc=
=wCCs
-----END PGP SIGNATURE-----

--a+b56+3nqLzpiR9O--

--===============1982090787==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============1982090787==--
