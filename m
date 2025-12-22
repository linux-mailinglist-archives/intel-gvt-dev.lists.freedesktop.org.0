Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CD7CD5097
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 22 Dec 2025 09:27:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34BE210E5CC;
	Mon, 22 Dec 2025 08:27:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aBDnKzso";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D97810E541
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 22 Dec 2025 08:27:03 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-7f89d0b37f0so2291018b3a.0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 22 Dec 2025 00:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766392023; x=1766996823; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ii1VafhOMs6l+h1e+D2giL8132vNQ2TDoma8/MEoG3Y=;
 b=aBDnKzsot/puTa0IBp+hdHwMJxgfqNl/HWLUkJrEE9qnvnjQNSpVQrnuQUHJbNzHnv
 aGHeZ21gIndmrKwwLaQ/dW2/KoyUiamSjoj9PbPL7/42pR7nTnubj2QO5fYWouPSTOtg
 /yeJqVLkqxwYA2CH8HDvYuuCjGPikZD+SmyIY6T4vdQ6Q1EIUq/6GTT0naTtRJgoitN9
 GVCUpFyvwRvCAGIXXnNJR02m1SXEoB8i1sIpoqmyJ3jb5XUbVFS7sLOX6FcCHic0UJ+f
 XNKeZkLifxDgd8sPSUrZMZ+0b89tKNNCtpR7m8Q4mEIkrFFa6RKYIvJUKv1ujpVfiOjP
 Ae2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766392023; x=1766996823;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Ii1VafhOMs6l+h1e+D2giL8132vNQ2TDoma8/MEoG3Y=;
 b=V6UJx8gF7PoOOHP5kNw/9lbTb8n1dkZJ08oYNvsANHD+YYdw6LiHsBSdHFUbYeWJ6e
 b8nkmvAY1xrrAThhgynfXfX81E/LretnDuJJt7QFk3m6ams4NC/tIQ+irGaCvJtzZ5Jx
 KcI1olmwBulf/Dms6UuTn+/uD14kj/+Co9aIvVZC9sT7OwN1Q1A65Jxy3aU7YsjckFf9
 vBua9EaadbLdMJXUHtu+t5Z0+7X9ScMohOLXTYlI/a4ngi+mO3CTgPt8uiwVfFaJmXJR
 fqC+dgrgfyMo1NqOOkzkbe05R5llfo5E8oV0+lka0E8i/X/ZJ+w0ngOqwbgFlycF/AnF
 lc2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdUCUJFezG/g0FIkLvSMtpCyI/KeiKdayXRNvJJpanyXKh575tX2cbOS2kF9e6PpCGybNCTrdKX0ENB9eC@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzmj7O/tSRFSyMyyPKDZjWVQL1GWrPfAavt5fKtsgQM5JSccF2y
 5I3hlvrhMffHAeny5wFmGqJbIdEwkjWU9f4gqaHFF1DcRZ2y0Fp0Mo5O
X-Gm-Gg: AY/fxX5aQPAbfRg0ledV2uVecdoz5654izCO3SSfbfHn/mtUVCvPmEqm0Os7HC0gkKA
 EXdsyXwd2v4TnJYN5u1X8IMT2ZrrIKcKd7QUIUxqGU1XGzoI87PzO18EED1qZ5ZmcKT6GrvG+jo
 W0GWQ0GWihYzE3mXkKD14rLmOF48jiiTy1uPcGrRo2sQNJar7+dC7KQ0asHiupeV7UEj8nilM75
 DsB/RkuHpmszE8h4DPXdoTCLgK9WUTsl5ZrF6u8KonR9lLlLsDaYW7Y4gMKsAyekXPcmLKqF3wQ
 jqnWbd9IK0XQ9scGfrBxfUStNNnynnSHkvC0wGRhvTkwgSdICO6+c599GO/d66knLU9bEmGzsu2
 wkpvkYBiL/o/tRkcSqpW0EL+5sxwGfMkf9PiZuzabaqaTZPKFjNjuIi4kFIXc1xCn1PswWdz9Xy
 GpbRdSIL9V
X-Google-Smtp-Source: AGHT+IGofjncFQbha1D4YrfUNbCgds/xOaiZY5usf+asKdAPER694b234cYaH/K4SJMr8+Sv5Hw4Hw==
X-Received: by 2002:a05:6a20:3d0b:b0:366:14b0:4b1b with SMTP id
 adf61e73a8af0-3769ff1bb74mr10653684637.38.1766392022754; 
 Mon, 22 Dec 2025 00:27:02 -0800 (PST)
Received: from frodo ([2404:4400:417e:3d00:8b90:7f55:1261:772f])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-7ff7e493123sm9540699b3a.50.2025.12.22.00.26.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Dec 2025 00:27:02 -0800 (PST)
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
Subject: [PATCH v7 27/31] dyndbg: split multi-query strings with %
Date: Mon, 22 Dec 2025 21:20:44 +1300
Message-ID: <20251222082049.1782440-28-jim.cromie@gmail.com>
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

Since commit
85f7f6c0edb8 ("dynamic_debug: process multiple debug-queries on a line")

Multi-query commands have been allowed:

  modprobe drm dyndbg="class DRM_UT_CORE +p; class DRM_UT_KMS +p"
  modprobe drm dyndbg=<<EOX
     class DRM_UT_CORE +p
     class DRM_UT_KMS +p
  EOX

More recently, the need for quoting was avoided by treating a comma
like a space/token-terminator:

  modprobe drm dyndbg=class,DRM_UT_CORE,+p\;class,DRM_UT_KMS,+p

That works, but it needs the escaped semicolon, which is a shell
special-char (one of the bash control operators), so it is brittle
when passed in/down/around scripts.  In particular, it fails when
passed to vng (virtme-ng).

So this patch adds '%' to the existing ';' and '\n' multi-command
separators, which is more shell-friendly, so you can more fully avoid
quoting and escaping hassles.

NOTE: it does break format matching on '%' patterns:

bash-5.2# ddcmd 'format "find-me: %foo" +p'
[  203.900581] dyndbg: read 26 bytes from userspace
[  203.900883] dyndbg: query 0: "format "find-me: " mod:*
[  203.901118] dyndbg: unclosed quote: find-me:
[  203.901355] dyndbg: tokenize failed
[  203.901529] dyndbg: query 1: "foo" +p" mod:*
[  203.901957] dyndbg: split into words: "foo"" "+p"
[  203.902243] dyndbg: op='+' flags=0x1 maskp=0xffffffff
[  203.902458] dyndbg: expecting pairs of match-spec <value>
[  203.902703] dyndbg: query parse failed
[  203.902871] dyndbg: processed 2 queries, with 0 matches, 2 errs
bash: echo: write error: Invalid argument

The '%' splits the input into 2 queries, and both fail.  Given the
limited utility of matching against the working parts of a format
string "foo: %d bar %s", nothing is actually lost here.

selftests-dyndbg: test_percent_splitting

This does basic testing of classmaps using '%' separated
multi-queries.  It modprobes test_dynamic_debug with several classes
enabled, and counts to verify that the expected sites show the
enablement in the control file.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 .../admin-guide/dynamic-debug-howto.rst       |  8 ++++---
 lib/dynamic_debug.c                           |  2 +-
 .../dynamic_debug/dyndbg_selftest.sh          | 24 +++++++++++++++++++
 3 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index 350d93834e19..89ee15d7ae58 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -85,10 +85,12 @@ by spaces, tabs, or commas.  So these are all equivalent::
   :#> ddcmd '  file   svcsock.c     line  1603 +p  '
   :#> ddcmd file,svcsock.c,line,1603,+p
 
-Command submissions are bounded by a write() system call.
-Multiple commands can be written together, separated by ``;`` or ``\n``::
+Command submissions are bounded by a write() system call.  Multiple
+commands can be written together, separated by ``%``, ``;`` or ``\n``::
 
-  :#> ddcmd "func pnpacpi_get_resources +p; func pnp_assign_mem +p"
+  :#> ddcmd func foo +p % func bar +p
+  :#> ddcmd func foo +p \; func bar +p
+  :#> ddcmd "func foo +p ; func bar +p"
   :#> ddcmd <<"EOC"
   func pnpacpi_get_resources +p
   func pnp_assign_mem +p
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 5ac7248d51bb..c50836c262b4 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -626,7 +626,7 @@ static int ddebug_exec_queries(char *query, const char *modname)
 	int i, errs = 0, exitcode = 0, rc, nfound = 0;
 
 	for (i = 0; query; query = split) {
-		split = strpbrk(query, ";\n");
+		split = strpbrk(query, "%;\n");
 		if (split)
 			*split++ = '\0';
 
diff --git a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
index c7bf521f36ee..513f6cb1db1d 100755
--- a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
+++ b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
@@ -256,9 +256,33 @@ function comma_terminator_tests {
     ddcmd =_
 }
 
+function test_percent_splitting {
+    echo -e "${GREEN}# TEST_PERCENT_SPLITTING - multi-command splitting on % ${NC}"
+    if [ $LACK_TMOD -eq 1 ]; then
+	echo "SKIP - test requires test-dynamic-debug.ko"
+	return
+    fi
+    ifrmmod test_dynamic_debug_submod
+    ifrmmod test_dynamic_debug
+    ddcmd =_
+    modprobe test_dynamic_debug dyndbg=class,D2_CORE,+pf%class,D2_KMS,+pt%class,D2_ATOMIC,+pm
+    check_match_ct =pf 1
+    check_match_ct =pt 1
+    check_match_ct =pm 1
+    check_match_ct test_dynamic_debug 23 -r
+    # add flags to those callsites
+    ddcmd class,D2_CORE,+mf%class,D2_KMS,+lt%class,D2_ATOMIC,+ml
+    check_match_ct =pmf 1
+    check_match_ct =plt 1
+    check_match_ct =pml 1
+    check_match_ct test_dynamic_debug 23 -r
+    ifrmmod test_dynamic_debug
+}
+
 tests_list=(
     basic_tests
     comma_terminator_tests
+    test_percent_splitting
 )
 
 # Run tests
-- 
2.52.0

