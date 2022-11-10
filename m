Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D72A5623C3D
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 10 Nov 2022 08:00:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DC9010E5B0;
	Thu, 10 Nov 2022 07:00:08 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 765FF10E669
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 10 Nov 2022 07:00:04 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id g12so1473015lfh.3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 09 Nov 2022 23:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4EbsUg1GZQjZjAhdP6+XK8vSG8f8xN+3/QyTTsQP+b0=;
 b=HTGQ6LmN3+ah76Yyhkpek76v0kEGZndmBoPdzzkwnOqtKl1XkJBcjN5Uw9E0H3MBAq
 jFCJ6ebDZq5bpAj5p91tq1LXmBGFkEz1JmR4vlZTOZy94vM8BKPq6O34ZXIQFm4/6DRA
 u1fVXM/Idv8Gs95hpViNwk/ej1EqJEjtLtXTCuMza+uyfz5myLpbR6055tk4llJlKtov
 Gcbh21eahu06X0S3AGEvCx8h9pmWcfddzt7iHihaUzl9D+noWJxzN0vtCluV4Gl8xPrE
 rLWfu+Oi9hoUa9TQCZLcOCKwzgeY2MCE+gTZgCQ33/ia3gPcyZ4MTSkiqzAG0eKOW/a8
 QldQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4EbsUg1GZQjZjAhdP6+XK8vSG8f8xN+3/QyTTsQP+b0=;
 b=yFDBBDVXLVfw9AS/w/lPyJ04o12QZuLal2DgjVEqwoiPyl8Anm1oaH8sxzvYCHQD/n
 GG7jeoeKsGH+MKi1mX8vH5eKbxKloNz4tIB3SZdWMaQ/kJ5S0rvCunLHeDkLBQUPnYs7
 anGTmI6X9rXsIFmmfPB2cDtJyQoFFNNtF13vaxdgIXnXFxJmJLIdM4ewGIYtocRCmBbF
 7Q2KPLOTE5EYNoOiX3yGzB3VZRA55tUgIhKqK908rzvEKc2GMIxQQAPHoT10uOc5ZUq5
 jHdkvlOdJHwVesUNY5mBLi+s92a1OzC0mZ1hRRjCgExaWPlGqvjn50M3nMdCcfWtN0jH
 Ly9g==
X-Gm-Message-State: ACrzQf3IOJ32siUZGD8i9d9rT5V/YdyIsyehD77WluWBIjUWzuYlNEYW
 FKy/INnyC9kbaduLjzvpero=
X-Google-Smtp-Source: AMsMyM4hDmLDmTqb6aeYCJpZqWpyD+VEcvl435BSe8OL+SdVbwTzY+rB3RIbiIPSRekBVHKNQ293zg==
X-Received: by 2002:a19:f24d:0:b0:4ac:4332:b663 with SMTP id
 d13-20020a19f24d000000b004ac4332b663mr1116917lfk.223.1668063602315; 
 Wed, 09 Nov 2022 23:00:02 -0800 (PST)
Received: from localhost.localdomain (88-115-161-74.elisa-laajakaista.fi.
 [88.115.161.74]) by smtp.gmail.com with ESMTPSA id
 f12-20020a2eb5ac000000b002772414817esm2513991ljn.1.2022.11.09.23.00.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Nov 2022 23:00:01 -0800 (PST)
From: Zhi Wang <zhi.wang.linux2@gmail.com>
X-Google-Original-From: Zhi Wang <zhi.a.wang@intel.com>
To: 
Subject: [PATCH v2 1/3] drm/i915/gvt: remove the vgpu->released and its sanity
 check
Date: Thu, 10 Nov 2022 06:59:57 +0000
Message-Id: <20221110065959.32249-1-zhi.a.wang@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Kevin Tian <kevin.tian@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Alex Williamson <alex.williamson@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

The life cycle of a vGPU, which is represented by a vfio_device, has been
managed by the VFIO core logic. Remove the vgpu->released, which was used
for a sanity check on the removal path of the vGPU instance. The sanity
check has already been covered in the VFIO core logic.

Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: Kevin Tian <kevin.tian@intel.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: intel-gvt-dev@lists.freedesktop.org
Suggested-by: Alex Williamson <alex.williamson@redhat.com>
Signed-off-by: Zhi Wang <zhi.a.wang@intel.com>
Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>
---
 drivers/gpu/drm/i915/gvt/gvt.h   | 2 --
 drivers/gpu/drm/i915/gvt/kvmgt.c | 4 ----
 2 files changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gvt.h
index dbf8d7470b2c..62823c0e13ab 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.h
+++ b/drivers/gpu/drm/i915/gvt/gvt.h
@@ -227,8 +227,6 @@ struct intel_vgpu {
 	unsigned long nr_cache_entries;
 	struct mutex cache_lock;
 
-	atomic_t released;
-
 	struct kvm_page_track_notifier_node track_node;
 #define NR_BKT (1 << 18)
 	struct hlist_head ptable[NR_BKT];
diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 7a45e5360caf..897b6fdbbaed 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -684,7 +684,6 @@ static int intel_vgpu_open_device(struct vfio_device *vfio_dev)
 
 	intel_gvt_activate_vgpu(vgpu);
 
-	atomic_set(&vgpu->released, 0);
 	return 0;
 }
 
@@ -706,9 +705,6 @@ static void intel_vgpu_close_device(struct vfio_device *vfio_dev)
 	if (!vgpu->attached)
 		return;
 
-	if (atomic_cmpxchg(&vgpu->released, 0, 1))
-		return;
-
 	intel_gvt_release_vgpu(vgpu);
 
 	debugfs_remove(debugfs_lookup(KVMGT_DEBUGFS_FILENAME, vgpu->debugfs));
-- 
2.25.1

