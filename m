Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 331CF619AA4
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  4 Nov 2022 15:57:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1E3410E0C4;
	Fri,  4 Nov 2022 14:57:07 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4906510E0C4
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  4 Nov 2022 14:57:03 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id z24so6731941ljn.4
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 04 Nov 2022 07:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=K7jMe8lai4CRgz+V1IYnKVjtYxFQHaHai8vAE/U/zsM=;
 b=lHehHd3j9xFaK0gET/WjLyqcaiLD4rWuSWlpO+suT50fumn3IV+iEV6Ge9l3aK9zg3
 PS+l7q3ee2co2eLb10qUfxLTg8imKJRPZ6PDdAIPzHGAohgpeneyTpiL2e5jozrfxVI0
 Gm39RJX2676XxCul174RbEJHYFdEW2nDO/V4gptAaBRQoT27KCpmdki2Na+P6PbKiCRU
 G12/f/WkUwFuAcinBdxuvwvzXJ6u2JF4OVZvzrJ7aRyWujD1R2VMaMpDy667yIR7dVPy
 dXlZuVWtxwb+oHKfO0sOkm+qoXFlsqjizxa6jpnlGeTGfTRR+LMd5wssVdKUHZT96WuW
 Zovw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K7jMe8lai4CRgz+V1IYnKVjtYxFQHaHai8vAE/U/zsM=;
 b=dIbk68n5NjfS6/CQ6rOBjcwLB0b1wzc3VrpUdcFsGMxu/eCnOLZJ5FZB+IOPIJ20Ye
 GwgDNvxUOuzPTn9Vqi2jeiwJu16Sn8aL6Di74cAqhNQBT90/L7awlLGk1vSp2ZBrBdrJ
 +qE/ca1Mwo9oQss87w9EwbghrrXZ3suqq2dSG4RSy/H2VE7R1Sg4w9Fe9pWHs/3PJ84b
 bLzCPv8C025qbIZSlnWwQLgbiGsbpQAULJL/3Fl71eEc4R2snNUiEvTOvAvZJEXl5ees
 9TIQnEH6xF9z+9lcpbsduIspB4itFYiDx8Ebxwk08oGcq4V48bXzY9GebWLzm8TlbFkI
 d1kA==
X-Gm-Message-State: ACrzQf35PbKCYts/tXvznBiq7AiHxmXZvpXmk40E9+D+HxWWgjB8Bq9L
 5S6ok1KAXW4Jrg8k64IDeyV2aEXEQgM=
X-Google-Smtp-Source: AMsMyM4jm+16JXqHrYSQiSjVqdvJXfE0TarnxOjUVzLqaPoFYo5D0wSjz64lZFroBp3U0VF5z9pOMw==
X-Received: by 2002:a2e:9b03:0:b0:277:6a5:109b with SMTP id
 u3-20020a2e9b03000000b0027706a5109bmr2247454lji.42.1667573821265; 
 Fri, 04 Nov 2022 07:57:01 -0700 (PDT)
Received: from localhost.localdomain (88-115-161-74.elisa-laajakaista.fi.
 [88.115.161.74]) by smtp.gmail.com with ESMTPSA id
 d9-20020a194f09000000b00492d064e8f8sm486026lfb.263.2022.11.04.07.57.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 07:57:00 -0700 (PDT)
From: Zhi Wang <zhi.wang.linux2@gmail.com>
X-Google-Original-From: Zhi Wang <zhi.a.wang@intel.com>
To: 
Subject: [PATCH 1/3] drm/i915/gvt: remove the vgpu->released and its sanity
 check
Date: Fri,  4 Nov 2022 14:56:50 +0000
Message-Id: <20221104145652.1570-1-zhi.a.wang@intel.com>
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

