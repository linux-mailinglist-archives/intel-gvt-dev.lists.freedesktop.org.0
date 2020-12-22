Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 262D12E0DDC
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 22 Dec 2020 18:34:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DDDE6E0B7;
	Tue, 22 Dec 2020 17:34:20 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21AF06E0CB
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 22 Dec 2020 17:34:19 +0000 (UTC)
IronPort-SDR: dLKrhGOHk1grNkAF0gMDFmue9XqorMn4p021FLxbLbTNW3MpcsuNzanc1PoisX4gupaCD/RQR4
 +jzaRErH3ssA==
X-IronPort-AV: E=McAfee;i="6000,8403,9843"; a="239984517"
X-IronPort-AV: E=Sophos;i="5.78,439,1599548400"; d="scan'208";a="239984517"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2020 09:34:17 -0800
IronPort-SDR: 0v+Umc4e0//A7G5VKsqthGxc3dmsFDEyS4pcQqk+iFrCzq5KPRCaM0HQFn4Fc1goeb5Gae+lak
 0teXWsG4Sw9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,439,1599548400"; d="scan'208";a="356501744"
Received: from lkp-server01.sh.intel.com (HELO 65587561063d) ([10.239.97.150])
 by orsmga002.jf.intel.com with ESMTP; 22 Dec 2020 09:34:16 -0800
Received: from kbuild by 65587561063d with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1krlY7-0001j0-5V; Tue, 22 Dec 2020 17:34:15 +0000
Date: Wed, 23 Dec 2020 01:33:47 +0800
From: kernel test robot <lkp@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: [intel-gvt-linux:gvt-staging] BUILD SUCCESS
 4da6fbc06704efab2ebf933d02781c1fc845c95d
Message-ID: <5fe22dfb.Ai9bnyuMbh3iGGoY%lkp@intel.com>
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

tree/branch: https://github.com/intel/gvt-linux.git  gvt-staging
branch HEAD: 4da6fbc06704efab2ebf933d02781c1fc845c95d  gvt-staging: 2020y-12m-22d-13h-12m-37s CST integration manifest

elapsed time: 720m

configs tested: 111
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                malta_kvm_guest_defconfig
mips                      fuloong2e_defconfig
arc                    vdk_hs38_smp_defconfig
powerpc                      ppc6xx_defconfig
powerpc                       eiger_defconfig
mips                           gcw0_defconfig
arc                        nsim_700_defconfig
arm                            xcep_defconfig
arm                   milbeaut_m10v_defconfig
arm                            hisi_defconfig
powerpc                        icon_defconfig
arm                             pxa_defconfig
mips                        workpad_defconfig
parisc                              defconfig
mips                      pic32mzda_defconfig
mips                           mtx1_defconfig
arm                        realview_defconfig
sh                   sh7724_generic_defconfig
c6x                                 defconfig
xtensa                  audio_kc705_defconfig
mips                        nlm_xlr_defconfig
arm                        neponset_defconfig
powerpc                 mpc85xx_cds_defconfig
h8300                     edosk2674_defconfig
openrisc                 simple_smp_defconfig
powerpc                     kilauea_defconfig
xtensa                  nommu_kc705_defconfig
xtensa                         virt_defconfig
sparc64                             defconfig
arc                           tb10x_defconfig
sh                          lboxre2_defconfig
nds32                            alldefconfig
sh                           se7751_defconfig
mips                malta_qemu_32r6_defconfig
powerpc                     kmeter1_defconfig
powerpc                     ppa8548_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a001-20201221
x86_64               randconfig-a006-20201221
x86_64               randconfig-a002-20201221
x86_64               randconfig-a004-20201221
x86_64               randconfig-a003-20201221
x86_64               randconfig-a005-20201221
i386                 randconfig-a005-20201222
i386                 randconfig-a002-20201222
i386                 randconfig-a006-20201222
i386                 randconfig-a004-20201222
i386                 randconfig-a003-20201222
i386                 randconfig-a001-20201222
i386                 randconfig-a011-20201221
i386                 randconfig-a016-20201221
i386                 randconfig-a014-20201221
i386                 randconfig-a012-20201221
i386                 randconfig-a015-20201221
i386                 randconfig-a013-20201221
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a015-20201221
x86_64               randconfig-a014-20201221
x86_64               randconfig-a016-20201221
x86_64               randconfig-a012-20201221
x86_64               randconfig-a013-20201221
x86_64               randconfig-a011-20201221

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
