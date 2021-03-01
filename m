Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A783276D2
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  1 Mar 2021 06:05:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 074CB89F73;
	Mon,  1 Mar 2021 05:05:21 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B21889F73
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  1 Mar 2021 05:05:20 +0000 (UTC)
IronPort-SDR: 5l+v1L2Htg8BrfTyRNlxJjSKgxKkHpSy0Z7c48ZQUqXmf4PZ0kHC5jnZwDGohILplvldosxcu4
 IDUy6ZtKTq6g==
X-IronPort-AV: E=McAfee;i="6000,8403,9909"; a="250412029"
X-IronPort-AV: E=Sophos;i="5.81,214,1610438400"; d="scan'208";a="250412029"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2021 21:05:19 -0800
IronPort-SDR: OZWwlNT6dbRTyX2J0P1cyPuDgdVCjjAl6GFx431DeOs+rN0D4ghLk2kiYHB5bvWOB8DEz111iq
 +KNGlOaKbICA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,214,1610438400"; d="scan'208";a="595234549"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by fmsmga006.fm.intel.com with ESMTP; 28 Feb 2021 21:05:18 -0800
Date: Mon, 1 Mar 2021 12:49:08 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Colin Xu <colin.xu@intel.com>
Subject: Re: [PATCH v2 2/2] drm/i915/gvt: Refactor GVT vblank emulator for
 vGPU virtual display
Message-ID: <20210301044908.GR1551@zhen-hp.sh.intel.com>
References: <20210226044630.284269-1-colin.xu@intel.com>
 <20210301032827.GQ1551@zhen-hp.sh.intel.com>
 <alpine.LNX.2.22.419.2103011233100.14563@coxu-arch-shz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.LNX.2.22.419.2103011233100.14563@coxu-arch-shz>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On 2021.03.01 12:34:42 +0800, Colin Xu wrote:
> 
> On Mon, 1 Mar 2021, Zhenyu Wang wrote:
> 
> > On 2021.02.26 12:46:30 +0800, Colin Xu wrote:
> > > Current vblank emulator uses single hrtimer at 16ms period for all vGPUs,
> > > which introduces three major issues:
> > > 
> > > - 16ms matches the refresh rate at 62.5Hz (instead of 60Hz) which
> > >   doesn't follow standard timing. This leads to some frame drop or glitch
> > >   issue during video playback. SW expects a vsync interval of 16.667ms or
> > >   higher precision for an accurate 60Hz refresh rate. However current
> > >   vblank emulator only works at 16ms.
> > > 
> > > - Doesn't respect the fact that with current virtual EDID timing set,
> > >   not all resolutions are running at 60Hz. For example, current virtual
> > >   EDID also supports refresh rate at 56Hz, 59.97Hz, 60Hz, 75Hz, etc.
> > > 
> > > - Current vblank emulator use single hrtimer for all vGPUs. Regardsless
> > >   the possibility that different guests could run in different
> > >   resolutions, all vsync interrupts are injected at 16ms interval with
> > >   same hrtimer.
> > > 
> > > Based on previous patch which decode guest expected refresh rate from
> > > vreg, the vblank emulator refactor patch makes following changes:
> > > - Change the vblank emulator hrtimer from gvt global to per-vGPU.
> > >   By doing this, each vGPU display can operates at different refresh
> > >   rates. Currently only one dislay is supported for each vGPU so per-vGPU
> > >   hrtimer is enough. If multiple displays are supported per-vGPU in
> > >   future, we can expand to per-PIPE further.
> > > - Change the fixed hrtimer period from 16ms to dynamic based on vreg.
> > >   GVT is expected to emulate the HW as close as possible. So reflacting
> > >   the accurate vsync interrupt interval is more correct than fixed 16ms.
> > > - Change the vblank timer period and start the timer on PIPECONF change.
> > >   The initial period is updated to 16666667 based on 60Hz refresh rate.
> > >   According to PRM, PIPECONF controls the timing generator of the
> > >   connected display on this pipe, so it's safe to stop hrtimer on
> > >   PIPECONF disabling, and re-start hrtimer at new period on enabling.
> > > 
> > > Other changes including:
> > > - Move vblank_timer_fn from irq.c into display.c.
> > > - Clean per-vGPU vblank timer at clean_display instead of clean_irq.
> > > 
> > > To run quick test, launch a web browser and goto URL: www.displayhz.com
> > > 
> > > The actual refresh rate from guest can now always match guest settings.
> > > 
> > > V2:
> > > Rebase to 5.11.
> > > Remove unused intel_gvt_clean_irq().
> > > Simplify enable logic in update_vblank_emulation(). (zhenyu)
> > > Loop all vGPU by idr when check all vblank timer. (zhenyu)
> > > 
> > > Signed-off-by: Colin Xu <colin.xu@intel.com>
> > > ---
> > 
> > Thanks a lot to refresh this!
> > 
> > After quick review just one concern is that looks you don't handle
> > possible active vblank timer cleanup in vGPU destroy?
> > 
> Do you mean stop the timer? Not sure if you mean this one:
> intel_vgpu_clean_display()
> -- vgpu_update_vblank_emulation(,FALSE)

oh, that's the one I missed. Thanks!

> > >  drivers/gpu/drm/i915/gvt/display.c   | 105 +++++++++++++++------------
> > >  drivers/gpu/drm/i915/gvt/display.h   |  11 ++-
> > >  drivers/gpu/drm/i915/gvt/gvt.c       |  25 +++++--
> > >  drivers/gpu/drm/i915/gvt/gvt.h       |  12 ++-
> > >  drivers/gpu/drm/i915/gvt/handlers.c  |   7 +-
> > >  drivers/gpu/drm/i915/gvt/interrupt.c |  37 ----------
> > >  drivers/gpu/drm/i915/gvt/interrupt.h |   7 --
> > >  drivers/gpu/drm/i915/gvt/vgpu.c      |   2 -
> > >  8 files changed, 94 insertions(+), 112 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/gvt/display.c b/drivers/gpu/drm/i915/gvt/display.c
> > > index 1cae92e3752c..034c060f89d4 100644
> > > --- a/drivers/gpu/drm/i915/gvt/display.c
> > > +++ b/drivers/gpu/drm/i915/gvt/display.c
> > > @@ -516,11 +516,27 @@ static void clean_virtual_dp_monitor(struct intel_vgpu *vgpu, int port_num)
> > >  	port->dpcd = NULL;
> > >  }
> > > 
> > > +static enum hrtimer_restart vblank_timer_fn(struct hrtimer *data)
> > > +{
> > > +	struct intel_vgpu_vblank_timer *vblank_timer;
> > > +	struct intel_vgpu *vgpu;
> > > +
> > > +	vblank_timer = container_of(data, struct intel_vgpu_vblank_timer, timer);
> > > +	vgpu = container_of(vblank_timer, struct intel_vgpu, vblank_timer);
> > > +
> > > +	/* Set vblank emulation request per-vGPU bit */
> > > +	intel_gvt_request_service(vgpu->gvt,
> > > +				  INTEL_GVT_REQUEST_EMULATE_VBLANK + vgpu->id);
> > > +	hrtimer_add_expires_ns(&vblank_timer->timer, vblank_timer->period);
> > > +	return HRTIMER_RESTART;
> > > +}
> > > +
> > >  static int setup_virtual_dp_monitor(struct intel_vgpu *vgpu, int port_num,
> > >  				    int type, unsigned int resolution)
> > >  {
> > >  	struct drm_i915_private *i915 = vgpu->gvt->gt->i915;
> > >  	struct intel_vgpu_port *port = intel_vgpu_port(vgpu, port_num);
> > > +	struct intel_vgpu_vblank_timer *vblank_timer = &vgpu->vblank_timer;
> > > 
> > >  	if (drm_WARN_ON(&i915->drm, resolution >= GVT_EDID_NUM))
> > >  		return -EINVAL;
> > > @@ -547,47 +563,56 @@ static int setup_virtual_dp_monitor(struct intel_vgpu *vgpu, int port_num,
> > >  	port->vrefresh_k = GVT_DEFAULT_REFRESH_RATE * MSEC_PER_SEC;
> > >  	vgpu->display.port_num = port_num;
> > > 
> > > +	/* Init hrtimer based on default refresh rate */
> > > +	hrtimer_init(&vblank_timer->timer, CLOCK_MONOTONIC, HRTIMER_MODE_ABS);
> > > +	vblank_timer->timer.function = vblank_timer_fn;
> > > +	vblank_timer->vrefresh_k = port->vrefresh_k;
> > > +	vblank_timer->period = DIV64_U64_ROUND_CLOSEST(NSEC_PER_SEC * MSEC_PER_SEC, vblank_timer->vrefresh_k);
> > > +
> > >  	emulate_monitor_status_change(vgpu);
> > > 
> > >  	return 0;
> > >  }
> > > 
> > >  /**
> > > - * intel_gvt_check_vblank_emulation - check if vblank emulation timer should
> > > - * be turned on/off when a virtual pipe is enabled/disabled.
> > > - * @gvt: a GVT device
> > > + * vgpu_update_vblank_emulation - Update per-vGPU vblank_timer
> > > + * @vgpu: vGPU operated
> > > + * @turnon: Turn ON/OFF vblank_timer
> > >   *
> > > - * This function is used to turn on/off vblank timer according to currently
> > > - * enabled/disabled virtual pipes.
> > > + * This function is used to turn on/off or update the per-vGPU vblank_timer
> > > + * when PIPECONF is enabled or disabled. vblank_timer period is also updated
> > > + * if guest changed the refresh rate.
> > >   *
> > >   */
> > > -void intel_gvt_check_vblank_emulation(struct intel_gvt *gvt)
> > > +void vgpu_update_vblank_emulation(struct intel_vgpu *vgpu, bool turnon)
> > >  {
> > > -	struct intel_gvt_irq *irq = &gvt->irq;
> > > -	struct intel_vgpu *vgpu;
> > > -	int pipe, id;
> > > -	int found = false;
> > > -
> > > -	mutex_lock(&gvt->lock);
> > > -	for_each_active_vgpu(gvt, vgpu, id) {
> > > -		for (pipe = 0; pipe < I915_MAX_PIPES; pipe++) {
> > > -			if (pipe_is_enabled(vgpu, pipe)) {
> > > -				found = true;
> > > -				break;
> > > -			}
> > > +	struct intel_vgpu_vblank_timer *vblank_timer = &vgpu->vblank_timer;
> > > +	struct intel_vgpu_port *port =
> > > +		intel_vgpu_port(vgpu, vgpu->display.port_num);
> > > +
> > > +	if (turnon) {
> > > +		/*
> > > +		 * Skip the re-enable if already active and vrefresh unchanged.
> > > +		 * Otherwise, stop timer if already active and restart with new
> > > +		 *   period.
> > > +		 */
> > > +		if (vblank_timer->vrefresh_k != port->vrefresh_k ||
> > > +		    !hrtimer_active(&vblank_timer->timer)) {
> > > +			/* Stop timer before start with new period if active */
> > > +			if (hrtimer_active(&vblank_timer->timer))
> > > +				hrtimer_cancel(&vblank_timer->timer);
> > > +
> > > +			/* Make sure new refresh rate updated to timer period */
> > > +			vblank_timer->vrefresh_k = port->vrefresh_k;
> > > +			vblank_timer->period = DIV64_U64_ROUND_CLOSEST(NSEC_PER_SEC * MSEC_PER_SEC, vblank_timer->vrefresh_k);
> > > +			hrtimer_start(&vblank_timer->timer,
> > > +				      ktime_add_ns(ktime_get(), vblank_timer->period),
> > > +				      HRTIMER_MODE_ABS);
> > >  		}
> > > -		if (found)
> > > -			break;
> > > +	} else {
> > > +		/* Caller request to stop vblank */
> > > +		hrtimer_cancel(&vblank_timer->timer);
> > >  	}
> > > -
> > > -	/* all the pipes are disabled */
> > > -	if (!found)
> > > -		hrtimer_cancel(&irq->vblank_timer.timer);
> > > -	else
> > > -		hrtimer_start(&irq->vblank_timer.timer,
> > > -			ktime_add_ns(ktime_get(), irq->vblank_timer.period),
> > > -			HRTIMER_MODE_ABS);
> > > -	mutex_unlock(&gvt->lock);
> > >  }
> > > 
> > >  static void emulate_vblank_on_pipe(struct intel_vgpu *vgpu, int pipe)
> > > @@ -619,7 +644,7 @@ static void emulate_vblank_on_pipe(struct intel_vgpu *vgpu, int pipe)
> > >  	}
> > >  }
> > > 
> > > -static void emulate_vblank(struct intel_vgpu *vgpu)
> > > +void intel_vgpu_emulate_vblank(struct intel_vgpu *vgpu)
> > >  {
> > >  	int pipe;
> > > 
> > > @@ -629,24 +654,6 @@ static void emulate_vblank(struct intel_vgpu *vgpu)
> > >  	mutex_unlock(&vgpu->vgpu_lock);
> > >  }
> > > 
> > > -/**
> > > - * intel_gvt_emulate_vblank - trigger vblank events for vGPUs on GVT device
> > > - * @gvt: a GVT device
> > > - *
> > > - * This function is used to trigger vblank interrupts for vGPUs on GVT device
> > > - *
> > > - */
> > > -void intel_gvt_emulate_vblank(struct intel_gvt *gvt)
> > > -{
> > > -	struct intel_vgpu *vgpu;
> > > -	int id;
> > > -
> > > -	mutex_lock(&gvt->lock);
> > > -	for_each_active_vgpu(gvt, vgpu, id)
> > > -		emulate_vblank(vgpu);
> > > -	mutex_unlock(&gvt->lock);
> > > -}
> > > -
> > >  /**
> > >   * intel_vgpu_emulate_hotplug - trigger hotplug event for vGPU
> > >   * @vgpu: a vGPU
> > > @@ -755,6 +762,8 @@ void intel_vgpu_clean_display(struct intel_vgpu *vgpu)
> > >  		clean_virtual_dp_monitor(vgpu, PORT_D);
> > >  	else
> > >  		clean_virtual_dp_monitor(vgpu, PORT_B);
> > > +
> > > +	vgpu_update_vblank_emulation(vgpu, false);
> > >  }
> > > 
> > >  /**
> > > diff --git a/drivers/gpu/drm/i915/gvt/display.h b/drivers/gpu/drm/i915/gvt/display.h
> > > index 2481a2ae1f68..f5616f99ef2f 100644
> > > --- a/drivers/gpu/drm/i915/gvt/display.h
> > > +++ b/drivers/gpu/drm/i915/gvt/display.h
> > > @@ -36,6 +36,7 @@
> > >  #define _GVT_DISPLAY_H_
> > > 
> > >  #include <linux/types.h>
> > > +#include <linux/hrtimer.h>
> > > 
> > >  struct intel_gvt;
> > >  struct intel_vgpu;
> > > @@ -169,6 +170,12 @@ struct intel_vgpu_port {
> > >  	u32 vrefresh_k;
> > >  };
> > > 
> > > +struct intel_vgpu_vblank_timer {
> > > +	struct hrtimer timer;
> > > +	u32 vrefresh_k;
> > > +	u64 period;
> > > +};
> > > +
> > >  static inline char *vgpu_edid_str(enum intel_vgpu_edid id)
> > >  {
> > >  	switch (id) {
> > > @@ -205,8 +212,8 @@ static inline unsigned int vgpu_edid_yres(enum intel_vgpu_edid id)
> > >  	}
> > >  }
> > > 
> > > -void intel_gvt_emulate_vblank(struct intel_gvt *gvt);
> > > -void intel_gvt_check_vblank_emulation(struct intel_gvt *gvt);
> > > +void intel_vgpu_emulate_vblank(struct intel_vgpu *vgpu);
> > > +void vgpu_update_vblank_emulation(struct intel_vgpu *vgpu, bool turnon);
> > > 
> > >  int intel_vgpu_init_display(struct intel_vgpu *vgpu, u64 resolution);
> > >  void intel_vgpu_reset_display(struct intel_vgpu *vgpu);
> > > diff --git a/drivers/gpu/drm/i915/gvt/gvt.c b/drivers/gpu/drm/i915/gvt/gvt.c
> > > index aa7fc0dd1db5..2ecb8534930b 100644
> > > --- a/drivers/gpu/drm/i915/gvt/gvt.c
> > > +++ b/drivers/gpu/drm/i915/gvt/gvt.c
> > > @@ -203,6 +203,22 @@ static void init_device_info(struct intel_gvt *gvt)
> > >  	info->msi_cap_offset = pdev->msi_cap;
> > >  }
> > > 
> > > +static void intel_gvt_test_and_emulate_vblank(struct intel_gvt *gvt)
> > > +{
> > > +	struct intel_vgpu *vgpu;
> > > +	int id;
> > > +
> > > +	mutex_lock(&gvt->lock);
> > > +	idr_for_each_entry((&(gvt)->vgpu_idr), (vgpu), (id)) {
> > > +		if (test_and_clear_bit(INTEL_GVT_REQUEST_EMULATE_VBLANK + id,
> > > +				       (void *)&gvt->service_request)) {
> > > +			if (vgpu->active)
> > > +				intel_vgpu_emulate_vblank(vgpu);
> > > +		}
> > > +	}
> > > +	mutex_unlock(&gvt->lock);
> > > +}
> > > +
> > >  static int gvt_service_thread(void *data)
> > >  {
> > >  	struct intel_gvt *gvt = (struct intel_gvt *)data;
> > > @@ -220,9 +236,7 @@ static int gvt_service_thread(void *data)
> > >  		if (WARN_ONCE(ret, "service thread is waken up by signal.\n"))
> > >  			continue;
> > > 
> > > -		if (test_and_clear_bit(INTEL_GVT_REQUEST_EMULATE_VBLANK,
> > > -					(void *)&gvt->service_request))
> > > -			intel_gvt_emulate_vblank(gvt);
> > > +		intel_gvt_test_and_emulate_vblank(gvt);
> > > 
> > >  		if (test_bit(INTEL_GVT_REQUEST_SCHED,
> > >  				(void *)&gvt->service_request) ||
> > > @@ -278,7 +292,6 @@ void intel_gvt_clean_device(struct drm_i915_private *i915)
> > >  	intel_gvt_clean_sched_policy(gvt);
> > >  	intel_gvt_clean_workload_scheduler(gvt);
> > >  	intel_gvt_clean_gtt(gvt);
> > > -	intel_gvt_clean_irq(gvt);
> > >  	intel_gvt_free_firmware(gvt);
> > >  	intel_gvt_clean_mmio_info(gvt);
> > >  	idr_destroy(&gvt->vgpu_idr);
> > > @@ -337,7 +350,7 @@ int intel_gvt_init_device(struct drm_i915_private *i915)
> > > 
> > >  	ret = intel_gvt_init_gtt(gvt);
> > >  	if (ret)
> > > -		goto out_clean_irq;
> > > +		goto out_free_firmware;
> > > 
> > >  	ret = intel_gvt_init_workload_scheduler(gvt);
> > >  	if (ret)
> > > @@ -392,8 +405,6 @@ int intel_gvt_init_device(struct drm_i915_private *i915)
> > >  	intel_gvt_clean_workload_scheduler(gvt);
> > >  out_clean_gtt:
> > >  	intel_gvt_clean_gtt(gvt);
> > > -out_clean_irq:
> > > -	intel_gvt_clean_irq(gvt);
> > >  out_free_firmware:
> > >  	intel_gvt_free_firmware(gvt);
> > >  out_clean_mmio_info:
> > > diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gvt.h
> > > index da8bda7f7bd2..8dc8170ba00f 100644
> > > --- a/drivers/gpu/drm/i915/gvt/gvt.h
> > > +++ b/drivers/gpu/drm/i915/gvt/gvt.h
> > > @@ -215,6 +215,7 @@ struct intel_vgpu {
> > >  	struct list_head dmabuf_obj_list_head;
> > >  	struct mutex dmabuf_lock;
> > >  	struct idr object_idr;
> > > +	struct intel_vgpu_vblank_timer vblank_timer;
> > > 
> > >  	u32 scan_nonprivbb;
> > >  };
> > > @@ -347,13 +348,16 @@ static inline struct intel_gvt *to_gvt(struct drm_i915_private *i915)
> > >  }
> > > 
> > >  enum {
> > > -	INTEL_GVT_REQUEST_EMULATE_VBLANK = 0,
> > > -
> > >  	/* Scheduling trigger by timer */
> > > -	INTEL_GVT_REQUEST_SCHED = 1,
> > > +	INTEL_GVT_REQUEST_SCHED = 0,
> > > 
> > >  	/* Scheduling trigger by event */
> > > -	INTEL_GVT_REQUEST_EVENT_SCHED = 2,
> > > +	INTEL_GVT_REQUEST_EVENT_SCHED = 1,
> > > +
> > > +	/* per-vGPU vblank emulation request */
> > > +	INTEL_GVT_REQUEST_EMULATE_VBLANK = 2,
> > > +	INTEL_GVT_REQUEST_EMULATE_VBLANK_MAX = INTEL_GVT_REQUEST_EMULATE_VBLANK
> > > +		+ GVT_MAX_VGPU,
> > >  };
> > > 
> > >  static inline void intel_gvt_request_service(struct intel_gvt *gvt,
> > > diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
> > > index 321480209b89..477badfcb258 100644
> > > --- a/drivers/gpu/drm/i915/gvt/handlers.c
> > > +++ b/drivers/gpu/drm/i915/gvt/handlers.c
> > > @@ -703,14 +703,11 @@ static int pipeconf_mmio_write(struct intel_vgpu *vgpu, unsigned int offset,
> > >  	if (data & PIPECONF_ENABLE) {
> > >  		vgpu_vreg(vgpu, offset) |= I965_PIPECONF_ACTIVE;
> > >  		vgpu_update_refresh_rate(vgpu);
> > > -
> > > +		vgpu_update_vblank_emulation(vgpu, true);
> > >  	} else {
> > >  		vgpu_vreg(vgpu, offset) &= ~I965_PIPECONF_ACTIVE;
> > > +		vgpu_update_vblank_emulation(vgpu, false);
> > >  	}
> > > -	/* vgpu_lock already hold by emulate mmio r/w */
> > > -	mutex_unlock(&vgpu->vgpu_lock);
> > > -	intel_gvt_check_vblank_emulation(vgpu->gvt);
> > > -	mutex_lock(&vgpu->vgpu_lock);
> > >  	return 0;
> > >  }
> > > 
> > > diff --git a/drivers/gpu/drm/i915/gvt/interrupt.c b/drivers/gpu/drm/i915/gvt/interrupt.c
> > > index 7498878e6289..497d28ce47df 100644
> > > --- a/drivers/gpu/drm/i915/gvt/interrupt.c
> > > +++ b/drivers/gpu/drm/i915/gvt/interrupt.c
> > > @@ -647,38 +647,6 @@ static void init_events(
> > >  	}
> > >  }
> > > 
> > > -static enum hrtimer_restart vblank_timer_fn(struct hrtimer *data)
> > > -{
> > > -	struct intel_gvt_vblank_timer *vblank_timer;
> > > -	struct intel_gvt_irq *irq;
> > > -	struct intel_gvt *gvt;
> > > -
> > > -	vblank_timer = container_of(data, struct intel_gvt_vblank_timer, timer);
> > > -	irq = container_of(vblank_timer, struct intel_gvt_irq, vblank_timer);
> > > -	gvt = container_of(irq, struct intel_gvt, irq);
> > > -
> > > -	intel_gvt_request_service(gvt, INTEL_GVT_REQUEST_EMULATE_VBLANK);
> > > -	hrtimer_add_expires_ns(&vblank_timer->timer, vblank_timer->period);
> > > -	return HRTIMER_RESTART;
> > > -}
> > > -
> > > -/**
> > > - * intel_gvt_clean_irq - clean up GVT-g IRQ emulation subsystem
> > > - * @gvt: a GVT device
> > > - *
> > > - * This function is called at driver unloading stage, to clean up GVT-g IRQ
> > > - * emulation subsystem.
> > > - *
> > > - */
> > > -void intel_gvt_clean_irq(struct intel_gvt *gvt)
> > > -{
> > > -	struct intel_gvt_irq *irq = &gvt->irq;
> > > -
> > > -	hrtimer_cancel(&irq->vblank_timer.timer);
> > > -}
> > > -
> > > -#define VBLANK_TIMER_PERIOD 16000000
> > > -
> > >  /**
> > >   * intel_gvt_init_irq - initialize GVT-g IRQ emulation subsystem
> > >   * @gvt: a GVT device
> > > @@ -692,7 +660,6 @@ void intel_gvt_clean_irq(struct intel_gvt *gvt)
> > >  int intel_gvt_init_irq(struct intel_gvt *gvt)
> > >  {
> > >  	struct intel_gvt_irq *irq = &gvt->irq;
> > > -	struct intel_gvt_vblank_timer *vblank_timer = &irq->vblank_timer;
> > > 
> > >  	gvt_dbg_core("init irq framework\n");
> > > 
> > > @@ -707,9 +674,5 @@ int intel_gvt_init_irq(struct intel_gvt *gvt)
> > > 
> > >  	init_irq_map(irq);
> > > 
> > > -	hrtimer_init(&vblank_timer->timer, CLOCK_MONOTONIC, HRTIMER_MODE_ABS);
> > > -	vblank_timer->timer.function = vblank_timer_fn;
> > > -	vblank_timer->period = VBLANK_TIMER_PERIOD;
> > > -
> > >  	return 0;
> > >  }
> > > diff --git a/drivers/gpu/drm/i915/gvt/interrupt.h b/drivers/gpu/drm/i915/gvt/interrupt.h
> > > index 287cd142629e..6c47d3e33161 100644
> > > --- a/drivers/gpu/drm/i915/gvt/interrupt.h
> > > +++ b/drivers/gpu/drm/i915/gvt/interrupt.h
> > > @@ -201,11 +201,6 @@ struct intel_gvt_irq_map {
> > >  	u32 down_irq_bitmask;
> > >  };
> > > 
> > > -struct intel_gvt_vblank_timer {
> > > -	struct hrtimer timer;
> > > -	u64 period;
> > > -};
> > > -
> > >  /* structure containing device specific IRQ state */
> > >  struct intel_gvt_irq {
> > >  	struct intel_gvt_irq_ops *ops;
> > > @@ -214,11 +209,9 @@ struct intel_gvt_irq {
> > >  	struct intel_gvt_event_info events[INTEL_GVT_EVENT_MAX];
> > >  	DECLARE_BITMAP(pending_events, INTEL_GVT_EVENT_MAX);
> > >  	struct intel_gvt_irq_map *irq_map;
> > > -	struct intel_gvt_vblank_timer vblank_timer;
> > >  };
> > > 
> > >  int intel_gvt_init_irq(struct intel_gvt *gvt);
> > > -void intel_gvt_clean_irq(struct intel_gvt *gvt);
> > > 
> > >  void intel_vgpu_trigger_virtual_event(struct intel_vgpu *vgpu,
> > >  	enum intel_gvt_event_type event);
> > > diff --git a/drivers/gpu/drm/i915/gvt/vgpu.c b/drivers/gpu/drm/i915/gvt/vgpu.c
> > > index 6a16d0ca7cda..9039787f123a 100644
> > > --- a/drivers/gpu/drm/i915/gvt/vgpu.c
> > > +++ b/drivers/gpu/drm/i915/gvt/vgpu.c
> > > @@ -300,8 +300,6 @@ void intel_gvt_destroy_vgpu(struct intel_vgpu *vgpu)
> > >  	mutex_unlock(&vgpu->vgpu_lock);
> > > 
> > >  	mutex_lock(&gvt->lock);
> > > -	if (idr_is_empty(&gvt->vgpu_idr))
> > > -		intel_gvt_clean_irq(gvt);
> > >  	intel_gvt_update_vgpu_types(gvt);
> > >  	mutex_unlock(&gvt->lock);
> > > 
> > > --
> > > 2.30.1
> > > 
> > > _______________________________________________
> > > intel-gvt-dev mailing list
> > > intel-gvt-dev@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
> > 
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
