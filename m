Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D312416FB
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 11 Aug 2020 09:13:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 544D36E29D;
	Tue, 11 Aug 2020 07:13:08 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31B7B6E29D
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 11 Aug 2020 07:13:07 +0000 (UTC)
IronPort-SDR: wLwPmNBFZbaefC04s54uoKug58I+jDLyxyO7Vo2grg59/a7tQy6O1AouWB/OuHFoxdy84ASjux
 GvyO/Vb6813g==
X-IronPort-AV: E=McAfee;i="6000,8403,9709"; a="238513814"
X-IronPort-AV: E=Sophos;i="5.75,460,1589266800"; d="scan'208";a="238513814"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2020 00:13:06 -0700
IronPort-SDR: Wb894ld7+mGkwYL6u0LFv6XNSO9fygGHq7tzRmgz94Mr+wpzG2QhLoTtMrILPgDmMmc7AyJ4yY
 MW6EB0Q/jCCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,460,1589266800"; d="scan'208";a="324682525"
Received: from joy-optiplex-7040.sh.intel.com ([10.239.13.16])
 by orsmga008.jf.intel.com with ESMTP; 11 Aug 2020 00:13:03 -0700
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org,
	zhenyuw@linux.intel.com
Subject: [PATCH 2/4] drm/i915/gvt: remove flag F_CMD_ACCESSED
Date: Tue, 11 Aug 2020 14:37:44 +0800
Message-Id: <20200811063744.3272-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200811055140.29123-1-yan.y.zhao@intel.com>
References: <20200811055140.29123-1-yan.y.zhao@intel.com>
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
Cc: Yan Zhao <yan.y.zhao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

flag F_CMD_ACCESSED is not used. just remove it.

Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
---
 drivers/gpu/drm/i915/gvt/cmd_parser.c |  2 --
 drivers/gpu/drm/i915/gvt/gvt.h        | 14 --------------
 2 files changed, 16 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i915/gvt/cmd_parser.c
index 018509eeb0fe..0292e3c1deb4 100644
--- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
+++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
@@ -992,8 +992,6 @@ static int cmd_reg_handler(struct parser_exec_state *s,
 		}
 	}
 
-	/* TODO: Update the global mask if this MMIO is a masked-MMIO */
-	intel_gvt_mmio_set_cmd_accessed(gvt, offset);
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gvt.h
index 899945b91cc6..8fbe65471c01 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.h
+++ b/drivers/gpu/drm/i915/gvt/gvt.h
@@ -253,8 +253,6 @@ struct intel_gvt_mmio {
 /* This reg has been accessed by a VM */
 #define F_ACCESSED	(1 << 4)
 /* This reg has been accessed through GPU commands */
-#define F_CMD_ACCESSED	(1 << 5)
-/* This reg could be accessed by unaligned address */
 #define F_UNALIGN	(1 << 6)
 /* This reg is in GVT's mmio save-restor list and in hardware
  * logical context image
@@ -619,18 +617,6 @@ static inline bool intel_gvt_mmio_is_unalign(
 	return gvt->mmio.mmio_attribute[offset >> 2] & F_UNALIGN;
 }
 
-/**
- * intel_gvt_mmio_set_cmd_accessed - mark a MMIO has been accessed by command
- * @gvt: a GVT device
- * @offset: register offset
- *
- */
-static inline void intel_gvt_mmio_set_cmd_accessed(
-			struct intel_gvt *gvt, unsigned int offset)
-{
-	gvt->mmio.mmio_attribute[offset >> 2] |= F_CMD_ACCESSED;
-}
-
 /**
  * intel_gvt_mmio_has_mode_mask - if a MMIO has a mode mask
  * @gvt: a GVT device
-- 
2.17.1

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
