Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E19D3623C3E
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 10 Nov 2022 08:00:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE0E210E05B;
	Thu, 10 Nov 2022 07:00:10 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8705910E669
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 10 Nov 2022 07:00:06 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id be13so1468356lfb.4
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 09 Nov 2022 23:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t0xfTppKl9j5y3iU7XDGdIRYYl8Bsxh+R+RR25irynk=;
 b=W1jSA4qCNcd3P/kkh6t6e7Cb0DefZKIrighFQCZwvY93lcFtQBaB8Cr6sKHKhfvDMT
 dcq0urMo2qRvVLnrWFU9nu6qZOvge1x8hl+BOLX5FvbCNAxD8xQGv/9vtEFDfkUpmNmD
 vwh7uG6RpfCYAFDqbBf02fg7Sl88F0Yp7oulg1DjZ0pjIrrxZBsJht3Uma0ICdzjQWHg
 6HZwTBPGWSXWcoFvFY+io/uBNBwTWOs3mQr+wns6w8Ce2roX/4kjleajggkWxZMK2Rv6
 s+wWhXcUXQWaHA2dW2YTjptj1ridRSRqg2qUHufri+IREsjspyinJ4F9U6BEDKrHAMDE
 PJKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t0xfTppKl9j5y3iU7XDGdIRYYl8Bsxh+R+RR25irynk=;
 b=S8byHwC9vZ7cWsoZWoIuzTy7AlxJIgCgK9tzBg4clhcBYn29+CoigX+2bAJ0FRTNaM
 X0CbMyUOtlVM+V0UtIPtS3wc2BYj4t57zRos4khpGVKC1mI92zNdpKyD6icfm6UoaiI2
 Os4Ngn0t0Sypt+Hnzyp9he1kaxX3y8yzA7SQzjbzHscigNohudj9v6VPZ7bqdbh3Unkd
 A382kUCyd6sBnpIZJoD/Imb/5Cy6Sn20gkGbho5DLjCqpnvf0QD6ZmL/R4pwUSZIvQnL
 j5Thy/cuo9P6HMN3G8qesETLgZymkXvV+M66fPJVFhE/OQuku3hhvrzDGTxD3q5T6ubO
 zpvw==
X-Gm-Message-State: ACrzQf1GesDvp/x0q79MOeeO9C3OMoU1+NUhtYgHriv3QZs+flE9rZuQ
 TfA+XDKKC72c+qkxKljhWG3NvLUrJpA=
X-Google-Smtp-Source: AMsMyM7WLY3wlejfEXwZBGG31Lrz+E/tvdJDnM0iJ9jBdRHamozSPAg70EKAA38ISTslGCiQ0qC66g==
X-Received: by 2002:a05:6512:a93:b0:4a2:6792:c43c with SMTP id
 m19-20020a0565120a9300b004a26792c43cmr21167204lfu.460.1668063604396; 
 Wed, 09 Nov 2022 23:00:04 -0800 (PST)
Received: from localhost.localdomain (88-115-161-74.elisa-laajakaista.fi.
 [88.115.161.74]) by smtp.gmail.com with ESMTPSA id
 f12-20020a2eb5ac000000b002772414817esm2513991ljn.1.2022.11.09.23.00.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Nov 2022 23:00:03 -0800 (PST)
From: Zhi Wang <zhi.wang.linux2@gmail.com>
X-Google-Original-From: Zhi Wang <zhi.a.wang@intel.com>
To: 
Subject: [PATCH v2 3/3] drm/i915/gvt: show the vGPU status in debugfs
Date: Thu, 10 Nov 2022 06:59:59 +0000
Message-Id: <20221110065959.32249-3-zhi.a.wang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221110065959.32249-1-zhi.a.wang@intel.com>
References: <20221110065959.32249-1-zhi.a.wang@intel.com>
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

v2:

- Fixed an error found by Zhenyu.

Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: Kevin Tian <kevin.tian@intel.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: intel-gvt-dev@lists.freedesktop.org
Signed-off-by: Zhi Wang <zhi.a.wang@intel.com>
Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>
---
 drivers/gpu/drm/i915/gvt/debugfs.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/i915/gvt/debugfs.c b/drivers/gpu/drm/i915/gvt/debugfs.c
index bb301bc974a4..dfef822fdae0 100644
--- a/drivers/gpu/drm/i915/gvt/debugfs.c
+++ b/drivers/gpu/drm/i915/gvt/debugfs.c
@@ -151,6 +151,22 @@ DEFINE_SIMPLE_ATTRIBUTE(vgpu_scan_nonprivbb_fops,
 			vgpu_scan_nonprivbb_get, vgpu_scan_nonprivbb_set,
 			"0x%llx\n");
 
+static int vgpu_status_get(void *data, u64 *val)
+{
+	struct intel_vgpu *vgpu = (struct intel_vgpu *)data;
+
+	*val = 0;
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
@@ -166,6 +182,8 @@ void intel_gvt_debugfs_add_vgpu(struct intel_vgpu *vgpu)
 			    &vgpu_mmio_diff_fops);
 	debugfs_create_file("scan_nonprivbb", 0644, vgpu->debugfs, vgpu,
 			    &vgpu_scan_nonprivbb_fops);
+	debugfs_create_file("status", 0644, vgpu->debugfs, vgpu,
+			    &vgpu_status_fops);
 }
 
 /**
-- 
2.25.1

