Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C997C7A34
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 13 Oct 2023 01:05:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1335910E580;
	Thu, 12 Oct 2023 23:05:01 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73EE610E580;
 Thu, 12 Oct 2023 23:04:57 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-690f8e63777so363727b3a.0; 
 Thu, 12 Oct 2023 16:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697151897; x=1697756697; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MjY6Bfa7hXy3EtsVkBFJvcxDVqkLy8yAMFEk0tgy2ww=;
 b=g8WnTtjxQAwgvtFqp/Q1qtALSLH5i6giuXTSkj5QQxE09xTHxj1rBJZzpt79WZl7vM
 9uXmwXN0cxpLHNlj0XdxNmcJDhL+pp9ZGFFd3mly2+3DXvQrRgV4++WgsjuEWQ9p0WXY
 uK0FDkLmFNa5LelNivHNn/yNbOGbkXpt7gg863YWYhic1PZSMK4PBLkbSkrW6xTRGlr2
 9U/Y1Z5GQvS9kjrqq/CvHKUwwAJURDJP3QnTr+iQZIksvRPJ5igoOrRN3iAyKFNWCFHQ
 TmOBleT+Bg+/7gK/zGWmKAOTpLim7CvFEKQFAsHUeCvAbKRfjz9T2anA6tiezFgaypW7
 u62w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697151897; x=1697756697;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MjY6Bfa7hXy3EtsVkBFJvcxDVqkLy8yAMFEk0tgy2ww=;
 b=B2I/TajRFazx3TaN6/0oPSUNtwH3b3jGJT7dWCBt7Ku+duGVqLDAEisjAn4orkGJ8B
 D0pSvvql+mipHVmMde+oqNoM2cP85cmh58ungXmxebbViD1wLtw2XWd6OC+YtzFwRhd8
 MSTO/JNvmzFIaZ5pUdzMbzg0ZjnJsqOFSQcw0bIA92Z7+wZoClMSixKsGJ+qgbBKyXKl
 twKMgFY+MxcUiGK6J/skiDOo9EyjwMThmt8/Oee+QlzjS7XNGUzm0OFPYKpp2pDuNxoN
 qzpRfWvJ+V06IV1XY9F4AZcXqnBUudUGdLX8SDAfo1sQrR3ZVzpglaM/6WGlXFlO9gzm
 H8Yw==
X-Gm-Message-State: AOJu0YxGrWrRarcvT9dK85oXw/9J4XIwmcIvm+4K0ILysnR9LoCRNkfI
 aBzOGOobDvHyiaAXv0e82Ew=
X-Google-Smtp-Source: AGHT+IH+4v5f93VcvRkHnnVgNR/Vyt3EU7gWUCAaBPEj/wJkDgmWUDn2+fSuZCy+1+14UNBZQ7kIzw==
X-Received: by 2002:a05:6a00:2e92:b0:692:b3d4:e6c3 with SMTP id
 fd18-20020a056a002e9200b00692b3d4e6c3mr27619108pfb.0.1697151896807; 
 Thu, 12 Oct 2023 16:04:56 -0700 (PDT)
Received: from localhost.localdomain ([140.116.154.65])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a62ee04000000b006889664aa6csm12193998pfi.5.2023.10.12.16.04.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 16:04:55 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: zhenyuw@linux.intel.com,
	zhi.a.wang@intel.com
Subject: [PATCH] drm/i915/gvt: Optimize mmio_offset_compare() for efficiency
Date: Fri, 13 Oct 2023 07:04:49 +0800
Message-Id: <20231012230449.2109078-1-visitorckw@gmail.com>
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
Cc: tvrtko.ursulin@linux.intel.com, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, joonas.lahtinen@linux.intel.com,
 linux-kernel@vger.kernel.org, jani.nikula@linux.intel.com,
 Kuan-Wei Chiu <visitorckw@gmail.com>, dri-devel@lists.freedesktop.org,
 daniel@ffwll.ch, rodrigo.vivi@intel.com, airlied@gmail.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

The original code used conditional branching in the mmio_offset_compare
function to compare two values and return -1, 1, or 0 based on the
result. However, the list_sort comparison function only needs results
<0, >0, or =0. This patch optimizes the code to make the comparison
branchless, improving efficiency and reducing code size. This change
reduces the number of comparison operations from 1-2 to a single
subtraction operation, thereby saving the number of instructions.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/gpu/drm/i915/gvt/debugfs.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/debugfs.c b/drivers/gpu/drm/i915/gvt/debugfs.c
index baccbf1761b7..998d82a259c8 100644
--- a/drivers/gpu/drm/i915/gvt/debugfs.c
+++ b/drivers/gpu/drm/i915/gvt/debugfs.c
@@ -48,11 +48,7 @@ static int mmio_offset_compare(void *priv,
 
 	ma = container_of(a, struct diff_mmio, node);
 	mb = container_of(b, struct diff_mmio, node);
-	if (ma->offset < mb->offset)
-		return -1;
-	else if (ma->offset > mb->offset)
-		return 1;
-	return 0;
+	return ma->offset - mb->offset;
 }
 
 static inline int mmio_diff_handler(struct intel_gvt *gvt,
-- 
2.25.1

