Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D62365080D7
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 20 Apr 2022 08:07:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A28E10F094;
	Wed, 20 Apr 2022 06:07:11 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8BDA10F085
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 20 Apr 2022 06:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650434829; x=1681970829;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=KuTd6E5ybvZ3QtSW21mxFZwhHyRoMHrc0tzA+AaNBso=;
 b=JS7FYwhuYWygFtydMBqUhFqhoyTTpNbhsT0zsn8+ynxiHO0Bz+vDqjgH
 4rkMZqYYqtUAvfr7vbd3Ul/g0/UoWpxkBDNguvs0G5k3wgYL+geYU2sP8
 QyiYNA/dZbM56MnMYfE4ppkzydgZ7w8qN4vIYBOJK0VwbnHVLqoEMtlFP
 fc/sTE721ziHFozjHWKrfctYB9Ts7TRgGjJmVqeThao1X+NPNUMGBr6fe
 zXLo5ZZYKKaARWp29V39Z5IziZQdDp1g/w1NDbHCX1Eda1ZbwQtLdW9cD
 QWpFNq+RPTbk8kbL46iIdyM+XgKvo3370o1VUoSsagRuH9I8fMAL2fTHs g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10322"; a="243880717"
X-IronPort-AV: E=Sophos;i="5.90,274,1643702400"; d="scan'208";a="243880717"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2022 23:07:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,274,1643702400"; d="scan'208";a="510425000"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 19 Apr 2022 23:07:06 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nh3UY-0006dh-6F;
 Wed, 20 Apr 2022 06:07:06 +0000
Date: Wed, 20 Apr 2022 14:06:58 +0800
From: kernel test robot <lkp@intel.com>
To: Zhi Wang <zhi.a.wang@intel.com>
Subject: [intel-gvt:gvt-next-bak-2022-04-13 2/4]
 drivers/gpu/drm/i915/intel_gvt.h:66:5: error: no previous prototype for
 'intel_gvt_iterate_mmio_table'
Message-ID: <202204201327.wDSzH3pV-lkp@intel.com>
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

tree:   https://github.com/intel/gvt-linux.git gvt-next-bak-2022-04-13
head:   f267d34e47f33a283b785a31b7b8d1c899502743
commit: e870ce1791520cd03f67c5a16f309d94e4aede85 [2/4] i915/gvt: Separate the MMIO tracking table from GVT-g
config: i386-defconfig (https://download.01.org/0day-ci/archive/20220420/202204201327.wDSzH3pV-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0
reproduce (this is a W=1 build):
        # https://github.com/intel/gvt-linux/commit/e870ce1791520cd03f67c5a16f309d94e4aede85
        git remote add intel-gvt https://github.com/intel/gvt-linux.git
        git fetch --no-tags intel-gvt gvt-next-bak-2022-04-13
        git checkout e870ce1791520cd03f67c5a16f309d94e4aede85
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/gvt/gvt.h:39,
                    from drivers/gpu/drm/i915/gvt/mpt.h:36,
                    from <command-line>:
   drivers/gpu/drm/i915/intel_gvt.h:66:41: error: 'struct intel_gvt_mmio_table_iter' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
      66 | int intel_gvt_iterate_mmio_table(struct intel_gvt_mmio_table_iter *iter)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/i915/intel_gvt.h:66:5: error: no previous prototype for 'intel_gvt_iterate_mmio_table' [-Werror=missing-prototypes]
      66 | int intel_gvt_iterate_mmio_table(struct intel_gvt_mmio_table_iter *iter)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +/intel_gvt_iterate_mmio_table +66 drivers/gpu/drm/i915/intel_gvt.h

    65	
  > 66	int intel_gvt_iterate_mmio_table(struct intel_gvt_mmio_table_iter *iter)
    67	{
    68		return 0;
    69	}
    70	#endif
    71	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
