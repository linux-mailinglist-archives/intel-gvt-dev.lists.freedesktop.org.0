Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6949997CF35
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 20 Sep 2024 00:26:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4359E10E03A;
	Thu, 19 Sep 2024 22:26:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EoYo30SJ";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E488810E03A
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 19 Sep 2024 22:26:01 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-42cbc38a997so8917345e9.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 19 Sep 2024 15:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726784760; x=1727389560; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nhVCI+Vkvj8erBDAQeDfxlemLxTgdK6ZHUy8PTchAsY=;
 b=EoYo30SJhuoAmjZ1eR5GoLZyv5k0sCdEO+D4w5pxI3TcKX4EgWeCsWtThHZwfUOPQU
 mPeXnNPYR+8hCR0PuxaX36WSPcdjTOtQHQm6SuF7s1OPFN26T9D+iJaz9qLwPSdTDOpB
 V1sksAYrm+64IziK1R137SGK76Zh8TTzw9l4UPBH81Xw19tSbTmnmzbgKDi0913rUtmB
 XHFpWAdr0OwZccdbYYmrFQXmvmk81EPdcHS0VYZQjbgba3cFoMsuDHHG7udEkwdjExdg
 sDz9Kn6NpC+qLeGMaceiHQ0CY2rJwiReTvOgdnPhREnF+t+PTKOEl1YwUEDKXtvXYIUE
 8ocw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726784760; x=1727389560;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:to:from:date:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=nhVCI+Vkvj8erBDAQeDfxlemLxTgdK6ZHUy8PTchAsY=;
 b=cfeqIzWmbLnb+euIE/QISNDWKOICcXLfvXGb0Dx7gORO0GXmrTQB4bZLxybp05L+/7
 K+/yPyGOxNoO2S3rfO81xgCNb+bUd3irbwbkLqM0b4VmJM5wCGi7ONH/pow9N/JbgtJL
 GXHpm2M75RvLtkr5e1sei/JYGzBlibHAOd+gPlEkOwEkWiaX3K7HSDOeZKiRW3F2vsrW
 aCvjJw0QPKKaAy6NGNQXVGR42j5Byh4qewft7qBPIeRyhorlEvzFdg+udV0+CVwOXVhX
 wplZCMBYLs2MWilIwGOJQuQjJK3PM7T4aKsld4A7y+0trtSw7T1d7m+nSknu0xB1iG+u
 KAoA==
X-Gm-Message-State: AOJu0Yyrdt3/pjMZBT9mwTl42pCwCGHsk9ExJALX9qAFqB2tjjGQ7l85
 VCJUYK4wNcGe1I6SM9RF+lfQ/ld4pup2Zu9oLCGUnPMWuLqpgjxgjhCLTUkOr3k=
X-Google-Smtp-Source: AGHT+IGRghEQpgMe3FOJqUZoWFvdLpDcTNwVjC4T2J121OXPskuGWwjHJ6tKuXlJZECQ80p8iyV77g==
X-Received: by 2002:a05:600c:4f53:b0:42c:bd4d:e8d6 with SMTP id
 5b1f17b1804b1-42e7a8c1d04mr5985375e9.3.1726784759521; 
 Thu, 19 Sep 2024 15:25:59 -0700 (PDT)
Received: from [127.0.0.1] (81-223-177-90.static.upcbusiness.at.
 [81.223.177.90]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42e7af898fasm6606725e9.15.2024.09.19.15.25.56
 for <intel-gvt-dev@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Sep 2024 15:25:58 -0700 (PDT)
Date: Fri, 20 Sep 2024 00:25:56 +0200
From: Zhi Wang <zhi.wang.linux@gmail.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_drm/i915/gvt=3A_use_macros?=
 =?US-ASCII?Q?_from_drm=5Fdp=2Eh_instead_of_duplication?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20240917105226.768276-1-jani.nikula@intel.com>
References: <20240917105226.768276-1-jani.nikula@intel.com>
Message-ID: <18742FF2-A1E7-40DD-B8F4-B4BB5C0D3655@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
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



On September 17, 2024 12:52:26 PM GMT+02:00, Jani Nikula <jani=2Enikula@in=
tel=2Ecom> wrote:
>Use the existing macros in drm_dp=2Eh for DPCD and DP AUX instead of
>duplicating=2E Remove unused macros, as well as the duplicate definition
>of DPCD_SIZE=2E
>
>AUX_NATIVE_REPLY_NAK is left unchanged, as it does not match
>DP_AUX_NATIVE_REPLY_NACK, and I'm not sure what the right thing to do is
>here=2E
>

Guess it must be the emulation routines from the older platforms e=2Eg IVB=
 or HSW and forgot to update when moving to SKL and later=2E=2E=2EI can't a=
ccess the GPU spec now=2E Will talk to Zhenyu when I met him on the weekend=
 in the summit=2E=20

>Signed-off-by: Jani Nikula <jani=2Enikula@intel=2Ecom>
>---
> drivers/gpu/drm/i915/gvt/display=2Ec  |  4 ++-
> drivers/gpu/drm/i915/gvt/display=2Eh  | 42 ----------------------------
> drivers/gpu/drm/i915/gvt/edid=2Ec     | 12 ++++----
> drivers/gpu/drm/i915/gvt/edid=2Eh     |  8 ------
> drivers/gpu/drm/i915/gvt/handlers=2Ec | 43 +++++++++++++++++------------
> 5 files changed, 36 insertions(+), 73 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/gvt/display=2Ec b/drivers/gpu/drm/i915/=
gvt/display=2Ec
>index c66d6d3177c8=2E=2E17f74cb244bb 100644
>--- a/drivers/gpu/drm/i915/gvt/display=2Ec
>+++ b/drivers/gpu/drm/i915/gvt/display=2Ec
>@@ -32,6 +32,8 @@
>  *
>  */
>=20
>+#include <drm/display/drm_dp=2Eh>
>+
> #include "i915_drv=2Eh"
> #include "i915_reg=2Eh"
> #include "gvt=2Eh"
>@@ -568,7 +570,7 @@ static int setup_virtual_dp_monitor(struct intel_vgpu=
 *vgpu, int port_num,
>=20
> 	memcpy(port->dpcd->data, dpcd_fix_data, DPCD_HEADER_SIZE);
> 	port->dpcd->data_valid =3D true;
>-	port->dpcd->data[DPCD_SINK_COUNT] =3D 0x1;
>+	port->dpcd->data[DP_SINK_COUNT] =3D 0x1;
> 	port->type =3D type;
> 	port->id =3D resolution;
> 	port->vrefresh_k =3D GVT_DEFAULT_REFRESH_RATE * MSEC_PER_SEC;
>diff --git a/drivers/gpu/drm/i915/gvt/display=2Eh b/drivers/gpu/drm/i915/=
gvt/display=2Eh
>index f5616f99ef2f=2E=2E8090bc53c7e1 100644
>--- a/drivers/gpu/drm/i915/gvt/display=2Eh
>+++ b/drivers/gpu/drm/i915/gvt/display=2Eh
>@@ -59,52 +59,10 @@ struct intel_vgpu;
>=20
> #define INTEL_GVT_MAX_UEVENT_VARS	3
>=20
>-/* DPCD start */
>-#define DPCD_SIZE	0x700
>-
>-/* DPCD */
>-#define DP_SET_POWER            0x600
>-#define DP_SET_POWER_D0         0x1
>-#define AUX_NATIVE_WRITE        0x8
>-#define AUX_NATIVE_READ         0x9
>-
>-#define AUX_NATIVE_REPLY_MASK   (0x3 << 4)
>-#define AUX_NATIVE_REPLY_ACK    (0x0 << 4)
> #define AUX_NATIVE_REPLY_NAK    (0x1 << 4)
>-#define AUX_NATIVE_REPLY_DEFER  (0x2 << 4)
>=20
> #define AUX_BURST_SIZE          20
>=20
>-/* DPCD addresses */
>-#define DPCD_REV			0x000
>-#define DPCD_MAX_LINK_RATE		0x001
>-#define DPCD_MAX_LANE_COUNT		0x002
>-
>-#define DPCD_TRAINING_PATTERN_SET	0x102
>-#define	DPCD_SINK_COUNT			0x200
>-#define DPCD_LANE0_1_STATUS		0x202
>-#define DPCD_LANE2_3_STATUS		0x203
>-#define DPCD_LANE_ALIGN_STATUS_UPDATED	0x204
>-#define DPCD_SINK_STATUS		0x205
>-
>-/* link training */
>-#define DPCD_TRAINING_PATTERN_SET_MASK	0x03
>-#define DPCD_LINK_TRAINING_DISABLED	0x00
>-#define DPCD_TRAINING_PATTERN_1		0x01
>-#define DPCD_TRAINING_PATTERN_2		0x02
>-
>-#define DPCD_CP_READY_MASK		(1 << 6)
>-
>-/* lane status */
>-#define DPCD_LANES_CR_DONE		0x11
>-#define DPCD_LANES_EQ_DONE		0x22
>-#define DPCD_SYMBOL_LOCKED		0x44
>-
>-#define DPCD_INTERLANE_ALIGN_DONE	0x01
>-
>-#define DPCD_SINK_IN_SYNC		0x03
>-/* DPCD end */
>-
> #define SBI_RESPONSE_MASK               0x3
> #define SBI_RESPONSE_SHIFT              0x1
> #define SBI_STAT_MASK                   0x1
>diff --git a/drivers/gpu/drm/i915/gvt/edid=2Ec b/drivers/gpu/drm/i915/gvt=
/edid=2Ec
>index c022dc736045=2E=2E0a357ca42db1 100644
>--- a/drivers/gpu/drm/i915/gvt/edid=2Ec
>+++ b/drivers/gpu/drm/i915/gvt/edid=2Ec
>@@ -32,6 +32,8 @@
>  *
>  */
>=20
>+#include <drm/display/drm_dp=2Eh>
>+
> #include "display/intel_dp_aux_regs=2Eh"
> #include "display/intel_gmbus_regs=2Eh"
> #include "gvt=2Eh"
>@@ -504,13 +506,13 @@ void intel_gvt_i2c_handle_aux_ch_write(struct intel=
_vgpu *vgpu,
> 	}
>=20
> 	/* Always set the wanted value for vms=2E */
>-	ret_msg_size =3D (((op & 0x1) =3D=3D GVT_AUX_I2C_READ) ? 2 : 1);
>+	ret_msg_size =3D (((op & 0x1) =3D=3D DP_AUX_I2C_READ) ? 2 : 1);
> 	vgpu_vreg(vgpu, offset) =3D
> 		DP_AUX_CH_CTL_DONE |
> 		DP_AUX_CH_CTL_MESSAGE_SIZE(ret_msg_size);
>=20
> 	if (msg_length =3D=3D 3) {
>-		if (!(op & GVT_AUX_I2C_MOT)) {
>+		if (!(op & DP_AUX_I2C_MOT)) {
> 			/* stop */
> 			intel_vgpu_init_i2c_edid(vgpu);
> 		} else {
>@@ -530,7 +532,7 @@ void intel_gvt_i2c_handle_aux_ch_write(struct intel_v=
gpu *vgpu,
> 					i2c_edid->edid_available =3D true;
> 			}
> 		}
>-	} else if ((op & 0x1) =3D=3D GVT_AUX_I2C_WRITE) {
>+	} else if ((op & 0x1) =3D=3D DP_AUX_I2C_WRITE) {
> 		/* TODO
> 		 * We only support EDID reading from I2C_over_AUX=2E And
> 		 * we do not expect the index mode to be used=2E Right now
>@@ -538,7 +540,7 @@ void intel_gvt_i2c_handle_aux_ch_write(struct intel_v=
gpu *vgpu,
> 		 * support the gfx driver to do EDID access=2E
> 		 */
> 	} else {
>-		if (drm_WARN_ON(&i915->drm, (op & 0x1) !=3D GVT_AUX_I2C_READ))
>+		if (drm_WARN_ON(&i915->drm, (op & 0x1) !=3D DP_AUX_I2C_READ))
> 			return;
> 		if (drm_WARN_ON(&i915->drm, msg_length !=3D 4))
> 			return;
>@@ -553,7 +555,7 @@ void intel_gvt_i2c_handle_aux_ch_write(struct intel_v=
gpu *vgpu,
> 	 * ACK of I2C_WRITE
> 	 * returned byte if it is READ
> 	 */
>-	aux_data_for_write |=3D GVT_AUX_I2C_REPLY_ACK << 24;
>+	aux_data_for_write |=3D DP_AUX_I2C_REPLY_ACK << 24;
> 	vgpu_vreg(vgpu, offset + 4) =3D aux_data_for_write;
> }
>=20
>diff --git a/drivers/gpu/drm/i915/gvt/edid=2Eh b/drivers/gpu/drm/i915/gvt=
/edid=2Eh
>index c3b5a55aecb3=2E=2E13fd06590929 100644
>--- a/drivers/gpu/drm/i915/gvt/edid=2Eh
>+++ b/drivers/gpu/drm/i915/gvt/edid=2Eh
>@@ -42,14 +42,6 @@ struct intel_vgpu;
> #define EDID_SIZE		128
> #define EDID_ADDR		0x50 /* Linux hvm EDID addr */
>=20
>-#define GVT_AUX_NATIVE_WRITE			0x8
>-#define GVT_AUX_NATIVE_READ			0x9
>-#define GVT_AUX_I2C_WRITE			0x0
>-#define GVT_AUX_I2C_READ			0x1
>-#define GVT_AUX_I2C_STATUS			0x2
>-#define GVT_AUX_I2C_MOT				0x4
>-#define GVT_AUX_I2C_REPLY_ACK			0x0
>-
> struct intel_vgpu_edid_data {
> 	bool data_valid;
> 	unsigned char edid_block[EDID_SIZE];
>diff --git a/drivers/gpu/drm/i915/gvt/handlers=2Ec b/drivers/gpu/drm/i915=
/gvt/handlers=2Ec
>index 0f09344d3c20=2E=2E9494d812c00a 100644
>--- a/drivers/gpu/drm/i915/gvt/handlers=2Ec
>+++ b/drivers/gpu/drm/i915/gvt/handlers=2Ec
>@@ -36,6 +36,8 @@
>=20
>  */
>=20
>+#include <drm/display/drm_dp=2Eh>
>+
> #include "i915_drv=2Eh"
> #include "i915_reg=2Eh"
> #include "gvt=2Eh"
>@@ -1129,29 +1131,36 @@ static int dp_aux_ch_ctl_trans_done(struct intel_=
vgpu *vgpu, u32 value,
> static void dp_aux_ch_ctl_link_training(struct intel_vgpu_dpcd_data *dpc=
d,
> 		u8 t)
> {
>-	if ((t & DPCD_TRAINING_PATTERN_SET_MASK) =3D=3D DPCD_TRAINING_PATTERN_1=
) {
>+	if ((t & DP_TRAINING_PATTERN_MASK) =3D=3D DP_TRAINING_PATTERN_1) {
> 		/* training pattern 1 for CR */
> 		/* set LANE0_CR_DONE, LANE1_CR_DONE */
>-		dpcd->data[DPCD_LANE0_1_STATUS] |=3D DPCD_LANES_CR_DONE;
>+		dpcd->data[DP_LANE0_1_STATUS] |=3D DP_LANE_CR_DONE |
>+			DP_LANE_CR_DONE << 4;
> 		/* set LANE2_CR_DONE, LANE3_CR_DONE */
>-		dpcd->data[DPCD_LANE2_3_STATUS] |=3D DPCD_LANES_CR_DONE;
>-	} else if ((t & DPCD_TRAINING_PATTERN_SET_MASK) =3D=3D
>-			DPCD_TRAINING_PATTERN_2) {
>+		dpcd->data[DP_LANE2_3_STATUS] |=3D DP_LANE_CR_DONE |
>+			DP_LANE_CR_DONE << 4;
>+	} else if ((t & DP_TRAINING_PATTERN_MASK) =3D=3D
>+			DP_TRAINING_PATTERN_2) {
> 		/* training pattern 2 for EQ */
> 		/* Set CHANNEL_EQ_DONE and  SYMBOL_LOCKED for Lane0_1 */
>-		dpcd->data[DPCD_LANE0_1_STATUS] |=3D DPCD_LANES_EQ_DONE;
>-		dpcd->data[DPCD_LANE0_1_STATUS] |=3D DPCD_SYMBOL_LOCKED;
>+		dpcd->data[DP_LANE0_1_STATUS] |=3D DP_LANE_CHANNEL_EQ_DONE |
>+			DP_LANE_CHANNEL_EQ_DONE << 4;
>+		dpcd->data[DP_LANE0_1_STATUS] |=3D DP_LANE_SYMBOL_LOCKED |
>+			DP_LANE_SYMBOL_LOCKED << 4;
> 		/* Set CHANNEL_EQ_DONE and  SYMBOL_LOCKED for Lane2_3 */
>-		dpcd->data[DPCD_LANE2_3_STATUS] |=3D DPCD_LANES_EQ_DONE;
>-		dpcd->data[DPCD_LANE2_3_STATUS] |=3D DPCD_SYMBOL_LOCKED;
>+		dpcd->data[DP_LANE2_3_STATUS] |=3D DP_LANE_CHANNEL_EQ_DONE |
>+			DP_LANE_CHANNEL_EQ_DONE << 4;
>+		dpcd->data[DP_LANE2_3_STATUS] |=3D DP_LANE_SYMBOL_LOCKED |
>+			DP_LANE_SYMBOL_LOCKED << 4;
> 		/* set INTERLANE_ALIGN_DONE */
>-		dpcd->data[DPCD_LANE_ALIGN_STATUS_UPDATED] |=3D
>-			DPCD_INTERLANE_ALIGN_DONE;
>-	} else if ((t & DPCD_TRAINING_PATTERN_SET_MASK) =3D=3D
>-			DPCD_LINK_TRAINING_DISABLED) {
>+		dpcd->data[DP_LANE_ALIGN_STATUS_UPDATED] |=3D
>+			DP_INTERLANE_ALIGN_DONE;
>+	} else if ((t & DP_TRAINING_PATTERN_MASK) =3D=3D
>+			DP_TRAINING_PATTERN_DISABLE) {
> 		/* finish link training */
> 		/* set sink status as synchronized */
>-		dpcd->data[DPCD_SINK_STATUS] =3D DPCD_SINK_IN_SYNC;
>+		dpcd->data[DP_SINK_STATUS] =3D DP_RECEIVE_PORT_0_STATUS |
>+			DP_RECEIVE_PORT_1_STATUS;
> 	}
> }
>=20
>@@ -1206,7 +1215,7 @@ static int dp_aux_ch_ctl_mmio_write(struct intel_vg=
pu *vgpu,
> 	len =3D msg & 0xff;
> 	op =3D ctrl >> 4;
>=20
>-	if (op =3D=3D GVT_AUX_NATIVE_WRITE) {
>+	if (op =3D=3D DP_AUX_NATIVE_WRITE) {
> 		int t;
> 		u8 buf[16];
>=20
>@@ -1252,7 +1261,7 @@ static int dp_aux_ch_ctl_mmio_write(struct intel_vg=
pu *vgpu,
>=20
> 				dpcd->data[p] =3D buf[t];
> 				/* check for link training */
>-				if (p =3D=3D DPCD_TRAINING_PATTERN_SET)
>+				if (p =3D=3D DP_TRAINING_PATTERN_SET)
> 					dp_aux_ch_ctl_link_training(dpcd,
> 							buf[t]);
> 			}
>@@ -1265,7 +1274,7 @@ static int dp_aux_ch_ctl_mmio_write(struct intel_vg=
pu *vgpu,
> 		return 0;
> 	}
>=20
>-	if (op =3D=3D GVT_AUX_NATIVE_READ) {
>+	if (op =3D=3D DP_AUX_NATIVE_READ) {
> 		int idx, i, ret =3D 0;
>=20
> 		if ((addr + len + 1) >=3D DPCD_SIZE) {
