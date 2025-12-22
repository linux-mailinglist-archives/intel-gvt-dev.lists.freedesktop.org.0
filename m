Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C68BACD5072
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 22 Dec 2025 09:25:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8E9A10E5BD;
	Mon, 22 Dec 2025 08:25:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jm1AUlHG";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D7D710E5BD
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 22 Dec 2025 08:25:29 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id
 d2e1a72fcca58-7b89c1ce9easo4233798b3a.2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 22 Dec 2025 00:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766391929; x=1766996729; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wJ6LQIhz3opDVp8qv4sJ5LmxJU4UfSK37U6o6GR2gQA=;
 b=jm1AUlHGDPOcW4GE1XtrmSAlx9M2JPf7oMcN8viNQMaKQXvpyhFdgxnuj2+KnXopS1
 eg1Z7011tWxq+DyEN1fayiHDb8e2KMtHeFoL27rkot5AWKkHN4V2stAfeKhKxW3xgOpL
 HtFrthgOOJ0oawKougrg43wrol7zAco5OH5JvaP6+X3zLIEdKuApPbeAMtK5KgI+4ivS
 e2j/ZqNXEIFhllmMqT8UcVsUhRrDXvHALddQ9yxlt0atp2/3i1EHYvyRRr+PFi8NFjgw
 xsRLAsU6+Y4yNsUKiOpHXKgw6XGzDE8ms1rYpJDn+gy9Upz5JB/n4v0T9pjqymDqVacD
 3ehg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766391929; x=1766996729;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wJ6LQIhz3opDVp8qv4sJ5LmxJU4UfSK37U6o6GR2gQA=;
 b=Li5DFOV1RrI+VzICwTiMqZDpfjXleUuKA5zqkOsCjLHW8riRv9GWP/CPK50fdj6dae
 ZxM7iu985ZVrUAmfDaT9n/5vZBUAGuOnPUwiMFFtLtu2bi5GQA8ibZXAUPF+BZSYw4TK
 G7IClcX2rfqaTmnEFFW4y0ZLoOXzVOmaBpMnBjuIaWws/Grh0Y+fq4wQlhuNukE4PqUs
 qz358mEW3PBr9HxF7lkrfW3l0edmnlSImsCSzyuJsnnh4yUVSX1AgkQzpaYeuAQ6ap4f
 8iiCFBJQnQNOdrWRLpmb1d3CYQnaSLFutlp+8ReqVmxyFBdk1zyTvZpDV9AakaZAssSj
 swJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX41X/WB2U78eY/QMp+K5Jn5gwsBpYe1BOWwuzcdqUdoCY08v9aTmYunZTUlx9DDuj5CciNaGJdju9Cvtoh@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwhgDDbxZYgJb9sDm1AQK+HZEURO3Paj33IccM96kajMpuLXDSx
 ZGXDiyGNdqC6jDQu7Hbpm9mem8adpNmVd42u09RxAqNm+nSnZxl0F0lU
X-Gm-Gg: AY/fxX4LIRcGZA8QiloYVDR/V4XGCa0LW4Rv8e0JTQ/SHD+Y4/pcLlff84fgUCyPmgs
 5RHZkAKMyh3qyikKDLQlE4n1yrafBDbGqliTQVnholu9RmUo4dpLLNe2YnnkAl28NBzFtbiOKsa
 NyMbqjZSVuvcXMEVxiU36lyYd2DB8k9pFYXZ38sEz54VnYHQBQ7xrgQ2CKAWU7FZ+Iy5BE+DVSs
 Tv9yKdE3piRajnGKZ3TmeynJS9gXm4fmct68WAAW9WmwAvrDiXjVCkcztnaVHQup5OM9Rk5spvm
 Q44GPAmvKFlPtY6avW9Ye5jksMwI1+TgXA6Jy13ZtJmQrZLXNe4datwJyCaYyjr8Rvo0DNDQUph
 aQVuBdVWqnr/klF+Lq2Bz1Qr5dEM8qoO/ijzWId1lR5k4XEg+xoOyGMw0JQkOcYBASrwWcunuR8
 3oRg+t7AFE
X-Google-Smtp-Source: AGHT+IE+QxCurRN0AzDICu9k2MWk1SPp1amxCYIl0Rf045fB7y1IHjsIYvGaV+1OKSxAVQgufeDctw==
X-Received: by 2002:a05:6a00:4190:b0:7e8:4471:ae5d with SMTP id
 d2e1a72fcca58-7ff67456c6emr7951795b3a.41.1766391929081; 
 Mon, 22 Dec 2025 00:25:29 -0800 (PST)
Received: from frodo ([2404:4400:417e:3d00:8b90:7f55:1261:772f])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-7ff7e493123sm9540699b3a.50.2025.12.22.00.25.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Dec 2025 00:25:28 -0800 (PST)
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
Subject: [PATCH v7 23/31] dyndbg: check DYNAMIC_DEBUG_CLASSMAP_DEFINE args at
 compile-time
Date: Mon, 22 Dec 2025 21:20:40 +1300
Message-ID: <20251222082049.1782440-24-jim.cromie@gmail.com>
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

Add __DYNAMIC_DEBUG_CLASSMAP_CHECK to implement the following
arg-checks at compile-time:

	0 <= _base < 63
	class_names is not empty
	class_names[0] is a string
	(class_names.length + _base) < 63

These compile-time checks will prevent several simple misuses, and
will issue obvious errors if violated.

4 such examples are added to test_dynamic_debug_submod.ko, and will
fail compilation if -DDD_MACRO_ARGCHECK is added to cflags.  This
wouldn't be a useful CONFIG_ item, since it breaks the build.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h |  9 +++++++++
 lib/test_dynamic_debug.c      | 13 ++++++++++++-
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 905db0b49104..b19c9b1d53b6 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -180,6 +180,14 @@ struct _ddebug_class_param {
  * __pr_debug_cls(22, "no such class"); compiles but is not reachable
  */
 
+#define __DYNAMIC_DEBUG_CLASSMAP_CHECK(_clnames, _base)			\
+	static_assert(((_base) >= 0 && (_base) < _DPRINTK_CLASS_DFLT),	\
+		      "_base must be in 0..62");			\
+	static_assert(ARRAY_SIZE(_clnames) > 0,				\
+		      "classnames array size must be > 0");		\
+	static_assert((ARRAY_SIZE(_clnames) + (_base)) < _DPRINTK_CLASS_DFLT, \
+		      "_base + classnames.length exceeds range")
+
 /**
  * DYNAMIC_DEBUG_CLASSMAP_DEFINE - define debug classes used by a module.
  * @_var:   name of the classmap, exported for other modules coordinated use.
@@ -193,6 +201,7 @@ struct _ddebug_class_param {
  */
 #define DYNAMIC_DEBUG_CLASSMAP_DEFINE(_var, _mapty, _base, ...)		\
 	static const char *_var##_classnames[] = { __VA_ARGS__ };	\
+	__DYNAMIC_DEBUG_CLASSMAP_CHECK(_var##_classnames, (_base));	\
 	extern struct _ddebug_class_map _var;				\
 	struct _ddebug_class_map __aligned(8) __used			\
 		__section("__dyndbg_class_maps") _var = {		\
diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index 1ba4be9a403a..b2bdfdfb6ba1 100644
--- a/lib/test_dynamic_debug.c
+++ b/lib/test_dynamic_debug.c
@@ -133,7 +133,7 @@ DYNAMIC_DEBUG_CLASSMAP_PARAM(level_num, p);
  * Enable with -Dflag on compile to test overlapping class-id range
  * detection.  This should warn on modprobes.
  */
-DYNDBG_CLASSMAP_DEFINE(classid_range_conflict, 0, D2_CORE + 1, "D3_CORE");
+DYNAMIC_DEBUG_CLASSMAP_DEFINE(classid_range_conflict, 0, D2_CORE + 1, "D3_CORE");
 #endif
 
 #else /* TEST_DYNAMIC_DEBUG_SUBMOD */
@@ -146,8 +146,19 @@ DYNDBG_CLASSMAP_DEFINE(classid_range_conflict, 0, D2_CORE + 1, "D3_CORE");
 DYNAMIC_DEBUG_CLASSMAP_USE(map_disjoint_bits);
 DYNAMIC_DEBUG_CLASSMAP_USE(map_level_num);
 
+#if defined(DD_MACRO_ARGCHECK)
+/*
+ * Exersize compile-time arg-checks in DYNAMIC_DEBUG_CLASSMAP_DEFINE.
+ * These will break compilation.
+ */
+DYNAMIC_DEBUG_CLASSMAP_DEFINE(fail_base_neg, 0, -1, "NEGATIVE_BASE_ARG");
+DYNAMIC_DEBUG_CLASSMAP_DEFINE(fail_base_big, 0, 100, "TOOBIG_BASE_ARG");
+DYNAMIC_DEBUG_CLASSMAP_DEFINE(fail_str_type, 0, 0, 1 /* not a string */);
+DYNAMIC_DEBUG_CLASSMAP_DEFINE(fail_emptyclass, 0, 0 /* ,empty */);
 #endif
 
+#endif /* TEST_DYNAMIC_DEBUG_SUBMOD */
+
 /* stand-in for all pr_debug etc */
 #define prdbg(SYM) __pr_debug_cls(SYM, #SYM " msg\n")
 
-- 
2.52.0

