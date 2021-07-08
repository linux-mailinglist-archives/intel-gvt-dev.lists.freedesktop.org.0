Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A79C63C1B07
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  8 Jul 2021 23:33:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D1086E948;
	Thu,  8 Jul 2021 21:33:56 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B060E6E94A
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  8 Jul 2021 21:33:54 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10039"; a="295239879"
X-IronPort-AV: E=Sophos;i="5.84,225,1620716400"; d="scan'208";a="295239879"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2021 14:33:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,225,1620716400"; d="scan'208";a="461904671"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
 by fmsmga008.fm.intel.com with ESMTP; 08 Jul 2021 14:33:49 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1m1beW-000EV4-GR; Thu, 08 Jul 2021 21:33:48 +0000
Date: Fri, 09 Jul 2021 05:33:28 +0800
From: kernel test robot <lkp@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: [intel-gvt-linux:gvt-fixes] BUILD SUCCESS
 c90b4503ccf42d9d367e843c223df44aa550e82a
Message-ID: <60e76f28.0ENrQ/EeA+na2wPM%lkp@intel.com>
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

tree/branch: https://github.com/intel/gvt-linux.git gvt-fixes
branch HEAD: c90b4503ccf42d9d367e843c223df44aa550e82a  drm/i915/gvt: Clear d3_entered on elsp cmd submission.

elapsed time: 728m

configs tested: 216
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                      ep88xc_defconfig
powerpc                     pq2fads_defconfig
powerpc                    gamecube_defconfig
powerpc                        cell_defconfig
arm                           sunxi_defconfig
mips                      malta_kvm_defconfig
m68k                       bvme6000_defconfig
arm                         palmz72_defconfig
mips                          rb532_defconfig
sh                           se7721_defconfig
sh                 kfr2r09-romimage_defconfig
ia64                            zx1_defconfig
m68k                          multi_defconfig
powerpc                    adder875_defconfig
m68k                       m5208evb_defconfig
mips                      pic32mzda_defconfig
arm                       cns3420vb_defconfig
powerpc                   microwatt_defconfig
arm                          gemini_defconfig
m68k                            q40_defconfig
mips                            gpr_defconfig
arm                          ixp4xx_defconfig
mips                        vocore2_defconfig
h8300                       h8s-sim_defconfig
sparc64                          alldefconfig
arm                     am200epdkit_defconfig
xtensa                  audio_kc705_defconfig
arm                            mps2_defconfig
mips                         tb0219_defconfig
powerpc                    amigaone_defconfig
x86_64                           alldefconfig
m68k                       m5275evb_defconfig
arm                             ezx_defconfig
arm                         at91_dt_defconfig
arm                             rpc_defconfig
sparc                       sparc32_defconfig
arm                       multi_v4t_defconfig
m68k                        stmark2_defconfig
arm                          imote2_defconfig
powerpc                      tqm8xx_defconfig
arm                       imx_v4_v5_defconfig
s390                          debug_defconfig
csky                             alldefconfig
powerpc                      ppc6xx_defconfig
powerpc               mpc834x_itxgp_defconfig
arm                      pxa255-idp_defconfig
sh                            shmin_defconfig
microblaze                      mmu_defconfig
arm                          lpd270_defconfig
sh                          kfr2r09_defconfig
arc                      axs103_smp_defconfig
sh                          sdk7786_defconfig
um                             i386_defconfig
riscv                          rv32_defconfig
powerpc                     kilauea_defconfig
powerpc                         ps3_defconfig
powerpc                    sam440ep_defconfig
arm                           corgi_defconfig
powerpc                          allmodconfig
arm                  colibri_pxa270_defconfig
mips                         cobalt_defconfig
mips                     loongson2k_defconfig
sh                           se7724_defconfig
arc                        nsim_700_defconfig
arm                         vf610m4_defconfig
s390                             allmodconfig
sh                           se7206_defconfig
arc                           tb10x_defconfig
sh                   rts7751r2dplus_defconfig
powerpc                     ppa8548_defconfig
sh                          rsk7264_defconfig
xtensa                    xip_kc705_defconfig
powerpc                       ebony_defconfig
mips                           mtx1_defconfig
powerpc                      katmai_defconfig
powerpc                     akebono_defconfig
powerpc                   motionpro_defconfig
sh                           se7750_defconfig
powerpc                    mvme5100_defconfig
sh                     magicpanelr2_defconfig
mips                         rt305x_defconfig
xtensa                generic_kc705_defconfig
sh                           se7751_defconfig
arm                       versatile_defconfig
sh                         ecovec24_defconfig
powerpc                 mpc8540_ads_defconfig
powerpc                          g5_defconfig
arm                           viper_defconfig
powerpc                      ppc44x_defconfig
arc                        nsimosci_defconfig
sh                             shx3_defconfig
powerpc                     ksi8560_defconfig
riscv                            allmodconfig
powerpc                           allnoconfig
mips                  cavium_octeon_defconfig
arm                     eseries_pxa_defconfig
powerpc                      pasemi_defconfig
arm                             mxs_defconfig
sh                           se7712_defconfig
sh                        edosk7705_defconfig
sh                        sh7757lcr_defconfig
sh                           se7705_defconfig
powerpc                     ep8248e_defconfig
powerpc                      ppc64e_defconfig
powerpc                  storcenter_defconfig
powerpc                     tqm8541_defconfig
sh                           se7722_defconfig
mips                           xway_defconfig
sh                           sh2007_defconfig
arm                       aspeed_g5_defconfig
mips                       rbtx49xx_defconfig
powerpc                     tqm8548_defconfig
arm                           h3600_defconfig
arm                           u8500_defconfig
arm                        mvebu_v7_defconfig
sh                            hp6xx_defconfig
arm                         shannon_defconfig
mips                       bmips_be_defconfig
arm                        multi_v7_defconfig
powerpc                     mpc512x_defconfig
powerpc                 mpc834x_mds_defconfig
powerpc                 xes_mpc85xx_defconfig
mips                     cu1000-neo_defconfig
powerpc                      acadia_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
x86_64               randconfig-a004-20210707
x86_64               randconfig-a002-20210707
x86_64               randconfig-a005-20210707
x86_64               randconfig-a006-20210707
x86_64               randconfig-a003-20210707
x86_64               randconfig-a001-20210707
i386                 randconfig-a006-20210708
i386                 randconfig-a004-20210708
i386                 randconfig-a001-20210708
i386                 randconfig-a003-20210708
i386                 randconfig-a005-20210708
i386                 randconfig-a002-20210708
i386                 randconfig-a004-20210707
i386                 randconfig-a006-20210707
i386                 randconfig-a001-20210707
i386                 randconfig-a003-20210707
i386                 randconfig-a005-20210707
i386                 randconfig-a002-20210707
i386                 randconfig-a015-20210707
i386                 randconfig-a016-20210707
i386                 randconfig-a012-20210707
i386                 randconfig-a011-20210707
i386                 randconfig-a014-20210707
i386                 randconfig-a013-20210707
i386                 randconfig-a015-20210708
i386                 randconfig-a016-20210708
i386                 randconfig-a011-20210708
i386                 randconfig-a012-20210708
i386                 randconfig-a013-20210708
i386                 randconfig-a014-20210708
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                            kunit_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210707
x86_64               randconfig-b001-20210708
x86_64               randconfig-a004-20210708
x86_64               randconfig-a005-20210708
x86_64               randconfig-a002-20210708
x86_64               randconfig-a006-20210708
x86_64               randconfig-a003-20210708
x86_64               randconfig-a001-20210708
x86_64               randconfig-a015-20210707
x86_64               randconfig-a014-20210707
x86_64               randconfig-a012-20210707
x86_64               randconfig-a011-20210707
x86_64               randconfig-a016-20210707
x86_64               randconfig-a013-20210707

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
