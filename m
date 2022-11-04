Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05298619AA7
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  4 Nov 2022 15:57:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63D6510E845;
	Fri,  4 Nov 2022 14:57:10 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D95810E0DB
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  4 Nov 2022 14:57:08 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id l8so6689693ljh.13
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 04 Nov 2022 07:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qPB6SmDuktygHeNufwzHumi5jqXEywJBPXIIDIkbUC0=;
 b=RP16QcRsoap8jWjQbSq5MFmesYDa2/x6V+DERsubCG7m2kJt491RR/sai1TJ+AcD5l
 ppRnXPH7jiZLQ5/5LzMe6NGbUJcCfD3l/PwzTtlPT11O+ajNX0dL4Ok9bXTU3zbLx+P8
 4ycHrTxQM+GGsVRZto2S+RTYzAgtK3Evy77L835wgXWrqCchBfxK+CcIbpl23VDAar+W
 VRASnkxnONqmg2OSfRSMfwJUfJyVqHKD+oCAc8gy/lwVGO68k25QUb+Yun9EYeZmtbgV
 /p3R2LJKJ5ZcJeTmPkudBKVgchbMCw9BLhYHmnLmeh3V8EgO/5UdxZo4Nc/RDiMt9yex
 t6zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qPB6SmDuktygHeNufwzHumi5jqXEywJBPXIIDIkbUC0=;
 b=G8X9VyDS8PNWCp/9uuCxJBgPDfdo67Hc9WK1kgb0o24T7kq+AVMImmK8ilwA6k7uwH
 s4DQIzesXL13LyTq7EzvidnAM0k6qU9BBwlNcrhzhgKNBQJLX0dhtqanhsIS72h9j48E
 0wpxBNBCST1Qd6+dYK0cod3CPey6DUIA9D2XYcfQf26I5izvS0AoIkjz9ksiI+MNjKjK
 qZ56YY25ccAi/zKhbHBp5NyT9fRuep0CZAzjtdimutM2trJepQp8uUflZtZuKAsU2tnb
 7FXkRYfEDDO/lKvxzXtxQqIiTx/FcLBCvzxUP6M9FpD4cA8DR59T6RCnimReorD0sbxr
 e3og==
X-Gm-Message-State: ACrzQf3nMzKX1aM33477O5grBkz7vW/YqaMONsHV7p1Sjpe6nxiEmyzj
 M6lBcoeh4XzWJt89+frdGDE=
X-Google-Smtp-Source: AMsMyM7YvRTErRC9FqapumwD+dTDA9o2Rolmcl0K8L4ogl3vhjIAa8FMXxxzXFpD5ogVVMN42NAT5w==
X-Received: by 2002:a2e:a601:0:b0:26c:4149:251a with SMTP id
 v1-20020a2ea601000000b0026c4149251amr13300101ljp.348.1667573826940; 
 Fri, 04 Nov 2022 07:57:06 -0700 (PDT)
Received: from localhost.localdomain (88-115-161-74.elisa-laajakaista.fi.
 [88.115.161.74]) by smtp.gmail.com with ESMTPSA id
 d9-20020a194f09000000b00492d064e8f8sm486026lfb.263.2022.11.04.07.57.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 07:57:06 -0700 (PDT)
From: Zhi Wang <zhi.wang.linux2@gmail.com>
X-Google-Original-From: Zhi Wang <zhi.a.wang@intel.com>
To: 
Subject: [PATCH 3/3] drm/i915/gvt: show the vGPU status in debugfs
Date: Fri,  4 Nov 2022 14:56:52 +0000
Message-Id: <20221104145652.1570-3-zhi.a.wang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104145652.1570-1-zhi.a.wang@intel.com>
References: <20221104145652.1570-1-zhi.a.wang@intel.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

After using atomic operation to change the vGPU status, showing the vGPU
status in the debugfs requires to be updated. This patch adds back the
function of showing vGPU status in the debugfs.

Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: Kevin Tian <kevin.tian@intel.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: intel-gvt-dev@lists.freedesktop.org
Signed-off-by: Zhi Wang <zhi.a.wang@intel.com>
---
 drivers/gpu/drm/i915/gvt/debugfs.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/i915/gvt/debugfs.c b/drivers/gpu/drm/i915/gvt/debugfs.c
index bb301bc974a4..a930ba89ac86 100644
--- a/drivers/gpu/drm/i915/gvt/debugfs.c
+++ b/drivers/gpu/drm/i915/gvt/debugfs.c
@@ -151,6 +151,20 @@ DEFINE_SIMPLE_ATTRIBUTE(vgpu_scan_nonprivbb_fops,
 			vgpu_scan_nonprivbb_get, vgpu_scan_nonprivbb_set,
 			"0x%llx\n");
 
+static int vgpu_status_get(void *data, u64 *val)
+{
+	struct intel_vgpu *vgpu = (struct intel_vgpu *)data;
+
+	if (test_bit(INTEL_VGPU_STATUS_ATTACHED, vgpu->status))
+		*val |= (1 << INTEL_VGPU_STATUS_ATTACHED);
+	if (test_bit(INTEL_VGPU_STATUS_ACTIVE, vgpu->status))
+		*val |= (1 << INTEL_VGPU_STATUS_ACTIVE);
+
+	return 0;
+}
+
+DEFINE_SIMPLE_ATTRIBUTE(vgpu_status_fops, vgpu_status_get, NULL, "0x%llx\n");
+
 /**
  * intel_gvt_debugfs_add_vgpu - register debugfs entries for a vGPU
  * @vgpu: a vGPU
@@ -166,6 +180,8 @@ void intel_gvt_debugfs_add_vgpu(struct intel_vgpu *vgpu)
 			    &vgpu_mmio_diff_fops);
 	debugfs_create_file("scan_nonprivbb", 0644, vgpu->debugfs, vgpu,
 			    &vgpu_scan_nonprivbb_fops);
+	debugfs_create_file("status", 0644, vgpu->debugfs, vgpu,
+			    &vgpu_status_fops);
 }
 
 /**
-- 
2.25.1

