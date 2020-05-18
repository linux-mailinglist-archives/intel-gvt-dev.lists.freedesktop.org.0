Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EDD01D7C45
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 18 May 2020 17:03:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3A9F6E422;
	Mon, 18 May 2020 15:03:52 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06F4B6E422;
 Mon, 18 May 2020 15:03:51 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id g11so4347684plp.1;
 Mon, 18 May 2020 08:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=WgmxNih5o7lZXHfbWl9I3AtHRbIULLMSDkl7rFCTknE=;
 b=s37biS52LBSY4wjTk2uU75fo73grJe1Bprmn0WzYTdY+9jDKJUKnntDV2RhFYAu/Sw
 IYtmt4gYUF7Wc2sC3ZWKv8Qjq7ij33/F0YhqVmq2J24OAEZ3GnVJ/PNVvwCUzyvGSnQE
 6h4tj2fhO7alMmc/2bNlGXAyKFeUmFtYmltJOhp3qJ/yfcQUKXASbXIYGGzwCwGPqTva
 7DemjyYkUBCQJwHxoy7eVVIGcG9Xbi4aA0tUc+raEElr8dprKQLZ092YUuAXWckSMf+h
 r82jJexcn2WUIz4Q7f63qmWoeU8VMFzVgrG+QmJCLRpI4J42vjz6jzmFmDLDbkOrINZd
 DiXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=WgmxNih5o7lZXHfbWl9I3AtHRbIULLMSDkl7rFCTknE=;
 b=Yq/I7mz+B0sP+pKMLykQhuS7o2FdyXXbDrLSACZSV9+Is9X03r7QnZkZeF3TJQgm74
 Ra04H1wAHV70BqU/YoolBm5ItPru+PDZFltUPzVRRH0b7aE192m70DEN3K/92CM0ZZs5
 Soxlhff3fmtR3WpnZfwXiIpPE6REiGs5kGIDHulnN3pQ/QHg56QkH9Yv4uJLORJsnKrZ
 qrR1j05UfhACv5f9OjQvAcNXxkKnidQr6wC90vFWKG0eb1T+yDSYa+y91wq3hIf2z2Bg
 5aEZLP8YnCHSb4LaZuhzo9GcmkBbUEAUge0zZor7iWr/9kMfrOI0mSYnya//4V6qz6zW
 F4zQ==
X-Gm-Message-State: AOAM531Acog5SbdmjhkVN5Stdj1Gh7/mJaj4DcHg5jUIyPMEyGDB2V4E
 2JVIX421651iB7mgG9qEJYk=
X-Google-Smtp-Source: ABdhPJy1il1HPxFZ4CMIw6qSCNCAYzwkanG2+QXgzJ9xj6UUukyerk2v7SMZyIwnlULbjAtJNpz1Vg==
X-Received: by 2002:a17:902:7682:: with SMTP id
 m2mr10535509pll.281.1589814230632; 
 Mon, 18 May 2020 08:03:50 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:418:e389:dd54:a815:71b4:fdc])
 by smtp.gmail.com with ESMTPSA id
 7sm6329586pfc.203.2020.05.18.08.03.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 08:03:49 -0700 (PDT)
From: Aishwarya Ramakrishnan <aishwaryarj100@gmail.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/i915/gvt: Use ARRAY_SIZE for vgpu_types
Date: Mon, 18 May 2020 20:33:36 +0530
Message-Id: <20200518150336.15265-1-aishwaryarj100@gmail.com>
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
Cc: aishwaryarj100@gmail.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Prefer ARRAY_SIZE instead of using sizeof

Fixes coccicheck warning: Use ARRAY_SIZE

Signed-off-by: Aishwarya Ramakrishnan <aishwaryarj100@gmail.com>
---
 drivers/gpu/drm/i915/gvt/vgpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/vgpu.c b/drivers/gpu/drm/i915/gvt/vgpu.c
index 1d5ff88078bd..7d361623ff67 100644
--- a/drivers/gpu/drm/i915/gvt/vgpu.c
+++ b/drivers/gpu/drm/i915/gvt/vgpu.c
@@ -124,7 +124,7 @@ int intel_gvt_init_vgpu_types(struct intel_gvt *gvt)
 	 */
 	low_avail = gvt_aperture_sz(gvt) - HOST_LOW_GM_SIZE;
 	high_avail = gvt_hidden_sz(gvt) - HOST_HIGH_GM_SIZE;
-	num_types = sizeof(vgpu_types) / sizeof(vgpu_types[0]);
+	num_types = ARRAY_SIZE(vgpu_types);
 
 	gvt->types = kcalloc(num_types, sizeof(struct intel_vgpu_type),
 			     GFP_KERNEL);
-- 
2.17.1

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
