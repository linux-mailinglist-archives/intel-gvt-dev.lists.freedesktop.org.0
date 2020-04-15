Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB511A9573
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 15 Apr 2020 10:03:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ABD36E8FE;
	Wed, 15 Apr 2020 08:03:42 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54E496E8FB
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 15 Apr 2020 08:03:41 +0000 (UTC)
IronPort-SDR: RjV5Z0a+pYzjh9rsU93hfsAIBRA4yuS/xLwlBNJsyR2K7o5SN3xCfTFHN2P3STxTQzxZnEoMSf
 4UG4idNRK7nw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2020 01:03:40 -0700
IronPort-SDR: OBl6sFtqP7KcCDdrxrPmSAZjY8xF2ow/3Bt1eVcBCp/YX8Sf++AZ3/NkZTtIzPUf/S4jlvteQX
 CSYgKrH8uKKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,386,1580803200"; d="scan'208";a="427353668"
Received: from joy-optiplex-7040.sh.intel.com ([10.239.13.16])
 by orsmga005.jf.intel.com with ESMTP; 15 Apr 2020 01:03:39 -0700
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v4 0/3] drm/i915/gvt: optimizaton on shadow context population
Date: Wed, 15 Apr 2020 03:53:55 -0400
Message-Id: <20200415075355.23308-1-yan.y.zhao@intel.com>
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
Cc: Yan Zhao <yan.y.zhao@intel.com>, zhenyuw@linux.intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

This patchset skips population of shadow contexts if their corresponding
guest contexts are known not changed.

patch 1 implements the skipping logic, though intentionally disabled the
skip.
patch 2 checks ggtt entry to verify guest contexts are not changed.
patch 3 turns on the skipping logic

Yan Zhao (3):
  drm/i915/gvt: skip populate shadow context if guest context not
    changed
  drm/i915/gvt: check ggtt entry modification status for guest ctxs
  drm/i915/gvt: turn on shadow context skipping

 drivers/gpu/drm/i915/gvt/gtt.c       | 17 ++++++++++++++
 drivers/gpu/drm/i915/gvt/gvt.h       |  5 ++++
 drivers/gpu/drm/i915/gvt/scheduler.c | 35 ++++++++++++++++++++++++----
 3 files changed, 52 insertions(+), 5 deletions(-)

-- 
2.17.1

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
