Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4524FF6B6
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 13 Apr 2022 14:25:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6F0010E77A;
	Wed, 13 Apr 2022 12:25:48 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A17A10E775;
 Wed, 13 Apr 2022 12:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649852747; x=1681388747;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=g2XCBmZQ0Pv08fHm1yfKGavWqilh6gooZfkoV/2fVnc=;
 b=OkAquB2u4zpOVMlWUI4fs9FmMgTuwG5A79Dj3Wl7EgdtiXjUrxD4+w/B
 dLfmbehyrLyt/CvWn/C/3AO4BJ+CHBsn21YvkuIgtXLiQCStb7zajEuzH
 EUEWjO/WEUzAzs50WyE/+Ai9ZzH2w4s+RibVszYYHdcef3beN6dv+unov
 o1DR/UVaBQX9UD7Zslv84yHGiMvORkrjxRpsMJJ+xG6s7TlCK0igLXmIe
 1DrMW6dlmdHi0aGP8rcJ4QAcT4HTYwbUT6CP7osF0CSHLnnmAHV59SCw+
 zOUiluhvERjiWxQK8kjB0YOo1RtqYHbJdkargb87V/DKskausoxy/r4DF A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10315"; a="287676563"
X-IronPort-AV: E=Sophos;i="5.90,256,1643702400"; d="scan'208";a="287676563"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2022 05:25:46 -0700
X-IronPort-AV: E=Sophos;i="5.90,256,1643702400"; d="scan'208";a="573246733"
Received: from psoltysi-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.149.160])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2022 05:25:43 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH 0/2] drm/i915/gvt: clean up makefile
Date: Wed, 13 Apr 2022 15:25:37 +0300
Message-Id: <cover.1649852517.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 Zhi Wang <zhi.wang.linux@gmail.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Christoph Hellwig <hch@lst.de>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

This is [1] rebased on gvt-next. (Which means it won't build on CI.)

BR,
Jani.


[1] https://patchwork.freedesktop.org/series/102003/


Cc: Zhi Wang <zhi.wang.linux@gmail.com>
Cc: Christoph Hellwig <hch@lst.de>


Jani Nikula (2):
  drm/i915/gvt: fix trace TRACE_INCLUDE_PATH
  drm/i915/gvt: better align the Makefile with i915 Makefile

 drivers/gpu/drm/i915/Makefile     |  6 +++---
 drivers/gpu/drm/i915/gvt/Makefile | 30 +++++++++++++++++++++++-------
 drivers/gpu/drm/i915/gvt/trace.h  |  2 +-
 3 files changed, 27 insertions(+), 11 deletions(-)

-- 
2.30.2

