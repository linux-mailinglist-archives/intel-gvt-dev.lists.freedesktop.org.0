Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE51512487
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 27 Apr 2022 23:28:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15DB710E675;
	Wed, 27 Apr 2022 21:28:55 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 296A510E30B;
 Wed, 27 Apr 2022 21:28:54 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id t25so5357366lfg.7;
 Wed, 27 Apr 2022 14:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=Mp0j5HGR2P4LEhpd0HLD8Hml4zjLb4/4zwP2esLmqOU=;
 b=UMKngezes9SZVoLgt26aPvV2bMYml/0HAYM7tqMerWvLZo1BZvR0i03ydvdeulvwxc
 7KZrsMtHITqCpa9YEBEXqdL/pq3MomTP62YYeV1zM897HRWMDxwXyixxyzH7shIja1vh
 WrtLupRMWcCYuKOyZo6pKrGejddzI5gNopDdDYhXKNhcdNEYY46vLFKoR2zZkVSsebxW
 uKvWUi/VIDe36otTaSrw0LhkaVXdE8stXNZsjrtliIavVm/24yf5hp81BG3YCmJVeP7v
 yllAWfz//1fC/hoRJGvqmA9F0H2LIkrUOqp+kRBBCjnTeurNnSyKrf13OFsWNouoWuJv
 ksUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Mp0j5HGR2P4LEhpd0HLD8Hml4zjLb4/4zwP2esLmqOU=;
 b=C19P7mDWy0q2a2G0+RmNw+dnkApjx5n6jl8RNhLz7l0X5W5WK2+UwSbv2dmzCVNVGy
 3uq8vOquVMFjHPe50DsSKvjHmHk5Yxmnv48b18LmxuvKAkUlwGWkqqEc2OxKWDqazgku
 vUFYTGi/7fKFr6Sa6DUnyT2NoVKakVb1OL7yVO8oSYLsvsC9cPse26yA6HdvLVJIK6nc
 cHbZn6s1Mwl4duISsp+WyOHf9YN2denqsUpWKCj/Dg5qNWRI7eJ/uR5ouCCIUXQfA+Fm
 feFSEZmhvpP9PoDbxhMbqkU0XYT8876rZqJZrPVkSfTIGf9kGY7CM7+rac8TQRbrmNIV
 zmtQ==
X-Gm-Message-State: AOAM532+seBP42p6K/NH5EwhBgfr5qXf9VCQYmwwLlnatMamlpZeBNVf
 aZLjuKNnDBFHETEScfA0JjppBTKuHHg=
X-Google-Smtp-Source: ABdhPJw9luKjhSLFc7VbbnmHy1Qy6VdbcqNoYhJLoILzYshukEcHbkAaMBKlCcC4HNoEEAjmX4cpHA==
X-Received: by 2002:a05:6512:1085:b0:472:1013:aac7 with SMTP id
 j5-20020a056512108500b004721013aac7mr9912314lfg.463.1651094931999; 
 Wed, 27 Apr 2022 14:28:51 -0700 (PDT)
Received: from zhiwang1-mobl.lan (88-115-161-74.elisa-laajakaista.fi.
 [88.115.161.74]) by smtp.gmail.com with ESMTPSA id
 m8-20020a2e9348000000b0024b47e7dda5sm1879248ljh.65.2022.04.27.14.28.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 14:28:51 -0700 (PDT)
From: Zhi Wang <zhi.wang.linux@gmail.com>
X-Google-Original-From: Zhi Wang <zhi.a.wang@intel.com>
To: intel-gvt-dev@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/i915/gvt: Make intel_gvt_match_device() static
Date: Wed, 27 Apr 2022 17:28:48 -0400
Message-Id: <20220427212849.18109-1-zhi.a.wang@intel.com>
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
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Robert Beckett <bob.beckett@collabora.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

After the refactor of GVT-g, the reference of intel_gvt_match_device()
only happens in handlers.c. Make it static to let the compiler be
happy.

Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Robert Beckett <bob.beckett@collabora.com>
Signed-off-by: Zhi Wang <zhi.a.wang@intel.com>
---
 drivers/gpu/drm/i915/gvt/handlers.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index cf00398c2870..a93f8fd423c2 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -72,7 +72,7 @@ unsigned long intel_gvt_get_device_type(struct intel_gvt *gvt)
 	return 0;
 }
 
-bool intel_gvt_match_device(struct intel_gvt *gvt,
+static bool intel_gvt_match_device(struct intel_gvt *gvt,
 		unsigned long device)
 {
 	return intel_gvt_get_device_type(gvt) & device;
-- 
2.17.1

