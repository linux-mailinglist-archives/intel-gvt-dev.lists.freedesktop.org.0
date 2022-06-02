Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FE253B464
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  2 Jun 2022 09:35:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 675E71129F0;
	Thu,  2 Jun 2022 07:35:36 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from out30-130.freemail.mail.aliyun.com
 (out30-130.freemail.mail.aliyun.com [115.124.30.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ACB81129F0;
 Thu,  2 Jun 2022 07:35:33 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R131e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=alimailimapcm10staff010182156082;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=14; SR=0;
 TI=SMTPD_---0VF9ffSI_1654155321; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0VF9ffSI_1654155321) by smtp.aliyun-inc.com(127.0.0.1);
 Thu, 02 Jun 2022 15:35:27 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: zhenyuw@linux.intel.com
Subject: [PATCH] drm/i915/gvt: Fix kernel-doc
Date: Thu,  2 Jun 2022 15:35:19 +0800
Message-Id: <20220602073519.22363-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: tvrtko.ursulin@linux.intel.com,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, airlied@linux.ie,
 intel-gfx@lists.freedesktop.org, joonas.lahtinen@linux.intel.com,
 Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 jani.nikula@linux.intel.com, dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 rodrigo.vivi@intel.com, intel-gvt-dev@lists.freedesktop.org,
 zhi.a.wang@intel.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Fix the following W=1 kernel warnings:

drivers/gpu/drm/i915/gvt/aperture_gm.c:308: warning: expecting prototype
for inte_gvt_free_vgpu_resource(). Prototype was for
intel_vgpu_free_resource() instead.

drivers/gpu/drm/i915/gvt/aperture_gm.c:344: warning: expecting prototype
for intel_alloc_vgpu_resource(). Prototype was for
intel_vgpu_alloc_resource() instead.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpu/drm/i915/gvt/aperture_gm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/aperture_gm.c b/drivers/gpu/drm/i915/gvt/aperture_gm.c
index 557f3314291a..3b81a6d35a7b 100644
--- a/drivers/gpu/drm/i915/gvt/aperture_gm.c
+++ b/drivers/gpu/drm/i915/gvt/aperture_gm.c
@@ -298,7 +298,7 @@ static int alloc_resource(struct intel_vgpu *vgpu,
 }
 
 /**
- * inte_gvt_free_vgpu_resource - free HW resource owned by a vGPU
+ * intel_vgpu_free_resource() - free HW resource owned by a vGPU
  * @vgpu: a vGPU
  *
  * This function is used to free the HW resource owned by a vGPU.
@@ -328,7 +328,7 @@ void intel_vgpu_reset_resource(struct intel_vgpu *vgpu)
 }
 
 /**
- * intel_alloc_vgpu_resource - allocate HW resource for a vGPU
+ * intel_vgpu_alloc_resource() - allocate HW resource for a vGPU
  * @vgpu: vGPU
  * @param: vGPU creation params
  *
-- 
2.20.1.7.g153144c

