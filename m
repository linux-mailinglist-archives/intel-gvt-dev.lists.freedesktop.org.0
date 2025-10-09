Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F224DBCA759
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 09 Oct 2025 19:59:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C82C910EACE;
	Thu,  9 Oct 2025 17:59:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CBPSMXuu";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9DCF10EADD
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  9 Oct 2025 17:59:01 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id
 ca18e2360f4ac-9335a918867so112137139f.2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 09 Oct 2025 10:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760032741; x=1760637541; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PUjBG8W7JviM3Ypn5iExypGYjiK1aXkryX0lsVYOg2Q=;
 b=CBPSMXuu4fAKhJeGjQVMCqkP6aT5Dbb3J4gxQYHaST9KKvaBvPvsttFUYULUyV4Avq
 zsVi2jP/lENzfbCpyX2V6wfe/vmnIb1XV5/QpkRpd0DGbS/VbmvVjwGvus455kCUTA7h
 RBfG9BlkwcwBleo8ROXFC8qq2mSXAYt8QkC5MD/4JG9gvWiLXKN4wd09VHdSJwmWVFr7
 gOijB4eLERNW5W8Ha8oA+Wf8L2UgEMYwHVrJIqaE98272G8zdUROWVIxGo4hFkag13QV
 D3p+1CrpZxbM/33tYRTsIN1K0YUmaFotyuiBkfaZE2lW2sPG98FBvlvsti3QOjyEw2Bn
 VDGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760032741; x=1760637541;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PUjBG8W7JviM3Ypn5iExypGYjiK1aXkryX0lsVYOg2Q=;
 b=O4YCesSvFXZdfR/E2NMZaHaKuCYlgbzDQ+QBHDVX+hPR6aqq2ms2l5wsofTECPDNet
 BNh4qeTBeeYZXrwR2wl0+aLfi9IeY/q1g6ZJ4llpywr0tv+6Zudk5dN/8cBwEopi+Oqn
 g9GZYhXV+dIheW9KNExQsGnpWnaiXuaEsp0bk0g2DdNmjm96CACOwKZC7qYD0AeAWKVW
 dVJ9MSEfjC0fGLX90b+aCssrDB6QhP8u3kXrkjqkNfF4kFN0kzmTE2qkmFVvtWaDjC8X
 82EBlLjgJ2b0/MSQBGw28h6id57b4nvCBIK44t2WyRgvMuscyuBtdd04Cg2BvuhyOmPm
 on2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZxG+Q3e+Tdu3KoqnxO+6DfU6qLlgvYECtMwMVqjQ3hhOOyOUu5aevqCBDxkz20lvcN7Tf1LducHdpOSi+@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxcm3YBTO8LVBGhHCqwIlFwyIlJ7u4Fj7VQT76rNmKlSbnNDDUC
 o0XgN5M83fLFkvO0EtoopMKGWzcI4He7tjE6331sSf/JMRKs8inSIB8n
X-Gm-Gg: ASbGncts0g68PG1E6Bs45fwma6FwNKOX2FuoI59oyqwSrkeAQaip3p9mrd5W4xEkAru
 NxhOfV4c8DLWxqRdvYe9DF3TqK0hIldyiqEYAIK+Z6f5aFZZ2qTZU/TDPtWJf0zbEV0EcLHAHAM
 /rz3BTBx/QFolj4vnE96HL34oAX/Z/OX1t3jbO7qiUn27jUdgF/NNIARlhLE5hbVdVHz/BZK9/R
 UR86XW0AsHz4K6v8VLsvk8RkDACgVvlvThFO+BueFhdi6+vWZRAQt1joPWaYnWVeNUQoW4k+b7+
 Kk0tHaDWcquVDHUDqCDpPfCa/FW575JAfiu0IGGex7lOWmdftBs59yNYahc0s44WFPb8h9MPXgp
 n9dcBWl6efi0t+EtKVybP4HUEBcL5M7xyoNUQq8HJW5+/umJjz9hGt41F/EZ8G1rkSzpsJeWfJw
 pwUy8W3NQpGqlAj2PH9I6DIHbUsnGpTGkFkerE9A==
X-Google-Smtp-Source: AGHT+IEs4KDkEu/Tkx7PA7Q0xJUK7cMMLKchJ3R9IgY6/hfuRIJ7D8MjEdR+TiVWsfUwI1oIJ916bw==
X-Received: by 2002:a05:6e02:1fc4:b0:427:d82b:1f36 with SMTP id
 e9e14a558f8ab-42f874010aemr82928145ab.32.1760032740923; 
 Thu, 09 Oct 2025 10:59:00 -0700 (PDT)
Received: from godzilla.raven-morpho.ts.net
 (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-58f7200c4afsm30256173.35.2025.10.09.10.59.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 10:59:00 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com
Cc: gregkh@linuxfoundation.org, ukaszb@chromium.org, louis.chauvet@bootlin.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v5 13/30] dyndbg: DECLARE_DYNDBG_CLASSMAP needs stub defn
Date: Thu,  9 Oct 2025 11:58:17 -0600
Message-ID: <20251009175834.1024308-14-jim.cromie@gmail.com>
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

Add a DECLARE_DYNDBG_CLASSMAP stub/do-nothing defn, so that callers
will compile properly with CONFIG_DYNAMIC_DEBUG=n

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 39 ++++++++++++++++++-----------------
 1 file changed, 20 insertions(+), 19 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index e458d4b838ac..2a6ebc3c1459 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -91,25 +91,6 @@ struct ddebug_class_map {
 	enum class_map_type map_type;
 };
 
-/**
- * DECLARE_DYNDBG_CLASSMAP - declare classnames known by a module
- * @_var:   a struct ddebug_class_map, passed to module_param_cb
- * @_type:  enum class_map_type, chooses bits/verbose, numeric/symbolic
- * @_base:  offset of 1st class-name. splits .class_id space
- * @classes: class-names used to control class'd prdbgs
- */
-#define DECLARE_DYNDBG_CLASSMAP(_var, _maptype, _base, ...)		\
-	static const char *_var##_classnames[] = { __VA_ARGS__ };	\
-	static struct ddebug_class_map __aligned(8) __used		\
-		__section("__dyndbg_classes") _var = {			\
-		.mod = THIS_MODULE,					\
-		.mod_name = KBUILD_MODNAME,				\
-		.base = _base,						\
-		.map_type = _maptype,					\
-		.length = ARRAY_SIZE(_var##_classnames),		\
-		.class_names = _var##_classnames,			\
-	}
-
 /* encapsulate linker provided built-in (or module) dyndbg data */
 struct _ddebug_info {
 	struct _ddebug *descs;
@@ -134,6 +115,25 @@ struct ddebug_class_param {
 #if defined(CONFIG_DYNAMIC_DEBUG) || \
 	(defined(CONFIG_DYNAMIC_DEBUG_CORE) && defined(DYNAMIC_DEBUG_MODULE))
 
+/**
+ * DECLARE_DYNDBG_CLASSMAP - declare classnames known by a module
+ * @_var:   a struct ddebug_class_map, passed to module_param_cb
+ * @_type:  enum class_map_type, chooses bits/verbose, numeric/symbolic
+ * @_base:  offset of 1st class-name. splits .class_id space
+ * @classes: class-names used to control class'd prdbgs
+ */
+#define DECLARE_DYNDBG_CLASSMAP(_var, _maptype, _base, ...)		\
+	static const char *_var##_classnames[] = { __VA_ARGS__ };	\
+	static struct _ddebug_class_map __aligned(8) __used		\
+		__section("__dyndbg_classes") _var = {			\
+		.mod = THIS_MODULE,					\
+		.mod_name = KBUILD_MODNAME,				\
+		.base = _base,						\
+		.map_type = _maptype,					\
+		.length = ARRAY_SIZE(_var##_classnames),		\
+		.class_names = _var##_classnames,			\
+	}
+
 extern __printf(2, 3)
 void __dynamic_pr_debug(struct _ddebug *descriptor, const char *fmt, ...);
 
@@ -300,6 +300,7 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
 
 #define DEFINE_DYNAMIC_DEBUG_METADATA(name, fmt)
 #define DYNAMIC_DEBUG_BRANCH(descriptor) false
+#define DECLARE_DYNDBG_CLASSMAP(_var, _maptype, _base, ...)
 
 #define dynamic_pr_debug(fmt, ...)					\
 	no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
-- 
2.51.0

