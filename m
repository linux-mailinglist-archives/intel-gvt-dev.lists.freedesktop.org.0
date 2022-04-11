Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC604FBE7F
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 11 Apr 2022 16:14:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A09110E827;
	Mon, 11 Apr 2022 14:14:24 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58F7910E3FC;
 Mon, 11 Apr 2022 14:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=BLKPzt6UhuF0qWHtONyuatQ8VTYibdXrDV6MGR+HIHQ=; b=nG6hwjmN+lf16CyFUQTt37hva5
 avEQman3t2gqcLb5L4Dra7rS28UqtElcpPcL5WdYZetXO4/KiKAwESxlVuP2q9d4NU1B2/lbSPfnq
 dBuBCZf/3UeEdw8RtAGI4wjoNR8sT5/8+I457uDJPXKdfTyFFJVLyiqxTssR92iECrd0U+F0CdCu9
 vlkZI3TFN3Yvr6RLJkTAGJJ8+goFzWjadSejD1r3bH/lz0tI04yomis5Ul30X0Jtn/o8d4XT2V/FR
 IkvynxvFJAKNDIlzAYkqop9J7fMQm36wdrefcNR5p46/y9uRaet0C/74ZA+74D+vUKZ6xI2qGRJnQ
 Zb0QLagA==;
Received: from [2001:4bb8:18e:76f5:3747:ef85:d03d:53e4] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nduo8-009KLU-Hr; Mon, 11 Apr 2022 14:14:21 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH 04/34] drm/i915/gvt: don't override the include path
Date: Mon, 11 Apr 2022 16:13:33 +0200
Message-Id: <20220411141403.86980-5-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220411141403.86980-1-hch@lst.de>
References: <20220411141403.86980-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Jason Gunthorpe <jgg@nvidia.com>,
 linux-kernel@vger.kernel.org
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

drivers/gpu/drm/i915/gvt/Makefile is included
from drivers/gpu/drm/i915/Makefile and thus inherits the normal include
path relative to drivers/gpu/drm/i915/.  Fix up the gvt-specific trace
header and just do away with the include path manipulation.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/gpu/drm/i915/gvt/Makefile | 1 -
 drivers/gpu/drm/i915/gvt/trace.h  | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/Makefile b/drivers/gpu/drm/i915/gvt/Makefile
index ea8324abc784a..4d70f4689479c 100644
--- a/drivers/gpu/drm/i915/gvt/Makefile
+++ b/drivers/gpu/drm/i915/gvt/Makefile
@@ -5,5 +5,4 @@ GVT_SOURCE := gvt.o aperture_gm.o handlers.o vgpu.o trace_points.o firmware.o \
 	execlist.o scheduler.o sched_policy.o mmio_context.o cmd_parser.o debugfs.o \
 	fb_decoder.o dmabuf.o page_track.o
 
-ccflags-y				+= -I $(srctree)/$(src) -I $(srctree)/$(src)/$(GVT_DIR)/
 i915-y					+= $(addprefix $(GVT_DIR)/, $(GVT_SOURCE))
diff --git a/drivers/gpu/drm/i915/gvt/trace.h b/drivers/gpu/drm/i915/gvt/trace.h
index 6d787750d279f..348f57f8301db 100644
--- a/drivers/gpu/drm/i915/gvt/trace.h
+++ b/drivers/gpu/drm/i915/gvt/trace.h
@@ -379,5 +379,5 @@ TRACE_EVENT(render_mmio,
 #undef TRACE_INCLUDE_PATH
 #define TRACE_INCLUDE_PATH .
 #undef TRACE_INCLUDE_FILE
-#define TRACE_INCLUDE_FILE trace
+#define TRACE_INCLUDE_FILE gvt/trace
 #include <trace/define_trace.h>
-- 
2.30.2

