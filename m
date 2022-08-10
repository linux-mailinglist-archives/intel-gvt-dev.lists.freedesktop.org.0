Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8066758F401
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 10 Aug 2022 23:56:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0DB411ADE0;
	Wed, 10 Aug 2022 21:56:03 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC96D90AC2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 10 Aug 2022 21:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660168553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=oF/qmSrdMlmPWxsKHR15ccpRopHUBKiPd2DHFQyuT+k=;
 b=QOF6MJTtARzRM1/YNqKfU2oxgOF1ylgCGb+br+4P04uhwmbScb+U/bwF9kJ75LTqFY9PGz
 o6F0Y6tG92mSGE/PMzBV7bJwufpa7T5YCYaZgnh2RPchCQi4rNvEYkmSv2pWkOQtZQcnuQ
 RnC6wbE+9psqv229/C0WH5vKL7KSz4E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-567-CtpeTOq5Poa6xto48eWGZA-1; Wed, 10 Aug 2022 17:55:50 -0400
X-MC-Unique: CtpeTOq5Poa6xto48eWGZA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 66FFE80231E;
 Wed, 10 Aug 2022 21:55:49 +0000 (UTC)
Received: from [172.30.41.16] (unknown [10.22.18.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BCB94492CA4;
 Wed, 10 Aug 2022 21:55:48 +0000 (UTC)
Subject: [PATCH] i915/gvt: Fix Comet Lake
From: Alex Williamson <alex.williamson@redhat.com>
To: zhenyuw@linux.intel.com, zhi.a.wang@intel.com
Date: Wed, 10 Aug 2022 15:55:48 -0600
Message-ID: <166016852965.780835.10366587502693016900.stgit@omen>
User-Agent: StGit/1.5.dev2+g9ce680a52bd9
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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
Cc: tvrtko.ursulin@linux.intel.com, intel-gfx@lists.freedesktop.org,
 joonas.lahtinen@linux.intel.com, linux-kernel@vger.kernel.org,
 jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 intel-gvt-dev@lists.freedesktop.org
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Prior to the commit below the GAMT_CHKN_BIT_REG address was setup for
devices matching (D_KBL | D_CFL), where intel_gvt_get_device_type()
returns D_CFL for either Coffee Lake or Comet Lake.  Include the missed
platform.`

Link: https://lore.kernel.org/all/20220808142711.02d16782.alex.williamson@redhat.com
Fixes: e0f74ed4634d ("i915/gvt: Separate the MMIO tracking table from GVT-g")
Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
---
 drivers/gpu/drm/i915/intel_gvt_mmio_table.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/intel_gvt_mmio_table.c b/drivers/gpu/drm/i915/intel_gvt_mmio_table.c
index 157e166672d7..5595639d0033 100644
--- a/drivers/gpu/drm/i915/intel_gvt_mmio_table.c
+++ b/drivers/gpu/drm/i915/intel_gvt_mmio_table.c
@@ -1076,7 +1076,8 @@ static int iterate_skl_plus_mmio(struct intel_gvt_mmio_table_iter *iter)
 	MMIO_D(GEN8_HDC_CHICKEN1);
 	MMIO_D(GEN9_WM_CHICKEN3);
 
-	if (IS_KABYLAKE(dev_priv) || IS_COFFEELAKE(dev_priv))
+	if (IS_KABYLAKE(dev_priv) ||
+	    IS_COFFEELAKE(dev_priv) || IS_COMETLAKE(dev_priv))
 		MMIO_D(GAMT_CHKN_BIT_REG);
 	if (!IS_BROXTON(dev_priv))
 		MMIO_D(GEN9_CTX_PREEMPT_REG);


