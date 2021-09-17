Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9B140EECA
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 17 Sep 2021 03:34:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0E256EA4C;
	Fri, 17 Sep 2021 01:34:08 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 255E66EA4C
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 17 Sep 2021 01:34:07 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10109"; a="245089362"
X-IronPort-AV: E=Sophos;i="5.85,299,1624345200"; d="scan'208";a="245089362"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 18:34:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,299,1624345200"; d="scan'208";a="472972163"
Received: from lkp-server01.sh.intel.com (HELO 285e7b116627) ([10.239.97.150])
 by orsmga007.jf.intel.com with ESMTP; 16 Sep 2021 18:34:04 -0700
Received: from kbuild by 285e7b116627 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mR2lP-0001cG-Tx; Fri, 17 Sep 2021 01:34:03 +0000
Date: Fri, 17 Sep 2021 09:33:05 +0800
From: kernel test robot <lkp@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: intel-gvt-dev@lists.freedesktop.org, terrence.xu@intel.com,
 zhenyu.z.wang@intel.com
Subject: [intel-gvt:gvt-staging] BUILD SUCCESS
 bd950a66c7919d7121d2530f30984351534a96dc
Message-ID: <6143f051.AHaqxX/zXNVuRsra%lkp@intel.com>
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

tree/branch: https://github.com/intel/gvt-linux.git gvt-staging
branch HEAD: bd950a66c7919d7121d2530f30984351534a96dc  TESTONLY:drm/i915/gvt: potential fix for refactor against current tip

elapsed time: 4969m

configs tested: 161
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20210916
powerpc                 mpc8313_rdb_defconfig
mips                malta_qemu_32r6_defconfig
arm                      footbridge_defconfig
arm                          lpd270_defconfig
arm                            qcom_defconfig
nios2                         10m50_defconfig
arc                 nsimosci_hs_smp_defconfig
mips                            ar7_defconfig
arm                       netwinder_defconfig
sh                        apsh4ad0a_defconfig
sh                           se7206_defconfig
powerpc                    socrates_defconfig
s390                       zfcpdump_defconfig
powerpc                      arches_defconfig
m68k                       m5275evb_defconfig
arm                         bcm2835_defconfig
riscv                            alldefconfig
sparc                       sparc32_defconfig
m68k                           sun3_defconfig
ia64                      gensparse_defconfig
mips                  cavium_octeon_defconfig
xtensa                    xip_kc705_defconfig
powerpc                     tqm5200_defconfig
sh                          r7785rp_defconfig
mips                            gpr_defconfig
sh                         ecovec24_defconfig
m68k                         apollo_defconfig
sh                         apsh4a3a_defconfig
arm                           stm32_defconfig
sh                          lboxre2_defconfig
powerpc                     tqm8541_defconfig
arc                        vdk_hs38_defconfig
xtensa                    smp_lx200_defconfig
powerpc                     ksi8560_defconfig
sh                      rts7751r2d1_defconfig
openrisc                         alldefconfig
m68k                        mvme16x_defconfig
powerpc                     ep8248e_defconfig
riscv                               defconfig
arm                         lpc18xx_defconfig
arm                           h3600_defconfig
arm                            dove_defconfig
powerpc                 canyonlands_defconfig
arc                          axs103_defconfig
powerpc                 linkstation_defconfig
sh                ecovec24-romimage_defconfig
mips                          malta_defconfig
arm                     am200epdkit_defconfig
x86_64               randconfig-c001-20210915
arm                  randconfig-c002-20210915
i386                 randconfig-c001-20210915
x86_64               randconfig-c001-20210916
arm                  randconfig-c002-20210916
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
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a002-20210913
x86_64               randconfig-a003-20210913
x86_64               randconfig-a006-20210913
x86_64               randconfig-a004-20210913
x86_64               randconfig-a005-20210913
x86_64               randconfig-a001-20210913
x86_64               randconfig-a016-20210916
x86_64               randconfig-a013-20210916
x86_64               randconfig-a012-20210916
x86_64               randconfig-a011-20210916
x86_64               randconfig-a014-20210916
x86_64               randconfig-a015-20210916
i386                 randconfig-a016-20210916
i386                 randconfig-a015-20210916
i386                 randconfig-a011-20210916
i386                 randconfig-a012-20210916
i386                 randconfig-a013-20210916
i386                 randconfig-a014-20210916
riscv                randconfig-r042-20210916
s390                 randconfig-r044-20210916
arc                  randconfig-r043-20210916
arc                  randconfig-r043-20210913
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
riscv                randconfig-c006-20210916
x86_64               randconfig-c007-20210916
mips                 randconfig-c004-20210916
powerpc              randconfig-c003-20210916
arm                  randconfig-c002-20210916
i386                 randconfig-c001-20210916
s390                 randconfig-c005-20210916
x86_64               randconfig-a002-20210916
x86_64               randconfig-a003-20210916
x86_64               randconfig-a006-20210916
x86_64               randconfig-a004-20210916
x86_64               randconfig-a005-20210916
x86_64               randconfig-a001-20210916
i386                 randconfig-a004-20210914
i386                 randconfig-a005-20210914
i386                 randconfig-a006-20210914
i386                 randconfig-a002-20210914
i386                 randconfig-a001-20210914
i386                 randconfig-a003-20210914
i386                 randconfig-a004-20210916
i386                 randconfig-a005-20210916
i386                 randconfig-a006-20210916
i386                 randconfig-a002-20210916
i386                 randconfig-a003-20210916
i386                 randconfig-a001-20210916
i386                 randconfig-a016-20210913
i386                 randconfig-a011-20210913
i386                 randconfig-a015-20210913
i386                 randconfig-a012-20210913
i386                 randconfig-a013-20210913
i386                 randconfig-a014-20210913
hexagon              randconfig-r045-20210916
hexagon              randconfig-r041-20210916
riscv                randconfig-r042-20210913
hexagon              randconfig-r045-20210913
s390                 randconfig-r044-20210913
hexagon              randconfig-r041-20210913

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
