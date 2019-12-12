Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F08811C860
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 12 Dec 2019 09:45:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2F0689298;
	Thu, 12 Dec 2019 08:44:58 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E5A8886DC
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 12 Dec 2019 08:44:57 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Dec 2019 00:44:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,305,1571727600"; d="scan'208";a="220645637"
Received: from debian-skl.sh.intel.com ([10.239.13.15])
 by fmsmga001.fm.intel.com with ESMTP; 12 Dec 2019 00:44:55 -0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v2] drm/i915/gvt: set guest display buffer as readonly
Date: Thu, 12 Dec 2019 16:46:14 +0800
Message-Id: <20191212084614.1100-1-zhenyuw@linux.intel.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191212081452.317-1-zhenyuw@linux.intel.com>
References: <20191212081452.317-1-zhenyuw@linux.intel.com>
MIME-Version: 1.0
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
Cc: Tina Zhang <tina.zhang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

We shouldn't allow write for exposed guest display buffer which
doesn't make sense. So explicitly set read only flag for display
dmabuf allocated object.

Fixes: e546e281d33d ("drm/i915/gvt: Dmabuf support for GVT-g")
Cc: Tina Zhang <tina.zhang@intel.com>
Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>
---
v2: fix typo in commit message

drivers/gpu/drm/i915/gvt/dmabuf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/gvt/dmabuf.c b/drivers/gpu/drm/i915/gvt/dmabuf.c
index e451298d11c3..ee0f3094e6d0 100644
--- a/drivers/gpu/drm/i915/gvt/dmabuf.c
+++ b/drivers/gpu/drm/i915/gvt/dmabuf.c
@@ -163,6 +163,7 @@ static struct drm_i915_gem_object *vgpu_create_gem(struct drm_device *dev,
 	drm_gem_private_object_init(dev, &obj->base,
 		roundup(info->size, PAGE_SIZE));
 	i915_gem_object_init(obj, &intel_vgpu_gem_ops, &lock_class);
+	i915_gem_object_set_readonly(obj);
 
 	obj->read_domains = I915_GEM_DOMAIN_GTT;
 	obj->write_domain = 0;
-- 
2.24.0

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
