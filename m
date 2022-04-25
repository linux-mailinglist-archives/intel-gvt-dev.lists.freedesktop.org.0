Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 985D750EB64
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 26 Apr 2022 00:03:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E5C610E39E;
	Mon, 25 Apr 2022 22:03:38 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3E1610E39E;
 Mon, 25 Apr 2022 22:03:36 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id w1so28667795lfa.4;
 Mon, 25 Apr 2022 15:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=67ahmdVAhIxculn1AwexAlcS0b3Ve7EHznzIxJyBjoA=;
 b=jX4kBqc9jtJ4prTQtY1R4xvF8yhsLQHURwQqBDIKV8k4rCKJK4ZEqRYWSZE7ncXVkM
 lcGeHFX0Qg4pNPUWUCoiUWm2OaCSP3xxa3/qg37sQprYM0ssG+mPZOcoBTvEhMqzrmca
 deN6IC3eQbT9WmabCb2u/WMtVaTLaPcW88LKMZ5wKnEWajC7RTP+eWb//1NS2cYhTIP8
 Ni3Ji6+6DlRZxAcfyTLQnIyWF3CTI53eyU2tzZzywxO89ef2awnqLl/zpFZeGvdEwEyu
 mIkMorL7/gkXqBGvHAVeQUq9yPtkhjFPeg4wFlSDvep8yaMbPGkJKJCiI62kM424Hojc
 4SCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=67ahmdVAhIxculn1AwexAlcS0b3Ve7EHznzIxJyBjoA=;
 b=CNl908rtZ7V1xeos5DqAtemz1m+HWsQbkdXoYkbh8953aLNR4q7SI6mUSImW3+TZHx
 mYkARwUjVT4YJktyVKjbztydofaP2O4hq2JnibWPF3wuz3xIz6m/zqrzYm0JFZXyN+R0
 k1AMId7zpU95YlpMBIrk5CfYn+8uf6RU+7DbM5eCHJstjmfKM3dFPHjSrOd0VEIZJm92
 O0IhGJ/RmxjgBsRm2jKiiORCoQKwlFP6J4xEvL23LW1+k3I2nEqOWBfQrgICaWHsWZ01
 YkoRmrTJV/umN9A9taXguUYfV1ygbHkbXAiWj6wZZfYj4EtFWkTD6BstCFVaQbvQ/lz1
 qkHA==
X-Gm-Message-State: AOAM531iKC6hZdpfSCPLf9aw0uapL6s5Tc41tvwF6B+rLPjBLEHs0ZkC
 Oa10KOqOrXo6Dr+1YtdJUD1VARmLb7Q=
X-Google-Smtp-Source: ABdhPJz5Eyqp6J9Bej44GJy/DkLWDY+8MRELiZ5Khy5jzKWytNc0pIPS2q9HkWjTSzQ7marjZv+xeQ==
X-Received: by 2002:a05:6512:b9b:b0:472:c9a:1592 with SMTP id
 b27-20020a0565120b9b00b004720c9a1592mr3648197lfv.179.1650924214655; 
 Mon, 25 Apr 2022 15:03:34 -0700 (PDT)
Received: from zhiwang1-mobl.lan (88-115-161-74.elisa-laajakaista.fi.
 [88.115.161.74]) by smtp.gmail.com with ESMTPSA id
 v6-20020a2e2f06000000b0024db3d6730esm1315596ljv.82.2022.04.25.15.03.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 15:03:34 -0700 (PDT)
From: Zhi Wang <zhi.wang.linux@gmail.com>
X-Google-Original-From: Zhi Wang <zhi.a.wang@intel.com>
To: intel-gvt-dev@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/gvt: Add missing symbol export.
Date: Mon, 25 Apr 2022 18:03:31 -0400
Message-Id: <20220425220331.24865-1-zhi.a.wang@intel.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Jani Nikula <jani.nikula@intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

When CONFIG_DRM_I915_DEBUG_RUNTIME and CONFIG_DRM_I915_DEBUG_PM
are enabled, two more extra symols in i915 are required to be
exported.

Cc: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Zhi Wang <zhi.a.wang@intel.com>
---
 drivers/gpu/drm/i915/intel_gvt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/intel_gvt.c b/drivers/gpu/drm/i915/intel_gvt.c
index 7c03d975069e..24bc693439e8 100644
--- a/drivers/gpu/drm/i915/intel_gvt.c
+++ b/drivers/gpu/drm/i915/intel_gvt.c
@@ -309,6 +309,7 @@ EXPORT_SYMBOL_NS_GPL(__intel_context_do_pin, I915_GVT);
 EXPORT_SYMBOL_NS_GPL(__intel_context_do_unpin, I915_GVT);
 EXPORT_SYMBOL_NS_GPL(intel_ring_begin, I915_GVT);
 EXPORT_SYMBOL_NS_GPL(intel_runtime_pm_get, I915_GVT);
+EXPORT_SYMBOL_NS_GPL(intel_runtime_pm_put, I915_GVT);
 EXPORT_SYMBOL_NS_GPL(intel_runtime_pm_put_unchecked, I915_GVT);
 EXPORT_SYMBOL_NS_GPL(intel_uncore_forcewake_for_reg, I915_GVT);
 EXPORT_SYMBOL_NS_GPL(intel_uncore_forcewake_get, I915_GVT);
@@ -316,3 +317,4 @@ EXPORT_SYMBOL_NS_GPL(intel_uncore_forcewake_put, I915_GVT);
 EXPORT_SYMBOL_NS_GPL(shmem_pin_map, I915_GVT);
 EXPORT_SYMBOL_NS_GPL(shmem_unpin_map, I915_GVT);
 EXPORT_SYMBOL_NS_GPL(__px_dma, I915_GVT);
+EXPORT_SYMBOL_NS_GPL(i915_fence_ops, I915_GVT);
-- 
2.17.1

