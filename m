Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A67565BA8
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  4 Jul 2022 18:21:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0D8910E871;
	Mon,  4 Jul 2022 16:16:02 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 289EB10E0BC
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  4 Jul 2022 12:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=DXtBbkVREHluB0bQE8SDxaihur9/pek8hwTZBcL+Y2o=; b=qUFU4Ljog19N8V2HsPwdesXiUF
 1CCiaJI8pIYhDtSOs+aDOFUoHqO+NEi2YnhTwxg3nXvrizRSAA+KULHFxtAiLmVNHyaEx6dig6NH8
 /WsgUU9qVp+4BX0aJt/2yye7c6AwFg8/dwlfxYofv7LU4hhGPNts21rJTzCRJc+bPf5XJoG8JByfz
 7cJvLzYiXOOE4fwgctqjv0tV+CaNLsWVCiKf51PyeeJrDUS417B1rMqnVoDa6Aa2sk4HCn5UHLA24
 gACGrKH92EePHzktEsEylahk+K87r0NJogTYWY9aZAbNbvSDvJtIZrK0CvqsGdFlNKIiz9LiRxLkm
 /N+wjPPg==;
Received: from [2001:4bb8:189:3c4a:8758:74d9:4df6:6417] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1o8LYL-008wCA-AQ; Mon, 04 Jul 2022 12:51:49 +0000
From: Christoph Hellwig <hch@lst.de>
To: Kirti Wankhede <kwankhede@nvidia.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>
Subject: [PATCH 01/14] drm/i915/gvt: fix a memory leak in
 intel_gvt_init_vgpu_types
Date: Mon,  4 Jul 2022 14:51:31 +0200
Message-Id: <20220704125144.157288-2-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220704125144.157288-1-hch@lst.de>
References: <20220704125144.157288-1-hch@lst.de>
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
Cc: linux-s390@vger.kernel.org, Kevin Tian <kevin.tian@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, kvm@vger.kernel.org,
 Jason Gunthorpe <jgg@nvidia.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

gvt->types needs to be freed on error.

Reported-by: Kevin Tian <kevin.tian@intel.com>
Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>
---
 drivers/gpu/drm/i915/gvt/vgpu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/vgpu.c b/drivers/gpu/drm/i915/gvt/vgpu.c
index 46da19b3225d2..5c828556cefd7 100644
--- a/drivers/gpu/drm/i915/gvt/vgpu.c
+++ b/drivers/gpu/drm/i915/gvt/vgpu.c
@@ -142,7 +142,7 @@ int intel_gvt_init_vgpu_types(struct intel_gvt *gvt)
 
 		if (vgpu_types[i].weight < 1 ||
 					vgpu_types[i].weight > VGPU_MAX_WEIGHT)
-			return -EINVAL;
+			goto out_free_types;
 
 		gvt->types[i].weight = vgpu_types[i].weight;
 		gvt->types[i].resolution = vgpu_types[i].edid;
@@ -167,6 +167,10 @@ int intel_gvt_init_vgpu_types(struct intel_gvt *gvt)
 
 	gvt->num_types = i;
 	return 0;
+
+out_free_types:
+	kfree(gvt->types);
+	return -EINVAL;
 }
 
 void intel_gvt_clean_vgpu_types(struct intel_gvt *gvt)
-- 
2.30.2

