Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A2E2E0D11
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 22 Dec 2020 17:07:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1D466E3FE;
	Tue, 22 Dec 2020 16:07:00 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DF766E3FE
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 22 Dec 2020 16:06:59 +0000 (UTC)
IronPort-SDR: C08ho5nvG7kfOqE9VHGUiV3AwecD82v1p8esKu25bykG96CxA0EH9kKcu/6bv+vDyETIuwraKv
 VWSYLSm9oP8w==
X-IronPort-AV: E=McAfee;i="6000,8403,9842"; a="155099494"
X-IronPort-AV: E=Sophos;i="5.78,439,1599548400"; d="scan'208";a="155099494"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2020 08:06:58 -0800
IronPort-SDR: pg0VZptM/A6LzsqOWLKq0ojLClsHyCoV0GHMBmZZG5f+TjX5kDYWnWhtQFB0yxACuayNEVOeIK
 A2GJ9op4Lg6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,439,1599548400"; d="scan'208";a="492273086"
Received: from lkp-server01.sh.intel.com (HELO 65587561063d) ([10.239.97.150])
 by orsmga004.jf.intel.com with ESMTP; 22 Dec 2020 08:06:56 -0800
Received: from kbuild by 65587561063d with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1krkBc-0001fw-5W; Tue, 22 Dec 2020 16:06:56 +0000
Date: Wed, 23 Dec 2020 00:06:06 +0800
From: kernel test robot <lkp@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: [intel-gvt-linux:gvt-next-fixes] BUILD SUCCESS
 e056f669dbf76b8752b6cb0b8edd2f75cbdcabb1
Message-ID: <5fe2196e.oNNER/AXWaP3SKJK%lkp@intel.com>
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

tree/branch: https://github.com/intel/gvt-linux.git  gvt-next-fixes
branch HEAD: e056f669dbf76b8752b6cb0b8edd2f75cbdcabb1  drm/i915/gvt: make mpt.h self-contained

elapsed time: 722m

configs tested: 122
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
m68k                          amiga_defconfig
sh                            titan_defconfig
mips                       bmips_be_defconfig
arm                           h5000_defconfig
mips                           ip22_defconfig
powerpc                 mpc837x_rdb_defconfig
arm                        clps711x_defconfig
arm                         s3c6400_defconfig
sh                         microdev_defconfig
ia64                          tiger_defconfig
powerpc                      pmac32_defconfig
powerpc                      ep88xc_defconfig
parisc                           alldefconfig
mips                      malta_kvm_defconfig
mips                  decstation_64_defconfig
riscv                          rv32_defconfig
sh                   sh7724_generic_defconfig
c6x                                 defconfig
xtensa                  audio_kc705_defconfig
mips                        nlm_xlr_defconfig
arm                        neponset_defconfig
powerpc                 mpc85xx_cds_defconfig
s390                       zfcpdump_defconfig
mips                     cu1830-neo_defconfig
powerpc                      mgcoge_defconfig
sh                         apsh4a3a_defconfig
powerpc                     pseries_defconfig
alpha                               defconfig
h8300                     edosk2674_defconfig
arc                                 defconfig
openrisc                 simple_smp_defconfig
powerpc                     kilauea_defconfig
xtensa                  nommu_kc705_defconfig
mips                  cavium_octeon_defconfig
mips                     loongson1c_defconfig
um                             i386_defconfig
powerpc                     tqm8540_defconfig
arm                           viper_defconfig
nds32                            alldefconfig
sh                           se7751_defconfig
mips                malta_qemu_32r6_defconfig
powerpc                     kmeter1_defconfig
powerpc                     ppa8548_defconfig
powerpc                   motionpro_defconfig
nios2                         10m50_defconfig
mips                         bigsur_defconfig
arm                         s5pv210_defconfig
sh                          rsk7201_defconfig
arm                          imote2_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
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
x86_64               randconfig-a001-20201222
x86_64               randconfig-a006-20201222
x86_64               randconfig-a002-20201222
x86_64               randconfig-a004-20201222
x86_64               randconfig-a003-20201222
x86_64               randconfig-a005-20201222

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
