Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6E248CD42
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 12 Jan 2022 21:50:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8511910E6D8;
	Wed, 12 Jan 2022 20:50:17 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 172EC10E6D8
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 12 Jan 2022 20:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642020616; x=1673556616;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=ANvBPQoJ7lla7S6m7v+RM3EwF/5EZ0JVztg471i3B6c=;
 b=RPLx0yLfsPWQYiBeos9yUpzDxAnOt+1vj5eFWl0IsVTW1tXJqo0nd35r
 m1NW5UNtXZmsT5UUpNGIDAz6jx3eEcOMNbD0Nlo2x7tdecUAOQ8pi7kU0
 gAs4nFEDG5dTTTpRAO+5qVDV07MY9bPYTwgDFmTifNariG6D4s4jm+ZAv
 k4iCdDAnPbucw+vg11jeHR9Qu7s/5mmG78BXONYnYDNGNm2u9QbpVCKJb
 WGenBVZ0ueMhfynrTowWlAaoWnlRxQa+qktCDJncRd5DUCU/fYu0UFGM/
 ZWIP0ihXtA3Lqc7UNii04+jKSnAVsYwlkATGBoSkoez6jAQBOjwdcGbLs g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10225"; a="223834191"
X-IronPort-AV: E=Sophos;i="5.88,284,1635231600"; d="scan'208";a="223834191"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2022 12:50:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,284,1635231600"; d="scan'208";a="620357820"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by fmsmga002.fm.intel.com with ESMTP; 12 Jan 2022 12:50:14 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1n7kZR-0006Oc-HY; Wed, 12 Jan 2022 20:50:13 +0000
Date: Thu, 13 Jan 2022 04:49:35 +0800
From: kernel test robot <lkp@intel.com>
To: Zhi Wang <zhi.a.wang@intel.com>
Subject: [intel-gvt:gvt-next] BUILD SUCCESS
 3f8bd465a6f083a4112d82c18f4a85c9052d2132
Message-ID: <61df3edf.ms+uIXU/0qktKdY5%lkp@intel.com>
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
branch HEAD: 3f8bd465a6f083a4112d82c18f4a85c9052d2132  drm/i915/gvt: Constify vgpu_types

elapsed time: 730m

configs tested: 156
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
mips                 randconfig-c004-20220112
arm                         cm_x300_defconfig
csky                             alldefconfig
powerpc                      ppc6xx_defconfig
powerpc                         wii_defconfig
arm                           u8500_defconfig
nds32                               defconfig
sh                           se7722_defconfig
mips                            ar7_defconfig
parisc                           allyesconfig
mips                        vocore2_defconfig
sh                          lboxre2_defconfig
sh                          rsk7269_defconfig
sh                          r7780mp_defconfig
arm                         vf610m4_defconfig
powerpc                      mgcoge_defconfig
powerpc                    klondike_defconfig
arm                           stm32_defconfig
powerpc                      bamboo_defconfig
x86_64                              defconfig
powerpc                 mpc834x_itx_defconfig
m68k                       bvme6000_defconfig
sh                        apsh4ad0a_defconfig
sh                              ul2_defconfig
arm                        realview_defconfig
powerpc                       holly_defconfig
powerpc                  storcenter_defconfig
arm                         assabet_defconfig
arm                      footbridge_defconfig
arm                       multi_v4t_defconfig
ia64                             alldefconfig
mips                     decstation_defconfig
powerpc                        warp_defconfig
arm                       omap2plus_defconfig
sparc64                             defconfig
mips                          rb532_defconfig
powerpc                    adder875_defconfig
ia64                                defconfig
sh                     sh7710voipgw_defconfig
arm                      integrator_defconfig
powerpc                  iss476-smp_defconfig
mips                      fuloong2e_defconfig
mips                           jazz_defconfig
arm64                            alldefconfig
m68k                        m5272c3_defconfig
powerpc                 mpc834x_mds_defconfig
microblaze                      mmu_defconfig
sh                           se7721_defconfig
sh                          polaris_defconfig
arm                        mini2440_defconfig
powerpc                     taishan_defconfig
arm                          simpad_defconfig
xtensa                generic_kc705_defconfig
nios2                            allyesconfig
mips                           ip32_defconfig
powerpc                 mpc85xx_cds_defconfig
sh                           se7705_defconfig
xtensa                  nommu_kc705_defconfig
h8300                            alldefconfig
sh                           se7751_defconfig
sh                           se7724_defconfig
mips                     loongson1b_defconfig
powerpc                      cm5200_defconfig
arm                  randconfig-c002-20220112
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
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
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
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
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
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
arm                  randconfig-c002-20220112
x86_64                        randconfig-c007
riscv                randconfig-c006-20220112
powerpc              randconfig-c003-20220112
i386                          randconfig-c001
mips                 randconfig-c004-20220112
powerpc                     akebono_defconfig
mips                   sb1250_swarm_defconfig
arm                         shannon_defconfig
powerpc                 xes_mpc85xx_defconfig
arm                          collie_defconfig
arm                          pcm027_defconfig
arm                     am200epdkit_defconfig
arm                         palmz72_defconfig
arm                          imote2_defconfig
arm                             mxs_defconfig
arm                          pxa168_defconfig
powerpc                  mpc866_ads_defconfig
mips                      pic32mzda_defconfig
mips                        bcm63xx_defconfig
mips                          rm200_defconfig
arm                          ixp4xx_defconfig
hexagon                             defconfig
arm                        spear3xx_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220112
riscv                randconfig-r042-20220112
hexagon              randconfig-r041-20220112

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
