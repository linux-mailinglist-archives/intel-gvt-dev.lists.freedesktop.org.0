Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B5A532595
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 24 May 2022 10:43:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1597E10E8D2;
	Tue, 24 May 2022 08:43:00 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from out30-133.freemail.mail.aliyun.com
 (out30-133.freemail.mail.aliyun.com [115.124.30.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1199E10E8D2;
 Tue, 24 May 2022 08:42:57 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R411e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e01424;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=14; SR=0;
 TI=SMTPD_---0VEHJJLh_1653381467; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0VEHJJLh_1653381467) by smtp.aliyun-inc.com(127.0.0.1);
 Tue, 24 May 2022 16:37:50 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: zhenyuw@linux.intel.com
Subject: [PATCH 1/2] drm/i915/gvt: Fix kernel-doc
Date: Tue, 24 May 2022 16:37:33 +0800
Message-Id: <20220524083733.67148-2-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
In-Reply-To: <20220524083733.67148-1-jiapeng.chong@linux.alibaba.com>
References: <20220524083733.67148-1-jiapeng.chong@linux.alibaba.com>
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

drivers/gpu/drm/i915/gvt/handlers.c:3066: warning: expecting prototype
for intel_t_default_mmio_write(). Prototype was for
intel_vgpu_default_mmio_write() instead.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpu/drm/i915/gvt/handlers.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index beea5895e499..9c8dde079cb4 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -3052,7 +3052,7 @@ int intel_vgpu_default_mmio_read(struct intel_vgpu *vgpu, unsigned int offset,
 }
 
 /**
- * intel_t_default_mmio_write - default MMIO write handler
+ * intel_vgpu_default_mmio_write() - default MMIO write handler
  * @vgpu: a vGPU
  * @offset: access offset
  * @p_data: write data buffer
-- 
2.20.1.7.g153144c

