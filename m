Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3839ABCA7A4
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 09 Oct 2025 19:59:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16EBA10EAEA;
	Thu,  9 Oct 2025 17:59:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="URlOWQQk";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
 [209.85.166.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E32910EAE8
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  9 Oct 2025 17:59:15 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id
 ca18e2360f4ac-9298eba27c2so55786439f.3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 09 Oct 2025 10:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760032754; x=1760637554; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vj6+/m+YvJ4nvGYtValsKBvS5LCfNDkFuITQxB3i5qw=;
 b=URlOWQQkhIzy+xOcdPp0QCKRMdb2vx82+AOolJYcPMKUPeaWdRCeiayqA7sy8mZPus
 h/cymNWNsmP6d3lusCKbo7p7Nl4nzTPdDHVH7bUVz2zpDasQeSOpwQjh78QNa+GyjywA
 S1l2Hq1eciO8VOb2CN7ItHjWpLnQANrllyLgdbgPDOqH2T80Qx26uRmtCtAnr9yAX+QB
 84whM33reLdXwzKhAnYA5uC4EnlIN6NRIPg7SeHkSAHgDQo0eXRofLYAcuiNTL5cxb/f
 GFh3VMsc7RZ2E/LJmXzxGzZqE63d9okYkZhQGKLIUoFLEd0CgASITJfX7Ajdz8/wAYj+
 AOmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760032754; x=1760637554;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vj6+/m+YvJ4nvGYtValsKBvS5LCfNDkFuITQxB3i5qw=;
 b=qJ0WA36vRtshfnrCj+qv9Yjm7/mSBVMgUwRYqd/knO8FKgm7jEWTw/nMDE48XFRGaX
 iBq5Bl8Q+wNeiEWiUY97LpEnD6xhW3twVYt5hphfoZy/FPvVM3pk/DTIj/YL3ECExgvP
 ++mZgLNkagbCPbkV33m6CjZkNrHGuk8Axt5mQB6dZvwdPvFOczV7oft0fADFyA8u/WzN
 sAjL4ACk6uqSjx8Td5rlMyjGhjmLDso6+AS1R963HgdTyNBrB/9U3jUbeeCTSr2uTyfm
 XHss7OLCYE34RzITSxcx1B26OYB3E+rVbq+6VuQ9QAtfWMmttCNDIMhPJnIAXn+x8rSi
 Jrww==
X-Forwarded-Encrypted: i=1;
 AJvYcCULVDwllRP1Ntm2EHQNZcRkZSSkIpND/ReVdRgp9PwFiZbz+uep5JrphgNzlarukgIZZUTjB5DPZ3IY/re4@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw5AObp6aLFe/67kWPuQ/foD4ZI8eyB5PvwaujB5QjUXILMOlVC
 ++KgaNd3rUL1yH/h191vv1xz4Bn3SZB0ybp2h1Ew5k4hPdcJycL7j5KG
X-Gm-Gg: ASbGncuA1+jIRammZ/hHWNMYu7N6ELa9woAZ4s3PHMPqhlTzpPn4PcMkcjnWqMyniKV
 volPcArHMlNd1os6DqEjn86AblsqGBIhuKefvs25SHEWsjGWLeQZMmx9n0EXKpTonjFITc9c1f9
 S/W99Vqwj5xBgaB29y54djbkim+o0+NMwbvLIHDP8Jxv7ZnX7PXj+tQd78UyyZCfifGLWPtzCkM
 PvFVJmTwY545MgRwD/w8Li6jxnYrhed61gwW7r4i5SiJNJAA9Dnpz7F4YGVkEIaxU9J8Hw73iei
 pr0IKSShrorjKF3XjBca/pkUas3czZ2/vmjYkf0eTqiBKx/qtlV/Np0gvCGUqUG7YRpD2b1ppqu
 uQJwx/mPGDUJv9IsGjYIhp7CjVb84P1Tw5rWXyQaPjEEl/S6koEIkeWJo5pCBvqT7Crc0ZFU2aZ
 0p/3exxqMd/pLOxqZE33Xj0UvRHnoCo5Pb4V4oLQ==
X-Google-Smtp-Source: AGHT+IF1wlfvaIMMrTodeuYFfX2PbnlKbpq3sHn29eEPjyMIjYw6+Qq5SpudC+MM1kOs5ShBVQ7J2g==
X-Received: by 2002:a05:6602:2b0e:b0:912:5455:f0b0 with SMTP id
 ca18e2360f4ac-93bd188eab3mr968983239f.9.1760032754468; 
 Thu, 09 Oct 2025 10:59:14 -0700 (PDT)
Received: from godzilla.raven-morpho.ts.net
 (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-58f7200c4afsm30256173.35.2025.10.09.10.59.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 10:59:14 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com
Cc: gregkh@linuxfoundation.org, ukaszb@chromium.org, louis.chauvet@bootlin.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v5 25/30] dyndbg: treat comma as a token separator
Date: Thu,  9 Oct 2025 11:58:29 -0600
Message-ID: <20251009175834.1024308-26-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251009175834.1024308-1-jim.cromie@gmail.com>
References: <20251009175834.1024308-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Treat comma as a token terminator, just like a space.  This allows a
user to avoid quoting hassles when spaces are otherwise needed:

 :#> modprobe drm dyndbg=class,DRM_UT_CORE,+p\;class,DRM_UT_KMS,+p

or as a boot arg:

 drm.dyndbg=class,DRM_UT_CORE,+p  # todo: support multi-query here

Given the many ways a boot-line +args can be assembled and then passed
in/down/around shell based tools, this may allow side-stepping all
sorts of quoting hassles thru those layers.

existing query format:

 modprobe test_dynamic_debug dyndbg="class D2_CORE +p"

new format:

 modprobe test_dynamic_debug dyndbg=class,D2_CORE,+p

ALSO

selftests-dyndbg: add comma_terminator_tests

New fn validates parsing and effect of queries using combinations of
commas and spaces to delimit the tokens.

It manipulates pr-debugs in builtin module/params, so might have deps
I havent foreseen on odd configurations.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Co-developed-by: Łukasz Bartosik <ukaszb@chromium.org>
Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>
---
- skip comma tests if no builtins
-v3 squash in tests and doc
---
 .../admin-guide/dynamic-debug-howto.rst       |  9 +++++---
 lib/dynamic_debug.c                           | 17 +++++++++++----
 .../dynamic_debug/dyndbg_selftest.sh          | 21 ++++++++++++++++++-
 3 files changed, 39 insertions(+), 8 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index 63a511f2337b..e2dbb5d9b314 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -78,11 +78,12 @@ Command Language Reference
 ==========================
 
 At the basic lexical level, a command is a sequence of words separated
-by spaces or tabs.  So these are all equivalent::
+by spaces, tabs, or commas.  So these are all equivalent::
 
   :#> ddcmd file svcsock.c line 1603 +p
   :#> ddcmd "file svcsock.c line 1603 +p"
   :#> ddcmd '  file   svcsock.c     line  1603 +p  '
+  :#> ddcmd file,svcsock.c,line,1603,+p
 
 Command submissions are bounded by a write() system call.
 Multiple commands can be written together, separated by ``;`` or ``\n``::
@@ -167,9 +168,11 @@ module
     The given string is compared against the module name
     of each callsite.  The module name is the string as
     seen in ``lsmod``, i.e. without the directory or the ``.ko``
-    suffix and with ``-`` changed to ``_``.  Examples::
+    suffix and with ``-`` changed to ``_``.
 
-	module sunrpc
+    Examples::
+
+	module,sunrpc	# with ',' as token separator
 	module nfsd
 	module drm*	# both drm, drm_kms_helper
 
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 9ae2d6458a99..b05d186e78a1 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -299,6 +299,14 @@ static int ddebug_change(const struct ddebug_query *query, struct flag_settings
 	return nfound;
 }
 
+static char *skip_spaces_and_commas(const char *str)
+{
+	str = skip_spaces(str);
+	while (*str == ',')
+		str = skip_spaces(++str);
+	return (char *)str;
+}
+
 /*
  * Split the buffer `buf' into space-separated words.
  * Handles simple " and ' quoting, i.e. without nested,
@@ -312,8 +320,8 @@ static int ddebug_tokenize(char *buf, char *words[], int maxwords)
 	while (*buf) {
 		char *end;
 
-		/* Skip leading whitespace */
-		buf = skip_spaces(buf);
+		/* Skip leading whitespace and comma */
+		buf = skip_spaces_and_commas(buf);
 		if (!*buf)
 			break;	/* oh, it was trailing whitespace */
 		if (*buf == '#')
@@ -329,7 +337,7 @@ static int ddebug_tokenize(char *buf, char *words[], int maxwords)
 				return -EINVAL;	/* unclosed quote */
 			}
 		} else {
-			for (end = buf; *end && !isspace(*end); end++)
+			for (end = buf; *end && !isspace(*end) && *end != ','; end++)
 				;
 			if (end == buf) {
 				pr_err("parse err after word:%d=%s\n", nwords,
@@ -601,7 +609,8 @@ static int ddebug_exec_queries(char *query, const char *modname)
 		if (split)
 			*split++ = '\0';
 
-		query = skip_spaces(query);
+		query = skip_spaces_and_commas(query);
+
 		if (!query || !*query || *query == '#')
 			continue;
 
diff --git a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
index 465fad3f392c..c7bf521f36ee 100755
--- a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
+++ b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
@@ -216,7 +216,7 @@ function check_err_msg() {
 function basic_tests {
     echo -e "${GREEN}# BASIC_TESTS ${NC}"
     if [ $LACK_DD_BUILTIN -eq 1 ]; then
-	echo "SKIP"
+	echo "SKIP - test requires params, which is a builtin module"
 	return
     fi
     ddcmd =_ # zero everything
@@ -238,8 +238,27 @@ EOF
     ddcmd =_
 }
 
+function comma_terminator_tests {
+    echo -e "${GREEN}# COMMA_TERMINATOR_TESTS ${NC}"
+    if [ $LACK_DD_BUILTIN -eq 1 ]; then
+	echo "SKIP - test requires params, which is a builtin module"
+	return
+    fi
+    # try combos of spaces & commas
+    check_match_ct '\[params\]' 4 -r
+    ddcmd module,params,=_		# commas as spaces
+    ddcmd module,params,+mpf		# turn on module's pr-debugs
+    check_match_ct =pmf 4
+    ddcmd ,module ,, ,  params, -p
+    check_match_ct =mf 4
+    ddcmd " , module ,,, ,  params, -m"	#
+    check_match_ct =f 4
+    ddcmd =_
+}
+
 tests_list=(
     basic_tests
+    comma_terminator_tests
 )
 
 # Run tests
-- 
2.51.0

