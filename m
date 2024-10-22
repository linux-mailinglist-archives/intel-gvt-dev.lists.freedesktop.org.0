Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2B69AA22A
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 22 Oct 2024 14:34:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2C0110E677;
	Tue, 22 Oct 2024 12:34:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CFCTAHxe";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEF6610E678;
 Tue, 22 Oct 2024 12:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729600474; x=1761136474;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=6PiCEkmz3PxV76Ql/JGaGp23Cy9ETcqyvbQd66TUE8U=;
 b=CFCTAHxeNXCrPlzbrqbrfyh1kV3yzueyhtdpxdgsS3i7gxRExfIANaJD
 m1XfIzEHCMJUH3GeKg44JA4pNvXLSlEO2Cru29IHxtG1GmdQkci0gU6i7
 te0/T/eErXO0KqMgfiJUePiPgZzWPp1Ztzz08C5wS7SgLvne5cSgxVtlq
 DlWo00hvyGhL5XpJj56zy17JMnk3yt7/wy4u/Ycrxt9CH4TNALoeRiIHL
 +/Tfx7qkSOnLFQMcVpbvBVBJJxhG7g+DIW6C4t0OC7dJppdxTzr/5qQY6
 ROWiqqotpT9AaDzO7Upz9/Kk8vucslgcUNY5IaNiwWm8BineDJcmgUhCS g==;
X-CSE-ConnectionGUID: DEE2ZvNOToagE0jA4IdYDw==
X-CSE-MsgGUID: gKjL1f4XSdGOb0aO6fPWlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29006818"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29006818"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 05:34:33 -0700
X-CSE-ConnectionGUID: CHO74jyyS4OEIm4vyc93pA==
X-CSE-MsgGUID: a712ZmJIQUScPom4qzmUFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="84463636"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.4])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 05:34:31 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Zhi Wang <zhi.wang.linux@gmail.com>, "Kandpal, Suraj"
 <suraj.kandpal@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org
Subject: Re: [RESEND] drm/i915/gvt: use macros from drm_dp.h instead of
 duplication
In-Reply-To: <CAN=xO45AmJ=v8eyoFnNUKbu4RCQat3HFZkPuEShTwJWWcmP5pQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240930135342.3562755-1-jani.nikula@intel.com>
 <SN7PR11MB6750B146EA2054AB40F3F026E34C2@SN7PR11MB6750.namprd11.prod.outlook.com>
 <CAN=xO45AmJ=v8eyoFnNUKbu4RCQat3HFZkPuEShTwJWWcmP5pQ@mail.gmail.com>
Date: Tue, 22 Oct 2024 15:34:28 +0300
Message-ID: <87ldyguxij.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Tue, 22 Oct 2024, Zhi Wang <zhi.wang.linux@gmail.com> wrote:
> Reviewed-by: Zhi Wang <zhiwang@kernel.org>
>
>
> Sorry for the late reply as I was on vacation.

Thanks for the reviews, pushed to drm-intel-next.

BR,
Jani.

>
> On Tue, Oct 22, 2024, 2:50=E2=80=AFPM Kandpal, Suraj <suraj.kandpal@intel=
.com>
> wrote:
>
>>
>>
>> > -----Original Message-----
>> > From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of
>> Jani
>> > Nikula
>> > Sent: Monday, September 30, 2024 7:24 PM
>> > To: intel-gfx@lists.freedesktop.org; intel-gvt-dev@lists.freedesktop.o=
rg
>> > Cc: Nikula, Jani <jani.nikula@intel.com>
>> > Subject: [RESEND] drm/i915/gvt: use macros from drm_dp.h instead of
>> > duplication
>> >
>> > Use the existing macros in drm_dp.h for DPCD and DP AUX instead of
>> > duplicating. Remove unused macros, as well as the duplicate definition=
 of
>> > DPCD_SIZE.
>> >
>> > AUX_NATIVE_REPLY_NAK is left unchanged, as it does not match
>> > DP_AUX_NATIVE_REPLY_NACK, and I'm not sure what the right thing to do =
is
>> > here.
>>
>> LGTM,
>> Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
>>
>> >
>> > Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> > ---
>> >  drivers/gpu/drm/i915/gvt/display.c  |  4 ++-
>> > drivers/gpu/drm/i915/gvt/display.h  | 42 ----------------------------
>> >  drivers/gpu/drm/i915/gvt/edid.c     | 12 ++++----
>> >  drivers/gpu/drm/i915/gvt/edid.h     |  8 ------
>> >  drivers/gpu/drm/i915/gvt/handlers.c | 43 +++++++++++++++++------------
>> >  5 files changed, 36 insertions(+), 73 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/i915/gvt/display.c
>> > b/drivers/gpu/drm/i915/gvt/display.c
>> > index c66d6d3177c8..17f74cb244bb 100644
>> > --- a/drivers/gpu/drm/i915/gvt/display.c
>> > +++ b/drivers/gpu/drm/i915/gvt/display.c
>> > @@ -32,6 +32,8 @@
>> >   *
>> >   */
>> >
>> > +#include <drm/display/drm_dp.h>
>> > +
>> >  #include "i915_drv.h"
>> >  #include "i915_reg.h"
>> >  #include "gvt.h"
>> > @@ -568,7 +570,7 @@ static int setup_virtual_dp_monitor(struct intel_v=
gpu
>> > *vgpu, int port_num,
>> >
>> >       memcpy(port->dpcd->data, dpcd_fix_data, DPCD_HEADER_SIZE);
>> >       port->dpcd->data_valid =3D true;
>> > -     port->dpcd->data[DPCD_SINK_COUNT] =3D 0x1;
>> > +     port->dpcd->data[DP_SINK_COUNT] =3D 0x1;
>> >       port->type =3D type;
>> >       port->id =3D resolution;
>> >       port->vrefresh_k =3D GVT_DEFAULT_REFRESH_RATE * MSEC_PER_SEC;
>> > diff --git a/drivers/gpu/drm/i915/gvt/display.h
>> > b/drivers/gpu/drm/i915/gvt/display.h
>> > index f5616f99ef2f..8090bc53c7e1 100644
>> > --- a/drivers/gpu/drm/i915/gvt/display.h
>> > +++ b/drivers/gpu/drm/i915/gvt/display.h
>> > @@ -59,52 +59,10 @@ struct intel_vgpu;
>> >
>> >  #define INTEL_GVT_MAX_UEVENT_VARS    3
>> >
>> > -/* DPCD start */
>> > -#define DPCD_SIZE    0x700
>> > -
>> > -/* DPCD */
>> > -#define DP_SET_POWER            0x600
>> > -#define DP_SET_POWER_D0         0x1
>> > -#define AUX_NATIVE_WRITE        0x8
>> > -#define AUX_NATIVE_READ         0x9
>> > -
>> > -#define AUX_NATIVE_REPLY_MASK   (0x3 << 4)
>> > -#define AUX_NATIVE_REPLY_ACK    (0x0 << 4)
>> >  #define AUX_NATIVE_REPLY_NAK    (0x1 << 4)
>> > -#define AUX_NATIVE_REPLY_DEFER  (0x2 << 4)
>> >
>> >  #define AUX_BURST_SIZE          20
>> >
>> > -/* DPCD addresses */
>> > -#define DPCD_REV                     0x000
>> > -#define DPCD_MAX_LINK_RATE           0x001
>> > -#define DPCD_MAX_LANE_COUNT          0x002
>> > -
>> > -#define DPCD_TRAINING_PATTERN_SET    0x102
>> > -#define      DPCD_SINK_COUNT                 0x200
>> > -#define DPCD_LANE0_1_STATUS          0x202
>> > -#define DPCD_LANE2_3_STATUS          0x203
>> > -#define DPCD_LANE_ALIGN_STATUS_UPDATED       0x204
>> > -#define DPCD_SINK_STATUS             0x205
>> > -
>> > -/* link training */
>> > -#define DPCD_TRAINING_PATTERN_SET_MASK       0x03
>> > -#define DPCD_LINK_TRAINING_DISABLED  0x00
>> > -#define DPCD_TRAINING_PATTERN_1              0x01
>> > -#define DPCD_TRAINING_PATTERN_2              0x02
>> > -
>> > -#define DPCD_CP_READY_MASK           (1 << 6)
>> > -
>> > -/* lane status */
>> > -#define DPCD_LANES_CR_DONE           0x11
>> > -#define DPCD_LANES_EQ_DONE           0x22
>> > -#define DPCD_SYMBOL_LOCKED           0x44
>> > -
>> > -#define DPCD_INTERLANE_ALIGN_DONE    0x01
>> > -
>> > -#define DPCD_SINK_IN_SYNC            0x03
>> > -/* DPCD end */
>> > -
>> >  #define SBI_RESPONSE_MASK               0x3
>> >  #define SBI_RESPONSE_SHIFT              0x1
>> >  #define SBI_STAT_MASK                   0x1
>> > diff --git a/drivers/gpu/drm/i915/gvt/edid.c
>> > b/drivers/gpu/drm/i915/gvt/edid.c index c022dc736045..0a357ca42db1
>> > 100644
>> > --- a/drivers/gpu/drm/i915/gvt/edid.c
>> > +++ b/drivers/gpu/drm/i915/gvt/edid.c
>> > @@ -32,6 +32,8 @@
>> >   *
>> >   */
>> >
>> > +#include <drm/display/drm_dp.h>
>> > +
>> >  #include "display/intel_dp_aux_regs.h"
>> >  #include "display/intel_gmbus_regs.h"
>> >  #include "gvt.h"
>> > @@ -504,13 +506,13 @@ void intel_gvt_i2c_handle_aux_ch_write(struct
>> > intel_vgpu *vgpu,
>> >       }
>> >
>> >       /* Always set the wanted value for vms. */
>> > -     ret_msg_size =3D (((op & 0x1) =3D=3D GVT_AUX_I2C_READ) ? 2 : 1);
>> > +     ret_msg_size =3D (((op & 0x1) =3D=3D DP_AUX_I2C_READ) ? 2 : 1);
>> >       vgpu_vreg(vgpu, offset) =3D
>> >               DP_AUX_CH_CTL_DONE |
>> >               DP_AUX_CH_CTL_MESSAGE_SIZE(ret_msg_size);
>> >
>> >       if (msg_length =3D=3D 3) {
>> > -             if (!(op & GVT_AUX_I2C_MOT)) {
>> > +             if (!(op & DP_AUX_I2C_MOT)) {
>> >                       /* stop */
>> >                       intel_vgpu_init_i2c_edid(vgpu);
>> >               } else {
>> > @@ -530,7 +532,7 @@ void intel_gvt_i2c_handle_aux_ch_write(struct
>> > intel_vgpu *vgpu,
>> >                                       i2c_edid->edid_available =3D tru=
e;
>> >                       }
>> >               }
>> > -     } else if ((op & 0x1) =3D=3D GVT_AUX_I2C_WRITE) {
>> > +     } else if ((op & 0x1) =3D=3D DP_AUX_I2C_WRITE) {
>> >               /* TODO
>> >                * We only support EDID reading from I2C_over_AUX. And
>> >                * we do not expect the index mode to be used. Right now
>> > @@ -538,7 +540,7 @@ void intel_gvt_i2c_handle_aux_ch_write(struct
>> > intel_vgpu *vgpu,
>> >                * support the gfx driver to do EDID access.
>> >                */
>> >       } else {
>> > -             if (drm_WARN_ON(&i915->drm, (op & 0x1) !=3D
>> > GVT_AUX_I2C_READ))
>> > +             if (drm_WARN_ON(&i915->drm, (op & 0x1) !=3D
>> > DP_AUX_I2C_READ))
>> >                       return;
>> >               if (drm_WARN_ON(&i915->drm, msg_length !=3D 4))
>> >                       return;
>> > @@ -553,7 +555,7 @@ void intel_gvt_i2c_handle_aux_ch_write(struct
>> > intel_vgpu *vgpu,
>> >        * ACK of I2C_WRITE
>> >        * returned byte if it is READ
>> >        */
>> > -     aux_data_for_write |=3D GVT_AUX_I2C_REPLY_ACK << 24;
>> > +     aux_data_for_write |=3D DP_AUX_I2C_REPLY_ACK << 24;
>> >       vgpu_vreg(vgpu, offset + 4) =3D aux_data_for_write;  }
>> >
>> > diff --git a/drivers/gpu/drm/i915/gvt/edid.h
>> > b/drivers/gpu/drm/i915/gvt/edid.h index c3b5a55aecb3..13fd06590929
>> > 100644
>> > --- a/drivers/gpu/drm/i915/gvt/edid.h
>> > +++ b/drivers/gpu/drm/i915/gvt/edid.h
>> > @@ -42,14 +42,6 @@ struct intel_vgpu;
>> >  #define EDID_SIZE            128
>> >  #define EDID_ADDR            0x50 /* Linux hvm EDID addr */
>> >
>> > -#define GVT_AUX_NATIVE_WRITE                 0x8
>> > -#define GVT_AUX_NATIVE_READ                  0x9
>> > -#define GVT_AUX_I2C_WRITE                    0x0
>> > -#define GVT_AUX_I2C_READ                     0x1
>> > -#define GVT_AUX_I2C_STATUS                   0x2
>> > -#define GVT_AUX_I2C_MOT                              0x4
>> > -#define GVT_AUX_I2C_REPLY_ACK                        0x0
>> > -
>> >  struct intel_vgpu_edid_data {
>> >       bool data_valid;
>> >       unsigned char edid_block[EDID_SIZE];
>> > diff --git a/drivers/gpu/drm/i915/gvt/handlers.c
>> > b/drivers/gpu/drm/i915/gvt/handlers.c
>> > index 0f09344d3c20..9494d812c00a 100644
>> > --- a/drivers/gpu/drm/i915/gvt/handlers.c
>> > +++ b/drivers/gpu/drm/i915/gvt/handlers.c
>> > @@ -36,6 +36,8 @@
>> >
>> >   */
>> >
>> > +#include <drm/display/drm_dp.h>
>> > +
>> >  #include "i915_drv.h"
>> >  #include "i915_reg.h"
>> >  #include "gvt.h"
>> > @@ -1129,29 +1131,36 @@ static int dp_aux_ch_ctl_trans_done(struct
>> > intel_vgpu *vgpu, u32 value,  static void
>> dp_aux_ch_ctl_link_training(struct
>> > intel_vgpu_dpcd_data *dpcd,
>> >               u8 t)
>> >  {
>> > -     if ((t & DPCD_TRAINING_PATTERN_SET_MASK) =3D=3D
>> > DPCD_TRAINING_PATTERN_1) {
>> > +     if ((t & DP_TRAINING_PATTERN_MASK) =3D=3D DP_TRAINING_PATTERN_1)
>> > {
>> >               /* training pattern 1 for CR */
>> >               /* set LANE0_CR_DONE, LANE1_CR_DONE */
>> > -             dpcd->data[DPCD_LANE0_1_STATUS] |=3D
>> > DPCD_LANES_CR_DONE;
>> > +             dpcd->data[DP_LANE0_1_STATUS] |=3D DP_LANE_CR_DONE |
>> > +                     DP_LANE_CR_DONE << 4;
>> >               /* set LANE2_CR_DONE, LANE3_CR_DONE */
>> > -             dpcd->data[DPCD_LANE2_3_STATUS] |=3D
>> > DPCD_LANES_CR_DONE;
>> > -     } else if ((t & DPCD_TRAINING_PATTERN_SET_MASK) =3D=3D
>> > -                     DPCD_TRAINING_PATTERN_2) {
>> > +             dpcd->data[DP_LANE2_3_STATUS] |=3D DP_LANE_CR_DONE |
>> > +                     DP_LANE_CR_DONE << 4;
>> > +     } else if ((t & DP_TRAINING_PATTERN_MASK) =3D=3D
>> > +                     DP_TRAINING_PATTERN_2) {
>> >               /* training pattern 2 for EQ */
>> >               /* Set CHANNEL_EQ_DONE and  SYMBOL_LOCKED for
>> > Lane0_1 */
>> > -             dpcd->data[DPCD_LANE0_1_STATUS] |=3D
>> > DPCD_LANES_EQ_DONE;
>> > -             dpcd->data[DPCD_LANE0_1_STATUS] |=3D
>> > DPCD_SYMBOL_LOCKED;
>> > +             dpcd->data[DP_LANE0_1_STATUS] |=3D
>> > DP_LANE_CHANNEL_EQ_DONE |
>> > +                     DP_LANE_CHANNEL_EQ_DONE << 4;
>> > +             dpcd->data[DP_LANE0_1_STATUS] |=3D
>> > DP_LANE_SYMBOL_LOCKED |
>> > +                     DP_LANE_SYMBOL_LOCKED << 4;
>> >               /* Set CHANNEL_EQ_DONE and  SYMBOL_LOCKED for
>> > Lane2_3 */
>> > -             dpcd->data[DPCD_LANE2_3_STATUS] |=3D
>> > DPCD_LANES_EQ_DONE;
>> > -             dpcd->data[DPCD_LANE2_3_STATUS] |=3D
>> > DPCD_SYMBOL_LOCKED;
>> > +             dpcd->data[DP_LANE2_3_STATUS] |=3D
>> > DP_LANE_CHANNEL_EQ_DONE |
>> > +                     DP_LANE_CHANNEL_EQ_DONE << 4;
>> > +             dpcd->data[DP_LANE2_3_STATUS] |=3D
>> > DP_LANE_SYMBOL_LOCKED |
>> > +                     DP_LANE_SYMBOL_LOCKED << 4;
>> >               /* set INTERLANE_ALIGN_DONE */
>> > -             dpcd->data[DPCD_LANE_ALIGN_STATUS_UPDATED] |=3D
>> > -                     DPCD_INTERLANE_ALIGN_DONE;
>> > -     } else if ((t & DPCD_TRAINING_PATTERN_SET_MASK) =3D=3D
>> > -                     DPCD_LINK_TRAINING_DISABLED) {
>> > +             dpcd->data[DP_LANE_ALIGN_STATUS_UPDATED] |=3D
>> > +                     DP_INTERLANE_ALIGN_DONE;
>> > +     } else if ((t & DP_TRAINING_PATTERN_MASK) =3D=3D
>> > +                     DP_TRAINING_PATTERN_DISABLE) {
>> >               /* finish link training */
>> >               /* set sink status as synchronized */
>> > -             dpcd->data[DPCD_SINK_STATUS] =3D DPCD_SINK_IN_SYNC;
>> > +             dpcd->data[DP_SINK_STATUS] =3D DP_RECEIVE_PORT_0_STATUS
>> > |
>> > +                     DP_RECEIVE_PORT_1_STATUS;
>> >       }
>> >  }
>> >
>> > @@ -1206,7 +1215,7 @@ static int dp_aux_ch_ctl_mmio_write(struct
>> > intel_vgpu *vgpu,
>> >       len =3D msg & 0xff;
>> >       op =3D ctrl >> 4;
>> >
>> > -     if (op =3D=3D GVT_AUX_NATIVE_WRITE) {
>> > +     if (op =3D=3D DP_AUX_NATIVE_WRITE) {
>> >               int t;
>> >               u8 buf[16];
>> >
>> > @@ -1252,7 +1261,7 @@ static int dp_aux_ch_ctl_mmio_write(struct
>> > intel_vgpu *vgpu,
>> >
>> >                               dpcd->data[p] =3D buf[t];
>> >                               /* check for link training */
>> > -                             if (p =3D=3D DPCD_TRAINING_PATTERN_SET)
>> > +                             if (p =3D=3D DP_TRAINING_PATTERN_SET)
>> >                                       dp_aux_ch_ctl_link_training(dpcd,
>> >                                                       buf[t]);
>> >                       }
>> > @@ -1265,7 +1274,7 @@ static int dp_aux_ch_ctl_mmio_write(struct
>> > intel_vgpu *vgpu,
>> >               return 0;
>> >       }
>> >
>> > -     if (op =3D=3D GVT_AUX_NATIVE_READ) {
>> > +     if (op =3D=3D DP_AUX_NATIVE_READ) {
>> >               int idx, i, ret =3D 0;
>> >
>> >               if ((addr + len + 1) >=3D DPCD_SIZE) {
>> > --
>> > 2.39.5
>>
>>

--=20
Jani Nikula, Intel
