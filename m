Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D52E4CCAE87
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 18 Dec 2025 09:35:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B289010E58B;
	Thu, 18 Dec 2025 08:35:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ItMoRxdj";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24E8110E58B;
 Thu, 18 Dec 2025 08:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766046922; x=1797582922;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gmQzpGogDseSzviHg3S4RIVSGmUeLrLFcyzfhBms55Y=;
 b=ItMoRxdjnX2p5cByPuofJ6Hu4M8wl7mnQyxYnIp3zdfffI+ppETp/IYi
 XqUEmbXTEMEg7eLtDXPQ1KClCFg5jTvmg4l4KkdHiJhXSPPAfwn74YvQp
 HmEyLa0GWPQRGDP7ubtl/fjUlEOSciLoXoaNM2en4uzd/z6g+eH24Qkpz
 MxmYJ15AH8ID5UmnbwRiw0MsO1GB3YwiyS8hGWWhz0a808Jpu62cKEbkL
 u8t/+wGIxwYJmdZIP3ea2SrWwZXfBZnUuY1m5IAihaK9GE2ZidJA9iQjW
 PW+mBkza4EQovq9Ph+JECFg48Hxui/qg6z8GWBC/cu2wcQOV3sqldcgTr g==;
X-CSE-ConnectionGUID: cj6oAvpXSCagoukxEz6p7Q==
X-CSE-MsgGUID: lHF+dbFPRQCHpUU7SggQAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="79365783"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="79365783"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 00:35:22 -0800
X-CSE-ConnectionGUID: WCSDUjO+QkWqoaIzvI8zDg==
X-CSE-MsgGUID: /vPvRo6sQb23Ctzu200EyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="203597719"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 00:35:19 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com,
	Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 0/7] Prepare GVT for display modularization
Date: Thu, 18 Dec 2025 13:52:53 +0530
Message-ID: <20251218082302.2327243-1-ankit.k.nautiyal@intel.com>
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

GVT currently relies on display internals through register macros and
helpers like for_each_pipe(). This tight coupling makes modularization
difficult because GVT should not access struct intel_display directly.
Add an API for GVT code to expose DISPLAY_RUNTIME_INFO()->pipe_mask.
This series introduces changes to make GVT independent of display internals
while keeping existing macros usable:

- Abstract offset calculations in display using
  INTEL_DISPLAY_DEVICE_*_OFFSET() macros.
- Add APIs for GVT to compute offsets and pipe mask via functions.
- Update GVT to use these APIs by overriding helper macros and
  for_each_pipe().

Rev2:
- Remove conflicting headers and get rid of #ifdefs/#undefs in last
  patch.
- Wrap macro arguments in paranthesis.
- Rename for_each_pipe to gvt_for_each_pipe.

PS: I have not yet addressed the question about whether we need to start
    using _MMIO_TRANS2() instead of_MMIO_PIPE2() in TRANSCONF() macro.
    That likely needs a separate patch and discussion.
    For now, I have kept the patch#4 to deal with the
    -Werror=enum-conversion:
     - drm/i915/gvt/display_helpers: Cast argument to enum pipe for
       pipe-offset macro

Ankit Nautiyal (7):
  drm/i915/display: Abstract pipe/trans/cursor offset calculation
  drm/i915/display: Add APIs to be used by gvt to get the register
    offsets
  drm/i915/gvt: Add header to use display offset functions in macros
  drm/i915/gvt/display_helpers: Cast argument to enum pipe for
    pipe-offset macro
  drm/i915/gvt: Change for_each_pipe to use pipe_valid API
  drm/i915/gvt: Use the appropriate header for the DPLL macro
  drm/i915/gvt/display_helper: Get rid of #ifdef/#undefs

 drivers/gpu/drm/i915/Makefile                 |  1 +
 .../drm/i915/display/intel_display_device.h   | 17 +++++++
 .../drm/i915/display/intel_display_limits.c   |  0
 .../drm/i915/display/intel_display_reg_defs.h | 15 ++-----
 drivers/gpu/drm/i915/display/intel_gvt_api.c  | 45 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_gvt_api.h  | 21 +++++++++
 drivers/gpu/drm/i915/gvt/cmd_parser.c         |  2 +-
 drivers/gpu/drm/i915/gvt/display.c            |  9 ++--
 drivers/gpu/drm/i915/gvt/display_helpers.h    | 27 +++++++++++
 drivers/gpu/drm/i915/gvt/fb_decoder.c         |  2 +-
 drivers/gpu/drm/i915/gvt/handlers.c           |  2 +-
 11 files changed, 123 insertions(+), 18 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_limits.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_gvt_api.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_gvt_api.h
 create mode 100644 drivers/gpu/drm/i915/gvt/display_helpers.h

-- 
2.45.2

