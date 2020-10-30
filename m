Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F11E2A0CBE
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 30 Oct 2020 18:47:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 234076E9E0;
	Fri, 30 Oct 2020 17:47:13 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 902776E9E0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 30 Oct 2020 17:47:11 +0000 (UTC)
IronPort-SDR: IiqrxzdJZR2Tu7+tbrnlIq7Ik0Kmukghr1K+1QlZUfG03W5TEj+53SgvzJHxK3xjzW2WUpGyFM
 nX57W8v5cyFg==
X-IronPort-AV: E=McAfee;i="6000,8403,9790"; a="155618518"
X-IronPort-AV: E=Sophos;i="5.77,434,1596524400"; d="scan'208";a="155618518"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2020 10:47:10 -0700
IronPort-SDR: IgGCxdpYrr5TKZ4d9/Hv2lAzedANndyGpNEwcuOhqkOSHmCFd1IRJGJjNxCoyNtrtF32NzBCCx
 m2VEc3189WMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,434,1596524400"; d="scan'208";a="361916421"
Received: from lkp-server02.sh.intel.com (HELO fcc9f8859912) ([10.239.97.151])
 by FMSMGA003.fm.intel.com with ESMTP; 30 Oct 2020 10:47:09 -0700
Received: from kbuild by fcc9f8859912 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kYYUW-0000FZ-9F; Fri, 30 Oct 2020 17:47:08 +0000
Date: Sat, 31 Oct 2020 01:46:22 +0800
From: kernel test robot <lkp@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: [intel-gvt-linux:gvt-staging] BUILD SUCCESS
 8bd48349d3e80d279796e9e3b489aee7fb5f539b
Message-ID: <5f9c516e.lb/WLwBijgHBPyYt%lkp@intel.com>
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
branch HEAD: 8bd48349d3e80d279796e9e3b489aee7fb5f539b  gvt-staging: 2020y-10m-30d-13h-43m-20s CST integration manifest

elapsed time: 720m

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
sh                          rsk7203_defconfig
powerpc                 mpc832x_rdb_defconfig
mips                        omega2p_defconfig
powerpc                     pseries_defconfig
arc                        nsim_700_defconfig
microblaze                          defconfig
powerpc                      pasemi_defconfig
arc                         haps_hs_defconfig
arm                            pleb_defconfig
sh                        apsh4ad0a_defconfig
xtensa                  nommu_kc705_defconfig
arm                         hackkit_defconfig
openrisc                            defconfig
arm                            hisi_defconfig
h8300                               defconfig
powerpc                     stx_gp3_defconfig
arm                              alldefconfig
sh                      rts7751r2d1_defconfig
powerpc                     tqm8555_defconfig
arm                     am200epdkit_defconfig
arm                          badge4_defconfig
arm                         cm_x300_defconfig
m68k                         amcore_defconfig
xtensa                  audio_kc705_defconfig
sh                            shmin_defconfig
ia64                            zx1_defconfig
mips                        bcm63xx_defconfig
mips                        qi_lb60_defconfig
sh                              ul2_defconfig
um                            kunit_defconfig
openrisc                    or1ksim_defconfig
arm                           corgi_defconfig
sh                          kfr2r09_defconfig
arm                      tct_hammer_defconfig
powerpc                     sequoia_defconfig
mips                      maltaaprp_defconfig
powerpc                        warp_defconfig
sh                     sh7710voipgw_defconfig
mips                 decstation_r4k_defconfig
powerpc                 mpc8315_rdb_defconfig
arm                    vt8500_v6_v7_defconfig
arm                           spitz_defconfig
arm                            u300_defconfig
powerpc                     ppa8548_defconfig
arm                        clps711x_defconfig
powerpc                      cm5200_defconfig
mips                           rs90_defconfig
arm                        neponset_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
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
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a005-20201030
i386                 randconfig-a003-20201030
i386                 randconfig-a002-20201030
i386                 randconfig-a001-20201030
i386                 randconfig-a006-20201030
i386                 randconfig-a004-20201030
x86_64               randconfig-a005-20201030
x86_64               randconfig-a001-20201030
x86_64               randconfig-a002-20201030
x86_64               randconfig-a003-20201030
x86_64               randconfig-a006-20201030
x86_64               randconfig-a004-20201030
i386                 randconfig-a011-20201030
i386                 randconfig-a014-20201030
i386                 randconfig-a015-20201030
i386                 randconfig-a012-20201030
i386                 randconfig-a013-20201030
i386                 randconfig-a016-20201030
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
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a013-20201030
x86_64               randconfig-a014-20201030
x86_64               randconfig-a015-20201030
x86_64               randconfig-a016-20201030
x86_64               randconfig-a011-20201030
x86_64               randconfig-a012-20201030

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
