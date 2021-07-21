Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5343D12DE
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 21 Jul 2021 17:54:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69C716E9A5;
	Wed, 21 Jul 2021 15:54:23 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E60FD6E98C;
 Wed, 21 Jul 2021 15:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=JrLica/ek2YskHpXI9fYj8ViRrznmZcuCcmQzFF5zvo=; b=nFxGbp4GGLb2Unz5PWTYnLyqcd
 dl0Hh87z6xUGmtpP2EQ3ifRZpXuSYvhIFWW6B/wQQuF5qvVGFNOgbwk+TuelahXAds9QudZ16vttI
 +qrJnlwBrXdQ6udL8Xi/9RGmBxO/pfGkRh0MqXhZwFy9RrlvrmTKth7dbmOnZn46W3cbnAUA9rIch
 CjHeiSTefR5Z+3JrBXOwK8Q8qkiye2aaQOKtiOVM2SW87lGrLNLZecgh9IZya+5N5oKH5Y7fTSBgV
 Aji6wu808SjUTdAVGb1YlWVzDV98luR9jFnD6/HfFDRhm2uTHGXwFaFjMEePcGdYwnMChoXSz8i6d
 iNWdGhfQ==;
Received: from [2001:4bb8:193:7660:d6d5:72f4:23f7:1898] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6EXk-009MDd-16; Wed, 21 Jul 2021 15:53:58 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: refactor the i915 GVT support
Date: Wed, 21 Jul 2021 17:53:34 +0200
Message-Id: <20210721155355.173183-1-hch@lst.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Hi all,

the GVT code in the i915 is a bit of a mess right now due to strange
abstractions and lots of indirect calls.  This series refactors various
bits to clean that up.  The main user visible change is that almost all
of the GVT code moves out of the main i915 driver and into the kvmgt
module.

Tested on my Thinkpad with a Kaby Lake CPU and integrated graphics.

Git tree:

    git://git.infradead.org/users/hch/misc.git i915-gvt

Gitweb:

    http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/i915-gvt

Diffstat:
 b/drivers/gpu/drm/i915/Kconfig                         |   31 
 b/drivers/gpu/drm/i915/Makefile                        |   30 
 b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c |    4 
 b/drivers/gpu/drm/i915/gvt/cfg_space.c                 |   89 --
 b/drivers/gpu/drm/i915/gvt/cmd_parser.c                |    4 
 b/drivers/gpu/drm/i915/gvt/dmabuf.c                    |   36 
 b/drivers/gpu/drm/i915/gvt/execlist.c                  |   12 
 b/drivers/gpu/drm/i915/gvt/gtt.c                       |   55 -
 b/drivers/gpu/drm/i915/gvt/gvt.c                       |  100 --
 b/drivers/gpu/drm/i915/gvt/gvt.h                       |  132 ++-
 b/drivers/gpu/drm/i915/gvt/interrupt.c                 |   38 -
 b/drivers/gpu/drm/i915/gvt/kvmgt.c                     |  634 ++++-------------
 b/drivers/gpu/drm/i915/gvt/mmio.c                      |    4 
 b/drivers/gpu/drm/i915/gvt/opregion.c                  |  148 ---
 b/drivers/gpu/drm/i915/gvt/page_track.c                |    8 
 b/drivers/gpu/drm/i915/gvt/scheduler.c                 |   37 
 b/drivers/gpu/drm/i915/gvt/trace.h                     |    2 
 b/drivers/gpu/drm/i915/gvt/vgpu.c                      |   22 
 b/drivers/gpu/drm/i915/i915_drv.h                      |    7 
 b/drivers/gpu/drm/i915/i915_params.c                   |    2 
 b/drivers/gpu/drm/i915/intel_gvt.c                     |   64 +
 b/drivers/gpu/drm/i915/intel_gvt.h                     |    4 
 drivers/gpu/drm/i915/gvt/Makefile                      |    9 
 drivers/gpu/drm/i915/gvt/hypercall.h                   |   82 --
 drivers/gpu/drm/i915/gvt/mpt.h                         |  400 ----------
 25 files changed, 541 insertions(+), 1413 deletions(-)
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
