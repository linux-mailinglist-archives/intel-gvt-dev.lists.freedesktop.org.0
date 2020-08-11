Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3D924163F
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 11 Aug 2020 08:18:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D2516E0F4;
	Tue, 11 Aug 2020 06:18:50 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15D286E0F4
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 11 Aug 2020 06:18:49 +0000 (UTC)
IronPort-SDR: bifcNECgS6tToiVWGBsC7yIuzw75GxdB7vlAvavxXw0ftgBzdColESqgH+zVf4B622vhNlL9d8
 JUoN0NErmlyQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9709"; a="141289264"
X-IronPort-AV: E=Sophos;i="5.75,460,1589266800"; d="scan'208";a="141289264"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2020 23:18:47 -0700
IronPort-SDR: TDznsUK2jgR5ZAK1D1uaF0/AEOnTcEGBi3ipyRQ3ioLT5mZoaUpxwjNiOKuch02V95EVqKZZg4
 eINDykjOEMbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,460,1589266800"; d="scan'208";a="324671325"
Received: from joy-optiplex-7040.sh.intel.com ([10.239.13.16])
 by orsmga008.jf.intel.com with ESMTP; 10 Aug 2020 23:18:46 -0700
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org,
	zhenyuw@linux.intel.com
Subject: [PATCH 0/4] some cleanup of cmdparser flags
Date: Tue, 11 Aug 2020 13:51:40 +0800
Message-Id: <20200811055140.29123-1-yan.y.zhao@intel.com>
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

some cleanup patches for flags used in cmdparser.

Yan Zhao (4):
  drm/i915/gvt: rename F_IN_CTX flag to F_SR_IN_CTX
  drm/i915/gvt: remove flag F_CMD_ACCESSED
  drm/i915/gvt: add/modify interfaces for flag F_CMD_ACCESS
  drm/i915/gvt: remove F_CMD_ACCESS flag for some registers

 drivers/gpu/drm/i915/gvt/cmd_parser.c   |  6 ++--
 drivers/gpu/drm/i915/gvt/gvt.h          | 44 ++++++++++++++-----------
 drivers/gpu/drm/i915/gvt/handlers.c     | 28 +++++++++-------
 drivers/gpu/drm/i915/gvt/mmio_context.c |  2 +-
 4 files changed, 44 insertions(+), 36 deletions(-)

-- 
2.17.1

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
