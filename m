Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B10DD50348F
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 16 Apr 2022 08:53:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5857110E2F6;
	Sat, 16 Apr 2022 06:53:58 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD56D10E2F6
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 16 Apr 2022 06:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650092036; x=1681628036;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=fAE2xMjKJTAYYfojBwucYXlSRxc0bm4fLjTRmufZB7M=;
 b=Z5fgMA8KewDZd6KXhxI6LOfAe5LxrsXDi8UdIu6Ka1dooKzFP/9bW0L5
 XsIo1aWgmt+AkNWmh4ccvOYMSc5RBRBt7DfId9cIkpLtAxx1pe5OUegZv
 v8DN+ngIDe2VlhvPASlw16R2xy1FNZ5lAirf5ykewvI370aDA5lbvTZ95
 2F7HqaygwMvPcJAcaDy/02kkuDlkWdqQMqeoMBXdriVVfMLEDhTzIy/ax
 IJwG1Qxo1dj20ChATlyfZfQmTnE2dnQkHFQ1iS5gwtAiIgmRwaZp1eZvq
 AqQACb8H9McKcU8ofHBRzwHl07NpD3G+ZC1KBRf3M4tfbPM5pgNsIXI2h Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10318"; a="263448534"
X-IronPort-AV: E=Sophos;i="5.90,264,1643702400"; d="scan'208";a="263448534"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2022 23:53:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,264,1643702400"; d="scan'208";a="662698366"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
 by orsmga004.jf.intel.com with ESMTP; 15 Apr 2022 23:53:53 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nfcJc-0002sf-MQ;
 Sat, 16 Apr 2022 06:53:52 +0000
Date: Sat, 16 Apr 2022 14:52:54 +0800
From: kernel test robot <lkp@intel.com>
To: Zhi Wang <zhi.a.wang@intel.com>
Subject: [intel-gvt:topic/for-christoph 1/37]
 drivers/gpu/drm/i915/intel_gvt_mmio_table.c:7:10: fatal error:
 display/intel_dmc_regs.h: No such file or directory
Message-ID: <202204161401.AtiDTPRF-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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
Cc: kbuild-all@lists.01.org, zhenyu.z.wang@intel.com,
 linux-kernel@vger.kernel.org, Zhenyu Wang <zhenyuw@linux.intel.com>,
 terrence.xu@intel.com, intel-gvt-dev@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

tree:   https://github.com/intel/gvt-linux.git topic/for-christoph
head:   fd6f410fe5eced449a4d6467a4f4789a8eb10382
commit: 07de96038f7d8a179287ae178dfcad8f085abb9e [1/37] i915/gvt: Separate the MMIO tracking table from GVT-g
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20220416/202204161401.AtiDTPRF-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0
reproduce (this is a W=1 build):
        # https://github.com/intel/gvt-linux/commit/07de96038f7d8a179287ae178dfcad8f085abb9e
        git remote add intel-gvt https://github.com/intel/gvt-linux.git
        git fetch --no-tags intel-gvt topic/for-christoph
        git checkout 07de96038f7d8a179287ae178dfcad8f085abb9e
        # save the config file to linux build tree
        mkdir build_dir
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/intel_gvt_mmio_table.c:7:10: fatal error: display/intel_dmc_regs.h: No such file or directory
       7 | #include "display/intel_dmc_regs.h"
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +7 drivers/gpu/drm/i915/intel_gvt_mmio_table.c

   > 7	#include "display/intel_dmc_regs.h"
     8	#include "gt/intel_gt_regs.h"
     9	#include "gvt/gvt.h"
    10	#include "i915_drv.h"
    11	#include "i915_pvinfo.h"
    12	#include "i915_reg.h"
    13	#include "intel_gvt.h"
    14	#include "intel_mchbar_regs.h"
    15	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
