Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F40A50351C
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 16 Apr 2022 10:15:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EA7410E05A;
	Sat, 16 Apr 2022 08:14:59 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 249E110E05A
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 16 Apr 2022 08:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650096898; x=1681632898;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=jxT27LaRFB+VIouMNBnne8LOHkM4l4qELkyspOGsRPc=;
 b=EjEbDJik8Mp4llrk/i+Ga2AhBlTcFCKU62RPMmTg6RabMFmqIo/Qzzqd
 bs+bStrPartSgAr3qtb9KEYaqEJBnuiggPjewiFcLt4YCgszl7QkIm02B
 dFtw090AlZf48enP0jeHcJKrt1kouOFFSsJytrIV0ev/P/y8QgMaIrOiY
 WT1fHmw0rcOT/ZhTGWiEYbHGgqj/LlUulId+ZfRT4t+nrIJMxDOZ/uvHF
 ar7IMcbjpa2qIW8qk3XzVdbEm/U66gYtOimCVHCrG/FZcR89IvZinJGAB
 89bfwLIrhAVDAoxxO2BBndfz6K8tVYD/AwK9NSSJo704U24y4TnHmIXW3 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10318"; a="260875344"
X-IronPort-AV: E=Sophos;i="5.90,264,1643702400"; d="scan'208";a="260875344"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2022 01:14:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,264,1643702400"; d="scan'208";a="613053503"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
 by fmsmga008.fm.intel.com with ESMTP; 16 Apr 2022 01:14:55 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nfda2-0002wL-TA;
 Sat, 16 Apr 2022 08:14:54 +0000
Date: Sat, 16 Apr 2022 16:14:09 +0800
From: kernel test robot <lkp@intel.com>
To: Zhi Wang <zhi.a.wang@intel.com>
Subject: [intel-gvt:topic/for-christoph 1/37]
 drivers/gpu/drm/i915/intel_gvt.h:69:5: error: no previous prototype for
 function 'intel_gvt_iterate_mmio_table'
Message-ID: <202204161634.p6DDJoeT-lkp@intel.com>
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
Cc: kbuild-all@lists.01.org, zhenyu.z.wang@intel.com, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, Zhenyu Wang <zhenyuw@linux.intel.com>,
 terrence.xu@intel.com, intel-gvt-dev@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

tree:   https://github.com/intel/gvt-linux.git topic/for-christoph
head:   fd6f410fe5eced449a4d6467a4f4789a8eb10382
commit: 07de96038f7d8a179287ae178dfcad8f085abb9e [1/37] i915/gvt: Separate the MMIO tracking table from GVT-g
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20220416/202204161634.p6DDJoeT-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 64c045e25b8471bbb572bd29159c294a82a86a25)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/gvt-linux/commit/07de96038f7d8a179287ae178dfcad8f085abb9e
        git remote add intel-gvt https://github.com/intel/gvt-linux.git
        git fetch --no-tags intel-gvt topic/for-christoph
        git checkout 07de96038f7d8a179287ae178dfcad8f085abb9e
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from <built-in>:4:
   In file included from drivers/gpu/drm/i915/gvt/gvt.h:39:
>> drivers/gpu/drm/i915/intel_gvt.h:69:5: error: no previous prototype for function 'intel_gvt_iterate_mmio_table' [-Werror,-Wmissing-prototypes]
   int intel_gvt_iterate_mmio_table(struct intel_gvt_mmio_table_iter *iter)
       ^
   drivers/gpu/drm/i915/intel_gvt.h:69:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int intel_gvt_iterate_mmio_table(struct intel_gvt_mmio_table_iter *iter)
   ^
   static 
   1 error generated.


vim +/intel_gvt_iterate_mmio_table +69 drivers/gpu/drm/i915/intel_gvt.h

    68	
  > 69	int intel_gvt_iterate_mmio_table(struct intel_gvt_mmio_table_iter *iter)
    70	{
    71		return 0;
    72	}
    73	#endif
    74	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
