Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CDDC2E17E3
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 23 Dec 2020 04:56:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E80E6E8C2;
	Wed, 23 Dec 2020 03:56:43 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 687826E8C2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 23 Dec 2020 03:56:42 +0000 (UTC)
IronPort-SDR: rVQPa8rygCap7sCWs8lmCIV01GyMFu8YYr1W5t7fcfoTazFVhkOQoIpKeHT4YHFucBwSZ/mfa7
 ol+aXAZjDe4w==
X-IronPort-AV: E=McAfee;i="6000,8403,9843"; a="240042630"
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; d="scan'208";a="240042630"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2020 19:56:41 -0800
IronPort-SDR: o6ZVI8WhpbF+cvB6gp+nWWFjWLdx12rW0Iy0NH6Dla6B89yP7qVTq6T0gssm9BfBpyG4LFRfDk
 ISi6idUPRubA==
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; d="scan'208";a="373803976"
Received: from yzhao56-desk.sh.intel.com ([10.239.13.16])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2020 19:56:40 -0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org,
	zhenyuw@linux.intel.com
Subject: [PATCH v5 00/11] cmd scanning optimization
Date: Wed, 23 Dec 2020 11:43:53 +0800
Message-Id: <20201223034353.16882-1-yan.y.zhao@intel.com>
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
This is a series that optimizes current command scanning logic.

Patch 1 scans a init context to parse hardware context and set
mmio cmd accessible flag accordingly.

Patch 2 scans workload context pages.

Patches 3-5 add extra commands scan policy for "srm", "lrm", "lrr".
            "pipe-ctrl" is a TODO to be completed in future.

patch 6 exports a find_mmio_info interface to be used in patch 10 and
        patch 11

patch 7 extends mmio_attribute from 8 bits to 16 bits as we have been
        running out of bits for mmio flags.

Patches 8-10 introduce a new mmio flag F_CMD_WRITE_PATCH and init this
            flag in static handlers array and dynamically during parsing
            init ctx.

Patch 11 unifies lri command handler with MMIO handler


changelogs:
v5:
- rebased to gvt-staging-2020y-12m-22d-13h-12m-37s
 
v4:
- fixed the error path handling in patch 1 that may leak context unpin
(zhenyu)

v3:
- updated patch 7 to extend mmio_attribute to 16 bits instead of 32 bits.

v2:
- combined serial smaller loops into one big loop in
  intel_gvt_update_reg_whitelist() in patch 1 (zhenyu)
- updated comment style for "pipe_ctrl" and add description for TODO
  item. (zhenyu)
- changed intel_gvt_mmio_set_cmd_fix_write() and
  intel_gvt_mmio_is_cmd_fix_write() to intel_gvt_mmio_set_cmd_write_patch()
  and intel_gvt_mmio_is_cmd_write_patch() in order to align with mmio flag
  name. (zhenyu)
- added patch 7 to exend mmio_attribute in order to hold more mmio
  flags. (zhenyu)

Yan Zhao (11):
  drm/i915/gvt: parse init context to update cmd accessible reg
    whitelist
  drm/i915/gvt: scan VM ctx pages
  drm/i915/gvt: filter cmds "srm" and "lrm" in cmd_handler
  drm/i915/gvt: filter cmds "lrr-src" and "lrr-dst" in cmd_handler
  drm/i915/gvt: filter cmd "pipe-ctrl" in cmd_handler
  drm/i915/gvt: export find_mmio_info
  drm/i915/gvt: make width of mmio_attribute bigger
  drm/i915/gvt: introduce a new flag F_CMD_WRITE_PATCH
  drm/i915/gvt: statically set F_CMD_WRITE_PATCH flag
  drm/i915/gvt: update F_CMD_WRITE_PATCH flag when parsing init ctx
  drm/i915/gvt: unify lri cmd handler and mmio handlers

 drivers/gpu/drm/i915/gvt/cmd_parser.c | 335 ++++++++++++++++++++------
 drivers/gpu/drm/i915/gvt/cmd_parser.h |   4 +
 drivers/gpu/drm/i915/gvt/gvt.h        |  37 ++-
 drivers/gpu/drm/i915/gvt/handlers.c   |  15 +-
 drivers/gpu/drm/i915/gvt/mmio.h       |   3 +
 drivers/gpu/drm/i915/gvt/reg.h        |   2 +
 drivers/gpu/drm/i915/gvt/scheduler.c  |  22 +-
 drivers/gpu/drm/i915/gvt/vgpu.c       |   4 +-
 8 files changed, 339 insertions(+), 83 deletions(-)

-- 
2.17.1

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
