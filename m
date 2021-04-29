Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C241A36F1FE
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 29 Apr 2021 23:26:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EEC46F4D3;
	Thu, 29 Apr 2021 21:26:01 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FC386F4CF
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 29 Apr 2021 21:26:00 +0000 (UTC)
IronPort-SDR: iee6XpIPfPRSWQcjFv8ieKX3E72c6lbfNfGHeI1meHdk0sIP8oD9c8gduU2UycUrWcdFME2+Cq
 bv1mVZAC1QSQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9969"; a="258404623"
X-IronPort-AV: E=Sophos;i="5.82,260,1613462400"; d="scan'208";a="258404623"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2021 14:25:59 -0700
IronPort-SDR: XBnPdMH6/rCBPBZksGiiR4ijx4NACDlz9STpnqHDPRn7OQWAdTeaE2Nck8gFpKoNmgwzQtFJrH
 cVrvVL6S9rtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,260,1613462400"; d="scan'208";a="426174567"
Received: from lkp-server01.sh.intel.com (HELO a48ff7ddd223) ([10.239.97.150])
 by orsmga007.jf.intel.com with ESMTP; 29 Apr 2021 14:25:57 -0700
Received: from kbuild by a48ff7ddd223 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lcEAW-0007oS-NR; Thu, 29 Apr 2021 21:25:56 +0000
Date: Fri, 30 Apr 2021 05:25:22 +0800
From: kernel test robot <lkp@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: [intel-gvt-linux:gvt-next-fixes] BUILD SUCCESS
 d385c16173f28a18866abf54c764200c276dace0
Message-ID: <608b2442.nu+8ZmDNlPtH2TPO%lkp@intel.com>
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

tree/branch: https://github.com/intel/gvt-linux.git gvt-next-fixes
branch HEAD: d385c16173f28a18866abf54c764200c276dace0  drm/i915/gvt: Prevent divided by zero when calculating refresh rate

elapsed time: 721m

configs tested: 144
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
x86_64                           allyesconfig
riscv                            allmodconfig
riscv                            allyesconfig
i386                             allyesconfig
powerpc                 mpc836x_rdk_defconfig
powerpc                    sam440ep_defconfig
arm                       aspeed_g5_defconfig
arm                        multi_v5_defconfig
xtensa                              defconfig
mips                      maltasmvp_defconfig
mips                           gcw0_defconfig
powerpc                     pq2fads_defconfig
sh                             espt_defconfig
mips                            gpr_defconfig
arm                         s3c2410_defconfig
s390                          debug_defconfig
arm                         assabet_defconfig
m68k                        m5272c3_defconfig
arm                        clps711x_defconfig
openrisc                  or1klitex_defconfig
sh                   sh7770_generic_defconfig
powerpc                        warp_defconfig
sh                         ecovec24_defconfig
powerpc                     kilauea_defconfig
powerpc                          g5_defconfig
powerpc                      bamboo_defconfig
m68k                        mvme147_defconfig
powerpc                mpc7448_hpc2_defconfig
arm                          moxart_defconfig
arm                     eseries_pxa_defconfig
mips                       capcella_defconfig
mips                           ip27_defconfig
powerpc                      arches_defconfig
arm                       netwinder_defconfig
sh                        apsh4ad0a_defconfig
arm                             ezx_defconfig
sh                           sh2007_defconfig
sh                           se7343_defconfig
mips                      loongson3_defconfig
parisc                           allyesconfig
powerpc                 mpc836x_mds_defconfig
parisc                              defconfig
powerpc                   lite5200b_defconfig
powerpc                      ppc64e_defconfig
mips                  cavium_octeon_defconfig
sh                           se7750_defconfig
powerpc                 mpc8560_ads_defconfig
parisc                generic-64bit_defconfig
x86_64                           alldefconfig
s390                                defconfig
arm                         axm55xx_defconfig
arm                         s3c6400_defconfig
arm                           h3600_defconfig
sparc                            allyesconfig
m68k                           sun3_defconfig
powerpc                     tqm8541_defconfig
riscv                            alldefconfig
powerpc                      katmai_defconfig
mips                        bcm47xx_defconfig
powerpc                     ppa8548_defconfig
arm                     davinci_all_defconfig
xtensa                       common_defconfig
powerpc                 mpc832x_rdb_defconfig
powerpc                 linkstation_defconfig
arm                        spear6xx_defconfig
sh                          sdk7780_defconfig
powerpc                      ppc40x_defconfig
arm                        trizeps4_defconfig
mips                         db1xxx_defconfig
arm                             rpc_defconfig
riscv                    nommu_virt_defconfig
xtensa                  audio_kc705_defconfig
xtensa                          iss_defconfig
riscv                             allnoconfig
sh                         apsh4a3a_defconfig
h8300                            alldefconfig
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
s390                             allyesconfig
s390                             allmodconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20210429
x86_64               randconfig-a002-20210429
x86_64               randconfig-a005-20210429
x86_64               randconfig-a006-20210429
x86_64               randconfig-a001-20210429
x86_64               randconfig-a003-20210429
i386                 randconfig-a005-20210429
i386                 randconfig-a002-20210429
i386                 randconfig-a001-20210429
i386                 randconfig-a006-20210429
i386                 randconfig-a003-20210429
i386                 randconfig-a004-20210429
i386                 randconfig-a012-20210429
i386                 randconfig-a014-20210429
i386                 randconfig-a013-20210429
i386                 randconfig-a011-20210429
i386                 randconfig-a015-20210429
i386                 randconfig-a016-20210429
riscv                    nommu_k210_defconfig
riscv                               defconfig
riscv                          rv32_defconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec
x86_64                    rhel-8.3-kselftests

clang tested configs:
x86_64               randconfig-a015-20210429
x86_64               randconfig-a016-20210429
x86_64               randconfig-a011-20210429
x86_64               randconfig-a014-20210429
x86_64               randconfig-a013-20210429
x86_64               randconfig-a012-20210429

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
