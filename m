Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D031D70EF
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 18 May 2020 08:28:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F4A66E11C;
	Mon, 18 May 2020 06:28:58 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 889806E11C
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 18 May 2020 06:28:56 +0000 (UTC)
IronPort-SDR: xf/QUPma1LU2dHNZI7WN2v2Cb+HepTOqK/VX7OaPnL7MotIEdXYdkJ2fiaH8N1baShjMzR5TWB
 opREXZ3ZurJw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2020 23:28:53 -0700
IronPort-SDR: cuSZPWVr4qaYJGeUe7UT+2sHiXlAGdYTxG1btx3/8U4YnVQrEf998ThpeSyhQa+xBQywpWU/59
 +E5hreOrjBMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,406,1583222400"; d="scan'208";a="465464257"
Received: from unknown (HELO coxu-arch-shz.sh.intel.com) ([10.239.160.118])
 by fmsmga005.fm.intel.com with ESMTP; 17 May 2020 23:28:54 -0700
From: Colin Xu <colin.xu@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH 0/2] Enable GVT enabled host S3/Resume.
Date: Mon, 18 May 2020 14:28:50 +0800
Message-Id: <20200518062852.158709-1-colin.xu@intel.com>
X-Mailer: git-send-email 2.26.2
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
Cc: colin.xu@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Patch 1/2: Add necessary routine in gvt.
Patch 2/2: Add suspend/resume routine to i915.

Colin Xu (2):
  drm/i915/gvt: Enable GVT enabled host S3/Resume
  drm/i915/gvt: Add GVT suspend/resume routine to i915.

 drivers/gpu/drm/i915/gvt/gtt.c      | 74 +++++++++++++++++++++++++++++
 drivers/gpu/drm/i915/gvt/gtt.h      |  2 +
 drivers/gpu/drm/i915/gvt/gvt.c      | 14 ++++++
 drivers/gpu/drm/i915/gvt/gvt.h      |  6 +++
 drivers/gpu/drm/i915/gvt/handlers.c | 20 ++++++++
 drivers/gpu/drm/i915/gvt/mmio.h     |  3 ++
 drivers/gpu/drm/i915/gvt/vgpu.c     |  1 +
 drivers/gpu/drm/i915/i915_drv.c     | 15 ++++++
 8 files changed, 135 insertions(+)

-- 
2.26.2

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
