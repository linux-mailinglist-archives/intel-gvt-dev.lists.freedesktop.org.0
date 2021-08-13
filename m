Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C38E3EB031
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 13 Aug 2021 08:33:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD5DD6E514;
	Fri, 13 Aug 2021 06:33:37 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B0986E513;
 Fri, 13 Aug 2021 06:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=/hTwlm4nxRHnWyepgWbAz00Iy5VZOqsWfT3mJTEBE7E=; b=j+rmF0zP2x05+sSp6X3zgKm0NI
 6m4zoMJMvbKrmIAegh7csU/yzyLR4CZPRCOmdyXiiaSSa7FU7loDPC3A1Uyr1jW6klke7jVIreR/P
 EYNMx71NzXmeSzTgPUl0Xh7Ei6el13DJEpCRvVYeJuCTZO7IkS3RS0/H68zbpZsgMqU24wrU01ZkI
 ZY3DQuDZpM9cE11O9nInQ+4899c903EVoZkd0j9Bt+9EFPm+4zy1Or3P9wYPXAC0gzIDGyCWG63BQ
 f4WF29Cg2u1sj9aFYeWThAoMhQCwqqWD9OizbIqlWDuhm4tWN1BliT+o1SWECWvo5rycSoZRrVNCI
 L1Yi0F1A==;
Received: from [2001:4bb8:184:6215:e7f4:438c:fad2:ddc3] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEQj3-00FOof-Uh; Fri, 13 Aug 2021 06:32:01 +0000
Date: Fri, 13 Aug 2021 08:31:28 +0200
From: Christoph Hellwig <hch@infradead.org>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org
Subject: i915 timeouts delaying boot under GVT
Message-ID: <YRYRwG5jscfl54pj@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Hi all,

when botting a current 4.14-rc tree in a VM using GVT-g (with the host
also running a current 4.14-rc tree), I see bunch of long timeouts
followed by i915 errors:

[    4.252066] i915 0000:00:03.0: [drm] VGT balloon successfully
[    5.095190] i915 0000:00:03.0: [drm] *ERROR* Failed to disable SAGV (-110)
[   15.334559] [drm:drm_atomic_helper_wait_for_flip_done] *ERROR* [CRTC:51:pipe
A] flip_done timed out
[   15.346934] [drm] Initialized i915 1.6.0 20201103 for 0000:00:03.0 on minor
0

I did a hackjob to track them down and just if out the offending code,
which speeds up the boot by ~11 seconds but is probably dangerous as hell:

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 2d5d21740c25..ee82fd67f386 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -10696,7 +10696,7 @@ static void intel_atomic_commit_tail(struct intel_atomic_state *state)
 	 * - switch over to the vblank wait helper in the core after that since
 	 *   we don't need out special handling any more.
 	 */
-	drm_atomic_helper_wait_for_flip_done(dev, &state->base);
+//	drm_atomic_helper_wait_for_flip_done(dev, &state->base);
 
 	for_each_new_intel_crtc_in_state(state, crtc, new_crtc_state, i) {
 		if (new_crtc_state->uapi.async_flip)
diff --git a/drivers/gpu/drm/i915/intel_pm.c b/drivers/gpu/drm/i915/intel_pm.c
index 45fefa0ed160..f03ce729cc4b 100644
--- a/drivers/gpu/drm/i915/intel_pm.c
+++ b/drivers/gpu/drm/i915/intel_pm.c
@@ -3753,7 +3753,7 @@ intel_disable_sagv(struct drm_i915_private *dev_priv)
 	if (!intel_has_sagv(dev_priv))
 		return 0;
 
-	if (dev_priv->sagv_status == I915_SAGV_DISABLED)
+	if (1 || dev_priv->sagv_status == I915_SAGV_DISABLED)
 		return 0;
 
 	drm_dbg_kms(&dev_priv->drm, "Disabling SAGV\n");
