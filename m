Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3249717378
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 31 May 2023 04:04:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B66F10E00F;
	Wed, 31 May 2023 02:04:23 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8099D10E00F;
 Wed, 31 May 2023 02:04:21 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2af305114d4so7905371fa.0; 
 Tue, 30 May 2023 19:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685498659; x=1688090659;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=37k0ej9+1DJsU/F422hEk4kk1ec5Zr1jgX4Na+twFKc=;
 b=O+LSQx3OP/UXQH47bh/OAXESZUQJCOworU+gPZxqyWCsjmiJdT64KtGGWAJVob6X1N
 w2PPkGWXZ5jvEJ5IqOuLQDXAb9DU2eDQGeoTNI3Gtzy8uJsyuzPJHqNmyqcl3ICFmb8M
 Hr/xn6fKkZGt3tim1OFaBwVCGN38xi4F8sSCJgD7kPB6d84WGqNESnsGmMHL0OT6rN/x
 udCN849hj8nrd9px3FN9hWQYpz1FEcusY8xx5vtA4dzxv+8FwexgpwBW4vJ0qenTKtsv
 SPsButdl9NU7MT9/MudCxjkE734Qw1P6KrMZJSHsFmAk/6kZ3vS0Af60/16vCu0BYUPM
 QkVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685498659; x=1688090659;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=37k0ej9+1DJsU/F422hEk4kk1ec5Zr1jgX4Na+twFKc=;
 b=lcmXpx10u6LEwKRFGWmWJBNwHGYNqs+yRVA1ARQArnPAJjPE9rFphtwvCL0VVg0TBd
 JJ645xAvYfDUYrHhDYXk7+kqDgL0KkhkOl0QEVUGWLmUPdRiJGICxmj48Rra63o+NZV+
 SOXqF50QgNMz/3IL0DBD9kdvSMfvXbmvtSOLcD7yYbvdTRyDxP5LImz0QySzPHyBwY6s
 BBKfzPfXn0Q0McoUAmkqns4g4sG4FeB9jIetoFNwNQDtGTp6eUAh434tvyu4hA7+tVzL
 Cmy4w5c1j9nyNTb+WzhoO1PqLkAEFgYYpEDYYtijXRAB5C3XH2B1t5hB6HYOa5eAHy/p
 sGng==
X-Gm-Message-State: AC+VfDypAXuorgzTmDTeTuZusd0qtgYoMh/pkrOENvQmdKeK41cxvZeZ
 4Mb03KHJxUMCmeuBQjx9XK22i/Lf4wtOYnO4
X-Google-Smtp-Source: ACHHUZ4V3lBLxlywVQQuto4e0VVw/dFZiEoiF9eaiI3gT+8ACEiGVnyAOXz8i6nVDL7WGvdemiS2+g==
X-Received: by 2002:a05:651c:b9b:b0:2ad:cad5:4b57 with SMTP id
 bg27-20020a05651c0b9b00b002adcad54b57mr1342743ljb.1.1685498658882; 
 Tue, 30 May 2023 19:04:18 -0700 (PDT)
Received: from localhost.localdomain (88-115-161-74.elisa-laajakaista.fi.
 [88.115.161.74]) by smtp.gmail.com with ESMTPSA id
 c10-20020a2e9d8a000000b002af03f75edasm3057470ljj.80.2023.05.30.19.04.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 May 2023 19:04:18 -0700 (PDT)
From: Zhi Wang <zhi.wang.linux@gmail.com>
X-Google-Original-From: Zhi Wang <zhi.a.wang@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH RESEND] drm/i915/gvt: remove unused variable gma_bottom in
 command parser
Date: Wed, 31 May 2023 02:04:11 +0000
Message-Id: <20230531020411.18987-1-zhi.a.wang@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Remove unused variable gma_bottom in scan_workload() and scan_wa_ctx().
commit be1da7070aea ("drm/i915/gvt: vGPU command scanner") introduces
gma_bottom in several functions to calculate the size of the command
buffer. However, some of them are set but actually unused.

When compiling the code with ccflags -Wunused-but-set-variable, gcc
throws warnings.

Remove unused variables to avoid the gcc warnings. Tested via compiling
the code with ccflags -Wunused-but-set-variable.

Fixes: be1da7070aea ("drm/i915/gvt: vGPU command scanner")
Suggested-by: Jani Nikula <jani.nikula@intel.com>
Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: intel-gvt-dev@lists.freedesktop.org
Signed-off-by: Zhi Wang <zhi.a.wang@intel.com>
---
 drivers/gpu/drm/i915/gvt/cmd_parser.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i915/gvt/cmd_parser.c
index 3c4ae1da0d41..05f9348b7a9d 100644
--- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
+++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
@@ -2833,7 +2833,7 @@ static int command_scan(struct parser_exec_state *s,
 
 static int scan_workload(struct intel_vgpu_workload *workload)
 {
-	unsigned long gma_head, gma_tail, gma_bottom;
+	unsigned long gma_head, gma_tail;
 	struct parser_exec_state s;
 	int ret = 0;
 
@@ -2843,7 +2843,6 @@ static int scan_workload(struct intel_vgpu_workload *workload)
 
 	gma_head = workload->rb_start + workload->rb_head;
 	gma_tail = workload->rb_start + workload->rb_tail;
-	gma_bottom = workload->rb_start +  _RING_CTL_BUF_SIZE(workload->rb_ctl);
 
 	s.buf_type = RING_BUFFER_INSTRUCTION;
 	s.buf_addr_type = GTT_BUFFER;
@@ -2874,7 +2873,7 @@ static int scan_workload(struct intel_vgpu_workload *workload)
 static int scan_wa_ctx(struct intel_shadow_wa_ctx *wa_ctx)
 {
 
-	unsigned long gma_head, gma_tail, gma_bottom, ring_size, ring_tail;
+	unsigned long gma_head, gma_tail, ring_size, ring_tail;
 	struct parser_exec_state s;
 	int ret = 0;
 	struct intel_vgpu_workload *workload = container_of(wa_ctx,
@@ -2891,7 +2890,6 @@ static int scan_wa_ctx(struct intel_shadow_wa_ctx *wa_ctx)
 			PAGE_SIZE);
 	gma_head = wa_ctx->indirect_ctx.guest_gma;
 	gma_tail = wa_ctx->indirect_ctx.guest_gma + ring_tail;
-	gma_bottom = wa_ctx->indirect_ctx.guest_gma + ring_size;
 
 	s.buf_type = RING_BUFFER_INSTRUCTION;
 	s.buf_addr_type = GTT_BUFFER;
-- 
2.25.1

