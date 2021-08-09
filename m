Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 179D03E4D4E
	for <lists+intel-gvt-dev@lfdr.de>; Mon,  9 Aug 2021 21:48:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B223E89CBC;
	Mon,  9 Aug 2021 19:48:23 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5859E89D79
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  9 Aug 2021 19:48:22 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10070"; a="201937169"
X-IronPort-AV: E=Sophos;i="5.84,308,1620716400"; d="scan'208";a="201937169"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2021 12:48:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,308,1620716400"; d="scan'208";a="444681133"
Received: from lkp-server01.sh.intel.com (HELO d053b881505b) ([10.239.97.150])
 by fmsmga007.fm.intel.com with ESMTP; 09 Aug 2021 12:48:19 -0700
Received: from kbuild by d053b881505b with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mDBFz-000JqW-0c; Mon, 09 Aug 2021 19:48:19 +0000
Date: Tue, 10 Aug 2021 03:47:23 +0800
From: kernel test robot <lkp@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: intel-gvt-dev@lists.freedesktop.org, terrence.xu@intel.com,
 zhenyu.z.wang@intel.com
Subject: [intel-gvt-linux:gvt-fixes] BUILD SUCCESS
 699aa57b35672c3b2f230e2b7e5d0ab8c2bde80a
Message-ID: <6111864b.WHmRwW++708NN9d0%lkp@intel.com>
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
branch HEAD: 699aa57b35672c3b2f230e2b7e5d0ab8c2bde80a  drm/i915/gvt: Fix cached atomics setting for Windows VM

elapsed time: 722m

configs tested: 158
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                           ip27_defconfig
arm                      tct_hammer_defconfig
powerpc                         wii_defconfig
openrisc                    or1ksim_defconfig
arm                         nhk8815_defconfig
nds32                             allnoconfig
m68k                       m5208evb_defconfig
arc                         haps_hs_defconfig
riscv                            alldefconfig
arm                       netwinder_defconfig
powerpc                     ksi8560_defconfig
powerpc                 mpc8272_ads_defconfig
powerpc                      obs600_defconfig
arm                       aspeed_g5_defconfig
m68k                         amcore_defconfig
powerpc                      ppc64e_defconfig
powerpc                   microwatt_defconfig
h8300                     edosk2674_defconfig
sh                          r7785rp_defconfig
sh                        edosk7705_defconfig
arm                       mainstone_defconfig
m68k                       m5475evb_defconfig
powerpc                      ppc44x_defconfig
arm                         lpc18xx_defconfig
powerpc                     taishan_defconfig
arm                        keystone_defconfig
x86_64                            allnoconfig
sh                     sh7710voipgw_defconfig
arm                    vt8500_v6_v7_defconfig
m68k                            q40_defconfig
sh                         apsh4a3a_defconfig
sh                          sdk7786_defconfig
arm                          lpd270_defconfig
arc                          axs103_defconfig
powerpc                      tqm8xx_defconfig
arm                        clps711x_defconfig
mips                      malta_kvm_defconfig
powerpc                     skiroot_defconfig
powerpc                     kmeter1_defconfig
mips                        jmr3927_defconfig
m68k                       bvme6000_defconfig
arc                              allyesconfig
powerpc                    klondike_defconfig
i386                                defconfig
sh                           se7343_defconfig
powerpc                     tqm8541_defconfig
mips                       capcella_defconfig
arm                      pxa255-idp_defconfig
sh                          rsk7201_defconfig
mips                     cu1830-neo_defconfig
sh                          sdk7780_defconfig
mips                       bmips_be_defconfig
mips                  decstation_64_defconfig
powerpc                     stx_gp3_defconfig
powerpc                 mpc837x_rdb_defconfig
sh                          landisk_defconfig
powerpc                 mpc8560_ads_defconfig
arm                      jornada720_defconfig
mips                         tb0287_defconfig
powerpc                      ep88xc_defconfig
powerpc64                           defconfig
m68k                        stmark2_defconfig
powerpc                 mpc85xx_cds_defconfig
sh                          urquell_defconfig
mips                     loongson1b_defconfig
mips                     loongson1c_defconfig
powerpc                       holly_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
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
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a004-20210809
i386                 randconfig-a005-20210809
i386                 randconfig-a006-20210809
i386                 randconfig-a002-20210809
i386                 randconfig-a001-20210809
i386                 randconfig-a003-20210809
i386                 randconfig-a004-20210808
i386                 randconfig-a005-20210808
i386                 randconfig-a006-20210808
i386                 randconfig-a002-20210808
i386                 randconfig-a001-20210808
i386                 randconfig-a003-20210808
x86_64               randconfig-a016-20210808
x86_64               randconfig-a012-20210808
x86_64               randconfig-a013-20210808
x86_64               randconfig-a011-20210808
x86_64               randconfig-a014-20210808
x86_64               randconfig-a015-20210808
i386                 randconfig-a012-20210808
i386                 randconfig-a015-20210808
i386                 randconfig-a011-20210808
i386                 randconfig-a013-20210808
i386                 randconfig-a014-20210808
i386                 randconfig-a016-20210808
i386                 randconfig-a012-20210809
i386                 randconfig-a015-20210809
i386                 randconfig-a011-20210809
i386                 randconfig-a013-20210809
i386                 randconfig-a014-20210809
i386                 randconfig-a016-20210809
x86_64               randconfig-a002-20210809
x86_64               randconfig-a004-20210809
x86_64               randconfig-a006-20210809
x86_64               randconfig-a003-20210809
x86_64               randconfig-a001-20210809
x86_64               randconfig-a005-20210809
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
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
x86_64               randconfig-c001-20210809
x86_64               randconfig-a016-20210809
x86_64               randconfig-a012-20210809
x86_64               randconfig-a013-20210809
x86_64               randconfig-a011-20210809
x86_64               randconfig-a014-20210809
x86_64               randconfig-a015-20210809

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
