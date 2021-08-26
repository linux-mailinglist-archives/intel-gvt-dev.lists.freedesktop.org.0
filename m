Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1073F8A3B
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 26 Aug 2021 16:38:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E5C989D7F;
	Thu, 26 Aug 2021 14:38:39 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3814A89D7F
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 26 Aug 2021 14:38:38 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id i28so5545112ljm.7
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 26 Aug 2021 07:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Vh/zNpzg9E+1VDLABSaxgI+0bzfYF05fxMUcPBZBbvM=;
 b=OaKId6IXRXK10ro9Gm9ds3d2RY27h/GHSVlLphJaPRYGJPE37/1t31t+5vPCT5Waaq
 8YYaUdDq6NFHY1Saz3YBQ+7p8bkkSCoPREABvVVulboXU3Lg9Xpyf6+GZ7ENbyxEehkP
 hQ3VTho3CSLSUEkGHw7Ef5mYcLQ1FAamx1JXONNqkgytRcXT2IeNFkb0UfFUXC8o0ZoC
 hVBJWBFRt8xiC2lYLHx/pxcviZPotaCL5x5DBQFTJhGdxID2tM0O3VeymlJXeZgQO7Ox
 ti3P1Du3vIkTWNoIFYlj9InkhtnlIofgRVHroKmrQqeAdsSHoSQ6ZqkQAMQDiR+B4tCj
 EYTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Vh/zNpzg9E+1VDLABSaxgI+0bzfYF05fxMUcPBZBbvM=;
 b=ouJyr/lSTQJlYIYSvTM2myKuy2aT3ml1swewlis5HBEJdF95Ff6kWXFZne7FscK1cr
 8RFQzSPDt+GUb4n2C70oIadhVoDeDb38YWXbMj4hTL7X4S1TswlJJoqRtaKOtx/SKbM8
 qXcvptYFHL8s97il2E4MsnZh+k5w69rFZVrcP/UTlL34NJEPMxIwxuMrb1M1gWKyrsRS
 h855tdSaI6tsPY3mdjS7/avNus8YP/pBlaXQcyOEphVU8FU+8WzWmj+rKFP908ZLZijO
 Z98MLPLkqR2YR/gVxF3AYuWLX6M03Kiq+6fKQMwnLxtPn+Vv7JFK/vIkK78hNLLv3Uls
 cyGg==
X-Gm-Message-State: AOAM532opByRxCFi1cvdfF5cL1XOPVw2uVmP8NTNRfgZbpH4Q2CbTEi9
 MkX5n8K9dLjnBBNr3OPLXTGnmE7sddZ0oQ==
X-Google-Smtp-Source: ABdhPJwnZ2LOI6Hp2h+UclqgISRC9EwklhmTKI81XQxJuKQHM0VRYcsncu1R3ypPBFh8Y8ubvDsxfg==
X-Received: by 2002:a2e:a367:: with SMTP id i7mr3402898ljn.244.1629988716324; 
 Thu, 26 Aug 2021 07:38:36 -0700 (PDT)
Received: from localhost.localdomain (88-115-160-70.elisa-laajakaista.fi.
 [88.115.160.70])
 by smtp.gmail.com with ESMTPSA id g25sm336815lfv.62.2021.08.26.07.38.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 07:38:35 -0700 (PDT)
From: Zhi A Wang <zhi.wang.linux2@gmail.com>
X-Google-Original-From: Zhi A Wang <zhi.a.wang@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Cc: Zhi A Wang <zhi.a.wang@intel.com>,
	Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: [PATCH] drm/i915/gvt: fix the usage of ww lock in gvt scheduler.
Date: Thu, 26 Aug 2021 14:38:34 +0000
Message-Id: <20210826143834.25410-1-zhi.a.wang@intel.com>
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
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

As the APIs related to ww lock in i915 was changed recently, the usage of
ww lock in GVT-g scheduler needs to be changed accrodingly. We noticed a
deadlock when GVT-g scheduler submits the workload to i915. After some
investigation, it seems the way of how to use ww lock APIs has been
changed. Releasing a ww now requires a explict i915_gem_ww_ctx_fini().

Fixes: 67f1120381df ("drm/i915/gvt: Introduce per object locking in GVT scheduler.")
Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
Signed-off-by: Zhi A Wang <zhi.a.wang@intel.com>
---
 drivers/gpu/drm/i915/gvt/scheduler.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c b/drivers/gpu/drm/i915/gvt/scheduler.c
index 9578e57db4c2..43fedfe9639a 100644
--- a/drivers/gpu/drm/i915/gvt/scheduler.c
+++ b/drivers/gpu/drm/i915/gvt/scheduler.c
@@ -576,7 +576,7 @@ static int prepare_shadow_batch_buffer(struct intel_vgpu_workload *workload)
 
 			/* No one is going to touch shadow bb from now on. */
 			i915_gem_object_flush_map(bb->obj);
-			i915_gem_object_unlock(bb->obj);
+			i915_gem_ww_ctx_fini(&ww);
 		}
 	}
 	return 0;
@@ -630,7 +630,7 @@ static int prepare_shadow_wa_ctx(struct intel_shadow_wa_ctx *wa_ctx)
 		return ret;
 	}
 
-	i915_gem_object_unlock(wa_ctx->indirect_ctx.obj);
+	i915_gem_ww_ctx_fini(&ww);
 
 	/* FIXME: we are not tracking our pinned VMA leaving it
 	 * up to the core to fix up the stray pin_count upon
-- 
2.25.1

