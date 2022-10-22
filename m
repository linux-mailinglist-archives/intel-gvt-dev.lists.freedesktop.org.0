Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E01608502
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 22 Oct 2022 08:17:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0029910E32A;
	Sat, 22 Oct 2022 06:17:27 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.155.65.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCAB610E32A
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 22 Oct 2022 06:17:21 +0000 (UTC)
X-QQ-mid: bizesmtp69t1666419215t8higm51
Received: from localhost.localdomain ( [182.148.15.254])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Sat, 22 Oct 2022 14:13:33 +0800 (CST)
X-QQ-SSF: 01000000000000C0E000000A0000000
X-QQ-FEAT: +bXiSo2NuBddP4A69LU3WpK2yss/SD4kLWRfIaKg+B3eczPuTS+cndE8He8iu
 OyeU5eFwv4pt243eCRXRaH+F8QwOc0Qd8fAijYEqA1bLCrnzyyfDshaM4A2mYAfmkwEJzhV
 aAoGdC/kL3D5E99bswwtFnd1dLX5z8VsjEH7qDv59y+nmmS+C8QrohfIQWNdK8i73eXR0fA
 wwOEB31xLbqbIlaAToBwcu5WB2DnVeJ4Ws+iszmr/06VZNKwYaVIymVyYFx1c67OPd/FeTN
 AQ6d5DeuCdDtVrlZ1OzR1Txm+fkDUUGO8bglYMMBnYpKTfb/W8SNi+VhZP7m9Fh841j22fA
 Dx/zHnfHmJFHhh0E2tCc2h6cHCzqwiYb3n5HB5/uNteezJZq44=
X-QQ-GoodBg: 0
From: wangjianli <wangjianli@cdjrlc.com>
To: zhenyuw@linux.intel.com, zhi.a.wang@intel.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tvrtko.ursulin@linux.intel.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm/i915: fix repeated words in comments
Date: Sat, 22 Oct 2022 14:13:27 +0800
Message-Id: <20221022061327.65275-1-wangjianli@cdjrlc.com>
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
index b4f69364f9a1..7b29ef36941a 100644
--- a/drivers/gpu/drm/i915/gvt/gtt.c
+++ b/drivers/gpu/drm/i915/gvt/gtt.c
@@ -2785,7 +2785,7 @@ int intel_gvt_init_gtt(struct intel_gvt *gvt)
  * intel_gvt_clean_gtt - clean up mm components of a GVT device
  * @gvt: GVT device
  *
- * This function is called at the driver unloading stage, to clean up the
+ * This function is called at the driver unloading stage, to clean up
  * the mm components of a GVT device.
  *
  */
-- 
2.36.1

