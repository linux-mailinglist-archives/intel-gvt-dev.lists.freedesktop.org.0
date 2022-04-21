Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A59509EFE
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 21 Apr 2022 13:51:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75C3310E937;
	Thu, 21 Apr 2022 11:51:44 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1102B10E8AB
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 21 Apr 2022 11:51:43 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id g19so8264964lfv.2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 21 Apr 2022 04:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=Jcb+pa04Ecfoa7lH2lG7Bl4kxr3kZIzfaziLYBjSAhE=;
 b=fXMV7+9l7SA4r2W1MGF0SWsd/C8IZ5Sjse9uNDrOPwNawr201aTjz6TaYdawDdRSY+
 sdp+ilI3zGsdZTbytCKbKuN9xjDVJDB0rJKmJbs4Or9XTMmQ6b6njqIx4TA7V2aw2+fe
 2EWAfiRQEXN52KOJKcJkGiyUpgzGjaT9F3pdB+NMlh4jL4wAXRGI2yYV7Hl8noyvry1i
 Xtyw/0FFYrOkO9DGpKPmOw+ZUPfUfgZ2AaVrh5iFnEfhBY3jrg14zPTFLbehT/ySsZ6X
 SiY4w8mpOYz8ObE1IFTAkcYVCu7cr9X/FxjAa4nLgGaxOSemrIiBPNLsp9598qukCmGk
 6xzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Jcb+pa04Ecfoa7lH2lG7Bl4kxr3kZIzfaziLYBjSAhE=;
 b=ZDGwQCIVlvHD2r35Dl5RQ+DfJp4lfc3pWMQAv9a+ZaYQ0ii0AmAWXV2tzVLrm59hRz
 x8nb7jhwoQ2FPAqVj3A+nPwEsMCnFfJRpTMdFYYW9WmUlAndOoT4x0cfDRxxRptaAuQF
 9MUwj029K7j0MlRBjKJaHuqMkEVDFtiH4b8WkQttlyx2LqOTZX1QcsI4nTstPTLcpxm2
 7fYJyXiPMnVeBVfF8NZWtFSvkl0AmAspz9ndAdofg6JfHsv8NUCy1Fx5fsPUzduWRueU
 fHqOXjQumi/HQwHOyK5yARpdeDgdWVtnv4dj9TozxhyxrduRwJVL7jmU4xxJ5KAcAWNp
 3XhA==
X-Gm-Message-State: AOAM532g5RVKH2mR4IPAcGCONuOZDuidBGQYSAVcbmLpVlfoH911jRsv
 MGJuGInc0cZzIsX4DSqNiZQQhYrP0iA=
X-Google-Smtp-Source: ABdhPJymaJNiG/F2IdIgFQm0R7qfd3NdU0UcYoeMRGyS57TkgZ4JhYvs5W2M9HeGUIAW27zObkwKbA==
X-Received: by 2002:a05:6512:108b:b0:471:c321:102e with SMTP id
 j11-20020a056512108b00b00471c321102emr3521182lfg.463.1650541900947; 
 Thu, 21 Apr 2022 04:51:40 -0700 (PDT)
Received: from zhiwang1-mobl.lan (88-115-161-74.elisa-laajakaista.fi.
 [88.115.161.74]) by smtp.gmail.com with ESMTPSA id
 e5-20020ac25ca5000000b004705dbcc329sm1700799lfq.222.2022.04.21.04.51.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 04:51:40 -0700 (PDT)
From: Zhi Wang <zhi.wang.linux@gmail.com>
X-Google-Original-From: Zhi Wang <zhi.a.wang@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH] drm/i915/gvt: add the missing header back for drm-intel-next
Date: Thu, 21 Apr 2022 07:51:33 -0400
Message-Id: <20220421115133.8052-1-zhi.a.wang@intel.com>
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
Cc: Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Add the missing header back for the pull request for drm-intel-next. The
patches of GVT-g re-factor will go through both i915 and vfio. As the
header of DMC registers has been moved in the latest drm-intel-next,
the patch is required for compiling.

Signed-off-by: Zhi Wang <zhi.a.wang@intel.com>
---
 drivers/gpu/drm/i915/intel_gvt_mmio_table.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/intel_gvt_mmio_table.c b/drivers/gpu/drm/i915/intel_gvt_mmio_table.c
index 03a7fcd0f904..a8edb3f317f3 100644
--- a/drivers/gpu/drm/i915/intel_gvt_mmio_table.c
+++ b/drivers/gpu/drm/i915/intel_gvt_mmio_table.c
@@ -4,6 +4,7 @@
  */
 
 #include "display/vlv_dsi_pll_regs.h"
+#include "display/intel_dmc_regs.h"
 #include "gt/intel_gt_regs.h"
 #include "gvt/gvt.h"
 #include "i915_drv.h"
-- 
2.17.1

