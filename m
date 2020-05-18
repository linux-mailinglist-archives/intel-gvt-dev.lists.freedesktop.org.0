Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FC51D714C
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 18 May 2020 08:52:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8E5F6E1EE;
	Mon, 18 May 2020 06:52:31 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B1736E1EE
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 18 May 2020 06:52:31 +0000 (UTC)
IronPort-SDR: iliXz6dQiQBJrVz7c05xF3y1z6xwXGbINKwWsR39yJfgTyXO976WQjlWBLhJg1lA+9ibXLjUam
 saqUS+FjRWyQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2020 23:52:30 -0700
IronPort-SDR: wptS+nocqs42AdMOeRUAi+bAOWbDU1Dlx7UVeFhiPnFEi01aTb2YubM/kQ7DdXWI074rtJSfFi
 rX2CRVx+SRgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,406,1583222400"; d="scan'208";a="465470675"
Received: from unknown (HELO coxu-arch-shz.sh.intel.com) ([10.239.160.118])
 by fmsmga005.fm.intel.com with ESMTP; 17 May 2020 23:52:29 -0700
From: Colin Xu <colin.xu@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH 0/2] Refactor to per-vGPU accurate vblank emulator
Date: Mon, 18 May 2020 14:52:25 +0800
Message-Id: <20200518065227.178251-1-colin.xu@intel.com>
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

The patch set includes two patches:
Patch 1/2: Get accurate vGPU virtual display refresh rate from vreg
Patch 2/2: Use per-vGPU vblank emulator at dynamic & accurate refresh rate.

The patch set resovles below issues:
- 16ms matches the refresh rate at 62.5Hz (instead of 60Hz) which isn't
  belong to standard timing. This leads to some frame drop or glitch issue
  during video playback. Since SW expect at least 16.667ms peroid for 60Hz
  or may need higher resolution, however vblank emulator only works at 16.
- Doesn't respect the fact that with current virtual EDID timing set,
  not all resolutions are enabled at 60Hz. For example, current virtual
  EDID actually supports refresh rate like 56Hz, 59.97Hz, 60Hz, 75Hz, etc.
- Current vblank emulator use single hrtimer for all vGPUs. Regardsless
  how guest changing the resolution, all vsync interupts are injected at
  16ms interval.

With the patch set, the actual refresh rate from guest can now always
match guest OS resolution settings.
To run quick test, launch a web browser and goto URL: www.displayhz.com

Colin Xu (2):
  drm/i915/gvt: Get accurate vGPU virtual display refresh rate from vreg
  drm/i915/gvt: Refactor GVT vblank emulator for vGPU virtual display

 drivers/gpu/drm/i915/gvt/display.c   | 113 ++++++++++++++++-----------
 drivers/gpu/drm/i915/gvt/display.h   |  13 ++-
 drivers/gpu/drm/i915/gvt/gvt.c       |  21 ++++-
 drivers/gpu/drm/i915/gvt/gvt.h       |  13 ++-
 drivers/gpu/drm/i915/gvt/handlers.c  | 113 +++++++++++++++++++++++++--
 drivers/gpu/drm/i915/gvt/interrupt.c |  31 ++------
 drivers/gpu/drm/i915/gvt/interrupt.h |   6 --
 drivers/gpu/drm/i915/gvt/vgpu.c      |   2 -
 8 files changed, 217 insertions(+), 95 deletions(-)

-- 
2.26.2

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
