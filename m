Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BF0CCAEA9
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 18 Dec 2025 09:35:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE50D10E79E;
	Thu, 18 Dec 2025 08:35:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dVYbE204";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B4FF10E730;
 Thu, 18 Dec 2025 08:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766046930; x=1797582930;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=92W6jN8/o0iLPg0WuYs1cNn0G96rLR7ZA14oq6QjV+M=;
 b=dVYbE204Eg1qZOmosVmDSDlYou9xlk2ACQu0rnpY4pyUxDRv3cFHtChE
 sH9xSmQfx75tuufrv/Yaw120lUOnUuakvTUHjsPXul5divdX93A0qwnt5
 HGdFBNDrQ59rL1/3pPQa4cHeUXKM6TgpBtvGS1G53AftG3PNWEX4R1U1o
 u4RsjgFSWuFYcg/cB45ZYzuvpv0x46BzRHaHdEHD0bupg8CAKiWO6dmlT
 tF3BVrWi0GD8X8N0X5rm1vHNH5MTJLNVU6yxtexri4ZguMEwZIEHJwozU
 rYChL8M/RDEXYXVJIqF9awY+ooli4ppZ8mcFaEvcbcXxDaFHNLrL6Anvy w==;
X-CSE-ConnectionGUID: DPQWPTTJQBySuCWZdSglMg==
X-CSE-MsgGUID: Y6cM0hPyRImVeL+/WrOyvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="79365801"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="79365801"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 00:35:30 -0800
X-CSE-ConnectionGUID: kTl6vDOoTkiR8nLKYjPVrg==
X-CSE-MsgGUID: XMB8vonhSyKWfsQ10DTpBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="203597768"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 00:35:28 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com,
	Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 4/7] drm/i915/gvt/display_helpers: Cast argument to enum pipe
 for pipe-offset macro
Date: Thu, 18 Dec 2025 13:52:57 +0530
Message-ID: <20251218082302.2327243-5-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251218082302.2327243-1-ankit.k.nautiyal@intel.com>
References: <20251218082302.2327243-1-ankit.k.nautiyal@intel.com>
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
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

TRANSCONF() expands via _MMIO_PIPE2, i.e., it uses pipe-based addressing.
In GVT, some call sites pass an enum transcoder to TRANSCONF(), which now
routes through INTEL_DISPLAY_DEVICE_PIPE_OFFSET() and ultimately calls
intel_display_device_pipe_offset(), whose parameter type is enum pipe.

This results in -Werror=enum-conversion.

To address this, cast the index to enum pipe in the GVT-side macro
override.

This works for all cases as TRANSCODER_{A,B,C,D} all have 1:1 mapping to
PIPE_{A,B,C,D} except for TRANSCODER_EDP.

There is one place which uses TRANSCONF() with TRANSCODER_EDP, which
appears to be incorrect. In any case, the cast preserves the previous
behaviour.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/gvt/display_helpers.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/display_helpers.h b/drivers/gpu/drm/i915/gvt/display_helpers.h
index 97ebc92768fc..3af878e3d78e 100644
--- a/drivers/gpu/drm/i915/gvt/display_helpers.h
+++ b/drivers/gpu/drm/i915/gvt/display_helpers.h
@@ -17,8 +17,8 @@
 #ifdef INTEL_DISPLAY_DEVICE_PIPE_OFFSET
 #undef INTEL_DISPLAY_DEVICE_PIPE_OFFSET
 #endif
-#define INTEL_DISPLAY_DEVICE_PIPE_OFFSET(display, pipe) \
-	intel_display_device_pipe_offset((display), (pipe))
+#define INTEL_DISPLAY_DEVICE_PIPE_OFFSET(display, idx) \
+	intel_display_device_pipe_offset((display), (enum pipe)(idx))
 
 #ifdef INTEL_DISPLAY_DEVICE_TRANS_OFFSET
 #undef INTEL_DISPLAY_DEVICE_TRANS_OFFSET
-- 
2.45.2

