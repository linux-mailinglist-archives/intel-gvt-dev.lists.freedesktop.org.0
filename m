Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC7338DC27
	for <lists+intel-gvt-dev@lfdr.de>; Sun, 23 May 2021 19:23:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 643BE6E532;
	Sun, 23 May 2021 17:23:11 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD2986E52F;
 Sun, 23 May 2021 17:23:08 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id u11so24950195oiv.1;
 Sun, 23 May 2021 10:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2FoVSFWcUZWXRm7AD51E3dANi05UrgXiAjik3mpf5no=;
 b=RMSTz6qKC8La6YP28LsKEFerKiMRPKEO36aLvbKYOKBoTx2ndWptJB/hb5lmiWiOn1
 P7eLVaFFNfbJ96Yn12cdngBg5O7L+KKD9SOM9hWFZL4mzEtE9KSM1Ff2EsBfu4rT9s3z
 DUBxRuOE30by1mVJGwW1wTlq2bD28Q8PakzOk2U/jjJRkzzHWq4+6YMxKNElVvb1sUcR
 F36hLz+pS7Hryd1Blv55Q/+V94hkfHNJiDlrP0IZzoBRpi+jNJwTNu7X2KJOQnaIfhFK
 x/2KYVE/esYY6BOI+vTxogfb/X2t6D2VKHId7hPBIePEhk8PXg7xDFZu8JghGwF0tbEj
 o9pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=2FoVSFWcUZWXRm7AD51E3dANi05UrgXiAjik3mpf5no=;
 b=cOFPMydiMbVtzeBS31/vE1DIvI30az3Hm2DV/YjJswrhEvFGGI9DahB4a5fAXRD6wF
 A/ZITYRUcHf5/ClsIoqw4wgzpbqgv9rm/JFJRbk6E1OA1kssiEsLZlVopnCu/1k8Gp7p
 6j2CufhWGymWoedlfLxggmp/jYzjOppo6uFaMqIlpHcZY6/s6EZaO1C1K9/LWGBm3uMz
 Box3ROpXHA0dZU/7NHw8t4jRbhBtuDLqi1jBdsr5vi1jHp/OB3Tp87b0IQSfp0ResROs
 ba/8ZGoVMAaPOJO1lux3OnoyWYAi5oo4wGDGKjAy9fSFGm4z85V25G4wAFcwKeMWnrSQ
 K55g==
X-Gm-Message-State: AOAM532g+Ukvg09W1pZLbqIwyBp145zdve39+sp3U5x9jd5qhJyku0BC
 aWz8YtTz7WwNz6fy6+BfiZ4=
X-Google-Smtp-Source: ABdhPJwY480IlovPkjrgDpcAhRCpN2rSslgx5zzbp8togNhSlzBUSV60ajsWIZCURBGgHgy33kopPA==
X-Received: by 2002:a05:6808:98f:: with SMTP id
 a15mr8551245oic.29.1621790588083; 
 Sun, 23 May 2021 10:23:08 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id v9sm2627421otn.44.2021.05.23.10.23.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 May 2021 10:23:07 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: [PATCH v2] drm/i915/gem: Use list_entry to access list members
Date: Sun, 23 May 2021 10:23:04 -0700
Message-Id: <20210523172304.3033229-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 intel-gvt-dev@lists.freedesktop.org, Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Use list_entry() instead of container_of() to access list members.
Also drop unnecessary and misleading NULL checks on the result of
list_entry().

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Checkpatch fixes:
    - Fix alignment
    - Replace comparison against NULL with !

 drivers/gpu/drm/i915/gvt/dmabuf.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/dmabuf.c b/drivers/gpu/drm/i915/gvt/dmabuf.c
index d4f883f35b95..e3f488681484 100644
--- a/drivers/gpu/drm/i915/gvt/dmabuf.c
+++ b/drivers/gpu/drm/i915/gvt/dmabuf.c
@@ -148,8 +148,7 @@ static void dmabuf_gem_object_free(struct kref *kref)
 
 	if (vgpu && vgpu->active && !list_empty(&vgpu->dmabuf_obj_list_head)) {
 		list_for_each(pos, &vgpu->dmabuf_obj_list_head) {
-			dmabuf_obj = container_of(pos,
-					struct intel_vgpu_dmabuf_obj, list);
+			dmabuf_obj = list_entry(pos, struct intel_vgpu_dmabuf_obj, list);
 			if (dmabuf_obj == obj) {
 				list_del(pos);
 				intel_gvt_hypervisor_put_vfio_device(vgpu);
@@ -357,10 +356,8 @@ pick_dmabuf_by_info(struct intel_vgpu *vgpu,
 	struct intel_vgpu_dmabuf_obj *ret = NULL;
 
 	list_for_each(pos, &vgpu->dmabuf_obj_list_head) {
-		dmabuf_obj = container_of(pos, struct intel_vgpu_dmabuf_obj,
-						list);
-		if ((dmabuf_obj == NULL) ||
-		    (dmabuf_obj->info == NULL))
+		dmabuf_obj = list_entry(pos, struct intel_vgpu_dmabuf_obj, list);
+		if (!dmabuf_obj->info)
 			continue;
 
 		fb_info = (struct intel_vgpu_fb_info *)dmabuf_obj->info;
@@ -387,11 +384,7 @@ pick_dmabuf_by_num(struct intel_vgpu *vgpu, u32 id)
 	struct intel_vgpu_dmabuf_obj *ret = NULL;
 
 	list_for_each(pos, &vgpu->dmabuf_obj_list_head) {
-		dmabuf_obj = container_of(pos, struct intel_vgpu_dmabuf_obj,
-						list);
-		if (!dmabuf_obj)
-			continue;
-
+		dmabuf_obj = list_entry(pos, struct intel_vgpu_dmabuf_obj, list);
 		if (dmabuf_obj->dmabuf_id == id) {
 			ret = dmabuf_obj;
 			break;
@@ -600,8 +593,7 @@ void intel_vgpu_dmabuf_cleanup(struct intel_vgpu *vgpu)
 
 	mutex_lock(&vgpu->dmabuf_lock);
 	list_for_each_safe(pos, n, &vgpu->dmabuf_obj_list_head) {
-		dmabuf_obj = container_of(pos, struct intel_vgpu_dmabuf_obj,
-						list);
+		dmabuf_obj = list_entry(pos, struct intel_vgpu_dmabuf_obj, list);
 		dmabuf_obj->vgpu = NULL;
 
 		idr_remove(&vgpu->object_idr, dmabuf_obj->dmabuf_id);
-- 
2.25.1

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
