Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A2242B2F0
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 13 Oct 2021 04:55:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08C6C6E061;
	Wed, 13 Oct 2021 02:55:06 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7357B6E061
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 13 Oct 2021 02:55:05 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10135"; a="224768671"
X-IronPort-AV: E=Sophos;i="5.85,369,1624345200"; d="scan'208";a="224768671"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2021 19:55:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,369,1624345200"; d="scan'208";a="441473296"
Received: from lkp-server02.sh.intel.com (HELO 08b2c502c3de) ([10.239.97.151])
 by orsmga006.jf.intel.com with ESMTP; 12 Oct 2021 19:55:01 -0700
Received: from kbuild by 08b2c502c3de with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1maUQ0-0004AX-Im; Wed, 13 Oct 2021 02:55:00 +0000
Date: Wed, 13 Oct 2021 10:54:11 +0800
From: kernel test robot <lkp@intel.com>
To: Zhi Wang <zhi.a.wang@intel.com>
Cc: intel-gvt-dev@lists.freedesktop.org, terrence.xu@intel.com,
 zhenyu.z.wang@intel.com
Subject: [intel-gvt:gvt-fixes] BUILD SUCCESS
 3a9ad2db9a282fa8617809372f11c7d439d4182f
Message-ID: <61664a53.tLN9vUCIT9tlqL2+%lkp@intel.com>
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

tree/branch: https://github.com/intel/gvt-linux.git gvt-fixes
branch HEAD: 3a9ad2db9a282fa8617809372f11c7d439d4182f  drm/i915/gvt: clean up kernel-doc in gtt.c

elapsed time: 994m

configs tested: 178
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211012
s390                       zfcpdump_defconfig
m68k                        m5307c3_defconfig
mips                        omega2p_defconfig
arm                            mmp2_defconfig
arm                        mini2440_defconfig
arc                     nsimosci_hs_defconfig
arm                            qcom_defconfig
arm                          gemini_defconfig
arc                 nsimosci_hs_smp_defconfig
powerpc                          allmodconfig
sh                           sh2007_defconfig
arm                        shmobile_defconfig
sh                          r7780mp_defconfig
powerpc                 linkstation_defconfig
mips                      malta_kvm_defconfig
arm                           sama7_defconfig
powerpc                     mpc5200_defconfig
xtensa                generic_kc705_defconfig
powerpc                      makalu_defconfig
sh                             espt_defconfig
m68k                       bvme6000_defconfig
sh                         ecovec24_defconfig
arm                          lpd270_defconfig
arc                          axs103_defconfig
s390                          debug_defconfig
powerpc                 mpc8560_ads_defconfig
powerpc                       holly_defconfig
arm                            dove_defconfig
ia64                            zx1_defconfig
nds32                            alldefconfig
arc                            hsdk_defconfig
arm                         s5pv210_defconfig
arm                            hisi_defconfig
arm                        keystone_defconfig
arm                    vt8500_v6_v7_defconfig
m68k                        m5407c3_defconfig
powerpc                    klondike_defconfig
powerpc                 mpc85xx_cds_defconfig
riscv                             allnoconfig
mips                  maltasmvp_eva_defconfig
openrisc                            defconfig
arm64                            alldefconfig
arm                           omap1_defconfig
arm                           sunxi_defconfig
arm                      tct_hammer_defconfig
csky                             alldefconfig
arm                         lpc32xx_defconfig
arm                       multi_v4t_defconfig
sh                        sh7785lcr_defconfig
powerpc                     tqm5200_defconfig
sh                   secureedge5410_defconfig
powerpc                       ppc64_defconfig
mips                         cobalt_defconfig
sh                      rts7751r2d1_defconfig
powerpc                   motionpro_defconfig
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
m68k                       m5475evb_defconfig
powerpc                 mpc8313_rdb_defconfig
sh                        dreamcast_defconfig
m68k                             allyesconfig
sh                     magicpanelr2_defconfig
sh                          landisk_defconfig
um                             i386_defconfig
arc                           tb10x_defconfig
mips                           ip32_defconfig
arm                           corgi_defconfig
powerpc                       ebony_defconfig
mips                      bmips_stb_defconfig
powerpc                       eiger_defconfig
mips                            e55_defconfig
mips                        nlm_xlp_defconfig
arm                  randconfig-c002-20211012
x86_64               randconfig-c001-20211012
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allmodconfig
nios2                               defconfig
nds32                             allnoconfig
arc                              allyesconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
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
arc                  randconfig-r043-20211012
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allyesconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                           allyesconfig

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

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
