Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 453F390012F
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  7 Jun 2024 12:51:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C14A410EBB1;
	Fri,  7 Jun 2024 10:51:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z+GOIOoD";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70C3F10EBAE;
 Fri,  7 Jun 2024 10:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717757497; x=1749293497;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BH6hRJv5Ba1d5urz3wJdcWo9vqB+6wpug+F8X5HRh0s=;
 b=Z+GOIOoDOlevtyeRZ7Slwjd/tL5YuhJmWByRg2VsFhYyWQDzDVRIcir1
 5R/MwYbv3JHoVOrSoiA9VB3c8Q7Tq/U5mWgMM63+SjWgg54yUFMRlhu+O
 23L7am5vay86s/NzmdCvLZ3t8DmOJDa7/A25upV0uztD+vFvekriAzyuT
 uhQd/cuPyOd8+KzUQ+jMIMZmdCxJgymwZ4fcHeCwQL+QGpN03ouNs/oe/
 +7hHGz5/OhSxBvGkQvX4KxW5h4VbbM5hKo/Ulbq7Gg3MnccrC65ypXm58
 2oe9tFlVUEh3kBgOn7UsNuwwUXpNHQ4qYZ0LPju0ev0bLoYtcCmoMYYoP w==;
X-CSE-ConnectionGUID: uJQ3QBf9TFWZmzaXco/4kA==
X-CSE-MsgGUID: 5L2uH7UVSLSTngf1wtuKsA==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="39873234"
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; d="scan'208";a="39873234"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 03:51:36 -0700
X-CSE-ConnectionGUID: QrOAxlZwS3iJJtckk1/7Ow==
X-CSE-MsgGUID: 4aY07W8ERNe+twoargHzaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; d="scan'208";a="38367201"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.72])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 03:51:33 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-gvt-dev@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, ville.syrjala@linux.intel.com,
 jani.nikula@intel.com
Subject: [PATCH 0/6] drm/i915: gvt register macro cleanups,
 unused macro removals
Date: Fri,  7 Jun 2024 13:51:23 +0300
Message-Id: <cover.1717757337.git.jani.nikula@intel.com>
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

Clean up gvt a bit mainly to be able to remove direct _DSPBSURF
reference, but do some drive-by cleanups on top. And then proceed to
remove _DSPBSURF and other unused register macros.

BR,
Jani.

Jani Nikula (6):
  drm/i915/gvt: remove the unused end parameter from calc_index()
  drm/i915/gvt: use proper i915_reg_t for calc_index() parameters
  drm/i915/gvt: rename range variable to stride
  drm/i915/gvt: do not use implict dev_priv in DSPSURF_TO_PIPE()
  drm/i915: remove unused pipe/plane B register macros
  drm/i915: remove unused HSW_STEREO_3D_CTL register macros

 drivers/gpu/drm/i915/gvt/handlers.c | 29 +++++++++++++++--------------
 drivers/gpu/drm/i915/i915_reg.h     | 29 -----------------------------
 2 files changed, 15 insertions(+), 43 deletions(-)

-- 
2.39.2

