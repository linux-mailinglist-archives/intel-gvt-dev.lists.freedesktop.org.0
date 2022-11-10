Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CB562421E
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 10 Nov 2022 13:21:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 858EF10E14A;
	Thu, 10 Nov 2022 12:21:05 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 099FC10E14A
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 10 Nov 2022 12:21:02 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id f37so2866247lfv.8
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 10 Nov 2022 04:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8m/u+8lwyJmVxKTl2sowHxZH2aaxirBGoApwwrnzy0E=;
 b=RlK/FvCnhTKgtT681f0bXicBvuCSKc+tuSIyjvKDncGQQ/NHVhRK9wUl5Ib2/NiKR5
 8iW55snhYqmeKE3G2TBxF7UWAmcqFPFTJ4oHGV8RzGFNERvjhVdB0vl8/uSIVnDOEcIb
 Ir6JvJfBtbuj359C4bMqW0hgafEzWKSbJjEm8F8GayYnYTF0GgohGP8KPB52kJBOjq0/
 oDOLswPpxhrxk8bORzCmB0OZnDRdWFhWH7aF1DwRNNh/SObDh3+96h9TiMlOayUGg0TM
 iyEuE5vJFzDmPkPkLxVPOKKsnvJ0MK/mBHvlQBja9iGkJwuGbMHxErAKEKpQyHe25Ak9
 CF4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8m/u+8lwyJmVxKTl2sowHxZH2aaxirBGoApwwrnzy0E=;
 b=SUkb6vGSUhRjpR7An9uip09Hh58vjcGf6p1HqFJi6faB0MRbMxh6+8JTE4anfdE9yH
 uk9jQCPTVsTZdkiozcJdXWea2iGSoUOq9hZOSJDuhs7Az26DmGypPrBuy/bfEPS6loqB
 J5+G02PYnJlGkImq6rkpIW4ytgIi64zujUyRka5xnGFfc3NWz8dh94YZ+4SViikmNvrk
 VQBl66hGX9aMc6huS37lOTNvb3PeXJE1wwpElhogCk9SpOnBWqstYgcMgM1DOleWJLLA
 7oYhMHK2j+pAZXcpQpLI650Pn7pXwF017taxYsEpSwLeLZuUmafZf69VejwSrj9j3xmm
 Wftg==
X-Gm-Message-State: ACrzQf2cslRlWTlv2qLRP6XSH8zjcPStqIWJ9i2gsWQyZW/wGqz5UWRT
 76DyxxPMC5VKSwVbG2SrRSo=
X-Google-Smtp-Source: AMsMyM6EpUD5AAOoDFeOhKpf0QfXPGBAvO97U64OhyLHrpH96ayIaPeO6HBMUBz0KVmT/TieMY7/Og==
X-Received: by 2002:ac2:5fc9:0:b0:4a2:58f0:c0df with SMTP id
 q9-20020ac25fc9000000b004a258f0c0dfmr1266538lfg.268.1668082860869; 
 Thu, 10 Nov 2022 04:21:00 -0800 (PST)
Received: from localhost.localdomain (88-115-161-74.elisa-laajakaista.fi.
 [88.115.161.74]) by smtp.gmail.com with ESMTPSA id
 7-20020ac25f07000000b0049735cec78dsm2724463lfq.67.2022.11.10.04.20.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 04:21:00 -0800 (PST)
From: Zhi Wang <zhi.wang.linux2@gmail.com>
X-Google-Original-From: Zhi Wang <zhi.a.wang@intel.com>
To: 
Subject: [PATCH 1/2] drm/i915/gvt: remove the vgpu->released and its sanity
 check
Date: Thu, 10 Nov 2022 12:20:33 +0000
Message-Id: <20221110122034.3382-1-zhi.a.wang@intel.com>
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
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
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

