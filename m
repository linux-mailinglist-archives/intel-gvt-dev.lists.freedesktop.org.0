Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3B6621D99
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  8 Nov 2022 21:25:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D768010E22A;
	Tue,  8 Nov 2022 20:25:05 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6605F10E22A
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  8 Nov 2022 20:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667939102; x=1699475102;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=wOrl4S85Zy0jil9X84ciFFiujoUBt77GnkdTvrL3968=;
 b=D+NEQoAzr1lgrrePUQ18hLVvY2KuJVywU0+c9xF0iyMYxzQP0ztWZOPE
 Up1j0tb9Ej33DynKRHzSmOropYBvrf+J74b4rkjHM8gQtBmDG1oCsCxf/
 4ylj3oNh6jeHjZvMSgFaDwigLR5S3TS4EgehcgBN9Oy7B+C/g/WiDEbPU
 yOYLkovJZozigG/gImpYsI4plOBu3YQI/Ppc00+EW37+9ffEUpttDl6BJ
 1saFGSa2f3+KQaEzvrrPkqAeXz7XsoBu6iGkfko5cMXbvHXq/ZlAflT2C
 Z4QAT6RmjLpnj5e80wkTEC5C3Zo0vFnWmuNNgO2EC7jTilv//qUj6smpL w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10525"; a="291187819"
X-IronPort-AV: E=Sophos;i="5.96,148,1665471600"; d="scan'208";a="291187819"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2022 12:25:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10525"; a="742102609"
X-IronPort-AV: E=Sophos;i="5.96,148,1665471600"; d="scan'208";a="742102609"
Received: from lkp-server01.sh.intel.com (HELO e783503266e8) ([10.239.97.150])
 by fmsmga002.fm.intel.com with ESMTP; 08 Nov 2022 12:25:00 -0800
Received: from kbuild by e783503266e8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1osV9X-0000aW-2Y;
 Tue, 08 Nov 2022 20:24:59 +0000
Date: Wed, 09 Nov 2022 04:24:31 +0800
From: kernel test robot <lkp@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: [intel-gvt:gvt-next] BUILD SUCCESS
 50468ca2e2e1ce882f060a8c263f678affe112db
Message-ID: <636abaff.t+mH5DqSE40LF5/5%lkp@intel.com>
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

tree/branch: https://github.com/intel/gvt-linux.git gvt-next
branch HEAD: 50468ca2e2e1ce882f060a8c263f678affe112db  drm/i915/gvt: Remove the unused function get_pt_type()

elapsed time: 727m

configs tested: 135
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                            allnoconfig
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
s390                                defconfig
s390                             allmodconfig
arc                                 defconfig
alpha                               defconfig
s390                             allyesconfig
i386                             allyesconfig
i386                                defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
ia64                             allmodconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
arm                      footbridge_defconfig
arm                           tegra_defconfig
sh                           sh2007_defconfig
arc                    vdk_hs38_smp_defconfig
sparc                            alldefconfig
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
i386                 randconfig-a001-20221107
i386                 randconfig-a006-20221107
i386                 randconfig-a003-20221107
i386                 randconfig-a002-20221107
i386                 randconfig-a005-20221107
i386                 randconfig-a004-20221107
powerpc                        warp_defconfig
microblaze                          defconfig
m68k                        stmark2_defconfig
powerpc                      pasemi_defconfig
x86_64               randconfig-a006-20221107
x86_64               randconfig-a001-20221107
x86_64               randconfig-a004-20221107
x86_64               randconfig-a003-20221107
x86_64               randconfig-a005-20221107
x86_64               randconfig-a002-20221107
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
arm                             pxa_defconfig
riscv                               defconfig
sh                            titan_defconfig
mips                  decstation_64_defconfig
powerpc                mpc7448_hpc2_defconfig
nios2                               defconfig
powerpc                         ps3_defconfig
arm                           viper_defconfig
openrisc                    or1ksim_defconfig
powerpc                      ppc40x_defconfig
alpha                            alldefconfig
mips                        vocore2_defconfig
sh                             sh03_defconfig
powerpc                     rainier_defconfig
arm                           sama5_defconfig
sh                     sh7710voipgw_defconfig
sh                          rsk7203_defconfig
powerpc                     asp8347_defconfig
nios2                            alldefconfig
powerpc                    sam440ep_defconfig
arm                             ezx_defconfig
sh                        edosk7705_defconfig
i386                          randconfig-c001
sh                           se7206_defconfig
ia64                         bigsur_defconfig
sh                          rsk7269_defconfig
arm                        shmobile_defconfig
arm                         at91_dt_defconfig
mips                      loongson3_defconfig
sh                  sh7785lcr_32bit_defconfig
powerpc                     sequoia_defconfig
powerpc                     mpc83xx_defconfig
powerpc                       holly_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
arm                             rpc_defconfig
arc                              alldefconfig
sparc                       sparc32_defconfig
arm                          exynos_defconfig
mips                          rb532_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
arm                        cerfcube_defconfig
arm                       aspeed_g5_defconfig
parisc                generic-32bit_defconfig
mips                           xway_defconfig
arm                        trizeps4_defconfig
arm                           sunxi_defconfig

clang tested configs:
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
hexagon              randconfig-r041-20221108
hexagon              randconfig-r045-20221108
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
x86_64                        randconfig-k001
powerpc                     tqm8560_defconfig
arm                           omap1_defconfig
mips                     cu1000-neo_defconfig
arm64                            allyesconfig
riscv                randconfig-r042-20221107
hexagon              randconfig-r041-20221107
hexagon              randconfig-r045-20221107
s390                 randconfig-r044-20221107

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
