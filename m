Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5ACBCA7B6
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 09 Oct 2025 19:59:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB09410EAEF;
	Thu,  9 Oct 2025 17:59:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="baHD3DaV";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com
 [209.85.166.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 925A110EAEF
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  9 Oct 2025 17:59:17 +0000 (UTC)
Received: by mail-il1-f171.google.com with SMTP id
 e9e14a558f8ab-4291359714eso11119205ab.1
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 09 Oct 2025 10:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760032757; x=1760637557; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f2CgSP+i6gOirYRCe6SP5XNRa5WFOHuIeP0ROyizXdM=;
 b=baHD3DaV71Cg1Z9aZn5DVsR7Q19uZ7uZPQckUPY39Lb5msf1h3hUFoQdw15IaSJiMe
 SMXUqWWIGMxImgareD5m9naVnrLoZ86M16rzgac+TeXU5xnZbyBJlu3qpO6lpWkVXo/2
 aoc7OrYsW/UH0VtWVepqj5UvfZOL7NYbG1WRO3me7T0hN5P2r9KVc2oUpnCqN48dhzhk
 UHVYF4Q+O10zPKVxeaJ+xjZAuHMjCXIAvol6YX2vq7Jx0QOuI+CY9ATTyrCLusXPpZrO
 aR9NX98TipfXzw3Q1cGUrpuZICxyvR0+MSNwb1fWozmE3jZdWsdKM8fsWQjRMMXi2zJN
 hN0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760032757; x=1760637557;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f2CgSP+i6gOirYRCe6SP5XNRa5WFOHuIeP0ROyizXdM=;
 b=YQctCEGiF+iCUAx3N9aTlpwXlj53aHK8ZdUIIWFfccGOWPpL0Rwk1y3LsE4bwab+ai
 wCeh4u1jUlHsyE/PP2DgygZB0phKEOFNwuOFqJxC3BWFqce7Plw0oZKbpN9FD5jZiAPX
 lBBhDlCekHK9GBiN6S+O2TMeO80CZizsvlpuSAbDpHgccdwpCyYyTPlFTMlZtufQwh3I
 +Ey9fdzmPE+v26f8mjgJ2fS5+j7PKBIWS+3rH2+z4uu/rn+raKQrByRd/pas17By4sg7
 xbgwOdWrPvi/hhEQiV3uCn55z+eHg/NnRRY/Wquc0UyTuekNEzZp2asyM5uTxsFAWYCZ
 lWMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV44+yowZYxwol0dAiEvznOC8YobFT6atoYchPNal80RP5XCCUlvEHSrnU/S+YFFmzIui4LwRzbvgLx8/t/@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxLakZfLInVNEItS3fj97mAlwGwsz0dd8PiIMtHyltPC4FtvT7y
 xmIEaCRm0xl1RoRb8ufuq/IIo9V2Xb9/Oc/K5Tm72+24elXoO9VGPQs/
X-Gm-Gg: ASbGncvGjNGxskjSOLDgIKaNjzu/D0NziklQg5hCGyJHdIlAXUN3i/dSRgn9XYnD2tL
 pPQvWJrgoTR6cYbPWYGKTjLVC3rqT8lT4mdczpCzVELzsovSjlDgSz1k+52cUZNIdZi51KQwNH+
 7gBD4H8B1u0Y0TkImtTG5toZ1I0Zn7s65Tnk1xEvohpAfsAzVf11wai/JRT1ieCHSi9/B3laWwT
 u958b38slHrKWEosUR6V+OmTSTdGAzJV5efNWUCrPkVKp8S7O8IHQnZriihFXo7IdbjoHrVkYXU
 m2NImJG6k6TEODsoMepXw7HM1L9eYPbasNNbC8pXiMvjXlxA23z+rLvTDni59gEKHmnnFRVOaGL
 SBmbaRcihoNUmrWzghsrQ5elWlN2Qs+jaAcjILnLFQijhvh3/ajSM7RoyAJiEFuxvW4JB8zbEbC
 f+280efk+AbWrRUqMEVWERy7HWwNWillSlxf4Qww==
X-Google-Smtp-Source: AGHT+IHHW7XXxj0sK4ppRb/LDzTgeN6fkIFB7y2JX1QNjPDVNsmviia3UE4J533K6nBq7vvvPw5OpQ==
X-Received: by 2002:a05:6e02:2501:b0:42d:80fb:7347 with SMTP id
 e9e14a558f8ab-42f8736998cmr88482295ab.12.1760032756630; 
 Thu, 09 Oct 2025 10:59:16 -0700 (PDT)
Received: from godzilla.raven-morpho.ts.net
 (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-58f7200c4afsm30256173.35.2025.10.09.10.59.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 10:59:16 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com
Cc: gregkh@linuxfoundation.org, ukaszb@chromium.org, louis.chauvet@bootlin.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v5 27/30] selftests-dyndbg: add test_mod_submod
Date: Thu,  9 Oct 2025 11:58:31 -0600
Message-ID: <20251009175834.1024308-28-jim.cromie@gmail.com>
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

This new test-fn runs 3 module/submodule modprobe scenarios, variously
using both the generic dyndbg=<queries> modprobe arg, and the
test-module's classmap-params to manipulate the test-mod*'s pr_debugs.
In all cases, the current flag-settings are counted and tested vs
expectations.

The 3rd scenario recapitulates the DRM_USE_DYNAMIC_DEBUG=y failure.

1. 2 modprobes (super then sub), with separate dyndbg=class-settings
   check module specific flag settings

2. modprobe submod, supermod is auto-loaded
   set supermod class-params
   check expected enablements in super & submod

3. modprobe super, with param=setting (like drm.debug=0x1ef)
   modprobe submod
   validate submod's class'd pr_debugs get properly enabled

The test uses multi-queries, with both commas and percents (to avoid
spaces and quoting).  This is the main reason the test wasn't earlier
in the patchset, closer to the classmap patches its validating.

With some tedium, the tests could be refactored to split out early
tests which avoid multi-cmds, and test only the class-params.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
r3 - skip test if LACK_TMOD

older
  drop -v used in test_mod_submod(). V=1 does it for whole test
  ifrmmod at test end (Lukasz)

test-mod-tmod
---
 .../dynamic_debug/dyndbg_selftest.sh          | 73 +++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
index 513f6cb1db1d..09937dca3056 100755
--- a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
+++ b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
@@ -279,10 +279,83 @@ function test_percent_splitting {
     ifrmmod test_dynamic_debug
 }
 
+function test_mod_submod {
+    echo -e "${GREEN}# TEST_MOD_SUBMOD ${NC}"
+    if [ $LACK_TMOD -eq 1 ]; then
+	echo "SKIP - test requires test-dynamic-debug.ko"
+	return
+    fi
+    ifrmmod test_dynamic_debug_submod
+    ifrmmod test_dynamic_debug
+    ddcmd =_
+
+    # modprobe with class enablements
+    modprobe test_dynamic_debug \
+	dyndbg=class,D2_CORE,+pf%class,D2_KMS,+pt%class,D2_ATOMIC,+pm
+
+    check_match_ct '\[test_dynamic_debug\]' 23 -r
+    check_match_ct =pf 1
+    check_match_ct =pt 1
+    check_match_ct =pm 1
+
+    modprobe test_dynamic_debug_submod
+    check_match_ct test_dynamic_debug_submod 23 -r
+    check_match_ct '\[test_dynamic_debug\]' 23 -r
+    check_match_ct test_dynamic_debug 46 -r
+
+    # no enablements propagate here
+    check_match_ct =pf 1
+    check_match_ct =pt 1
+    check_match_ct =pm 1
+
+    # change classes again, this time submod too
+    ddcmd class,D2_CORE,+mf%class,D2_KMS,+lt%class,D2_ATOMIC,+ml "# add some prefixes"
+    check_match_ct =pmf 1
+    check_match_ct =plt 1
+    check_match_ct =pml 1
+    #  submod changed too
+    check_match_ct =mf 1
+    check_match_ct =lt 1
+    check_match_ct =ml 1
+
+    # now work the classmap-params
+    # fresh start, to clear all above flags (test-fn limits)
+    ifrmmod test_dynamic_debug_submod
+    ifrmmod test_dynamic_debug
+    modprobe test_dynamic_debug_submod # get supermod too
+
+    echo 1 > /sys/module/test_dynamic_debug/parameters/p_disjoint_bits
+    echo 4 > /sys/module/test_dynamic_debug/parameters/p_level_num
+    # 2 mods * ( V1-3 + D2_CORE )
+    check_match_ct =p 8
+    echo 3 > /sys/module/test_dynamic_debug/parameters/p_disjoint_bits
+    echo 0 > /sys/module/test_dynamic_debug/parameters/p_level_num
+    # 2 mods * ( D2_CORE, D2_DRIVER )
+    check_match_ct =p 4
+    echo 0x16 > /sys/module/test_dynamic_debug/parameters/p_disjoint_bits
+    echo 0 > /sys/module/test_dynamic_debug/parameters/p_level_num
+    # 2 mods * ( D2_DRIVER, D2_KMS, D2_ATOMIC )
+    check_match_ct =p 6
+
+    # recap DRM_USE_DYNAMIC_DEBUG regression
+    ifrmmod test_dynamic_debug_submod
+    ifrmmod test_dynamic_debug
+    # set super-mod params
+    modprobe test_dynamic_debug p_disjoint_bits=0x16 p_level_num=5
+    check_match_ct =p 7
+    modprobe test_dynamic_debug_submod
+    # see them picked up by submod
+    check_match_ct =p 14
+    ifrmmod test_dynamic_debug_submod
+    ifrmmod test_dynamic_debug
+}
+
 tests_list=(
     basic_tests
+    # these require test_dynamic_debug*.ko
     comma_terminator_tests
     test_percent_splitting
+    test_mod_submod
 )
 
 # Run tests
-- 
2.51.0

