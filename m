Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 847D3A6D654
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 24 Mar 2025 09:38:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C9F410E23A;
	Mon, 24 Mar 2025 08:38:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PWdW5k9F";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFBAD10E236;
 Mon, 24 Mar 2025 08:38:11 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-43d0618746bso26323865e9.2; 
 Mon, 24 Mar 2025 01:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742805490; x=1743410290; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F8crvv1DnTAIhN9IwGfudPOXUjLvEiE3lOXStQ82280=;
 b=PWdW5k9FNcB+w1dHvhYd360+xBF+XxNoOG1SGPQYNg81TRiC9gRdDRCFEOlKOG1O1c
 sr/KNTtx3atL9Pva8NFUN/9wD0Ddlo53WqAAo95+gEdh2z/tIAeObvI5g+0e3+/8bE3z
 NSi6l7t8lG55qMaA7S3rZF/apAYP+QBFr7TBh5A/AQfJTAcNU8yMJKzaANvOFXvPvTSv
 HqAAlQqkwx8JkAqyZOYV/r/EqMjoznigKiJiiRQo5FVDKRY6NbuKRRMeuXALI4jTGYGT
 PZPXZNqC6lsm0qCIJGOry4/So2igLviGZ3RWcMd/TFi9Y7U84zGJKrF8Jvr6uEDfPgFu
 k60w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742805490; x=1743410290;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F8crvv1DnTAIhN9IwGfudPOXUjLvEiE3lOXStQ82280=;
 b=FAInIacwjYHizKSRRYyCVf3Ybr5foTTAY8KgogvxxP4duWuT6VNgMOYeyPOEuItq5+
 rSYCOJnxBzwWXi6efk4WMxJ8sLRV8md361yXo9g1tSeEANEbNqKxGCVLO6nqfQOj3MQy
 K3wcFkWW4PBhU8V03Q4OK1YpKMr/Zh4GlplAmuZfR4/f0CHI4H9pO+kSDZEPFgknHtWv
 +gYwJGbD2AwLMCnMSHgXPkRe/p0/3ALe+ESUpQsP+xXu45+fIeJTFPet2ZUUtSXvicIz
 ihEolsieKXJjDN3l71Y6Bpx6VHNIj4RO55Mv6v88DVPX7XtwugTbxci+vd8gOskEhvnR
 jo2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV11f+iLWVtGFbDBxaGhexws4YBOWI0uvyut+DU5hvndIrUhNS0fxs/npQmieHHnY0O8QJKZDCu6Kw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzfYtRgdBdQo/1NihVZ9S1gXQ5aPTExhNzCyfmCGjtnxZj2NMLE
 ScYB4qP3EasGhuK7dm1lrXHVFdhucelxTseBO7euYhj41W/GJ2jI
X-Gm-Gg: ASbGncuE7L00eGVMCB55CDKoshxqCj8RPBI1LrsYUZ2Xil/97UyGFTqJbsAKGIpQM39
 WXp/94UPvIzaEf1dXqSeDtVzAJGWTZqId5BaR1HVqnx9k6x8r/bBAZT4tjozRvNLah6zjaHmUyW
 8I69tJiXYKu2OjmUnOW7UcwjAcrQPcw+TeDfBgBXP9AlxIOfiqFROmZsFqMecYVfyQWBOsv8s6k
 X9hVbesesQDU0LD14VVCEv3mEleo9vIf2xwIxcYVLtsaNmFv/PC8N2Hlw6pV3vzGjN5HVIECVfS
 LwC1/FI+iKxAjAqkD32lG4ZJVuuIS1jdywFI//zmz3WjMB3JCtmljavfjY8AKQ==
X-Google-Smtp-Source: AGHT+IGs1HJeKkqJjMiO8rC3KSzg7HG6dWeZwb3bbz3SIfkpzJ0mP0jvFr5APzI9VrO18/uz84mVqQ==
X-Received: by 2002:a5d:64a5:0:b0:391:31f2:b99e with SMTP id
 ffacd0b85a97d-3997f900bd7mr10503751f8f.2.1742805490200; 
 Mon, 24 Mar 2025 01:38:10 -0700 (PDT)
Received: from arrakis.kwizart.net (home.kwizart.net. [82.65.38.83])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9b3c2csm10078670f8f.46.2025.03.24.01.38.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Mar 2025 01:38:09 -0700 (PDT)
From: Nicolas Chauvet <kwizart@gmail.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.wang.linux@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Cc: intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Nicolas Chauvet <kwizart@gmail.com>, stable@vger.kernel.org
Subject: [PATCH 2/3] [RFC] drm/i915/gvt: Fix opregion_header->signature size
Date: Mon, 24 Mar 2025 09:30:02 +0100
Message-ID: <20250324083755.12489-3-kwizart@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250324083755.12489-1-kwizart@gmail.com>
References: <20250324083755.12489-1-kwizart@gmail.com>
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

Enlarge the signature field to accept the string termination.

Cc: stable@vger.kernel.org
Fixes: 93615d59912 ("Revert drm/i915/gvt: Fix out-of-bounds buffer write into opregion->signature[]")
Signed-off-by: Nicolas Chauvet <kwizart@gmail.com>
---
 drivers/gpu/drm/i915/gvt/opregion.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/opregion.c b/drivers/gpu/drm/i915/gvt/opregion.c
index 9a8ead6039e2..0f11cd6ba383 100644
--- a/drivers/gpu/drm/i915/gvt/opregion.c
+++ b/drivers/gpu/drm/i915/gvt/opregion.c
@@ -43,7 +43,7 @@
 #define DEVICE_TYPE_EFP4   0x10
 
 struct opregion_header {
-	u8 signature[16];
+	u8 signature[32];
 	u32 size;
 	u32 opregion_ver;
 	u8 bios_ver[32];
-- 
2.49.0

