Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75349386D2F
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 18 May 2021 00:48:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14C5E8989A;
	Mon, 17 May 2021 22:48:24 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4BF589291
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 17 May 2021 22:48:17 +0000 (UTC)
IronPort-SDR: cMXMwHk8YVM5d0IOCWoP/8KGhgp3MKZQ1D0JP5+sc2gpy2ehGhJKlGXyesteYtrSppmlX1XIhD
 VfsaKRApknkA==
X-IronPort-AV: E=McAfee;i="6200,9189,9987"; a="197496214"
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; d="scan'208";a="197496214"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2021 15:48:17 -0700
IronPort-SDR: RDj1ETIhp4c51uMSaLg4MoADmVmA39tt2tdSvGAs/dSc27bZvXrg7MybweiqHqMnbJMaIWnt/a
 5rxWyEUhqNiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; d="scan'208";a="432830421"
Received: from lkp-server01.sh.intel.com (HELO ddd90b05c979) ([10.239.97.150])
 by orsmga007.jf.intel.com with ESMTP; 17 May 2021 15:48:14 -0700
Received: from kbuild by ddd90b05c979 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lim22-0001wv-6d; Mon, 17 May 2021 22:48:14 +0000
Date: Tue, 18 May 2021 06:47:21 +0800
From: kernel test robot <lkp@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: [intel-gvt-linux:gvt-staging] BUILD SUCCESS
 73757eeeb492545d1470c524b46dc02735f2125c
Message-ID: <60a2f279.ukbbkjX5d7nCTwZh%lkp@intel.com>
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

tree/branch: https://github.com/intel/gvt-linux.git gvt-staging
branch HEAD: 73757eeeb492545d1470c524b46dc02735f2125c  gvt-staging: 2021y-05m-17d-16h-39m-06s CST integration manifest

elapsed time: 724m

configs tested: 127
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                           stm32_defconfig
mips                        nlm_xlr_defconfig
mips                      loongson3_defconfig
sh                        edosk7705_defconfig
m68k                                defconfig
riscv                    nommu_k210_defconfig
arm                         at91_dt_defconfig
powerpc                     ep8248e_defconfig
m68k                       m5249evb_defconfig
arm                       spear13xx_defconfig
sh                        edosk7760_defconfig
x86_64                           alldefconfig
arc                    vdk_hs38_smp_defconfig
m68k                         amcore_defconfig
arm                        keystone_defconfig
um                                  defconfig
powerpc                      mgcoge_defconfig
arm                        magician_defconfig
m68k                        mvme147_defconfig
arm                        neponset_defconfig
arm                          collie_defconfig
openrisc                  or1klitex_defconfig
um                               allyesconfig
h8300                    h8300h-sim_defconfig
powerpc                        cell_defconfig
ia64                      gensparse_defconfig
xtensa                  cadence_csp_defconfig
arm                     davinci_all_defconfig
mips                  cavium_octeon_defconfig
s390                          debug_defconfig
mips                          ath25_defconfig
sh                          lboxre2_defconfig
arm                           u8500_defconfig
arm                          iop32x_defconfig
powerpc                 mpc85xx_cds_defconfig
powerpc                      chrp32_defconfig
arm                            lart_defconfig
i386                             allyesconfig
powerpc                 mpc8560_ads_defconfig
m68k                       bvme6000_defconfig
arm                          ixp4xx_defconfig
mips                  maltasmvp_eva_defconfig
powerpc                     tqm5200_defconfig
mips                    maltaup_xpa_defconfig
arm                     am200epdkit_defconfig
arm                         vf610m4_defconfig
s390                       zfcpdump_defconfig
arm                            zeus_defconfig
ia64                          tiger_defconfig
csky                             alldefconfig
xtensa                       common_defconfig
arc                                 defconfig
arm                            qcom_defconfig
arc                 nsimosci_hs_smp_defconfig
sparc64                             defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a003-20210517
i386                 randconfig-a001-20210517
i386                 randconfig-a004-20210517
i386                 randconfig-a005-20210517
i386                 randconfig-a006-20210517
x86_64               randconfig-a012-20210517
x86_64               randconfig-a015-20210517
x86_64               randconfig-a011-20210517
x86_64               randconfig-a013-20210517
x86_64               randconfig-a016-20210517
x86_64               randconfig-a014-20210517
i386                 randconfig-a016-20210517
i386                 randconfig-a014-20210517
i386                 randconfig-a011-20210517
i386                 randconfig-a012-20210517
i386                 randconfig-a015-20210517
i386                 randconfig-a013-20210517
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                               allmodconfig
um                                allnoconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a004-20210517
x86_64               randconfig-a003-20210517
x86_64               randconfig-a001-20210517
x86_64               randconfig-a005-20210517
x86_64               randconfig-a002-20210517
x86_64               randconfig-a006-20210517

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
