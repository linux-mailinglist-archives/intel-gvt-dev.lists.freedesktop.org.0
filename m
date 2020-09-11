Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB0126598D
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 11 Sep 2020 08:47:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC1A06E2E9;
	Fri, 11 Sep 2020 06:47:53 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5E4D6E2E9
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 11 Sep 2020 06:47:52 +0000 (UTC)
IronPort-SDR: 6kP7euvBb28MHa/uJOih1vlj51kRDBTW3RmuNL0rS0riFjPCYCfMjZ18lTnn6XGQtcQUxnEhBO
 62eQ7GJ8Oj2w==
X-IronPort-AV: E=McAfee;i="6000,8403,9740"; a="176766978"
X-IronPort-AV: E=Sophos;i="5.76,414,1592895600"; d="scan'208";a="176766978"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2020 23:47:52 -0700
IronPort-SDR: YiDQzRwU9N4qxveTzm8g409f1b15utldPKejPUO8+Kp6Q95gh1p24teFDg3YMvlL7atWHsI5p7
 LZ9Wc4mPvsKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,414,1592895600"; d="scan'208";a="329658706"
Received: from unknown (HELO coxu-arch-shz.sh.intel.com) ([10.239.160.21])
 by fmsmga004.fm.intel.com with ESMTP; 10 Sep 2020 23:47:51 -0700
From: Colin Xu <colin.xu@intel.com>
To: zhenyuw@linux.intel.com
Subject: [PATCH V2] drm/i915/gvt: Skip writing 0 to HWSP during D3 resume
Date: Fri, 11 Sep 2020 14:47:49 +0800
Message-Id: <20200911064749.145502-1-colin.xu@intel.com>
X-Mailer: git-send-email 2.28.0
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
Cc: intel-gvt-dev@lists.freedesktop.org, colin.xu@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Guest driver may reset HWSP to 0 as init value during D3->D0:
The full sequence is:
 - Boot ->D0
 - Update HWSP
 - D0->D3
 - ...In D3 state...
 - D3->D0
 - DMLR reset.
 - Set engine HWSP to 0.
 - Set engine ring mode to 0.
 - Set engine HWSP to correct value.
 - Set engine ring mode to correct value.
Ring mode is masked register so set 0 won't take effect.
However HWPS addr 0 is considered as invalid GGTT address which will
report error like:
gvt: vgpu 1: write invalid HWSP address, reg:0x2080, value:0x0
gvt: vgpu 1: fail to emulate MMIO write 00002080 len 4
Detected your guest driver doesn't support GVT-g.
Now vgpu 2 will enter failsafe mode.

Zero out HWSP addr is considered as a valid setting from device driver
so don't treat it as invalid HWSP addr.

V2:
Treat HWSP addr 0 as valid. (zhenyu)

Signed-off-by: Colin Xu <colin.xu@intel.com>
---
 drivers/gpu/drm/i915/gvt/handlers.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index 3be37e6fe33d..809429a35ec2 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -1489,7 +1489,8 @@ static int hws_pga_write(struct intel_vgpu *vgpu, unsigned int offset,
 	const struct intel_engine_cs *engine =
 		intel_gvt_render_mmio_to_engine(vgpu->gvt, offset);
 
-	if (!intel_gvt_ggtt_validate_range(vgpu, value, I915_GTT_PAGE_SIZE)) {
+	if (value != 0 &&
+	    !intel_gvt_ggtt_validate_range(vgpu, value, I915_GTT_PAGE_SIZE)) {
 		gvt_vgpu_err("write invalid HWSP address, reg:0x%x, value:0x%x\n",
 			      offset, value);
 		return -EINVAL;
-- 
2.28.0

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
