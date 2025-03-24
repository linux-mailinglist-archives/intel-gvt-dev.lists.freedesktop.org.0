Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3163A6D655
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 24 Mar 2025 09:38:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF74010E23F;
	Mon, 24 Mar 2025 08:38:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Gu7lj9X/";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3000E10E238;
 Mon, 24 Mar 2025 08:38:13 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-39ac56756f6so214116f8f.2; 
 Mon, 24 Mar 2025 01:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742805492; x=1743410292; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wo36faXWgJSYin25nWEbPgzyVTPsJ7mvs6BrtN1N+6U=;
 b=Gu7lj9X/W8Yzu6B+qq3SPlXqp/Gv9Zz3sNcCpCtXUC1jOST6D00e/j7t2yAgwE+6VF
 4vyfp90OH/oCDBvbKiHGA58sGza3CGF+Q0GKROqCDN96xihFZPJdj6onuyOVlCzgYw0m
 TrYVE55p0WBv9n3bdmRocRd2kRf8Z0xFPFsadPn94DCUJd2gK0IbixTvWD74EdAW8iYN
 WUzNwDKBt6Vc8gUjFIyrk6MEhi8na2s5GI+tiGcsbyrczHM/3SNAMXduDlxM1VWeukqt
 HEa/8J6+NaFhpwkU2G16tEIHcVlwWOQiWPmEBVNfMZB2A31LbCD+S6mecH46LBTLnvXW
 QAhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742805492; x=1743410292;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wo36faXWgJSYin25nWEbPgzyVTPsJ7mvs6BrtN1N+6U=;
 b=CMX/e5zcJhzAqezNRGW+CCDZx+ybv4KJ3f2ImjOzZsyhWQ/x1eNB0ebyJ9EY8xcOxu
 fVZCnaC43iVSRCYKGhaFh8XtiIYe5WqUThVd3qcsv5ZLx9LVDa9H9dVbpFFFKjWdv9Bi
 1SIQy4OJnGKaXRezcNjqaNf+LsvtJNHhPU4B3wu2EGgCWeeGwA/JrgY32IVGb1H9V8Lw
 U49ymkNLQz/2FnkzGUnzNMJ2/kN+vWl/od9oCl8vcobS7B6bOg2niYVkaQuQljSaJZXq
 /JdS7r8slMe1mzlH+g3N56dhWMIw717dCVcEgzMkDS0kJKoPtsQe+G0uvSbwUbiPBuf3
 ID4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+T+gtouPkiodChwRD05FY1QOrtZV33xV20JMJESqAtUnMuy//tbQqCvYZ41xhFjf+JUqubghzCH8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzlSzA7oxvzc5AkewIn4P9MsPsqsXOCIeF3n8Su47ToGKxrPZu9
 zzy00fmsXjVhvizba3g3TEkhM6qsaQ2zPAeHVnoJjzaEosRccYOd
X-Gm-Gg: ASbGnctulS180uYks2Qw3tda5nL3GisubuZZBqaMSXJAJ2bAQYpWQArMJaqtzM4OM5l
 1LM44RhiPsjCF27PjCYjm0O5c9i9lFjvJ7lVNli+qWu2epsftuEvLMtmlPopuaawAqYezdBUkkU
 69/y/oxWU28f06fsKWhFEoPFhSZ9+CzxS3/Mr511YrSqUMkAD/RXoSIR8ZnIwEzsOAVreU8DaL3
 VVCmkSClSit4HPoctFY9npQ2EqMh4y6GECApPWyh94Rv12u8Gn+Hj64jPt9QDROvN4TyXGBBYxw
 vfOqQ6RszZmArfZFTta84ub8Q3BYLEGRbH7ipp91U+X/PXEiy0b6cNvDPNVeCA==
X-Google-Smtp-Source: AGHT+IEw5mdv8FL358skMxjisWjCdC/BAuRG+DyLB91/bT3eZDVOOe8LXI3JZNkgSPKO2RFD6mg2Nw==
X-Received: by 2002:a05:6000:2810:b0:390:e1e0:1300 with SMTP id
 ffacd0b85a97d-3997f91d048mr7465614f8f.33.1742805491464; 
 Mon, 24 Mar 2025 01:38:11 -0700 (PDT)
Received: from arrakis.kwizart.net (home.kwizart.net. [82.65.38.83])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9b3c2csm10078670f8f.46.2025.03.24.01.38.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Mar 2025 01:38:10 -0700 (PDT)
From: Nicolas Chauvet <kwizart@gmail.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.wang.linux@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Cc: intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Nicolas Chauvet <kwizart@gmail.com>, stable@vger.kernel.org
Subject: [PATCH 3/3] [RFC] drm/i915/gvt: change OPREGION_SIGNATURE name
Date: Mon, 24 Mar 2025 09:30:03 +0100
Message-ID: <20250324083755.12489-4-kwizart@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250324083755.12489-1-kwizart@gmail.com>
References: <20250324083755.12489-1-kwizart@gmail.com>
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

Change the OPREGION_SIGNATURE name so it fit into the
opregion_header->signature size.

Cc: stable@vger.kernel.org
Fixes: 93615d59912 ("Revert drm/i915/gvt: Fix out-of-bounds buffer write into opregion->signature[]")
Signed-off-by: Nicolas Chauvet <kwizart@gmail.com>
---
 drivers/gpu/drm/i915/gvt/opregion.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/opregion.c b/drivers/gpu/drm/i915/gvt/opregion.c
index 0f11cd6ba383..0bd02dfaceb1 100644
--- a/drivers/gpu/drm/i915/gvt/opregion.c
+++ b/drivers/gpu/drm/i915/gvt/opregion.c
@@ -32,7 +32,7 @@
 #define _INTEL_BIOS_PRIVATE
 #include "display/intel_vbt_defs.h"
 
-#define OPREGION_SIGNATURE "IntelGraphicsMem"
+#define OPREGION_SIGNATURE "IntelGFXMem"
 #define MBOX_VBT      (1<<3)
 
 /* device handle */
-- 
2.49.0

