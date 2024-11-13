Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6D79C6949
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 13 Nov 2024 07:32:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE04910E261;
	Wed, 13 Nov 2024 06:31:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B6YrHqsC";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E4D710E261;
 Wed, 13 Nov 2024 06:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731479514; x=1763015514;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=f9PbtuxHNWC0ETgKN8/bG+cgKqsQUNlol+gLZrMPGbU=;
 b=B6YrHqsC+xHoguu8LRslixXygrAG3EgySzQzH3ndAoV2n8Xs27XyTgyw
 orEYKIwkNzLr/UmVx6RmK8G888EshTxc1rZJLgkNUQ4yPo82I8De2a0tr
 uRAyVjua9h9n6G36060oOo0N2tgJkQmupevc/Fef8coreUWx/1jGZCfAA
 059+ni5uy+v98pkvmorbJMYQcsisHHc/e7Ue92qIx9IsfQckWM4mC0wKQ
 VQVvlbSeP9KlRq+8PHM0IqnaJFncwpSixfBqpsh0jGe3nrC7LaD4dCe9D
 ugwr9htzWmzPY0n+FxDvSNmC9rzPJ+zSETBUyz1hW4u2wDS9nDo71Dp7H w==;
X-CSE-ConnectionGUID: aXYhqrDeTvGOAqVbac9zNA==
X-CSE-MsgGUID: 5RcJ4Q/IRdeIlVu8oEQZkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="48810478"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="48810478"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 22:31:54 -0800
X-CSE-ConnectionGUID: HjZbDFEDSLSopmMosHXQoA==
X-CSE-MsgGUID: fTee5+e5QRi4JMQYjU7uvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; d="scan'208";a="92844874"
Received: from zwan2-desk1.sh.intel.com ([10.239.160.154])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 22:22:51 -0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-gvt-dev@lists.freedesktop.org
Cc: Zhi Wang <zhi.wang.linux@gmail.com>, Zhiyuan Lv <zhiyuan.lv@intel.com>,
 James Wu <james.y.wu@intel.com>, Zhenyu Wang <zhenyuw.linux@gmail.com>
Subject: [PATCH] MAINTAINERS: switch my mail address for GVT driver
Date: Wed, 13 Nov 2024 14:37:00 +0800
Message-ID: <20241113063700.4460-1-zhenyuw@linux.intel.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
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
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

I won't be able to use intel account, so this switchs address to my
gmail account.

Cc: Zhi Wang <zhi.wang.linux@gmail.com>
Cc: Zhiyuan Lv <zhiyuan.lv@intel.com>
Cc: James Wu <james.y.wu@intel.com>
Cc: Zhenyu Wang <zhenyuw.linux@gmail.com>
Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 21fdaa19229a..5170ab32654c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11423,7 +11423,7 @@ F:	drivers/gpio/gpio-tangier.c
 F:	drivers/gpio/gpio-tangier.h
 
 INTEL GVT-g DRIVERS (Intel GPU Virtualization)
-M:	Zhenyu Wang <zhenyuw@linux.intel.com>
+M:	Zhenyu Wang <zhenyuw.linux@gmail.com>
 M:	Zhi Wang <zhi.wang.linux@gmail.com>
 L:	intel-gvt-dev@lists.freedesktop.org
 L:	intel-gfx@lists.freedesktop.org
-- 
2.45.2

