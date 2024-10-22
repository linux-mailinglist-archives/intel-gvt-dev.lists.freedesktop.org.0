Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB909AA164
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 22 Oct 2024 13:52:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD38010E31D;
	Tue, 22 Oct 2024 11:52:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gM+03Yfr";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9931110E19E;
 Tue, 22 Oct 2024 11:52:20 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id
 46e09a7af769-7180a5ba498so2453310a34.2; 
 Tue, 22 Oct 2024 04:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729597940; x=1730202740; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xOPOmdoj9G1wHcWYa9U+eo+t+Efs6r13F6bXJ9vUZbg=;
 b=gM+03Yfrru8blm+q4jLNnUiuk6wuKZ/0b4e6V/vbcMK5kz1yqnYP2b96v+858viQ0i
 k62gfvChGrwsY0snEinaiK+EXDYzrABvisAigjj0SKUS32EyHnOe++BYXsNU5twVZDdU
 0SdZdmVIVa5qpbquNC8WMDnERNtUO4AGq7q7cNpWBGduMl5sLpyg6+c9A7nsg3vNtb6F
 7JGvS+/p3e8nCs635R3wWGs3cL+F3zzpJZtndi5V5PfapJ9wLtRS38EtMa+8s5Ks605m
 YyAlMIkB/x/bUHSG4Nwa4gMxksNayZN6FBaBxY34NVhuqiqEf78waoT40+INzH5b/81a
 8QLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729597940; x=1730202740;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xOPOmdoj9G1wHcWYa9U+eo+t+Efs6r13F6bXJ9vUZbg=;
 b=UZMJPjedftKbxeIA1yyFxvYnu4h5OZKugCYBrgzdtGpMLfPYwQE7gpf3Oz7TYtshXJ
 cz5PICOOeP7erSlFmazcVt/cBWd0a6k6PpAEm+UVjIgnJDQgCqW0lpKUmVM6hutZg0Ad
 kDPp/j9AdHe1COOUCKMF65t5wXav9ff+KL1reeZHOTdzYKaZqtwjutNLR/veVGlxCIaD
 ja19N2m9EH2BgxxAA0YtxHJbSmwX6OSIE4AN0yattZLHan8CTd/0zXS8vctQpL8bAmHY
 S+e/3GC5wetp97moQUlp70yWxtvQplAkeQS8JqhV78yxK8k8LMV99fGzojL8jrvu1+qT
 G1Og==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbVtlO8dCiH9evP3TbU8y32VdqZcpKgPhLFHqc/RT7+LatFqa92pg87CSKLCplupmvc7QFTQRRkKI=@lists.freedesktop.org,
 AJvYcCXEHLaqF0Q6gFb8EyjY8Wq89PsmWs4GaxTavZLvHxYN+UapuHmlZLmSGgSjFmd4HH2jStcMLjqnEwLMF2NGuQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzzZgIqzqgtxYjV6ZJ4dgPjLis92bSKVPQL0Zirok8jbtMTxLtD
 ZNXLSVeybf/oGvEhRCt6jCgL4HXFILfj36TvNYRBExGBXmdmFAFBAIkTuadVDO2hMkshmA6BEig
 wue7jV26/28WUBw9y+h4VWoF1sW8=
X-Google-Smtp-Source: AGHT+IFW+QgjgDXarwBLO0y6WlqwQ49U5KNk8YgyCxXTZ47VdOPTgBwTRRimdVdWTpXu1+eB2adhMqZGArTT6lsmC28=
X-Received: by 2002:a05:6830:912:b0:715:3f20:bd47 with SMTP id
 46e09a7af769-71840e66dc6mr3225007a34.6.1729597939574; Tue, 22 Oct 2024
 04:52:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240930135342.3562755-1-jani.nikula@intel.com>
 <SN7PR11MB6750B146EA2054AB40F3F026E34C2@SN7PR11MB6750.namprd11.prod.outlook.com>
In-Reply-To: <SN7PR11MB6750B146EA2054AB40F3F026E34C2@SN7PR11MB6750.namprd11.prod.outlook.com>
From: Zhi Wang <zhi.wang.linux@gmail.com>
Date: Tue, 22 Oct 2024 14:52:07 +0300
Message-ID: <CAN=xO45AmJ=v8eyoFnNUKbu4RCQat3HFZkPuEShTwJWWcmP5pQ@mail.gmail.com>
Subject: Re: [RESEND] drm/i915/gvt: use macros from drm_dp.h instead of
 duplication
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>
Cc: "Nikula, Jani" <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org, 
 intel-gvt-dev@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="000000000000caf2aa06250f6665"
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

--000000000000caf2aa06250f6665
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Zhi Wang <zhiwang@kernel.org>


Sorry for the late reply as I was on vacation.

On Tue, Oct 22, 2024, 2:50=E2=80=AFPM Kandpal, Suraj <suraj.kandpal@intel.c=
om>
wrote:

>
>
> > -----Original Message-----
> > From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of
> Jani
> > Nikula
> > Sent: Monday, September 30, 2024 7:24 PM
> > To: intel-gfx@lists.freedesktop.org; intel-gvt-dev@lists.freedesktop.or=
g
> > Cc: Nikula, Jani <jani.nikula@intel.com>
> > Subject: [RESEND] drm/i915/gvt: use macros from drm_dp.h instead of
> > duplication
> >
> > Use the existing macros in drm_dp.h for DPCD and DP AUX instead of
> > duplicating. Remove unused macros, as well as the duplicate definition =
of
> > DPCD_SIZE.
> >
> > AUX_NATIVE_REPLY_NAK is left unchanged, as it does not match
> > DP_AUX_NATIVE_REPLY_NACK, and I'm not sure what the right thing to do i=
s
> > here.
>
> LGTM,
> Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
>
> >
> > Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> > ---
> >  drivers/gpu/drm/i915/gvt/display.c  |  4 ++-
> > drivers/gpu/drm/i915/gvt/display.h  | 42 ----------------------------
> >  drivers/gpu/drm/i915/gvt/edid.c     | 12 ++++----
> >  drivers/gpu/drm/i915/gvt/edid.h     |  8 ------
> >  drivers/gpu/drm/i915/gvt/handlers.c | 43 +++++++++++++++++------------
> >  5 files changed, 36 insertions(+), 73 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gvt/display.c
> > b/drivers/gpu/drm/i915/gvt/display.c
> > index c66d6d3177c8..17f74cb244bb 100644
> > --- a/drivers/gpu/drm/i915/gvt/display.c
> > +++ b/drivers/gpu/drm/i915/gvt/display.c
> > @@ -32,6 +32,8 @@
> >   *
> >   */
> >
> > +#include <drm/display/drm_dp.h>
> > +
> >  #include "i915_drv.h"
> >  #include "i915_reg.h"
> >  #include "gvt.h"
> > @@ -568,7 +570,7 @@ static int setup_virtual_dp_monitor(struct intel_vg=
pu
> > *vgpu, int port_num,
> >
> >       memcpy(port->dpcd->data, dpcd_fix_data, DPCD_HEADER_SIZE);
> >       port->dpcd->data_valid =3D true;
> > -     port->dpcd->data[DPCD_SINK_COUNT] =3D 0x1;
> > +     port->dpcd->data[DP_SINK_COUNT] =3D 0x1;
> >       port->type =3D type;
> >       port->id =3D resolution;
> >       port->vrefresh_k =3D GVT_DEFAULT_REFRESH_RATE * MSEC_PER_SEC;
> > diff --git a/drivers/gpu/drm/i915/gvt/display.h
> > b/drivers/gpu/drm/i915/gvt/display.h
> > index f5616f99ef2f..8090bc53c7e1 100644
> > --- a/drivers/gpu/drm/i915/gvt/display.h
> > +++ b/drivers/gpu/drm/i915/gvt/display.h
> > @@ -59,52 +59,10 @@ struct intel_vgpu;
> >
> >  #define INTEL_GVT_MAX_UEVENT_VARS    3
> >
> > -/* DPCD start */
> > -#define DPCD_SIZE    0x700
> > -
> > -/* DPCD */
> > -#define DP_SET_POWER            0x600
> > -#define DP_SET_POWER_D0         0x1
> > -#define AUX_NATIVE_WRITE        0x8
> > -#define AUX_NATIVE_READ         0x9
> > -
> > -#define AUX_NATIVE_REPLY_MASK   (0x3 << 4)
> > -#define AUX_NATIVE_REPLY_ACK    (0x0 << 4)
> >  #define AUX_NATIVE_REPLY_NAK    (0x1 << 4)
> > -#define AUX_NATIVE_REPLY_DEFER  (0x2 << 4)
> >
> >  #define AUX_BURST_SIZE          20
> >
> > -/* DPCD addresses */
> > -#define DPCD_REV                     0x000
> > -#define DPCD_MAX_LINK_RATE           0x001
> > -#define DPCD_MAX_LANE_COUNT          0x002
> > -
> > -#define DPCD_TRAINING_PATTERN_SET    0x102
> > -#define      DPCD_SINK_COUNT                 0x200
> > -#define DPCD_LANE0_1_STATUS          0x202
> > -#define DPCD_LANE2_3_STATUS          0x203
> > -#define DPCD_LANE_ALIGN_STATUS_UPDATED       0x204
> > -#define DPCD_SINK_STATUS             0x205
> > -
> > -/* link training */
> > -#define DPCD_TRAINING_PATTERN_SET_MASK       0x03
> > -#define DPCD_LINK_TRAINING_DISABLED  0x00
> > -#define DPCD_TRAINING_PATTERN_1              0x01
> > -#define DPCD_TRAINING_PATTERN_2              0x02
> > -
> > -#define DPCD_CP_READY_MASK           (1 << 6)
> > -
> > -/* lane status */
> > -#define DPCD_LANES_CR_DONE           0x11
> > -#define DPCD_LANES_EQ_DONE           0x22
> > -#define DPCD_SYMBOL_LOCKED           0x44
> > -
> > -#define DPCD_INTERLANE_ALIGN_DONE    0x01
> > -
> > -#define DPCD_SINK_IN_SYNC            0x03
> > -/* DPCD end */
> > -
> >  #define SBI_RESPONSE_MASK               0x3
> >  #define SBI_RESPONSE_SHIFT              0x1
> >  #define SBI_STAT_MASK                   0x1
> > diff --git a/drivers/gpu/drm/i915/gvt/edid.c
> > b/drivers/gpu/drm/i915/gvt/edid.c index c022dc736045..0a357ca42db1
> > 100644
> > --- a/drivers/gpu/drm/i915/gvt/edid.c
> > +++ b/drivers/gpu/drm/i915/gvt/edid.c
> > @@ -32,6 +32,8 @@
> >   *
> >   */
> >
> > +#include <drm/display/drm_dp.h>
> > +
> >  #include "display/intel_dp_aux_regs.h"
> >  #include "display/intel_gmbus_regs.h"
> >  #include "gvt.h"
> > @@ -504,13 +506,13 @@ void intel_gvt_i2c_handle_aux_ch_write(struct
> > intel_vgpu *vgpu,
> >       }
> >
> >       /* Always set the wanted value for vms. */
> > -     ret_msg_size =3D (((op & 0x1) =3D=3D GVT_AUX_I2C_READ) ? 2 : 1);
> > +     ret_msg_size =3D (((op & 0x1) =3D=3D DP_AUX_I2C_READ) ? 2 : 1);
> >       vgpu_vreg(vgpu, offset) =3D
> >               DP_AUX_CH_CTL_DONE |
> >               DP_AUX_CH_CTL_MESSAGE_SIZE(ret_msg_size);
> >
> >       if (msg_length =3D=3D 3) {
> > -             if (!(op & GVT_AUX_I2C_MOT)) {
> > +             if (!(op & DP_AUX_I2C_MOT)) {
> >                       /* stop */
> >                       intel_vgpu_init_i2c_edid(vgpu);
> >               } else {
> > @@ -530,7 +532,7 @@ void intel_gvt_i2c_handle_aux_ch_write(struct
> > intel_vgpu *vgpu,
> >                                       i2c_edid->edid_available =3D true=
;
> >                       }
> >               }
> > -     } else if ((op & 0x1) =3D=3D GVT_AUX_I2C_WRITE) {
> > +     } else if ((op & 0x1) =3D=3D DP_AUX_I2C_WRITE) {
> >               /* TODO
> >                * We only support EDID reading from I2C_over_AUX. And
> >                * we do not expect the index mode to be used. Right now
> > @@ -538,7 +540,7 @@ void intel_gvt_i2c_handle_aux_ch_write(struct
> > intel_vgpu *vgpu,
> >                * support the gfx driver to do EDID access.
> >                */
> >       } else {
> > -             if (drm_WARN_ON(&i915->drm, (op & 0x1) !=3D
> > GVT_AUX_I2C_READ))
> > +             if (drm_WARN_ON(&i915->drm, (op & 0x1) !=3D
> > DP_AUX_I2C_READ))
> >                       return;
> >               if (drm_WARN_ON(&i915->drm, msg_length !=3D 4))
> >                       return;
> > @@ -553,7 +555,7 @@ void intel_gvt_i2c_handle_aux_ch_write(struct
> > intel_vgpu *vgpu,
> >        * ACK of I2C_WRITE
> >        * returned byte if it is READ
> >        */
> > -     aux_data_for_write |=3D GVT_AUX_I2C_REPLY_ACK << 24;
> > +     aux_data_for_write |=3D DP_AUX_I2C_REPLY_ACK << 24;
> >       vgpu_vreg(vgpu, offset + 4) =3D aux_data_for_write;  }
> >
> > diff --git a/drivers/gpu/drm/i915/gvt/edid.h
> > b/drivers/gpu/drm/i915/gvt/edid.h index c3b5a55aecb3..13fd06590929
> > 100644
> > --- a/drivers/gpu/drm/i915/gvt/edid.h
> > +++ b/drivers/gpu/drm/i915/gvt/edid.h
> > @@ -42,14 +42,6 @@ struct intel_vgpu;
> >  #define EDID_SIZE            128
> >  #define EDID_ADDR            0x50 /* Linux hvm EDID addr */
> >
> > -#define GVT_AUX_NATIVE_WRITE                 0x8
> > -#define GVT_AUX_NATIVE_READ                  0x9
> > -#define GVT_AUX_I2C_WRITE                    0x0
> > -#define GVT_AUX_I2C_READ                     0x1
> > -#define GVT_AUX_I2C_STATUS                   0x2
> > -#define GVT_AUX_I2C_MOT                              0x4
> > -#define GVT_AUX_I2C_REPLY_ACK                        0x0
> > -
> >  struct intel_vgpu_edid_data {
> >       bool data_valid;
> >       unsigned char edid_block[EDID_SIZE];
> > diff --git a/drivers/gpu/drm/i915/gvt/handlers.c
> > b/drivers/gpu/drm/i915/gvt/handlers.c
> > index 0f09344d3c20..9494d812c00a 100644
> > --- a/drivers/gpu/drm/i915/gvt/handlers.c
> > +++ b/drivers/gpu/drm/i915/gvt/handlers.c
> > @@ -36,6 +36,8 @@
> >
> >   */
> >
> > +#include <drm/display/drm_dp.h>
> > +
> >  #include "i915_drv.h"
> >  #include "i915_reg.h"
> >  #include "gvt.h"
> > @@ -1129,29 +1131,36 @@ static int dp_aux_ch_ctl_trans_done(struct
> > intel_vgpu *vgpu, u32 value,  static void
> dp_aux_ch_ctl_link_training(struct
> > intel_vgpu_dpcd_data *dpcd,
> >               u8 t)
> >  {
> > -     if ((t & DPCD_TRAINING_PATTERN_SET_MASK) =3D=3D
> > DPCD_TRAINING_PATTERN_1) {
> > +     if ((t & DP_TRAINING_PATTERN_MASK) =3D=3D DP_TRAINING_PATTERN_1)
> > {
> >               /* training pattern 1 for CR */
> >               /* set LANE0_CR_DONE, LANE1_CR_DONE */
> > -             dpcd->data[DPCD_LANE0_1_STATUS] |=3D
> > DPCD_LANES_CR_DONE;
> > +             dpcd->data[DP_LANE0_1_STATUS] |=3D DP_LANE_CR_DONE |
> > +                     DP_LANE_CR_DONE << 4;
> >               /* set LANE2_CR_DONE, LANE3_CR_DONE */
> > -             dpcd->data[DPCD_LANE2_3_STATUS] |=3D
> > DPCD_LANES_CR_DONE;
> > -     } else if ((t & DPCD_TRAINING_PATTERN_SET_MASK) =3D=3D
> > -                     DPCD_TRAINING_PATTERN_2) {
> > +             dpcd->data[DP_LANE2_3_STATUS] |=3D DP_LANE_CR_DONE |
> > +                     DP_LANE_CR_DONE << 4;
> > +     } else if ((t & DP_TRAINING_PATTERN_MASK) =3D=3D
> > +                     DP_TRAINING_PATTERN_2) {
> >               /* training pattern 2 for EQ */
> >               /* Set CHANNEL_EQ_DONE and  SYMBOL_LOCKED for
> > Lane0_1 */
> > -             dpcd->data[DPCD_LANE0_1_STATUS] |=3D
> > DPCD_LANES_EQ_DONE;
> > -             dpcd->data[DPCD_LANE0_1_STATUS] |=3D
> > DPCD_SYMBOL_LOCKED;
> > +             dpcd->data[DP_LANE0_1_STATUS] |=3D
> > DP_LANE_CHANNEL_EQ_DONE |
> > +                     DP_LANE_CHANNEL_EQ_DONE << 4;
> > +             dpcd->data[DP_LANE0_1_STATUS] |=3D
> > DP_LANE_SYMBOL_LOCKED |
> > +                     DP_LANE_SYMBOL_LOCKED << 4;
> >               /* Set CHANNEL_EQ_DONE and  SYMBOL_LOCKED for
> > Lane2_3 */
> > -             dpcd->data[DPCD_LANE2_3_STATUS] |=3D
> > DPCD_LANES_EQ_DONE;
> > -             dpcd->data[DPCD_LANE2_3_STATUS] |=3D
> > DPCD_SYMBOL_LOCKED;
> > +             dpcd->data[DP_LANE2_3_STATUS] |=3D
> > DP_LANE_CHANNEL_EQ_DONE |
> > +                     DP_LANE_CHANNEL_EQ_DONE << 4;
> > +             dpcd->data[DP_LANE2_3_STATUS] |=3D
> > DP_LANE_SYMBOL_LOCKED |
> > +                     DP_LANE_SYMBOL_LOCKED << 4;
> >               /* set INTERLANE_ALIGN_DONE */
> > -             dpcd->data[DPCD_LANE_ALIGN_STATUS_UPDATED] |=3D
> > -                     DPCD_INTERLANE_ALIGN_DONE;
> > -     } else if ((t & DPCD_TRAINING_PATTERN_SET_MASK) =3D=3D
> > -                     DPCD_LINK_TRAINING_DISABLED) {
> > +             dpcd->data[DP_LANE_ALIGN_STATUS_UPDATED] |=3D
> > +                     DP_INTERLANE_ALIGN_DONE;
> > +     } else if ((t & DP_TRAINING_PATTERN_MASK) =3D=3D
> > +                     DP_TRAINING_PATTERN_DISABLE) {
> >               /* finish link training */
> >               /* set sink status as synchronized */
> > -             dpcd->data[DPCD_SINK_STATUS] =3D DPCD_SINK_IN_SYNC;
> > +             dpcd->data[DP_SINK_STATUS] =3D DP_RECEIVE_PORT_0_STATUS
> > |
> > +                     DP_RECEIVE_PORT_1_STATUS;
> >       }
> >  }
> >
> > @@ -1206,7 +1215,7 @@ static int dp_aux_ch_ctl_mmio_write(struct
> > intel_vgpu *vgpu,
> >       len =3D msg & 0xff;
> >       op =3D ctrl >> 4;
> >
> > -     if (op =3D=3D GVT_AUX_NATIVE_WRITE) {
> > +     if (op =3D=3D DP_AUX_NATIVE_WRITE) {
> >               int t;
> >               u8 buf[16];
> >
> > @@ -1252,7 +1261,7 @@ static int dp_aux_ch_ctl_mmio_write(struct
> > intel_vgpu *vgpu,
> >
> >                               dpcd->data[p] =3D buf[t];
> >                               /* check for link training */
> > -                             if (p =3D=3D DPCD_TRAINING_PATTERN_SET)
> > +                             if (p =3D=3D DP_TRAINING_PATTERN_SET)
> >                                       dp_aux_ch_ctl_link_training(dpcd,
> >                                                       buf[t]);
> >                       }
> > @@ -1265,7 +1274,7 @@ static int dp_aux_ch_ctl_mmio_write(struct
> > intel_vgpu *vgpu,
> >               return 0;
> >       }
> >
> > -     if (op =3D=3D GVT_AUX_NATIVE_READ) {
> > +     if (op =3D=3D DP_AUX_NATIVE_READ) {
> >               int idx, i, ret =3D 0;
> >
> >               if ((addr + len + 1) >=3D DPCD_SIZE) {
> > --
> > 2.39.5
>
>

--000000000000caf2aa06250f6665
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><p dir=3D"ltr">Reviewed-by: Zhi Wang &lt;<a href=3D"mailt=
o:zhiwang@kernel.org">zhiwang@kernel.org</a>&gt;</p><p dir=3D"ltr"><br></p>=
<p dir=3D"ltr">Sorry for the late reply as I was on vacation.=C2=A0</p></di=
v>
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue=
, Oct 22, 2024, 2:50=E2=80=AFPM Kandpal, Suraj &lt;<a href=3D"mailto:suraj.=
kandpal@intel.com" target=3D"_blank" rel=3D"noreferrer">suraj.kandpal@intel=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
&gt; -----Original Message-----<br>
&gt; From: Intel-gfx &lt;<a href=3D"mailto:intel-gfx-bounces@lists.freedesk=
top.org" rel=3D"noreferrer noreferrer" target=3D"_blank">intel-gfx-bounces@=
lists.freedesktop.org</a>&gt; On Behalf Of Jani<br>
&gt; Nikula<br>
&gt; Sent: Monday, September 30, 2024 7:24 PM<br>
&gt; To: <a href=3D"mailto:intel-gfx@lists.freedesktop.org" rel=3D"noreferr=
er noreferrer" target=3D"_blank">intel-gfx@lists.freedesktop.org</a>; <a hr=
ef=3D"mailto:intel-gvt-dev@lists.freedesktop.org" rel=3D"noreferrer norefer=
rer" target=3D"_blank">intel-gvt-dev@lists.freedesktop.org</a><br>
&gt; Cc: Nikula, Jani &lt;<a href=3D"mailto:jani.nikula@intel.com" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">jani.nikula@intel.com</a>&gt;<br>
&gt; Subject: [RESEND] drm/i915/gvt: use macros from drm_dp.h instead of<br=
>
&gt; duplication<br>
&gt; <br>
&gt; Use the existing macros in drm_dp.h for DPCD and DP AUX instead of<br>
&gt; duplicating. Remove unused macros, as well as the duplicate definition=
 of<br>
&gt; DPCD_SIZE.<br>
&gt; <br>
&gt; AUX_NATIVE_REPLY_NAK is left unchanged, as it does not match<br>
&gt; DP_AUX_NATIVE_REPLY_NACK, and I&#39;m not sure what the right thing to=
 do is<br>
&gt; here.<br>
<br>
LGTM,<br>
Reviewed-by: Suraj Kandpal &lt;<a href=3D"mailto:suraj.kandpal@intel.com" r=
el=3D"noreferrer noreferrer" target=3D"_blank">suraj.kandpal@intel.com</a>&=
gt;<br>
<br>
&gt; <br>
&gt; Signed-off-by: Jani Nikula &lt;<a href=3D"mailto:jani.nikula@intel.com=
" rel=3D"noreferrer noreferrer" target=3D"_blank">jani.nikula@intel.com</a>=
&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/gpu/drm/i915/gvt/display.c=C2=A0 |=C2=A0 4 ++-<br>
&gt; drivers/gpu/drm/i915/gvt/display.h=C2=A0 | 42 ------------------------=
----<br>
&gt;=C2=A0 drivers/gpu/drm/i915/gvt/edid.c=C2=A0 =C2=A0 =C2=A0| 12 ++++----=
<br>
&gt;=C2=A0 drivers/gpu/drm/i915/gvt/edid.h=C2=A0 =C2=A0 =C2=A0|=C2=A0 8 ---=
---<br>
&gt;=C2=A0 drivers/gpu/drm/i915/gvt/handlers.c | 43 +++++++++++++++++------=
------<br>
&gt;=C2=A0 5 files changed, 36 insertions(+), 73 deletions(-)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/i915/gvt/display.c<br>
&gt; b/drivers/gpu/drm/i915/gvt/display.c<br>
&gt; index c66d6d3177c8..17f74cb244bb 100644<br>
&gt; --- a/drivers/gpu/drm/i915/gvt/display.c<br>
&gt; +++ b/drivers/gpu/drm/i915/gvt/display.c<br>
&gt; @@ -32,6 +32,8 @@<br>
&gt;=C2=A0 =C2=A0*<br>
&gt;=C2=A0 =C2=A0*/<br>
&gt; <br>
&gt; +#include &lt;drm/display/drm_dp.h&gt;<br>
&gt; +<br>
&gt;=C2=A0 #include &quot;i915_drv.h&quot;<br>
&gt;=C2=A0 #include &quot;i915_reg.h&quot;<br>
&gt;=C2=A0 #include &quot;gvt.h&quot;<br>
&gt; @@ -568,7 +570,7 @@ static int setup_virtual_dp_monitor(struct intel_v=
gpu<br>
&gt; *vgpu, int port_num,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0memcpy(port-&gt;dpcd-&gt;data, dpcd_fix_data=
, DPCD_HEADER_SIZE);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0port-&gt;dpcd-&gt;data_valid =3D true;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0port-&gt;dpcd-&gt;data[DPCD_SINK_COUNT] =3D 0x1;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0port-&gt;dpcd-&gt;data[DP_SINK_COUNT] =3D 0x1;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0port-&gt;type =3D type;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0port-&gt;id =3D resolution;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0port-&gt;vrefresh_k =3D GVT_DEFAULT_REFRESH_=
RATE * MSEC_PER_SEC;<br>
&gt; diff --git a/drivers/gpu/drm/i915/gvt/display.h<br>
&gt; b/drivers/gpu/drm/i915/gvt/display.h<br>
&gt; index f5616f99ef2f..8090bc53c7e1 100644<br>
&gt; --- a/drivers/gpu/drm/i915/gvt/display.h<br>
&gt; +++ b/drivers/gpu/drm/i915/gvt/display.h<br>
&gt; @@ -59,52 +59,10 @@ struct intel_vgpu;<br>
&gt; <br>
&gt;=C2=A0 #define INTEL_GVT_MAX_UEVENT_VARS=C2=A0 =C2=A0 3<br>
&gt; <br>
&gt; -/* DPCD start */<br>
&gt; -#define DPCD_SIZE=C2=A0 =C2=A0 0x700<br>
&gt; -<br>
&gt; -/* DPCD */<br>
&gt; -#define DP_SET_POWER=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x600<b=
r>
&gt; -#define DP_SET_POWER_D0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x1<br>
&gt; -#define AUX_NATIVE_WRITE=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x8<br>
&gt; -#define AUX_NATIVE_READ=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x9<br>
&gt; -<br>
&gt; -#define AUX_NATIVE_REPLY_MASK=C2=A0 =C2=A0(0x3 &lt;&lt; 4)<br>
&gt; -#define AUX_NATIVE_REPLY_ACK=C2=A0 =C2=A0 (0x0 &lt;&lt; 4)<br>
&gt;=C2=A0 #define AUX_NATIVE_REPLY_NAK=C2=A0 =C2=A0 (0x1 &lt;&lt; 4)<br>
&gt; -#define AUX_NATIVE_REPLY_DEFER=C2=A0 (0x2 &lt;&lt; 4)<br>
&gt; <br>
&gt;=C2=A0 #define AUX_BURST_SIZE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 20<br>
&gt; <br>
&gt; -/* DPCD addresses */<br>
&gt; -#define DPCD_REV=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A00x000<br>
&gt; -#define DPCD_MAX_LINK_RATE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x=
001<br>
&gt; -#define DPCD_MAX_LANE_COUNT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x002<b=
r>
&gt; -<br>
&gt; -#define DPCD_TRAINING_PATTERN_SET=C2=A0 =C2=A0 0x102<br>
&gt; -#define=C2=A0 =C2=A0 =C2=A0 DPCD_SINK_COUNT=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x200<br>
&gt; -#define DPCD_LANE0_1_STATUS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x202<b=
r>
&gt; -#define DPCD_LANE2_3_STATUS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x203<b=
r>
&gt; -#define DPCD_LANE_ALIGN_STATUS_UPDATED=C2=A0 =C2=A0 =C2=A0 =C2=A00x20=
4<br>
&gt; -#define DPCD_SINK_STATUS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A00x205<br>
&gt; -<br>
&gt; -/* link training */<br>
&gt; -#define DPCD_TRAINING_PATTERN_SET_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A00x03=
<br>
&gt; -#define DPCD_LINK_TRAINING_DISABLED=C2=A0 0x00<br>
&gt; -#define DPCD_TRAINING_PATTERN_1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 0x01<br>
&gt; -#define DPCD_TRAINING_PATTERN_2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 0x02<br>
&gt; -<br>
&gt; -#define DPCD_CP_READY_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1=
 &lt;&lt; 6)<br>
&gt; -<br>
&gt; -/* lane status */<br>
&gt; -#define DPCD_LANES_CR_DONE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x=
11<br>
&gt; -#define DPCD_LANES_EQ_DONE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x=
22<br>
&gt; -#define DPCD_SYMBOL_LOCKED=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x=
44<br>
&gt; -<br>
&gt; -#define DPCD_INTERLANE_ALIGN_DONE=C2=A0 =C2=A0 0x01<br>
&gt; -<br>
&gt; -#define DPCD_SINK_IN_SYNC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x=
03<br>
&gt; -/* DPCD end */<br>
&gt; -<br>
&gt;=C2=A0 #define SBI_RESPONSE_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A00x3<br>
&gt;=C2=A0 #define SBI_RESPONSE_SHIFT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 0x1<br>
&gt;=C2=A0 #define SBI_STAT_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A00x1<br>
&gt; diff --git a/drivers/gpu/drm/i915/gvt/edid.c<br>
&gt; b/drivers/gpu/drm/i915/gvt/edid.c index c022dc736045..0a357ca42db1<br>
&gt; 100644<br>
&gt; --- a/drivers/gpu/drm/i915/gvt/edid.c<br>
&gt; +++ b/drivers/gpu/drm/i915/gvt/edid.c<br>
&gt; @@ -32,6 +32,8 @@<br>
&gt;=C2=A0 =C2=A0*<br>
&gt;=C2=A0 =C2=A0*/<br>
&gt; <br>
&gt; +#include &lt;drm/display/drm_dp.h&gt;<br>
&gt; +<br>
&gt;=C2=A0 #include &quot;display/intel_dp_aux_regs.h&quot;<br>
&gt;=C2=A0 #include &quot;display/intel_gmbus_regs.h&quot;<br>
&gt;=C2=A0 #include &quot;gvt.h&quot;<br>
&gt; @@ -504,13 +506,13 @@ void intel_gvt_i2c_handle_aux_ch_write(struct<br=
>
&gt; intel_vgpu *vgpu,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Always set the wanted value for vms. */<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0ret_msg_size =3D (((op &amp; 0x1) =3D=3D GVT_AUX_=
I2C_READ) ? 2 : 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret_msg_size =3D (((op &amp; 0x1) =3D=3D DP_AUX_I=
2C_READ) ? 2 : 1);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0vgpu_vreg(vgpu, offset) =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DP_AUX_CH_CTL_DO=
NE |<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DP_AUX_CH_CTL_ME=
SSAGE_SIZE(ret_msg_size);<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (msg_length =3D=3D 3) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!(op &amp; GVT_AU=
X_I2C_MOT)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!(op &amp; DP_AUX=
_I2C_MOT)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0/* stop */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0intel_vgpu_init_i2c_edid(vgpu);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; @@ -530,7 +532,7 @@ void intel_gvt_i2c_handle_aux_ch_write(struct<br>
&gt; intel_vgpu *vgpu,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i2c_ed=
id-&gt;edid_available =3D true;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0} else if ((op &amp; 0x1) =3D=3D GVT_AUX_I2C_WRIT=
E) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} else if ((op &amp; 0x1) =3D=3D DP_AUX_I2C_WRITE=
) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* TODO<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * We only suppo=
rt EDID reading from I2C_over_AUX. And<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * we do not exp=
ect the index mode to be used. Right now<br>
&gt; @@ -538,7 +540,7 @@ void intel_gvt_i2c_handle_aux_ch_write(struct<br>
&gt; intel_vgpu *vgpu,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * support the g=
fx driver to do EDID access.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (drm_WARN_ON(&amp;=
i915-&gt;drm, (op &amp; 0x1) !=3D<br>
&gt; GVT_AUX_I2C_READ))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (drm_WARN_ON(&amp;=
i915-&gt;drm, (op &amp; 0x1) !=3D<br>
&gt; DP_AUX_I2C_READ))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0return;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (drm_WARN_ON(=
&amp;i915-&gt;drm, msg_length !=3D 4))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0return;<br>
&gt; @@ -553,7 +555,7 @@ void intel_gvt_i2c_handle_aux_ch_write(struct<br>
&gt; intel_vgpu *vgpu,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 * ACK of I2C_WRITE<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 * returned byte if it is READ<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0aux_data_for_write |=3D GVT_AUX_I2C_REPLY_ACK &lt=
;&lt; 24;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0aux_data_for_write |=3D DP_AUX_I2C_REPLY_ACK &lt;=
&lt; 24;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0vgpu_vreg(vgpu, offset + 4) =3D aux_data_for=
_write;=C2=A0 }<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/i915/gvt/edid.h<br>
&gt; b/drivers/gpu/drm/i915/gvt/edid.h index c3b5a55aecb3..13fd06590929<br>
&gt; 100644<br>
&gt; --- a/drivers/gpu/drm/i915/gvt/edid.h<br>
&gt; +++ b/drivers/gpu/drm/i915/gvt/edid.h<br>
&gt; @@ -42,14 +42,6 @@ struct intel_vgpu;<br>
&gt;=C2=A0 #define EDID_SIZE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 128<b=
r>
&gt;=C2=A0 #define EDID_ADDR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x50 =
/* Linux hvm EDID addr */<br>
&gt; <br>
&gt; -#define GVT_AUX_NATIVE_WRITE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A00x8<br>
&gt; -#define GVT_AUX_NATIVE_READ=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 0x9<br>
&gt; -#define GVT_AUX_I2C_WRITE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0<br>
&gt; -#define GVT_AUX_I2C_READ=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x1<br>
&gt; -#define GVT_AUX_I2C_STATUS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A00x2<br>
&gt; -#define GVT_AUX_I2C_MOT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x4<br>
&gt; -#define GVT_AUX_I2C_REPLY_ACK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0<br>
&gt; -<br>
&gt;=C2=A0 struct intel_vgpu_edid_data {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool data_valid;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned char edid_block[EDID_SIZE];<br>
&gt; diff --git a/drivers/gpu/drm/i915/gvt/handlers.c<br>
&gt; b/drivers/gpu/drm/i915/gvt/handlers.c<br>
&gt; index 0f09344d3c20..9494d812c00a 100644<br>
&gt; --- a/drivers/gpu/drm/i915/gvt/handlers.c<br>
&gt; +++ b/drivers/gpu/drm/i915/gvt/handlers.c<br>
&gt; @@ -36,6 +36,8 @@<br>
&gt; <br>
&gt;=C2=A0 =C2=A0*/<br>
&gt; <br>
&gt; +#include &lt;drm/display/drm_dp.h&gt;<br>
&gt; +<br>
&gt;=C2=A0 #include &quot;i915_drv.h&quot;<br>
&gt;=C2=A0 #include &quot;i915_reg.h&quot;<br>
&gt;=C2=A0 #include &quot;gvt.h&quot;<br>
&gt; @@ -1129,29 +1131,36 @@ static int dp_aux_ch_ctl_trans_done(struct<br>
&gt; intel_vgpu *vgpu, u32 value,=C2=A0 static void dp_aux_ch_ctl_link_trai=
ning(struct<br>
&gt; intel_vgpu_dpcd_data *dpcd,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u8 t)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if ((t &amp; DPCD_TRAINING_PATTERN_SET_MASK) =3D=
=3D<br>
&gt; DPCD_TRAINING_PATTERN_1) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if ((t &amp; DP_TRAINING_PATTERN_MASK) =3D=3D DP_=
TRAINING_PATTERN_1)<br>
&gt; {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* training patt=
ern 1 for CR */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* set LANE0_CR_=
DONE, LANE1_CR_DONE */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dpcd-&gt;data[DPCD_LA=
NE0_1_STATUS] |=3D<br>
&gt; DPCD_LANES_CR_DONE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dpcd-&gt;data[DP_LANE=
0_1_STATUS] |=3D DP_LANE_CR_DONE |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0DP_LANE_CR_DONE &lt;&lt; 4;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* set LANE2_CR_=
DONE, LANE3_CR_DONE */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dpcd-&gt;data[DPCD_LA=
NE2_3_STATUS] |=3D<br>
&gt; DPCD_LANES_CR_DONE;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0} else if ((t &amp; DPCD_TRAINING_PATTERN_SET_MAS=
K) =3D=3D<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0DPCD_TRAINING_PATTERN_2) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dpcd-&gt;data[DP_LANE=
2_3_STATUS] |=3D DP_LANE_CR_DONE |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0DP_LANE_CR_DONE &lt;&lt; 4;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} else if ((t &amp; DP_TRAINING_PATTERN_MASK) =3D=
=3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0DP_TRAINING_PATTERN_2) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* training patt=
ern 2 for EQ */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Set CHANNEL_E=
Q_DONE and=C2=A0 SYMBOL_LOCKED for<br>
&gt; Lane0_1 */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dpcd-&gt;data[DPCD_LA=
NE0_1_STATUS] |=3D<br>
&gt; DPCD_LANES_EQ_DONE;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dpcd-&gt;data[DPCD_LA=
NE0_1_STATUS] |=3D<br>
&gt; DPCD_SYMBOL_LOCKED;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dpcd-&gt;data[DP_LANE=
0_1_STATUS] |=3D<br>
&gt; DP_LANE_CHANNEL_EQ_DONE |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0DP_LANE_CHANNEL_EQ_DONE &lt;&lt; 4;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dpcd-&gt;data[DP_LANE=
0_1_STATUS] |=3D<br>
&gt; DP_LANE_SYMBOL_LOCKED |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0DP_LANE_SYMBOL_LOCKED &lt;&lt; 4;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Set CHANNEL_E=
Q_DONE and=C2=A0 SYMBOL_LOCKED for<br>
&gt; Lane2_3 */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dpcd-&gt;data[DPCD_LA=
NE2_3_STATUS] |=3D<br>
&gt; DPCD_LANES_EQ_DONE;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dpcd-&gt;data[DPCD_LA=
NE2_3_STATUS] |=3D<br>
&gt; DPCD_SYMBOL_LOCKED;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dpcd-&gt;data[DP_LANE=
2_3_STATUS] |=3D<br>
&gt; DP_LANE_CHANNEL_EQ_DONE |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0DP_LANE_CHANNEL_EQ_DONE &lt;&lt; 4;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dpcd-&gt;data[DP_LANE=
2_3_STATUS] |=3D<br>
&gt; DP_LANE_SYMBOL_LOCKED |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0DP_LANE_SYMBOL_LOCKED &lt;&lt; 4;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* set INTERLANE=
_ALIGN_DONE */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dpcd-&gt;data[DPCD_LA=
NE_ALIGN_STATUS_UPDATED] |=3D<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0DPCD_INTERLANE_ALIGN_DONE;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0} else if ((t &amp; DPCD_TRAINING_PATTERN_SET_MAS=
K) =3D=3D<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0DPCD_LINK_TRAINING_DISABLED) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dpcd-&gt;data[DP_LANE=
_ALIGN_STATUS_UPDATED] |=3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0DP_INTERLANE_ALIGN_DONE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} else if ((t &amp; DP_TRAINING_PATTERN_MASK) =3D=
=3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0DP_TRAINING_PATTERN_DISABLE) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* finish link t=
raining */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* set sink stat=
us as synchronized */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dpcd-&gt;data[DPCD_SI=
NK_STATUS] =3D DPCD_SINK_IN_SYNC;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dpcd-&gt;data[DP_SINK=
_STATUS] =3D DP_RECEIVE_PORT_0_STATUS<br>
&gt; |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0DP_RECEIVE_PORT_1_STATUS;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 }<br>
&gt; <br>
&gt; @@ -1206,7 +1215,7 @@ static int dp_aux_ch_ctl_mmio_write(struct<br>
&gt; intel_vgpu *vgpu,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0len =3D msg &amp; 0xff;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0op =3D ctrl &gt;&gt; 4;<br>
&gt; <br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (op =3D=3D GVT_AUX_NATIVE_WRITE) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (op =3D=3D DP_AUX_NATIVE_WRITE) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int t;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u8 buf[16];<br>
&gt; <br>
&gt; @@ -1252,7 +1261,7 @@ static int dp_aux_ch_ctl_mmio_write(struct<br>
&gt; intel_vgpu *vgpu,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dpcd-&gt;data[p] =3D buf[t];<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* check for link training */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (p =3D=3D DPCD_TRAINING_PATTERN_SET)<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (p =3D=3D DP_TRAINING_PATTERN_SET)<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dp_aux=
_ch_ctl_link_training(dpcd,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0buf[t]);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0}<br>
&gt; @@ -1265,7 +1274,7 @@ static int dp_aux_ch_ctl_mmio_write(struct<br>
&gt; intel_vgpu *vgpu,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; <br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (op =3D=3D GVT_AUX_NATIVE_READ) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (op =3D=3D DP_AUX_NATIVE_READ) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int idx, i, ret =
=3D 0;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((addr + len =
+ 1) &gt;=3D DPCD_SIZE) {<br>
&gt; --<br>
&gt; 2.39.5<br>
<br>
</blockquote></div>

--000000000000caf2aa06250f6665--
