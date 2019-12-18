Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 468C8123F3B
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 18 Dec 2019 06:45:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 001D56E21F;
	Wed, 18 Dec 2019 05:45:41 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 179F86E21F
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 18 Dec 2019 05:45:40 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Dec 2019 21:45:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,328,1571727600"; 
 d="asc'?scan'208";a="240674747"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by fmsmga004.fm.intel.com with ESMTP; 17 Dec 2019 21:45:38 -0800
Date: Wed, 18 Dec 2019 13:43:48 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Hang Yuan <hang.yuan@linux.intel.com>
Subject: Re: [RFC PATCH] drm/i915/gvt: split sched_policy for adding more
 policies
Message-ID: <20191218054348.GB21662@zhen-hp.sh.intel.com>
References: <1576578763-12616-1-git-send-email-hang.yuan@linux.intel.com>
 <20191218024909.GX21662@zhen-hp.sh.intel.com>
 <0aac3d93-edf7-9cef-9c5c-7e45be3fb75d@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <0aac3d93-edf7-9cef-9c5c-7e45be3fb75d@linux.intel.com>
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
Content-Type: multipart/mixed; boundary="===============0184176633=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0184176633==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kjzasy1UhXmRStS5"
Content-Disposition: inline


--kjzasy1UhXmRStS5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.12.18 13:07:34 +0800, Hang Yuan wrote:
> On 12/18/19 10:49 AM, Zhenyu Wang wrote:
> > On 2019.12.17 18:32:43 +0800, hang.yuan@linux.intel.com wrote:
> > > From: Hang Yuan <hang.yuan@linux.intel.com>
> > >=20
> > > Leave common policy codes in sched_policy.c and move time based
> > > scheduling to new file sched_policy_weight.c. Add module parameter
> > > "gvt_scheduler_policy" to choose one policy.
> > >=20
> >=20
> > Before any plan to split scheduler, what's the requirement for new
> > policy? What's the design? Would that be integrated with default
> > weight for different type? Need to understand that first to decide
> > whether or not we have to have seperate schedulers which I'm not favor
> > of if can't be done by default..
> >=20
> The new policy is not mature yet. Just see one user scenario where there =
are
> two vgpus, one is in foreground VM and another is in background VM. For s=
ome
> reason, the background VM can't be paused but end user is not using it. So
> its vgpu looks like not necessary to have fixed capacity as the scheduling
> policy right now.

True.

> Instead, want to try best to serve foreground vgpu and
> just avoid time out for gfx driver in background VM. Here are some rough
> codes based on the previous patch to schedule vgpu on priority and use a
> timer to increase vgpu's priority if it waits too long.

yeah, current method for balance is still based on fixed weight for
target vGPU type. I think you want fine-grained control of run
timeslice over vGPU's activity? or you want fixed priority? I think
the foreground or background could be switched, right?

Could we apply vGPU activity statistics in current scheduler? vGPU
type's weight is kind of static default allocation, we still use that
as base indicator for vgpu timeslice, but we'd also dynamically update
real execute timeslice based vgpu history. From that point of view, we
don't need another scheduler.

>=20
> static struct intel_vgpu *
> find_busy_vgpu(struct gvt_sched_data *sched_data)
> {
>        struct vgpu_pbs_sched_data *vgpu_data;
>        struct intel_vgpu *vgpu =3D NULL;
>        struct list_head *head =3D &sched_data->lru_runq_head;
>        struct list_head *pos;
>=20
>        /* search a vgpu with pending workload */
>        list_for_each(pos, head) {
>                vgpu_data =3D container_of(pos, struct vgpu_pbs_sched_data,
> 					lru_list);
>                if (!vgpu_has_pending_workload(vgpu_data->vgpu))
>                        continue;
>=20
>                /* find the higher priority vgpu */
>                if (!vgpu ||
> 		(vgpu_data->priority <
> 		((struct vgpu_pbs_sched_data *)
> 		(vgpu->sched_data))->priority))
>                        vgpu =3D vgpu_data->vgpu;
>        }
>=20
>        return vgpu;
> }
>=20
> static void pbs_sched_do_schedule(struct intel_gvt *gvt)
> {
>        struct gvt_sched_data *sched_data =3D gvt->scheduler.sched_data;
>        struct intel_gvt_workload_scheduler *scheduler =3D &gvt->scheduler;
>        struct vgpu_pbs_sched_data *vgpu_data;
>        struct intel_vgpu *vgpu =3D NULL;
>=20
>        mutex_lock(&gvt->sched_lock);
>=20
>        clear_bit(INTEL_GVT_REQUEST_EVENT_SCHED,
> 		(void *)&gvt->service_request);
>=20
>        /* no active vgpu or has already had a target */
>        if (list_empty(&sched_data->lru_runq_head) ||
> 			scheduler->next_vgpu)
>                goto out;
>=20
>        vgpu =3D find_busy_vgpu(sched_data);
>        if (vgpu) {
>                scheduler->next_vgpu =3D vgpu;
>                vgpu_data =3D vgpu->sched_data;
>                vgpu_data->scheduled =3D true;
> 		if (vgpu_data->priority =3D=3D 0)
> 			vgpu_data->priority =3D vgpu->sched_ctl.value;
>                /* Move the last used vGPU to the tail of lru_list */
>                list_del_init(&vgpu_data->lru_list);
>                list_add_tail(&vgpu_data->lru_list,
> 				&sched_data->lru_runq_head);
>        } else {
>                scheduler->next_vgpu =3D gvt->idle_vgpu;
>        }
> out:
>        if (scheduler->next_vgpu)
>                try_to_schedule_next_vgpu(gvt);
>=20
>        mutex_unlock(&gvt->sched_lock);
> }
>=20
> static enum hrtimer_restart pbs_timer_fn(struct hrtimer *timer_data)
> {
>        struct vgpu_pbs_sched_data *vgpu_data;
>=20
>        vgpu_data =3D container_of(timer_data, struct vgpu_pbs_sched_data,
> 				timer);
>=20
>        /* reserve priority 0 for vgpu who is not scheduled too long */
>        if (vgpu_has_pending_workload(vgpu_data->vgpu) &&
> 					!vgpu_data->scheduled)
>                vgpu_data->priority =3D 0;
>=20
>        hrtimer_add_expires_ns(&vgpu_data->timer, vgpu_data->period);
>=20
>        return HRTIMER_RESTART;
> }
>=20
>=20
> > > Signed-off-by: Hang Yuan <hang.yuan@linux.intel.com>
> > > ---
> > >   drivers/gpu/drm/i915/gvt/Makefile              |   2 +-
> > >   drivers/gpu/drm/i915/gvt/gvt.c                 |   2 +-
> > >   drivers/gpu/drm/i915/gvt/gvt.h                 |   3 +-
> > >   drivers/gpu/drm/i915/gvt/sched_policy.c        | 361 +-------------=
-----------
> > >   drivers/gpu/drm/i915/gvt/sched_policy.h        |   1 +
> > >   drivers/gpu/drm/i915/gvt/sched_policy_weight.c | 351 ++++++++++++++=
++++++++++
> > >   drivers/gpu/drm/i915/gvt/sched_policy_weight.h |  32 +++
> > >   drivers/gpu/drm/i915/gvt/vgpu.c                |   4 +-
> > >   drivers/gpu/drm/i915/i915_params.c             |   2 +
> > >   drivers/gpu/drm/i915/i915_params.h             |   3 +-
> > >   10 files changed, 403 insertions(+), 358 deletions(-)
> > >   create mode 100644 drivers/gpu/drm/i915/gvt/sched_policy_weight.c
> > >   create mode 100644 drivers/gpu/drm/i915/gvt/sched_policy_weight.h
> > >=20
> > > diff --git a/drivers/gpu/drm/i915/gvt/Makefile b/drivers/gpu/drm/i915=
/gvt/Makefile
> > > index ea8324a..f180aae 100644
> > > --- a/drivers/gpu/drm/i915/gvt/Makefile
> > > +++ b/drivers/gpu/drm/i915/gvt/Makefile
> > > @@ -3,7 +3,7 @@ GVT_DIR :=3D gvt
> > >   GVT_SOURCE :=3D gvt.o aperture_gm.o handlers.o vgpu.o trace_points.=
o firmware.o \
> > >   	interrupt.o gtt.o cfg_space.o opregion.o mmio.o display.o edid.o \
> > >   	execlist.o scheduler.o sched_policy.o mmio_context.o cmd_parser.o =
debugfs.o \
> > > -	fb_decoder.o dmabuf.o page_track.o
> > > +	fb_decoder.o dmabuf.o page_track.o sched_policy_weight.o
> > >   ccflags-y				+=3D -I $(srctree)/$(src) -I $(srctree)/$(src)/$(GVT_D=
IR)/
> > >   i915-y					+=3D $(addprefix $(GVT_DIR)/, $(GVT_SOURCE))
> > > diff --git a/drivers/gpu/drm/i915/gvt/gvt.c b/drivers/gpu/drm/i915/gv=
t/gvt.c
> > > index cb5fa30..0aeb692 100644
> > > --- a/drivers/gpu/drm/i915/gvt/gvt.c
> > > +++ b/drivers/gpu/drm/i915/gvt/gvt.c
> > > @@ -228,7 +228,7 @@ static int gvt_service_thread(void *data)
> > >   				(void *)&gvt->service_request) ||
> > >   			test_bit(INTEL_GVT_REQUEST_EVENT_SCHED,
> > >   					(void *)&gvt->service_request)) {
> > > -			intel_gvt_schedule(gvt);
> > > +			gvt->scheduler.sched_ops->schedule(gvt);
> > >   		}
> > >   	}
> > > diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gv=
t/gvt.h
> > > index 0081b05..eb66901 100644
> > > --- a/drivers/gpu/drm/i915/gvt/gvt.h
> > > +++ b/drivers/gpu/drm/i915/gvt/gvt.h
> > > @@ -44,6 +44,7 @@
> > >   #include "execlist.h"
> > >   #include "scheduler.h"
> > >   #include "sched_policy.h"
> > > +#include "sched_policy_weight.h"
> > >   #include "mmio_context.h"
> > >   #include "cmd_parser.h"
> > >   #include "fb_decoder.h"
> > > @@ -131,7 +132,7 @@ struct intel_vgpu_display {
> > >   };
> > >   struct vgpu_sched_ctl {
> > > -	int weight;
> > > +	int value;
> > >   };
> > >   enum {
> > > diff --git a/drivers/gpu/drm/i915/gvt/sched_policy.c b/drivers/gpu/dr=
m/i915/gvt/sched_policy.c
> > > index 2369d4a..530931a 100644
> > > --- a/drivers/gpu/drm/i915/gvt/sched_policy.c
> > > +++ b/drivers/gpu/drm/i915/gvt/sched_policy.c
> > > @@ -34,355 +34,18 @@
> > >   #include "i915_drv.h"
> > >   #include "gvt.h"
> > > -static bool vgpu_has_pending_workload(struct intel_vgpu *vgpu)
> > > -{
> > > -	enum intel_engine_id i;
> > > -	struct intel_engine_cs *engine;
> > > -
> > > -	for_each_engine(engine, vgpu->gvt->dev_priv, i) {
> > > -		if (!list_empty(workload_q_head(vgpu, i)))
> > > -			return true;
> > > -	}
> > > -
> > > -	return false;
> > > -}
> > > -
> > > -/* We give 2 seconds higher prio for vGPU during start */
> > > -#define GVT_SCHED_VGPU_PRI_TIME  2
> > > -
> > > -struct vgpu_sched_data {
> > > -	struct list_head lru_list;
> > > -	struct intel_vgpu *vgpu;
> > > -	bool active;
> > > -	bool pri_sched;
> > > -	ktime_t pri_time;
> > > -	ktime_t sched_in_time;
> > > -	ktime_t sched_time;
> > > -	ktime_t left_ts;
> > > -	ktime_t allocated_ts;
> > > -
> > > -	struct vgpu_sched_ctl sched_ctl;
> > > -};
> > > -
> > > -struct gvt_sched_data {
> > > -	struct intel_gvt *gvt;
> > > -	struct hrtimer timer;
> > > -	unsigned long period;
> > > -	struct list_head lru_runq_head;
> > > -	ktime_t expire_time;
> > > -};
> > > -
> > > -static void vgpu_update_timeslice(struct intel_vgpu *vgpu, ktime_t c=
ur_time)
> > > -{
> > > -	ktime_t delta_ts;
> > > -	struct vgpu_sched_data *vgpu_data;
> > > -
> > > -	if (!vgpu || vgpu =3D=3D vgpu->gvt->idle_vgpu)
> > > -		return;
> > > -
> > > -	vgpu_data =3D vgpu->sched_data;
> > > -	delta_ts =3D ktime_sub(cur_time, vgpu_data->sched_in_time);
> > > -	vgpu_data->sched_time =3D ktime_add(vgpu_data->sched_time, delta_ts=
);
> > > -	vgpu_data->left_ts =3D ktime_sub(vgpu_data->left_ts, delta_ts);
> > > -	vgpu_data->sched_in_time =3D cur_time;
> > > -}
> > > -
> > > -#define GVT_TS_BALANCE_PERIOD_MS 100
> > > -#define GVT_TS_BALANCE_STAGE_NUM 10
> > > -
> > > -static void gvt_balance_timeslice(struct gvt_sched_data *sched_data)
> > > -{
> > > -	struct vgpu_sched_data *vgpu_data;
> > > -	struct list_head *pos;
> > > -	static u64 stage_check;
> > > -	int stage =3D stage_check++ % GVT_TS_BALANCE_STAGE_NUM;
> > > -
> > > -	/* The timeslice accumulation reset at stage 0, which is
> > > -	 * allocated again without adding previous debt.
> > > -	 */
> > > -	if (stage =3D=3D 0) {
> > > -		int total_weight =3D 0;
> > > -		ktime_t fair_timeslice;
> > > -
> > > -		list_for_each(pos, &sched_data->lru_runq_head) {
> > > -			vgpu_data =3D container_of(pos, struct vgpu_sched_data, lru_list);
> > > -			total_weight +=3D vgpu_data->sched_ctl.weight;
> > > -		}
> > > -
> > > -		list_for_each(pos, &sched_data->lru_runq_head) {
> > > -			vgpu_data =3D container_of(pos, struct vgpu_sched_data, lru_list);
> > > -			fair_timeslice =3D ktime_divns(ms_to_ktime(GVT_TS_BALANCE_PERIOD_=
MS),
> > > -						     total_weight) * vgpu_data->sched_ctl.weight;
> > > -
> > > -			vgpu_data->allocated_ts =3D fair_timeslice;
> > > -			vgpu_data->left_ts =3D vgpu_data->allocated_ts;
> > > -		}
> > > -	} else {
> > > -		list_for_each(pos, &sched_data->lru_runq_head) {
> > > -			vgpu_data =3D container_of(pos, struct vgpu_sched_data, lru_list);
> > > -
> > > -			/* timeslice for next 100ms should add the left/debt
> > > -			 * slice of previous stages.
> > > -			 */
> > > -			vgpu_data->left_ts +=3D vgpu_data->allocated_ts;
> > > -		}
> > > -	}
> > > -}
> > > -
> > > -static void try_to_schedule_next_vgpu(struct intel_gvt *gvt)
> > > -{
> > > -	struct intel_gvt_workload_scheduler *scheduler =3D &gvt->scheduler;
> > > -	enum intel_engine_id i;
> > > -	struct intel_engine_cs *engine;
> > > -	struct vgpu_sched_data *vgpu_data;
> > > -	ktime_t cur_time;
> > > -
> > > -	/* no need to schedule if next_vgpu is the same with current_vgpu,
> > > -	 * let scheduler chose next_vgpu again by setting it to NULL.
> > > -	 */
> > > -	if (scheduler->next_vgpu =3D=3D scheduler->current_vgpu) {
> > > -		scheduler->next_vgpu =3D NULL;
> > > -		return;
> > > -	}
> > > -
> > > -	/*
> > > -	 * after the flag is set, workload dispatch thread will
> > > -	 * stop dispatching workload for current vgpu
> > > -	 */
> > > -	scheduler->need_reschedule =3D true;
> > > -
> > > -	/* still have uncompleted workload? */
> > > -	for_each_engine(engine, gvt->dev_priv, i) {
> > > -		if (scheduler->current_workload[i])
> > > -			return;
> > > -	}
> > > -
> > > -	cur_time =3D ktime_get();
> > > -	vgpu_update_timeslice(scheduler->current_vgpu, cur_time);
> > > -	vgpu_data =3D scheduler->next_vgpu->sched_data;
> > > -	vgpu_data->sched_in_time =3D cur_time;
> > > -
> > > -	/* switch current vgpu */
> > > -	scheduler->current_vgpu =3D scheduler->next_vgpu;
> > > -	scheduler->next_vgpu =3D NULL;
> > > -
> > > -	scheduler->need_reschedule =3D false;
> > > -
> > > -	/* wake up workload dispatch thread */
> > > -	for_each_engine(engine, gvt->dev_priv, i)
> > > -		wake_up(&scheduler->waitq[i]);
> > > -}
> > > -
> > > -static struct intel_vgpu *find_busy_vgpu(struct gvt_sched_data *sche=
d_data)
> > > -{
> > > -	struct vgpu_sched_data *vgpu_data;
> > > -	struct intel_vgpu *vgpu =3D NULL;
> > > -	struct list_head *head =3D &sched_data->lru_runq_head;
> > > -	struct list_head *pos;
> > > -
> > > -	/* search a vgpu with pending workload */
> > > -	list_for_each(pos, head) {
> > > -
> > > -		vgpu_data =3D container_of(pos, struct vgpu_sched_data, lru_list);
> > > -		if (!vgpu_has_pending_workload(vgpu_data->vgpu))
> > > -			continue;
> > > -
> > > -		if (vgpu_data->pri_sched) {
> > > -			if (ktime_before(ktime_get(), vgpu_data->pri_time)) {
> > > -				vgpu =3D vgpu_data->vgpu;
> > > -				break;
> > > -			} else
> > > -				vgpu_data->pri_sched =3D false;
> > > -		}
> > > -
> > > -		/* Return the vGPU only if it has time slice left */
> > > -		if (vgpu_data->left_ts > 0) {
> > > -			vgpu =3D vgpu_data->vgpu;
> > > -			break;
> > > -		}
> > > -	}
> > > -
> > > -	return vgpu;
> > > -}
> > > -
> > > -/* in nanosecond */
> > > -#define GVT_DEFAULT_TIME_SLICE 1000000
> > > -
> > > -static void tbs_sched_func(struct gvt_sched_data *sched_data)
> > > +int intel_gvt_init_sched_policy(struct intel_gvt *gvt)
> > >   {
> > > -	struct intel_gvt *gvt =3D sched_data->gvt;
> > > -	struct intel_gvt_workload_scheduler *scheduler =3D &gvt->scheduler;
> > > -	struct vgpu_sched_data *vgpu_data;
> > > -	struct intel_vgpu *vgpu =3D NULL;
> > > -
> > > -	/* no active vgpu or has already had a target */
> > > -	if (list_empty(&sched_data->lru_runq_head) || scheduler->next_vgpu)
> > > -		goto out;
> > > +	int ret;
> > > -	vgpu =3D find_busy_vgpu(sched_data);
> > > -	if (vgpu) {
> > > -		scheduler->next_vgpu =3D vgpu;
> > > -		vgpu_data =3D vgpu->sched_data;
> > > -		if (!vgpu_data->pri_sched) {
> > > -			/* Move the last used vGPU to the tail of lru_list */
> > > -			list_del_init(&vgpu_data->lru_list);
> > > -			list_add_tail(&vgpu_data->lru_list,
> > > -				      &sched_data->lru_runq_head);
> > > -		}
> > > +	if (!strcmp(i915_modparams.gvt_scheduler_policy, "weight")) {
> > > +		gvt->scheduler.sched_ops =3D &tbs_schedule_ops;
> > >   	} else {
> > > -		scheduler->next_vgpu =3D gvt->idle_vgpu;
> > > +		gvt_err("unknown gvt scheduler policy %s\n",
> > > +			i915_modparams.gvt_scheduler_policy);
> > >   	}
> > > -out:
> > > -	if (scheduler->next_vgpu)
> > > -		try_to_schedule_next_vgpu(gvt);
> > > -}
> > > -
> > > -void intel_gvt_schedule(struct intel_gvt *gvt)
> > > -{
> > > -	struct gvt_sched_data *sched_data =3D gvt->scheduler.sched_data;
> > > -	ktime_t cur_time;
> > >   	mutex_lock(&gvt->sched_lock);
> > > -	cur_time =3D ktime_get();
> > > -
> > > -	if (test_and_clear_bit(INTEL_GVT_REQUEST_SCHED,
> > > -				(void *)&gvt->service_request)) {
> > > -		if (cur_time >=3D sched_data->expire_time) {
> > > -			gvt_balance_timeslice(sched_data);
> > > -			sched_data->expire_time =3D ktime_add_ms(
> > > -				cur_time, GVT_TS_BALANCE_PERIOD_MS);
> > > -		}
> > > -	}
> > > -	clear_bit(INTEL_GVT_REQUEST_EVENT_SCHED, (void *)&gvt->service_requ=
est);
> > > -
> > > -	vgpu_update_timeslice(gvt->scheduler.current_vgpu, cur_time);
> > > -	tbs_sched_func(sched_data);
> > > -
> > > -	mutex_unlock(&gvt->sched_lock);
> > > -}
> > > -
> > > -static enum hrtimer_restart tbs_timer_fn(struct hrtimer *timer_data)
> > > -{
> > > -	struct gvt_sched_data *data;
> > > -
> > > -	data =3D container_of(timer_data, struct gvt_sched_data, timer);
> > > -
> > > -	intel_gvt_request_service(data->gvt, INTEL_GVT_REQUEST_SCHED);
> > > -
> > > -	hrtimer_add_expires_ns(&data->timer, data->period);
> > > -
> > > -	return HRTIMER_RESTART;
> > > -}
> > > -
> > > -static int tbs_sched_init(struct intel_gvt *gvt)
> > > -{
> > > -	struct intel_gvt_workload_scheduler *scheduler =3D
> > > -		&gvt->scheduler;
> > > -
> > > -	struct gvt_sched_data *data;
> > > -
> > > -	data =3D kzalloc(sizeof(*data), GFP_KERNEL);
> > > -	if (!data)
> > > -		return -ENOMEM;
> > > -
> > > -	INIT_LIST_HEAD(&data->lru_runq_head);
> > > -	hrtimer_init(&data->timer, CLOCK_MONOTONIC, HRTIMER_MODE_ABS);
> > > -	data->timer.function =3D tbs_timer_fn;
> > > -	data->period =3D GVT_DEFAULT_TIME_SLICE;
> > > -	data->gvt =3D gvt;
> > > -
> > > -	scheduler->sched_data =3D data;
> > > -
> > > -	return 0;
> > > -}
> > > -
> > > -static void tbs_sched_clean(struct intel_gvt *gvt)
> > > -{
> > > -	struct intel_gvt_workload_scheduler *scheduler =3D
> > > -		&gvt->scheduler;
> > > -	struct gvt_sched_data *data =3D scheduler->sched_data;
> > > -
> > > -	hrtimer_cancel(&data->timer);
> > > -
> > > -	kfree(data);
> > > -	scheduler->sched_data =3D NULL;
> > > -}
> > > -
> > > -static int tbs_sched_init_vgpu(struct intel_vgpu *vgpu)
> > > -{
> > > -	struct vgpu_sched_data *data;
> > > -
> > > -	data =3D kzalloc(sizeof(*data), GFP_KERNEL);
> > > -	if (!data)
> > > -		return -ENOMEM;
> > > -
> > > -	data->sched_ctl.weight =3D vgpu->sched_ctl.weight;
> > > -	data->vgpu =3D vgpu;
> > > -	INIT_LIST_HEAD(&data->lru_list);
> > > -
> > > -	vgpu->sched_data =3D data;
> > > -
> > > -	return 0;
> > > -}
> > > -
> > > -static void tbs_sched_clean_vgpu(struct intel_vgpu *vgpu)
> > > -{
> > > -	struct intel_gvt *gvt =3D vgpu->gvt;
> > > -	struct gvt_sched_data *sched_data =3D gvt->scheduler.sched_data;
> > > -
> > > -	kfree(vgpu->sched_data);
> > > -	vgpu->sched_data =3D NULL;
> > > -
> > > -	/* this vgpu id has been removed */
> > > -	if (idr_is_empty(&gvt->vgpu_idr))
> > > -		hrtimer_cancel(&sched_data->timer);
> > > -}
> > > -
> > > -static void tbs_sched_start_schedule(struct intel_vgpu *vgpu)
> > > -{
> > > -	struct gvt_sched_data *sched_data =3D vgpu->gvt->scheduler.sched_da=
ta;
> > > -	struct vgpu_sched_data *vgpu_data =3D vgpu->sched_data;
> > > -	ktime_t now;
> > > -
> > > -	if (!list_empty(&vgpu_data->lru_list))
> > > -		return;
> > > -
> > > -	now =3D ktime_get();
> > > -	vgpu_data->pri_time =3D ktime_add(now,
> > > -					ktime_set(GVT_SCHED_VGPU_PRI_TIME, 0));
> > > -	vgpu_data->pri_sched =3D true;
> > > -
> > > -	list_add(&vgpu_data->lru_list, &sched_data->lru_runq_head);
> > > -
> > > -	if (!hrtimer_active(&sched_data->timer))
> > > -		hrtimer_start(&sched_data->timer, ktime_add_ns(ktime_get(),
> > > -			sched_data->period), HRTIMER_MODE_ABS);
> > > -	vgpu_data->active =3D true;
> > > -}
> > > -
> > > -static void tbs_sched_stop_schedule(struct intel_vgpu *vgpu)
> > > -{
> > > -	struct vgpu_sched_data *vgpu_data =3D vgpu->sched_data;
> > > -
> > > -	list_del_init(&vgpu_data->lru_list);
> > > -	vgpu_data->active =3D false;
> > > -}
> > > -
> > > -static struct intel_gvt_sched_policy_ops tbs_schedule_ops =3D {
> > > -	.init =3D tbs_sched_init,
> > > -	.clean =3D tbs_sched_clean,
> > > -	.init_vgpu =3D tbs_sched_init_vgpu,
> > > -	.clean_vgpu =3D tbs_sched_clean_vgpu,
> > > -	.start_schedule =3D tbs_sched_start_schedule,
> > > -	.stop_schedule =3D tbs_sched_stop_schedule,
> > > -};
> > > -
> > > -int intel_gvt_init_sched_policy(struct intel_gvt *gvt)
> > > -{
> > > -	int ret;
> > > -
> > > -	mutex_lock(&gvt->sched_lock);
> > > -	gvt->scheduler.sched_ops =3D &tbs_schedule_ops;
> > >   	ret =3D gvt->scheduler.sched_ops->init(gvt);
> > >   	mutex_unlock(&gvt->sched_lock);
> > > @@ -423,13 +86,9 @@ void intel_vgpu_clean_sched_policy(struct intel_v=
gpu *vgpu)
> > >   void intel_vgpu_start_schedule(struct intel_vgpu *vgpu)
> > >   {
> > > -	struct vgpu_sched_data *vgpu_data =3D vgpu->sched_data;
> > > -
> > >   	mutex_lock(&vgpu->gvt->sched_lock);
> > > -	if (!vgpu_data->active) {
> > > -		gvt_dbg_core("vgpu%d: start schedule\n", vgpu->id);
> > > -		vgpu->gvt->scheduler.sched_ops->start_schedule(vgpu);
> > > -	}
> > > +	gvt_dbg_core("vgpu%d: start schedule\n", vgpu->id);
> > > +	vgpu->gvt->scheduler.sched_ops->start_schedule(vgpu);
> > >   	mutex_unlock(&vgpu->gvt->sched_lock);
> > >   }
> > > @@ -445,12 +104,8 @@ void intel_vgpu_stop_schedule(struct intel_vgpu =
*vgpu)
> > >   	struct intel_gvt_workload_scheduler *scheduler =3D
> > >   		&vgpu->gvt->scheduler;
> > >   	int ring_id;
> > > -	struct vgpu_sched_data *vgpu_data =3D vgpu->sched_data;
> > >   	struct drm_i915_private *dev_priv =3D vgpu->gvt->dev_priv;
> > > -	if (!vgpu_data->active)
> > > -		return;
> > > -
> > >   	gvt_dbg_core("vgpu%d: stop schedule\n", vgpu->id);
> > >   	mutex_lock(&vgpu->gvt->sched_lock);
> > > diff --git a/drivers/gpu/drm/i915/gvt/sched_policy.h b/drivers/gpu/dr=
m/i915/gvt/sched_policy.h
> > > index 3dacdad..a4953c2 100644
> > > --- a/drivers/gpu/drm/i915/gvt/sched_policy.h
> > > +++ b/drivers/gpu/drm/i915/gvt/sched_policy.h
> > > @@ -44,6 +44,7 @@ struct intel_gvt_sched_policy_ops {
> > >   	void (*clean_vgpu)(struct intel_vgpu *vgpu);
> > >   	void (*start_schedule)(struct intel_vgpu *vgpu);
> > >   	void (*stop_schedule)(struct intel_vgpu *vgpu);
> > > +	void (*schedule)(struct intel_gvt *gvt);
> > >   };
> > >   void intel_gvt_schedule(struct intel_gvt *gvt);
> > > diff --git a/drivers/gpu/drm/i915/gvt/sched_policy_weight.c b/drivers=
/gpu/drm/i915/gvt/sched_policy_weight.c
> > > new file mode 100644
> > > index 0000000..8aa15f0
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/i915/gvt/sched_policy_weight.c
> > > @@ -0,0 +1,351 @@
> > > +/*
> > > + * Copyright(c) 2011-2016 Intel Corporation. All rights reserved.
> > > + *
> > > + * Permission is hereby granted, free of charge, to any person obtai=
ning a
> > > + * copy of this software and associated documentation files (the "So=
ftware"),
> > > + * to deal in the Software without restriction, including without li=
mitation
> > > + * the rights to use, copy, modify, merge, publish, distribute, subl=
icense,
> > > + * and/or sell copies of the Software, and to permit persons to whom=
 the
> > > + * Software is furnished to do so, subject to the following conditio=
ns:
> > > + *
> > > + * The above copyright notice and this permission notice (including =
the next
> > > + * paragraph) shall be included in all copies or substantial portion=
s of the
> > > + * Software.
> > > + *
> > > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, E=
XPRESS OR
> > > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTA=
BILITY,
> > > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVEN=
T SHALL
> > > + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES=
 OR OTHER
> > > + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, A=
RISING FROM,
> > > + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEA=
LINGS IN THE
> > > + * SOFTWARE.
> > > + *
> > > + * Authors:
> > > + *    Anhua Xu
> > > + *    Kevin Tian <kevin.tian@intel.com>
> > > + *
> > > + * Contributors:
> > > + *    Min He <min.he@intel.com>
> > > + *    Bing Niu <bing.niu@intel.com>
> > > + *    Zhi Wang <zhi.a.wang@intel.com>
> > > + *
> > > + */
> > > +
> > > +#include "i915_drv.h"
> > > +#include "gvt.h"
> > > +
> > > +static bool vgpu_has_pending_workload(struct intel_vgpu *vgpu)
> > > +{
> > > +	enum intel_engine_id i;
> > > +	struct intel_engine_cs *engine;
> > > +
> > > +	for_each_engine(engine, vgpu->gvt->dev_priv, i) {
> > > +		if (!list_empty(workload_q_head(vgpu, i)))
> > > +			return true;
> > > +	}
> > > +
> > > +	return false;
> > > +}
> > > +
> > > +static void vgpu_update_timeslice(struct intel_vgpu *vgpu, ktime_t c=
ur_time)
> > > +{
> > > +	ktime_t delta_ts;
> > > +	struct vgpu_tbs_sched_data *vgpu_data;
> > > +
> > > +	if (!vgpu || vgpu =3D=3D vgpu->gvt->idle_vgpu)
> > > +		return;
> > > +
> > > +	vgpu_data =3D vgpu->sched_data;
> > > +	delta_ts =3D ktime_sub(cur_time, vgpu_data->sched_in_time);
> > > +	vgpu_data->sched_time =3D ktime_add(vgpu_data->sched_time, delta_ts=
);
> > > +	vgpu_data->left_ts =3D ktime_sub(vgpu_data->left_ts, delta_ts);
> > > +	vgpu_data->sched_in_time =3D cur_time;
> > > +}
> > > +
> > > +static void gvt_balance_timeslice(struct gvt_tbs_sched_data *sched_d=
ata)
> > > +{
> > > +	struct vgpu_tbs_sched_data *vgpu_data;
> > > +	struct list_head *pos;
> > > +	static u64 stage_check;
> > > +	int stage =3D stage_check++ % GVT_TS_BALANCE_STAGE_NUM;
> > > +
> > > +	/* The timeslice accumulation reset at stage 0, which is
> > > +	 * allocated again without adding previous debt.
> > > +	 */
> > > +	if (stage =3D=3D 0) {
> > > +		int total_weight =3D 0;
> > > +		ktime_t fair_timeslice;
> > > +
> > > +		list_for_each(pos, &sched_data->lru_runq_head) {
> > > +			vgpu_data =3D container_of(pos, struct vgpu_tbs_sched_data, lru_l=
ist);
> > > +			total_weight +=3D vgpu_data->weight;
> > > +		}
> > > +
> > > +		list_for_each(pos, &sched_data->lru_runq_head) {
> > > +			vgpu_data =3D container_of(pos, struct vgpu_tbs_sched_data, lru_l=
ist);
> > > +			fair_timeslice =3D ktime_divns(ms_to_ktime(GVT_TS_BALANCE_PERIOD_=
MS),
> > > +						     total_weight) * vgpu_data->weight;
> > > +
> > > +			vgpu_data->allocated_ts =3D fair_timeslice;
> > > +			vgpu_data->left_ts =3D vgpu_data->allocated_ts;
> > > +		}
> > > +	} else {
> > > +		list_for_each(pos, &sched_data->lru_runq_head) {
> > > +			vgpu_data =3D container_of(pos, struct vgpu_tbs_sched_data, lru_l=
ist);
> > > +
> > > +			/* timeslice for next 100ms should add the left/debt
> > > +			 * slice of previous stages.
> > > +			 */
> > > +			vgpu_data->left_ts +=3D vgpu_data->allocated_ts;
> > > +		}
> > > +	}
> > > +}
> > > +
> > > +static void try_to_schedule_next_vgpu(struct intel_gvt *gvt)
> > > +{
> > > +	struct intel_gvt_workload_scheduler *scheduler =3D &gvt->scheduler;
> > > +	enum intel_engine_id i;
> > > +	struct intel_engine_cs *engine;
> > > +	struct vgpu_tbs_sched_data *vgpu_data;
> > > +	ktime_t cur_time;
> > > +
> > > +	/* no need to schedule if next_vgpu is the same with current_vgpu,
> > > +	 * let scheduler chose next_vgpu again by setting it to NULL.
> > > +	 */
> > > +	if (scheduler->next_vgpu =3D=3D scheduler->current_vgpu) {
> > > +		scheduler->next_vgpu =3D NULL;
> > > +		return;
> > > +	}
> > > +
> > > +	/*
> > > +	 * after the flag is set, workload dispatch thread will
> > > +	 * stop dispatching workload for current vgpu
> > > +	 */
> > > +	scheduler->need_reschedule =3D true;
> > > +
> > > +	/* still have uncompleted workload? */
> > > +	for_each_engine(engine, gvt->dev_priv, i) {
> > > +		if (scheduler->current_workload[i])
> > > +			return;
> > > +	}
> > > +
> > > +	cur_time =3D ktime_get();
> > > +	vgpu_update_timeslice(scheduler->current_vgpu, cur_time);
> > > +	vgpu_data =3D scheduler->next_vgpu->sched_data;
> > > +	vgpu_data->sched_in_time =3D cur_time;
> > > +
> > > +	/* switch current vgpu */
> > > +	scheduler->current_vgpu =3D scheduler->next_vgpu;
> > > +	scheduler->next_vgpu =3D NULL;
> > > +
> > > +	scheduler->need_reschedule =3D false;
> > > +
> > > +	/* wake up workload dispatch thread */
> > > +	for_each_engine(engine, gvt->dev_priv, i)
> > > +		wake_up(&scheduler->waitq[i]);
> > > +}
> > > +
> > > +static struct intel_vgpu *find_busy_vgpu(struct gvt_tbs_sched_data *=
sched_data)
> > > +{
> > > +	struct vgpu_tbs_sched_data *vgpu_data;
> > > +	struct intel_vgpu *vgpu =3D NULL;
> > > +	struct list_head *head =3D &sched_data->lru_runq_head;
> > > +	struct list_head *pos;
> > > +
> > > +	/* search a vgpu with pending workload */
> > > +	list_for_each(pos, head) {
> > > +
> > > +		vgpu_data =3D container_of(pos, struct vgpu_tbs_sched_data, lru_li=
st);
> > > +		if (!vgpu_has_pending_workload(vgpu_data->vgpu))
> > > +			continue;
> > > +
> > > +		if (vgpu_data->pri_sched) {
> > > +			if (ktime_before(ktime_get(), vgpu_data->pri_time)) {
> > > +				vgpu =3D vgpu_data->vgpu;
> > > +				break;
> > > +			} else
> > > +				vgpu_data->pri_sched =3D false;
> > > +		}
> > > +
> > > +		/* Return the vGPU only if it has time slice left */
> > > +		if (vgpu_data->left_ts > 0) {
> > > +			vgpu =3D vgpu_data->vgpu;
> > > +			break;
> > > +		}
> > > +	}
> > > +
> > > +	return vgpu;
> > > +}
> > > +
> > > +static void tbs_sched_func(struct gvt_tbs_sched_data *sched_data)
> > > +{
> > > +	struct intel_gvt *gvt =3D sched_data->gvt;
> > > +	struct intel_gvt_workload_scheduler *scheduler =3D &gvt->scheduler;
> > > +	struct vgpu_tbs_sched_data *vgpu_data;
> > > +	struct intel_vgpu *vgpu =3D NULL;
> > > +
> > > +	/* no active vgpu or has already had a target */
> > > +	if (list_empty(&sched_data->lru_runq_head) || scheduler->next_vgpu)
> > > +		goto out;
> > > +
> > > +	vgpu =3D find_busy_vgpu(sched_data);
> > > +	if (vgpu) {
> > > +		scheduler->next_vgpu =3D vgpu;
> > > +		vgpu_data =3D vgpu->sched_data;
> > > +		if (!vgpu_data->pri_sched) {
> > > +			/* Move the last used vGPU to the tail of lru_list */
> > > +			list_del_init(&vgpu_data->lru_list);
> > > +			list_add_tail(&vgpu_data->lru_list,
> > > +				      &sched_data->lru_runq_head);
> > > +		}
> > > +	} else {
> > > +		scheduler->next_vgpu =3D gvt->idle_vgpu;
> > > +	}
> > > +out:
> > > +	if (scheduler->next_vgpu)
> > > +		try_to_schedule_next_vgpu(gvt);
> > > +}
> > > +
> > > +static void tbs_sched_do_schedule(struct intel_gvt *gvt)
> > > +{
> > > +	struct gvt_tbs_sched_data *sched_data =3D gvt->scheduler.sched_data;
> > > +	ktime_t cur_time;
> > > +
> > > +	mutex_lock(&gvt->sched_lock);
> > > +	cur_time =3D ktime_get();
> > > +
> > > +	if (test_and_clear_bit(INTEL_GVT_REQUEST_SCHED,
> > > +				(void *)&gvt->service_request)) {
> > > +		if (cur_time >=3D sched_data->expire_time) {
> > > +			gvt_balance_timeslice(sched_data);
> > > +			sched_data->expire_time =3D ktime_add_ms(
> > > +				cur_time, GVT_TS_BALANCE_PERIOD_MS);
> > > +		}
> > > +	}
> > > +	clear_bit(INTEL_GVT_REQUEST_EVENT_SCHED, (void *)&gvt->service_requ=
est);
> > > +
> > > +	vgpu_update_timeslice(gvt->scheduler.current_vgpu, cur_time);
> > > +	tbs_sched_func(sched_data);
> > > +
> > > +	mutex_unlock(&gvt->sched_lock);
> > > +}
> > > +
> > > +static enum hrtimer_restart tbs_timer_fn(struct hrtimer *timer_data)
> > > +{
> > > +	struct gvt_tbs_sched_data *data;
> > > +
> > > +	data =3D container_of(timer_data, struct gvt_tbs_sched_data, timer);
> > > +
> > > +	intel_gvt_request_service(data->gvt, INTEL_GVT_REQUEST_SCHED);
> > > +
> > > +	hrtimer_add_expires_ns(&data->timer, data->period);
> > > +
> > > +	return HRTIMER_RESTART;
> > > +}
> > > +
> > > +static int tbs_sched_init(struct intel_gvt *gvt)
> > > +{
> > > +	struct intel_gvt_workload_scheduler *scheduler =3D
> > > +		&gvt->scheduler;
> > > +
> > > +	struct gvt_tbs_sched_data *data;
> > > +
> > > +	data =3D kzalloc(sizeof(*data), GFP_KERNEL);
> > > +	if (!data)
> > > +		return -ENOMEM;
> > > +
> > > +	INIT_LIST_HEAD(&data->lru_runq_head);
> > > +	hrtimer_init(&data->timer, CLOCK_MONOTONIC, HRTIMER_MODE_ABS);
> > > +	data->timer.function =3D tbs_timer_fn;
> > > +	data->period =3D GVT_DEFAULT_TIME_SLICE;
> > > +	data->gvt =3D gvt;
> > > +
> > > +	scheduler->sched_data =3D data;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static void tbs_sched_clean(struct intel_gvt *gvt)
> > > +{
> > > +	struct intel_gvt_workload_scheduler *scheduler =3D
> > > +		&gvt->scheduler;
> > > +	struct gvt_tbs_sched_data *data =3D scheduler->sched_data;
> > > +
> > > +	hrtimer_cancel(&data->timer);
> > > +
> > > +	kfree(data);
> > > +	scheduler->sched_data =3D NULL;
> > > +}
> > > +
> > > +static int tbs_sched_init_vgpu(struct intel_vgpu *vgpu)
> > > +{
> > > +	struct vgpu_tbs_sched_data *data;
> > > +
> > > +	data =3D kzalloc(sizeof(*data), GFP_KERNEL);
> > > +	if (!data)
> > > +		return -ENOMEM;
> > > +
> > > +	data->weight =3D vgpu->sched_ctl.value;
> > > +	data->vgpu =3D vgpu;
> > > +	INIT_LIST_HEAD(&data->lru_list);
> > > +
> > > +	vgpu->sched_data =3D data;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static void tbs_sched_clean_vgpu(struct intel_vgpu *vgpu)
> > > +{
> > > +	struct intel_gvt *gvt =3D vgpu->gvt;
> > > +	struct gvt_tbs_sched_data *sched_data =3D gvt->scheduler.sched_data;
> > > +
> > > +	kfree(vgpu->sched_data);
> > > +	vgpu->sched_data =3D NULL;
> > > +
> > > +	/* this vgpu id has been removed */
> > > +	if (idr_is_empty(&gvt->vgpu_idr))
> > > +		hrtimer_cancel(&sched_data->timer);
> > > +}
> > > +
> > > +static void tbs_sched_start_schedule(struct intel_vgpu *vgpu)
> > > +{
> > > +	struct gvt_tbs_sched_data *sched_data =3D vgpu->gvt->scheduler.sche=
d_data;
> > > +	struct vgpu_tbs_sched_data *vgpu_data =3D vgpu->sched_data;
> > > +	ktime_t now;
> > > +
> > > +	if (!list_empty(&vgpu_data->lru_list) || vgpu_data->active)
> > > +		return;
> > > +
> > > +	now =3D ktime_get();
> > > +	vgpu_data->pri_time =3D ktime_add(now,
> > > +					ktime_set(GVT_SCHED_VGPU_PRI_TIME, 0));
> > > +	vgpu_data->pri_sched =3D true;
> > > +
> > > +	list_add(&vgpu_data->lru_list, &sched_data->lru_runq_head);
> > > +
> > > +	if (!hrtimer_active(&sched_data->timer))
> > > +		hrtimer_start(&sched_data->timer, ktime_add_ns(ktime_get(),
> > > +			sched_data->period), HRTIMER_MODE_ABS);
> > > +	vgpu_data->active =3D true;
> > > +}
> > > +
> > > +static void tbs_sched_stop_schedule(struct intel_vgpu *vgpu)
> > > +{
> > > +	struct vgpu_tbs_sched_data *vgpu_data =3D vgpu->sched_data;
> > > +
> > > +	if (!vgpu_data->active)
> > > +		return;
> > > +
> > > +	list_del_init(&vgpu_data->lru_list);
> > > +	vgpu_data->active =3D false;
> > > +}
> > > +
> > > +struct intel_gvt_sched_policy_ops tbs_schedule_ops =3D {
> > > +	.init =3D tbs_sched_init,
> > > +	.clean =3D tbs_sched_clean,
> > > +	.init_vgpu =3D tbs_sched_init_vgpu,
> > > +	.clean_vgpu =3D tbs_sched_clean_vgpu,
> > > +	.start_schedule =3D tbs_sched_start_schedule,
> > > +	.stop_schedule =3D tbs_sched_stop_schedule,
> > > +	.schedule =3D tbs_sched_do_schedule,
> > > +};
> > > diff --git a/drivers/gpu/drm/i915/gvt/sched_policy_weight.h b/drivers=
/gpu/drm/i915/gvt/sched_policy_weight.h
> > > new file mode 100644
> > > index 0000000..b32a71f
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/i915/gvt/sched_policy_weight.h
> > > @@ -0,0 +1,32 @@
> > > +/* We give 2 seconds higher prio for vGPU during start */
> > > +#define GVT_SCHED_VGPU_PRI_TIME  2
> > > +
> > > +#define GVT_TS_BALANCE_PERIOD_MS 100
> > > +#define GVT_TS_BALANCE_STAGE_NUM 10
> > > +
> > > +/* in nanosecond */
> > > +#define GVT_DEFAULT_TIME_SLICE 1000000
> > > +
> > > +struct vgpu_tbs_sched_data {
> > > +	struct list_head lru_list;
> > > +	struct intel_vgpu *vgpu;
> > > +	bool active;
> > > +	bool pri_sched;
> > > +	ktime_t pri_time;
> > > +	ktime_t sched_in_time;
> > > +	ktime_t sched_time;
> > > +	ktime_t left_ts;
> > > +	ktime_t allocated_ts;
> > > +
> > > +	int weight;
> > > +};
> > > +
> > > +struct gvt_tbs_sched_data {
> > > +	struct intel_gvt *gvt;
> > > +	struct hrtimer timer;
> > > +	unsigned long period;
> > > +	struct list_head lru_runq_head;
> > > +	ktime_t expire_time;
> > > +};
> > > +
> > > +extern struct intel_gvt_sched_policy_ops tbs_schedule_ops;
> > > diff --git a/drivers/gpu/drm/i915/gvt/vgpu.c b/drivers/gpu/drm/i915/g=
vt/vgpu.c
> > > index 85bd9bf..b1b2deb 100644
> > > --- a/drivers/gpu/drm/i915/gvt/vgpu.c
> > > +++ b/drivers/gpu/drm/i915/gvt/vgpu.c
> > > @@ -378,7 +378,9 @@ static struct intel_vgpu *__intel_gvt_create_vgpu=
(struct intel_gvt *gvt,
> > >   	vgpu->id =3D ret;
> > >   	vgpu->handle =3D param->handle;
> > >   	vgpu->gvt =3D gvt;
> > > -	vgpu->sched_ctl.weight =3D param->weight;
> > > +	if (!strcmp(i915_modparams.gvt_scheduler_policy, "weight")) {
> > > +		vgpu->sched_ctl.value =3D param->weight;
> > > +	}
> > >   	mutex_init(&vgpu->vgpu_lock);
> > >   	mutex_init(&vgpu->dmabuf_lock);
> > >   	INIT_LIST_HEAD(&vgpu->dmabuf_obj_list_head);
> > > diff --git a/drivers/gpu/drm/i915/i915_params.c b/drivers/gpu/drm/i91=
5/i915_params.c
> > > index 1dd1f36..bb90bf8 100644
> > > --- a/drivers/gpu/drm/i915/i915_params.c
> > > +++ b/drivers/gpu/drm/i915/i915_params.c
> > > @@ -177,6 +177,8 @@ i915_param_named(enable_dpcd_backlight, int, 0600,
> > >   #if IS_ENABLED(CONFIG_DRM_I915_GVT)
> > >   i915_param_named(enable_gvt, bool, 0400,
> > >   	"Enable support for Intel GVT-g graphics virtualization host suppo=
rt(default:false)");
> > > +i915_param_named(gvt_scheduler_policy, charp, 0400,
> > > +	"Select GVT-g scheduler policy, weight (default: weight)");
> > >   #endif
> > >   #if IS_ENABLED(CONFIG_DRM_I915_UNSTABLE_FAKE_LMEM)
> > > diff --git a/drivers/gpu/drm/i915/i915_params.h b/drivers/gpu/drm/i91=
5/i915_params.h
> > > index 31b88f2..8c63c49 100644
> > > --- a/drivers/gpu/drm/i915/i915_params.h
> > > +++ b/drivers/gpu/drm/i915/i915_params.h
> > > @@ -78,7 +78,8 @@ struct drm_printer;
> > >   	param(bool, verbose_state_checks, true) \
> > >   	param(bool, nuclear_pageflip, false) \
> > >   	param(bool, enable_dp_mst, true) \
> > > -	param(bool, enable_gvt, false)
> > > +	param(bool, enable_gvt, false) \
> > > +	param(char *, gvt_scheduler_policy, "weight")
> > >   #define MEMBER(T, member, ...) T member;
> > >   struct i915_params {
> > > --=20
> > > 2.7.4
> > >=20
> > > _______________________________________________
> > > intel-gvt-dev mailing list
> > > intel-gvt-dev@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
> >=20
>=20

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--kjzasy1UhXmRStS5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXfm8lAAKCRCxBBozTXgY
JxsMAJ92aJEbARScku0d00oxOeRYf4UyjACdFOe3rZMwQUzQbHs4iZ2gBk8AyZU=
=eKoG
-----END PGP SIGNATURE-----

--kjzasy1UhXmRStS5--

--===============0184176633==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0184176633==--
