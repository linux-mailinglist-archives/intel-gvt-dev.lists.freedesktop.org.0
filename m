Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BFDD4C4117
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 25 Feb 2022 10:17:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7EEF10E7A2;
	Fri, 25 Feb 2022 09:17:02 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51E1510E772
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 25 Feb 2022 09:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645780621; x=1677316621;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=NOUfMlplGfsGMulaKMvDFu+sGjGf3hrgj7typFwv5sw=;
 b=V2pSqUOlh7uDHATroXPeHWMHiOU2UDvjmmWmC+6z9Jc2sBEGkq/tNhzR
 q9fdey+gAj44SxIY09fMQr1GHRgUmZ8MGwRD9TsV3/3A03Quw3/mcgzkf
 ES6ApR8HiNF2SGFkB7Bh6e3aQ9tOlHNfHi8kAnrmykR6GvmTXyXSZUvW3
 xSipEIUQHhBe4MTrAxFh02kiO5Sqzci2Yg6zhWMps0jYNUT+L7Cj0uYuH
 yBBIA4lFnnz8z4Ys8pRf8KJ5UCs0opE3Yq/ufKAlR1MX86qLBwEtBISaP
 XNABlUUDoIGid8dicgJcnI/gPMNztztJ5OJgk3uqludP7ILLpS/mikCNQ g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="338897598"
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; d="scan'208";a="338897598"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 01:17:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; d="scan'208";a="574546809"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
 by orsmga001.jf.intel.com with ESMTP; 25 Feb 2022 01:16:59 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nNWig-00048j-Ef; Fri, 25 Feb 2022 09:16:58 +0000
Date: Fri, 25 Feb 2022 17:16:09 +0800
From: kernel test robot <lkp@intel.com>
To: Zhi Wang <zhi.a.wang@intel.com>
Subject: [intel-gvt:gvt-next] BUILD SUCCESS
 f2e0cc1a2c41a7af66dfb3f6af59677b05f9ac96
Message-ID: <62189e59.vP+Y+0EqJzK7uOJQ%lkp@intel.com>
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
branch HEAD: f2e0cc1a2c41a7af66dfb3f6af59677b05f9ac96  drm/i915/gvt: add the missing mdev attribute "name"

elapsed time: 727m

configs tested: 171
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                          randconfig-c001
mips                 randconfig-c004-20220223
powerpc              randconfig-c003-20220225
mips                 randconfig-c004-20220225
powerpc                    amigaone_defconfig
powerpc                      cm5200_defconfig
powerpc                 mpc837x_mds_defconfig
arm                            zeus_defconfig
powerpc                       maple_defconfig
arm                        spear6xx_defconfig
powerpc                     sequoia_defconfig
microblaze                      mmu_defconfig
powerpc                  iss476-smp_defconfig
m68k                        mvme16x_defconfig
sh                ecovec24-romimage_defconfig
sh                         microdev_defconfig
ia64                        generic_defconfig
h8300                    h8300h-sim_defconfig
openrisc                            defconfig
sh                        apsh4ad0a_defconfig
sh                  sh7785lcr_32bit_defconfig
arm                         axm55xx_defconfig
nios2                            allyesconfig
xtensa                          iss_defconfig
h8300                     edosk2674_defconfig
sh                           se7751_defconfig
arm                         s3c6400_defconfig
arm                         assabet_defconfig
arc                 nsimosci_hs_smp_defconfig
powerpc                         wii_defconfig
powerpc64                        alldefconfig
arc                      axs103_smp_defconfig
m68k                          atari_defconfig
x86_64                           alldefconfig
sh                           se7750_defconfig
xtensa                generic_kc705_defconfig
powerpc                 mpc834x_mds_defconfig
sh                     magicpanelr2_defconfig
mips                         rt305x_defconfig
arm                           sama5_defconfig
arm64                            alldefconfig
sh                            shmin_defconfig
sh                   sh7724_generic_defconfig
arc                           tb10x_defconfig
sh                           se7780_defconfig
arc                          axs103_defconfig
x86_64                              defconfig
powerpc                     mpc83xx_defconfig
mips                         db1xxx_defconfig
powerpc                      bamboo_defconfig
m68k                         amcore_defconfig
arm                        keystone_defconfig
openrisc                         alldefconfig
powerpc                     redwood_defconfig
powerpc                        warp_defconfig
sparc                               defconfig
m68k                          amiga_defconfig
mips                       bmips_be_defconfig
sh                            migor_defconfig
xtensa                    xip_kc705_defconfig
arc                    vdk_hs38_smp_defconfig
h8300                               defconfig
powerpc                      tqm8xx_defconfig
arm                     eseries_pxa_defconfig
sh                           se7712_defconfig
m68k                        m5272c3_defconfig
sh                          lboxre2_defconfig
arc                            hsdk_defconfig
arm                          gemini_defconfig
powerpc                     stx_gp3_defconfig
arc                     nsimosci_hs_defconfig
powerpc                     tqm8555_defconfig
arm                  randconfig-c002-20220224
arm                  randconfig-c002-20220223
arm                  randconfig-c002-20220225
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
parisc64                            defconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
s390                 randconfig-r044-20220224
arc                  randconfig-r043-20220224
arc                  randconfig-r043-20220223
riscv                randconfig-r042-20220224
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
powerpc              randconfig-c003-20220225
x86_64                        randconfig-c007
arm                  randconfig-c002-20220225
mips                 randconfig-c004-20220225
i386                          randconfig-c001
riscv                randconfig-c006-20220225
powerpc              randconfig-c003-20220224
arm                  randconfig-c002-20220224
mips                 randconfig-c004-20220224
riscv                randconfig-c006-20220224
powerpc              randconfig-c003-20220223
arm                  randconfig-c002-20220223
mips                 randconfig-c004-20220223
riscv                randconfig-c006-20220223
mips                      pic32mzda_defconfig
powerpc                    mvme5100_defconfig
riscv                    nommu_virt_defconfig
i386                             allyesconfig
arm                         orion5x_defconfig
arm                                 defconfig
arm                         hackkit_defconfig
powerpc                     tqm8560_defconfig
arm                         socfpga_defconfig
mips                           ip22_defconfig
arm                      tct_hammer_defconfig
powerpc                   lite5200b_defconfig
arm                        magician_defconfig
arm                          moxart_defconfig
powerpc                          allyesconfig
arm                         palmz72_defconfig
mips                     loongson2k_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220223
hexagon              randconfig-r041-20220223
riscv                randconfig-r042-20220223
hexagon              randconfig-r045-20220225
hexagon              randconfig-r041-20220225
riscv                randconfig-r042-20220225
hexagon              randconfig-r045-20220224
hexagon              randconfig-r041-20220224

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
