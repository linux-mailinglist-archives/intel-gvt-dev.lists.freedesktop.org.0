Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1386E5097CB
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 21 Apr 2022 08:40:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD58E10F493;
	Thu, 21 Apr 2022 06:40:52 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CA1510F493
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 21 Apr 2022 06:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650523252; x=1682059252;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=nu5Wpf/FIryLF3arCfxEzEoOTvoNmAs9ROtYcVQsZuU=;
 b=Hu0s733OyDx+7M39HFzFpa+5gzI89os7kwq8ne47WtA9Vo4FmqmPV6wZ
 VVR7HyixEVlUSbDs3mziBkh0BI8HnDZGOrb5QCm0CuS2kc4HOOJOJKvLa
 Qul0PdQWVaCOWedsXPT16ygIItLT9sUEfaZr0CpLm/Il+1mO4wWhLse7u
 6WvDY65tG81isWIaqL/Xb8doKsauAsrl3RiE1kvHS3zpLBsO/ZRg58z5+
 Zj5JwK7OjM8ZNtFo7unMXtO/7oEQnDbKhHKEYVK6zCqE0irOq9jM28U1I
 7q6NQxbykBXtb9QU4V16C5RxBHFh5P7ZVsKK+odqEc3zM4VxxQzIaeBTf g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10323"; a="289368912"
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; d="scan'208";a="289368912"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2022 23:40:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; d="scan'208";a="658390984"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
 by fmsmga002.fm.intel.com with ESMTP; 20 Apr 2022 23:40:50 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nhQUj-0007xm-CN;
 Thu, 21 Apr 2022 06:40:49 +0000
Date: Thu, 21 Apr 2022 14:40:21 +0800
From: kernel test robot <lkp@intel.com>
To: Zhi Wang <zhi.a.wang@intel.com>
Subject: [intel-gvt:gvt-next-bak-without-chris-patches 1/5]
 drivers/gpu/drm/i915/gvt/handlers.c:75:6: error: no previous prototype for
 'intel_gvt_match_device'
Message-ID: <202204202233.2S88zDWj-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

tree:   https://github.com/intel/gvt-linux.git gvt-next-bak-without-chris-patches
head:   1f9dedeee16643ba20fffd43296978bc434218d2
commit: 8c7bb1f9b70a7b490776961767e69f9423280181 [1/5] i915/gvt: Separate the MMIO tracking table from GVT-g
config: x86_64-syzkaller (https://download.01.org/0day-ci/archive/20220420/202204202233.2S88zDWj-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0
reproduce (this is a W=1 build):
        # https://github.com/intel/gvt-linux/commit/8c7bb1f9b70a7b490776961767e69f9423280181
        git remote add intel-gvt https://github.com/intel/gvt-linux.git
        git fetch --no-tags intel-gvt gvt-next-bak-without-chris-patches
        git checkout 8c7bb1f9b70a7b490776961767e69f9423280181
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/gvt/handlers.c:75:6: error: no previous prototype for 'intel_gvt_match_device' [-Werror=missing-prototypes]
      75 | bool intel_gvt_match_device(struct intel_gvt *gvt,
         |      ^~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +/intel_gvt_match_device +75 drivers/gpu/drm/i915/gvt/handlers.c

12d14cc43b3470 Zhi Wang 2016-08-30  74  
12d14cc43b3470 Zhi Wang 2016-08-30 @75  bool intel_gvt_match_device(struct intel_gvt *gvt,
12d14cc43b3470 Zhi Wang 2016-08-30  76  		unsigned long device)
12d14cc43b3470 Zhi Wang 2016-08-30  77  {
12d14cc43b3470 Zhi Wang 2016-08-30  78  	return intel_gvt_get_device_type(gvt) & device;
12d14cc43b3470 Zhi Wang 2016-08-30  79  }
12d14cc43b3470 Zhi Wang 2016-08-30  80  

:::::: The code at line 75 was first introduced by commit
:::::: 12d14cc43b34706283246917329b2182163ba9aa drm/i915/gvt: Introduce a framework for tracking HW registers.

:::::: TO: Zhi Wang <zhi.a.wang@intel.com>
:::::: CC: Zhenyu Wang <zhenyuw@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
