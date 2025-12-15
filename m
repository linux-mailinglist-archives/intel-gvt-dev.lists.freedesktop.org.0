Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B095CBD80A
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 15 Dec 2025 12:31:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91CFF10E413;
	Mon, 15 Dec 2025 11:31:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RPeTDODc";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6128010E437;
 Mon, 15 Dec 2025 11:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765798275; x=1797334275;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Xu8FuFjgVqe61VaRFKAfb4C3W4NL6x1tzNu+Fdmr9g0=;
 b=RPeTDODcwTBtn4fD9GURmXqHnutcmai7fyTU0KNvRgJFtY0Dqf6GwGlL
 itik4oYVjUbvn6f5hEYmc4nLQtFPdIZEmhKQMHg+NqEmkJagWS5/pb0uv
 x56xILimdrq+dKRsVsuOsUubOhyQanOO/L3yUL7bKkBuaHrAT4gtyIUUy
 clUgtH7eKdvxzoV7746n9Hv3ntaCJUfaRyUq4eWa+rv34G3u+L4vWyn4Y
 VAW/un0RgjdbpccP6DyaWccbBMTxMVQTAbGbPdHtWBtjMQC/jfbf3991W
 D0Ehd0+OqkX5aZlRgkm+h+MAvwosehs6d+C/otnR06jXXqhdkd1HMprk7 A==;
X-CSE-ConnectionGUID: 0GA9EGdcSIusDVh58nhFJw==
X-CSE-MsgGUID: /4u3PtfpQ3iAF6hHLYOVTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="67732784"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208";a="67732784"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 03:31:14 -0800
X-CSE-ConnectionGUID: chAfgSknQwKr4CP+4uyUvA==
X-CSE-MsgGUID: rjCpiOjbQbChROTRNU1qhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208";a="235090431"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 03:31:14 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com,
	Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 5/5] drm/i915/gvt/display_helpers: Cast argument to enum pipe
 for pipe-offset macro
Date: Mon, 15 Dec 2025 16:48:41 +0530
Message-ID: <20251215111842.2099789-6-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251215111842.2099789-1-ankit.k.nautiyal@intel.com>
References: <20251215111842.2099789-1-ankit.k.nautiyal@intel.com>
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
index d11ebb03b946..fb75cc9f97cc 100644
--- a/drivers/gpu/drm/i915/gvt/display_helpers.h
+++ b/drivers/gpu/drm/i915/gvt/display_helpers.h
@@ -21,8 +21,8 @@ struct display;
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

