Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF431794365
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  6 Sep 2023 21:02:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B34E910E710;
	Wed,  6 Sep 2023 19:02:36 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9CE610E1CA;
 Wed,  6 Sep 2023 19:02:32 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-77a62a84855so5042039f.1; 
 Wed, 06 Sep 2023 12:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694026952; x=1694631752; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7joZjSDNylfwIjlN/v1EJKsLNVMUogPTU5+zZ+4Y2sA=;
 b=Tp8CBU5FYUpqAmt0782HGt/w57+sx8LZRCtYLi6Zvi/hIxaatLtU9OxiDfCmT23MiD
 YCS+hvFlXHwfmxLD6erCrmnt0AJ7n1CsFXWYN+H3MJUkf6G5GZGb4jQby8wDWPLwv1bS
 6Gbt/JKM8E2/fBN61fp41btHo5JRU0Ldntc8RbJ2wWZyWALJkdUZCFCi4OuCJs6mk/np
 UF/BjpwWfMPXaeXZxPIz4GGeRc+M0/T+Czz5GQp9KQUPqQEvSUjk1iVVXIqTd7l9s1Vl
 TXcOYW9QnCdU1+AMCxeZUy0AjtP+V0PdO9Wo1WcIzsVWbiQ1zOyzyfU6Gya94012/BTu
 GH4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694026952; x=1694631752;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7joZjSDNylfwIjlN/v1EJKsLNVMUogPTU5+zZ+4Y2sA=;
 b=YUKM42lRGoqLyTI8IzM9xz2UTOP4YbcyFqTOtdY3k7vlvlVHpWeRKFD5Xlpwbv1hO+
 LdrBVzi5P5vLxjrgxHzGr/EGw+RAS2w4MLxCh2dbSgkJAqKhvJRh8qFGaLKD1c7/fFzX
 ZNlldqddhrNzz3FiokjT7p9JpsBxfEZMC4xluqInFwcy3GEaYxSK7f58eu+5TxEoSD1a
 6UxbPFjOUf69yqsKYE/7DJaMKbnDvKRc/TbLVV+O+lo+cH0pUVhxXu9hEXzHxdsyBCIp
 /eFo2+wwBpBKsCzPsWhz/2IyUgWOvlqnIZlWfWdPXptEx8c8JVqFN+RzgWijuB2N4Z0F
 /xLQ==
X-Gm-Message-State: AOJu0YyXCjGC5LVrDFNhg6zweWuNqahdZ//GPqDu9lJ85KrlWpFxya/R
 WJKEX3dZnz3xNC78Cy5m29kL5bKMK19Ncw==
X-Google-Smtp-Source: AGHT+IF9+5z8gW/L2WmhxsI+81BMma/N4jRZCRB7iE4meseUn0CUi23FnZlRHWkkTJI6XVkfvLHlSg==
X-Received: by 2002:a5e:8913:0:b0:783:47cd:27b5 with SMTP id
 k19-20020a5e8913000000b0078347cd27b5mr18383468ioj.3.1694026952009; 
 Wed, 06 Sep 2023 12:02:32 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 w11-20020a5d844b000000b0076ffebfc9fasm5152306ior.47.2023.09.06.12.02.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Sep 2023 12:02:31 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 2/5] drm/kmb: add trailing newlines to drm_dbg msgs
Date: Wed,  6 Sep 2023 13:02:20 -0600
Message-ID: <20230906190224.583577-3-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230906190224.583577-1-jim.cromie@gmail.com>
References: <20230906190224.583577-1-jim.cromie@gmail.com>
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
Cc: jani.nikula@intel.com, daniel.vetter@ffwll.ch,
 Edmund Dea <edmund.j.dea@intel.com>, Jim Cromie <jim.cromie@gmail.com>,
 robdclark@gmail.com, seanpaul@chromium.org, daniel@ffwll.ch,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 David Airlie <airlied@gmail.com>, ville.syrjala@linux.intel.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

By at least strong convention, a print-buffer's trailing newline says
"message complete, send it".  The exception (no TNL, followed by a call
to pr_cont) proves the general rule.

Most DRM.debug calls already comport with this: 207 DRM_DEV_DEBUG,
1288 drm_dbg.  Clean up the remainders, in maintainer sized chunks.

No functional changes.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/kmb/kmb_crtc.c  | 10 +++++-----
 drivers/gpu/drm/kmb/kmb_plane.c |  6 +++---
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_crtc.c b/drivers/gpu/drm/kmb/kmb_crtc.c
index 647872f65bff..a58baf25322d 100644
--- a/drivers/gpu/drm/kmb/kmb_crtc.c
+++ b/drivers/gpu/drm/kmb/kmb_crtc.c
@@ -94,7 +94,7 @@ static void kmb_crtc_set_mode(struct drm_crtc *crtc,
 	vm.hback_porch = 0;
 	vm.hsync_len = 28;
 
-	drm_dbg(dev, "%s : %dactive height= %d vbp=%d vfp=%d vsync-w=%d h-active=%d h-bp=%d h-fp=%d hsync-l=%d",
+	drm_dbg(dev, "%s : %dactive height= %d vbp=%d vfp=%d vsync-w=%d h-active=%d h-bp=%d h-fp=%d hsync-l=%d\n",
 		__func__, __LINE__,
 			m->crtc_vdisplay, vm.vback_porch, vm.vfront_porch,
 			vm.vsync_len, m->crtc_hdisplay, vm.hback_porch,
@@ -194,24 +194,24 @@ static enum drm_mode_status
 	int vfp = mode->vsync_start - mode->vdisplay;
 
 	if (mode->vdisplay < KMB_CRTC_MAX_HEIGHT) {
-		drm_dbg(dev, "height = %d less than %d",
+		drm_dbg(dev, "height = %d less than %d\n",
 			mode->vdisplay, KMB_CRTC_MAX_HEIGHT);
 		return MODE_BAD_VVALUE;
 	}
 	if (mode->hdisplay < KMB_CRTC_MAX_WIDTH) {
-		drm_dbg(dev, "width = %d less than %d",
+		drm_dbg(dev, "width = %d less than %d\n",
 			mode->hdisplay, KMB_CRTC_MAX_WIDTH);
 		return MODE_BAD_HVALUE;
 	}
 	refresh = drm_mode_vrefresh(mode);
 	if (refresh < KMB_MIN_VREFRESH || refresh > KMB_MAX_VREFRESH) {
-		drm_dbg(dev, "refresh = %d less than %d or greater than %d",
+		drm_dbg(dev, "refresh = %d less than %d or greater than %d\n",
 			refresh, KMB_MIN_VREFRESH, KMB_MAX_VREFRESH);
 		return MODE_BAD;
 	}
 
 	if (vfp < KMB_CRTC_MIN_VFP) {
-		drm_dbg(dev, "vfp = %d less than %d", vfp, KMB_CRTC_MIN_VFP);
+		drm_dbg(dev, "vfp = %d less than %d\n", vfp, KMB_CRTC_MIN_VFP);
 		return MODE_BAD;
 	}
 
diff --git a/drivers/gpu/drm/kmb/kmb_plane.c b/drivers/gpu/drm/kmb/kmb_plane.c
index 9e0562aa2bcb..308bd1cb50c8 100644
--- a/drivers/gpu/drm/kmb/kmb_plane.c
+++ b/drivers/gpu/drm/kmb/kmb_plane.c
@@ -78,7 +78,7 @@ static unsigned int check_pixel_format(struct drm_plane *plane, u32 format)
 	 * plane configuration is not supported.
 	 */
 	if (init_disp_cfg.format && init_disp_cfg.format != format) {
-		drm_dbg(&kmb->drm, "Cannot change format after initial plane configuration");
+		drm_dbg(&kmb->drm, "Cannot change format after initial plane configuration\n");
 		return -EINVAL;
 	}
 	for (i = 0; i < plane->format_count; i++) {
@@ -124,7 +124,7 @@ static int kmb_plane_atomic_check(struct drm_plane *plane,
 	if ((init_disp_cfg.width && init_disp_cfg.height) &&
 	    (init_disp_cfg.width != fb->width ||
 	    init_disp_cfg.height != fb->height)) {
-		drm_dbg(&kmb->drm, "Cannot change plane height or width after initial configuration");
+		drm_dbg(&kmb->drm, "Cannot change plane height or width after initial configuration\n");
 		return -EINVAL;
 	}
 	can_position = (plane->type == DRM_PLANE_TYPE_OVERLAY);
@@ -375,7 +375,7 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 	spin_lock_irq(&kmb->irq_lock);
 	if (kmb->kmb_under_flow || kmb->kmb_flush_done) {
 		spin_unlock_irq(&kmb->irq_lock);
-		drm_dbg(&kmb->drm, "plane_update:underflow!!!! returning");
+		drm_dbg(&kmb->drm, "plane_update:underflow!!!! returning\n");
 		return;
 	}
 	spin_unlock_irq(&kmb->irq_lock);
-- 
2.41.0

