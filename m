Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E94B184AD20
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  6 Feb 2024 04:51:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B733411289A;
	Tue,  6 Feb 2024 03:51:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ptka5l3k";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EA4811289A
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  6 Feb 2024 03:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707191513; x=1738727513;
 h=date:from:to:cc:subject:message-id;
 bh=27FPoo3GfMrkSszA8M9j3iC8Qcd66Al0oRiryZs8fLA=;
 b=Ptka5l3k6/ea1IfqDb9LzgDT2BVrPbO7PD4D/+CcLqTWOGWK7hxt3+l+
 SE1EPDtwsReE8aqkrGi7tKtul+Vk/qyBVQFHbSPMU9IAEAdXKKe5bP59d
 0n7yOm3Qpdek5Zxoluy7SoyFXvycHx+JwtMRzNX3DzHkdzbiXMKBqRIK4
 +Zj2yZfrOyliY9YpWlE9CbIQCzLQU46lkhcquIqE/yrXncDy0g4p8TQG7
 Iwof/wuBbd0v9fHNIZrLDJrQlxL4xwIuzndPXkza/B4MRDq1E/jziad6P
 0tJB3VgfrnwuDtfISi/pNclk3Mb8lZ9dqw8CdPtyJOR76bRSz4R6T44RM w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="11744214"
X-IronPort-AV: E=Sophos;i="6.05,246,1701158400"; d="scan'208";a="11744214"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 19:51:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,246,1701158400"; 
   d="scan'208";a="955147"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
 by fmviesa007.fm.intel.com with ESMTP; 05 Feb 2024 19:51:50 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rXCUu-00013m-05;
 Tue, 06 Feb 2024 03:51:48 +0000
Date: Tue, 06 Feb 2024 11:51:05 +0800
From: kernel test robot <lkp@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: zhenyu.z.wang@intel.com, terrence.xu@intel.com,
 intel-gvt-dev@lists.freedesktop.org
Subject: [intel-gvt:gvt-fixes] BUILD SUCCESS
 44e4192f88978e32e4ac08b27141f3767366f79b
Message-ID: <202402061101.WtoYr70H-lkp@intel.com>
User-Agent: s-nail v14.9.24
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

tree/branch: https://github.com/intel/gvt-linux.git gvt-fixes
branch HEAD: 44e4192f88978e32e4ac08b27141f3767366f79b  MAINTAINERS: Update Zhi Wang's email address

elapsed time: 1462m

configs tested: 285
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                          axs103_defconfig   gcc  
arc                      axs103_smp_defconfig   gcc  
arc                                 defconfig   gcc  
arc                     haps_hs_smp_defconfig   gcc  
arc                   randconfig-001-20240205   gcc  
arc                   randconfig-001-20240206   gcc  
arc                   randconfig-002-20240205   gcc  
arc                   randconfig-002-20240206   gcc  
arc                           tb10x_defconfig   gcc  
arc                        vdk_hs38_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                         at91_dt_defconfig   clang
arm                         axm55xx_defconfig   clang
arm                          collie_defconfig   gcc  
arm                                 defconfig   clang
arm                            mmp2_defconfig   gcc  
arm                          moxart_defconfig   gcc  
arm                         mv78xx0_defconfig   clang
arm                        mvebu_v5_defconfig   gcc  
arm                        neponset_defconfig   gcc  
arm                   randconfig-001-20240205   clang
arm                   randconfig-002-20240205   gcc  
arm                   randconfig-002-20240206   gcc  
arm                   randconfig-003-20240205   clang
arm                   randconfig-003-20240206   gcc  
arm                   randconfig-004-20240205   clang
arm                             rpc_defconfig   clang
arm                           tegra_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240205   gcc  
arm64                 randconfig-001-20240206   gcc  
arm64                 randconfig-002-20240205   gcc  
arm64                 randconfig-003-20240205   gcc  
arm64                 randconfig-003-20240206   gcc  
arm64                 randconfig-004-20240205   gcc  
arm64                 randconfig-004-20240206   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240205   gcc  
csky                  randconfig-001-20240206   gcc  
csky                  randconfig-002-20240205   gcc  
csky                  randconfig-002-20240206   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240205   clang
hexagon               randconfig-002-20240205   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240205   clang
i386         buildonly-randconfig-002-20240205   clang
i386         buildonly-randconfig-003-20240205   clang
i386         buildonly-randconfig-003-20240206   gcc  
i386         buildonly-randconfig-004-20240205   clang
i386         buildonly-randconfig-005-20240205   clang
i386         buildonly-randconfig-005-20240206   gcc  
i386         buildonly-randconfig-006-20240205   clang
i386         buildonly-randconfig-006-20240206   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240205   clang
i386                  randconfig-002-20240205   clang
i386                  randconfig-003-20240205   clang
i386                  randconfig-004-20240205   gcc  
i386                  randconfig-005-20240205   clang
i386                  randconfig-006-20240205   gcc  
i386                  randconfig-011-20240205   gcc  
i386                  randconfig-012-20240205   clang
i386                  randconfig-012-20240206   gcc  
i386                  randconfig-013-20240205   gcc  
i386                  randconfig-014-20240205   gcc  
i386                  randconfig-014-20240206   gcc  
i386                  randconfig-015-20240205   clang
i386                  randconfig-015-20240206   gcc  
i386                  randconfig-016-20240205   gcc  
i386                  randconfig-016-20240206   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240205   gcc  
loongarch             randconfig-001-20240206   gcc  
loongarch             randconfig-002-20240205   gcc  
loongarch             randconfig-002-20240206   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                          amiga_defconfig   gcc  
m68k                          atari_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5249evb_defconfig   gcc  
m68k                            mac_defconfig   gcc  
m68k                        mvme147_defconfig   gcc  
m68k                        mvme16x_defconfig   gcc  
m68k                            q40_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                       bmips_be_defconfig   gcc  
mips                      loongson3_defconfig   gcc  
mips                          malta_defconfig   gcc  
mips                malta_qemu_32r6_defconfig   gcc  
mips                      maltasmvp_defconfig   gcc  
mips                    maltaup_xpa_defconfig   gcc  
mips                           rs90_defconfig   gcc  
nios2                         3c120_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240205   gcc  
nios2                 randconfig-001-20240206   gcc  
nios2                 randconfig-002-20240205   gcc  
nios2                 randconfig-002-20240206   gcc  
openrisc                         alldefconfig   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-32bit_defconfig   gcc  
parisc                randconfig-001-20240205   gcc  
parisc                randconfig-001-20240206   gcc  
parisc                randconfig-002-20240205   gcc  
parisc                randconfig-002-20240206   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                        fsp2_defconfig   gcc  
powerpc                    ge_imp3a_defconfig   gcc  
powerpc                        icon_defconfig   gcc  
powerpc                  iss476-smp_defconfig   gcc  
powerpc                   microwatt_defconfig   gcc  
powerpc                     powernv_defconfig   gcc  
powerpc                     ppa8548_defconfig   gcc  
powerpc                      ppc64e_defconfig   gcc  
powerpc               randconfig-001-20240205   clang
powerpc               randconfig-002-20240205   clang
powerpc               randconfig-002-20240206   gcc  
powerpc               randconfig-003-20240205   gcc  
powerpc                    sam440ep_defconfig   gcc  
powerpc                     sequoia_defconfig   clang
powerpc                    socrates_defconfig   gcc  
powerpc                  storcenter_defconfig   gcc  
powerpc                      walnut_defconfig   gcc  
powerpc                         wii_defconfig   gcc  
powerpc64             randconfig-001-20240205   clang
powerpc64             randconfig-001-20240206   gcc  
powerpc64             randconfig-002-20240205   clang
powerpc64             randconfig-003-20240205   clang
powerpc64             randconfig-003-20240206   gcc  
riscv                            alldefconfig   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240205   clang
riscv                 randconfig-001-20240206   gcc  
riscv                 randconfig-002-20240205   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240205   clang
s390                  randconfig-002-20240205   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                        dreamcast_defconfig   gcc  
sh                         ecovec24_defconfig   gcc  
sh                 kfr2r09-romimage_defconfig   gcc  
sh                          kfr2r09_defconfig   gcc  
sh                          landisk_defconfig   gcc  
sh                          polaris_defconfig   gcc  
sh                    randconfig-001-20240205   gcc  
sh                    randconfig-001-20240206   gcc  
sh                    randconfig-002-20240205   gcc  
sh                    randconfig-002-20240206   gcc  
sh                          rsk7201_defconfig   gcc  
sh                          rsk7264_defconfig   gcc  
sh                          sdk7780_defconfig   gcc  
sh                           se7206_defconfig   gcc  
sh                           se7705_defconfig   gcc  
sh                           se7722_defconfig   gcc  
sh                           sh2007_defconfig   gcc  
sh                     sh7710voipgw_defconfig   gcc  
sh                        sh7757lcr_defconfig   gcc  
sh                   sh7770_generic_defconfig   gcc  
sh                          urquell_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240205   gcc  
sparc64               randconfig-001-20240206   gcc  
sparc64               randconfig-002-20240205   gcc  
sparc64               randconfig-002-20240206   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                    randconfig-001-20240205   clang
um                    randconfig-002-20240205   gcc  
um                    randconfig-002-20240206   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240205   clang
x86_64       buildonly-randconfig-001-20240206   gcc  
x86_64       buildonly-randconfig-002-20240205   clang
x86_64       buildonly-randconfig-003-20240205   gcc  
x86_64       buildonly-randconfig-003-20240206   gcc  
x86_64       buildonly-randconfig-004-20240205   gcc  
x86_64       buildonly-randconfig-004-20240206   gcc  
x86_64       buildonly-randconfig-005-20240205   gcc  
x86_64       buildonly-randconfig-005-20240206   gcc  
x86_64       buildonly-randconfig-006-20240205   gcc  
x86_64       buildonly-randconfig-006-20240206   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240205   gcc  
x86_64                randconfig-002-20240205   gcc  
x86_64                randconfig-003-20240205   clang
x86_64                randconfig-003-20240206   gcc  
x86_64                randconfig-004-20240205   gcc  
x86_64                randconfig-004-20240206   gcc  
x86_64                randconfig-005-20240205   gcc  
x86_64                randconfig-005-20240206   gcc  
x86_64                randconfig-006-20240205   gcc  
x86_64                randconfig-011-20240205   gcc  
x86_64                randconfig-011-20240206   gcc  
x86_64                randconfig-012-20240205   gcc  
x86_64                randconfig-013-20240205   clang
x86_64                randconfig-013-20240206   gcc  
x86_64                randconfig-014-20240205   clang
x86_64                randconfig-015-20240205   gcc  
x86_64                randconfig-015-20240206   gcc  
x86_64                randconfig-016-20240205   clang
x86_64                randconfig-071-20240205   clang
x86_64                randconfig-071-20240206   gcc  
x86_64                randconfig-072-20240205   gcc  
x86_64                randconfig-072-20240206   gcc  
x86_64                randconfig-073-20240205   clang
x86_64                randconfig-073-20240206   gcc  
x86_64                randconfig-074-20240205   clang
x86_64                randconfig-074-20240206   gcc  
x86_64                randconfig-075-20240205   gcc  
x86_64                randconfig-076-20240205   clang
x86_64                randconfig-076-20240206   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                           alldefconfig   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                  audio_kc705_defconfig   gcc  
xtensa                  cadence_csp_defconfig   gcc  
xtensa                randconfig-001-20240205   gcc  
xtensa                randconfig-001-20240206   gcc  
xtensa                randconfig-002-20240205   gcc  
xtensa                randconfig-002-20240206   gcc  
xtensa                         virt_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
