Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7000842C18D
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 13 Oct 2021 15:37:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1877E89A44;
	Wed, 13 Oct 2021 13:37:18 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA5806E0E5
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 13 Oct 2021 13:37:16 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10135"; a="227322681"
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="227322681"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 06:37:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="480793777"
Received: from lkp-server02.sh.intel.com (HELO 08b2c502c3de) ([10.239.97.151])
 by orsmga007.jf.intel.com with ESMTP; 13 Oct 2021 06:37:14 -0700
Received: from kbuild by 08b2c502c3de with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1maeRV-0004e4-V8; Wed, 13 Oct 2021 13:37:13 +0000
Date: Wed, 13 Oct 2021 21:36:46 +0800
From: kernel test robot <lkp@intel.com>
To: Zhi Wang <zhi.a.wang@intel.com>
Cc: intel-gvt-dev@lists.freedesktop.org, terrence.xu@intel.com,
 zhenyu.z.wang@intel.com
Subject: [intel-gvt:gvt-next] BUILD SUCCESS
 1309e8a5b4d0f7b41c3c839e7c376e8359a13251
Message-ID: <6166e0ee.dFRRZUKZ1UUYq3XX%lkp@intel.com>
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
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

tree/branch: https://github.com/intel/gvt-linux.git gvt-next
branch HEAD: 1309e8a5b4d0f7b41c3c839e7c376e8359a13251  drm/i915/gvt: Fix cmd parser error for Passmark9

elapsed time: 1636m

configs tested: 250
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allmodconfig
arm                              allyesconfig
i386                 randconfig-c001-20211012
i386                 randconfig-c001-20211013
s390                       zfcpdump_defconfig
m68k                        m5307c3_defconfig
mips                        omega2p_defconfig
arm                            mmp2_defconfig
arm                        mini2440_defconfig
arc                     nsimosci_hs_defconfig
sh                   sh7724_generic_defconfig
powerpc                     pseries_defconfig
xtensa                          iss_defconfig
arm                           sunxi_defconfig
powerpc                   motionpro_defconfig
arm                           corgi_defconfig
arm                        vexpress_defconfig
powerpc                     stx_gp3_defconfig
sh                  sh7785lcr_32bit_defconfig
arm                        shmobile_defconfig
sh                          r7780mp_defconfig
powerpc                 linkstation_defconfig
mips                      malta_kvm_defconfig
arm                           sama7_defconfig
powerpc                 mpc834x_itx_defconfig
m68k                       m5249evb_defconfig
csky                             alldefconfig
mips                            e55_defconfig
powerpc                     mpc5200_defconfig
xtensa                generic_kc705_defconfig
powerpc                      makalu_defconfig
sh                             espt_defconfig
m68k                       bvme6000_defconfig
sh                         ecovec24_defconfig
arm                          lpd270_defconfig
arc                          axs103_defconfig
s390                          debug_defconfig
mips                           mtx1_defconfig
parisc                generic-32bit_defconfig
xtensa                  audio_kc705_defconfig
powerpc                     tqm8548_defconfig
powerpc                     tqm8560_defconfig
powerpc                 mpc8560_ads_defconfig
powerpc                       holly_defconfig
arm                            dove_defconfig
ia64                            zx1_defconfig
nds32                            alldefconfig
arc                            hsdk_defconfig
arm                         s5pv210_defconfig
arm                            hisi_defconfig
arm                        keystone_defconfig
powerpc                     akebono_defconfig
arm                            qcom_defconfig
powerpc                      obs600_defconfig
sparc                            alldefconfig
powerpc                        warp_defconfig
arm                    vt8500_v6_v7_defconfig
m68k                        m5407c3_defconfig
powerpc                    klondike_defconfig
powerpc                 mpc85xx_cds_defconfig
riscv                             allnoconfig
arm                       mainstone_defconfig
sh                          urquell_defconfig
arm                        realview_defconfig
arm                          exynos_defconfig
m68k                           sun3_defconfig
arm                           omap1_defconfig
alpha                            allyesconfig
powerpc                        icon_defconfig
m68k                          multi_defconfig
arm                          imote2_defconfig
mips                  maltasmvp_eva_defconfig
openrisc                            defconfig
arm64                            alldefconfig
powerpc                       maple_defconfig
arm                             ezx_defconfig
ia64                             allyesconfig
mips                 decstation_r4k_defconfig
arm                     eseries_pxa_defconfig
sh                           se7751_defconfig
arm                        spear6xx_defconfig
arm                          iop32x_defconfig
mips                        bcm47xx_defconfig
arm                      tct_hammer_defconfig
arm                         lpc32xx_defconfig
arm                       multi_v4t_defconfig
sh                        sh7785lcr_defconfig
powerpc                    sam440ep_defconfig
mips                           ip28_defconfig
sh                           se7724_defconfig
sparc                       sparc64_defconfig
mips                          ath25_defconfig
powerpc                      tqm8xx_defconfig
arm                            pleb_defconfig
mips                      bmips_stb_defconfig
powerpc                 mpc834x_mds_defconfig
arc                    vdk_hs38_smp_defconfig
arc                              alldefconfig
arm                           tegra_defconfig
mips                   sb1250_swarm_defconfig
powerpc                      ep88xc_defconfig
sh                          kfr2r09_defconfig
powerpc                      mgcoge_defconfig
arm                          simpad_defconfig
mips                           ip22_defconfig
powerpc                     tqm5200_defconfig
sh                   secureedge5410_defconfig
powerpc                       ppc64_defconfig
mips                         cobalt_defconfig
sh                      rts7751r2d1_defconfig
sh                           se7206_defconfig
arm                        mvebu_v5_defconfig
powerpc                        fsp2_defconfig
mips                          malta_defconfig
m68k                         amcore_defconfig
arm                          badge4_defconfig
sh                            hp6xx_defconfig
arm                          collie_defconfig
arm                         axm55xx_defconfig
nios2                         10m50_defconfig
powerpc                      katmai_defconfig
powerpc                      ppc44x_defconfig
powerpc                 mpc837x_rdb_defconfig
mips                         tb0219_defconfig
m68k                          amiga_defconfig
arm                      footbridge_defconfig
microblaze                          defconfig
mips                        vocore2_defconfig
sh                          landisk_defconfig
um                             i386_defconfig
arc                           tb10x_defconfig
mips                           ip32_defconfig
powerpc                       ebony_defconfig
powerpc                       eiger_defconfig
mips                        nlm_xlp_defconfig
sh                 kfr2r09-romimage_defconfig
mips                        qi_lb60_defconfig
powerpc                         ps3_defconfig
mips                         tb0287_defconfig
sh                           se7722_defconfig
powerpc                    adder875_defconfig
arm                           spitz_defconfig
powerpc                     sequoia_defconfig
openrisc                    or1ksim_defconfig
mips                          rb532_defconfig
powerpc                     tqm8540_defconfig
mips                      maltaaprp_defconfig
arm                  randconfig-c002-20211012
x86_64               randconfig-c001-20211012
arm                  randconfig-c002-20211013
x86_64               randconfig-c001-20211013
ia64                             allmodconfig
ia64                                defconfig
m68k                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
nios2                               defconfig
nds32                             allnoconfig
arc                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                                defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                             allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64               randconfig-a004-20211012
x86_64               randconfig-a006-20211012
x86_64               randconfig-a001-20211012
x86_64               randconfig-a005-20211012
x86_64               randconfig-a002-20211012
x86_64               randconfig-a003-20211012
i386                 randconfig-a001-20211012
i386                 randconfig-a003-20211012
i386                 randconfig-a004-20211012
i386                 randconfig-a005-20211012
i386                 randconfig-a002-20211012
i386                 randconfig-a006-20211012
i386                 randconfig-a016-20211013
i386                 randconfig-a014-20211013
i386                 randconfig-a011-20211013
i386                 randconfig-a015-20211013
i386                 randconfig-a012-20211013
i386                 randconfig-a013-20211013
arc                  randconfig-r043-20211012
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allyesconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
arm                  randconfig-c002-20211012
mips                 randconfig-c004-20211012
i386                 randconfig-c001-20211012
s390                 randconfig-c005-20211012
x86_64               randconfig-c007-20211012
powerpc              randconfig-c003-20211012
riscv                randconfig-c006-20211012
x86_64               randconfig-a004-20211013
x86_64               randconfig-a006-20211013
x86_64               randconfig-a001-20211013
x86_64               randconfig-a005-20211013
x86_64               randconfig-a002-20211013
x86_64               randconfig-a003-20211013
i386                 randconfig-a001-20211013
i386                 randconfig-a003-20211013
i386                 randconfig-a004-20211013
i386                 randconfig-a005-20211013
i386                 randconfig-a002-20211013
i386                 randconfig-a006-20211013
x86_64               randconfig-a015-20211012
x86_64               randconfig-a012-20211012
x86_64               randconfig-a016-20211012
x86_64               randconfig-a014-20211012
x86_64               randconfig-a013-20211012
x86_64               randconfig-a011-20211012
i386                 randconfig-a016-20211012
i386                 randconfig-a014-20211012
i386                 randconfig-a011-20211012
i386                 randconfig-a015-20211012
i386                 randconfig-a012-20211012
i386                 randconfig-a013-20211012
hexagon              randconfig-r041-20211012
s390                 randconfig-r044-20211012
riscv                randconfig-r042-20211012
hexagon              randconfig-r045-20211012
hexagon              randconfig-r041-20211013
hexagon              randconfig-r045-20211013

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
