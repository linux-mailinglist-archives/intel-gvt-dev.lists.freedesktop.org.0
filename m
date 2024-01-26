Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E2183D4CD
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 26 Jan 2024 09:42:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3FE410E1BA;
	Fri, 26 Jan 2024 08:42:53 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 216C110E1BA
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 26 Jan 2024 08:42:52 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-3392b045e0aso139527f8f.2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 26 Jan 2024 00:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706258510; x=1706863310; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FHr39JH9ZAVO5s/Q6TxKvwEModPDg6RBhwecUYh/FLY=;
 b=qt6Ih6Bhp147wXcap46qdr3uBm+zpfbOXwxE+FzVx6rfyjSwyug7jizvnNWMU9B6EJ
 sWH/mqGA63yzT9Fi5SNm/CegDnCn0UDIyKKB+LqAujEq9wV9ezbo/FeQRca1lp/kuq8U
 ICB8C8zruKxSi9arZyn2CGOWXtnaNigCcQmuJAEUZiUQiUDNTpNxaCBoiQbNIq9iYVwe
 d/gpYBaZM+K4fIPeF5RDzzlY8OBMmQzEQrBXAFTqEVkRt1wOdhnWvajjYJEhkLnAt52f
 iE0Z76bQOgmbssCRwX5fja86MPenXbWKhC92qI7T4lUZxJBwUUtIooyPN/Ic/mv8p2CJ
 DQcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706258510; x=1706863310;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FHr39JH9ZAVO5s/Q6TxKvwEModPDg6RBhwecUYh/FLY=;
 b=qNt++M7JxxHUMce/z2ItZ2C1Z0B/zLex6zDLvICU+YHgw0O2wEhjofVsqAOwmdwvhl
 /TEhuMUwDc210ENNUVpXvkCFfJ3sYIba+qWuwOj1GW4ZgsHyH8BQ9Ceth++YVpz3Kb0T
 2hAd/Ait4ftlMVF6N6jDG7GQHXLesdWFsxhdoTi/zc9uzoB5Ukr+w5PQv4FqiF65XftN
 wsGznC3hRS/+9+OveceIl1hTSbC60sxX4zjmIt2A8yiOPbIJuJDewg3tgwDz3yzlbzzt
 /ZFpT4PH8whR2REpoZ/rcXkKsiwWGvkbpgcOzfT2PMUjFF189Iugz/cxy86T2pTZ3wza
 Ewxw==
X-Gm-Message-State: AOJu0YyRf8cfP865AyVVUXFjOlpLDCFwlHlz/D5zemvhZ9iTqQNDWxWY
 DDWx2Ub5WAWeWOOiYKX12EzRntuerKjgYgKDjMGeVuWv2KzYgUBW03nOfEOhbZI=
X-Google-Smtp-Source: AGHT+IGODQTp1WGBJOYeb5QpU8MHe6FvpWAhmxNfECU8K2SX9RjwK0yxx8LAKL3RZy4pjkFNfgFKVQ==
X-Received: by 2002:adf:e852:0:b0:33a:ddff:7774 with SMTP id
 d18-20020adfe852000000b0033addff7774mr24330wrn.36.1706258510562; 
 Fri, 26 Jan 2024 00:41:50 -0800 (PST)
Received: from localhost ([102.140.209.237]) by smtp.gmail.com with ESMTPSA id
 bt7-20020a056000080700b00337d4ce6ab4sm766097wrb.20.2024.01.26.00.41.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jan 2024 00:41:50 -0800 (PST)
Date: Fri, 26 Jan 2024 11:41:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH] drm/i915/gvt: Fix uninitialized variable in handle_mmio()
Message-ID: <11957c20-b178-4027-9b0a-e32e9591dd7c@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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
 dri-devel@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

This code prints the wrong variable in the warning message.  It should
print "i" instead of "info->offset".  On the first iteration "info" is
uninitialized leading to a crash and on subsequent iterations it prints
the previous offset instead of the current one.

Fixes: e0f74ed4634d ("i915/gvt: Separate the MMIO tracking table from GVT-g")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/i915/gvt/handlers.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index 90f6c1ece57d..efcb00472be2 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -2849,8 +2849,7 @@ static int handle_mmio(struct intel_gvt_mmio_table_iter *iter, u32 offset,
 	for (i = start; i < end; i += 4) {
 		p = intel_gvt_find_mmio_info(gvt, i);
 		if (p) {
-			WARN(1, "dup mmio definition offset %x\n",
-				info->offset);
+			WARN(1, "dup mmio definition offset %x\n", i);
 
 			/* We return -EEXIST here to make GVT-g load fail.
 			 * So duplicated MMIO can be found as soon as
-- 
2.43.0

