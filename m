Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D33171AB725
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 16 Apr 2020 07:14:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D13C6E22D;
	Thu, 16 Apr 2020 05:14:23 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EC776E22D
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 16 Apr 2020 05:14:22 +0000 (UTC)
IronPort-SDR: qfgAngVrzJct/bqNVZHrMzS8OYyVvH9/CvMAi+dpBkL7S7UJ2vkbkx7Pn5sJR1DB9IvM1OXfdm
 zYOB/5LJ+/4w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2020 22:14:21 -0700
IronPort-SDR: uthvrfiD6mOujZWgZGJ2m5aviaCxF0Lf9yQfHpQmn2r/6IZfsxUqmiNOsq8Yfy1DSnCzjeCrms
 MWLbZ7R2kMqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,388,1580803200"; d="scan'208";a="400548362"
Received: from shao2-debian.sh.intel.com (HELO localhost) ([10.239.13.3])
 by orsmga004.jf.intel.com with ESMTP; 15 Apr 2020 22:14:20 -0700
Date: Thu, 16 Apr 2020 13:13:54 +0800
From: kbuild test robot <lkp@intel.com>
To: Tina Zhang <tina.zhang@intel.com>
Subject: [intel-gvt-linux:topic/drm-ui-direct-flip 3/5]
 drivers/gpu/drm/i915/gvt/kvmgt.c:1334:5: sparse: sparse: symbol
 'intel_vgpu_set_irqs' was not declared. Should it be static?
Message-ID: <20200416051354.GA3064@shao2-debian>
MIME-Version: 1.0
Content-Disposition: inline
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

tree:   https://github.com/intel/gvt-linux.git topic/drm-ui-direct-flip
head:   57a9a9830597774ecd5e16a8f3415d03825c015e
commit: 8dae6a8b97ea850a2da677e947947873e3539f80 [3/5] drm/i915/gvt: Notify user space with the dmabuf flip event
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-191-gc51a0382-dirty
        git checkout 8dae6a8b97ea850a2da677e947947873e3539f80
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'
:::::: branch date: 17 hours ago
:::::: commit date: 20 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/gpu/drm/i915/gvt/kvmgt.c:1334:5: sparse: sparse: symbol 'intel_vgpu_set_irqs' was not declared. Should it be static?

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
