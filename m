Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4719F76BA73
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  1 Aug 2023 19:03:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7DA810E45B;
	Tue,  1 Aug 2023 17:03:47 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CC0410E447;
 Tue,  1 Aug 2023 17:03:42 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-34930636b05so3982475ab.2; 
 Tue, 01 Aug 2023 10:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690909422; x=1691514222;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fs8KKrYjZk0r9Wo5TdxMtD6IOfpOECGrCMFsRZEQgtA=;
 b=SFMJTLtjbBRqmzzpSgH+2eB23Tq0h1jxCPHsTNTwjOWfo4n2ijpFGiwN97CB2QxtG3
 qi0iftE0DlDd5GLzpRygtOsaJJQMbCvNuFzSYG0sr/HsJpSWOusKmCuiojZMvjSW5HVO
 RKfwV4xqDO1hZ7e3jHnnJMMxho+9IYVdmjmwSzeN3sqKWVyTetDuS7KNCShgXiRrbU9e
 haNAjxvCvYcYNQs0onXzAQPsFWtG7epspz0wlK5JSyh+dJR11eYicU+JJuQv8dnnirD7
 o6pkPL/PVAZD6oYZQHC2UbZblsu5XieIjB0KV7MLR4xONrP2ekGXh/rdUKtU4nAGqkf9
 n5cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690909422; x=1691514222;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fs8KKrYjZk0r9Wo5TdxMtD6IOfpOECGrCMFsRZEQgtA=;
 b=eeANmMzeqpNN75M/dycMPBePRtIfYwRl2+VD0Ub7sWw3c8XdaZrwTK1mjNqK3uXLCY
 pH1BL7zVyu9ik5OQSDFLo96zs68DQsPd1LAPraCBS+/RRRdm8QkNe+g02NHgBzUGxazi
 qqEm2YKGeVbQYsrQhcHmuCC6CB5VTwXly7oFSIZKfn2L73cLVZqUjo6J8RfJVZ6SToOz
 MkQyO5o3/f3PfZ1+Io+ZA5Uzn2VuTWtjM30XUPwz2Kbw886SMcAIYcx+12z6tSKoyzP4
 U0YSmJk9GH1xzi/njCHMaKK147dkbweqsqK9D7oc/Mpj5B6B6+WergLfw8iMWW85aFGI
 fe5w==
X-Gm-Message-State: ABy/qLbgu4ZbBTfBO8YNrE4/n35zqcwA5hOD8htDD/uFgS0RToHElxlc
 +cj+aqUOo4phJS+Hmz8TwIs=
X-Google-Smtp-Source: APBJJlHM6coGF5VoxK2i9FXxeme9tj+l6a1obs3/JcaH5eEwk48eeo+PrnIktcypzFiPVL26NLtzHg==
X-Received: by 2002:a05:6e02:ca4:b0:348:f53e:49f6 with SMTP id
 4-20020a056e020ca400b00348f53e49f6mr11938255ilg.1.1690909421849; 
 Tue, 01 Aug 2023 10:03:41 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 o20-20020a02c6b4000000b0042b144abf71sm3768577jan.179.2023.08.01.10.03.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Aug 2023 10:03:41 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, daniel@ffwll.ch, jbaron@akamai.com,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 19/22] drm: restore CONFIG_DRM_USE_DYNAMIC_DEBUG un-BROKEN
Date: Tue,  1 Aug 2023 11:02:52 -0600
Message-ID: <20230801170255.163237-21-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230801170255.163237-1-jim.cromie@gmail.com>
References: <20230801170255.163237-1-jim.cromie@gmail.com>
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
Cc: jani.nikula@intel.com, linux@rasmusvillemoes.dk,
 Jim Cromie <jim.cromie@gmail.com>, robdclark@gmail.com, seanpaul@chromium.org,
 joe@perches.com, ville.syrjala@linux.intel.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Lots of burn-in testing needed before signing, upstreaming.

NOTE: I set default Y to maximize testing by default.
Is there a better way to do this ?

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index ba3fb04bb691..ff478fcba67e 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -52,8 +52,7 @@ config DRM_DEBUG_MM
 
 config DRM_USE_DYNAMIC_DEBUG
 	bool "use dynamic debug to implement drm.debug"
-	default n
-	depends on BROKEN
+	default y
 	depends on DRM
 	depends on DYNAMIC_DEBUG || DYNAMIC_DEBUG_CORE
 	depends on JUMP_LABEL
-- 
2.41.0

