Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9356B30AED
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 31 May 2019 11:00:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60F4D89207;
	Fri, 31 May 2019 09:00:00 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AA3789207
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 31 May 2019 08:59:59 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 May 2019 01:59:58 -0700
X-ExtLoop1: 1
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by fmsmga001.fm.intel.com with ESMTP; 31 May 2019 01:59:57 -0700
Date: Fri, 31 May 2019 16:58:34 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: "Li, Weinan Z" <weinan.z.li@intel.com>
Subject: Re: [PATCH v5] drm/i915/gvt: save RING_HEAD into vreg when vgpu
 switched out
Message-ID: <20190531085834.GC9684@zhen-hp.sh.intel.com>
References: <1559279889-5741-1-git-send-email-xiaolin.zhang@intel.com>
 <20190531054223.GL3211@zhen-hp.sh.intel.com>
 <9BD218709B5F2A4F96F08B4A3B98A8977342BA62@SHSMSX101.ccr.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <9BD218709B5F2A4F96F08B4A3B98A8977342BA62@SHSMSX101.ccr.corp.intel.com>
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
Cc: "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>, "Zhang,
 Xiaolin" <xiaolin.zhang@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>
Content-Type: multipart/mixed; boundary="===============1587902616=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1587902616==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Sr1nOIr3CvdE5hEN"
Content-Disposition: inline


--Sr1nOIr3CvdE5hEN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.05.31 08:28:10 +0000, Li, Weinan Z wrote:
> > -----Original Message-----
> > From: intel-gvt-dev [mailto:intel-gvt-dev-bounces@lists.freedesktop.org=
] On
> > Behalf Of Zhenyu Wang
> > Sent: Friday, May 31, 2019 1:42 PM
> > To: Zhang, Xiaolin <xiaolin.zhang@intel.com>
> > Cc: intel-gvt-dev@lists.freedesktop.org
> > Subject: Re: [PATCH v5] drm/i915/gvt: save RING_HEAD into vreg when vgpu
> > switched out
> >=20
> > On 2019.05.31 13:18:09 +0800, Xiaolin Zhang wrote:
> > > Save RING_HEAD into vgpu reg when vgpu switched out and report it's
> > > value back to guest.
> > >
> > > v5: ring head wrap count support.
> > > v4: updated HEAD/TAIL with guest value, not host value. (Yan Zhao)
> > > v3: save RING HEAD/TAIL vgpu reg in save_ring_hw_state. (Zhenyu Wang)
> > > v2: save RING_TAIL as well during vgpu mmio switch to meet
> > > ring_is_idle condition. (Fred Gao)
> > > v1: based on input from Weinan. (Weinan Li)
> > >
> > > [zhenyuw: Include this fix for possible future guest kernel that would
> > > utilize RING_HEAD for hangcheck.]
> > >
> > > Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>
> > > Signed-off-by: Xiaolin Zhang <xiaolin.zhang@intel.com>
> > > Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>
> > > ---
> > >  drivers/gpu/drm/i915/gvt/reg.h       |  3 +++
> > >  drivers/gpu/drm/i915/gvt/scheduler.c | 28
> > > ++++++++++++++++++++++++++++
> > drivers/gpu/drm/i915/gvt/scheduler.h |
> > > 1 +
> > >  3 files changed, 32 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/i915/gvt/reg.h
> > > b/drivers/gpu/drm/i915/gvt/reg.h index 33aaa14..b210e9a 100644
> > > --- a/drivers/gpu/drm/i915/gvt/reg.h
> > > +++ b/drivers/gpu/drm/i915/gvt/reg.h
> > > @@ -102,6 +102,9 @@
> > >  #define FORCEWAKE_ACK_MEDIA_GEN9_REG 0x0D88  #define
> > > FORCEWAKE_ACK_HSW_REG 0x130044
> > >
> > > +#define RB_HEAD_WRAP_CNT_MAX	((1 << 11) - 1)
> > > +#define RB_HEAD_WRAP_CNT_OFF	21
> > > +#define RB_HEAD_WRAP_CNT_MASK	(0xFFE00000)
> > >  #define RB_HEAD_OFF_MASK	((1U << 21) - (1U << 2))
> > >  #define RB_TAIL_OFF_MASK	((1U << 21) - (1U << 3))
> > >  #define RB_TAIL_SIZE_MASK	((1U << 21) - (1U << 12))
> > > diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c
> > > b/drivers/gpu/drm/i915/gvt/scheduler.c
> > > index 38897d2..e6523e8 100644
> > > --- a/drivers/gpu/drm/i915/gvt/scheduler.c
> > > +++ b/drivers/gpu/drm/i915/gvt/scheduler.c
> > > @@ -793,10 +793,34 @@ static void update_guest_context(struct
> > intel_vgpu_workload *workload)
> > >  	void *src;
> > >  	unsigned long context_gpa, context_page_num;
> > >  	int i;
> > > +	struct drm_i915_private *dev_priv =3D gvt->dev_priv;
> > > +	i915_reg_t reg;
> > > +	u32 ring_base;
> > > +	u32 head, tail;
> > > +	u16 wrap_count;
> > >
> > >  	gvt_dbg_sched("ring id %d workload lrca %x\n", rq->engine->id,
> > >  		      workload->ctx_desc.lrca);
> > >
> > > +	head =3D workload->rb_head;
> > > +	tail =3D workload->rb_tail;
> > > +	wrap_count =3D workload->guest_rb_head &
> > RB_HEAD_WRAP_CNT_MASK;
> > > +
> >=20
> > Looks missed the shift for real counter here.
> >=20
> > > +	if (tail < head) {
> > > +		if (wrap_count =3D=3D RB_HEAD_WRAP_CNT_MAX)
> > > +			wrap_count =3D 0;
> > > +		else
> > > +			wrap_count +=3D 1;
> > > +	}
> > > +
> > > +	head =3D (wrap_count << RB_HEAD_WRAP_CNT_OFF) | tail;
> > > +
> > > +	ring_base =3D dev_priv->engine[workload->ring_id]->mmio_base;
> > > +	reg =3D RING_TAIL(ring_base);
> > > +	vgpu_vreg(vgpu, i915_mmio_reg_offset(reg)) =3D tail;
> > > +	reg =3D RING_HEAD(ring_base);
> > > +	vgpu_vreg(vgpu, i915_mmio_reg_offset(reg)) =3D head;
> > > +
> >=20
> > Can write as
> >=20
> >         vgpu_vreg_t(vgpu, RING_TAIL(ring_base)) =3D tail;
> >         vgpu_vreg_t(vgpu, RING_HEAD(ring_base)) =3D head;
> >=20
> >=20
> Just update the vreg during "update_guest_context()" is not enough, think=
ing there is one workload was preempted out by host many times.
>

For preemption case which need extra track of host vs. guest ring
to reflect guest state, this one is always needed for normal finish.
Yeah, need further change to update guest state in time.

> > >  	context_page_num =3D rq->engine->context_size;
> > >  	context_page_num =3D context_page_num >> PAGE_SHIFT;
> > >
> > > @@ -1418,6 +1442,7 @@ intel_vgpu_create_workload(struct intel_vgpu
> > *vgpu, int ring_id,
> > >  	struct drm_i915_private *dev_priv =3D vgpu->gvt->dev_priv;
> > >  	u64 ring_context_gpa;
> > >  	u32 head, tail, start, ctl, ctx_ctl, per_ctx, indirect_ctx;
> > > +	u32 guest_head;
> > >  	int ret;
> > >
> > >  	ring_context_gpa =3D intel_vgpu_gma_to_gpa(vgpu->gtt.ggtt_mm,
> > > @@ -1433,6 +1458,8 @@ intel_vgpu_create_workload(struct intel_vgpu
> > *vgpu, int ring_id,
> > >  	intel_gvt_hypervisor_read_gpa(vgpu, ring_context_gpa +
> > >  			RING_CTX_OFF(ring_tail.val), &tail, 4);
> > >
> > > +	guest_head =3D head;
> > > +
> > >  	head &=3D RB_HEAD_OFF_MASK;
> > >  	tail &=3D RB_TAIL_OFF_MASK;
> > >
> > > @@ -1465,6 +1492,7 @@ intel_vgpu_create_workload(struct intel_vgpu
> > *vgpu, int ring_id,
> > >  	workload->ctx_desc =3D *desc;
> > >  	workload->ring_context_gpa =3D ring_context_gpa;
> > >  	workload->rb_head =3D head;
> > > +	workload->guest_rb_head =3D guest_head;
> > >  	workload->rb_tail =3D tail;
> > >  	workload->rb_start =3D start;
> > >  	workload->rb_ctl =3D ctl;
> > > diff --git a/drivers/gpu/drm/i915/gvt/scheduler.h
> > > b/drivers/gpu/drm/i915/gvt/scheduler.h
> > > index 90c6756..c50d14a 100644
> > > --- a/drivers/gpu/drm/i915/gvt/scheduler.h
> > > +++ b/drivers/gpu/drm/i915/gvt/scheduler.h
> > > @@ -100,6 +100,7 @@ struct intel_vgpu_workload {
> > >  	struct execlist_ctx_descriptor_format ctx_desc;
> > >  	struct execlist_ring_context *ring_context;
> > >  	unsigned long rb_head, rb_tail, rb_ctl, rb_start, rb_len;
> > > +	unsigned long guest_rb_head;
> > >  	bool restore_inhibit;
> > >  	struct intel_vgpu_elsp_dwords elsp_dwords;
> > >  	bool emulate_schedule_in;
> > > --
> > > 2.7.4
> > >
> >=20
> > --
> > Open Source Technology Center, Intel ltd.
> >=20
> > $gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--Sr1nOIr3CvdE5hEN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iFwEARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXPDsugAKCRCxBBozTXgY
J1U5AKCWPSBx466Ed/NTjf2u1Te+3D/OGQCYmgqYVocviNTEDZ8yKvBFH5E7TA==
=Xa4h
-----END PGP SIGNATURE-----

--Sr1nOIr3CvdE5hEN--

--===============1587902616==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============1587902616==--
