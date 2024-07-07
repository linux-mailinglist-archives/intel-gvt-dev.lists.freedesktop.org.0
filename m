Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2679B929659
	for <lists+intel-gvt-dev@lfdr.de>; Sun,  7 Jul 2024 04:04:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9511D10E038;
	Sun,  7 Jul 2024 02:04:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PD83VPls";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A21110E038
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sun,  7 Jul 2024 02:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720317869; x=1751853869; h=date:from:cc:subject:message-id;
 bh=6sf4DhI4iQ3V3P1UkOq0kZVbnWaLlWWkEF9uBiRSA6E=;
 b=PD83VPls12tF54Ewm2+sDTYg159fduwUJLK5f5BgmkjTJ1g2zID6Q2WZ
 iZVl0bL0vGBfQYUEuhGGWGaV7vRQBJ0giIZ52Z9os2CV7Oookb4eNbwdx
 jsgOoiX3ycaWUch+RhNz3WsHucYRfm0ur+IKuM+BBRENE4eW1J36i94Us
 Jz2ksuzrLrSNTSy3iaRq+ML62XqgkAZub6kBalNuxHsBjtomys5s4+BBS
 Yx/9Ok49TkTKIdRh3n85N80Xq+rWtx5Z4GkneI/dbHu27on3Booxc50Vl
 L3UQEt0RdesQbATTAatq9CgNbRRsuHMBHiild1u7cHhzXaVqjJeQou2Tq g==;
X-CSE-ConnectionGUID: AXjlaItPSLuEtxPP1TGbmg==
X-CSE-MsgGUID: JnME0QzuSZmoUWEl/8BQsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11125"; a="17267197"
X-IronPort-AV: E=Sophos;i="6.09,189,1716274800"; d="scan'208";a="17267197"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2024 19:04:29 -0700
X-CSE-ConnectionGUID: aF9biroyTwSJ6gD7p6oI3w==
X-CSE-MsgGUID: 1uoR9wa6REeYsPw+fZa1+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,189,1716274800"; d="scan'208";a="47117471"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
 by orviesa010.jf.intel.com with ESMTP; 06 Jul 2024 19:04:28 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sQHGK-000UV3-2c;
 Sun, 07 Jul 2024 02:04:24 +0000
Date: Sun, 07 Jul 2024 10:04:03 +0800
From: kernel test robot <lkp@intel.com>
Cc: zhenyu.z.wang@intel.com, terrence.xu@intel.com,
 intel-gvt-dev@lists.freedesktop.org
Subject: [intel-gvt:dependabot/pip/drivers/gpu/drm/ci/xfails/certifi-2024.7.4] BUILD
 SUCCESS 52118336c564f693baa8f9c0a20a7b318a89fa02
Message-ID: <202407071000.hhIXTwYf-lkp@intel.com>
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

tree/branch: https://github.com/intel/gvt-linux.git dependabot/pip/drivers/gpu/drm/ci/xfails/certifi-2024.7.4
branch HEAD: 52118336c564f693baa8f9c0a20a7b318a89fa02  build(deps): bump certifi in /drivers/gpu/drm/ci/xfails

elapsed time: 1443m

configs tested: 324
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.2.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                      axs103_smp_defconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                     haps_hs_smp_defconfig   gcc-13.2.0
arc                        nsim_700_defconfig   gcc-13.2.0
arc                 nsimosci_hs_smp_defconfig   gcc-13.2.0
arc                   randconfig-001-20240706   gcc-13.2.0
arc                   randconfig-001-20240707   gcc-13.2.0
arc                   randconfig-002-20240706   gcc-13.2.0
arc                   randconfig-002-20240707   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   clang-19
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                         bcm2835_defconfig   gcc-13.2.0
arm                                 defconfig   gcc-13.2.0
arm                            dove_defconfig   gcc-13.2.0
arm                          ep93xx_defconfig   clang-14
arm                            hisi_defconfig   gcc-13.2.0
arm                       imx_v4_v5_defconfig   gcc-13.2.0
arm                      integrator_defconfig   gcc-13.2.0
arm                        keystone_defconfig   gcc-13.2.0
arm                         lpc32xx_defconfig   clang-14
arm                       multi_v4t_defconfig   gcc-13.2.0
arm                        multi_v5_defconfig   clang-14
arm                        mvebu_v7_defconfig   gcc-13.2.0
arm                       netwinder_defconfig   gcc-13.2.0
arm                   randconfig-001-20240706   gcc-13.2.0
arm                   randconfig-001-20240707   gcc-13.2.0
arm                   randconfig-002-20240706   gcc-13.2.0
arm                   randconfig-002-20240707   gcc-13.2.0
arm                   randconfig-003-20240706   gcc-13.2.0
arm                   randconfig-003-20240707   gcc-13.2.0
arm                   randconfig-004-20240706   gcc-13.2.0
arm                   randconfig-004-20240707   gcc-13.2.0
arm                         socfpga_defconfig   gcc-13.2.0
arm                          sp7021_defconfig   gcc-13.2.0
arm                        spear3xx_defconfig   clang-14
arm                           tegra_defconfig   clang-14
arm                           tegra_defconfig   gcc-13.2.0
arm64                            allmodconfig   clang-19
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240706   gcc-13.2.0
arm64                 randconfig-001-20240707   gcc-13.2.0
arm64                 randconfig-002-20240706   gcc-13.2.0
arm64                 randconfig-002-20240707   gcc-13.2.0
arm64                 randconfig-003-20240706   clang-16
arm64                 randconfig-003-20240706   gcc-13.2.0
arm64                 randconfig-003-20240707   gcc-13.2.0
arm64                 randconfig-004-20240706   clang-19
arm64                 randconfig-004-20240706   gcc-13.2.0
arm64                 randconfig-004-20240707   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240706   gcc-13.2.0
csky                  randconfig-001-20240707   gcc-13.2.0
csky                  randconfig-002-20240706   gcc-13.2.0
csky                  randconfig-002-20240707   gcc-13.2.0
hexagon                          allmodconfig   clang-19
hexagon                           allnoconfig   clang-19
hexagon                          allyesconfig   clang-19
hexagon               randconfig-001-20240706   clang-19
hexagon               randconfig-002-20240706   clang-15
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-13
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-13
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-13
i386         buildonly-randconfig-001-20240706   clang-18
i386         buildonly-randconfig-001-20240707   gcc-13
i386         buildonly-randconfig-002-20240706   clang-18
i386         buildonly-randconfig-002-20240706   gcc-13
i386         buildonly-randconfig-002-20240707   gcc-13
i386         buildonly-randconfig-003-20240706   clang-18
i386         buildonly-randconfig-003-20240707   gcc-13
i386         buildonly-randconfig-004-20240706   clang-18
i386         buildonly-randconfig-004-20240706   gcc-13
i386         buildonly-randconfig-004-20240707   gcc-13
i386         buildonly-randconfig-005-20240706   clang-18
i386         buildonly-randconfig-005-20240706   gcc-10
i386         buildonly-randconfig-005-20240707   gcc-13
i386         buildonly-randconfig-006-20240706   clang-18
i386         buildonly-randconfig-006-20240707   gcc-13
i386                                defconfig   clang-18
i386                  randconfig-001-20240706   clang-18
i386                  randconfig-001-20240706   gcc-13
i386                  randconfig-001-20240707   gcc-13
i386                  randconfig-002-20240706   clang-18
i386                  randconfig-002-20240707   gcc-13
i386                  randconfig-003-20240706   clang-18
i386                  randconfig-003-20240706   gcc-13
i386                  randconfig-003-20240707   gcc-13
i386                  randconfig-004-20240706   clang-18
i386                  randconfig-004-20240707   gcc-13
i386                  randconfig-005-20240706   clang-18
i386                  randconfig-005-20240707   gcc-13
i386                  randconfig-006-20240706   clang-18
i386                  randconfig-006-20240706   gcc-12
i386                  randconfig-006-20240707   gcc-13
i386                  randconfig-011-20240706   clang-18
i386                  randconfig-011-20240706   gcc-11
i386                  randconfig-011-20240707   gcc-13
i386                  randconfig-012-20240706   clang-18
i386                  randconfig-012-20240707   gcc-13
i386                  randconfig-013-20240706   clang-18
i386                  randconfig-013-20240707   gcc-13
i386                  randconfig-014-20240706   clang-18
i386                  randconfig-014-20240707   gcc-13
i386                  randconfig-015-20240706   clang-18
i386                  randconfig-015-20240706   gcc-7
i386                  randconfig-015-20240707   gcc-13
i386                  randconfig-016-20240706   clang-18
i386                  randconfig-016-20240706   gcc-13
i386                  randconfig-016-20240707   gcc-13
loongarch                        allmodconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240706   gcc-13.2.0
loongarch             randconfig-001-20240707   gcc-13.2.0
loongarch             randconfig-002-20240706   gcc-13.2.0
loongarch             randconfig-002-20240707   gcc-13.2.0
m68k                             allmodconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-13.2.0
m68k                                defconfig   gcc-13.2.0
m68k                       m5275evb_defconfig   gcc-13.2.0
m68k                        stmark2_defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-13.2.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                          ath25_defconfig   gcc-13.2.0
mips                     cu1830-neo_defconfig   gcc-13.2.0
mips                  decstation_64_defconfig   gcc-13.2.0
mips                      fuloong2e_defconfig   gcc-13.2.0
mips                            gpr_defconfig   gcc-13.2.0
mips                           ip27_defconfig   gcc-13.2.0
mips                           ip28_defconfig   gcc-13.2.0
mips                           jazz_defconfig   gcc-13.2.0
mips                      loongson3_defconfig   gcc-13.2.0
mips                          rb532_defconfig   clang-14
nios2                            allmodconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                            allyesconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240706   gcc-13.2.0
nios2                 randconfig-001-20240707   gcc-13.2.0
nios2                 randconfig-002-20240706   gcc-13.2.0
nios2                 randconfig-002-20240707   gcc-13.2.0
openrisc                         alldefconfig   gcc-13.2.0
openrisc                         allmodconfig   gcc-13.2.0
openrisc                          allnoconfig   gcc-13.2.0
openrisc                         allyesconfig   gcc-13.2.0
openrisc                            defconfig   gcc-13.2.0
openrisc                    or1ksim_defconfig   gcc-13.2.0
parisc                           allmodconfig   gcc-13.2.0
parisc                            allnoconfig   gcc-13.2.0
parisc                           allyesconfig   gcc-13.2.0
parisc                              defconfig   gcc-13.2.0
parisc                generic-64bit_defconfig   gcc-13.2.0
parisc                randconfig-001-20240706   gcc-13.2.0
parisc                randconfig-001-20240707   gcc-13.2.0
parisc                randconfig-002-20240706   gcc-13.2.0
parisc                randconfig-002-20240707   gcc-13.2.0
parisc64                         alldefconfig   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                     akebono_defconfig   clang-14
powerpc                     akebono_defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-13.2.0
powerpc                           allnoconfig   gcc-13.2.0
powerpc                          allyesconfig   clang-19
powerpc                          allyesconfig   gcc-13.2.0
powerpc                     asp8347_defconfig   gcc-13.2.0
powerpc                      bamboo_defconfig   gcc-13.2.0
powerpc                 canyonlands_defconfig   clang-14
powerpc                        fsp2_defconfig   gcc-13.2.0
powerpc                    ge_imp3a_defconfig   gcc-13.2.0
powerpc                      mgcoge_defconfig   gcc-13.2.0
powerpc                     mpc512x_defconfig   gcc-13.2.0
powerpc                 mpc8315_rdb_defconfig   gcc-13.2.0
powerpc                    mvme5100_defconfig   gcc-13.2.0
powerpc                      pasemi_defconfig   gcc-13.2.0
powerpc                      pmac32_defconfig   clang-14
powerpc               randconfig-001-20240706   gcc-13.2.0
powerpc               randconfig-001-20240707   gcc-13.2.0
powerpc               randconfig-002-20240706   gcc-13.2.0
powerpc               randconfig-002-20240707   gcc-13.2.0
powerpc               randconfig-003-20240706   clang-19
powerpc               randconfig-003-20240706   gcc-13.2.0
powerpc               randconfig-003-20240707   gcc-13.2.0
powerpc                     tqm8541_defconfig   gcc-13.2.0
powerpc                         wii_defconfig   clang-14
powerpc64             randconfig-001-20240706   gcc-13.2.0
powerpc64             randconfig-001-20240707   gcc-13.2.0
powerpc64             randconfig-002-20240706   gcc-13.2.0
powerpc64             randconfig-002-20240707   gcc-13.2.0
powerpc64             randconfig-003-20240706   clang-19
powerpc64             randconfig-003-20240706   gcc-13.2.0
powerpc64             randconfig-003-20240707   gcc-13.2.0
riscv                            alldefconfig   clang-14
riscv                            allmodconfig   clang-19
riscv                            allmodconfig   gcc-13.2.0
riscv                             allnoconfig   gcc-13.2.0
riscv                            allyesconfig   clang-19
riscv                            allyesconfig   gcc-13.2.0
riscv                               defconfig   gcc-13.2.0
riscv             nommu_k210_sdcard_defconfig   clang-14
riscv                 randconfig-001-20240706   gcc-13.2.0
riscv                 randconfig-001-20240707   gcc-13.2.0
riscv                 randconfig-002-20240706   gcc-13.2.0
riscv                 randconfig-002-20240707   gcc-13.2.0
s390                             allmodconfig   clang-19
s390                              allnoconfig   clang-19
s390                             allyesconfig   clang-19
s390                             allyesconfig   gcc-13.2.0
s390                                defconfig   gcc-13.2.0
s390                  randconfig-001-20240706   gcc-13.2.0
s390                  randconfig-001-20240707   gcc-13.2.0
s390                  randconfig-002-20240706   clang-19
s390                  randconfig-002-20240706   gcc-13.2.0
s390                  randconfig-002-20240707   gcc-13.2.0
sh                               alldefconfig   gcc-13.2.0
sh                               allmodconfig   gcc-13.2.0
sh                                allnoconfig   gcc-13.2.0
sh                               allyesconfig   gcc-13.2.0
sh                                  defconfig   gcc-13.2.0
sh                         ecovec24_defconfig   gcc-13.2.0
sh                        edosk7705_defconfig   gcc-13.2.0
sh                     magicpanelr2_defconfig   gcc-13.2.0
sh                    randconfig-001-20240706   gcc-13.2.0
sh                    randconfig-001-20240707   gcc-13.2.0
sh                    randconfig-002-20240706   gcc-13.2.0
sh                    randconfig-002-20240707   gcc-13.2.0
sh                          rsk7264_defconfig   gcc-13.2.0
sh                           se7343_defconfig   gcc-13.2.0
sh                           se7619_defconfig   gcc-13.2.0
sh                           se7705_defconfig   gcc-13.2.0
sh                           se7724_defconfig   gcc-13.2.0
sh                           se7751_defconfig   gcc-13.2.0
sh                           sh2007_defconfig   gcc-13.2.0
sh                     sh7710voipgw_defconfig   gcc-13.2.0
sh                        sh7757lcr_defconfig   gcc-13.2.0
sh                        sh7785lcr_defconfig   gcc-13.2.0
sparc                            allmodconfig   gcc-13.2.0
sparc                            allyesconfig   gcc-13.2.0
sparc64                          allmodconfig   gcc-13.2.0
sparc64                          allyesconfig   gcc-13.2.0
sparc64                             defconfig   gcc-13.2.0
sparc64               randconfig-001-20240706   gcc-13.2.0
sparc64               randconfig-001-20240707   gcc-13.2.0
sparc64               randconfig-002-20240706   gcc-13.2.0
sparc64               randconfig-002-20240707   gcc-13.2.0
um                               allmodconfig   clang-19
um                               allmodconfig   gcc-13.2.0
um                                allnoconfig   clang-17
um                               allyesconfig   gcc-13
um                               allyesconfig   gcc-13.2.0
um                                  defconfig   gcc-13.2.0
um                             i386_defconfig   gcc-13.2.0
um                    randconfig-001-20240706   clang-19
um                    randconfig-001-20240706   gcc-13.2.0
um                    randconfig-001-20240707   gcc-13.2.0
um                    randconfig-002-20240706   gcc-13
um                    randconfig-002-20240706   gcc-13.2.0
um                    randconfig-002-20240707   gcc-13.2.0
um                           x86_64_defconfig   gcc-13.2.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240706   clang-18
x86_64       buildonly-randconfig-002-20240706   clang-18
x86_64       buildonly-randconfig-003-20240706   clang-18
x86_64       buildonly-randconfig-004-20240706   clang-18
x86_64       buildonly-randconfig-005-20240706   clang-18
x86_64       buildonly-randconfig-005-20240706   gcc-13
x86_64       buildonly-randconfig-006-20240706   clang-18
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-13
x86_64                randconfig-001-20240706   clang-18
x86_64                randconfig-001-20240706   gcc-9
x86_64                randconfig-002-20240706   clang-18
x86_64                randconfig-003-20240706   clang-18
x86_64                randconfig-004-20240706   clang-18
x86_64                randconfig-005-20240706   clang-18
x86_64                randconfig-006-20240706   clang-18
x86_64                randconfig-011-20240706   clang-18
x86_64                randconfig-011-20240706   gcc-12
x86_64                randconfig-012-20240706   clang-18
x86_64                randconfig-012-20240706   gcc-12
x86_64                randconfig-013-20240706   clang-18
x86_64                randconfig-014-20240706   clang-18
x86_64                randconfig-014-20240706   gcc-13
x86_64                randconfig-015-20240706   clang-18
x86_64                randconfig-015-20240706   gcc-13
x86_64                randconfig-016-20240706   clang-18
x86_64                randconfig-016-20240706   gcc-13
x86_64                randconfig-071-20240706   clang-18
x86_64                randconfig-071-20240706   gcc-12
x86_64                randconfig-072-20240706   clang-18
x86_64                randconfig-072-20240706   gcc-13
x86_64                randconfig-073-20240706   clang-18
x86_64                randconfig-073-20240706   gcc-12
x86_64                randconfig-074-20240706   clang-18
x86_64                randconfig-074-20240706   gcc-13
x86_64                randconfig-075-20240706   clang-18
x86_64                randconfig-076-20240706   clang-18
x86_64                randconfig-076-20240706   gcc-13
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                           allyesconfig   gcc-13.2.0
xtensa                  audio_kc705_defconfig   gcc-13.2.0
xtensa                  nommu_kc705_defconfig   gcc-13.2.0
xtensa                randconfig-001-20240706   gcc-13.2.0
xtensa                randconfig-001-20240707   gcc-13.2.0
xtensa                randconfig-002-20240706   gcc-13.2.0
xtensa                randconfig-002-20240707   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
