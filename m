Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5331AB728
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 16 Apr 2020 07:16:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 693796E22D;
	Thu, 16 Apr 2020 05:16:56 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC6DE6E22D
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 16 Apr 2020 05:16:54 +0000 (UTC)
IronPort-SDR: KI8pmkuDiBDZ+dhhdxdVFR3GvYeAWiDyZkS7jAdNnfnQifmsiRw0SoV60Wu99oAbrqD/V0y+pr
 ysyCwP/D2H4Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2020 22:16:54 -0700
IronPort-SDR: R3Bc07Yro7IexVnXKrthVhwaYGJHKYnZWAl3oHKXFJmD2GkgMhAt0/iG9v1NOxkC7ZR7nuFhIQ
 Zq1dLupByoqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,388,1580803200"; d="scan'208";a="288771417"
Received: from shao2-debian.sh.intel.com (HELO localhost) ([10.239.13.3])
 by fmsmga002.fm.intel.com with ESMTP; 15 Apr 2020 22:16:52 -0700
Date: Thu, 16 Apr 2020 13:16:27 +0800
From: kbuild test robot <lkp@intel.com>
To: Tina Zhang <tina.zhang@intel.com>
Subject: [RFC PATCH intel-gvt-linux] drm/i915/gvt: intel_vgpu_set_irqs() can
 be static
Message-ID: <20200416051626.GB3064@shao2-debian>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200416051354.GA3064@shao2-debian>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: intel-gvt-dev@lists.freedesktop.org, terrence.xu@intel.com,
 kbuild-all@lists.01.org, zhenyu.z.wang@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Fixes: 8dae6a8b97ea ("drm/i915/gvt: Notify user space with the dmabuf flip event")
Signed-off-by: kbuild test robot <lkp@intel.com>
---
 kvmgt.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 4ccc39e82d3fe..e2a0caac7844f 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -1331,7 +1331,7 @@ static int intel_vgpu_set_display_event_trigger(struct intel_vgpu *vgpu,
 	return 0;
 }
 
-int intel_vgpu_set_irqs(struct intel_vgpu *vgpu, u32 flags,
+static int intel_vgpu_set_irqs(struct intel_vgpu *vgpu, u32 flags,
 		unsigned int index, unsigned int start, unsigned int count,
 		void *data)
 {
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
