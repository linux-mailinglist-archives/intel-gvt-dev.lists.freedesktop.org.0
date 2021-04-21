Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1439367539
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 22 Apr 2021 00:39:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EB1C6EA0F;
	Wed, 21 Apr 2021 22:39:16 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 251546EA0F
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 21 Apr 2021 22:39:16 +0000 (UTC)
IronPort-SDR: B0d2G4Yw2BzcBdu3t9AH7z3CXD7Yg+J21RCM0smjGCPfZeHJAqBDBOrg8h7Omgh9e13GhCfdjK
 sAZnYksFi9eA==
X-IronPort-AV: E=McAfee;i="6200,9189,9961"; a="182922923"
X-IronPort-AV: E=Sophos;i="5.82,241,1613462400"; d="scan'208";a="182922923"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2021 15:39:15 -0700
IronPort-SDR: c8x45SW37wNEimCrzgrszpHJVtdWvgxFvQ+W+xvnkgqM+Nrr5WkEtASLw5KEYc8cE5G/R7cEUN
 VLu8xmQoI/Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,241,1613462400"; d="scan'208";a="391612971"
Received: from lkp-server01.sh.intel.com (HELO a48ff7ddd223) ([10.239.97.150])
 by fmsmga007.fm.intel.com with ESMTP; 21 Apr 2021 15:39:13 -0700
Received: from kbuild by a48ff7ddd223 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lZLV2-0003ni-Md; Wed, 21 Apr 2021 22:39:12 +0000
Date: Thu, 22 Apr 2021 06:38:37 +0800
From: kernel test robot <lkp@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: [intel-gvt-linux:gvt-next-fixes] BUILD SUCCESS
 0349ec19c484ed40dbc725820673df4d94334e8c
Message-ID: <6080a96d.c43/w98bHb52t5gp%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

tree/branch: https://github.com/intel/gvt-linux.git gvt-next-fixes
branch HEAD: 0349ec19c484ed40dbc725820673df4d94334e8c  drm/i915/gvt: Remove duplicated register accessible check

elapsed time: 721m

configs tested: 176
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
x86_64                           allyesconfig
riscv                            allmodconfig
i386                             allyesconfig
riscv                            allyesconfig
powerpc                  storcenter_defconfig
mips                    maltaup_xpa_defconfig
arm                           h5000_defconfig
sh                   rts7751r2dplus_defconfig
arm                            lart_defconfig
mips                malta_qemu_32r6_defconfig
mips                          malta_defconfig
sh                             shx3_defconfig
um                                  defconfig
powerpc                      ppc44x_defconfig
arm                      tct_hammer_defconfig
sh                           se7724_defconfig
mips                      pic32mzda_defconfig
arm64                            alldefconfig
arm                           tegra_defconfig
ia64                            zx1_defconfig
powerpc                    sam440ep_defconfig
arm                       aspeed_g4_defconfig
powerpc                       maple_defconfig
sh                        sh7763rdp_defconfig
arm                              alldefconfig
arm                       omap2plus_defconfig
mips                           rs90_defconfig
arm                      integrator_defconfig
s390                       zfcpdump_defconfig
m68k                        m5307c3_defconfig
arm                          badge4_defconfig
m68k                           sun3_defconfig
mips                           ip22_defconfig
mips                        qi_lb60_defconfig
arm                      pxa255-idp_defconfig
powerpc                      pmac32_defconfig
arm                          simpad_defconfig
sh                           se7721_defconfig
mips                  cavium_octeon_defconfig
sh                   secureedge5410_defconfig
powerpc                       eiger_defconfig
mips                       bmips_be_defconfig
arm                           sunxi_defconfig
nios2                               defconfig
sparc                               defconfig
powerpc                     asp8347_defconfig
ia64                          tiger_defconfig
mips                        nlm_xlr_defconfig
mips                  decstation_64_defconfig
sh                          urquell_defconfig
m68k                         apollo_defconfig
arm                        mvebu_v5_defconfig
powerpc                       holly_defconfig
m68k                        m5272c3_defconfig
arm                    vt8500_v6_v7_defconfig
powerpc                 mpc836x_rdk_defconfig
powerpc                     redwood_defconfig
powerpc                          g5_defconfig
arm                           omap1_defconfig
arm                   milbeaut_m10v_defconfig
arc                                 defconfig
arm                         lpc32xx_defconfig
powerpc                     tqm8548_defconfig
powerpc                 canyonlands_defconfig
sh                     magicpanelr2_defconfig
arm                         cm_x300_defconfig
arm                         bcm2835_defconfig
arm                        keystone_defconfig
ia64                         bigsur_defconfig
powerpc                   motionpro_defconfig
mips                     decstation_defconfig
um                               alldefconfig
arm                       multi_v4t_defconfig
microblaze                          defconfig
mips                          rm200_defconfig
parisc                           allyesconfig
openrisc                    or1ksim_defconfig
powerpc                 mpc832x_mds_defconfig
xtensa                       common_defconfig
sh                              ul2_defconfig
powerpc                 mpc836x_mds_defconfig
m68k                                defconfig
powerpc                    adder875_defconfig
sh                             sh03_defconfig
parisc                generic-32bit_defconfig
mips                         tb0226_defconfig
mips                      loongson3_defconfig
powerpc                     mpc512x_defconfig
arm                         lpc18xx_defconfig
arm                       mainstone_defconfig
mips                     loongson1b_defconfig
arm                       spear13xx_defconfig
arm                        oxnas_v6_defconfig
mips                           jazz_defconfig
arm                         s3c2410_defconfig
sh                          landisk_defconfig
x86_64                           alldefconfig
arm                        clps711x_defconfig
powerpc               mpc834x_itxgp_defconfig
arc                 nsimosci_hs_smp_defconfig
m68k                          sun3x_defconfig
sh                          rsk7201_defconfig
nds32                               defconfig
xtensa                           alldefconfig
arm                         hackkit_defconfig
powerpc                      pasemi_defconfig
powerpc                    klondike_defconfig
arc                         haps_hs_defconfig
m68k                         amcore_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
arc                              allyesconfig
nds32                             allnoconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
s390                                defconfig
sparc                            allyesconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20210421
x86_64               randconfig-a002-20210421
x86_64               randconfig-a001-20210421
x86_64               randconfig-a005-20210421
x86_64               randconfig-a006-20210421
x86_64               randconfig-a003-20210421
i386                 randconfig-a005-20210421
i386                 randconfig-a002-20210421
i386                 randconfig-a001-20210421
i386                 randconfig-a006-20210421
i386                 randconfig-a004-20210421
i386                 randconfig-a003-20210421
i386                 randconfig-a012-20210421
i386                 randconfig-a014-20210421
i386                 randconfig-a011-20210421
i386                 randconfig-a013-20210421
i386                 randconfig-a015-20210421
i386                 randconfig-a016-20210421
riscv                               defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a015-20210421
x86_64               randconfig-a016-20210421
x86_64               randconfig-a011-20210421
x86_64               randconfig-a014-20210421
x86_64               randconfig-a013-20210421
x86_64               randconfig-a012-20210421

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
