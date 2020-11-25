Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3658E2C35BA
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 25 Nov 2020 01:49:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C711889CA4;
	Wed, 25 Nov 2020 00:49:03 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABCA989CA4
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 25 Nov 2020 00:49:02 +0000 (UTC)
IronPort-SDR: G4hsNQ8cOfFdhL0scjUM6V0vOAHvQeU5I3oMVvJogC0KBlPm1fk6gxMnUhmQmiNTyaZYaMX5gO
 +G2nKKfsdkhg==
X-IronPort-AV: E=McAfee;i="6000,8403,9815"; a="151300308"
X-IronPort-AV: E=Sophos;i="5.78,367,1599548400"; d="scan'208";a="151300308"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2020 16:49:02 -0800
IronPort-SDR: HYYeoh7oaHiKuDLSy767TXwcOL4d/5DabkRa2ueRXw4+Ppe3gYCkWgyZqZ49wf3t+go0R78M24
 tjQKiYVn7l3Q==
X-IronPort-AV: E=Sophos;i="5.78,367,1599548400"; d="scan'208";a="547062350"
Received: from yzhao56-desk.sh.intel.com ([10.239.13.16])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2020 16:49:01 -0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH 00/10] cmd scanning optimization
Date: Wed, 25 Nov 2020 08:36:26 +0800
Message-Id: <20201125003626.17806-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Yan Zhao <yan.y.zhao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

hi
This is a series that optimization current command scanning logic.

Patch 1 scans a init context to parse hardware context and set
mmio cmd accessible flag accordingly.

Patch 2 scans workload context pages.

Patches 3-5 add extra commands scan policy for "srm", "lrm", "lrr".
            "pipe-ctrl" is a TODO to be completed in future.

patch 6 exports a find_mmio_info interface to be used in patch 9 and patch 10

Patches 7-9 introduce a new mmio flag F_CMD_WRITE_PATCH and init this
            flag in static handlers array and dynamically during parsing
            init ctx.

Patch 10 unifies lri command handler with MMIO handler

Yan Zhao (10):
  drm/i915/gvt: parse init context to update cmd accessible reg
    whitelist
  drm/i915/gvt: scan VM ctx pages
  drm/i915/gvt: filter cmds "srm" and "lrm" in cmd_handler
  drm/i915/gvt: filter cmds "lrr-src" and "lrr-dst" in cmd_handler
  drm/i915/gvt: filter cmd "pipe-ctrl" in cmd_handler
  drm/i915/gvt: export find_mmio_info
  drm/i915/gvt: introduce a new flag F_CMD_WRITE_PATCH
  drm/i915/gvt: statically set F_CMD_WRITE_PATCH flag
  drm/i915/gvt: update F_CMD_WRITE_PATCH flag when parsing init ctx
  drm/i915/gvt: unify lri cmd handler and mmio handlers

 drivers/gpu/drm/i915/gvt/cmd_parser.c | 346 ++++++++++++++++++++------
 drivers/gpu/drm/i915/gvt/cmd_parser.h |   4 +
 drivers/gpu/drm/i915/gvt/gvt.h        |  36 ++-
 drivers/gpu/drm/i915/gvt/handlers.c   |  13 +-
 drivers/gpu/drm/i915/gvt/mmio.h       |   3 +
 drivers/gpu/drm/i915/gvt/reg.h        |   2 +
 drivers/gpu/drm/i915/gvt/scheduler.c  |  22 +-
 drivers/gpu/drm/i915/gvt/vgpu.c       |   4 +-
 8 files changed, 348 insertions(+), 82 deletions(-)

-- 
2.17.1

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
