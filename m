Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD08190D9F
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 24 Mar 2020 13:34:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF6D46E148;
	Tue, 24 Mar 2020 12:34:56 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D120A6E148
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 24 Mar 2020 12:34:55 +0000 (UTC)
IronPort-SDR: 4bYswHI1jXWLcECMWt3Ed1o22wFPc41sPR8BML91lGhZ+iWsfHEnukthq6YkHwjLgv/lUJCBLS
 j+BQnjDXURBw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2020 05:34:55 -0700
IronPort-SDR: tQprZHBGuGOfkW0LLLc3CRNV9owoP90n9jcdLelc9AFQ5M+TEfoAL+YbbvQWUVFB33FxyozQ6j
 rFgC6bUrP+VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,300,1580803200"; d="scan'208";a="250029681"
Received: from kechen-optiplex-9020.bj.intel.com ([10.238.158.100])
 by orsmga006.jf.intel.com with ESMTP; 24 Mar 2020 05:34:53 -0700
From: Tina Zhang <tina.zhang@intel.com>
To: 
Subject: [PATCH] drm/i915/gvt: Fix klocwork issues about data size
Date: Tue, 24 Mar 2020 20:30:21 +0800
Message-Id: <20200324123021.15831-1-tina.zhang@intel.com>
X-Mailer: git-send-email 2.17.1
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
Cc: intel-gvt-dev@lists.freedesktop.org, zhenyuw@linux.intel.com,
 Tina Zhang <tina.zhang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Add llu suffix and cast operator to fix the klocwork warning about
"Operands in a bitwise operation have different size"

Signed-off-by: Tina Zhang <tina.zhang@intel.com>
---
 drivers/gpu/drm/i915/gvt/scheduler.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c b/drivers/gpu/drm/i915/gvt/scheduler.c
index 8436984cd1f6..4e11cfaf41f0 100644
--- a/drivers/gpu/drm/i915/gvt/scheduler.c
+++ b/drivers/gpu/drm/i915/gvt/scheduler.c
@@ -304,8 +304,8 @@ shadow_context_descriptor_update(struct intel_context *ce,
 	 * Update bits 0-11 of the context descriptor which includes flags
 	 * like GEN8_CTX_* cached in desc_template
 	 */
-	desc &= ~(0x3 << GEN8_CTX_ADDRESSING_MODE_SHIFT);
-	desc |= workload->ctx_desc.addressing_mode <<
+	desc &= ~(0x3ull << GEN8_CTX_ADDRESSING_MODE_SHIFT);
+	desc |= (u64)workload->ctx_desc.addressing_mode <<
 		GEN8_CTX_ADDRESSING_MODE_SHIFT;
 
 	ce->lrc_desc = desc;
-- 
2.17.1

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
