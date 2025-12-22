Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD23BCD4FC0
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 22 Dec 2025 09:23:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A011610E568;
	Mon, 22 Dec 2025 08:23:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Brjw5unT";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A30E10E568
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 22 Dec 2025 08:23:00 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-7acd9a03ba9so3969010b3a.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 22 Dec 2025 00:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766391779; x=1766996579; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Elt5R/CoR9iQcckLm+LWmPbMBH4lmPXk70cWipXnli0=;
 b=Brjw5unTzSHDsmO8miQo7SuVGXWhpnHe8uK4Llhf4P+Ah/vxasi986m80Ij17e909g
 YLiLZI6m0xYGqQ+oI6fum0WYyYFjbxaVdMBVB+bxjg+hmL3e5+zYnF5SONQsYkDZ1rP9
 5z5089WXBijkuVrQh6wSPE+QzPXIuSEO8vboUiqDANJERjspRYm9D/aWiBPdQfyUCnDh
 BdeCHPrr1gPePOudj8l4PlgNTKoC3/SLqzN+HZoZe46+m01I3VJtnXO7G6li6hYpLGp6
 RRLHedrd1c5kySrAK3lh8XI6kZaLgztsoGmB4i3ITo9l8GHS3MUFanCCCFdtmBFF+HlM
 T3Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766391779; x=1766996579;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Elt5R/CoR9iQcckLm+LWmPbMBH4lmPXk70cWipXnli0=;
 b=wM2Wp91NqOSSjT7ghEAYnz1kfhJm+itcllIyqs8aDBBbST5Eg8BFa5RHwUQ60HDKW3
 canKNyQPb3cq14dvcFvrEYPzRfUw0O/YPJCHANNcFy18XxONDiZuhByre6eXeDPoiMEd
 qouJuwWn3xci2D3rLotGAQf5R7r/TmVo9y6S6MgC86CoY0exav9NHxdTolUyVmk8DwFJ
 k5dfh+zdyYdkH2LX+4A3E7zXFYejR63s4j3/bs9RDOanwRSkcdFqLvbuLGwibFgFvMps
 U4VmMB6BmXqpNh5/2OPf4XsT7uhWC0mP52rES7uCy47VJI9rU2PI/zq/LKxAt/zJGDYM
 SKCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLpoLO5UrjuZBlL8KezUYGZSi1rbyu1i2YmLt6HxNLSnLz7eSgw4XeIzw61XHI2QWVH/xkGqSQzUtRVKNy@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyvmNOBdhwIqKlksGLvvn8k/eWmXrqSKWZplaqfKwHHksRmycMf
 vMd2ZSCaSB3mfFS4SmB0nl1tHKvwz+ZUm72/89hIZOjZlXMPyH9d6uCW
X-Gm-Gg: AY/fxX6eMdZQQYOSAfFDAKkjbRyYnzFmTDJwGSNX2NHaQ8A5+McjuOEDW8S7PQqGXC5
 1M503b5D2QYkzuFJqED7VLWHRRehz9MOYh6Ffvn5+ThdqYUafXKRYMNB/Yf6976vytPLtcwWSdA
 4BXzoa2dgSdYjIPDRbZqlL5yqXg0kH8zm0c6J8oP5V3VIOBiSZn4N9wLW2os5327eR0Fful8g33
 Z+R+DmWQ3uZssXOL3u//D4632A2AycWZ+xuo2RMW1tGmdaCKOECyX3R65NQXbnod/ng/QSG3PfA
 qtaGR6h5L5WDzwdyTCeJL/hz3Bjumm3Eu4636iykz8O7G7wLSdkZ663QOclDEwxSUgYWlH1fORZ
 61Pnu30V4gFK7EPtQJKNR9AU5i3QhJSrwfyYhZjIZag7hO5v44imfSjjddDcCTZpmEZ6ty5x/Lp
 rOVJSJfHpuZCe6nNmC/FY=
X-Google-Smtp-Source: AGHT+IGPhjVEd8hFCFWSuzrJ6/8E9Tcr4jw08Ck32qa0ZVNPKd3V6Hm2f6vkNyl5Idf/bQen/LCS2Q==
X-Received: by 2002:a05:6a00:b902:b0:7a1:49f7:ad04 with SMTP id
 d2e1a72fcca58-7ff642154b6mr9938622b3a.14.1766391779554; 
 Mon, 22 Dec 2025 00:22:59 -0800 (PST)
Received: from frodo ([2404:4400:417e:3d00:8b90:7f55:1261:772f])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-7ff7e493123sm9540699b3a.50.2025.12.22.00.22.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Dec 2025 00:22:58 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org, louis.chauvet@bootlin.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 seanpaul@chromium.org, robdclark@gmail.com, groeck@google.com,
 yanivt@google.com, bleung@google.com, quic_saipraka@quicinc.com,
 will@kernel.org, catalin.marinas@arm.com, quic_psodagud@quicinc.com,
 maz@kernel.org, arnd@arndb.de, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, mingo@redhat.com, jim.cromie@gmail.com
Subject: [PATCH v7 09/31] dyndbg: tweak pr_fmt to avoid expansion conflicts
Date: Mon, 22 Dec 2025 21:20:26 +1300
Message-ID: <20251222082049.1782440-10-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251222082049.1782440-3-jim.cromie@gmail.com>
References: <20251222082049.1782440-3-jim.cromie@gmail.com>
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

Disambiguate pr_fmt(fmt) arg, by changing it to _FMT_, to avoid naming
confusion with many later macros also using that argname.

no functional change

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index d2ff203d0873..21c1db7e8705 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -11,7 +11,7 @@
  * Copyright (C) 2013 Du, Changbin <changbin.du@gmail.com>
  */
 
-#define pr_fmt(fmt) "dyndbg: " fmt
+#define pr_fmt(_FMT_) "dyndbg: " _FMT_
 
 #include <linux/kernel.h>
 #include <linux/module.h>
-- 
2.52.0

