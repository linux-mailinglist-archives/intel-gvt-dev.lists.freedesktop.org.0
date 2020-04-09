Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E920F1A36D3
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  9 Apr 2020 17:20:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88FCB6EBDC;
	Thu,  9 Apr 2020 15:20:05 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
X-Greylist: delayed 494 seconds by postgrey-1.36 at gabe;
 Thu, 09 Apr 2020 15:20:04 UTC
Received: from condef-03.nifty.com (condef-03.nifty.com [202.248.20.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 064656EBDC
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  9 Apr 2020 15:20:03 +0000 (UTC)
Received: from conuserg-07.nifty.com ([10.126.8.70])by condef-03.nifty.com
 with ESMTP id 039F7TL6009353
 for <intel-gvt-dev@lists.freedesktop.org>; Fri, 10 Apr 2020 00:07:29 +0900
Received: from grover.flets-west.jp (softbank126125134031.bbtec.net
 [126.125.134.31]) (authenticated)
 by conuserg-07.nifty.com with ESMTP id 039F6Zj5025357;
 Fri, 10 Apr 2020 00:06:35 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 039F6Zj5025357
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1586444796;
 bh=MUvhE7+ejNToesPB6VeHbyGzSUZRlpfGDiwXF83CYes=;
 h=From:To:Cc:Subject:Date:From;
 b=Kf3cMpbBc7OAc9Kj4TUDvcl/BH0s2qTuTc8GtX1PMo37ZfxzNtV0xNnNoo0YHsO8A
 ToUncwvbr8EajVFIR+00idM6Yqv1lpUL4PjyCUz8DYcNUyqmmnBPeJRryfpkCfNY1a
 DIXACKztrm35yW7/5yhRAz74W5fx4evOAI1hMx6bJaiWxT3l6SOrG+zZKSy8asezMa
 9DAGyKq+Y43YpV5Qa+HU2TXQylFErvINQtXg78b8v0GG0+g1bF/x+5r039CfTHokXD
 ohok4xDS9drR3H/wmuoXh7noiGZMs7A9U3Rnn4dpGvGkplfjjo57Cr5fraxMKms4zU
 djioWoz6BTdrA==
X-Nifty-SrcIP: [126.125.134.31]
From: Masahiro Yamada <masahiroy@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/i915: remove unneeded ccflags-y from gvt/Makefile
Date: Fri, 10 Apr 2020 00:06:26 +0900
Message-Id: <20200409150627.29205-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
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
Cc: David Airlie <airlied@linux.ie>, Masahiro Yamada <masahiroy@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

When CONFIG_DRM_I915_GVT=y, the same include path is added twice.

drivers/gpu/drm/i915/Makefile specifies:

  subdir-ccflags-y += -I$(srctree)/$(src)

drivers/gpu/drm/i915/gvt/Makefile adds the second '-I $(srctree)/$(src)',
which is redundant.

The include path '-I $(srctree)/$(src)/$(GVT_DIR)/' is added to allow
include/trace/define_trace.h to find the gvt/trace.h

By setting the correct relative path to TRACE_INCLUDE_PATH, this -I
is also unneeded.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 drivers/gpu/drm/i915/gvt/Makefile | 1 -
 drivers/gpu/drm/i915/gvt/trace.h  | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/Makefile b/drivers/gpu/drm/i915/gvt/Makefile
index ea8324abc784..4d70f4689479 100644
--- a/drivers/gpu/drm/i915/gvt/Makefile
+++ b/drivers/gpu/drm/i915/gvt/Makefile
@@ -5,5 +5,4 @@ GVT_SOURCE := gvt.o aperture_gm.o handlers.o vgpu.o trace_points.o firmware.o \
 	execlist.o scheduler.o sched_policy.o mmio_context.o cmd_parser.o debugfs.o \
 	fb_decoder.o dmabuf.o page_track.o
 
-ccflags-y				+= -I $(srctree)/$(src) -I $(srctree)/$(src)/$(GVT_DIR)/
 i915-y					+= $(addprefix $(GVT_DIR)/, $(GVT_SOURCE))
diff --git a/drivers/gpu/drm/i915/gvt/trace.h b/drivers/gpu/drm/i915/gvt/trace.h
index 6d787750d279..d63b7eef6179 100644
--- a/drivers/gpu/drm/i915/gvt/trace.h
+++ b/drivers/gpu/drm/i915/gvt/trace.h
@@ -377,7 +377,7 @@ TRACE_EVENT(render_mmio,
 
 /* This part must be out of protection */
 #undef TRACE_INCLUDE_PATH
-#define TRACE_INCLUDE_PATH .
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/i915/gvt
 #undef TRACE_INCLUDE_FILE
 #define TRACE_INCLUDE_FILE trace
 #include <trace/define_trace.h>
-- 
2.17.1

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
