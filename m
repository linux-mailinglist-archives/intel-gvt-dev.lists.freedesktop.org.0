Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EEA2D28D4
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  8 Dec 2020 11:29:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 525F86E0C2;
	Tue,  8 Dec 2020 10:29:27 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30C536E0BE;
 Tue,  8 Dec 2020 10:29:25 +0000 (UTC)
IronPort-SDR: wEvAikgRqUf73vEKpiA+66NO20Te3MsAwdgISjTjRGDc2C/uhVC6AD1EltdTuLPFxohwdTX62B
 tTFxiL9NPNQw==
X-IronPort-AV: E=McAfee;i="6000,8403,9828"; a="174014050"
X-IronPort-AV: E=Sophos;i="5.78,402,1599548400"; d="scan'208";a="174014050"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 02:29:21 -0800
IronPort-SDR: vt8/wGXy1b6E9JEXk4KwTZKej2Twpr2LPSnSapdA2hAVJeKQiVcsgFk3MJEMZHHTRUn8dEa41Z
 WHkTQAw1xakA==
X-IronPort-AV: E=Sophos;i="5.78,402,1599548400"; d="scan'208";a="363581960"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO localhost)
 ([10.213.246.199])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 02:29:20 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH 0/8] drm/i915/gvt: make headers self-contained
Date: Tue,  8 Dec 2020 12:29:06 +0200
Message-Id: <cover.1607422863.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

For a long time now we've had a build option in i915 to ensure the
headers in the driver are self-contained, i.e. they include and forward
declare everything they need. Finally fix the gvt headers that aren't,
and remove them from the exclude list.

Please use the CONFIG_DRM_I915_WERROR=y config option to ensure the
driver remains warning free and headers stay self-contained.

Please merge this via the gvt tree.


BR,
Jani.


Jani Nikula (8):
  drm/i915/gvt: make execlist.h self-contained
  drm/i915/gvt: make fb_decoder.h self-contained
  drm/i915/gvt: make gtt.h self-contained
  drm/i915/gvt: make interrupt.h self-contained
  drm/i915/gvt: make mmio_context.h self-contained
  drm/i915/gvt: make gvt.h self-contained
  drm/i915/gvt: make scheduler.h self-contained
  drm/i915/gvt: make mpt.h self-contained

 drivers/gpu/drm/i915/Makefile           | 10 +---------
 drivers/gpu/drm/i915/gvt/execlist.h     |  3 ---
 drivers/gpu/drm/i915/gvt/fb_decoder.h   |  6 ++++--
 drivers/gpu/drm/i915/gvt/gtt.h          | 11 ++++++++++-
 drivers/gpu/drm/i915/gvt/gvt.h          |  4 ++++
 drivers/gpu/drm/i915/gvt/interrupt.h    |  5 ++++-
 drivers/gpu/drm/i915/gvt/mmio_context.h | 11 +++++++++++
 drivers/gpu/drm/i915/gvt/mpt.h          |  2 ++
 drivers/gpu/drm/i915/gvt/scheduler.h    |  5 +++++
 9 files changed, 41 insertions(+), 16 deletions(-)

-- 
2.20.1

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
