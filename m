Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 360593418CF
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 19 Mar 2021 10:52:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 042906E9C2;
	Fri, 19 Mar 2021 09:52:45 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 444606E9C2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 19 Mar 2021 09:52:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AEA9E64E21;
 Fri, 19 Mar 2021 09:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1616147563;
 bh=o7R9/cAKjJOyKPTQ5gdQbcdAQJ/gBcqaL36HL1ShuJ8=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=zM4bavXwECIbFovLuH6J3/zd/eBYDUjXsWgIMaZwwlX/zmWmAZcVtISaRNgt7h/HJ
 8cc6O6LI3s+HyrDVPt6dC0lMBRwxpXtoEOLwSLgk3U4G7dIBkmsJ0u5938ZSKd3Qon
 Eiwe/AwdgIxsB/ocm8K0XTgb76zbZZodlddZC78Q=
Subject: Patch "drm/i915/gvt: Fix port number for BDW on EDID region setup"
 has been added to the 5.4-stable tree
To: aho@sior.be, colin.xu@intel.com, gregkh@linuxfoundation.org,
 hang.yuan@intel.com, intel-gvt-dev@lists.freedesktop.org,
 zhenyuw@linux.intel.com
From: <gregkh@linuxfoundation.org>
Date: Fri, 19 Mar 2021 10:52:35 +0100
In-Reply-To: <ef9ce56bfd3bee8b68063503d12b1d5d3535536e.1615946755.git.colin.xu@intel.com>
Message-ID: <161614755513172@kroah.com>
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

    drm/i915/gvt: Fix port number for BDW on EDID region setup

to the 5.4-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-i915-gvt-fix-port-number-for-bdw-on-edid-region-setup.patch
and it can be found in the queue-5.4 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From foo@baz Fri Mar 19 10:39:38 AM CET 2021
From: Colin Xu <colin.xu@intel.com>
Date: Wed, 17 Mar 2021 10:55:03 +0800
Subject: drm/i915/gvt: Fix port number for BDW on EDID region setup
To: stable@vger.kernel.org
Cc: intel-gvt-dev@lists.freedesktop.org, zhenyuw@linux.intel.com, colin.xu@intel.com
Message-ID: <ef9ce56bfd3bee8b68063503d12b1d5d3535536e.1615946755.git.colin.xu@intel.com>

From: Colin Xu <colin.xu@intel.com>

From: Zhenyu Wang <zhenyuw@linux.intel.com>

commit 28284943ac94014767ecc2f7b3c5747c4a5617a0 upstream

Current BDW virtual display port is initialized as PORT_B, so need
to use same port for VFIO EDID region, otherwise invalid EDID blob
pointer is assigned which caused kernel null pointer reference. We
might evaluate actual display hotplug for BDW to make this function
work as expected, anyway this is always required to be fixed first.

Reported-by: Alejandro Sior <aho@sior.be>
Cc: Alejandro Sior <aho@sior.be>
Fixes: 0178f4ce3c3b ("drm/i915/gvt: Enable vfio edid for all GVT supported platform")
Reviewed-by: Hang Yuan <hang.yuan@intel.com>
Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>
Link: http://patchwork.freedesktop.org/patch/msgid/20200914030302.2775505-1-zhenyuw@linux.intel.com
(cherry picked from commit 28284943ac94014767ecc2f7b3c5747c4a5617a0)
Signed-off-by: Colin Xu <colin.xu@intel.com>
Cc: <stable@vger.kernel.org> # 5.4.y
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/i915/gvt/vgpu.c |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

--- a/drivers/gpu/drm/i915/gvt/vgpu.c
+++ b/drivers/gpu/drm/i915/gvt/vgpu.c
@@ -432,8 +432,9 @@ static struct intel_vgpu *__intel_gvt_cr
 	if (ret)
 		goto out_clean_sched_policy;
 
-	/*TODO: add more platforms support */
-	if (IS_SKYLAKE(gvt->dev_priv) || IS_KABYLAKE(gvt->dev_priv))
+	if (IS_BROADWELL(gvt->dev_priv))
+		ret = intel_gvt_hypervisor_set_edid(vgpu, PORT_B);
+	else
 		ret = intel_gvt_hypervisor_set_edid(vgpu, PORT_D);
 	if (ret)
 		goto out_clean_sched_policy;


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
