Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B09712AD1
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 26 May 2023 18:39:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2606210E824;
	Fri, 26 May 2023 16:39:11 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B2E910E824;
 Fri, 26 May 2023 16:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685119149; x=1716655149;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qpeOPviOSpuDkEmBcvIVIfA2YGl0hIe+9aDqFD0vl4g=;
 b=gV6dpdGeriHlAmlFMVNdstoLBGhyDdn3+jcqCHCBhsYBAyYfiGfGqWBy
 QqtWuCsdUpMNwgoGJo0V5AGydNw+E7MiIOfnV9++a3XSRt5SvRKV+a+8n
 7E2z4p8JLBbgn7nLlH4KznFZWuYDxjteT1coMbaJQgo9C6yEnACZin672
 axv0KrRptDTXmis8F1AFQzpFDKe/WA7D2pjfR6/yMmVMsQfiaro8cxUiq
 J+GsG6R7n/W5G14mevqHqrtE3QZAXpwSrzl8gWo3pq5e1K9Xyiftvv2+V
 EHKe1yv25c4RLOiw6Gd0HQRkFghnBNvlBha9b8LpCdhrzT6Btl6lAKiaw g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="420006276"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="420006276"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 09:39:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="951949687"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="951949687"
Received: from akervine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.55.216])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 09:39:06 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 14/15] drm/i915/gvt: annotate maybe unused gma_bottom variables
Date: Fri, 26 May 2023 19:38:07 +0300
Message-Id: <7e1c475bf123eca6935a1be099cc0608bed49b0b.1685119007.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1685119006.git.jani.nikula@intel.com>
References: <cover.1685119006.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, intel-gvt-dev@lists.freedesktop.org,
 Zhi Wang <zhi.a.wang@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Prepare for re-enabling -Wunused-but-set-variable.

Lacking a better idea, annotate the gma_bottom variables with
__maybe_unused.

Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: Zhi Wang <zhi.a.wang@intel.com>
Cc: intel-gvt-dev@lists.freedesktop.org
Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Frankly I'm not sure what to do with these. Maybe the variables should
be dropped altogether?
---
 drivers/gpu/drm/i915/gvt/cmd_parser.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i915/gvt/cmd_parser.c
index 3c4ae1da0d41..2801e17e5522 100644
--- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
+++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
@@ -2833,7 +2833,7 @@ static int command_scan(struct parser_exec_state *s,
 
 static int scan_workload(struct intel_vgpu_workload *workload)
 {
-	unsigned long gma_head, gma_tail, gma_bottom;
+	unsigned long gma_head, gma_tail, __maybe_unused gma_bottom;
 	struct parser_exec_state s;
 	int ret = 0;
 
@@ -2874,7 +2874,7 @@ static int scan_workload(struct intel_vgpu_workload *workload)
 static int scan_wa_ctx(struct intel_shadow_wa_ctx *wa_ctx)
 {
 
-	unsigned long gma_head, gma_tail, gma_bottom, ring_size, ring_tail;
+	unsigned long gma_head, gma_tail, __maybe_unused gma_bottom, ring_size, ring_tail;
 	struct parser_exec_state s;
 	int ret = 0;
 	struct intel_vgpu_workload *workload = container_of(wa_ctx,
-- 
2.39.2

