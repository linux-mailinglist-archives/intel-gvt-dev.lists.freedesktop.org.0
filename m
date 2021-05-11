Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B918379D4D
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 11 May 2021 05:03:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D67746E9A8;
	Tue, 11 May 2021 03:03:22 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7E016E9A8
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 11 May 2021 03:03:20 +0000 (UTC)
IronPort-SDR: J0+GbSkmFm6nEeCGuW+THD0K1E+rS5mmEOGrPdxAIuBMPbYgYFAXwHYnj8oUB8yktU94b1ZKk6
 HCVGmKhESseQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="199393890"
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="199393890"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2021 20:03:03 -0700
IronPort-SDR: l/9b2DC4Sq2LQe+RD/oFnIyuvYUQWUJrkJyuplK+su+ekyBFMxk34RH6hC0a35vQUjGKWjGRoV
 KKopgJYLU+6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="609328955"
Received: from unknown (HELO coxu-arch-shz.sh.intel.com) ([10.239.160.26])
 by orsmga005.jf.intel.com with ESMTP; 10 May 2021 20:03:01 -0700
From: Colin Xu <colin.xu@intel.com>
To: stable@vger.kernel.org
Subject: [PATCH 0/2] drm/i915/gvt: Backport GVT BXT/APL fix to 5.10.y
Date: Tue, 11 May 2021 11:02:53 +0800
Message-Id: <cover.1620702000.git.colin.xu@intel.com>
X-Mailer: git-send-email 2.31.1
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

commit a5a8ef937cfa79167f4b2a5602092b8d14fd6b9a upstream
commit 4ceb06e7c336f4a8d3f3b6ac9a4fea2e9c97dc07 upstream

Upstream intel-gvt fixed some breaking and GPU hang issues on BXT/APL platform
but 5.10.y doesn't have so backport them. These patch have been rebased to
linux-5.10.y.

Colin Xu (2):
  drm/i915/gvt: Fix virtual display setup for BXT/APL
  drm/i915/gvt: Fix vfio_edid issue for BXT/APL

 drivers/gpu/drm/i915/gvt/display.c | 212 +++++++++++++++++++++++++++++
 drivers/gpu/drm/i915/gvt/mmio.c    |   5 +
 drivers/gpu/drm/i915/gvt/vgpu.c    |   5 +-
 3 files changed, 219 insertions(+), 3 deletions(-)

-- 
2.31.1

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
