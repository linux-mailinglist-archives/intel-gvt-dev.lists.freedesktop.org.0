Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6585AC778
	for <lists+intel-gvt-dev@lfdr.de>; Sun,  4 Sep 2022 23:47:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 044F110E63F;
	Sun,  4 Sep 2022 21:43:57 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C86A810E1C4;
 Sun,  4 Sep 2022 21:42:43 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id s11so3868244ilt.7;
 Sun, 04 Sep 2022 14:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=TAwV35ZWZLIKqOElwfkhFfIbRXseVOLIKBiUUUQjUVQ=;
 b=YQSF24Us+VgO6MmkwBVVohgShZMcax7Tlk2S3GvdeKpX8+kDOiSv3UtwHdryBa/MfZ
 MVJvIEFu2ceZYdrJvC7LCgaG6cEGWWOo9rPDcMnnD+bMW23GiPRN5wZw8EBRiwT0rE4D
 tyIORau8tjxdkTvurYsJa1KKbPC7Xw24bYyvtnAHFUTaVJyVUi4XMOenzHqGO8vAeZLz
 IykguT8g4g+lANiwbVQH2BC/Z9FWb7/vEYDvWbQ9K6c9NLNB3P6ZPkHEEo1aJnLu/3DP
 so/ytamyrgwlaVUiFuKwgSUCvGgReaF3szmlQpVggMMm6ySVIhuDBYvRb9VRu2wy021f
 mxrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=TAwV35ZWZLIKqOElwfkhFfIbRXseVOLIKBiUUUQjUVQ=;
 b=GXnssqtqRnAF3GHkQWsyxXYaHG2kQ5OPiCWi7qXYHs9ADMxQkstc63Gpl6ksN4vDRU
 C3nMqV5EyeyM9azu4GyXVPdSTHYcrXskwy5+1vubqWxkc9grOC0LDoqFgZ9ePUb2gIhY
 yulCTtOQXQ62weE6LoxgqSKhih1JbvXQI9WS9DMsx/R/ZNpgaR1d0BNGdDRpi2XmR4xS
 TUTaaD1xCad9WIgtoSvVqYFkOwiJdus/zisB7mzcciLOPQy1GkqMSmRGFBlrwi3rJtM4
 ZZ/4K+LfWntWb6mpUXaVO0RdUpsw03Lyhe0b0gAUkHcS4n/9yg/CXGoqjQftynEAjlCW
 3Wxg==
X-Gm-Message-State: ACgBeo0xyQL6wrWRIKpox+rDp6Y5ETJWt40kRX7q1cpiCojJcut805Jq
 fla9S2MK1fz0gNVekuKBoo4=
X-Google-Smtp-Source: AA6agR5dlZ+2mbjYaiVo07B1ri+ETbudxxDzknKKyObWsKY9ZVDTd1RmO8d48xns2r12tpVnSs9bbw==
X-Received: by 2002:a05:6e02:12ed:b0:2eb:753e:cfb with SMTP id
 l13-20020a056e0212ed00b002eb753e0cfbmr12322927iln.14.1662327763512; 
 Sun, 04 Sep 2022 14:42:43 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e12-20020a056602044c00b006889ea7be7bsm3727688iov.29.2022.09.04.14.42.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 14:42:43 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 35/57] dyndbg: add _DPRINTK_FLAGS_TRACE
Date: Sun,  4 Sep 2022 15:41:12 -0600
Message-Id: <20220904214134.408619-36-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220904214134.408619-1-jim.cromie@gmail.com>
References: <20220904214134.408619-1-jim.cromie@gmail.com>
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
Cc: Jim Cromie <jim.cromie@gmail.com>, daniel.vetter@ffwll.ch,
 vincent.whitchurch@axis.com, linux@rasmusvillemoes.dk, robdclark@gmail.com,
 seanpaul@chromium.org, joe@perches.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

add new flag, and OR it into _DPRINTK_FLAGS_ENABLED definition

CC: vincent.whitchurch@axis.com
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index ecd3379090c4..04f49df308a7 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -42,7 +42,9 @@ struct _ddebug {
 	(_DPRINTK_FLAGS_INCL_MODNAME | _DPRINTK_FLAGS_INCL_FUNCNAME |\
 	 _DPRINTK_FLAGS_INCL_LINENO  | _DPRINTK_FLAGS_INCL_TID)
 
-#define _DPRINTK_FLAGS_ENABLED		_DPRINTK_FLAGS_PRINTK
+#define _DPRINTK_FLAGS_TRACE		(1 << 5)
+#define _DPRINTK_FLAGS_ENABLED		(_DPRINTK_FLAGS_PRINTK | \
+					 _DPRINTK_FLAGS_TRACE)
 
 #if defined DEBUG
 #define _DPRINTK_FLAGS_DEFAULT _DPRINTK_FLAGS_PRINTK
-- 
2.37.2

