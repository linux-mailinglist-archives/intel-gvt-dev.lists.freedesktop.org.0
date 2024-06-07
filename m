Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 625FA9008BA
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  7 Jun 2024 17:25:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E9FF10ECB1;
	Fri,  7 Jun 2024 15:25:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PmKw7LEG";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF87C10ECB1;
 Fri,  7 Jun 2024 15:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717773949; x=1749309949;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NqteOYkny32qoloe7rlD4JtCfXQsufB6XcJQL31i+Mc=;
 b=PmKw7LEGTo3qq+GDJTUnE/4qwWJpaQ1kAA5sdJu48XGE8/wqJCBECQuP
 m1GPH9PoFDqXKT9fNDEHZgwDGmDaucbm9FZDAIUwNkvFcEJ+dp9xORBHA
 lCd0SyRYHonkV+25KjYTe7s5kz45e326OMTg3LCXJg8Pl90py9Dnu7kYd
 3Fcw62I/15i8MjtQ/NIBNvhCLzUSXETZhAiPsFiqB+CK8JbG2FIujYXNU
 h1YuMwZZtZf57pjFDEn8wzt0Q+uBG+Aeskh3tgutLP08XPFyfuApmTi8b
 p7g9gZs+KmNkKa45JPt7pA4Us/eqSOBLPJ2cuU3P3PRDT2o0VCvEYssZB g==;
X-CSE-ConnectionGUID: PzVnO/bFRluz2H3RA8jxVA==
X-CSE-MsgGUID: 5+Bd7+OLRpSlx0TlabOUww==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="14633339"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="14633339"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 08:25:46 -0700
X-CSE-ConnectionGUID: tA3hRYE2SwSnC2wQiIkxuw==
X-CSE-MsgGUID: w7G8C7N/SuOQ+qAxtw+zNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="43491152"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.72])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 08:25:44 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-gvt-dev@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, ville.syrjala@linux.intel.com,
 jani.nikula@intel.com
Subject: [PATCH v2 0/6] drm/i915: gvt register macro cleanups,
 unused macro removals
Date: Fri,  7 Jun 2024 18:25:34 +0300
Message-Id: <cover.1717773890.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

v2 of https://lore.kernel.org/r/cover.1717757337.git.jani.nikula@intel.com

Jani Nikula (6):
  drm/i915/gvt: remove the unused end parameter from calc_index()
  drm/i915/gvt: use proper i915_reg_t for calc_index() parameters
  drm/i915/gvt: rename range variable to stride
  drm/i915/gvt: do not use implict dev_priv in DSPSURF_TO_PIPE()
  drm/i915: relocate some DSPCNTR reg bit definitions
  drm/i915: remove unused pipe/plane B register macros

 .../gpu/drm/i915/display/i9xx_plane_regs.h    |  2 ++
 drivers/gpu/drm/i915/gvt/handlers.c           | 29 ++++++++++---------
 drivers/gpu/drm/i915/i915_reg.h               | 23 ---------------
 3 files changed, 17 insertions(+), 37 deletions(-)

-- 
2.39.2

