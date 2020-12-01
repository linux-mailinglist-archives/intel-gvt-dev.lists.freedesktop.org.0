Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE202C971F
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  1 Dec 2020 06:47:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EDBA6E48B;
	Tue,  1 Dec 2020 05:47:06 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C09C86E48B
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  1 Dec 2020 05:47:05 +0000 (UTC)
IronPort-SDR: cyublR1qBzWLDC7YhHXqjJ6AhbfEcqD3ytP372uOlPfVaDKRycEzhLAlxuR2VaocBpNZ+2pAZ7
 qSUXFIJsga5g==
X-IronPort-AV: E=McAfee;i="6000,8403,9821"; a="159823387"
X-IronPort-AV: E=Sophos;i="5.78,383,1599548400"; 
 d="asc'?scan'208";a="159823387"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2020 21:47:04 -0800
IronPort-SDR: Zy210SbZ53Q4EtzvmVj3Z1H8ekNasjNShqqlXgPhrL0/Ltc5faHSDfsRCA+jGACbLyFTEEDEU7
 wTVqvkSwXNow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,383,1599548400"; 
 d="asc'?scan'208";a="364558587"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by fmsmga004.fm.intel.com with ESMTP; 30 Nov 2020 21:47:03 -0800
Date: Tue, 1 Dec 2020 13:32:02 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Colin Xu <colin.xu@intel.com>
Subject: Re: [PATCH 2/2] drm/i915/gvt: Refactor GVT vblank emulator for vGPU
 virtual display
Message-ID: <20201201053202.GO16939@zhen-hp.sh.intel.com>
References: <20201109080028.813579-1-colin.xu@intel.com>
MIME-Version: 1.0
In-Reply-To: <20201109080028.813579-1-colin.xu@intel.com>
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
Content-Type: multipart/mixed; boundary="===============0138328441=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0138328441==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7uYPyRQQ5N0D02nI"
Content-Disposition: inline


--7uYPyRQQ5N0D02nI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020.11.09 16:00:28 +0800, Colin Xu wrote:
> Current vblank emulator uses single hrtimer at 16ms peroid for all vGPUs,
> which introduces three major issues:
>=20
> - 16ms matches the refresh rate at 62.5Hz (instead of 60Hz) which
>   doesn't follow standard timing. This leads to some frame drop or glitch
>   issue during video playback. SW expects a vsync interval of 16.667ms or
>   higher precision for an accurate 60Hz refresh rate. However current
>   vblank emulator only works at 16ms.
>=20
> - Doesn't respect the fact that with current virtual EDID timing set,
>   not all resolutions are running at 60Hz. For example, current virtual
>   EDID also supports refresh rate at 56Hz, 59.97Hz, 60Hz, 75Hz, etc.
>=20
> - Current vblank emulator use single hrtimer for all vGPUs. Regardsless
>   the possibility that different guests could run in different
>   resolutions, all vsync interupts are injected at 16ms interval with
>   same hrtimer.
>=20
> Based on previous patch which decode guest expected refresh rate from
> vreg, the vblank emulator refactor patch makes following changes:
> - Change the vblank emulator hrtimer from gvt global to per-vGPU.
>   By doing this, each vGPU display can operates at different refresh
>   rates. Currently only one dislay is supported for each vGPU so per-vGPU
>   hrtimer is enough. If multiple displays are supported per-vGPU in
>   future, we can expand to per-PIPE further.
> - Change the fixed hrtimer peroid from 16ms to dynamic based on vreg.
>   GVT is expected to emulate the HW as close as possible. So reflacting
>   the accurate vsync interrupt interval is more correct than fixed 16ms.
> - Change the vblank timer peroid and start the timer on PIPECONF change.
>   The intial peroid is updated to 16666667 based on 60Hz refresh rate.
>   According to PRM, PIPECONF controls the timing generator of the
>   connected display on this pipe, so it's safe to stop hrtimer on
>   PIPECONF disabling, and re-start hrtimer at new peroid on enabling.
>=20
> Other changes including:
> - Move vblank_timer_fn from irq.c into display.c.
> - Clean per-vGPU vblank timer at clean_display instead of clean_irq.
>=20
> To run quick test, launch a web browser and goto URL: www.displayhz.com
>=20
> The actual refresh rate from guest can now always match guest settings.
>

Thanks, this is the right direction, comments below.

btw, pls send this with previous one in one series by git-send-email
for easier reference.

> Signed-off-by: Colin Xu <colin.xu@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/display.c   | 111 +++++++++++++++------------
>  drivers/gpu/drm/i915/gvt/display.h   |  11 ++-
>  drivers/gpu/drm/i915/gvt/gvt.c       |  21 ++++-
>  drivers/gpu/drm/i915/gvt/gvt.h       |  12 ++-
>  drivers/gpu/drm/i915/gvt/handlers.c  |  10 +--
>  drivers/gpu/drm/i915/gvt/interrupt.c |  31 ++------
>  drivers/gpu/drm/i915/gvt/interrupt.h |   6 --
>  drivers/gpu/drm/i915/gvt/vgpu.c      |   2 -
>  8 files changed, 109 insertions(+), 95 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/display.c b/drivers/gpu/drm/i915/gv=
t/display.c
> index bc208355662a..c5248311ada0 100644
> --- a/drivers/gpu/drm/i915/gvt/display.c
> +++ b/drivers/gpu/drm/i915/gvt/display.c
> @@ -361,11 +361,27 @@ static void clean_virtual_dp_monitor(struct intel_v=
gpu *vgpu, int port_num)
>  	port->dpcd =3D NULL;
>  }
> =20
> +static enum hrtimer_restart vblank_timer_fn(struct hrtimer *data)
> +{
> +	struct intel_vgpu_vblank_timer *vblank_timer;
> +	struct intel_vgpu *vgpu;
> +
> +	vblank_timer =3D container_of(data, struct intel_vgpu_vblank_timer, tim=
er);
> +	vgpu =3D container_of(vblank_timer, struct intel_vgpu, vblank_timer);
> +
> +	/* Set vblank emulation request per-vGPU bit */
> +	intel_gvt_request_service(vgpu->gvt,
> +				  INTEL_GVT_REQUEST_EMULATE_VBLANK + vgpu->id);
> +	hrtimer_add_expires_ns(&vblank_timer->timer, vblank_timer->period);
> +	return HRTIMER_RESTART;
> +}
> +
>  static int setup_virtual_dp_monitor(struct intel_vgpu *vgpu, int port_nu=
m,
>  				    int type, unsigned int resolution)
>  {
>  	struct drm_i915_private *i915 =3D vgpu->gvt->gt->i915;
>  	struct intel_vgpu_port *port =3D intel_vgpu_port(vgpu, port_num);
> +	struct intel_vgpu_vblank_timer *vblank_timer =3D &vgpu->vblank_timer;
> =20
>  	if (drm_WARN_ON(&i915->drm, resolution >=3D GVT_EDID_NUM))
>  		return -EINVAL;
> @@ -392,47 +408,64 @@ static int setup_virtual_dp_monitor(struct intel_vg=
pu *vgpu, int port_num,
>  	port->vrefresh_k =3D 60 * MSEC_PER_SEC;
>  	vgpu->display.port_num =3D port_num;
> =20
> +	/* Init hrtimer based on default refresh rate */
> +	hrtimer_init(&vblank_timer->timer, CLOCK_MONOTONIC, HRTIMER_MODE_ABS);
> +	vblank_timer->timer.function =3D vblank_timer_fn;
> +	vblank_timer->vrefresh_k =3D port->vrefresh_k;
> +	vblank_timer->period =3D DIV64_U64_ROUND_CLOSEST(
> +		NSEC_PER_SEC * MSEC_PER_SEC, vblank_timer->vrefresh_k);
> +
>  	emulate_monitor_status_change(vgpu);
> =20
>  	return 0;
>  }
> =20
>  /**
> - * intel_gvt_check_vblank_emulation - check if vblank emulation timer sh=
ould
> - * be turned on/off when a virtual pipe is enabled/disabled.
> - * @gvt: a GVT device
> + * vgpu_update_vblank_emulation - Update per-vGPU vblank_timer
> + * @vgpu: vGPU operated
> + * @turnon: Turn ON/OFF vblank_timer
>   *
> - * This function is used to turn on/off vblank timer according to curren=
tly
> - * enabled/disabled virtual pipes.
> + * This function is used to turn on/off or update the per-vGPU vblank_ti=
mer
> + * when PIPECONF is enabled or disabled. vblank_timer period is also upd=
ated
> + * if guest changed the refresh rate.
>   *
>   */
> -void intel_gvt_check_vblank_emulation(struct intel_gvt *gvt)
> +void vgpu_update_vblank_emulation(struct intel_vgpu *vgpu, bool turnon)
>  {
> -	struct intel_gvt_irq *irq =3D &gvt->irq;
> -	struct intel_vgpu *vgpu;
> -	int pipe, id;
> -	int found =3D false;
> -
> -	mutex_lock(&gvt->lock);
> -	for_each_active_vgpu(gvt, vgpu, id) {
> -		for (pipe =3D 0; pipe < I915_MAX_PIPES; pipe++) {
> -			if (pipe_is_enabled(vgpu, pipe)) {
> -				found =3D true;
> -				break;
> +	struct intel_vgpu_vblank_timer *vblank_timer =3D &vgpu->vblank_timer;
> +	struct intel_vgpu_port *port =3D
> +		intel_vgpu_port(vgpu, vgpu->display.port_num);
> +	bool enable =3D false;
> +
> +	if (turnon) {
> +		if (hrtimer_active(&vblank_timer->timer)) {
> +			/*
> +			 * When vblank timer is still active but peroid change,
> +			 *   stop timer and update the new peroid.
> +			 *   Otherwise, keep the timer and peroid as it is.
> +			 */
> +			if (vblank_timer->vrefresh_k !=3D port->vrefresh_k) {
> +				hrtimer_cancel(&vblank_timer->timer);

I think this is still racy, should compare new vrefresh earlier instead of =
after
timer active check, e.g

  	     	if (vblank_timer->vrefresh_k !=3D port->vrefresh_k) {
		        if (hrtimer_active(&vblank_timer->timer))
			        hrtimer_cancel(&vblank_timer->timer);
			enable =3D true;
	        }

> +				enable =3D true;
>  			}
> +		} else {
> +			enable =3D true;
>  		}
> -		if (found)
> -			break;
> -	}
> =20
> -	/* all the pipes are disabled */
> -	if (!found)
> -		hrtimer_cancel(&irq->vblank_timer.timer);
> -	else
> -		hrtimer_start(&irq->vblank_timer.timer,
> -			ktime_add_ns(ktime_get(), irq->vblank_timer.period),
> -			HRTIMER_MODE_ABS);
> -	mutex_unlock(&gvt->lock);
> +		if (enable) {
> +			/* Make sure new refresh rate updated to timer peroid */
> +			vblank_timer->vrefresh_k =3D port->vrefresh_k;
> +			vblank_timer->period =3D DIV64_U64_ROUND_CLOSEST(
> +				NSEC_PER_SEC * MSEC_PER_SEC,
> +				vblank_timer->vrefresh_k);
> +			hrtimer_start(&vblank_timer->timer,
> +				ktime_add_ns(ktime_get(), vblank_timer->period),
> +				HRTIMER_MODE_ABS);
> +		}
> +	} else {
> +		/* Caller request to stop vblank */
> +		hrtimer_cancel(&vblank_timer->timer);
> +	}
>  }
> =20
>  static void emulate_vblank_on_pipe(struct intel_vgpu *vgpu, int pipe)
> @@ -464,7 +497,7 @@ static void emulate_vblank_on_pipe(struct intel_vgpu =
*vgpu, int pipe)
>  	}
>  }
> =20
> -static void emulate_vblank(struct intel_vgpu *vgpu)
> +void intel_vgpu_emulate_vblank(struct intel_vgpu *vgpu)
>  {
>  	int pipe;
> =20
> @@ -474,24 +507,6 @@ static void emulate_vblank(struct intel_vgpu *vgpu)
>  	mutex_unlock(&vgpu->vgpu_lock);
>  }
> =20
> -/**
> - * intel_gvt_emulate_vblank - trigger vblank events for vGPUs on GVT dev=
ice
> - * @gvt: a GVT device
> - *
> - * This function is used to trigger vblank interrupts for vGPUs on GVT d=
evice
> - *
> - */
> -void intel_gvt_emulate_vblank(struct intel_gvt *gvt)
> -{
> -	struct intel_vgpu *vgpu;
> -	int id;
> -
> -	mutex_lock(&gvt->lock);
> -	for_each_active_vgpu(gvt, vgpu, id)
> -		emulate_vblank(vgpu);
> -	mutex_unlock(&gvt->lock);
> -}
> -
>  /**
>   * intel_vgpu_emulate_hotplug - trigger hotplug event for vGPU
>   * @vgpu: a vGPU
> @@ -543,6 +558,8 @@ void intel_vgpu_clean_display(struct intel_vgpu *vgpu)
>  		clean_virtual_dp_monitor(vgpu, PORT_D);
>  	else
>  		clean_virtual_dp_monitor(vgpu, PORT_B);
> +
> +	vgpu_update_vblank_emulation(vgpu, false);
>  }
> =20
>  /**
> diff --git a/drivers/gpu/drm/i915/gvt/display.h b/drivers/gpu/drm/i915/gv=
t/display.h
> index 17e83bf5826c..6d33bd858aa6 100644
> --- a/drivers/gpu/drm/i915/gvt/display.h
> +++ b/drivers/gpu/drm/i915/gvt/display.h
> @@ -36,6 +36,7 @@
>  #define _GVT_DISPLAY_H_
> =20
>  #include <linux/types.h>
> +#include <linux/hrtimer.h>
> =20
>  struct intel_gvt;
>  struct intel_vgpu;
> @@ -168,6 +169,12 @@ struct intel_vgpu_port {
>  	u32 vrefresh_k;
>  };
> =20
> +struct intel_vgpu_vblank_timer {
> +	struct hrtimer timer;
> +	u32 vrefresh_k;
> +	u64 period;
> +};
> +
>  static inline char *vgpu_edid_str(enum intel_vgpu_edid id)
>  {
>  	switch (id) {
> @@ -204,8 +211,8 @@ static inline unsigned int vgpu_edid_yres(enum intel_=
vgpu_edid id)
>  	}
>  }
> =20
> -void intel_gvt_emulate_vblank(struct intel_gvt *gvt);
> -void intel_gvt_check_vblank_emulation(struct intel_gvt *gvt);
> +void intel_vgpu_emulate_vblank(struct intel_vgpu *vgpu);
> +void vgpu_update_vblank_emulation(struct intel_vgpu *vgpu, bool turnon);
> =20
>  int intel_vgpu_init_display(struct intel_vgpu *vgpu, u64 resolution);
>  void intel_vgpu_reset_display(struct intel_vgpu *vgpu);
> diff --git a/drivers/gpu/drm/i915/gvt/gvt.c b/drivers/gpu/drm/i915/gvt/gv=
t.c
> index c7c561237883..4510e652d25f 100644
> --- a/drivers/gpu/drm/i915/gvt/gvt.c
> +++ b/drivers/gpu/drm/i915/gvt/gvt.c
> @@ -203,6 +203,23 @@ static void init_device_info(struct intel_gvt *gvt)
>  	info->msi_cap_offset =3D pdev->msi_cap;
>  }
> =20
> +static void intel_gvt_test_and_emulate_vblank(struct intel_gvt *gvt)
> +{
> +	struct intel_vgpu *vgpu;
> +	int id;
> +
> +	mutex_lock(&gvt->lock);
> +	for (id =3D 1; id <=3D GVT_MAX_VGPU; id++) {

Don't open code idr, use idr_for_each_xxx helper.

> +		if (test_and_clear_bit(INTEL_GVT_REQUEST_EMULATE_VBLANK + id,
> +		    (void *)&gvt->service_request)) {
> +			vgpu =3D idr_find(&gvt->vgpu_idr, id);
> +			if (vgpu && vgpu->active)
> +				intel_vgpu_emulate_vblank(vgpu);
> +		}
> +	}
> +	mutex_unlock(&gvt->lock);
> +}
> +
>  static int gvt_service_thread(void *data)
>  {
>  	struct intel_gvt *gvt =3D (struct intel_gvt *)data;
> @@ -220,9 +237,7 @@ static int gvt_service_thread(void *data)
>  		if (WARN_ONCE(ret, "service thread is waken up by signal.\n"))
>  			continue;
> =20
> -		if (test_and_clear_bit(INTEL_GVT_REQUEST_EMULATE_VBLANK,
> -					(void *)&gvt->service_request))
> -			intel_gvt_emulate_vblank(gvt);
> +		intel_gvt_test_and_emulate_vblank(gvt);
> =20
>  		if (test_bit(INTEL_GVT_REQUEST_SCHED,
>  				(void *)&gvt->service_request) ||
> diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gv=
t.h
> index 2b75b3b3ea12..5a8f7a631210 100644
> --- a/drivers/gpu/drm/i915/gvt/gvt.h
> +++ b/drivers/gpu/drm/i915/gvt/gvt.h
> @@ -211,6 +211,7 @@ struct intel_vgpu {
>  	struct list_head dmabuf_obj_list_head;
>  	struct mutex dmabuf_lock;
>  	struct idr object_idr;
> +	struct intel_vgpu_vblank_timer vblank_timer;
> =20
>  	u32 scan_nonprivbb;
>  };
> @@ -338,13 +339,16 @@ static inline struct intel_gvt *to_gvt(struct drm_i=
915_private *i915)
>  }
> =20
>  enum {
> -	INTEL_GVT_REQUEST_EMULATE_VBLANK =3D 0,
> -
>  	/* Scheduling trigger by timer */
> -	INTEL_GVT_REQUEST_SCHED =3D 1,
> +	INTEL_GVT_REQUEST_SCHED =3D 0,
> =20
>  	/* Scheduling trigger by event */
> -	INTEL_GVT_REQUEST_EVENT_SCHED =3D 2,
> +	INTEL_GVT_REQUEST_EVENT_SCHED =3D 1,
> +
> +	/* per-vGPU vblank emulation request */
> +	INTEL_GVT_REQUEST_EMULATE_VBLANK =3D 2,
> +	INTEL_GVT_REQUEST_EMULATE_VBLANK_MAX =3D INTEL_GVT_REQUEST_EMULATE_VBLA=
NK
> +		+ GVT_MAX_VGPU,
>  };
> =20
>  static inline void intel_gvt_request_service(struct intel_gvt *gvt,
> diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/g=
vt/handlers.c
> index ec88a6329329..4e640f8ca48f 100644
> --- a/drivers/gpu/drm/i915/gvt/handlers.c
> +++ b/drivers/gpu/drm/i915/gvt/handlers.c
> @@ -555,13 +555,11 @@ static int pipeconf_mmio_write(struct intel_vgpu *v=
gpu, unsigned int offset,
>  	if (data & PIPECONF_ENABLE) {
>  		vgpu_vreg(vgpu, offset) |=3D I965_PIPECONF_ACTIVE;
>  		vgpu_update_refresh_rate(vgpu);
> -
> -	} else
> +		vgpu_update_vblank_emulation(vgpu, true);
> +	} else {
>  		vgpu_vreg(vgpu, offset) &=3D ~I965_PIPECONF_ACTIVE;
> -	/* vgpu_lock already hold by emulate mmio r/w */
> -	mutex_unlock(&vgpu->vgpu_lock);
> -	intel_gvt_check_vblank_emulation(vgpu->gvt);
> -	mutex_lock(&vgpu->vgpu_lock);
> +		vgpu_update_vblank_emulation(vgpu, false);
> +	}
>  	return 0;
>  }
> =20
> diff --git a/drivers/gpu/drm/i915/gvt/interrupt.c b/drivers/gpu/drm/i915/=
gvt/interrupt.c
> index 7498878e6289..176a2e785594 100644
> --- a/drivers/gpu/drm/i915/gvt/interrupt.c
> +++ b/drivers/gpu/drm/i915/gvt/interrupt.c
> @@ -647,21 +647,6 @@ static void init_events(
>  	}
>  }
> =20
> -static enum hrtimer_restart vblank_timer_fn(struct hrtimer *data)
> -{
> -	struct intel_gvt_vblank_timer *vblank_timer;
> -	struct intel_gvt_irq *irq;
> -	struct intel_gvt *gvt;
> -
> -	vblank_timer =3D container_of(data, struct intel_gvt_vblank_timer, time=
r);
> -	irq =3D container_of(vblank_timer, struct intel_gvt_irq, vblank_timer);
> -	gvt =3D container_of(irq, struct intel_gvt, irq);
> -
> -	intel_gvt_request_service(gvt, INTEL_GVT_REQUEST_EMULATE_VBLANK);
> -	hrtimer_add_expires_ns(&vblank_timer->timer, vblank_timer->period);
> -	return HRTIMER_RESTART;
> -}
> -
>  /**
>   * intel_gvt_clean_irq - clean up GVT-g IRQ emulation subsystem
>   * @gvt: a GVT device
> @@ -672,13 +657,14 @@ static enum hrtimer_restart vblank_timer_fn(struct =
hrtimer *data)
>   */
>  void intel_gvt_clean_irq(struct intel_gvt *gvt)
>  {
> -	struct intel_gvt_irq *irq =3D &gvt->irq;
> -
> -	hrtimer_cancel(&irq->vblank_timer.timer);
> +	/*
> +	 * TODO:
> +	 *   vblank_timer has moved to per vGPU vgpu_update_vblank_emulation,
> +	 *   keep intel_gvt_clean_irq as space holder for other GVT irq clean up
> +	 */

Better just remove this if nothing should be left for gvt clean.

> +	return;
>  }
> =20
> -#define VBLANK_TIMER_PERIOD 16000000
> -
>  /**
>   * intel_gvt_init_irq - initialize GVT-g IRQ emulation subsystem
>   * @gvt: a GVT device
> @@ -692,7 +678,6 @@ void intel_gvt_clean_irq(struct intel_gvt *gvt)
>  int intel_gvt_init_irq(struct intel_gvt *gvt)
>  {
>  	struct intel_gvt_irq *irq =3D &gvt->irq;
> -	struct intel_gvt_vblank_timer *vblank_timer =3D &irq->vblank_timer;
> =20
>  	gvt_dbg_core("init irq framework\n");
> =20
> @@ -707,9 +692,5 @@ int intel_gvt_init_irq(struct intel_gvt *gvt)
> =20
>  	init_irq_map(irq);
> =20
> -	hrtimer_init(&vblank_timer->timer, CLOCK_MONOTONIC, HRTIMER_MODE_ABS);
> -	vblank_timer->timer.function =3D vblank_timer_fn;
> -	vblank_timer->period =3D VBLANK_TIMER_PERIOD;
> -
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/i915/gvt/interrupt.h b/drivers/gpu/drm/i915/=
gvt/interrupt.h
> index fcd663811d37..c7913808a88f 100644
> --- a/drivers/gpu/drm/i915/gvt/interrupt.h
> +++ b/drivers/gpu/drm/i915/gvt/interrupt.h
> @@ -198,11 +198,6 @@ struct intel_gvt_irq_map {
>  	u32 down_irq_bitmask;
>  };
> =20
> -struct intel_gvt_vblank_timer {
> -	struct hrtimer timer;
> -	u64 period;
> -};
> -
>  /* structure containing device specific IRQ state */
>  struct intel_gvt_irq {
>  	struct intel_gvt_irq_ops *ops;
> @@ -211,7 +206,6 @@ struct intel_gvt_irq {
>  	struct intel_gvt_event_info events[INTEL_GVT_EVENT_MAX];
>  	DECLARE_BITMAP(pending_events, INTEL_GVT_EVENT_MAX);
>  	struct intel_gvt_irq_map *irq_map;
> -	struct intel_gvt_vblank_timer vblank_timer;
>  };
> =20
>  int intel_gvt_init_irq(struct intel_gvt *gvt);
> diff --git a/drivers/gpu/drm/i915/gvt/vgpu.c b/drivers/gpu/drm/i915/gvt/v=
gpu.c
> index f6d7e33c7099..a1c53e645ec6 100644
> --- a/drivers/gpu/drm/i915/gvt/vgpu.c
> +++ b/drivers/gpu/drm/i915/gvt/vgpu.c
> @@ -300,8 +300,6 @@ void intel_gvt_destroy_vgpu(struct intel_vgpu *vgpu)
>  	mutex_unlock(&vgpu->vgpu_lock);
> =20
>  	mutex_lock(&gvt->lock);
> -	if (idr_is_empty(&gvt->vgpu_idr))
> -		intel_gvt_clean_irq(gvt);
>  	intel_gvt_update_vgpu_types(gvt);
>  	mutex_unlock(&gvt->lock);
> =20
> --=20
> 2.29.2
>=20
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--=20

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--7uYPyRQQ5N0D02nI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCX8XVTQAKCRCxBBozTXgY
J9PGAJ4xeK83+TApP5+q8724IjGEpGU4sQCfcSDAwq2jKFglbel9gfh0UcDWAAM=
=66jR
-----END PGP SIGNATURE-----

--7uYPyRQQ5N0D02nI--

--===============0138328441==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0138328441==--
