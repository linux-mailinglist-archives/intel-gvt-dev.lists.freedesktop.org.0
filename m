Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1C8219982
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  9 Jul 2020 09:11:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B2006E9F3;
	Thu,  9 Jul 2020 07:11:09 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B05506E9E5
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  9 Jul 2020 07:11:07 +0000 (UTC)
IronPort-SDR: SJxRS612tb5HljOlVa66DuUE0nAordztiFJNEOHX2xpgbvYyYJTKM/dljjqmU55XjwptjUR3f2
 w2S1GoFr+Aqw==
X-IronPort-AV: E=McAfee;i="6000,8403,9676"; a="166045748"
X-IronPort-AV: E=Sophos;i="5.75,331,1589266800"; d="scan'208";a="166045748"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2020 00:11:07 -0700
IronPort-SDR: buWU9fhjeOuE1oG6SAcTMnVRJx9ObwkycPA947TEdpNmlTszBydFlPdy/ak997wwr9yNxkNY1a
 4cOXptrg0GxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,331,1589266800"; d="scan'208";a="358354964"
Received: from unknown (HELO coxu-arch-shz.sh.intel.com) ([10.239.160.21])
 by orsmga001.jf.intel.com with ESMTP; 09 Jul 2020 00:11:05 -0700
From: Colin Xu <colin.xu@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v2 0/3] Fix ppgtt_mm destroy and pv_notified reset logic
 during vGPU D3->D0
Date: Thu,  9 Jul 2020 15:09:55 +0800
Message-Id: <20200709071002.247960-1-colin.xu@intel.com>
X-Mailer: git-send-email 2.27.0
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
Cc: kevin.tian@intel.com, colin.xu@intel.com, zhenyuw@linux.intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

The patch set fix issues when vGPU transit D3->D0:
Do not invalidate & destroy ppgtt_mm in dmlr when D3->D0.
Do not reset pv_notified in dmlr when D3->D0.

v2:
- Revise commit message to more accurate description. (Kevin)
- Split patch by logic. (Zhenyu)

Colin Xu (3):
  drm/i915/gvt: Do not destroy ppgtt_mm during vGPU D3->D0.
  drm/i915/gvt: Do not reset pv_notified when vGPU transit from D3->D0
  drm/i915/gvt: Remove intel_vgpu_reset_gtt() since no one use it.

 drivers/gpu/drm/i915/gvt/cfg_space.c | 24 ++++++++++++++++++++++++
 drivers/gpu/drm/i915/gvt/gtt.c       | 20 +-------------------
 drivers/gpu/drm/i915/gvt/gtt.h       |  3 ++-
 drivers/gpu/drm/i915/gvt/gvt.h       |  3 +++
 drivers/gpu/drm/i915/gvt/vgpu.c      | 20 +++++++++++++++++---
 5 files changed, 47 insertions(+), 23 deletions(-)

-- 
2.27.0

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
