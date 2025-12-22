Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E56CD50C9
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 22 Dec 2025 09:29:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBDDC10E5CC;
	Mon, 22 Dec 2025 08:29:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BzEMpXFT";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6739210E5D3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 22 Dec 2025 08:29:14 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id
 d2e1a72fcca58-7baf61be569so4011549b3a.3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 22 Dec 2025 00:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766392154; x=1766996954; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UJ0Fy32CNz68gAtuvvvAIFbPIlI5INll01DQrP39TKA=;
 b=BzEMpXFTFU8IUBuFSp2ZvKv8D63DrBLIagh6mlVtUBtsW3gwi4oxzGlHCOOgmIN2+a
 5Y+5Dmud4FTOpJKXrc1pDGXFgfw1RpgnVfrIMf87PhmNpH88y4VoWe6DlKAIwprYFqFM
 tifZ9fWdiB9NKKXox2210eyQqWHTQBGMCAU1Z8XLM/wYsaDlHPhvPQLiIE/36wiE+giD
 W+xXxjMTEd1XZyBqDgor2oXCf9bFT6XdoV5+RUblqtTdu/mRLJu5eaGjYKVW70mV5xQE
 2+cg++oqSspi43PqF4ODb39At8RChGpIaV/tKlAG7cT16XH9WIxAiHd7qGosnQO7LT/2
 n8Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766392154; x=1766996954;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UJ0Fy32CNz68gAtuvvvAIFbPIlI5INll01DQrP39TKA=;
 b=N7sueUICfVJIBAJ/mocQrvTMvx3W428h2G7TJRqdmyljfa8cbfgvCpku0B3LUz6+ri
 Qzyhw12dbt51zZCphCm3VdvdDlb9NNBAVWPZC4Z3VbmFH2e4YBR9oADjb8zpYYGVxUna
 50ZGzPaql+F2BmKvFpS0IwbrARfzWLbE2Dlzw5JrzI+Mrvdp2kcv983+8hGK0WyeUgEL
 StKcEzS7R7covOkCdq8rMOwDhAcxTlpBUUb4gmhYfwSDJeZlvwpjAbJQgflCvvb1ShEO
 P3QFjd3kUsNPtILda2py5QSUBIbok/X0i/haIA1pW5QrKHImHB7esSF7YIHD1Jw8WddS
 fISw==
X-Forwarded-Encrypted: i=1;
 AJvYcCViu+47p+BihxdyKiJsIKKUpOEk0nVaQVVSPpRDdR7ntU3Fy6nVhYFw0xjFi+tx7Hywx+l9L+TP1PGwBs0H@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzlVByw1ux944gzBtpG++EZaKrfYDVj7SaQ8i3tj+U2vytLDr/o
 q+KkGdVDHLMJrbPbvXczykV6dQbpJVGfn5509U7zO+C9SAcSJl9O5mZZ
X-Gm-Gg: AY/fxX7Za3SUXwcxJwqdDn3+9D6LUiXmaCEr0/DGPBJJT64oSEHiJJcbCWZRVaShrBi
 YUog47adwuw9AMVuyFaT0bgqd41p44+Po0CuV1Ei5ySprSt4O1ts5DeXDnxJCNyzV4pmeZViRoo
 VeTqbcnR9l2zXzwuOdA41aVbZeMmmOC6ZoIs4W21u1b6rhsYzMVzeWYljfvkKQwLvpHcvAVy02T
 cmSn1VVyGRh16u/UG3eIT9pjDVgVzHjRIMsKvAsvudPEiYN6ggCrN+5Mn4EWN0wY8pa7+0K2LmM
 fb9/zhJfFbe+HOT0u5Ia9M3NYFgG7iD08VvQYbb8GzJKC5Z8/fSAoKyAuB4tqDV8PLYPKKtMb+E
 MxFxQwyMsoXptxGzC1PY6Ek1sM3rza3WKqHyQ5vETir9rnpSzyHpDY7PPcXqp7/Akza4yAHRH36
 NqRL/6Pi1n
X-Google-Smtp-Source: AGHT+IH91xYoqgoO/9cTyIkcwq8ylRSPWssYXk7Ak1UGNvKWMh8b4fE0tkVyhdkLY2d/CPzf+gHPIA==
X-Received: by 2002:a05:6a00:1f17:b0:7f1:fad7:2ce with SMTP id
 d2e1a72fcca58-7ff679669d1mr11073286b3a.48.1766392153873; 
 Mon, 22 Dec 2025 00:29:13 -0800 (PST)
Received: from frodo ([2404:4400:417e:3d00:8b90:7f55:1261:772f])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-7ff7af29dcfsm9640064b3a.17.2025.12.22.00.29.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Dec 2025 00:29:13 -0800 (PST)
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
Subject: [PATCH v7 00/31] drm/dyndbg: Fix dynamic debug classmap regression
Date: Mon, 22 Dec 2025 21:28:12 +1300
Message-ID: <20251222082843.1816701-1-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
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

hello all,

commit aad0214f3026 ("dyndbg: add DECLARE_DYNDBG_CLASSMAP macro")

added dyndbg's "classmaps" feature, which brought dyndbg's 0-off-cost
debug to DRM.  Dyndbg wired to /sys/module/drm/parameters/debug,
mapped its bits to classes named "DRM_UT_*", and effected the callsite
enablements only on updates to the sys-node (and underlying >control).

Sadly, it hit a CI failure, resulting in:
commit bb2ff6c27bc9 ("drm: Disable dynamic debug as broken")

The regression was that drivers, when modprobed, did not get the
drm.debug=0xff turn-on action, because that had already been done for
drm.ko itself.

The core design bug is in the DECLARE_DYNDBG_CLASSMAP macro.  Its use
in both drm.ko (ie core) and all drivers.ko meant that they couldn't
fundamentally distinguish their respective roles.  They each
"re-defined" the classmap separately, breaking K&R-101.

My ad-hoc test scripting helped to hide the error from me, by 1st
testing various combos of boot-time module.dyndbg=... and
drm.debug=... configurations, and then inadvertently relying upon
those initializations.

This series addresses both failings:

It replaces DECLARE_DYNDBG_CLASSMAP with

- `DYNAMIC_DEBUG_CLASSMAP_DEFINE`: Used by core modules (e.g.,
  `drm.ko`) to define their classmaps.  Based upon DECLARE, it exports
  the classmap so USE can use it.

- `DYNAMIC_DEBUG_CLASSMAP_USE`: this lets other "subsystem" users
  create a linkage to the classmap defined elsewhere (ie drm.ko).
  These users can then find their "parent" and apply its settings.

It adds a selftest script, and a 2nd "sub-module" to recapitulate
DRM's multi-module "subsystem" use-case, including the specific
failure scenario.

It also adds minor parsing enhancements, allowing easier construction
of multi-part debug configurations.  These enhancements are used to
test classmaps in particular, but are not otherwize required.

v7 adds:
. WARN_ONCE when classmap isnt found for a class'd callsite, JBaron
. reorder macro args to match kdoc, JBaron
. Doc formatting fixes, by Bagas

Thank you for your review.

P.S. Id also like to "tease" some other work:

1. patchset to send pr_debugs to tracefs on +T flag

   allows 63 "private" tracebufs, 1 "common" one (at 0)
   "drm.debug_2trace=0x1ff" is possible
   from Lukas Bartoski

2. patchset to save 40% of DATA_DATA footprint

   move (modname,filename,function) to struct _ddebug_site
   save their descriptor intervals to 3 maple-trees
   3 accessors fetch on descriptor, from trees
   move __dyndbg_sites __section to INIT_DATA

3. patchset to cache dynamic-prefixes
   should hide 2.s cost increase.


Jim Cromie (31):

fixes, cleanups, simple stuff::

Jim Cromie (31):
  dyndbg: factor ddebug_match_desc out from ddebug_change
  dyndbg: add stub macro for DECLARE_DYNDBG_CLASSMAP
  docs/dyndbg: update examples \012 to \n
  docs/dyndbg: explain flags parse 1st
  test-dyndbg: fixup CLASSMAP usage error
  dyndbg: reword "class unknown," to "class:_UNKNOWN_"
  dyndbg: make ddebug_class_param union members same size
  dyndbg: drop NUM_TYPE_ARRAY
  dyndbg: tweak pr_fmt to avoid expansion conflicts
  dyndbg: reduce verbose/debug clutter

callchain grooming, re-structs, code simplify/dedup by macros::

  dyndbg: refactor param_set_dyndbg_classes and below
  dyndbg: tighten fn-sig of ddebug_apply_class_bitmap
  dyndbg: replace classmap list with a vector
  dyndbg: macrofy a 2-index for-loop pattern
  dyndbg,module: make proper substructs in _ddebug_info
  dyndbg: hoist classmap-filter-by-modname up to ddebug_add_module
  dyndbg: move mod_name down from struct ddebug_table to _ddebug_info
  dyndbg-API: remove DD_CLASS_TYPE_(DISJOINT|LEVEL)_NAMES and code
  selftests-dyndbg: add a dynamic_debug run_tests target
  dyndbg: change __dynamic_func_call_cls* macros into expressions

core fix, detect api misuse errors, etc::

  dyndbg-API: replace DECLARE_DYNDBG_CLASSMAP
  dyndbg: detect class_id reservation conflicts
  dyndbg: check DYNAMIC_DEBUG_CLASSMAP_DEFINE args at compile-time
  dyndbg-test: change do_prints testpoint to accept a loopct
  dyndbg-API: promote DYNAMIC_DEBUG_CLASSMAP_PARAM to API
  dyndbg: treat comma as a token separator
  dyndbg: split multi-query strings with %
  selftests-dyndbg: add test_mod_submod
  dyndbg: resolve "protection" of class'd pr_debug
  dyndbg: add DYNAMIC_DEBUG_CLASSMAP_USE_(dd_class_name, offset)
  docs/dyndbg: add classmap info to howto

 .../admin-guide/dynamic-debug-howto.rst       | 187 ++++-
 MAINTAINERS                                   |   3 +-
 include/asm-generic/vmlinux.lds.h             |   5 +-
 include/linux/dynamic_debug.h                 | 302 +++++--
 kernel/module/main.c                          |  15 +-
 lib/Kconfig.debug                             |  24 +-
 lib/Makefile                                  |   5 +
 lib/dynamic_debug.c                           | 776 +++++++++++-------
 lib/test_dynamic_debug.c                      | 198 +++--
 lib/test_dynamic_debug_submod.c               |  21 +
 tools/testing/selftests/Makefile              |   1 +
 .../testing/selftests/dynamic_debug/Makefile  |   9 +
 tools/testing/selftests/dynamic_debug/config  |   7 +
 .../dynamic_debug/dyndbg_selftest.sh          | 373 +++++++++
 14 files changed, 1465 insertions(+), 461 deletions(-)
 create mode 100644 lib/test_dynamic_debug_submod.c
 create mode 100644 tools/testing/selftests/dynamic_debug/Makefile
 create mode 100644 tools/testing/selftests/dynamic_debug/config
 create mode 100755 tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh

-- 
2.52.0

