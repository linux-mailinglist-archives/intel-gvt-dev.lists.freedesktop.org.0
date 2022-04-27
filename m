Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC1A512489
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 27 Apr 2022 23:28:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8188910E8FB;
	Wed, 27 Apr 2022 21:28:56 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D230610E675;
 Wed, 27 Apr 2022 21:28:54 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id k12so5336785lfr.9;
 Wed, 27 Apr 2022 14:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ECFsRTMZ3fi8GBJSz2+uU2kp3dNDSFoXxw9E4mxEGjM=;
 b=d597xMl4KSbhDxP4BCdygBXPa7QMbUVTu8HjeGHlT62tXpWTnThlzAwdyjH/WtsP+h
 NYB+I4OUyB9DjYwAFlWOcSmEnD6If0JlJUCsgyWBPnapHlFhiunKHgJJpbFdkS0twBRj
 3X5Vrvu7zDoTasEh0s7cAMiM7127jaHzQn16mEtIdbOb5GnkCzOzjHbG3gOqrKS6iuID
 uCrGX8SCbFvIYf4UsrxCqpKX7Y+oDN1m62LYUgzfU4xMKfUwa08Ph2bVQLa/wSWu78j5
 KyRCQS+MANz0m8c+z8f65IPmorbcwxTN9HRWkY5g57uVawh8H1+bPMNtjHmk9eadBq3R
 3jyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ECFsRTMZ3fi8GBJSz2+uU2kp3dNDSFoXxw9E4mxEGjM=;
 b=tn3apEWzf/Z/Vkb9pMcAbBLLqF9pe2rqjE8grTSr8z9RPeqqc2t8HXqutw5P4pdVC4
 TU9yufu+OP71jLolrjrak6Rj3lh0nj8nMa43z6kb4E0G3zXXbM5uswvMqhQvg8u8q2lv
 SLwNBDB6KILX0p0fbPL/fY5VPih4pAYltoIPaokJJ2BYXDCHLm3rSZXYWUlaIgUGPAaU
 8GhKg/AJ6mJ4kdLdWpDOBYihmWIL+hkQJhuFXXt2CXnv3MnktOIA8yJa5UvzslRWYL87
 ++YBp7K8j1z94DvtvadPAU4BaWMWfUd3G96TneL/pZQij+/+QdtZ56zfkjykagdg8xtG
 CsHw==
X-Gm-Message-State: AOAM532D/5EJ3f8hg9A/bBIG/xTWXHRRKXVEj6dMn/yFQWqqeZXddYdW
 rkD0uPauZvFD28byI3E90kMX8ewFZpg=
X-Google-Smtp-Source: ABdhPJwxdwVmnMjN0fbmXPjuuPOcaX3pxHt3yRUaOjQ77SOXCpmO/Nk5kRjZDkbEjb/qKV1ozH5r/Q==
X-Received: by 2002:a19:ae0a:0:b0:472:d3e:8312 with SMTP id
 f10-20020a19ae0a000000b004720d3e8312mr10628115lfc.176.1651094932868; 
 Wed, 27 Apr 2022 14:28:52 -0700 (PDT)
Received: from zhiwang1-mobl.lan (88-115-161-74.elisa-laajakaista.fi.
 [88.115.161.74]) by smtp.gmail.com with ESMTPSA id
 m8-20020a2e9348000000b0024b47e7dda5sm1879248ljh.65.2022.04.27.14.28.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 14:28:52 -0700 (PDT)
From: Zhi Wang <zhi.wang.linux@gmail.com>
X-Google-Original-From: Zhi Wang <zhi.a.wang@intel.com>
To: intel-gvt-dev@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/i915/gvt: Fix the compiling error when
 CONFIG_DRM_I915_DEBUG_RUNTIME_PM=n
Date: Wed, 27 Apr 2022 17:28:49 -0400
Message-Id: <20220427212849.18109-2-zhi.a.wang@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220427212849.18109-1-zhi.a.wang@intel.com>
References: <20220427212849.18109-1-zhi.a.wang@intel.com>
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
Cc: Jani Nikula <jani.nikula@linux.intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

A compiling error was reported when CONFIG_DRM_I915_DEBUG_RUNTIME_PM=n.
Fix the problem by using the pre-defined macro.

Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Signed-off-by: Zhi Wang <zhi.a.wang@intel.com>
---
 drivers/gpu/drm/i915/intel_gvt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/intel_gvt.c b/drivers/gpu/drm/i915/intel_gvt.c
index 24bc693439e8..e98b6d69a91a 100644
--- a/drivers/gpu/drm/i915/intel_gvt.c
+++ b/drivers/gpu/drm/i915/intel_gvt.c
@@ -309,7 +309,9 @@ EXPORT_SYMBOL_NS_GPL(__intel_context_do_pin, I915_GVT);
 EXPORT_SYMBOL_NS_GPL(__intel_context_do_unpin, I915_GVT);
 EXPORT_SYMBOL_NS_GPL(intel_ring_begin, I915_GVT);
 EXPORT_SYMBOL_NS_GPL(intel_runtime_pm_get, I915_GVT);
+#if IS_ENABLED(CONFIG_DRM_I915_DEBUG_RUNTIME_PM)
 EXPORT_SYMBOL_NS_GPL(intel_runtime_pm_put, I915_GVT);
+#endif
 EXPORT_SYMBOL_NS_GPL(intel_runtime_pm_put_unchecked, I915_GVT);
 EXPORT_SYMBOL_NS_GPL(intel_uncore_forcewake_for_reg, I915_GVT);
 EXPORT_SYMBOL_NS_GPL(intel_uncore_forcewake_get, I915_GVT);
-- 
2.17.1

