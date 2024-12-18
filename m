Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2A49F686F
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 18 Dec 2024 15:28:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 762BC10EBA5;
	Wed, 18 Dec 2024 14:28:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RWlcBQbk";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C89910E350;
 Wed, 18 Dec 2024 14:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734532125; x=1766068125;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WvdggDTDR+tTlHjWSXoUx+9V5DOkQpfKC4U2BBxvchU=;
 b=RWlcBQbkJ7TRbHKVO3s08xIXsLhea2bqd49OqBbgQFzi9+vzob3cOPz9
 m8WjYC+J0cIMM0aMHUAru8c9vjV4BYNJV6mNKIONf0Qav8w6kQRzYmTq2
 xd6v/LKP6JM+q59Hnde5kbZUe8VgaoFXv/7A86VUPxcV0Z/5mh6fLGm+G
 Tv6UPwXnmYGsxyMFVfiYb8RcP9GglQ7DaqRglc1F3bzX9yRzBsZwlOSIt
 ttLXRJcuaOSevBytaPpo1IiZu/ph7s1eMscbwfc/RyQ08EA/N3mgbwenW
 ZLutjoCkfkoi/rEjMxli9Yd9EZ7K8+2g8b+nQqPqiSUwkDsy/N5tK3PO0 A==;
X-CSE-ConnectionGUID: miSoO+8FR6KQK3rDPrFrnA==
X-CSE-MsgGUID: e0FMH/++TxaRaYtNF2drkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="52534823"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="52534823"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 06:19:51 -0800
X-CSE-ConnectionGUID: NWiAQXQATuemPob8MSQLIA==
X-CSE-MsgGUID: DSiNMvywSIaGUmrl4jvNYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="98291919"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.108])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 06:19:49 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-gvt-dev@lists.freedesktop.org,
	jani.nikula@intel.com
Subject: [PATCH] drm/i915/gvt: store virtual_dp_monitor_edid in rodata
Date: Wed, 18 Dec 2024 16:19:45 +0200
Message-Id: <20241218141945.2588604-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
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

The virtual DP EDID isn't modified. Add const modifier to store it in
rodata.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/gvt/display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/display.c b/drivers/gpu/drm/i915/gvt/display.c
index 95570cabdf27..c98dfcc3d0de 100644
--- a/drivers/gpu/drm/i915/gvt/display.c
+++ b/drivers/gpu/drm/i915/gvt/display.c
@@ -97,7 +97,7 @@ int pipe_is_enabled(struct intel_vgpu *vgpu, int pipe)
 	return 0;
 }
 
-static unsigned char virtual_dp_monitor_edid[GVT_EDID_NUM][EDID_SIZE] = {
+static const unsigned char virtual_dp_monitor_edid[GVT_EDID_NUM][EDID_SIZE] = {
 	{
 /* EDID with 1024x768 as its resolution */
 		/*Header*/
-- 
2.39.5

