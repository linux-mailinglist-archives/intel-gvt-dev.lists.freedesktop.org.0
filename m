Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F4240CA85
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 15 Sep 2021 18:40:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30B376E98A;
	Wed, 15 Sep 2021 16:40:27 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35DEE6E981;
 Wed, 15 Sep 2021 16:40:25 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id h29so3633453ila.2;
 Wed, 15 Sep 2021 09:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=32C35ge3ezQOxz2E8eNdBMdK5XlIF/wlycoG44DtLks=;
 b=NHRzTsGjmqYJ0+TrGsA231y6qfakrz0259keU2ufrLcLQXFWfCb3hH5rKquFEiINiP
 bmKtByZGcOu4PxQOD9erbmiLpt3DWO0jiL1e/AU7SfqxiyDWFtNZ/wqE9zo4audBErZT
 dQtcn1/lArWDCr9k5xfQ6V7oVAWVv3A8CFqeHt89R6hYolaOzamDmnUs3rmAk2nj0nqJ
 3Agtd7M1pbXHZHY4ivOrDUPc03mMuTAUZTvCU9ABkU0Qml4MiiOMicLkbtfeRjfpGmfR
 HjUC49juGfgonOge98jrYQvzcI57AY8jiBBN+XYgJL0hsxc2CBzwgSRVSsBmZWQjg/0i
 ZHWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=32C35ge3ezQOxz2E8eNdBMdK5XlIF/wlycoG44DtLks=;
 b=4xJ3WdZ6pNo+ovfXirjBUNhuVAJZ9/C2uxywvB1u+WZWzlL58fWgCWZLVLE7rndSJQ
 3wYkO3qQlHOD4lBK4Pi6nZzql/f+X8qgoq7c2qapjNjNll/IfA8yBTtKCUFfluz4fICD
 4C4OY6QQyBe7mLZJpBU2G2bGpgi94aXa8UHZiVwBrXRd5YBZoYuH7p44/9SiJC8ZlV0U
 OGPyFSV+JcqZz4KOeEJewt+HNkFYAyhNaGJoE3Y5+1LmrWkRgcYcE0xyBb9rN8DVVGgN
 VkXn1IYceucMT49O+whhfxRvNFOnU73Gsc0s0I43HkgCxkFrUeSOzXYSHskqYRZl4WZJ
 M7og==
X-Gm-Message-State: AOAM531fxfU+Zr+CYEcrUln3kgKVFrqt6tX2T6WncXTpK+nb68Vshjja
 GlLzg7sknW6LHV6ItOQXao3lM8pRdOk=
X-Google-Smtp-Source: ABdhPJwjz8Uhc6qTIZK5YwNaEF4pcLLq52VckbKKO19iOqGq7l0v3iCphUnCsZwa4VfJTs2/s/HW6A==
X-Received: by 2002:a05:6e02:2183:: with SMTP id
 j3mr700350ila.149.1631724024302; 
 Wed, 15 Sep 2021 09:40:24 -0700 (PDT)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id a5sm299540ilf.27.2021.09.15.09.40.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 09:40:23 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel@ffwll.ch
Cc: Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v8 01/16] dyndbg: add module to a vpr-info in dd-exec-queries
Date: Wed, 15 Sep 2021 10:39:42 -0600
Message-Id: <20210915163957.2949166-2-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210915163957.2949166-1-jim.cromie@gmail.com>
References: <20210915163957.2949166-1-jim.cromie@gmail.com>
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

dd-exec-queries accepts a separate module arg (so it can support
$module.dyndbg cmdline arg), add it to the vpr-info for more context.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index cb5abb42c16a..dfe1e6a857bc 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -529,7 +529,7 @@ static int ddebug_exec_queries(char *query, const char *modname)
 		if (!query || !*query || *query == '#')
 			continue;
 
-		vpr_info("query %d: \"%s\"\n", i, query);
+		v2pr_info("query %d: \"%s\" mod:%s\n", i, query, modname ?: "*");
 
 		rc = ddebug_exec_query(query, modname);
 		if (rc < 0) {
-- 
2.31.1

