Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5553418D3
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 19 Mar 2021 10:52:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB62B6E9C2;
	Fri, 19 Mar 2021 09:52:57 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F099C6E9C2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 19 Mar 2021 09:52:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4C61264F70;
 Fri, 19 Mar 2021 09:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1616147575;
 bh=WYztX7vBh+M1/PRqAjm/izF30TikPNPuQ0f/1pYMgBE=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=F8v624lUcyR0zNrDaPKlwjOk4ynqehDzZb0tWZosSftVz9ZznMzgvA3qWw5uZoako
 4blb+eDYhty9C/mcTYTKP20t+Rfc46lnmMFC79cLcwJPU9q54Argw1zkUkgyZc/FLv
 fhp4mx0aeg4pYC0KK56gxwITKNO2o/YQuQD4hWnI=
Subject: Patch "drm/i915/gvt: Fix mmio handler break on BXT/APL." has been
 added to the 5.4-stable tree
To: colin.xu@intel.com, gregkh@linuxfoundation.org,
 intel-gvt-dev@lists.freedesktop.org, zhenyuw@linux.intel.com
From: <gregkh@linuxfoundation.org>
Date: Fri, 19 Mar 2021 10:52:35 +0100
In-Reply-To: <71b10da4af9e8be3b38b99382e164dd4e83fdf27.1615946755.git.colin.xu@intel.com>
Message-ID: <1616147555133184@kroah.com>
MIME-Version: 1.0
X-stable: commit
X-Patchwork-Hint: ignore 
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
Cc: stable-commits@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


This is a note to let you know that I've just added the patch titled

    drm/i915/gvt: Fix mmio handler break on BXT/APL.

to the 5.4-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-i915-gvt-fix-mmio-handler-break-on-bxt-apl.patch
and it can be found in the queue-5.4 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From foo@baz Fri Mar 19 10:39:38 AM CET 2021
From: Colin Xu <colin.xu@intel.com>
Date: Wed, 17 Mar 2021 10:55:01 +0800
Subject: drm/i915/gvt: Fix mmio handler break on BXT/APL.
To: stable@vger.kernel.org
Cc: intel-gvt-dev@lists.freedesktop.org, zhenyuw@linux.intel.com, colin.xu@intel.com
Message-ID: <71b10da4af9e8be3b38b99382e164dd4e83fdf27.1615946755.git.colin.xu@intel.com>

From: Colin Xu <colin.xu@intel.com>

commit 92010a97098c4c9fd777408cc98064d26b32695b upstream

- Remove dup mmio handler for BXT/APL. Otherwise mmio handler will fail
  to init.
- Add engine GPR with F_CMD_ACCESS since BXT/APL will load them via
  LRI. Otherwise, guest will enter failsafe mode.

V2:
Use RCS/BCS GPR macros instead of offset.
Revise commit message.

V3:
Use GEN8_RING_CS_GPR macros on ring base.

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>
Signed-off-by: Colin Xu <colin.xu@intel.com>
Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>
Link: http://patchwork.freedesktop.org/patch/msgid/20201016052913.209248-1-colin.xu@intel.com
(cherry picked from commit 92010a97098c4c9fd777408cc98064d26b32695b)
Signed-off-by: Colin Xu <colin.xu@intel.com>
Cc: <stable@vger.kernel.org> # 5.4.y
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/i915/gvt/handlers.c |    8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -3132,7 +3132,7 @@ static int init_skl_mmio_info(struct int
 		 NULL, NULL);
 
 	MMIO_D(GAMT_CHKN_BIT_REG, D_KBL | D_CFL);
-	MMIO_D(GEN9_CTX_PREEMPT_REG, D_SKL_PLUS);
+	MMIO_D(GEN9_CTX_PREEMPT_REG, D_SKL_PLUS & ~D_BXT);
 
 	return 0;
 }
@@ -3306,6 +3306,12 @@ static int init_bxt_mmio_info(struct int
 	MMIO_D(GEN8_PUSHBUS_SHIFT, D_BXT);
 	MMIO_D(GEN6_GFXPAUSE, D_BXT);
 	MMIO_DFH(GEN8_L3SQCREG1, D_BXT, F_CMD_ACCESS, NULL, NULL);
+	MMIO_DFH(GEN8_L3CNTLREG, D_BXT, F_CMD_ACCESS, NULL, NULL);
+	MMIO_DFH(_MMIO(0x20D8), D_BXT, F_CMD_ACCESS, NULL, NULL);
+	MMIO_F(HSW_CS_GPR(0), 0x40, F_CMD_ACCESS, 0, 0, D_BXT, NULL, NULL);
+	MMIO_F(_MMIO(0x12600), 0x40, F_CMD_ACCESS, 0, 0, D_BXT, NULL, NULL);
+	MMIO_F(BCS_GPR(0), 0x40, F_CMD_ACCESS, 0, 0, D_BXT, NULL, NULL);
+	MMIO_F(_MMIO(0x1a600), 0x40, F_CMD_ACCESS, 0, 0, D_BXT, NULL, NULL);
 
 	MMIO_DFH(GEN9_CTX_PREEMPT_REG, D_BXT, F_CMD_ACCESS, NULL, NULL);
 


Patches currently in stable-queue which might be from colin.xu@intel.com are

queue-5.4/drm-i915-gvt-set-snoop-for-pat3-on-bxt-apl-to-workaround-gpu-bb-hang.patch
queue-5.4/drm-i915-gvt-fix-virtual-display-setup-for-bxt-apl.patch
queue-5.4/drm-i915-gvt-fix-vfio_edid-issue-for-bxt-apl.patch
queue-5.4/drm-i915-gvt-fix-port-number-for-bdw-on-edid-region-setup.patch
queue-5.4/drm-i915-gvt-fix-mmio-handler-break-on-bxt-apl.patch
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
