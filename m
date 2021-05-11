Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4E237A209
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 11 May 2021 10:31:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 110F66E9FA;
	Tue, 11 May 2021 08:31:31 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12CE16E9FA;
 Tue, 11 May 2021 08:31:29 +0000 (UTC)
IronPort-SDR: QgmvR6x21xr7UILbtD3S4yNV96kuUmRxwq9ZxUwRNVrpcUQfr5vcY/27zSqBQtUC44nrIcaxZX
 kQCL0KswIYjQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="284875108"
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="284875108"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 01:31:29 -0700
IronPort-SDR: uPMWVYadRgC/Id/Q2bb7qS9BlLk0Y0D1SPeZaxsKOrAnSsL7cx6fnc12qkQHpSGzn+c8FwKFI5
 MYAw5IP8+O6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="536895395"
Received: from debian-skl.sh.intel.com ([10.239.160.37])
 by fmsmga001.fm.intel.com with ESMTP; 11 May 2021 01:31:28 -0700
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/3] Fix I915_GVT dependency
Date: Tue, 11 May 2021 16:33:29 +0800
Message-Id: <20210511083332.1740601-1-zhenyuw@linux.intel.com>
X-Mailer: git-send-email 2.31.0
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
Cc: intel-gvt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

This is to fix I915_GVT dependency mess to move all vfio/dev handling
into kvmgt module, so gvt device model core won't need to depend on vfio/mdev.

Currently apply against linus master with merge from vfio tree. This targets
for 5.13 fix.

thanks

Zhenyu Wang (3):
  drm/i915/gvt: Move mdev attribute groups into kvmgt module
  Revert "vfio/gvt: fix DRM_I915_GVT dependency on VFIO_MDEV"
  Revert "vfio/gvt: Make DRM_I915_GVT depend on VFIO_MDEV"

 drivers/gpu/drm/i915/Kconfig         |   1 -
 drivers/gpu/drm/i915/gvt/gvt.c       | 124 +------------------------
 drivers/gpu/drm/i915/gvt/gvt.h       |   3 -
 drivers/gpu/drm/i915/gvt/hypercall.h |   2 +-
 drivers/gpu/drm/i915/gvt/kvmgt.c     | 129 +++++++++++++++++++++++++--
 drivers/gpu/drm/i915/gvt/mpt.h       |   4 +-
 6 files changed, 126 insertions(+), 137 deletions(-)

-- 
2.31.0

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
