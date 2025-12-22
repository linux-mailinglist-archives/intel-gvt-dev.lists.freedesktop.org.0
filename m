Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B1BCD5042
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 22 Dec 2025 09:24:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FB5610E5B2;
	Mon, 22 Dec 2025 08:24:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="m7KOn1xG";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6E7510E5C0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 22 Dec 2025 08:24:16 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id
 d2e1a72fcca58-7b22ffa2a88so3428758b3a.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 22 Dec 2025 00:24:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766391856; x=1766996656; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=saj8Myj0AXkSu5hKZJBWN47Kb5BefKCe0HbhKcuaxLQ=;
 b=m7KOn1xGvQ8/XLBWUvkCpZWyJD+8yeq2/SOReOwq5m4bFxGmJWXaGNOv4CdDYfF/nR
 536KqDc4QG07wyi1Vs1YfA1qc5S/Ab9kGxZI1PAyw5UXmJ3rV4nDAHL96lc3j9EQLGVF
 lOtDyrFwltKWN7Eyz3vAaaYEToUvnodwt8c6DbLGvUhDGuX5otnQv51Y4NShu6sRR2Z1
 V3KChsGAJ6fII+zH1bpD0PoArEsi9IgDQF3iQHUv6g+MLPmcRDOpE7SfrbP3SecP9ATQ
 PTsqg5AaucEpDTTkT21Yx46e/lt8MQ9Zs/dDdxNzhwznxSoEn66xXrLqBCQKrJyO4cYM
 +Q4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766391856; x=1766996656;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=saj8Myj0AXkSu5hKZJBWN47Kb5BefKCe0HbhKcuaxLQ=;
 b=fftTvtl/npC4CUMJXVm+4y3HNPRr5j+GL09jeJTfs6adaMTF1ZEblnVSRT4t7DxxoD
 PxM2PITNlG/2xm6TMZ5TI/vuzyMzYMd9qjh1W51N+7XrL59jrxXmdiQntyj8AEFm0zDK
 v+/uNnLRlAF+UtjM3Jfv6zyRRk2AV0FyOfaknB6hg8JYKTsI0ivqacEZwHL35NFDnqoL
 bRB6y0vLR4GbcsEHsUKE2epi3TnaCVBPEvKuY0lppEXGYvK60rG9+wJx9xtDHvu7KAUx
 Ze2Oc2Wo8Mw6mv4+GPyYVFKqzWtZVM4BxxO5NQhm9OQ5M0Ii7sMvTqWQD3o6NBSrJB5m
 eeMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmCKUccp2+MCpc5eLBjoCipYchpePO/c3HlVaWHNkgrea+rn6rxp4LqfbyWwQEH9Kl32DSE+Yjnacq8HLJ@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy0qjVIXWYH+4dgs2h59nZG4zFiDt3XeZTRdcC+1anmUjMkh0wM
 qGNbTEtUVIQ9fXSfsCkopdA8GPP4hgzPZoDt9XBzDn9iQgiH8npBcC5Z
X-Gm-Gg: AY/fxX7z7cRfOijVTc/rYM0a7rhG7bZl1Wq/mfidiAKoreCWf2s/nMXiiuaiGzIWWHC
 O7QCqtylTY1NHnB4GL4U91TFLBtth8OHssBhHBMA3lc2nJBinvTLQn+p8vToeF8/V1rYNktxg8m
 J9WlMDPqRLPxWN3kWmd4iZJjo+OMZA9iO3fWfyuXL2WjzOh1WNSlcupr6To1O1kuBVFaU+6SuQ1
 1CLuRgMXunQ96WMNo2CWoNDxqniAxWzXtlUbEjjoq05fdIwKRfmCiQyg0mkfRaMpyRqn4WHO6il
 t2sQ1Jzr35foh994XFzR/fgkT19JPvHov7vyAu6xBps4BUp9LPlGwmC902vtXYPSfA1RAoeWcBW
 1NaYqDzPi0tp59rzGJVO71xKH6ZUslOB1qiH/WnzLqzZXvtiEwMWZ9ZbL+Vy+PcKX8fSA/DR/nY
 2XRRl2vsBn
X-Google-Smtp-Source: AGHT+IHhfCBl2Gb658Wb5nP4VimtUGUrU6/VY0t3P4zkMX/95OPPHKG9Ys2L2e1xsI+aRFKPN12sQg==
X-Received: by 2002:a05:6a20:9189:b0:366:14ac:8c6c with SMTP id
 adf61e73a8af0-376ab2e8f52mr9605414637.66.1766391856304; 
 Mon, 22 Dec 2025 00:24:16 -0800 (PST)
Received: from frodo ([2404:4400:417e:3d00:8b90:7f55:1261:772f])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-7ff7e493123sm9540699b3a.50.2025.12.22.00.24.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Dec 2025 00:24:15 -0800 (PST)
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
Subject: [PATCH v7 16/31] dyndbg: hoist classmap-filter-by-modname up to
 ddebug_add_module
Date: Mon, 22 Dec 2025 21:20:33 +1300
Message-ID: <20251222082049.1782440-17-jim.cromie@gmail.com>
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

The body of ddebug_attach_module_classes() is dominated by a
code-block that finds the contiguous subrange of classmaps matching on
modname, and saves it into the ddebug_table's info record.

Implement this block in a macro to accommodate different component
vectors in the "box" (as named in the for_subvec macro).  We will
reuse this macro shortly.

And hoist its invocation out of ddebug_attach_module_classes() up into
ddebug_add_module().  This moves the filtering step up closer to
dynamic_debug_init(), which already segments the builtin pr_debug
descriptors on their mod_name boundaries.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
reordered params to match kdoc
---
 lib/dynamic_debug.c | 57 ++++++++++++++++++++++++++-------------------
 1 file changed, 33 insertions(+), 24 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index c9377a444fc8..d668140794ac 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -170,8 +170,8 @@ static void vpr_info_dq(const struct ddebug_query *query, const char *msg)
 }
 
 static struct _ddebug_class_map *ddebug_find_valid_class(struct ddebug_table const *dt,
-							const char *class_string,
-							int *class_id)
+							 const char *class_string,
+							 int *class_id)
 {
 	struct _ddebug_class_map *map;
 	int i, idx;
@@ -1247,30 +1247,35 @@ static const struct proc_ops proc_fops = {
 
 static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug_info *di)
 {
-	struct _ddebug_class_map *cm;
-	int i, nc = 0;
-
-	/*
-	 * Find this module's classmaps in a subrange/wholerange of
-	 * the builtin/modular classmap vector/section.  Save the start
-	 * and length of the subrange at its edges.
-	 */
-	for_subvec(i, cm, di, maps) {
-		if (!strcmp(cm->mod_name, dt->mod_name)) {
-			if (!nc) {
-				v2pr_info("start subrange, class[%d]: module:%s base:%d len:%d ty:%d\n",
-					  i, cm->mod_name, cm->base, cm->length, cm->map_type);
-				dt->info.maps.start = cm;
-			}
-			nc++;
-		}
-	}
-	if (nc) {
-		dt->info.maps.len = nc;
-		vpr_info("module:%s attached %d classes\n", dt->mod_name, nc);
-	}
+	vpr_info("module:%s attached %d classes\n", dt->mod_name, dt->info.maps.len);
 }
 
+/*
+ * Walk the @_box->@_vec member, over @_vec.start[0..len], and find
+ * the contiguous subrange of elements matching on ->mod_name.  Copy
+ * the subrange into @_dst.  This depends on vars defd by caller.
+ *
+ * @_i:   caller provided counter var, init'd by macro
+ * @_sp:  cursor into @_vec.
+ * @_box: contains member named @_vec
+ * @_vec: member-name of a type with: .start .len fields.
+ * @_dst: an array-ref: to remember the module's subrange
+ */
+#define dd_mark_vector_subrange(_i, _sp, _box, _vec, _dst) ({		\
+	typeof(_dst) __dst = (_dst);					\
+	int __nc = 0;							\
+	for_subvec(_i, _sp, _box, _vec) {				\
+		if (!strcmp((_sp)->mod_name, (_dst)->mod_name)) {	\
+			if (!__nc++)					\
+				(__dst)->info._vec.start = (_sp);	\
+		} else {						\
+			if (__nc)					\
+				break; /* end of consecutive matches */ \
+		}							\
+	}								\
+	(__dst)->info._vec.len = __nc;					\
+})
+
 /*
  * Allocate a new ddebug_table for the given module
  * and add it to the global list.
@@ -1278,6 +1283,8 @@ static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug
 static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 {
 	struct ddebug_table *dt;
+	struct _ddebug_class_map *cm;
+	int i;
 
 	if (!di->descs.len)
 		return 0;
@@ -1300,6 +1307,8 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 
 	INIT_LIST_HEAD(&dt->link);
 
+	dd_mark_vector_subrange(i, cm, di, maps, dt);
+
 	if (di->maps.len)
 		ddebug_attach_module_classes(dt, di);
 
-- 
2.52.0

