Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB0C513CB9
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 28 Apr 2022 22:41:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47D7F10EC0E;
	Thu, 28 Apr 2022 20:41:04 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29B1D10EC14;
 Thu, 28 Apr 2022 20:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651178462; x=1682714462;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H2LNFRfTnXF5ZokGpnNe92Oy4E7Gw0lewhFOVnypfQ8=;
 b=jaNNRok++kCYM/bZA9Me98eQEVpUMHshNLWNSzQgWCgeX6LtPApevydi
 /0vyQeSo9d06t+Z628VpARBxI/nVyEXRNXwyXkJwcanCYC4OEmfvFwSh3
 RHczh5MnSXIU5uPAPwL94x9Xq90gnKIPGE7e0NkhJB2mFLBCL/x4RRweI
 SH5m5l98oVuLWlBRMFeiu5oqjLxb4M5NY8O1zsTfiiCqYrLxhAaSD1Kuv
 HcxlBOfaj3pM5lXkLS0tnXurM7VRW0DFthLP93gcft1q7c4jE52proSrP
 rBwgJQ8/+mnjh+eZ+YVoXdgjsezXCyUAFUwg+8743gzd59pMqDNKaZF9d w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10331"; a="326910168"
X-IronPort-AV: E=Sophos;i="5.91,296,1647327600"; d="scan'208";a="326910168"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2022 13:41:00 -0700
X-IronPort-AV: E=Sophos;i="5.91,296,1647327600"; d="scan'208";a="534086839"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2022 13:41:00 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH 2/2] drm/i915/gvt: Fix wrong kernel doc
Date: Thu, 28 Apr 2022 13:40:11 -0700
Message-Id: <20220428204011.3365653-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220428204011.3365653-1-lucas.demarchi@intel.com>
References: <20220428204011.3365653-1-lucas.demarchi@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, zhenyuw@linux.intel.com,
 zhi.a.wang@intel.com, jani.nikula@linux.intel.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Fix function name when documenting it:

	drivers/gpu/drm/i915/gvt/handlers.c:3066: warning: expecting prototype
	for intel_t_default_mmio_write(). Prototype was for
	intel_vgpu_default_mmio_write() instead

Fixes: e39c5add3221 ("drm/i915/gvt: vGPU MMIO virtualization")
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/gvt/handlers.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index e4358aa01048..49aacae3b16f 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -3052,7 +3052,7 @@ int intel_vgpu_default_mmio_read(struct intel_vgpu *vgpu, unsigned int offset,
 }
 
 /**
- * intel_t_default_mmio_write - default MMIO write handler
+ * intel_vgpu_default_mmio_write - default MMIO write handler
  * @vgpu: a vGPU
  * @offset: access offset
  * @p_data: write data buffer
-- 
2.36.0

