Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1092BCBD7FE
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 15 Dec 2025 12:31:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 686FA10E42F;
	Mon, 15 Dec 2025 11:31:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d1FPXBhN";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8890D10E3F4;
 Mon, 15 Dec 2025 11:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765798265; x=1797334265;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=G1nikKrpos+4eEcRr66hTbk1bo3WNaRaPW8upBd7gd4=;
 b=d1FPXBhNnzTZzJKZbs8loXkfsNlpKQIhl+VvwJdMTI8U+PQKffKDLK/b
 FkyKvFdp6n1eIz/UH4uV9PC+NLjnckMRYPBHj14uRmrY6hYEspO2kxvDj
 B5mhAqbERgW1FyYqtyEuIy9twCbHMbbzIFX0DX1/e9Ri8YD6XtcnnFvh0
 gSQRk5WBc932TaG3g8JrYEe3ccJhQe/13xpyq8Q7Ymw2BGjmF7cAg6yjv
 5jB3XECd7dJlf0PRW8j5zXNZvUvxUi9eIgfZwVdp6E2qgojP1dzwLrXBv
 szsSO/0UfJxMavZoUYoKoujEJUZsgG5DhuQ9nTSIVmhrNx8JLZK1EkZJv Q==;
X-CSE-ConnectionGUID: aDxSE37WTPyURB9JGuV3Ag==
X-CSE-MsgGUID: S3z+1o7IRrGGtKIeqJOmZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="67732755"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208";a="67732755"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 03:31:05 -0800
X-CSE-ConnectionGUID: XAwHH+r+RJKgI18Uc1H/iA==
X-CSE-MsgGUID: nLzwftedRWeFwNoqWERNfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208";a="235090377"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 03:31:03 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com,
	Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 0/5] Prepare GVT for display modularization
Date: Mon, 15 Dec 2025 16:48:36 +0530
Message-ID: <20251215111842.2099789-1-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
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

GVT currently relies on display internals through register macros and helpers
like for_each_pipe(). This tight coupling makes modularization difficult
because GVT should not access struct intel_display directly.
Add an API for GVT code to expose DISPLAY_RUNTIME_INFO()->pipe_mask.
This series introduces changes to make GVT independent of display internals
while keeping existing macros usable:

- Abstract offset calculations in display using
  INTEL_DISPLAY_DEVICE_*_OFFSET() macros.
- Add APIs for GVT to compute offsets and pipe mask via functions.
- Update GVT to use these APIs by overriding helper macros and
  for_each_pipe().

Ankit Nautiyal (5):
  drm/i915/display: Abstract pipe/trans/cursor offset calculation
  drm/i915/display: Add APIs to be used by gvt to get the register
    offsets
  drm/i915/gvt: Add header to use display offset functions in macros
  drm/i915/gvt: Change for_each_pipe to use pipe_mask API
  drm/i915/gvt/display_helpers: Cast argument to enum pipe for
    pipe-offset macro

 drivers/gpu/drm/i915/Makefile                 |  1 +
 .../drm/i915/display/intel_display_device.h   | 17 +++++++
 .../drm/i915/display/intel_display_limits.c   |  0
 .../drm/i915/display/intel_display_reg_defs.h | 15 ++----
 drivers/gpu/drm/i915/display/intel_gvt_api.c  | 40 ++++++++++++++++
 drivers/gpu/drm/i915/display/intel_gvt_api.h  | 21 +++++++++
 drivers/gpu/drm/i915/gvt/cmd_parser.c         |  2 +
 drivers/gpu/drm/i915/gvt/display.c            |  2 +
 drivers/gpu/drm/i915/gvt/display_helpers.h    | 46 +++++++++++++++++++
 drivers/gpu/drm/i915/gvt/fb_decoder.c         |  2 +
 drivers/gpu/drm/i915/gvt/handlers.c           |  2 +
 11 files changed, 137 insertions(+), 11 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_limits.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_gvt_api.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_gvt_api.h
 create mode 100644 drivers/gpu/drm/i915/gvt/display_helpers.h

-- 
2.45.2

