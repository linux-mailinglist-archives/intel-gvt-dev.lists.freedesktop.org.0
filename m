Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E50A6E8C5
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 25 Mar 2025 05:01:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79E2210E314;
	Tue, 25 Mar 2025 04:01:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C/FeCpcY";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EF6710E314
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 25 Mar 2025 04:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742875273; x=1774411273;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=2rVIbEkjjBv809G9tRIWfJuBfJW8klh0xbvZU25gkvo=;
 b=C/FeCpcYvdcvriTtcLFPRflL+nOHB1NeqV/gzwwqxRgaEs11nXL8vLF5
 9DXg+DCfUwloP1qy/QsIBvBkcVCEbCAydKtE/uR0+fL/U1zkcmif1l/qI
 8niri+fadmXif/GOSTxDei7ib+HrvtZbxg7IiMn2Agk8kEC4sPPEkb2+o
 2oXUS8L5MC//BAwz0WoGiNrsikM1bdfDa+/HgXQJ49LEl10WeuirlNwbg
 B1vqG03Ha68zda+0gz8/jwvolJMInTfYp0tIbjVdtGGdQKO9UQWde542V
 MJFmSht2P0TOdTMZk1p+5/WYeZeBhf92a+H0DozuKHXbNIcIr+Wt/Ntmm Q==;
X-CSE-ConnectionGUID: evqQfNNiSqabyOz8Zel+PA==
X-CSE-MsgGUID: qoqi+GvVSzKSUADk+HOuAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="55100128"
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="55100128"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 21:01:13 -0700
X-CSE-ConnectionGUID: uFjDnwl4Tt+/E899H6j70w==
X-CSE-MsgGUID: eYj2G3TpQheAAZEbqQjKpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="129435096"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa005.jf.intel.com with ESMTP; 24 Mar 2025 21:01:11 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Tue, 25 Mar 2025 09:16:43 +0530
Subject: [PATCH] drm/i915/gvt: char array initialization overflow
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250325-gvt-v1-1-ef41d30592fd@intel.com>
X-B4-Tracking: v=1; b=H4sIACIn4mcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDYyNT3fSyEl2TVMs0c0NjY/MU4zQloMqCotS0zAqwKdGxtbUAEnkzClU
 AAAA=
X-Change-ID: 20250325-gvt-4e9f71337d3f
To: intel-gvt-dev@lists.freedesktop.org
Cc: andi.shyti@linux.intel.com, Arun R Murthy <arun.r.murthy@intel.com>
X-Mailer: b4 0.15-dev
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
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Initializer string for array of char is too long, since the char array
is initialized in place leave the length as open and let compiler choose
based on the initialized value.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/i915/gvt/opregion.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/opregion.c b/drivers/gpu/drm/i915/gvt/opregion.c
index 509f9ccae3a9f09a7596904d88a3ac15cf6b1be7..c5ea490bf2e184c4184e161973675a38436e078c 100644
--- a/drivers/gpu/drm/i915/gvt/opregion.c
+++ b/drivers/gpu/drm/i915/gvt/opregion.c
@@ -222,7 +222,7 @@ int intel_vgpu_init_opregion(struct intel_vgpu *vgpu)
 	u8 *buf;
 	struct opregion_header *header;
 	struct vbt v;
-	const char opregion_signature[16] = OPREGION_SIGNATURE;
+	const char opregion_signature[] = OPREGION_SIGNATURE;
 
 	gvt_dbg_core("init vgpu%d opregion\n", vgpu->id);
 	vgpu_opregion(vgpu)->va = (void *)__get_free_pages(GFP_KERNEL |

---
base-commit: 9a42bdcde0f77b2c1e947e283cc3b267b1ce2056
change-id: 20250325-gvt-4e9f71337d3f

Best regards,
-- 
Arun R Murthy <arun.r.murthy@intel.com>

