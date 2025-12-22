Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 268DECD4FC9
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 22 Dec 2025 09:23:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1379210E56A;
	Mon, 22 Dec 2025 08:23:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gHiTSc64";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4009610E56A
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 22 Dec 2025 08:23:11 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-7b8eff36e3bso5830528b3a.2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 22 Dec 2025 00:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766391791; x=1766996591; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kB9XGvfi6ObodyigSZBf40IoYnb1xkrL/FFwh/sfSnM=;
 b=gHiTSc64Jz/bR3RGyWQTdqByafuxJY7KFtVwpgzwWLXI0XVOgMzjLLd20kGjkiiHDN
 7lMaz6Iri1oAYhthAEQKTh/LFvL0bgg06/FMiz8LngcfQEGaj/ul99lUVzfKDIqx4EcJ
 hK2BAtRkB7xez/cEsuOTkLsN+88MpnV/x++8n2dStjMdZCnUvWAK3zkVPqmXTQ/1xtdP
 GwYw3XlYF00cY/YWF+X1/nCG/oKxQv7ckG6rajhJDPcFB0CiWrdniHebBmG/vrU6qo2m
 jUNqTfc9rvOZIL8EjB8TKwgbQp/vx7mO3h9zBmcZ/V2/EMIiN0Lzr729gpLHGSzTt1+w
 t5Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766391791; x=1766996591;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kB9XGvfi6ObodyigSZBf40IoYnb1xkrL/FFwh/sfSnM=;
 b=tsInN8dShHl7DpDkJZAWSLXMGgGak2kvfWaTTxiH1CxayzsPxQZGh9cmQ/M2Wou1gs
 6Hz01aKJxwLyYNlIcn07eTEpZzfK6UGNpAZLhh/miKxsTTbuALiIm1kkNsCJMwPwMkAN
 UwZIeH1TMm4aH41KtVIzsu76Brho5+JMaXUUIGgzUdoVBZZ+jjjU/0/TmCzmuvy7YVpv
 Rpiseu0hhYGmnLSva1zMgp8cymXD0ScHVqe0tt7RodhZMlhX08AbW74a/JKkT3824byI
 nfLLjdieQ43yEWgdcVXNjF+6l80PcV388cvRv0LFpSIPsUC0fUdPzD6gYk3wt4SgSq8L
 CY2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdUhyB2wTnX8jcOQoBJeUpwm1tfvBpUd52HhDNuSDUU1vkUH7WeksvipUKsP8RukWtwmmwg6cCY9SY/Mau@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxbXOlbRzLv90cOpc5Xtr8f9+yrVNVjpNtAKGNtS1TDw2OKVZAC
 whNDihKPmg+shgwCvAvss7iXAp3LHBBJ4NQkZumNNvjOxtBxF9t1vtXfEHSQEo9RzgM=
X-Gm-Gg: AY/fxX45qVsKGDe50VmDBEb75RFU5Z1Qy1ei7aLzZkihV2VGx7UOg7N0cjy7BEKB+cO
 Q1hxKRkK9XcPnRa5pKbd8hxoXidm4MmpM/4XZE7kp9jt2/XYbSVgl80xP4RPfeoKPDb8V3fekcp
 jqIxJcbapN1/zFsAVehrsOfm69RkDjsUme+lnoWDOs03BZ6FaJ+kEm6Qe80OvD52mkZc5sueev4
 NmUFlF2wXi+aASE7mObE/vkjspUy6SF1akL4K26bWqcwfDcSQNBNd4eLyzHTGXUmXhUFczd/O16
 quV36yQRJMVI+lSui24eXLvcQeBSW0A1dspYWkkUzP6PTvCnTARtAreawTo/jXoEGIz9J8YcP7D
 4D/kkVsZaSTZM845UpFz/b35otmBzMcinPGsaWSha5jDEndI0c7g55AvUUc0NC7wl3//HRMWlwG
 0kS/410vae
X-Google-Smtp-Source: AGHT+IGznpKTz6ixXv+s26nHooFtLIG4Ke1AWMjy0/WKJaDBXTq6iXxKo6TPfotRdJtMkjnB8IbN1A==
X-Received: by 2002:a05:6a20:b905:b0:366:14b0:1a3b with SMTP id
 adf61e73a8af0-376ab2e4dd1mr7445280637.73.1766391790723; 
 Mon, 22 Dec 2025 00:23:10 -0800 (PST)
Received: from frodo ([2404:4400:417e:3d00:8b90:7f55:1261:772f])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-7ff7e493123sm9540699b3a.50.2025.12.22.00.22.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Dec 2025 00:23:10 -0800 (PST)
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
Subject: [PATCH v7 10/31] dyndbg: reduce verbose/debug clutter
Date: Mon, 22 Dec 2025 21:20:27 +1300
Message-ID: <20251222082049.1782440-11-jim.cromie@gmail.com>
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

currently, for verbose=3, these are logged (blank lines for clarity):

 dyndbg: query 0: "class DRM_UT_CORE +p" mod:*
 dyndbg: split into words: "class" "DRM_UT_CORE" "+p"

 dyndbg: op='+'
 dyndbg: flags=0x1
 dyndbg: *flagsp=0x1 *maskp=0xffffffff

 dyndbg: parsed: func="" file="" module="" format="" lineno=0-0 class=...
 dyndbg: no matches for query
 dyndbg: no-match: func="" file="" module="" format="" lineno=0-0 class=...
 dyndbg: processed 1 queries, with 0 matches, 0 errs

That is excessive, so this patch:
 - shrinks 3 lines of 2nd stanza to single line
 - drops 1st 2 lines of 3rd stanza
   3rd line is like 1st, with result, not procedure.
   2nd line is just status, retold in 4th, with more info.

New output:

 dyndbg: query 0: "class DRM_UT_CORE +p" mod:*
 dyndbg: split into words: "class" "DRM_UT_CORE" "+p"
 dyndbg: op='+' flags=0x1 *flagsp=0x1 *maskp=0xffffffff
 dyndbg: no-match: func="" file="" module="" format="" lineno=0-0 class=...
 dyndbg: processed 1 queries, with 0 matches, 0 errs

Also reduce verbose=3 messages in ddebug_add_module

When modprobing a module, dyndbg currently logs/says "add-module", and
then "skipping" if the module has no prdbgs.  Instead just check 1st
and return quietly.

no functional change

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 21c1db7e8705..1db2f627237a 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -275,9 +275,6 @@ static int ddebug_change(const struct ddebug_query *query,
 	}
 	mutex_unlock(&ddebug_lock);
 
-	if (!nfound && verbose)
-		pr_info("no matches for query\n");
-
 	return nfound;
 }
 
@@ -510,7 +507,6 @@ static int ddebug_parse_flags(const char *str, struct flag_settings *modifiers)
 		pr_err("bad flag-op %c, at start of %s\n", *str, str);
 		return -EINVAL;
 	}
-	v3pr_info("op='%c'\n", op);
 
 	for (; *str ; ++str) {
 		for (i = ARRAY_SIZE(opt_array) - 1; i >= 0; i--) {
@@ -524,7 +520,6 @@ static int ddebug_parse_flags(const char *str, struct flag_settings *modifiers)
 			return -EINVAL;
 		}
 	}
-	v3pr_info("flags=0x%x\n", modifiers->flags);
 
 	/* calculate final flags, mask based upon op */
 	switch (op) {
@@ -540,7 +535,7 @@ static int ddebug_parse_flags(const char *str, struct flag_settings *modifiers)
 		modifiers->flags = 0;
 		break;
 	}
-	v3pr_info("*flagsp=0x%x *maskp=0x%x\n", modifiers->flags, modifiers->mask);
+	v3pr_info("op='%c' flags=0x%x maskp=0x%x\n", op, modifiers->flags, modifiers->mask);
 
 	return 0;
 }
@@ -550,7 +545,7 @@ static int ddebug_exec_query(char *query_string, const char *modname)
 	struct flag_settings modifiers = {};
 	struct ddebug_query query = {};
 #define MAXWORDS 9
-	int nwords, nfound;
+	int nwords;
 	char *words[MAXWORDS];
 
 	nwords = ddebug_tokenize(query_string, words, MAXWORDS);
@@ -568,10 +563,7 @@ static int ddebug_exec_query(char *query_string, const char *modname)
 		return -EINVAL;
 	}
 	/* actually go and implement the change */
-	nfound = ddebug_change(&query, &modifiers);
-	vpr_info_dq(&query, nfound ? "applied" : "no-match");
-
-	return nfound;
+	return ddebug_change(&query, &modifiers);
 }
 
 /* handle multiple queries in query string, continue on error, return
@@ -1245,11 +1237,10 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 {
 	struct ddebug_table *dt;
 
-	v3pr_info("add-module: %s.%d sites\n", modname, di->num_descs);
-	if (!di->num_descs) {
-		v3pr_info(" skip %s\n", modname);
+	if (!di->num_descs)
 		return 0;
-	}
+
+	v3pr_info("add-module: %s %d sites\n", modname, di->num_descs);
 
 	dt = kzalloc(sizeof(*dt), GFP_KERNEL);
 	if (dt == NULL) {
-- 
2.52.0

