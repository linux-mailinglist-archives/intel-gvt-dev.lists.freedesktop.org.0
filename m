Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF2E44277D
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  2 Nov 2021 08:06:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 205AD6FAB1;
	Tue,  2 Nov 2021 07:06:28 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5198E6FAAC;
 Tue,  2 Nov 2021 07:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=LD0kZbeYsd1sh1sUSqr/IJFNd/OyxkOofQLo77MC3lY=; b=DBrZgI49e7O+VOsKmtN6DlTa8O
 aPD5gY4exMfntGR0Sh0rkgzhCbhc9vfSHUfs29ufaG26rPaP1euIVL7Q3JsCJz3RPbHlXxMACQgid
 pdpwS7J3D7/6Ib63U5FwGUOI7s8ykFC+wyUWGPBNd+xH/fuqNkzI2GmUB+UXDSiWIhri2K/8X3VCV
 pkchg5NmdoYj8tpCn1s7sjXQPTu4+N6AZsz0QwEystQg8J9Qr0S/okxV3XUQ3lNXA1mkPUuyaOlJC
 4zOuf0p7LyTcECcQMJc64z3+qgDVl6haOdaSoyQL4tMFwLyO09M2fWkGhZ+/GvGScr69aPokHqF2j
 4+B6frwg==;
Received: from 213-225-15-89.nat.highway.a1.net ([213.225.15.89]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhnsG-000i0c-9b; Tue, 02 Nov 2021 07:06:24 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH 03/29] drm/i915/gvt: remove module refcounting in intel_gvt_{,
 un}register_hypervisor
Date: Tue,  2 Nov 2021 08:05:35 +0100
Message-Id: <20211102070601.155501-4-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211102070601.155501-1-hch@lst.de>
References: <20211102070601.155501-1-hch@lst.de>
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

THIS_MODULE always is reference when a symbol called by it is used, so
don't bother with the additional reference.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/gpu/drm/i915/gvt/gvt.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/gvt.c b/drivers/gpu/drm/i915/gvt/gvt.c
index cbac409f6c8a5..6d7938aacca4d 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.c
+++ b/drivers/gpu/drm/i915/gvt/gvt.c
@@ -308,10 +308,6 @@ intel_gvt_register_hypervisor(const struct intel_gvt_mpt *m)
 	    m->type != INTEL_GVT_HYPERVISOR_XEN)
 		return -EINVAL;
 
-	/* Get a reference for device model module */
-	if (!try_module_get(THIS_MODULE))
-		return -ENODEV;
-
 	intel_gvt_host.mpt = m;
 	intel_gvt_host.hypervisor_type = m->type;
 	gvt = (void *)kdev_to_i915(intel_gvt_host.dev)->gvt;
@@ -321,7 +317,6 @@ intel_gvt_register_hypervisor(const struct intel_gvt_mpt *m)
 	if (ret < 0) {
 		gvt_err("Failed to init %s hypervisor module\n",
 			supported_hypervisors[intel_gvt_host.hypervisor_type]);
-		module_put(THIS_MODULE);
 		return -ENODEV;
 	}
 	gvt_dbg_core("Running with hypervisor %s in host mode\n",
@@ -335,6 +330,5 @@ intel_gvt_unregister_hypervisor(void)
 {
 	void *gvt = (void *)kdev_to_i915(intel_gvt_host.dev)->gvt;
 	intel_gvt_hypervisor_host_exit(intel_gvt_host.dev, gvt);
-	module_put(THIS_MODULE);
 }
 EXPORT_SYMBOL_GPL(intel_gvt_unregister_hypervisor);
-- 
2.30.2

