Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD106299D1
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 15 Nov 2022 14:15:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EB0910E3C9;
	Tue, 15 Nov 2022 13:15:30 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A46510E3C9;
 Tue, 15 Nov 2022 13:15:27 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id v1so24161993wrt.11;
 Tue, 15 Nov 2022 05:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:date:from
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BpTzxdWsroir2TADvB2KmE3YUOWbZr2+gw3f997fLWU=;
 b=BjLiVXO7rPktmnSloyRKTw89zsyRc5anlyi048AL4TGTWqxNniSQ37AEJeUepJn0Yw
 EhjRgv63DQ7cbxUwuBYEtIx3QB3K4eKUzv5etumcyRsk/bvD0XV+d/TMGGnnlfsNELhu
 c7OE4+ZTWZ+FyTR7EcyCefuYxpA3IrYFomJgHxTKwPchU6jyKfz8dBUKA7/N08Vpu0Fc
 cmOQ712jeOOpm552+TpNEoSxuM9HjeLd0jzFSAFuKW8jaUhW/GhEd2OroqCWhWihKO7r
 LZ9sTUxH3fddWBFDn5+P3yL0kxcUStBblGtCfrg9Mot2t9k4IjnhkVaXfz0fnpIqHwEr
 pBrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:date:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BpTzxdWsroir2TADvB2KmE3YUOWbZr2+gw3f997fLWU=;
 b=zy19l3v8Rt0VMBOHVNj/AeCSBeqLTiWv5rMZkrq7zTBUc6Q7U8Miiyn9ra2l9aK84h
 TBUwlVZkSv4Oy/7csEbAg/x7+L4b6HD4qCj0wfb8ukT9OktwEwOhO/4bCrEE4AQCC1BT
 i9b9ZOIv9He9A2BFFsfOGe6s0b0v+pvwS2GMdjMto1ERYkxs8LxWr5yFnPBAy5AeFkCo
 qwn5HCHTaUJBKGbDtCx6HIHRpmlYUnrF7dvU1aXHTFD1Ihr+mehfg5g/20gfexcLxHJG
 Jc/5am4Uj4DDE55bemk//FubRC24tixTFej9+o9KV9YBy2fEcqXVwPBjlKkb5e2oEA2t
 Kz/g==
X-Gm-Message-State: ANoB5pnWtzimf035VRTveiD8lxUy+PrDzKmVVaND1xdMe6fk4asBv+/u
 XbwWPx+IZl4875RRJJG1yAA=
X-Google-Smtp-Source: AA0mqf6641Vr9iKo+3ShhVapAT9C337vfupiTOE6HjInAzOEWYmrGA516RzG9nwcUO+nT1JHJ8C47Q==
X-Received: by 2002:adf:e3c7:0:b0:241:94bc:2796 with SMTP id
 k7-20020adfe3c7000000b0024194bc2796mr4343422wrm.184.1668518125454; 
 Tue, 15 Nov 2022 05:15:25 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 o3-20020a5d58c3000000b00241727795c4sm14123577wrf.63.2022.11.15.05.15.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 05:15:24 -0800 (PST)
From: Dan Carpenter <error27@gmail.com>
X-Google-Original-From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 15 Nov 2022 16:15:18 +0300
To: Zhenyu Wang <zhenyuw@linux.intel.com>, Colin Xu <colin.xu@intel.com>
Subject: [PATCH] drm/i915: unpin on error in intel_vgpu_shadow_mm_pin()
Message-ID: <Y3OQ5tgZIVxyQ/WV@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 kernel-janitors@vger.kernel.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@gmail.com>, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Call intel_vgpu_unpin_mm() on this error path.

Fixes: 418741480809 ("drm/i915/gvt: Adding ppgtt to GVT GEM context after shadow pdps settled.")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/i915/gvt/scheduler.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c b/drivers/gpu/drm/i915/gvt/scheduler.c
index d6fe94cd0fdb..8342d95f56cb 100644
--- a/drivers/gpu/drm/i915/gvt/scheduler.c
+++ b/drivers/gpu/drm/i915/gvt/scheduler.c
@@ -696,6 +696,7 @@ intel_vgpu_shadow_mm_pin(struct intel_vgpu_workload *workload)
 
 	if (workload->shadow_mm->type != INTEL_GVT_MM_PPGTT ||
 	    !workload->shadow_mm->ppgtt_mm.shadowed) {
+		intel_vgpu_unpin_mm(workload->shadow_mm);
 		gvt_vgpu_err("workload shadow ppgtt isn't ready\n");
 		return -EINVAL;
 	}
-- 
2.35.1

