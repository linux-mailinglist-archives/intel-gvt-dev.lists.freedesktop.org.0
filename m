Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9005BCA79F
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 09 Oct 2025 19:59:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6780510EAEC;
	Thu,  9 Oct 2025 17:59:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="azrhu1lv";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 577E410EAEC
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  9 Oct 2025 17:59:13 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id
 e9e14a558f8ab-42e6df6fe53so4983065ab.2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 09 Oct 2025 10:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760032752; x=1760637552; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wWtqPHzvZoScVts3x626CqF+Swe2KDKHU2aMYO19y8E=;
 b=azrhu1lvLNE5XpnB3KJXlAny5QenVJh9mO9IrrxzqVM4HxnOiIyEp9+eqbEh3ujvNb
 1UGg+3XbEjIzRpKJEpOWHRUbvC+QvgDy+xATxAk9VnrmjwAMyVfF6qo81L5EeVJ9JJ37
 XMhenDA1TvUSjeW0Mds+RQq9VzDn7zNCwC4udBFM9WgB0SaVGIfyE9i4ihSfYlBIBU+R
 aB4q+9t/BUO1r5I/r8JdaVRQhbBsJpKL4wcMl3+1U6NfQ63ZxbU6HZgmzLEQvlzuowL6
 p3t+b+qDIm3Ys0nKxvPFzych6IMRjmLZZE9ErG/pucIUOgDFpf8dnreE+xYldW6xBvRF
 5F7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760032752; x=1760637552;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wWtqPHzvZoScVts3x626CqF+Swe2KDKHU2aMYO19y8E=;
 b=fT6amZfeH0DDTktdpEezJ85iFI+1D0iS3hfj01QXj3n2cwRDEkY5f7UZoh/eCAVhqH
 5D0ZP7vhEHWP+O8SqD+LahYczJBIp8zp0PyAmjv6bked1qF+6rFXh8x6gi9Q7487caqt
 4mSQyVHAaZj08lUb7uTQi/lCNAxeTa6+nlEA4hTqoTnD/4itnl6AxR6d+dZGW4mhL+hx
 uAL+j4KNRactFkCMQ36I8pK+4VplB0lKn5TEiZmVEJLBryG6wZSBK5LWrD9H4w4AIlHm
 4aaXS/y4NM5q5odbsy5Ew6GjRXP7Ab847dq5f/rNDtLiMONZkXGQgnY0udCkClBaNYLy
 h1pA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3JDQVdU49IOrHntda3bOmsvTjtOmWBzyN9agtbCE76/Lgnfj8ypDiWAnHhAkLKXDjJFOXZnmjufOnpcvR@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxHYtIlfAICurtiJ5mCmvgxs2JagxKExb09vT6rkjlcf+SIbjg4
 OiAgA3YoSvfOwB+x96vUxu+wD5wB0QVX9Ddoy5ENWlMfGbdtL0i4qFSheYBLPw==
X-Gm-Gg: ASbGnctuZIg1ed6J6y3iZ20NqnBYFVI0dJqTOZCH5/1fmw2sSGaOnHhIKSbpXuz1pFx
 ho5xxsP42aSq9u9yYc8go7sC6IWvSpZK96xSdse2j3HuZImTJ3jZtJZbP2gkZbrEGbYBO+svrBV
 XAnv5SnQOONLVRsTOkwbpipR9ZW9sOe2WaGCoImHUPmwKNSesLcXUC8yqsfH1VO7Qtw1Lc6qIlO
 bzC6Z8qT6FAPSUn6fasgs0/mj5sFWaMAuO2z5RCGqjOxHS4wCacNAR1amDembxGuJ1mUtx+FglV
 Dzvvd0ec7Oss1vcn8pdE0E+KOUr30SSPfrOQaL+2aNnKBxvo0Pj2VR1HYfDIOaxG45vsESez7iM
 6uEb90JNDqbp6XkbTl1GyOra9OSBLipxPuPQ2EyzAWVRjpsAPJ8Z1oz6SrzUZmsjxq7fSKPgyC6
 4KlZzvaL+dVr95iqBEB34CgvdcGkaF5pxIgrExqg==
X-Google-Smtp-Source: AGHT+IHFaHIr6hhGjGpGvstoe1cPL73AxoLQd3mHJOdW06DK9B2zxkHb4Qpq4bia8u2yk9gHtlYTWg==
X-Received: by 2002:a05:6e02:160d:b0:42f:991f:60a9 with SMTP id
 e9e14a558f8ab-42f991f6190mr5265655ab.7.1760032752391; 
 Thu, 09 Oct 2025 10:59:12 -0700 (PDT)
Received: from godzilla.raven-morpho.ts.net
 (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-58f7200c4afsm30256173.35.2025.10.09.10.59.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 10:59:12 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com
Cc: gregkh@linuxfoundation.org, ukaszb@chromium.org, louis.chauvet@bootlin.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v5 23/30] dyndbg-test: change do_prints testpoint to accept a
 loopct
Date: Thu,  9 Oct 2025 11:58:27 -0600
Message-ID: <20251009175834.1024308-24-jim.cromie@gmail.com>
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

echo 1000 > /sys/module/test_dynamic_debug/parameters/do_prints

This allows its use as a scriptable load generator, to generate
dynamic-prefix-emits for flag combinations vs undecorated messages.
This will make it easy to assess the cost of the prefixing.

Reading the ./do_prints node also prints messages (once) to the-log.

NB: the count is clamped to 10000, chosen to be notice able, but not
annoying, and not enough to accidentally flood the logs.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/test_dynamic_debug.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index b2bdfdfb6ba1..fa81177e8089 100644
--- a/lib/test_dynamic_debug.c
+++ b/lib/test_dynamic_debug.c
@@ -29,18 +29,25 @@
 
 #include <linux/module.h>
 
-/* re-gen output by reading or writing sysfs node: do_prints */
-
-static void do_prints(void); /* device under test */
+/* re-trigger debug output by reading or writing sysfs node: do_prints */
+static void do_prints(unsigned int); /* device under test */
 static int param_set_do_prints(const char *instr, const struct kernel_param *kp)
 {
-	do_prints();
+	int rc;
+	unsigned int ct;
+
+	rc = kstrtouint(instr, 0, &ct);
+	if (rc) {
+		pr_err("expecting numeric input, using 1 instead\n");
+		ct = 1;
+	}
+	do_prints(ct);
 	return 0;
 }
 static int param_get_do_prints(char *buffer, const struct kernel_param *kp)
 {
-	do_prints();
-	return scnprintf(buffer, PAGE_SIZE, "did do_prints\n");
+	do_prints(1);
+	return scnprintf(buffer, PAGE_SIZE, "did 1 do_prints\n");
 }
 static const struct kernel_param_ops param_ops_do_prints = {
 	.set = param_set_do_prints,
@@ -191,17 +198,20 @@ static void do_levels(void)
 	prdbg(V7);
 }
 
-static void do_prints(void)
+static void do_prints(unsigned int ct)
 {
-	pr_debug("do_prints:\n");
-	do_cats();
-	do_levels();
+	/* maybe clamp this */
+	pr_debug("do-prints %d times:\n", ct);
+	for (; ct; ct--) {
+		do_cats();
+		do_levels();
+	}
 }
 
 static int __init test_dynamic_debug_init(void)
 {
 	pr_debug("init start\n");
-	do_prints();
+	do_prints(1);
 	pr_debug("init done\n");
 	return 0;
 }
-- 
2.51.0

