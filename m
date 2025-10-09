Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02504BCA714
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 09 Oct 2025 19:58:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ED6010EACB;
	Thu,  9 Oct 2025 17:58:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="l6sQtRmv";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com
 [209.85.166.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2F3210EACB
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  9 Oct 2025 17:58:41 +0000 (UTC)
Received: by mail-il1-f174.google.com with SMTP id
 e9e14a558f8ab-42d8bf52325so6005575ab.3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 09 Oct 2025 10:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760032721; x=1760637521; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lGMv5lHdrhywBVTV/PqaJfnG7AITk86FOlf4SxNuZNA=;
 b=l6sQtRmv94EsGBYuU6nf+cuWeMkVmgK18fvYwM2KWjmMSZ5W2KWHpRjs8xQEmQk77R
 byOLFUWOCHHETnfZeqUnU9fRCvfcClEbRph7hHcEUc7L5iMj3FAG0db1XAIKYa1Xf9l4
 Wiui+y9i3ONeSs/NFAPv8cdeZDv9BFN+7BWF6K247hEmBVAid/eD7Ase/OREgOYR3zsO
 urFsCGyvAaNqY2c8OeXsPvV2fI9m4YjEi1DjplMQt8Kk1v/D7MqOBZVHBKhbhmS+PieB
 Yj/hCDDRoP4MMngDy+6jvtWKAXgc5NSWr1ITHMjygPwDX4Jxr4YPYsSDCpjzG54dk9q0
 GA3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760032721; x=1760637521;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lGMv5lHdrhywBVTV/PqaJfnG7AITk86FOlf4SxNuZNA=;
 b=Mxj9Xnfq076/EmWNzh/eyHl318BL1MA9MD6qrvPfMmLR8Lv2SlOiQxvOLgY/mTPYe8
 00410dPyhE3r9kr0tIgqL0go3Cg04ABSz87BMzbAMnTGDTjGSQ7bNfuuQ5ZsXdNLNOFQ
 k6nxEgH00ai8z7mz7DZSSkMOa1MD0fFnrLfM2YUoVrN80wTEPUyxT69CgLx0qRJcmgdL
 VtjhtcfIfZulyPFMCqC3f9lFtdXe70o5vnf91Lu5CDvckuQKzpPgORxm/OwbmgLk2Jbl
 HLjWQQUf+NJVcnRvQ1x+K9xcsT0OySEhUkpGBuHFDH09rtqODAJw6Rbb66ZVDCkbSMUn
 NzdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnSgZB68b+yjhdWupiI0pPRBOVqnfTEs1lXFSnEB2RX7kZVw0MlbQu8DlP/wOfzmMNNBU/NNdUNbQwLWLL@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy/DnOLc+LVUhmM68jFlHTfKxdhK+iGzos6xU6+T/NAosf/66YB
 dFdTOYgHESIh63roEeNBqwf7BmKd9DC9jANnB0zEbGhRrmJsXFc+mrMf
X-Gm-Gg: ASbGncv1fUbrOKGgPWlac6pVPd/R/kWph37WEdlrKqCsVpv5cOyjK6ys9I9lVGgmSLH
 aAPZK7zdTRkoWV4CHczmEQyd57BUETJ90l0FhwIQM+9/XdKrrmxITnQO1v9ByNsmu8wdG4GvEGs
 XbJb8Fn4hLTAq31RBwmxW2EFOcUA8wM3YiirtOQXfTtIrwWR7gn5FQo/G7Ye42ER/snFCZZ2998
 NpF0vtCGlED0NcL31cGJLU25jdZuKjVd5dQa+kg7XoMq00+yvOVhawZUDcLWUZBgSU7fNTnk3QI
 zz0xs8Utz9KhqVOwcrEqGlH3N3VICThYYaUFORsFR7UBc4SrQLNQyUv8VE4EHwrxsMDa47QUJC9
 nFXw3UZKGO2MxWktc2QSTy8BeD4EuDEp1z93uzBbfO4uzZQNqSB53aLP82SBiehf36vwYirrunK
 uVAeSCYdsqAAA6mvL3qGHDS1+GJ2lACYtthHRRsJ/x5WYu5oGs
X-Google-Smtp-Source: AGHT+IH0kP4+vfxD+O9Wz2DP4UBxSThOXmUadGnkvBABGnXzdVOZ2Hbq3wUFuypfAQx9EkxOwcXsnQ==
X-Received: by 2002:a05:6e02:3783:b0:42e:712e:52a0 with SMTP id
 e9e14a558f8ab-42f873540b2mr82406535ab.6.1760032720604; 
 Thu, 09 Oct 2025 10:58:40 -0700 (PDT)
Received: from godzilla.raven-morpho.ts.net
 (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-58f7200c4afsm30256173.35.2025.10.09.10.58.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 10:58:40 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com
Cc: gregkh@linuxfoundation.org, ukaszb@chromium.org, louis.chauvet@bootlin.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>,
 andrewjballance@gmail.com
Subject: [PATCH v5 00/30] Fix DYNAMIC_DEBUG classmaps for DRM
Date: Thu,  9 Oct 2025 11:58:04 -0600
Message-ID: <20251009175834.1024308-1-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.51.0
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

DYNAMIC_DEBUG classmaps is BROKEN for its 1st user: DRM. Lets Fix it.

The DECLARE_DYNDBG_CLASSMAP macro muddled the distinction between
definition and reference; in use it failed K&R define once, refer many.

Replace it with:
. DYNAMIC_DEBUG_CLASSMAP_DEFINE		for drm.ko
. DYNAMIC_DEBUG_CLASSMAP_USE		for drivers etc

Enhance test-dynamic-debug{,-submod}.ko to recapitulate DRM's 2+ module
boss-workers failure scenario, and to selftest against them.  This allows
dropping the DRM patches, formerly included to prove functionality.

The latest (unversioned) rev:
. I inexplicably fiddled with the patch subject
. dropped DRM as OT for lib/
https://lore.kernel.org/lkml/20250911213823.374806-1-jim.cromie@gmail.com/

v1-4 saw significant review, thanks Louis Chauvet <louis.chauvet@bootlin.com>

v4: https://lore.kernel.org/lkml/20250803035816.603405-1-jim.cromie@gmail.com/
v3: https://lore.kernel.org/lkml/20250402174156.1246171-1-jim.cromie@gmail.com/#t
v2: https://lore.kernel.org/lkml/20250320185238.447458-1-jim.cromie@gmail.com/
v1: https://lore.kernel.org/lkml/20250125064619.8305-1-jim.cromie@gmail.com/
v0: prehistoric versions are linked from v1,v2

Jim Cromie (30):
  docs/dyndbg: update examples \012 to \n
  docs/dyndbg: explain flags parse 1st
  test-dyndbg: fixup CLASSMAP usage error
  dyndbg: reword "class unknown," to "class:_UNKNOWN_"
  dyndbg: make ddebug_class_param union members same size
  dyndbg: drop NUM_TYPE_ARRAY
  dyndbg: tweak pr_fmt to avoid expansion conflicts
  dyndbg: reduce verbose/debug clutter
  dyndbg: refactor param_set_dyndbg_classes and below
  dyndbg: tighten fn-sig of ddebug_apply_class_bitmap
  dyndbg: replace classmap list with a vector
  dyndbg: macrofy a 2-index for-loop pattern
  dyndbg: DECLARE_DYNDBG_CLASSMAP needs stub defn
  dyndbg,module: make proper substructs in _ddebug_info
  dyndbg: hoist classmap-filter-by-modname up to ddebug_add_module
  dyndbg: move mod_name from ddebug_table down to _ddebug_info
  dyndbg-API: remove DD_CLASS_TYPE_(DISJOINT|LEVEL)_NAMES and code
  selftests-dyndbg: add a dynamic_debug run_tests target
  dyndbg: change __dynamic_func_call_cls* macros into expressions
  dyndbg-API: replace DECLARE_DYNDBG_CLASSMAP
  dyndbg: detect class_id reservation conflicts
  dyndbg: check DYNAMIC_DEBUG_CLASSMAP_DEFINE args at compile-time
  dyndbg-test: change do_prints testpoint to accept a loopct
  dyndbg-API: promote DYNAMIC_DEBUG_CLASSMAP_PARAM to API
  dyndbg: treat comma as a token separator
  dyndbg: split multi-query strings with %
  selftests-dyndbg: add test_mod_submod
  dyndbg: resolve "protection" of class'd pr_debugs
  dyndbg: add DYNAMIC_DEBUG_CLASSMAP_USE_(clname,_base)
  docs/dyndbg: add classmap info to howto

CC: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: ukaszb@chromium.org
cc: andrewjballance@gmail.com

 .../admin-guide/dynamic-debug-howto.rst       | 179 ++++-
 MAINTAINERS                                   |   3 +-
 include/asm-generic/vmlinux.lds.h             |   5 +-
 include/linux/dynamic_debug.h                 | 304 ++++++--
 kernel/module/main.c                          |  15 +-
 lib/Kconfig.debug                             |  24 +-
 lib/Makefile                                  |   5 +
 lib/dynamic_debug.c                           | 678 +++++++++++-------
 lib/test_dynamic_debug.c                      | 198 +++--
 lib/test_dynamic_debug_submod.c               |  21 +
 tools/testing/selftests/Makefile              |   1 +
 .../testing/selftests/dynamic_debug/Makefile  |   9 +
 tools/testing/selftests/dynamic_debug/config  |   7 +
 .../dynamic_debug/dyndbg_selftest.sh          | 373 ++++++++++
 14 files changed, 1393 insertions(+), 429 deletions(-)
 create mode 100644 lib/test_dynamic_debug_submod.c
 create mode 100644 tools/testing/selftests/dynamic_debug/Makefile
 create mode 100644 tools/testing/selftests/dynamic_debug/config
 create mode 100755 tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh

-- 
2.51.0

