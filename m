Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9371A304599
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 26 Jan 2021 18:45:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 499746E466;
	Tue, 26 Jan 2021 17:45:53 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B3D76E455
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 26 Jan 2021 17:45:51 +0000 (UTC)
IronPort-SDR: fQhQrNdaQaCiLua6vqAcAkioDcDPhp9+t5iob8gPK/sISudrdKFM0U4x0XYBzxJpVE4o4TVypS
 miRGokPkQoCg==
X-IronPort-AV: E=McAfee;i="6000,8403,9876"; a="176432345"
X-IronPort-AV: E=Sophos;i="5.79,377,1602572400"; d="scan'208";a="176432345"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2021 09:45:50 -0800
IronPort-SDR: 7p+F4xjV1hTV6IzEivzX6v+gN6rvhj6C19PQzZH9GqPd52nLCTPMxjSh4oFNNlUKGxfgch7kgx
 w5TzAaNSDYJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,377,1602572400"; d="scan'208";a="472826020"
Received: from lkp-server02.sh.intel.com (HELO 625d3a354f04) ([10.239.97.151])
 by fmsmga001.fm.intel.com with ESMTP; 26 Jan 2021 09:45:49 -0800
Received: from kbuild by 625d3a354f04 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1l4SPU-00011G-Ol; Tue, 26 Jan 2021 17:45:48 +0000
Date: Wed, 27 Jan 2021 01:45:37 +0800
From: kernel test robot <lkp@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: [intel-gvt-linux:gvt-gt-next] BUILD SUCCESS
 ab07fea9c4e179a22644a6406ecea4614406c245
Message-ID: <60105541.vfw8AictdvLvNZV3%lkp@intel.com>
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

tree/branch: https://github.com/intel/gvt-linux.git gvt-gt-next
branch HEAD: ab07fea9c4e179a22644a6406ecea4614406c245  drm/i915/gvt: fix uninitialized return in intel_gvt_update_reg_whitelist()

elapsed time: 727m

configs tested: 142
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                           xway_defconfig
mips                      bmips_stb_defconfig
ia64                        generic_defconfig
riscv                    nommu_virt_defconfig
powerpc                     tqm8555_defconfig
mips                             allmodconfig
powerpc                  mpc885_ads_defconfig
s390                          debug_defconfig
mips                        omega2p_defconfig
arm                           stm32_defconfig
mips                  decstation_64_defconfig
microblaze                      mmu_defconfig
mips                     cu1830-neo_defconfig
arc                        vdk_hs38_defconfig
sh                               alldefconfig
arm                           sama5_defconfig
sh                        dreamcast_defconfig
mips                         cobalt_defconfig
powerpc                 xes_mpc85xx_defconfig
powerpc                    adder875_defconfig
m68k                        mvme16x_defconfig
mips                           ci20_defconfig
mips                      fuloong2e_defconfig
powerpc                     tqm5200_defconfig
powerpc                    klondike_defconfig
arm                         palmz72_defconfig
powerpc                    gamecube_defconfig
riscv                          rv32_defconfig
arm                         bcm2835_defconfig
powerpc                     rainier_defconfig
powerpc                     pseries_defconfig
mips                    maltaup_xpa_defconfig
arm                        oxnas_v6_defconfig
sh                           se7705_defconfig
mips                  cavium_octeon_defconfig
sparc                               defconfig
arm                          lpd270_defconfig
arm                             pxa_defconfig
sh                          landisk_defconfig
sh                           se7712_defconfig
sparc                            alldefconfig
powerpc                      bamboo_defconfig
arm                         assabet_defconfig
mips                           gcw0_defconfig
mips                        jmr3927_defconfig
m68k                       m5275evb_defconfig
arc                           tb10x_defconfig
mips                          rb532_defconfig
powerpc                         ps3_defconfig
arm                  colibri_pxa300_defconfig
arm                     eseries_pxa_defconfig
sparc64                          alldefconfig
xtensa                  cadence_csp_defconfig
sh                           se7750_defconfig
mips                           mtx1_defconfig
powerpc                    mvme5100_defconfig
arm                        realview_defconfig
m68k                          sun3x_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
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
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20210126
i386                 randconfig-a002-20210126
i386                 randconfig-a004-20210126
i386                 randconfig-a006-20210126
i386                 randconfig-a003-20210126
i386                 randconfig-a005-20210126
x86_64               randconfig-a003-20210125
x86_64               randconfig-a002-20210125
x86_64               randconfig-a001-20210125
x86_64               randconfig-a005-20210125
x86_64               randconfig-a006-20210125
x86_64               randconfig-a004-20210125
x86_64               randconfig-a012-20210126
x86_64               randconfig-a016-20210126
x86_64               randconfig-a015-20210126
x86_64               randconfig-a011-20210126
x86_64               randconfig-a013-20210126
x86_64               randconfig-a014-20210126
i386                 randconfig-a013-20210125
i386                 randconfig-a011-20210125
i386                 randconfig-a012-20210125
i386                 randconfig-a015-20210125
i386                 randconfig-a014-20210125
i386                 randconfig-a016-20210125
i386                 randconfig-a013-20210126
i386                 randconfig-a011-20210126
i386                 randconfig-a012-20210126
i386                 randconfig-a015-20210126
i386                 randconfig-a014-20210126
i386                 randconfig-a016-20210126
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a003-20210126
x86_64               randconfig-a002-20210126
x86_64               randconfig-a001-20210126
x86_64               randconfig-a005-20210126
x86_64               randconfig-a006-20210126
x86_64               randconfig-a004-20210126

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
