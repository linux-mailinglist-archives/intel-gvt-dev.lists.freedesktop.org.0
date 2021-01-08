Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CFE2EF78C
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  8 Jan 2021 19:41:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 447166E890;
	Fri,  8 Jan 2021 18:41:11 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7F926E890
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  8 Jan 2021 18:41:09 +0000 (UTC)
IronPort-SDR: 94JSu0UF7WF83mDQhdPkikj32kn52hBPor53ueoNgXH6yBPQfTAvhf1JNgKcfp4IsRp+aBtcVF
 RJOXz5fcK+XQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9858"; a="156824953"
X-IronPort-AV: E=Sophos;i="5.79,332,1602572400"; d="scan'208";a="156824953"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2021 10:41:09 -0800
IronPort-SDR: pmB/85GRPThwEPeNgArWssxnooJJyzs/j2eCuZFn1D6bptqx6EraK6zrqmC6NV140c42iMfzfi
 NC16uuzORwcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,332,1602572400"; d="scan'208";a="388261349"
Received: from lkp-server01.sh.intel.com (HELO 412602b27703) ([10.239.97.150])
 by orsmga007.jf.intel.com with ESMTP; 08 Jan 2021 10:41:07 -0800
Received: from kbuild by 412602b27703 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kxwh8-0000bg-Rs; Fri, 08 Jan 2021 18:41:06 +0000
Date: Sat, 09 Jan 2021 02:40:39 +0800
From: kernel test robot <lkp@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: [intel-gvt-linux:gvt-fixes] BUILD SUCCESS
 4ceb06e7c336f4a8d3f3b6ac9a4fea2e9c97dc07
Message-ID: <5ff8a727.anYEfxe6RYYE317i%lkp@intel.com>
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

tree/branch: https://github.com/intel/gvt-linux.git  gvt-fixes
branch HEAD: 4ceb06e7c336f4a8d3f3b6ac9a4fea2e9c97dc07  drm/i915/gvt: Fix vfio_edid issue for BXT/APL

elapsed time: 1000m

configs tested: 149
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                            allyesconfig
arm64                               defconfig
arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
nios2                            alldefconfig
c6x                         dsk6455_defconfig
arm                        mini2440_defconfig
mips                          rb532_defconfig
mips                       rbtx49xx_defconfig
nios2                            allyesconfig
powerpc                    mvme5100_defconfig
mips                          ath25_defconfig
sh                             shx3_defconfig
m68k                          multi_defconfig
sh                          lboxre2_defconfig
arc                     haps_hs_smp_defconfig
um                           x86_64_defconfig
sparc64                          alldefconfig
arm                        oxnas_v6_defconfig
sh                           se7721_defconfig
arm                       imx_v4_v5_defconfig
sh                         ap325rxa_defconfig
m68k                         amcore_defconfig
ia64                             alldefconfig
sh                        sh7785lcr_defconfig
powerpc                      pcm030_defconfig
powerpc                 mpc832x_rdb_defconfig
m68k                          amiga_defconfig
m68k                       bvme6000_defconfig
xtensa                          iss_defconfig
powerpc                      makalu_defconfig
nds32                            alldefconfig
sh                         microdev_defconfig
powerpc                      arches_defconfig
powerpc                mpc7448_hpc2_defconfig
mips                        workpad_defconfig
mips                        omega2p_defconfig
sh                            titan_defconfig
powerpc                      ppc64e_defconfig
sh                        dreamcast_defconfig
powerpc                           allnoconfig
powerpc                 xes_mpc85xx_defconfig
mips                          rm200_defconfig
powerpc                        cell_defconfig
arm                    vt8500_v6_v7_defconfig
arm                         socfpga_defconfig
powerpc                     pseries_defconfig
mips                    maltaup_xpa_defconfig
arm                           tegra_defconfig
sh                           sh2007_defconfig
arm                          pxa3xx_defconfig
riscv                    nommu_virt_defconfig
sh                           se7619_defconfig
mips                           ip22_defconfig
x86_64                              defconfig
ia64                            zx1_defconfig
powerpc                     ppa8548_defconfig
openrisc                    or1ksim_defconfig
nios2                         3c120_defconfig
mips                         bigsur_defconfig
powerpc                  storcenter_defconfig
m68k                        m5272c3_defconfig
sh                         ecovec24_defconfig
sh                           se7724_defconfig
powerpc                      cm5200_defconfig
arm                         lpc32xx_defconfig
ia64                         bigsur_defconfig
arm                     eseries_pxa_defconfig
sh                          r7780mp_defconfig
powerpc                      acadia_defconfig
arc                          axs103_defconfig
arc                          axs101_defconfig
mips                           gcw0_defconfig
mips                      pic32mzda_defconfig
parisc                generic-32bit_defconfig
mips                      pistachio_defconfig
arm                        vexpress_defconfig
mips                            gpr_defconfig
sh                            hp6xx_defconfig
arm                      integrator_defconfig
sh                   rts7751r2dplus_defconfig
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
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
x86_64               randconfig-a004-20210108
x86_64               randconfig-a006-20210108
x86_64               randconfig-a001-20210108
x86_64               randconfig-a002-20210108
x86_64               randconfig-a003-20210108
x86_64               randconfig-a005-20210108
i386                 randconfig-a005-20210108
i386                 randconfig-a002-20210108
i386                 randconfig-a001-20210108
i386                 randconfig-a003-20210108
i386                 randconfig-a006-20210108
i386                 randconfig-a004-20210108
i386                 randconfig-a016-20210108
i386                 randconfig-a011-20210108
i386                 randconfig-a014-20210108
i386                 randconfig-a015-20210108
i386                 randconfig-a013-20210108
i386                 randconfig-a012-20210108
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a013-20210108
x86_64               randconfig-a011-20210108
x86_64               randconfig-a012-20210108
x86_64               randconfig-a016-20210108
x86_64               randconfig-a014-20210108
x86_64               randconfig-a015-20210108

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
