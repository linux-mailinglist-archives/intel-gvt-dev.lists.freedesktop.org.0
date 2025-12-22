Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4E5CD5030
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 22 Dec 2025 09:23:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 808D210E584;
	Mon, 22 Dec 2025 08:23:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Dizjst5Y";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F39A10E5AD
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 22 Dec 2025 08:23:55 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-7b7828bf7bcso4177356b3a.2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 22 Dec 2025 00:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766391835; x=1766996635; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BxdE6+GTYqwM0IzjlMegZ9h6k5RpMRRS5FRcIzbLHHk=;
 b=Dizjst5YkRAOA4AWgg+6fny+EUjUYCxpEsJkWj468HHPXbqusYemavsYp0X0e0i07+
 67bLa2XngCo+Gn1W91k2V6hmWxKtvMDoF8yqHT5jvz+SmX6ht4FpvBwbNbBhxqJG/tyl
 nKgqrMpGMqM93DGQYUtkDcgFw51x4Rv/1Y1hp23gGxAnIfgidPKVUdwXEp08JzYm0M6b
 C66KJQUhW74w3XZcGMIaSqvkn+vrVnysRV6frbQEkF1XPkFIWgZH3w5BQP+/6SvDyWzL
 Da7O19YhnxtiTALQMtdkoDAak2jLpIGOW9f31ZM/bwOrg+rO4ppx0afEvcd38++eF2o8
 oM+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766391835; x=1766996635;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BxdE6+GTYqwM0IzjlMegZ9h6k5RpMRRS5FRcIzbLHHk=;
 b=F3Ady28Y1ahTIYD4G9YEQBwPPEIWnO5M4WjNlRkPfX2p8Ikp0b4GrP6m05VyxF8+Js
 nsVqW3ElEErrg1TIcJQsMdR2TKHsyUKmod3GD9eWNTgMMcRJIx5eCNs0SzFiCB0GfskE
 c6ck6OvqASIAxqQyxLg27WGSTGhZvrhg6ZbIp2d8monoHQVN/VAmB9rlwWqHfpQtSg31
 H/Ua75faZx1BTIhzZf3nRMwqz7z1QH50zhDf5Hn9HBkpPcfUr50wB4a8wfhxjq1OW06V
 nb3NeguTHVC4491Mp5kzwacx6t5N54RhwcAAsJ5bXKMgdidV7vqVcH4wxDA1MtIpQNns
 0+xQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUvdS2gV5NKPumczP79oCZ5jpuTixvphV1FvW5TpgzlIRCesJSgFVRahAiTQlaPSTN1dK1jMyQoGOkhX+w@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyWfkyFP/e9E7AeBH5ySVdqdBF3cFWxYoYuCu5t364bEzjPNYXf
 stdq0+aNRp8e1LdKMIn8uLGr2addJO0FrbbdyhfK1ctfGI6Ky+mW1ahW
X-Gm-Gg: AY/fxX6UiWnsV1W4k8QSgofAgz2rqe29r/N+U7C8YRerRDKtFdINNodg06JKtUlaGeS
 M0i7wd6QUOGitZeGB4ULgqxT06UmWz95xgKB8HDlawU1uWplRvOkuefIQNdZ5RvA/46I/ioqGnE
 L0vjZueM4nPRVAqyfKHs6XxyVyYkw/SIdP4A3KKtr1Qy2c7PbuJ7rxviwaM7+r/01CmowtDwnyD
 MjAKqQW+gE07zRu28Bh2Wx10dDWvGbKDK+yoILVv+hnKujiTf9gFXDD2tHPTi41A3b1wfWmdYbW
 RGmiM3aE4trnuw9Rdm3K6YFX6bqQLVDNucW1UwZkblLkYSesfM54/tT48H7HIN8LVtI2ueNkdk1
 VnOZxYLtd2BwiaTVvTz2RCgnA3b3+7dooZJihSFwHbkhK6gCAqnWzhSXSSqYbWf1OwF6va3lzcc
 T5unASNVnq
X-Google-Smtp-Source: AGHT+IG3YmZUn1fIw8AIHp6/BoEQn6TWZyV7OX1XFc8bda2F0fMuKJyfzHy5p7UhK8SexT3coe1cvg==
X-Received: by 2002:a05:6a00:302a:b0:7a2:7458:7fc8 with SMTP id
 d2e1a72fcca58-7ff6421511amr9110070b3a.13.1766391834813; 
 Mon, 22 Dec 2025 00:23:54 -0800 (PST)
Received: from frodo ([2404:4400:417e:3d00:8b90:7f55:1261:772f])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-7ff7e493123sm9540699b3a.50.2025.12.22.00.23.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Dec 2025 00:23:54 -0800 (PST)
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
Subject: [PATCH v7 14/31] dyndbg: macrofy a 2-index for-loop pattern
Date: Mon, 22 Dec 2025 21:20:31 +1300
Message-ID: <20251222082049.1782440-15-jim.cromie@gmail.com>
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

dynamic-debug currently has 2 __sections (__dyndbg, __dyndb_classes),
struct _ddebug_info keeps track of them both, with 2 members each:
_vec and _vec#_len.

We need to loop over these sections, with index and record pointer,
making ref to both _vec and _vec_len.  This is already fiddly and
error-prone, and will get worse as we add a 3rd section.

Lets instead embed/abstract the fiddly-ness in the `for_subvec()`
macro, and avoid repeating it going forward.

This is a for-loop macro expander, so it syntactically expects to
precede either a single statement or a { block } of them, and the
usual typeof or do-while-0 tricks are unavailable to fix the
multiple-expansion warning.

The macro needs a lot from its caller: it needs 2 local vars, 1 of
which is a ref to a contained struct with named members.  To support
these requirements, add:

1. __ASSERT_IS_LVALUE(_X):
   ie: ((void)sizeof((void)0, &(x)))

2. __ASSERT_HAS_VEC_MEMBERS(_X, _Y):
   compile-time check that the _Y "vector" exists
   ie: _X->_Y and _X->num##_Y are lvalues.

The for_subvec() macro then invokes these before the for-loop itself;
they disappear at runtime.  They do cause a "complex macro" CHECK from
checkpatch --strict.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index e882e951d585..94d05d09a128 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -128,6 +128,28 @@ do {								\
 #define v3pr_info(fmt, ...)	vnpr_info(3, fmt, ##__VA_ARGS__)
 #define v4pr_info(fmt, ...)	vnpr_info(4, fmt, ##__VA_ARGS__)
 
+/*
+ * simplify a repeated for-loop pattern walking N steps in a T _vec
+ * member inside a struct _box.  It expects int i and T *_sp to be
+ * declared in the caller.
+ * @_i:  caller provided counter.
+ * @_sp: cursor into _vec, to examine each item.
+ * @_box: ptr to a struct containing @_vec member
+ * @_vec: name of a member in @_box
+ */
+#define __ASSERT_IS_LVALUE(x) ((void)sizeof((void)0, &(x)))
+#define __ASSERT_HAS_VEC_MEMBER(_box, _vec) ({	\
+	(void)sizeof((_box)->_vec);		\
+	(void)sizeof((_box)->num_##_vec);	\
+})
+#define for_subvec(_i, _sp, _box, _vec)			\
+	__ASSERT_IS_LVALUE(_i);				\
+	__ASSERT_IS_LVALUE(_sp);			\
+	__ASSERT_HAS_VEC_MEMBER(_box, _vec);		\
+	for ((_i) = 0, (_sp) = (_box)->_vec;		\
+	     (_i) < (_box)->num_##_vec;			\
+	     (_i)++, (_sp)++)
+
 static void vpr_info_dq(const struct ddebug_query *query, const char *msg)
 {
 	/* trim any trailing newlines */
@@ -155,7 +177,7 @@ static struct ddebug_class_map *ddebug_find_valid_class(struct ddebug_table cons
 	struct ddebug_class_map *map;
 	int i, idx;
 
-	for (map = dt->classes, i = 0; i < dt->num_classes; i++, map++) {
+	for_subvec(i, map, dt, classes) {
 		idx = match_string(map->class_names, map->length, class_string);
 		if (idx >= 0) {
 			*class_id = idx + map->base;
@@ -1231,8 +1253,7 @@ static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug
 	 * the builtin/modular classmap vector/section.  Save the start
 	 * and length of the subrange at its edges.
 	 */
-	for (cm = di->classes, i = 0; i < di->num_classes; i++, cm++) {
-
+	for_subvec(i, cm, di, classes) {
 		if (!strcmp(cm->mod_name, dt->mod_name)) {
 			if (!nc) {
 				v2pr_info("start subrange, class[%d]: module:%s base:%d len:%d ty:%d\n",
-- 
2.52.0

