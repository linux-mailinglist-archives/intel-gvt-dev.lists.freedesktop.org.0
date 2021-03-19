Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE653418D2
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 19 Mar 2021 10:52:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C0956E9C6;
	Fri, 19 Mar 2021 09:52:51 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C40566E9C6
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 19 Mar 2021 09:52:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1688764F6C;
 Fri, 19 Mar 2021 09:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1616147570;
 bh=NDQJVj/01Zqan67WgpE9WXmgkN8/L3YOxqZnN1s7l5I=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=TelIGekp61vKklrOvYXkyZAx9zREv8ILW7PzfiF+L7EBhDZsteuRQeWqG9kQEFhyL
 WbHTk8g2whIgCqmD8+nU2VEYLh/MJaden0SNYmLb4YDaFSJ9nAUaaWRgH9YVRsisd5
 KT0mqBSzymtC6KfZlO6X6JLV6roocmf26aloAmTE=
Subject: Patch "drm/i915/gvt: Set SNOOP for PAT3 on BXT/APL to workaround GPU
 BB hang" has been added to the 5.4-stable tree
To: colin.xu@intel.com, gregkh@linuxfoundation.org,
 intel-gvt-dev@lists.freedesktop.org, zhenyuw@linux.intel.com
From: <gregkh@linuxfoundation.org>
Date: Fri, 19 Mar 2021 10:52:35 +0100
In-Reply-To: <cfc85d94d1d2005fba3e5813b0c4c2df080b8aed.1615946755.git.colin.xu@intel.com>
Message-ID: <161614755512170@kroah.com>
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

    drm/i915/gvt: Set SNOOP for PAT3 on BXT/APL to workaround GPU BB hang

to the 5.4-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-i915-gvt-set-snoop-for-pat3-on-bxt-apl-to-workaround-gpu-bb-hang.patch
and it can be found in the queue-5.4 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From foo@baz Fri Mar 19 10:39:38 AM CET 2021
From: Colin Xu <colin.xu@intel.com>
Date: Wed, 17 Mar 2021 10:55:00 +0800
Subject: drm/i915/gvt: Set SNOOP for PAT3 on BXT/APL to workaround GPU BB hang
To: stable@vger.kernel.org
Cc: intel-gvt-dev@lists.freedesktop.org, zhenyuw@linux.intel.com, colin.xu@intel.com
Message-ID: <cfc85d94d1d2005fba3e5813b0c4c2df080b8aed.1615946755.git.colin.xu@intel.com>

From: Colin Xu <colin.xu@intel.com>

commit 8fe105679765700378eb328495fcfe1566cdbbd0 upstream

If guest fills non-priv bb on ApolloLake/Broxton as Mesa i965 does in:
717e7539124d (i965: Use a WC map and memcpy for the batch instead of pw-)
Due to the missing flush of bb filled by VM vCPU, host GPU hangs on
executing these MI_BATCH_BUFFER.

Temporarily workaround this by setting SNOOP bit for PAT3 used by PPGTT
PML4 PTE: PAT(0) PCD(1) PWT(1).

The performance is still expected to be low, will need further improvement.

Acked-by: Zhenyu Wang <zhenyuw@linux.intel.com>
Signed-off-by: Colin Xu <colin.xu@intel.com>
Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>
Link: http://patchwork.freedesktop.org/patch/msgid/20201012045231.226748-1-colin.xu@intel.com
(cherry picked from commit 8fe105679765700378eb328495fcfe1566cdbbd0)
Signed-off-by: Colin Xu <colin.xu@intel.com>
Cc: <stable@vger.kernel.org> # 5.4.y
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/i915/gvt/handlers.c |   32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -1632,6 +1632,34 @@ static int edp_psr_imr_iir_write(struct
 	return 0;
 }
 
+/**
+ * FixMe:
+ * If guest fills non-priv batch buffer on ApolloLake/Broxton as Mesa i965 did:
+ * 717e7539124d (i965: Use a WC map and memcpy for the batch instead of pwrite.)
+ * Due to the missing flush of bb filled by VM vCPU, host GPU hangs on executing
+ * these MI_BATCH_BUFFER.
+ * Temporarily workaround this by setting SNOOP bit for PAT3 used by PPGTT
+ * PML4 PTE: PAT(0) PCD(1) PWT(1).
+ * The performance is still expected to be low, will need further improvement.
+ */
+static int bxt_ppat_low_write(struct intel_vgpu *vgpu, unsigned int offset,
+			      void *p_data, unsigned int bytes)
+{
+	u64 pat =
+		GEN8_PPAT(0, CHV_PPAT_SNOOP) |
+		GEN8_PPAT(1, 0) |
+		GEN8_PPAT(2, 0) |
+		GEN8_PPAT(3, CHV_PPAT_SNOOP) |
+		GEN8_PPAT(4, CHV_PPAT_SNOOP) |
+		GEN8_PPAT(5, CHV_PPAT_SNOOP) |
+		GEN8_PPAT(6, CHV_PPAT_SNOOP) |
+		GEN8_PPAT(7, CHV_PPAT_SNOOP);
+
+	vgpu_vreg(vgpu, offset) = lower_32_bits(pat);
+
+	return 0;
+}
+
 static int mmio_read_from_hw(struct intel_vgpu *vgpu,
 		unsigned int offset, void *p_data, unsigned int bytes)
 {
@@ -2778,7 +2806,7 @@ static int init_broadwell_mmio_info(stru
 
 	MMIO_DH(GEN6_PCODE_MAILBOX, D_BDW_PLUS, NULL, mailbox_write);
 
-	MMIO_D(GEN8_PRIVATE_PAT_LO, D_BDW_PLUS);
+	MMIO_D(GEN8_PRIVATE_PAT_LO, D_BDW_PLUS & ~D_BXT);
 	MMIO_D(GEN8_PRIVATE_PAT_HI, D_BDW_PLUS);
 
 	MMIO_D(GAMTARBMODE, D_BDW_PLUS);
@@ -3281,6 +3309,8 @@ static int init_bxt_mmio_info(struct int
 
 	MMIO_DFH(GEN9_CTX_PREEMPT_REG, D_BXT, F_CMD_ACCESS, NULL, NULL);
 
+	MMIO_DH(GEN8_PRIVATE_PAT_LO, D_BXT, NULL, bxt_ppat_low_write);
+
 	return 0;
 }
 


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
