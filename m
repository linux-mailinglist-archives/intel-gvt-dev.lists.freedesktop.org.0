Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D708E7C7458
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 12 Oct 2023 19:22:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E0BA89518;
	Thu, 12 Oct 2023 17:22:17 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 968CB10E543;
 Thu, 12 Oct 2023 17:22:02 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-79fa425855cso49324439f.2; 
 Thu, 12 Oct 2023 10:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697131322; x=1697736122; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6liV2etUILiwZkHZIJwZGKVrReLlHNCtaMOFz/lfCeI=;
 b=TcvpQ5V6TUKyrr6cuInl7D92ERxmUWb0dnvBrI25qBm2PVPooSGsDjrpEcV8VLkNpH
 db4eGZrkSDUA4MtT9PEL67xbEE8FTfFSOlLLbpnmiOzSsa7kv1znOAo4PZtCEgNE/HUM
 PU6UU5UqGcMBPcQllHlFH/E80Xc1Bke62kolu2INj5j4ImnLcQKKEDpaEcr8M9klkszj
 EGwFuMWoWWLYBct3/HV6ee/2+UdrZCbE7JIe/z9Okl9NhFCigaJYLeR4i7Awzv3bk57U
 /64tZmvOAG/AZBQFoleXVM/GIS+LdVjjR7QfaqTIbG7fClDE9V+9IxMZNoi1TbeOJN4Y
 1QjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697131322; x=1697736122;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6liV2etUILiwZkHZIJwZGKVrReLlHNCtaMOFz/lfCeI=;
 b=ODL3R0g27SGg1mkXpJpsuu5hb0Q3zTlkCYqgJJHS5q85CVz5iy61SM8cAQOm/wipj2
 6m/PXhFpQoOlhcX3qVC/7tJGGteWreetBKWMQuUot0egu202u+p2bVfeN9jxcfN6hWQI
 RlK84QpRPufkpf0rMwrxxGR05VIGmGWcJbjovqI3rhzKnIvW8IGG/sPQdghHtJZFpr8r
 J86BufF5Q5A4RKiaEjg013Gm2+PyJT0jWMUMwY6NNK3KPMpZPUeKrFKVJEtEK7KNcmc7
 RVLaY09Q/fIa5R3/W/IzKjMCcIPOEkRRMBHywPmuuxhU9hxM/6q+ZYBiOCwJiOTgh4hD
 h1nA==
X-Gm-Message-State: AOJu0YwEYvIfoMd7g7yxKHTnO7Mxt93MovrxNRgKoUu3+PGieiUgK0L5
 FZyqBetV/pIP1bEZ4zvjOZE=
X-Google-Smtp-Source: AGHT+IGdRpJrCWefDYp92sT58hilpIEQbcDh7VGq7aLmJlWvj+DpqJX3vorgFefpuDFLJAH5YrosbA==
X-Received: by 2002:a5e:a813:0:b0:787:4b5f:b6cf with SMTP id
 c19-20020a5ea813000000b007874b5fb6cfmr26572452ioa.5.1697131321599; 
 Thu, 12 Oct 2023 10:22:01 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 r25-20020a028819000000b0043cef0711c1sm3992211jai.158.2023.10.12.10.22.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 10:22:01 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v7 14/25] dyndbg-API: fix CONFIG_DRM_USE_DYNAMIC_DEBUG
 regression
Date: Thu, 12 Oct 2023 11:21:25 -0600
Message-ID: <20231012172137.3286566-15-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231012172137.3286566-1-jim.cromie@gmail.com>
References: <20231012172137.3286566-1-jim.cromie@gmail.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, groeck@google.com,
 linux-doc@vger.kernel.org, jani.nikula@intel.com, daniel.vetter@ffwll.ch,
 yanivt@google.com, Luis Chamberlain <mcgrof@kernel.org>,
 Jim Cromie <jim.cromie@gmail.com>, robdclark@gmail.com, seanpaul@chromium.org,
 bleung@google.com, ville.syrjala@linux.intel.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

DECLARE_DYNDBG_CLASSMAP() has a design error; it fails a basic K&R
rule: "define once, refer many times".

When DRM_USE_DYNAMIC_DEBUG=y, DECLARE_DYNDBG_CLASSMAP() is used across
DRM core & drivers; they all repeat the same classmap-defn args, which
must match for the modules to respond together when DRM.debug
categories are enabled.

Worse, it causes the CONFIG_DRM_USE_DYNAMIC_DEBUG=Y regression; 1st
drm.ko loads, and dyndbg initializes its DRM.debug callsites, then a
drm-driver loads, but too late - it missed the DRM.debug enablement.

So replace it with 2 macros:
  DYNDBG_CLASSMAP_DEFINE - invoked once from core - drm.ko
  DYNDBG_CLASSMAP_USE    - from all drm drivers and helpers.

DYNDBG_CLASSMAP_DEFINE: based on DECLARE_DYNDBG_CLASSMAP, but now it
drops the static on the constructed classmap variable, and exports it
instead.

DYNDBG_CLASSMAP_USE: then refers to the exported var by name:
* used from drivers, helper-mods
* lets us drop the repetitive "classname" args
* fixes 2nd-defn problem
* creates a ddebug_class_user record in new __dyndbg_class_users section
  this allows ddebug_add_module(etal) to handle them per-module.

The distinction, and the usage record, allows dyndbg to initialize the
driver's DRM.debug callsites separately after it is modprobed.

Since DRM now needs updates to use the new macros, it also gets 2
wrappers: DRM_CLASSMAP_DEFINE, DRM_CLASSMAP_USE which declutter the
users by hiding the ifdef CONFIG_DRM_USE_DYNAMIC_DEBUG.

To review, dyndbg's existing __dyndbg_classes[] section does:

. catalogs the classmaps defined by the module (or builtin modules)
. authorizes dyndbg to >control those class'd prdbgs for the module.
. DYNDBG_CLASSMAP_DEFINE(and old one) creates classmaps in this section.

This patch adds __dyndbg_class_users[] section:

. catalogs uses/references to the classmap definitions.
. authorizes dyndbg to >control those class'd prdbgs in ref'g module.
. DYNDBG_CLASSMAP_USE() creates classmap-user records in this section.

Now ddebug_add_module(etal) can handle classmap-uses like (and after)
classmaps; when a dependent module is loaded, its parent's kernel
params are scanned to find the param wired to dyndbg-param-ops, whose
classmap matches the one ref'd by the client.

To support this, theres a few data/header changes:

. new struct ddebug_class_user
  contains: user-module-name, &classmap-defn
  it records drm-driver's use of a classmap in the section, allowing lookup

struct ddebug_info gets 2 new fields to encapsulate the new section:
  class_users, num_class_users.
  set by dynamic_debug_init() for builtins.
  or by kernel/module/main:load_info() for loadable modules.

vmlinux.lds.h: new BOUNDED_SECTION for __dyndbg_class_users

dynamic_debug.c has 2 changes in ddebug_add_module(), ddebug_change():

ddebug_add_module() already calls ddebug_attach_module_classes()
to handle classmaps DEFINEd by a module, now it also calls
ddebug_attach_user_module_classes() to handle USEd classmaps.  To
avoid this work when possible, 1st scan the module's descriptors and
count the number of class'd pr_debugs.

ddebug_attach_user_module_classes() scans the module's class_users
section, follows the refs to the parent's classmap, and calls
ddebug_apply_params() on each.  It also avoids work by checking the
module's class-ct.

ddebug_apply_params(new fn):

It scans module's/builtin kernel-params, calls ddebug_match_apply_kparam
for each to find the params/sysfs-nodes which may be wired to a classmap.

ddebug_match_apply_kparam(new fn):

1st, it tests the kernel-param.ops is dyndbg's; this guarantees that
the attached arg is a struct ddebug_class_param, which has a ref to
the param's state, and to the classmap defining the param's handling.

2nd, it requires that the classmap ref'd by the kparam is the one
we're called for; modules can use many separate classmaps (as
test_dynamic_debug does).

Then apply the "parent" kparam's setting to the dependent module,
using ddebug_apply_class_bitmap().

ddebug_change(and callees) also gets adjustments:

ddebug_find_valid_class(): This does a search over the module's
classmaps, looking for the class FOO echo'd to >control.  So now it
searches over __dyndbg_class_users[] after __dyndbg_classes[].

ddebug_class_name(): return class-names for defined AND used classes.

test_dynamic_debug.c, test_dynamic_debug_submod.c:

This (already) demonstrates the 2 types of classmaps & sysfs-params,
following the 4-part recipe:

1. define an enum for the classmap: DRM.debug has DRM_UT_{CORE,KMS,...}
   multiple classes must share 0-62 classid space.
2. DYNDBG_CLASSMAP_DEFINE(.. DRM_UT_{CORE,KMS,...})
3. DYNDBG_CLASSMAP_PARAM* (classmap)
4. DYNDBG_CLASSMAP_USE()
   by _submod only, skipping 2,3

Move all the enum declarations together, to better explain how they
share the 0..62 class-id space available to a module (non-overlapping
subranges).

reorg macros 2,3 by name.  This gives a tabular format, making it easy
to see the pattern of repetition, and the points of change.

And extend the test to replicate the 2-module (parent & dependent)
scenario which caused the CONFIG_DRM_USE_DYNAMIC_DEBUG=y regression
seen in drm & drivers.

The _submod.c is a 2-line file: #define _SUBMOD, #include parent.

This gives identical complements of prdbgs in parent & _submod, and
thus identical print behavior when all of: >control, >params, and
parent->_submod propagation are working correctly.

It also puts all the parent/_submod declarations together in the same
source, with the new ifdef _SUBMOD block invoking DYNDBG_CLASSMAP_USE
for the 2 test-interfaces.  I think this is clearer.

These 2 modules are independently configurable, allowing builtin
parent and loadable submod, which recapitulates a troublesome build
combo for drm & drivers.

DEBUG details:

``#define DEBUG`` in src enables all pr_debugs after it, including any
class'd pr_debugs; its not necessarily all-or-nothing, unless its a
one-file-module with DEBUG at the top.

If a CLASSMAP_PARAM is defined on a classmap, its readback value
cannot describe the set of enablements.  The param is basically
write-only; it cannot know if `echo $cmd >control` was done since.

To know the exact pr-debug state with certainty, toggle to both:

   echo 0x3ff > /sys/module/drm/parameters/debug
   echo 0     > /sys/module/drm/parameters/debug

Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <seanpaul@chromium.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>
Fixes: aad0214f3026 ("dyndbg: add DECLARE_DYNDBG_CLASSMAP macro")
Fixes: f158936b60a7 ("drm: POC drm on dyndbg - use in core, 2 helpers, 3 drivers.")
Ref: commit bb2ff6c27bc9 ("drm: Disable dynamic debug as broken")

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 MAINTAINERS                             |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c |  12 +-
 drivers/gpu/drm/display/drm_dp_helper.c |  12 +-
 drivers/gpu/drm/drm_crtc_helper.c       |  12 +-
 drivers/gpu/drm/drm_print.c             |  25 ++--
 drivers/gpu/drm/i915/i915_params.c      |  12 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c   |  12 +-
 include/asm-generic/vmlinux.lds.h       |   1 +
 include/drm/drm_print.h                 |  10 +-
 include/linux/dynamic_debug.h           |  53 +++++--
 kernel/module/main.c                    |   3 +
 lib/Kconfig.debug                       |  22 ++-
 lib/Makefile                            |   3 +
 lib/dynamic_debug.c                     | 183 +++++++++++++++++++++---
 lib/test_dynamic_debug.c                | 127 ++++++++++------
 lib/test_dynamic_debug_submod.c         |  10 ++
 16 files changed, 346 insertions(+), 153 deletions(-)
 create mode 100644 lib/test_dynamic_debug_submod.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 6c4cce45a09d..aa09ac8dbb39 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7302,7 +7302,7 @@ M:	Jim Cromie <jim.cromie@gmail.com>
 S:	Maintained
 F:	include/linux/dynamic_debug.h
 F:	lib/dynamic_debug.c
-F:	lib/test_dynamic_debug.c
+F:	lib/test_dynamic_debug*.c
 
 DYNAMIC INTERRUPT MODERATION
 M:	Tal Gilboa <talgi@nvidia.com>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 81edf66dbea8..efba99c9393e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -197,17 +197,7 @@ int amdgpu_user_partt_mode = AMDGPU_AUTO_COMPUTE_PARTITION_MODE;
 
 static void amdgpu_drv_delayed_reset_work_handler(struct work_struct *work);
 
-DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
-			"DRM_UT_CORE",
-			"DRM_UT_DRIVER",
-			"DRM_UT_KMS",
-			"DRM_UT_PRIME",
-			"DRM_UT_ATOMIC",
-			"DRM_UT_VBL",
-			"DRM_UT_STATE",
-			"DRM_UT_LEASE",
-			"DRM_UT_DP",
-			"DRM_UT_DRMRES");
+DRM_CLASSMAP_USE(drm_debug_classes);
 
 struct amdgpu_mgpu_info mgpu_info = {
 	.mutex = __MUTEX_INITIALIZER(mgpu_info.mutex),
diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index e6a78fd32380..d97de1a27939 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -41,17 +41,7 @@
 
 #include "drm_dp_helper_internal.h"
 
-DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
-			"DRM_UT_CORE",
-			"DRM_UT_DRIVER",
-			"DRM_UT_KMS",
-			"DRM_UT_PRIME",
-			"DRM_UT_ATOMIC",
-			"DRM_UT_VBL",
-			"DRM_UT_STATE",
-			"DRM_UT_LEASE",
-			"DRM_UT_DP",
-			"DRM_UT_DRMRES");
+DRM_CLASSMAP_USE(drm_debug_classes);
 
 struct dp_aux_backlight {
 	struct backlight_device *base;
diff --git a/drivers/gpu/drm/drm_crtc_helper.c b/drivers/gpu/drm/drm_crtc_helper.c
index a209659a996c..fef4662d5f1f 100644
--- a/drivers/gpu/drm/drm_crtc_helper.c
+++ b/drivers/gpu/drm/drm_crtc_helper.c
@@ -50,17 +50,7 @@
 
 #include "drm_crtc_helper_internal.h"
 
-DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
-			"DRM_UT_CORE",
-			"DRM_UT_DRIVER",
-			"DRM_UT_KMS",
-			"DRM_UT_PRIME",
-			"DRM_UT_ATOMIC",
-			"DRM_UT_VBL",
-			"DRM_UT_STATE",
-			"DRM_UT_LEASE",
-			"DRM_UT_DP",
-			"DRM_UT_DRMRES");
+DRM_CLASSMAP_USE(drm_debug_classes);
 
 /**
  * DOC: overview
diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index 5b93c11895bb..dabcfa0dd279 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -55,18 +55,19 @@ MODULE_PARM_DESC(debug, "Enable debug output, where each bit enables a debug cat
 #if !defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
 module_param_named(debug, __drm_debug, ulong, 0600);
 #else
-/* classnames must match vals of enum drm_debug_category */
-DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
-			"DRM_UT_CORE",
-			"DRM_UT_DRIVER",
-			"DRM_UT_KMS",
-			"DRM_UT_PRIME",
-			"DRM_UT_ATOMIC",
-			"DRM_UT_VBL",
-			"DRM_UT_STATE",
-			"DRM_UT_LEASE",
-			"DRM_UT_DP",
-			"DRM_UT_DRMRES");
+/* classnames must match value-symbols of enum drm_debug_category */
+DRM_CLASSMAP_DEFINE(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS,
+		    DRM_UT_CORE,
+		    "DRM_UT_CORE",
+		    "DRM_UT_DRIVER",
+		    "DRM_UT_KMS",
+		    "DRM_UT_PRIME",
+		    "DRM_UT_ATOMIC",
+		    "DRM_UT_VBL",
+		    "DRM_UT_STATE",
+		    "DRM_UT_LEASE",
+		    "DRM_UT_DP",
+		    "DRM_UT_DRMRES");
 
 static struct ddebug_class_param drm_debug_bitmap = {
 	.bits = &__drm_debug,
diff --git a/drivers/gpu/drm/i915/i915_params.c b/drivers/gpu/drm/i915/i915_params.c
index 0a171b57fd8f..d870e15da21c 100644
--- a/drivers/gpu/drm/i915/i915_params.c
+++ b/drivers/gpu/drm/i915/i915_params.c
@@ -29,17 +29,7 @@
 #include "i915_params.h"
 #include "i915_drv.h"
 
-DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
-			"DRM_UT_CORE",
-			"DRM_UT_DRIVER",
-			"DRM_UT_KMS",
-			"DRM_UT_PRIME",
-			"DRM_UT_ATOMIC",
-			"DRM_UT_VBL",
-			"DRM_UT_STATE",
-			"DRM_UT_LEASE",
-			"DRM_UT_DP",
-			"DRM_UT_DRMRES");
+DRM_CLASSMAP_USE(drm_debug_classes);
 
 #define i915_param_named(name, T, perm, desc) \
 	module_param_named(name, i915_modparams.name, T, perm); \
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 4396f501b16a..65006274be9d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -72,17 +72,7 @@
 #include "nouveau_uvmm.h"
 #include "nouveau_sched.h"
 
-DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
-			"DRM_UT_CORE",
-			"DRM_UT_DRIVER",
-			"DRM_UT_KMS",
-			"DRM_UT_PRIME",
-			"DRM_UT_ATOMIC",
-			"DRM_UT_VBL",
-			"DRM_UT_STATE",
-			"DRM_UT_LEASE",
-			"DRM_UT_DP",
-			"DRM_UT_DRMRES");
+DRM_CLASSMAP_USE(drm_debug_classes);
 
 MODULE_PARM_DESC(config, "option string to pass to driver core");
 static char *nouveau_config;
diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index 67d8dd2f1bde..5451f926a753 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -366,6 +366,7 @@
 	/* implement dynamic printk debug */				\
 	. = ALIGN(8);							\
 	BOUNDED_SECTION_BY(__dyndbg_classes, ___dyndbg_classes)		\
+	BOUNDED_SECTION_BY(__dyndbg_class_users, ___dyndbg_class_users)	\
 	BOUNDED_SECTION_BY(__dyndbg, ___dyndbg)				\
 	LIKELY_PROFILE()		       				\
 	BRANCH_PROFILE()						\
diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index a93a387f8a1a..706afc97c79c 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -276,7 +276,7 @@ static inline struct drm_printer drm_err_printer(const char *prefix)
  *
  */
 enum drm_debug_category {
-	/* These names must match those in DYNAMIC_DEBUG_CLASSBITS */
+	/* Keep DRM_CLASSMAP_DEFINE args in sync with any changes here */
 	/**
 	 * @DRM_UT_CORE: Used in the generic drm code: drm_ioctl.c, drm_mm.c,
 	 * drm_memory.c, ...
@@ -321,6 +321,14 @@ enum drm_debug_category {
 	DRM_UT_DRMRES
 };
 
+#ifdef CONFIG_DRM_USE_DYNAMIC_DEBUG
+#define DRM_CLASSMAP_DEFINE(...) DYNDBG_CLASSMAP_DEFINE(__VA_ARGS__)
+#define DRM_CLASSMAP_USE(name)   DYNDBG_CLASSMAP_USE(name)
+#else
+#define DRM_CLASSMAP_DEFINE(...)
+#define DRM_CLASSMAP_USE(name)
+#endif
+
 static inline bool drm_debug_enabled_raw(enum drm_debug_category category)
 {
 	return unlikely(__drm_debug & BIT(category));
diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 8eaf8eabdc8d..1b027be2cdc4 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -58,7 +58,7 @@ struct _ddebug {
 #endif
 } __attribute__((aligned(8)));
 
-enum class_map_type {
+enum ddebug_class_map_type {
 	DD_CLASS_TYPE_DISJOINT_BITS,
 	/**
 	 * DD_CLASS_TYPE_DISJOINT_BITS: classes are independent, mapped to bits[0..N].
@@ -72,24 +72,27 @@ enum class_map_type {
 };
 
 struct ddebug_class_map {
-	struct module *mod;
-	const char *mod_name;	/* needed for builtins */
+	const struct module *mod;		/* NULL for builtins */
+	const char *mod_name;
 	const char **class_names;
 	const int length;
 	const int base;		/* index of 1st .class_id, allows split/shared space */
-	enum class_map_type map_type;
+	enum ddebug_class_map_type map_type;
 };
 
 /**
- * DECLARE_DYNDBG_CLASSMAP - declare classnames known by a module
- * @_var:   a struct ddebug_class_map, passed to module_param_cb
- * @_type:  enum class_map_type, chooses bits/verbose, numeric/symbolic
- * @_base:  offset of 1st class-name. splits .class_id space
- * @classes: class-names used to control class'd prdbgs
+ * DYNDBG_CLASSMAP_DEFINE - define a set of debug-classes used by a module.
+ * @_var:   name of the classmap, exported for other modules coordinated use.
+ * @_type:  enum ddebug_class_map_type, chooses bits/verbose, numeric/names.
+ * @_base:  offset of 1st class-name, used to share 0..62 classid space
+ * @classes: vals are stringified enum-vals, like DRM_UT_*
+ *
+ * Defines and exports a struct ddebug_class_map whose @classes are
+ * used to validate a "class FOO .." >control command on the module
  */
-#define DECLARE_DYNDBG_CLASSMAP(_var, _maptype, _base, ...)		\
-	static const char *_var##_classnames[] = { __VA_ARGS__ };	\
-	static struct ddebug_class_map __aligned(8) __used		\
+#define DYNDBG_CLASSMAP_DEFINE(_var, _maptype, _base, ...)		\
+	const char *_var##_classnames[] = { __VA_ARGS__ };		\
+	struct ddebug_class_map __aligned(8) __used			\
 		__section("__dyndbg_classes") _var = {			\
 		.mod = THIS_MODULE,					\
 		.mod_name = KBUILD_MODNAME,				\
@@ -97,14 +100,40 @@ struct ddebug_class_map {
 		.map_type = _maptype,					\
 		.length = ARRAY_SIZE(_var##_classnames),		\
 		.class_names = _var##_classnames,			\
+	};								\
+	EXPORT_SYMBOL(_var)
+
+struct ddebug_class_user {
+	char *user_mod_name;
+	struct ddebug_class_map *map;
+};
+
+/**
+ * DYNDBG_CLASSMAP_USE - refer to a classmap, DEFINEd elsewhere.
+ * @_var: name of the exported classmap var
+ *
+ * This registers a module's use of another module's classmap defn, so
+ * dyndbg can authorize "class DRM_CORE ..." >control commands upon
+ * this module.
+ */
+#define DYNDBG_CLASSMAP_USE(_var)					\
+	DYNDBG_CLASSMAP_USE_(_var, __UNIQUE_ID(ddebug_class_user))
+#define DYNDBG_CLASSMAP_USE_(_var, _uname)				\
+	extern struct ddebug_class_map _var;				\
+	static struct ddebug_class_user __aligned(8) __used		\
+	__section("__dyndbg_class_users") _uname = {			\
+		.user_mod_name = KBUILD_MODNAME,			\
+		.map = &_var,						\
 	}
 
 /* encapsulate linker provided built-in (or module) dyndbg data */
 struct _ddebug_info {
 	struct _ddebug *descs;
 	struct ddebug_class_map *classes;
+	struct ddebug_class_user *class_users;
 	unsigned int num_descs;
 	unsigned int num_classes;
+	unsigned int num_class_users;
 };
 
 struct ddebug_class_param {
diff --git a/kernel/module/main.c b/kernel/module/main.c
index 98fedfdb8db5..6b0b0d82b5ab 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -2214,6 +2214,9 @@ static int find_module_sections(struct module *mod, struct load_info *info)
 	mod->dyndbg_info.classes = section_objs(info, "__dyndbg_classes",
 						sizeof(*mod->dyndbg_info.classes),
 						&mod->dyndbg_info.num_classes);
+	mod->dyndbg_info.class_users = section_objs(info, "__dyndbg_class_users",
+						    sizeof(*mod->dyndbg_info.class_users),
+						   &mod->dyndbg_info.num_class_users);
 #endif
 
 	return 0;
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index fa307f93fa2e..d015687e845c 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2808,12 +2808,24 @@ config TEST_STATIC_KEYS
 	  If unsure, say N.
 
 config TEST_DYNAMIC_DEBUG
-	tristate "Test DYNAMIC_DEBUG"
-	depends on DYNAMIC_DEBUG
+	tristate "Build test-dynamic-debug module"
+	depends on DYNAMIC_DEBUG || DYNAMIC_DEBUG_CORE
+	help
+	  This module works/demo's the dyndbg's classmap API, by
+	  creating 2 classes: a DISJOINT classmap (like DRM.debug)
+	  and a LEVELS/VERBOSE classmap (like verbose2 > verbose1).
+
+	  If unsure, say N.
+
+config TEST_DYNAMIC_DEBUG_SUBMOD
+	tristate "Build test-dynamic-debug submodule"
+	default m
+	depends on DYNAMIC_DEBUG || DYNAMIC_DEBUG_CORE
+	depends on TEST_DYNAMIC_DEBUG
 	help
-	  This module registers a tracer callback to count enabled
-	  pr_debugs in a 'do_debugging' function, then alters their
-	  enablements, calls the function, and compares counts.
+	  This sub-module depends upon a classmap defined in the
+	  super-module.  It it independently settable=m/y to allow all
+	  proper combinations of parent=y/m submod=y/m
 
 	  If unsure, say N.
 
diff --git a/lib/Makefile b/lib/Makefile
index 740109b6e2c8..2d4c7b689bbf 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -81,6 +81,7 @@ obj-$(CONFIG_TEST_USER_COPY) += test_user_copy.o
 obj-$(CONFIG_TEST_STATIC_KEYS) += test_static_keys.o
 obj-$(CONFIG_TEST_STATIC_KEYS) += test_static_key_base.o
 obj-$(CONFIG_TEST_DYNAMIC_DEBUG) += test_dynamic_debug.o
+obj-$(CONFIG_TEST_DYNAMIC_DEBUG_SUBMOD) += test_dynamic_debug_submod.o
 obj-$(CONFIG_TEST_PRINTF) += test_printf.o
 obj-$(CONFIG_TEST_SCANF) += test_scanf.o
 
@@ -240,6 +241,8 @@ obj-$(CONFIG_HAVE_ARCH_TRACEHOOK) += syscall.o
 obj-$(CONFIG_DYNAMIC_DEBUG_CORE) += dynamic_debug.o
 #ensure exported functions have prototypes
 CFLAGS_dynamic_debug.o := -DDYNAMIC_DEBUG_MODULE
+CFLAGS_test_dynamic_debug.o := -DDYNAMIC_DEBUG_MODULE
+CFLAGS_test_dynamic_debug_submod.o := -DDYNAMIC_DEBUG_MODULE
 
 obj-$(CONFIG_SYMBOLIC_ERRNAME) += errname.o
 
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 91c8b67fd8f8..be49e104ec76 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -43,13 +43,16 @@ extern struct _ddebug __start___dyndbg[];
 extern struct _ddebug __stop___dyndbg[];
 extern struct ddebug_class_map __start___dyndbg_classes[];
 extern struct ddebug_class_map __stop___dyndbg_classes[];
+extern struct ddebug_class_user __start___dyndbg_class_users[];
+extern struct ddebug_class_user __stop___dyndbg_class_users[];
 
 struct ddebug_table {
 	struct list_head link;
 	const char *mod_name;
 	struct _ddebug *ddebugs;
 	struct ddebug_class_map *classes;
-	unsigned int num_ddebugs, num_classes;
+	struct ddebug_class_user *class_users;
+	unsigned int num_ddebugs, num_classes, num_class_users;
 };
 
 struct ddebug_query {
@@ -148,21 +151,39 @@ static void vpr_info_dq(const struct ddebug_query *query, const char *msg)
 		  query->first_lineno, query->last_lineno, query->class_string);
 }
 
+#define vpr_dt_info(dt_p, msg_p, ...) ({				\
+	struct ddebug_table const *_dt = dt_p;				\
+	v2pr_info(msg_p " module:%s nd:%d nc:%d nu:%d\n", ##__VA_ARGS__, \
+		  _dt->mod_name, _dt->num_ddebugs, _dt->num_classes,	\
+		  _dt->num_class_users);				\
+	})
+
 #define __outvar /* filled by callee */
 static struct ddebug_class_map *ddebug_find_valid_class(struct ddebug_table const *dt,
 							const char *class_string,
 							__outvar int *class_id)
 {
 	struct ddebug_class_map *map;
+	struct ddebug_class_user *cli;
 	int i, idx;
 
-	for (map = dt->classes, i = 0; i < dt->num_classes; i++, map++) {
+	for (i = 0, map = dt->classes; i < dt->num_classes; i++, map++) {
 		idx = match_string(map->class_names, map->length, class_string);
 		if (idx >= 0) {
 			*class_id = idx + map->base;
+			vpr_dt_info(dt, "good-class: %s.%s ", map->mod_name, class_string);
 			return map;
 		}
 	}
+	for (i = 0, cli = dt->class_users; i < dt->num_class_users; i++, cli++) {
+		idx = match_string(cli->map->class_names, cli->map->length, class_string);
+		if (idx >= 0) {
+			*class_id = idx + cli->map->base;
+			vpr_dt_info(dt, "class-ref: %s.%s ",
+				    cli->user_mod_name, class_string);
+			return cli->map;
+		}
+	}
 	*class_id = -ENOENT;
 	return NULL;
 }
@@ -555,7 +576,7 @@ static int ddebug_exec_query(char *query_string, const char *modname)
 
 /* handle multiple queries in query string, continue on error, return
    last error or number of matching callsites.  Module name is either
-   in param (for boot arg) or perhaps in query string.
+   in the modname arg (for boot args) or perhaps in query string.
 */
 static int ddebug_exec_queries(char *query, const char *modname)
 {
@@ -684,12 +705,12 @@ static int param_set_dyndbg_module_classes(const char *instr,
 }
 
 /**
- * param_set_dyndbg_classes - class FOO >control
+ * param_set_dyndbg_classes - set all classes in a classmap
  * @instr: string echo>d to sysfs, input depends on map_type
- * @kp:    kp->arg has state: bits/lvl, map, map_type
+ * @kp:    kp->arg has state: bits/lvl, classmap, map_type
  *
- * Enable/disable prdbgs by their class, as given in the arguments to
- * DECLARE_DYNDBG_CLASSMAP.  For LEVEL map-types, enforce relative
+ * For all classes in the classmap, enable/disable them per the input
+ * (depending on map_type).  For LEVEL map-types, enforce relative
  * levels by bitpos.
  *
  * Returns: 0 or <0 if error.
@@ -1034,12 +1055,17 @@ static void *ddebug_proc_next(struct seq_file *m, void *p, loff_t *pos)
 static const char *ddebug_class_name(struct ddebug_table *dt, struct _ddebug *dp)
 {
 	struct ddebug_class_map *map = dt->classes;
+	struct ddebug_class_user *cli = dt->class_users;
 	int i;
 
 	for (i = 0; i < dt->num_classes; i++, map++)
 		if (class_in_range(dp->class_id, map))
 			return map->class_names[dp->class_id - map->base];
 
+	for (i = 0; i < dt->num_class_users; i++, cli++)
+		if (class_in_range(dp->class_id, cli->map))
+			return cli->map->class_names[dp->class_id - cli->map->base];
+
 	return NULL;
 }
 
@@ -1120,31 +1146,133 @@ static const struct proc_ops proc_fops = {
 	.proc_write = ddebug_proc_write
 };
 
+static const char * const ddebug_classmap_typenames[] = {
+	"DISJOINT_BITS", "LEVEL_NUM", "DISJOINT_NAMES", "LEVEL_NAMES"
+};
+
+#define vpr_cm_info(cm_p, msg_p, ...) ({				\
+	struct ddebug_class_map const *_cm = cm_p;			\
+	v2pr_info(msg_p " module:%s base:%d len:%d type:%s\n", ##__VA_ARGS__, \
+		  _cm->mod_name, _cm->base, _cm->length,		\
+		  ddebug_classmap_typenames[_cm->map_type]);		\
+	})
+
+static void ddebug_sync_classbits(const struct ddebug_class_param *dcp, const char *modname)
+{
+	/* clamp initial bitvec, mask off hi-bits */
+	if (*dcp->bits & ~CLASSMAP_BITMASK(dcp->map->length)) {
+		*dcp->bits &= CLASSMAP_BITMASK(dcp->map->length);
+		v2pr_info("preset classbits: %lx\n", *dcp->bits);
+	}
+	/* force class'd prdbgs (in USEr module) to match (DEFINEr module) class-param */
+	ddebug_apply_class_bitmap(dcp, dcp->bits, ~0, modname);
+	ddebug_apply_class_bitmap(dcp, dcp->bits, 0, modname);
+}
+
+static void ddebug_match_apply_kparam(const struct kernel_param *kp,
+				      const struct ddebug_class_map *map,
+				      const char *modnm)
+{
+	struct ddebug_class_param *dcp;
+
+	if (kp->ops != &param_ops_dyndbg_classes)
+		return;
+
+	dcp = (struct ddebug_class_param *)kp->arg;
+
+	if (map == dcp->map) {
+		v2pr_info("found kp:%s =0x%lx", kp->name, *dcp->bits);
+		vpr_cm_info(map, "mapped to:");
+		ddebug_sync_classbits(dcp, modnm);
+	}
+}
+
+static void ddebug_apply_params(const struct ddebug_class_map *cm, const char *modnm)
+{
+	const struct kernel_param *kp;
+#if IS_ENABLED(CONFIG_MODULES)
+	int i;
+
+	if (cm->mod) {
+		vpr_cm_info(cm, "loaded class:");
+		for (i = 0, kp = cm->mod->kp; i < cm->mod->num_kp; i++, kp++)
+			ddebug_match_apply_kparam(kp, cm, modnm);
+	}
+#endif
+	if (!cm->mod) {
+		vpr_cm_info(cm, "builtin class:");
+		for (kp = __start___param; kp < __stop___param; kp++)
+			ddebug_match_apply_kparam(kp, cm, modnm);
+	}
+}
+
+/*
+ * Find this module's classmaps in a sub/whole-range of the builtin/
+ * modular classmap vector/section.  Save the start and length of the
+ * subrange at its edges.
+ */
 static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug_info *di)
 {
 	struct ddebug_class_map *cm;
 	int i, nc = 0;
 
-	/*
-	 * Find this module's classmaps in a subrange/wholerange of
-	 * the builtin/modular classmap vector/section.  Save the start
-	 * and length of the subrange at its edges.
-	 */
-	for (cm = di->classes, i = 0; i < di->num_classes; i++, cm++) {
+	for (i = 0, cm = di->classes; i < di->num_classes; i++, cm++) {
 
 		if (!strcmp(cm->mod_name, dt->mod_name)) {
-			if (!nc) {
-				v2pr_info("start subrange, class[%d]: module:%s base:%d len:%d ty:%d\n",
-					  i, cm->mod_name, cm->base, cm->length, cm->map_type);
+			vpr_cm_info(cm, "classes[%d]:", i);
+			if (!nc++)
 				dt->classes = cm;
-			}
-			nc++;
 		}
 	}
-	if (nc) {
-		dt->num_classes = nc;
-		vpr_info("module:%s attached %d classes\n", dt->mod_name, nc);
+	if (!nc)
+		return;
+
+	vpr_info("module:%s attached %d classes\n", dt->mod_name, nc);
+	dt->num_classes = nc;
+
+	for (i = 0, cm = dt->classes; i < dt->num_classes; i++, cm++)
+		ddebug_apply_params(cm, cm->mod_name);
+}
+
+/*
+ * propagates class-params thru their classmaps to class-users.  this
+ * means a query against the dt/module, which means it must be on the
+ * list to be seen by ddebug_change.
+ */
+static void ddebug_attach_user_module_classes(struct ddebug_table *dt,
+					      const struct _ddebug_info *di)
+{
+	struct ddebug_class_user *cli;
+	int i, nc = 0;
+
+	/*
+	 * For builtins: scan the array, find start/length of this
+	 * module's refs, save to dt.  For loadables, this is the
+	 * whole array.
+	 */
+	for (i = 0, cli = di->class_users; i < di->num_class_users; i++, cli++) {
+
+		if (WARN_ON(!cli || !cli->map || !cli->user_mod_name))
+			continue;
+
+		if (!strcmp(cli->user_mod_name, dt->mod_name)) {
+
+			vpr_cm_info(cli->map, "class_ref[%d] %s -> %s", i,
+				    cli->user_mod_name, cli->map->mod_name);
+			if (!nc++)
+				dt->class_users = cli;
+		}
 	}
+	if (!nc)
+		return;
+
+	dt->num_class_users = nc;
+
+	/* now iterate dt */
+	for (i = 0, cli = dt->class_users; i < dt->num_class_users; i++, cli++)
+		ddebug_apply_params(cli->map, cli->user_mod_name);
+
+	vpr_dt_info(dt, "attach-client-module: ");
 }
 
 /*
@@ -1154,6 +1282,8 @@ static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug
 static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 {
 	struct ddebug_table *dt;
+	struct _ddebug *iter;
+	int i, class_ct = 0;
 
 	if (!di->num_descs)
 		return 0;
@@ -1177,13 +1307,20 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 
 	INIT_LIST_HEAD(&dt->link);
 
-	if (di->classes && di->num_classes)
+	for_each_boxed_vector(di, descs, num_descs, i, iter)
+		if (iter->class_id != _DPRINTK_CLASS_DFLT)
+			class_ct++;
+
+	if (class_ct && di->num_classes)
 		ddebug_attach_module_classes(dt, di);
 
 	mutex_lock(&ddebug_lock);
 	list_add_tail(&dt->link, &ddebug_tables);
 	mutex_unlock(&ddebug_lock);
 
+	if (class_ct && di->num_class_users)
+		ddebug_attach_user_module_classes(dt, di);
+
 	vpr_info("%3u debug prints in module %s\n", di->num_descs, modname);
 	return 0;
 }
@@ -1333,8 +1470,10 @@ static int __init dynamic_debug_init(void)
 	struct _ddebug_info di = {
 		.descs = __start___dyndbg,
 		.classes = __start___dyndbg_classes,
+		.class_users = __start___dyndbg_class_users,
 		.num_descs = __stop___dyndbg - __start___dyndbg,
 		.num_classes = __stop___dyndbg_classes - __start___dyndbg_classes,
+		.num_class_users = __stop___dyndbg_class_users - __start___dyndbg_class_users,
 	};
 
 #ifdef CONFIG_MODULES
diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index 229eaadee838..23967071b60f 100644
--- a/lib/test_dynamic_debug.c
+++ b/lib/test_dynamic_debug.c
@@ -6,11 +6,15 @@
  *      Jim Cromie	<jim.cromie@gmail.com>
  */
 
-#define pr_fmt(fmt) "test_dd: " fmt
+#if defined(TEST_DYNAMIC_DEBUG_SUBMOD)
+  #define pr_fmt(fmt) "test_dd_submod: " fmt
+#else
+  #define pr_fmt(fmt) "test_dd: " fmt
+#endif
 
 #include <linux/module.h>
 
-/* run tests by reading or writing sysfs node: do_prints */
+/* re-gen output by reading or writing sysfs node: do_prints */
 
 static void do_prints(void); /* device under test */
 static int param_set_do_prints(const char *instr, const struct kernel_param *kp)
@@ -29,24 +33,39 @@ static const struct kernel_param_ops param_ops_do_prints = {
 };
 module_param_cb(do_prints, &param_ops_do_prints, NULL, 0600);
 
-/*
- * Using the CLASSMAP api:
- * - classmaps must have corresponding enum
- * - enum symbols must match/correlate with class-name strings in the map.
- * - base must equal enum's 1st value
- * - multiple maps must set their base to share the 0-30 class_id space !!
- *   (build-bug-on tips welcome)
- * Additionally, here:
- * - tie together sysname, mapname, bitsname, flagsname
- */
-#define DD_SYS_WRAP(_model, _flags)					\
-	static unsigned long bits_##_model;				\
-	static struct ddebug_class_param _flags##_model = {		\
+#define CLASSMAP_BITMASK(width, base) (((1UL << (width)) - 1) << base)
+
+/* sysfs param wrapper, proto-API */
+#define DYNDBG_CLASSMAP_PARAM_(_model, _flags, _init)			\
+	static unsigned long bits_##_model = _init;			\
+	static struct ddebug_class_param _flags##_##_model = {		\
 		.bits = &bits_##_model,					\
 		.flags = #_flags,					\
 		.map = &map_##_model,					\
 	};								\
-	module_param_cb(_flags##_##_model, &param_ops_dyndbg_classes, &_flags##_model, 0600)
+	module_param_cb(_flags##_##_model, &param_ops_dyndbg_classes,	\
+			&_flags##_##_model, 0600)
+#ifdef DEBUG
+#define DYNDBG_CLASSMAP_PARAM(_model, _flags)  DYNDBG_CLASSMAP_PARAM_(_model, _flags, ~0)
+#else
+#define DYNDBG_CLASSMAP_PARAM(_model, _flags)  DYNDBG_CLASSMAP_PARAM_(_model, _flags, 0)
+#endif
+
+/*
+ * Demonstrate/test all 4 class-typed classmaps with a sys-param.
+ *
+ * Each is 3 part: client-enum decl, _DEFINE, _PARAM.
+ * Declare them in blocks to show patterns of use (repetitions and
+ * changes) within each.
+ *
+ * 1st, dyndbg expects a client-provided enum-type as source of
+ * category/classid truth.  DRM has DRM_UT_<CORE,DRIVER,KMS,etc>.
+ *
+ * Modules with multiple CLASSMAPS must have enums with distinct
+ * value-ranges, arranged below with explicit enum_sym = X inits.
+ *
+ * Declare all 4 enums now, for different types
+ */
 
 /* numeric input, independent bits */
 enum cat_disjoint_bits {
@@ -60,40 +79,57 @@ enum cat_disjoint_bits {
 	D2_LEASE,
 	D2_DP,
 	D2_DRMRES };
-DECLARE_DYNDBG_CLASSMAP(map_disjoint_bits, DD_CLASS_TYPE_DISJOINT_BITS, 0,
-			"D2_CORE",
-			"D2_DRIVER",
-			"D2_KMS",
-			"D2_PRIME",
-			"D2_ATOMIC",
-			"D2_VBL",
-			"D2_STATE",
-			"D2_LEASE",
-			"D2_DP",
-			"D2_DRMRES");
-DD_SYS_WRAP(disjoint_bits, p);
-DD_SYS_WRAP(disjoint_bits, T);
-
-/* symbolic input, independent bits */
-enum cat_disjoint_names { LOW = 10, MID, HI };
-DECLARE_DYNDBG_CLASSMAP(map_disjoint_names, DD_CLASS_TYPE_DISJOINT_NAMES, 10,
-			"LOW", "MID", "HI");
-DD_SYS_WRAP(disjoint_names, p);
-DD_SYS_WRAP(disjoint_names, T);
 
 /* numeric verbosity, V2 > V1 related */
 enum cat_level_num { V0 = 14, V1, V2, V3, V4, V5, V6, V7 };
-DECLARE_DYNDBG_CLASSMAP(map_level_num, DD_CLASS_TYPE_LEVEL_NUM, 14,
-		       "V0", "V1", "V2", "V3", "V4", "V5", "V6", "V7");
-DD_SYS_WRAP(level_num, p);
-DD_SYS_WRAP(level_num, T);
 
-/* symbolic verbosity */
+/* named-symbolic input, independent bits */
+enum cat_disjoint_names { LOW = 10, MID, HI };
+
+/* named-symbolic verbosity */
 enum cat_level_names { L0 = 22, L1, L2, L3, L4, L5, L6, L7 };
-DECLARE_DYNDBG_CLASSMAP(map_level_names, DD_CLASS_TYPE_LEVEL_NAMES, 22,
-			"L0", "L1", "L2", "L3", "L4", "L5", "L6", "L7");
-DD_SYS_WRAP(level_names, p);
-DD_SYS_WRAP(level_names, T);
+
+/* recapitulate DRM's parent(drm.ko) <-- _submod(drivers,helpers) */
+#if !defined(TEST_DYNAMIC_DEBUG_SUBMOD)
+/*
+ * In single user, or parent / coordinator (drm.ko) modules, define
+ * classmaps on the client enums above, and then declares the PARAMS
+ * ref'g the classmaps.  Each is exported.
+ */
+DYNDBG_CLASSMAP_DEFINE(map_disjoint_bits, DD_CLASS_TYPE_DISJOINT_BITS,
+		       D2_CORE,
+		       "D2_CORE",
+		       "D2_DRIVER",
+		       "D2_KMS",
+		       "D2_PRIME",
+		       "D2_ATOMIC",
+		       "D2_VBL",
+		       "D2_STATE",
+		       "D2_LEASE",
+		       "D2_DP",
+		       "D2_DRMRES");
+
+DYNDBG_CLASSMAP_DEFINE(map_level_num, DD_CLASS_TYPE_LEVEL_NUM,
+		       V0, "V0", "V1", "V2", "V3", "V4", "V5", "V6", "V7");
+
+/*
+ * now add the sysfs-params
+ */
+
+DYNDBG_CLASSMAP_PARAM(disjoint_bits, p);
+DYNDBG_CLASSMAP_PARAM(level_num, p);
+
+#else /* TEST_DYNAMIC_DEBUG_SUBMOD */
+
+/*
+ * in submod/drm-drivers, use the classmaps defined in top/parent
+ * module above.
+ */
+
+DYNDBG_CLASSMAP_USE(map_disjoint_bits);
+DYNDBG_CLASSMAP_USE(map_level_num);
+
+#endif
 
 /* stand-in for all pr_debug etc */
 #define prdbg(SYM) __pr_debug_cls(SYM, #SYM " msg\n")
@@ -129,6 +165,7 @@ static void do_levels(void)
 
 static void do_prints(void)
 {
+	pr_debug("do_prints:\n");
 	do_cats();
 	do_levels();
 }
diff --git a/lib/test_dynamic_debug_submod.c b/lib/test_dynamic_debug_submod.c
new file mode 100644
index 000000000000..9a893402ce1a
--- /dev/null
+++ b/lib/test_dynamic_debug_submod.c
@@ -0,0 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Kernel module for testing dynamic_debug
+ *
+ * Authors:
+ *      Jim Cromie	<jim.cromie@gmail.com>
+ */
+
+#define TEST_DYNAMIC_DEBUG_SUBMOD
+#include "test_dynamic_debug.c"
-- 
2.41.0

