Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4919E3628ED
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 16 Apr 2021 21:52:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E41B16ECDE;
	Fri, 16 Apr 2021 19:51:58 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB9886ECDE
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 16 Apr 2021 19:51:57 +0000 (UTC)
IronPort-SDR: UnCSaQZEhFSLVhE6wf2rslfjjHuriRzFyKnnpJq5/FvNwOwOHLlQOno3J/iUwAXkvlNUKBXqYX
 caeAPVZjVKTw==
X-IronPort-AV: E=McAfee;i="6200,9189,9956"; a="191908355"
X-IronPort-AV: E=Sophos;i="5.82,228,1613462400"; d="scan'208";a="191908355"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2021 12:51:56 -0700
IronPort-SDR: eofAn1TbSz1+0CL/Szm6TdQvDurSvgti5cf3LZqFXNXyF0rN/3kcbeZ08GO56wI4X8bh3+aggz
 0O4+CH9HyweQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,228,1613462400"; d="scan'208";a="384414237"
Received: from lkp-server01.sh.intel.com (HELO a48ff7ddd223) ([10.239.97.150])
 by orsmga006.jf.intel.com with ESMTP; 16 Apr 2021 12:51:54 -0700
Received: from kbuild by a48ff7ddd223 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lXUVO-0000WG-8E; Fri, 16 Apr 2021 19:51:54 +0000
Date: Sat, 17 Apr 2021 03:50:58 +0800
From: kernel test robot <lkp@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: [intel-gvt-linux:gvt-fixes] BUILD SUCCESS
 6b5b2a5bcfe9a250da19bac4ef7cabdc81d154ec
Message-ID: <6079eaa2.g9ABSFyV7+jLSRwb%lkp@intel.com>
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
branch HEAD: 6b5b2a5bcfe9a250da19bac4ef7cabdc81d154ec  drm/i915/gvt: Fix BDW command parser regression

elapsed time: 725m

configs tested: 176
configs skipped: 3

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
arm                         lpc18xx_defconfig
i386                                defconfig
arm                      jornada720_defconfig
arm                           corgi_defconfig
parisc                generic-64bit_defconfig
powerpc                     taishan_defconfig
mips                  decstation_64_defconfig
powerpc                     pq2fads_defconfig
powerpc                 mpc8272_ads_defconfig
powerpc                      cm5200_defconfig
m68k                       bvme6000_defconfig
arm                         palmz72_defconfig
xtensa                          iss_defconfig
powerpc                      ep88xc_defconfig
mips                      pic32mzda_defconfig
arm                        multi_v5_defconfig
m68k                           sun3_defconfig
powerpc               mpc834x_itxgp_defconfig
m68k                        mvme16x_defconfig
mips                          rm200_defconfig
sh                          r7785rp_defconfig
powerpc                 canyonlands_defconfig
sh                        dreamcast_defconfig
sh                           se7750_defconfig
arm                            qcom_defconfig
powerpc                 xes_mpc85xx_defconfig
xtensa                    xip_kc705_defconfig
powerpc                 mpc8560_ads_defconfig
sh                          landisk_defconfig
openrisc                  or1klitex_defconfig
powerpc                          allyesconfig
mips                        jmr3927_defconfig
arm                      footbridge_defconfig
arc                          axs103_defconfig
nios2                         10m50_defconfig
arm                             mxs_defconfig
arm                         lpc32xx_defconfig
arm64                            alldefconfig
sh                           se7712_defconfig
powerpc                      acadia_defconfig
xtensa                       common_defconfig
openrisc                         alldefconfig
arc                            hsdk_defconfig
mips                    maltaup_xpa_defconfig
arm                          pxa910_defconfig
arm                          imote2_defconfig
powerpc                        warp_defconfig
mips                           ip28_defconfig
m68k                       m5475evb_defconfig
powerpc                 mpc832x_mds_defconfig
powerpc                 mpc8315_rdb_defconfig
mips                   sb1250_swarm_defconfig
arc                              allyesconfig
sh                           se7751_defconfig
arm                            pleb_defconfig
arm                        mini2440_defconfig
sparc                       sparc32_defconfig
mips                           ip22_defconfig
powerpc                      pasemi_defconfig
arm                       aspeed_g5_defconfig
riscv                    nommu_virt_defconfig
arm                           tegra_defconfig
nios2                            alldefconfig
powerpc                     powernv_defconfig
powerpc                     kmeter1_defconfig
mips                           gcw0_defconfig
arm                         vf610m4_defconfig
mips                          ath79_defconfig
sh                           se7721_defconfig
powerpc                     rainier_defconfig
powerpc                    gamecube_defconfig
arm                       versatile_defconfig
powerpc                 mpc85xx_cds_defconfig
arm                        spear6xx_defconfig
um                               allyesconfig
mips                            e55_defconfig
m68k                          multi_defconfig
xtensa                         virt_defconfig
mips                            ar7_defconfig
mips                            gpr_defconfig
powerpc64                        alldefconfig
riscv                    nommu_k210_defconfig
arm                          gemini_defconfig
arm                      integrator_defconfig
powerpc                 mpc8540_ads_defconfig
mips                     cu1000-neo_defconfig
powerpc                     sequoia_defconfig
powerpc                     mpc83xx_defconfig
arm                       imx_v4_v5_defconfig
mips                        bcm47xx_defconfig
arc                              alldefconfig
sh                             sh03_defconfig
mips                             allyesconfig
mips                      loongson3_defconfig
m68k                         apollo_defconfig
ia64                         bigsur_defconfig
h8300                               defconfig
h8300                            alldefconfig
arm                            mps2_defconfig
arc                 nsimosci_hs_smp_defconfig
powerpc                       ppc64_defconfig
s390                                defconfig
arm                        spear3xx_defconfig
powerpc                  mpc866_ads_defconfig
sparc                               defconfig
powerpc                      ppc64e_defconfig
powerpc                     tqm8555_defconfig
riscv                             allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
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
i386                             allyesconfig
sparc                            allyesconfig
mips                             allmodconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a003-20210416
i386                 randconfig-a006-20210416
i386                 randconfig-a001-20210416
i386                 randconfig-a005-20210416
i386                 randconfig-a004-20210416
i386                 randconfig-a002-20210416
x86_64               randconfig-a014-20210416
x86_64               randconfig-a015-20210416
x86_64               randconfig-a011-20210416
x86_64               randconfig-a013-20210416
x86_64               randconfig-a012-20210416
x86_64               randconfig-a016-20210416
i386                 randconfig-a015-20210416
i386                 randconfig-a014-20210416
i386                 randconfig-a013-20210416
i386                 randconfig-a012-20210416
i386                 randconfig-a016-20210416
i386                 randconfig-a011-20210416
riscv                               defconfig
riscv                          rv32_defconfig
um                               allmodconfig
um                                allnoconfig
um                                  defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a003-20210416
x86_64               randconfig-a002-20210416
x86_64               randconfig-a005-20210416
x86_64               randconfig-a001-20210416
x86_64               randconfig-a006-20210416
x86_64               randconfig-a004-20210416

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
