Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CF8CD4FBD
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 22 Dec 2025 09:22:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E595810E568;
	Mon, 22 Dec 2025 08:22:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="neBQnuVn";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02BB710E569
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 22 Dec 2025 08:22:50 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-7f121c00dedso5006578b3a.0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 22 Dec 2025 00:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766391769; x=1766996569; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kbNTI65sKfDeAaHShpwIIW/4QzYcWu3sc0P4jYcnBH4=;
 b=neBQnuVnzqt1H6VYOlP3M8KKFRI/cdKsOs3057KO5vNhsv1HbmMwGjaVH15rsyMKo/
 N4ZdO94JS47LXLlFvUizmZFqWUnevi51Zgx1usHTPggd09nMkqZTs2OIV3Uvvw2fBV+c
 0+eacWIonCw1Pxvbvx49TWdjkDpuo0AgR+d7B2mAdf2tWg65Icad4FES8F+s3A+5Qpog
 gBJEHIf8vEB6jIuFnXyLLg15qascLywGhdyt5Ni7672afCUd5aM6lmmiK/n+Lu0jEf2X
 bYMcs7+8Xixtmzz0NSjUX4jhTUnKompVNPl6Oh8iCSeJ+QzrUsInR1N8oZ1KyL5H5nYM
 vgjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766391769; x=1766996569;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kbNTI65sKfDeAaHShpwIIW/4QzYcWu3sc0P4jYcnBH4=;
 b=T8/P5nnit+fszWVKKERiA2i03EnJoaOe1KSNfTI2fglv+tMr0tD/B2wmvUiwm3cKsn
 kxE6KaqQY2zZEWkmHp2SYSxUq2AptTCsfl1PHOaMnP7oNjrI9wR+6dw0iJEMoc+JGpfW
 RPB5zZYCmCN11LINADiF9ztCJfPsIC5aHThJs5NQQL6dTaaqu5BwpT9tWhJf6WU+IqLp
 UDlT1hmnm0ZLxz6/CJ2FmAmKNG9/wkyAteCZuz7GPJpl1yDRr3w9Sx0qRsXI7YPvGb5P
 Evm0lyucWWnJiGHjdyKk/JweheKTG9ceNEt9Lsu20T0AkSOf8tCkgz2QdZgXAWe1ERvf
 wSjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2KRo3fR/xRNqYFfyOGRBpTCfVV5MuXjx6rC1gC2vTD0lG98DGmzOf7mMAQhiFe3uguRwzwDVX54968IM4@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxgydoTuyqpYGX+lak1nFZUyLbnUoKEhN9B4uMWrg7LoT4jzXrO
 9GO/YXUsFRLZeovcVX3ftlByoCoOCeZlMwC6I3d8GaqQ5MCdc2WvoOw7
X-Gm-Gg: AY/fxX54OR+o3/kVJI1bO84bGyMHKiIwHASmXSxd4eRFIPLULWahw0kdggLwU1wgnOC
 uHgxhdZsRkJ8amhWxD7UTjetFAwQ23ZHpGwfigjwuIAOb2XsCKE7NOUgKvtkhATmuepPg+LzSEg
 Kjbi1WH59KeprqR+qmkdv8lDQ+1W2zX1jmPHEtyVMBRB87A+Wy3JxltV05beJReQVNkw9+XZK7N
 VGYNd9fFelfS3keWTbuyc44zIoGW8ei1sU2lrjPYq6ZkH1XVKd8nVYBKsfmOxZ3UoS/hmmpshhw
 56gkKNtx0Mz8H5EyxL4mBQKxwizKGJp6xmZLp5wsf7beNkeAIwarCBqn3nCn2xp9L/OLFwBpdzT
 7C5zxg1Hvmk2x0pxNCAWNPai/Iy6SmIv23cHdvGHXHPPwBwXUD+YoZ2BF2LmvMg/33yeFXcwTsA
 XDoqtrf2l8
X-Google-Smtp-Source: AGHT+IGD08I50soJcdL+xzw0QhupyvnNGdXij4KQgDOgK8/wl2+Is9lHSt1ytu+E7hNdpFYZDBEOMA==
X-Received: by 2002:a05:6a00:1d12:b0:7b8:16af:3bbc with SMTP id
 d2e1a72fcca58-7ff650ce054mr9986499b3a.31.1766391769458; 
 Mon, 22 Dec 2025 00:22:49 -0800 (PST)
Received: from frodo ([2404:4400:417e:3d00:8b90:7f55:1261:772f])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-7ff7e493123sm9540699b3a.50.2025.12.22.00.22.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Dec 2025 00:22:49 -0800 (PST)
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
Subject: [PATCH v7 08/31] dyndbg: drop NUM_TYPE_ARRAY
Date: Mon, 22 Dec 2025 21:20:25 +1300
Message-ID: <20251222082049.1782440-9-jim.cromie@gmail.com>
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

ARRAY_SIZE works here, since array decl is complete.

no functional change

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 4b7c3b997657..c4ae79f934d9 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -131,11 +131,9 @@ struct ddebug_class_param {
 		.mod_name = KBUILD_MODNAME,				\
 		.base = _base,						\
 		.map_type = _maptype,					\
-		.length = NUM_TYPE_ARGS(char*, __VA_ARGS__),		\
+		.length = ARRAY_SIZE(_var##_classnames),		\
 		.class_names = _var##_classnames,			\
 	}
-#define NUM_TYPE_ARGS(eltype, ...)				\
-	(sizeof((eltype[]) {__VA_ARGS__}) / sizeof(eltype))
 
 extern __printf(2, 3)
 void __dynamic_pr_debug(struct _ddebug *descriptor, const char *fmt, ...);
-- 
2.52.0

