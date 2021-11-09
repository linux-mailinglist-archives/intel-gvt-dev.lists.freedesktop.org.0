Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7748544AAC1
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  9 Nov 2021 10:44:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F31746EA30;
	Tue,  9 Nov 2021 09:44:14 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2693A6EA30;
 Tue,  9 Nov 2021 09:44:14 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 4A0B567373; Tue,  9 Nov 2021 10:44:11 +0100 (CET)
Date: Tue, 9 Nov 2021 10:44:10 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH 1/3] i915/gvt: seperate tracked MMIO table from handlers.c
Message-ID: <20211109094410.GA3073@lst.de>
References: <20211108212718.10576-1-zhi.a.wang@intel.com>
 <875yt17qzs.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <875yt17qzs.fsf@intel.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
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
Cc: Zhi Wang <zhi.wang.linux@gmail.com>, intel-gfx@lists.freedesktop.org,
 joonas.lahtinen@linux.intel.com, linux-kernel@vger.kernel.org,
 zhenyuw@linux.intel.com, dri-devel@lists.freedesktop.org, jgg@nvidia.com,
 rodrigo.vivi@intel.com, intel-gvt-dev@lists.freedesktop.org, hch@lst.de,
 zhi.a.wang@intel.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Tue, Nov 09, 2021 at 09:00:39AM +0200, Jani Nikula wrote:
> On Mon, 08 Nov 2021, Zhi Wang <zhi.wang.linux@gmail.com> wrote:
> > From: Zhi Wang <zhi.wang.linux@gmail.com>
> >
> > To support the new mdev interfaces and the re-factor patches from
> > Christoph, which moves the GVT-g code into a dedicated module, the GVT-g
> > MMIO snapshot still needs to be saved in i915 so that the inital clean HW
> > state can be used for the further vGPU. Seperate the tracked MMIO table
> > from GVT-g, so that GVT-g and i915 can both use it.
> 
> Do you really have to both put code in a header and then include that in
> multiple places?
> 
> I think you may need to rethink the whole approach, maybe make them
> actual tables instead of code.

I played around with this a bit and I can't think of anyting better,
especially given that a function (i915_mmio_reg_offset) is used to
get the offset.  So except for the cosmetic cleanup below I think this
is the best we can do for now:

diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gvt.h
index 4e2fd564abea1..c1f5f3b8abb2c 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.h
+++ b/drivers/gpu/drm/i915/gvt/gvt.h
@@ -295,8 +295,8 @@ struct intel_vgpu_type {
 };
 
 struct intel_gvt_hw_state {
-	void *cfg_space;
-	void *mmio;
+	u32 *cfg_space;
+	u32 *mmio;
 };
 
 struct intel_gvt {
diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index 6a08d362bf664..41d1bb80aba40 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -2124,6 +2124,17 @@ static int csfe_chicken1_mmio_write(struct intel_vgpu *vgpu,
 	return 0;
 }
 
+/*
+ * Generate the MMIO handler hash table.
+ */
+#define MMIO_F(reg, s, f, am, rm, d, r, w)			\
+do {								\
+	int ret = new_mmio_info(gvt, i915_mmio_reg_offset(reg),	\
+				f, s, am, rm, d, r, w);		\
+	if (ret)						\
+		return ret;					\
+} while (0)
+
 #include "mmio_table.h"
 
 static struct gvt_mmio_block *find_mmio_block(struct intel_gvt *gvt,
diff --git a/drivers/gpu/drm/i915/gvt/mmio_table.h b/drivers/gpu/drm/i915/gvt/mmio_table.h
index 39a4cb59695ae..2a17f7162224d 100644
--- a/drivers/gpu/drm/i915/gvt/mmio_table.h
+++ b/drivers/gpu/drm/i915/gvt/mmio_table.h
@@ -25,20 +25,7 @@
 #ifndef _GVT_MMIO_TABLE_H_
 #define _GVT_MMIO_TABLE_H_
 
-#ifdef GENERATE_MMIO_TABLE_IN_I915
-#define MMIO_F(reg, s, f, am, rm, d, r, w) do { \
-	ret = new_mmio_info(gvt, i915_mmio_reg_offset(reg)); \
-	if (ret) \
-		return ret; \
-} while (0)
-#else
-#define MMIO_F(reg, s, f, am, rm, d, r, w) do { \
-	ret = new_mmio_info(gvt, i915_mmio_reg_offset(reg), \
-		f, s, am, rm, d, r, w); \
-	if (ret) \
-		return ret; \
-} while (0)
-#endif
+#include "gvt/reg.h"
 
 #define MMIO_D(reg, d) \
 	MMIO_F(reg, 4, 0, 0, 0, d, NULL, NULL)
@@ -86,8 +73,6 @@ static int intel_gvt_init_generic_mmio_info(struct intel_gvt *gvt)
 {
 	struct drm_i915_private *dev_priv = gvt->gt->i915;
 
-	int ret;
-
 	MMIO_RING_DFH(RING_IMR, D_ALL, 0, NULL,
 		intel_vgpu_reg_imr_handler);
 
@@ -905,7 +890,6 @@ static int intel_gvt_init_generic_mmio_info(struct intel_gvt *gvt)
 static int intel_gvt_init_bdw_mmio_info(struct intel_gvt *gvt)
 {
 	struct drm_i915_private *dev_priv = gvt->gt->i915;
-	int ret;
 
 	MMIO_DH(GEN8_GT_IMR(0), D_BDW_PLUS, NULL, intel_vgpu_reg_imr_handler);
 	MMIO_DH(GEN8_GT_IER(0), D_BDW_PLUS, NULL, intel_vgpu_reg_ier_handler);
@@ -1095,7 +1079,6 @@ static int intel_gvt_init_bdw_mmio_info(struct intel_gvt *gvt)
 static int intel_gvt_init_skl_mmio_info(struct intel_gvt *gvt)
 {
 	struct drm_i915_private *dev_priv = gvt->gt->i915;
-	int ret;
 
 	MMIO_DH(FORCEWAKE_RENDER_GEN9, D_SKL_PLUS, NULL, mul_force_wake_write);
 	MMIO_DH(FORCEWAKE_ACK_RENDER_GEN9, D_SKL_PLUS, NULL, NULL);
@@ -1346,7 +1329,6 @@ static int intel_gvt_init_skl_mmio_info(struct intel_gvt *gvt)
 static int intel_gvt_init_bxt_mmio_info(struct intel_gvt *gvt)
 {
 	struct drm_i915_private *dev_priv = gvt->gt->i915;
-	int ret;
 
 	MMIO_F(_MMIO(0x80000), 0x3000, 0, 0, 0, D_BXT, NULL, NULL);
 
diff --git a/drivers/gpu/drm/i915/intel_gvt.c b/drivers/gpu/drm/i915/intel_gvt.c
index 4fd51974bd359..fa9d79815af26 100644
--- a/drivers/gpu/drm/i915/intel_gvt.c
+++ b/drivers/gpu/drm/i915/intel_gvt.c
@@ -86,19 +86,17 @@ void intel_gvt_sanitize_options(struct drm_i915_private *dev_priv)
 	dev_priv->params.enable_gvt = 0;
 }
 
-#define GENERATE_MMIO_TABLE_IN_I915
-static int new_mmio_info(struct intel_gvt *gvt, u32 offset)
-{
-	void *mmio = gvt->hw_state.mmio;
-
-	*(u32 *)(mmio + offset) = intel_uncore_read_notrace(gvt->gt->uncore,
-							    _MMIO(offset));
-	return 0;
-}
-
-#include "gvt/reg.h"
+/*
+ * Generates the MMIO golden state table.
+ */
+#define MMIO_F(reg, s, f, am, rm, d, r, w)			\
+do {								\
+	u32 offset = i915_mmio_reg_offset(reg);			\
+								\
+	(gvt)->hw_state.mmio[offset] =				\
+		intel_uncore_read_notrace((gvt)->gt->uncore, _MMIO(offset)); \
+} while (0)
 #include "gvt/mmio_table.h"
-#undef GENERATE_MMIO_TABLE_IN_I915
 
 static void init_device_info(struct intel_gvt *gvt)
 {
