Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFED40A3E1
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 14 Sep 2021 04:51:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 877F16E342;
	Tue, 14 Sep 2021 02:51:53 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D442A6E328
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 14 Sep 2021 02:51:51 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10106"; a="282857566"
X-IronPort-AV: E=Sophos;i="5.85,291,1624345200"; d="scan'208";a="282857566"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 19:51:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,291,1624345200"; d="scan'208";a="481598161"
Received: from lkp-server01.sh.intel.com (HELO 730d49888f40) ([10.239.97.150])
 by orsmga008.jf.intel.com with ESMTP; 13 Sep 2021 19:51:49 -0700
Received: from kbuild by 730d49888f40 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mPyY0-00086c-RZ; Tue, 14 Sep 2021 02:51:48 +0000
Date: Tue, 14 Sep 2021 10:51:10 +0800
From: kernel test robot <lkp@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: intel-gvt-dev@lists.freedesktop.org, terrence.xu@intel.com,
 zhenyu.z.wang@intel.com
Subject: [intel-gvt-linux:gvt-fixes] BUILD SUCCESS
 d168cd797982db9db617113644c87b8f5f3cf27e
Message-ID: <61400e1e.DK/byun77t3fEMz+%lkp@intel.com>
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
branch HEAD: d168cd797982db9db617113644c87b8f5f3cf27e  drm/i915/gvt: fix the usage of ww lock in gvt scheduler.

elapsed time: 727m

configs tested: 148
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20210913
powerpc                   motionpro_defconfig
arm                         axm55xx_defconfig
powerpc                 mpc8540_ads_defconfig
m68k                        m5307c3_defconfig
powerpc                      ppc6xx_defconfig
mips                           gcw0_defconfig
mips                      fuloong2e_defconfig
arm                          pxa168_defconfig
arm                          pxa910_defconfig
arm                       aspeed_g4_defconfig
m68k                            q40_defconfig
arm                        keystone_defconfig
powerpc                 canyonlands_defconfig
mips                            e55_defconfig
mips                     loongson1b_defconfig
powerpc                     taishan_defconfig
arm                         s3c2410_defconfig
arm                            mps2_defconfig
xtensa                  cadence_csp_defconfig
arm                     davinci_all_defconfig
powerpc                     redwood_defconfig
arm                       netwinder_defconfig
powerpc                        cell_defconfig
mips                      maltasmvp_defconfig
mips                        workpad_defconfig
arm                            mmp2_defconfig
m68k                       m5275evb_defconfig
powerpc                    ge_imp3a_defconfig
powerpc                    gamecube_defconfig
xtensa                         virt_defconfig
sparc64                          alldefconfig
xtensa                          iss_defconfig
openrisc                    or1ksim_defconfig
sh                          kfr2r09_defconfig
powerpc                 linkstation_defconfig
mips                         bigsur_defconfig
mips                        maltaup_defconfig
arc                        nsim_700_defconfig
arm                             mxs_defconfig
powerpc                  iss476-smp_defconfig
arm                         bcm2835_defconfig
m68k                          atari_defconfig
sh                   secureedge5410_defconfig
sh                           se7721_defconfig
mips                         rt305x_defconfig
mips                        omega2p_defconfig
ia64                        generic_defconfig
arm                       aspeed_g5_defconfig
riscv                    nommu_virt_defconfig
xtensa                  audio_kc705_defconfig
alpha                               defconfig
s390                             alldefconfig
sh                      rts7751r2d1_defconfig
openrisc                         alldefconfig
m68k                        mvme16x_defconfig
powerpc                     ep8248e_defconfig
powerpc                      arches_defconfig
riscv                               defconfig
h8300                            allyesconfig
arm                        neponset_defconfig
powerpc                     stx_gp3_defconfig
arm                           viper_defconfig
mips                         cobalt_defconfig
sh                        edosk7705_defconfig
x86_64               randconfig-c001-20210913
arm                  randconfig-c002-20210913
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
alpha                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
s390                                defconfig
parisc                           allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64               randconfig-a002-20210913
x86_64               randconfig-a003-20210913
x86_64               randconfig-a006-20210913
x86_64               randconfig-a004-20210913
x86_64               randconfig-a005-20210913
x86_64               randconfig-a001-20210913
i386                 randconfig-a004-20210913
i386                 randconfig-a005-20210913
i386                 randconfig-a002-20210913
i386                 randconfig-a006-20210913
i386                 randconfig-a003-20210913
i386                 randconfig-a001-20210913
arc                  randconfig-r043-20210913
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
riscv                randconfig-c006-20210913
x86_64               randconfig-c007-20210913
mips                 randconfig-c004-20210913
powerpc              randconfig-c003-20210913
i386                 randconfig-c001-20210913
arm                  randconfig-c002-20210913
s390                 randconfig-c005-20210913
x86_64               randconfig-a016-20210913
x86_64               randconfig-a013-20210913
x86_64               randconfig-a012-20210913
x86_64               randconfig-a011-20210913
x86_64               randconfig-a014-20210913
x86_64               randconfig-a015-20210913
i386                 randconfig-a016-20210913
i386                 randconfig-a011-20210913
i386                 randconfig-a015-20210913
i386                 randconfig-a012-20210913
i386                 randconfig-a013-20210913
i386                 randconfig-a014-20210913
riscv                randconfig-r042-20210913
hexagon              randconfig-r045-20210913
s390                 randconfig-r044-20210913
hexagon              randconfig-r041-20210913

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
