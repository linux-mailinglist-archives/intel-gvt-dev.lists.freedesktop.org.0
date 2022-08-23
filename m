Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6207D59E508
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 23 Aug 2022 16:19:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7C8110E656;
	Tue, 23 Aug 2022 14:19:05 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from bg5.exmail.qq.com (bg4.exmail.qq.com [43.155.65.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A77D10E656;
 Tue, 23 Aug 2022 14:18:53 +0000 (UTC)
X-QQ-mid: bizesmtp88t1661264325tb54gilq
Received: from localhost.localdomain ( [182.148.14.124])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 23 Aug 2022 22:18:43 +0800 (CST)
X-QQ-SSF: 0100000000200040B000B00A0000000
X-QQ-FEAT: ILHsT53NKPgLTuHpE6ccSHE70S/G0EX2mN4fT6dumbwx7YjyhfDhsWAnefi8+
 sf6o3pVtUwhUSCFlIAZARgDB8TvsFn2X3rBV3TbDNQMr1l3g2jhdnCTm1rAfpyn1qI0MAhC
 njWcuSxPK4v7kwhUZzuMYr8s9+BxfZYYoF6GJKsD8ebVcZwSL0A8ffznYyVjUZm9b1c0uuR
 IP3PHz6O7iqmUCKsBEi3s63DSxC18sVY1qXfi/PqQwpgd/P0UQMJwePOFAV05D70EA31FBz
 3EGHhjbyuV4twtM3sdGvyIE+ZH6AQYtNObJHvE29D80nu9few/S+8STQ2WMKV7FaNF32MVG
 BZ6qHQ3UgJirabWgIEOp+9Ga1prxOP7idbkoo06zR/cgh65DeO7N79Or6iUBw==
X-QQ-GoodBg: 0
From: wangjianli <wangjianli@cdjrlc.com>
To: zhenyuw@linux.intel.com, zhi.a.wang@intel.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, odrigo.vivi@intel.com,
 tvrtko.ursulin@linux.intel.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] i915/gvt: fix repeated words in comments
Date: Tue, 23 Aug 2022 22:18:36 +0800
Message-Id: <20220823141836.14176-1-wangjianli@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr7
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
Cc: wangjianli <wangjianli@cdjrlc.com>, intel-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

 Delete the redundant word 'the'.

Signed-off-by: wangjianli <wangjianli@cdjrlc.com>
---
 drivers/gpu/drm/i915/gvt/gtt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gtt.c
index b4f69364f9a1..62e5f27adca9 100644
--- a/drivers/gpu/drm/i915/gvt/gtt.c
+++ b/drivers/gpu/drm/i915/gvt/gtt.c
@@ -2786,7 +2786,7 @@ int intel_gvt_init_gtt(struct intel_gvt *gvt)
  * @gvt: GVT device
  *
  * This function is called at the driver unloading stage, to clean up the
- * the mm components of a GVT device.
+ * mm components of a GVT device.
  *
  */
 void intel_gvt_clean_gtt(struct intel_gvt *gvt)
-- 
2.36.1

