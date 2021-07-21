Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 821633D12E3
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 21 Jul 2021 17:54:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 247D56E9A5;
	Wed, 21 Jul 2021 15:54:46 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05B8B6E97A;
 Wed, 21 Jul 2021 15:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=qYr+fejkooLprB+HBW0to2z9UK9syRmjiuAzimmt6kU=; b=bYErOGEI/N3jxH1564k5eY61gh
 BBrhHoZ1FhlWSJpHbtDmV+ScaJrKfeyZKAypMHq9VQZ1YRVxor9pUw8p6rb4keCVcP1TtJ/Pch+aU
 sD+BfK721/oPV6b29NMlCjDER9LMdEhwRtDaH8uYBWhK9QMGoynZCNndSjxdWMCQnQ2XDT1NVoZ3d
 /jC7FKMYasCDbio92YVKXwvp7ohz7z84qFzh9i84QijnZxYib8NbXHYbTcEruIvxorNMQLP8gZ3eH
 VPLsfb5u+/JqTUHoChIuZpbrk7JFN8YMcIqmJ6he+fWyWP4ay4//uGhwWeNN8xGq8ivK4IMO2g38m
 OVkNyNdQ==;
Received: from [2001:4bb8:193:7660:d6d5:72f4:23f7:1898] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6EY7-009MEM-JR; Wed, 21 Jul 2021 15:54:22 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH 02/21] drm/i915/gvt: remove module refcounting in intel_gvt_{,
 un}register_hypervisor
Date: Wed, 21 Jul 2021 17:53:36 +0200
Message-Id: <20210721155355.173183-3-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210721155355.173183-1-hch@lst.de>
References: <20210721155355.173183-1-hch@lst.de>
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

THIS_MODULE always is reference when a symbol called by it is used, so
don't bother with the additional reference.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/gpu/drm/i915/gvt/gvt.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/gvt.c b/drivers/gpu/drm/i915/gvt/gvt.c
index cbac409f6c8a..6d7938aacca4 100644
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

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
