Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB49309046
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 29 Jan 2021 23:51:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4771E6EC4A;
	Fri, 29 Jan 2021 22:51:30 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA2196EC49
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 29 Jan 2021 22:51:29 +0000 (UTC)
IronPort-SDR: nF169QYkU85l3QugwFfNP/XHnhGKqtIbIw7JZspv9H/u+JHN64PcFhI0P9y7iY5OIent0GNfzW
 aTXvSXigOaOQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9879"; a="265325649"
X-IronPort-AV: E=Sophos;i="5.79,386,1602572400"; d="scan'208";a="265325649"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2021 14:51:29 -0800
IronPort-SDR: oaNDfLOCp6qAAmQXQF9QeGJTOR6PCQJjiwU3SDtwcG5MNyH1B67LY9JgNvggjGEMRRILN0r6M2
 qR/0V/r1ySRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,386,1602572400"; d="scan'208";a="404676995"
Received: from lkp-server02.sh.intel.com (HELO 625d3a354f04) ([10.239.97.151])
 by fmsmga004.fm.intel.com with ESMTP; 29 Jan 2021 14:51:27 -0800
Received: from kbuild by 625d3a354f04 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1l5cbu-00047e-Vf; Fri, 29 Jan 2021 22:51:26 +0000
Date: Sat, 30 Jan 2021 06:50:37 +0800
From: kernel test robot <lkp@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: [intel-gvt-linux:gvt-next-fixes] BUILD SUCCESS
 f0cabe0baf85031a75334063ba09371d9ad1241a
Message-ID: <6014913d.aXzXlx2WJggf4xi6%lkp@intel.com>
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
branch HEAD: f0cabe0baf85031a75334063ba09371d9ad1241a  drm/i915/gvt: Purge dev_priv->gt

elapsed time: 720m

configs tested: 132
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                         socfpga_defconfig
m68k                           sun3_defconfig
ia64                      gensparse_defconfig
powerpc                           allnoconfig
mips                           gcw0_defconfig
mips                         tb0219_defconfig
s390                             allyesconfig
arm                       netwinder_defconfig
mips                          ath25_defconfig
ia64                            zx1_defconfig
powerpc                      chrp32_defconfig
mips                     loongson1c_defconfig
sh                   secureedge5410_defconfig
powerpc                     sbc8548_defconfig
arm                   milbeaut_m10v_defconfig
ia64                             allmodconfig
powerpc                    adder875_defconfig
mips                           mtx1_defconfig
powerpc                      cm5200_defconfig
mips                       capcella_defconfig
mips                malta_kvm_guest_defconfig
mips                      fuloong2e_defconfig
mips                         bigsur_defconfig
m68k                        mvme16x_defconfig
arm                         s5pv210_defconfig
powerpc                      pmac32_defconfig
powerpc                      ep88xc_defconfig
powerpc64                        alldefconfig
powerpc                 mpc85xx_cds_defconfig
powerpc                      bamboo_defconfig
sparc                       sparc64_defconfig
c6x                        evmc6472_defconfig
arm                      integrator_defconfig
sh                   rts7751r2dplus_defconfig
sh                           se7780_defconfig
mips                        workpad_defconfig
sh                        sh7763rdp_defconfig
arm                        realview_defconfig
sparc64                          alldefconfig
arm                         orion5x_defconfig
powerpc                          allyesconfig
powerpc               mpc834x_itxgp_defconfig
arc                         haps_hs_defconfig
powerpc                     ep8248e_defconfig
mips                         mpc30x_defconfig
mips                         db1xxx_defconfig
arm                          ep93xx_defconfig
powerpc                 canyonlands_defconfig
c6x                        evmc6474_defconfig
sh                          polaris_defconfig
sh                ecovec24-romimage_defconfig
mips                      bmips_stb_defconfig
xtensa                    smp_lx200_defconfig
mips                          malta_defconfig
mips                         tb0226_defconfig
powerpc                     powernv_defconfig
m68k                       m5475evb_defconfig
arm                          ixp4xx_defconfig
arm                          collie_defconfig
openrisc                    or1ksim_defconfig
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
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allmodconfig
i386                 randconfig-a001-20210129
i386                 randconfig-a002-20210129
i386                 randconfig-a004-20210129
i386                 randconfig-a005-20210129
i386                 randconfig-a003-20210129
i386                 randconfig-a006-20210129
i386                 randconfig-a013-20210129
i386                 randconfig-a011-20210129
i386                 randconfig-a012-20210129
i386                 randconfig-a016-20210129
i386                 randconfig-a014-20210129
i386                 randconfig-a015-20210129
x86_64               randconfig-a002-20210129
x86_64               randconfig-a003-20210129
x86_64               randconfig-a001-20210129
x86_64               randconfig-a005-20210129
x86_64               randconfig-a006-20210129
x86_64               randconfig-a004-20210129
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
x86_64               randconfig-a012-20210129
x86_64               randconfig-a015-20210129
x86_64               randconfig-a016-20210129
x86_64               randconfig-a011-20210129
x86_64               randconfig-a013-20210129
x86_64               randconfig-a014-20210129

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
