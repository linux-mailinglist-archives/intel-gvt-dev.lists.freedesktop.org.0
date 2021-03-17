Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4821F33E734
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 17 Mar 2021 03:55:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7FCC6E0A0;
	Wed, 17 Mar 2021 02:55:13 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEA4A6E0A0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 17 Mar 2021 02:55:12 +0000 (UTC)
IronPort-SDR: Z8UYVKy0lBbnbIigwOWzTNzVnf1JZl4kwD7wF0hHINkPIY0C0gURyB2mD3sicB87fhkFlQW/HT
 lyeXitXodPRA==
X-IronPort-AV: E=McAfee;i="6000,8403,9925"; a="176509012"
X-IronPort-AV: E=Sophos;i="5.81,254,1610438400"; d="scan'208";a="176509012"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2021 19:55:11 -0700
IronPort-SDR: 6F8Xetb+REVHd55/H7P6Mkix8meq0bXw6YbDtR/hMH6piONcm5A5e8ShDdmcF16zYaK77wukEH
 txuG+nkyW1lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,254,1610438400"; d="scan'208";a="590888164"
Received: from unknown (HELO coxu-arch-shz.sh.intel.com) ([10.239.160.25])
 by orsmga005.jf.intel.com with ESMTP; 16 Mar 2021 19:55:10 -0700
From: Colin Xu <colin.xu@intel.com>
To: stable@vger.kernel.org
Subject: [PATCH 0/5] drm/i915/gvt: Backport GVT BXT/APL fix to 5.4.y
Date: Wed, 17 Mar 2021 10:54:59 +0800
Message-Id: <cover.1615946755.git.colin.xu@intel.com>
X-Mailer: git-send-email 2.30.2
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
Cc: intel-gvt-dev@lists.freedesktop.org, colin.xu@intel.com,
 zhenyuw@linux.intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

commit 8fe105679765700378eb328495fcfe1566cdbbd0 upstream
commit 92010a97098c4c9fd777408cc98064d26b32695b upstream
commit a5a8ef937cfa79167f4b2a5602092b8d14fd6b9a upstream
commit 28284943ac94014767ecc2f7b3c5747c4a5617a0 upstream
commit 4ceb06e7c336f4a8d3f3b6ac9a4fea2e9c97dc07 upstream

Upstream intel-gvt fixed some breaking and GPU hang issues on BXT/APL platform
but 5.4.y doesn't have so backport them. These patch have been rebased to
linux-5.4.y.

Colin Xu (4):
  drm/i915/gvt: Set SNOOP for PAT3 on BXT/APL to workaround GPU BB hang
  drm/i915/gvt: Fix mmio handler break on BXT/APL.
  drm/i915/gvt: Fix virtual display setup for BXT/APL
  drm/i915/gvt: Fix vfio_edid issue for BXT/APL

Zhenyu Wang (1):
  drm/i915/gvt: Fix port number for BDW on EDID region setup

 drivers/gpu/drm/i915/gvt/display.c  | 212 ++++++++++++++++++++++++++++
 drivers/gpu/drm/i915/gvt/handlers.c |  40 +++++-
 drivers/gpu/drm/i915/gvt/mmio.c     |   5 +
 drivers/gpu/drm/i915/gvt/vgpu.c     |   5 +-
 4 files changed, 258 insertions(+), 4 deletions(-)

-- 
2.30.2

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
