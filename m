Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B032BCA738
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 09 Oct 2025 19:58:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 561A510EACB;
	Thu,  9 Oct 2025 17:58:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="f5aeN0Nh";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
 [209.85.166.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A3FB10EADC
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  9 Oct 2025 17:58:55 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id
 ca18e2360f4ac-90926724bceso112603339f.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 09 Oct 2025 10:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760032734; x=1760637534; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pU2dh1AcXNpIKiB0LgzN/RHkM4liyYcW5Vvv24TZfyg=;
 b=f5aeN0NhO9k3xDakgGg4s6SDBZtldx7Df2GD+RkXJrDR8jy9nwele2/aj3LRRCXVmm
 Szndy2dVazeQgHhPG338Vd+JKHbcOcy93lZIy8lq4S1xtqSzMWCiffKSjhoCU79FW4ok
 Y4Tv7JyPWGFrLdIkeuRS9bJFAYSoROnx2gNEXboe19zK7XM58tUYFyh3Zo8veWxJrofI
 AawR8CmGuLqfbf11OysWhzW5bSNvDWjzE+9yNXidX3jxMw/R4xDmNMFnR/K1oVB60l7S
 EEYCeWvXkIOveY/r7LtQQmJc/Lonn1Gru6Afel5vmqCWQJpXn5vsSxRFg6uT0LdloDIZ
 Ht+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760032734; x=1760637534;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pU2dh1AcXNpIKiB0LgzN/RHkM4liyYcW5Vvv24TZfyg=;
 b=l5EOwm+CBthN10AGHVEBDBAnh7hNBfMCMJIxBSt/Xybyuhe/FRGN5z+brsFKicYH/J
 gHuwDPxCmMxQlsaNB/pENjh3ByQfI6ESNLwp4JDg5DwFKqxf+UYndU6SRnFCjaLb3aTw
 PVgrIh/4g7y6a0YtHKG+ypKAs/dw0vTGpsKRcBnNtjQO7LmGfOsaKwgB3i9X3dSOlyCR
 BZQ7W9aNg4vxhCzomyaxNjS1y4+WCdp0nW7R4qE4z/C2Joh+P6AhMHQUhuO3TGRbRHMT
 A+c8qZZMV7UaqgJFrrgWo3NPuBWakuPrpMCN/Rh653KFbgPXYZU2T9XMQ8vold4YfinF
 pkUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVx3Xg6Q0abdpveNVF+8t6ZkaOe+r+CS2BOiXcbWWE8JviXOc1Qtm2Q0xW3QrUnivxdIYCW6GM3SDQrsA4O@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwIfL3poXShxFX+JMrQuBpQ09jpJLV7iyF+nOzaJm3C7ND3CEw7
 AOiy6rz3e0twFmgXSpdwmlmiJ7INuJJGqenjxSezNLiiFpuh8EEFmadS
X-Gm-Gg: ASbGncstJ//AUVhFQDgP7s6eoILuYvu5ioEaNzZnNZJbu5NV5HxXkKNei9bi0vQz1Gm
 4lD3T1qyknwhhmwtcorDyxFk9VpQuhndzy8aBVxS0QZxPIBSAUjz86luWGU2GpM1n5C0MnWIqJu
 PSeq+YND2UQsJOgRwvWyhx25LZkUamxLBXQObURns0ziJAwSdF0f6Ftb/g7iw3/YrE9Tr70LB5W
 22I3Flqs/mxA4QXKu1p5DGMdWFFBkZr5CgO35MBDTOQJee1GVDavmEYbvWTMVOzs23BXvK0+XwQ
 wYvO5xPSzpZICaMk/eL9lJuzUtmVltyUqdJk79QtBzT1gJdYXkDaV9ghT3zumzJXyegLELGF1R4
 9O0SC7GQxXhF8SX3aC0nfsAIPyS6fs011bFw6bzVFOUAEvmX9aW8Tux1AaHpl8a5ZBQCk0DDwv6
 9kOjvZnBHOILLet29ATHGazPQkrfLiG7QFF4cF+g==
X-Google-Smtp-Source: AGHT+IGG3nRCWoDD4V/nkCQ4bWDSLxtN1n0qdt7xwh20BiNzOL9cD9tMw7g0yxq5IwKvmpy6qvXj6A==
X-Received: by 2002:a05:6e02:270a:b0:425:951f:52fa with SMTP id
 e9e14a558f8ab-42f87376e77mr84960835ab.14.1760032734175; 
 Thu, 09 Oct 2025 10:58:54 -0700 (PDT)
Received: from godzilla.raven-morpho.ts.net
 (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-58f7200c4afsm30256173.35.2025.10.09.10.58.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 10:58:53 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com
Cc: gregkh@linuxfoundation.org, ukaszb@chromium.org, louis.chauvet@bootlin.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v5 07/30] dyndbg: tweak pr_fmt to avoid expansion conflicts
Date: Thu,  9 Oct 2025 11:58:11 -0600
Message-ID: <20251009175834.1024308-8-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251009175834.1024308-1-jim.cromie@gmail.com>
References: <20251009175834.1024308-1-jim.cromie@gmail.com>
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

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 55df35df093b..2751056a5240 100644
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
2.51.0

