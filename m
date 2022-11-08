Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D08621D9A
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  8 Nov 2022 21:25:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A50910E255;
	Tue,  8 Nov 2022 20:25:06 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A18810E22A
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  8 Nov 2022 20:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667939103; x=1699475103;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=xAqSKi6FzwuHTHsWpBV7jE4EN52MMH0Xv66fN9sI0Cc=;
 b=TXxfbSd88IqfLUKwXoyi+Bka7Pkuy1B2UIUFrKJp6ZTPHJF6ZYG6OQ6D
 3GlVkIRh2hzefu7LZ/BXO6r7nidLY0o58+oFJKBe2+Wl5vsXNz6R6kCTt
 wGZdiZWj6xV4RCIcUnIre7vw1syBbowsCnyK0xcivRnSg82zB3lYZSdm8
 WfFvqOwe3Z+LDI75/cr7nKuwGdzEd03jtv/zFD3dtIUbaP0++ZCTrGuHX
 QqtY3Ggx86oXkMAiEIs9mcwg2xfzeevirZiViapLf5GbMly2xJhIlIqcF
 4d8TGGPaFKlup6irUfOhSnfX03+XyJeU7KtXq3oIJCL5jm2571/ru4+3C g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10525"; a="294171489"
X-IronPort-AV: E=Sophos;i="5.96,148,1665471600"; d="scan'208";a="294171489"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2022 12:25:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10525"; a="638924632"
X-IronPort-AV: E=Sophos;i="5.96,148,1665471600"; d="scan'208";a="638924632"
Received: from lkp-server01.sh.intel.com (HELO e783503266e8) ([10.239.97.150])
 by fmsmga007.fm.intel.com with ESMTP; 08 Nov 2022 12:25:01 -0800
Received: from kbuild by e783503266e8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1osV9X-0000aa-2c;
 Tue, 08 Nov 2022 20:24:59 +0000
Date: Wed, 09 Nov 2022 04:24:13 +0800
From: kernel test robot <lkp@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: [intel-gvt:gvt-staging] BUILD SUCCESS
 324971be7b4b2a3f3fce854d8cdc6c726e65765f
Message-ID: <636abaed.pvnXyjGg3oFNzeMd%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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
Cc: terrence.xu@intel.com, intel-gvt-dev@lists.freedesktop.org,
 zhenyu.z.wang@intel.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

tree/branch: https://github.com/intel/gvt-linux.git gvt-staging
branch HEAD: 324971be7b4b2a3f3fce854d8cdc6c726e65765f  gvt-staging: 2022y-11m-08d-15h-42m-45s CST integration manifest

elapsed time: 726m

configs tested: 76
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                            allnoconfig
um                           x86_64_defconfig
um                             i386_defconfig
i386                             allyesconfig
i386                                defconfig
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
ia64                             allmodconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
arc                                 defconfig
alpha                               defconfig
s390                             allyesconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
arm                             pxa_defconfig
riscv                               defconfig
sh                            titan_defconfig
mips                  decstation_64_defconfig
powerpc                mpc7448_hpc2_defconfig
nios2                               defconfig
s390                             allmodconfig
sh                          rsk7203_defconfig
powerpc                     asp8347_defconfig
nios2                            alldefconfig
s390                                defconfig
powerpc                    sam440ep_defconfig
arm                             ezx_defconfig
sh                        edosk7705_defconfig
i386                          randconfig-c001
arm                             rpc_defconfig
i386                 randconfig-a001-20221107
i386                 randconfig-a006-20221107
i386                 randconfig-a003-20221107
i386                 randconfig-a002-20221107
i386                 randconfig-a005-20221107
i386                 randconfig-a004-20221107
arm                        cerfcube_defconfig
arm                       aspeed_g5_defconfig
parisc                generic-32bit_defconfig
mips                           xway_defconfig
mips                          rb532_defconfig
sparc                       sparc32_defconfig
csky                             alldefconfig
sh                           se7712_defconfig

clang tested configs:
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-k001
powerpc                     tqm8560_defconfig
arm                           omap1_defconfig
mips                     cu1000-neo_defconfig
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
hexagon              randconfig-r041-20221108
hexagon              randconfig-r045-20221108

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
