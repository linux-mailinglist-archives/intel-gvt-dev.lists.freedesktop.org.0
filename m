Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C954F442774
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  2 Nov 2021 08:06:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E7856FAA7;
	Tue,  2 Nov 2021 07:06:13 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 041796FAA7;
 Tue,  2 Nov 2021 07:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=iSMKRB1ypj4SY7bifdaR84NOhT38ADMlZ3HEJkbTNbE=; b=M9SAJkXgnmnpT24mLBYSbsvtyy
 AmLXr7WkmOZO1YP+7nBAUKFqJpfL1L4075C3FSNOdXbY+6HmCIRbHYDqV/e7DspfeVwUtW7VobI1t
 Bv2uCewjW8M0DKCdQU2ubIv6IItT83fF6hAhXOUgCbxaybxiXfQoM/FM0ZqdaPm592hBtVaocQxf2
 BEcge4KYu0gA3VMhkfdP0tQnSf0VijX7WQs/LwXihTx95QfopVWHWnEANjFN+Ftk0Q1uyhEQTII4T
 OvrffEwsT+UNTgsrzWPRT/EzxtmG+nyIybLisnvg+7jE41njR3HxfHrb1zXSkISyi8eDVaTlL1QPd
 Mo6u4AiQ==;
Received: from 213-225-15-89.nat.highway.a1.net ([213.225.15.89]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhnry-000hyd-I7; Tue, 02 Nov 2021 07:06:07 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: refactor the i915 GVT support and move to the modern mdev API v2
Date: Tue,  2 Nov 2021 08:05:32 +0100
Message-Id: <20211102070601.155501-1-hch@lst.de>
X-Mailer: git-send-email 2.30.2
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

Changes since v1:
 - rebased on Linux 5.15
 - allow the kvmgvt module to be loaded at any time and thus solve
   the deadlock when both i915 amd kvmgvt are modular
 - include the conversion to the modern mdev API

Note that I do expect to rebased this again against 5.16-rc1 once
released, but I'd like to get this out for review ASAP.

Diffstat:
 b/drivers/gpu/drm/i915/Kconfig          |   33 
 b/drivers/gpu/drm/i915/Makefile         |   31 
 b/drivers/gpu/drm/i915/gvt/cfg_space.c  |   89 --
 b/drivers/gpu/drm/i915/gvt/cmd_parser.c |    4 
 b/drivers/gpu/drm/i915/gvt/dmabuf.c     |   36 -
 b/drivers/gpu/drm/i915/gvt/execlist.c   |   12 
 b/drivers/gpu/drm/i915/gvt/gtt.c        |   55 +
 b/drivers/gpu/drm/i915/gvt/gvt.h        |  125 ++-
 b/drivers/gpu/drm/i915/gvt/interrupt.c  |   38 +
 b/drivers/gpu/drm/i915/gvt/kvmgt.c      | 1099 +++++++++++++++-----------------
 b/drivers/gpu/drm/i915/gvt/mmio.c       |    4 
 b/drivers/gpu/drm/i915/gvt/opregion.c   |  148 ----
 b/drivers/gpu/drm/i915/gvt/page_track.c |    8 
 b/drivers/gpu/drm/i915/gvt/scheduler.c  |   37 -
 b/drivers/gpu/drm/i915/gvt/trace.h      |    2 
 b/drivers/gpu/drm/i915/gvt/vgpu.c       |   22 
 b/drivers/gpu/drm/i915/i915_drv.c       |    7 
 b/drivers/gpu/drm/i915/i915_drv.h       |    1 
 b/drivers/gpu/drm/i915/i915_trace.h     |    1 
 b/drivers/gpu/drm/i915/intel_gvt.c      |  162 +++-
 b/drivers/gpu/drm/i915/intel_gvt.h      |   17 
 drivers/gpu/drm/i915/gvt/Makefile       |    9 
 drivers/gpu/drm/i915/gvt/gvt.c          |  340 ---------
 drivers/gpu/drm/i915/gvt/hypercall.h    |   82 --
 drivers/gpu/drm/i915/gvt/mpt.h          |  400 -----------
 25 files changed, 929 insertions(+), 1833 deletions(-)
