Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 913EE2B0678
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 12 Nov 2020 14:31:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34ED16E23D;
	Thu, 12 Nov 2020 13:31:09 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A92F66E22C;
 Thu, 12 Nov 2020 13:31:06 +0000 (UTC)
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CX2Y73sV5z15RSS;
 Thu, 12 Nov 2020 21:30:51 +0800 (CST)
Received: from linux-ibm.site (10.175.102.37) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.487.0; Thu, 12 Nov 2020 21:30:50 +0800
From: Xiongfeng Wang <wangxiongfeng2@huawei.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH] drm/i915/gvt: return error when failing to take the module
 reference
Date: Thu, 12 Nov 2020 21:22:32 +0800
Message-ID: <1605187352-51761-1-git-send-email-wangxiongfeng2@huawei.com>
X-Mailer: git-send-email 1.7.12.4
MIME-Version: 1.0
X-Originating-IP: [10.175.102.37]
X-CFilter-Loop: Reflected
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
Cc: chenzhou10@huawei.com, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 zhenyuw@linux.intel.com, intel-gvt-dev@lists.freedesktop.org,
 wangxiongfeng2@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

When we fail to take the module reference, we go to the 'undo*' branch and
return. But the returned variable 'ret' has been set as zero by the
above code. Change 'ret' to '-ENODEV' in this situation.

Fixes: 9bdb073464d6 ("drm/i915/gvt: Change KVMGT as self load module")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Xiongfeng Wang <wangxiongfeng2@huawei.com>
---
 drivers/gpu/drm/i915/gvt/kvmgt.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index ad8a9df..778eb8c 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -829,8 +829,10 @@ static int intel_vgpu_open(struct mdev_device *mdev)
 	/* Take a module reference as mdev core doesn't take
 	 * a reference for vendor driver.
 	 */
-	if (!try_module_get(THIS_MODULE))
+	if (!try_module_get(THIS_MODULE)) {
+		ret = -ENODEV;
 		goto undo_group;
+	}
 
 	ret = kvmgt_guest_init(mdev);
 	if (ret)
-- 
1.7.12.4

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
