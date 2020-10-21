Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F70D294E3E
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 21 Oct 2020 16:08:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20D316E187;
	Wed, 21 Oct 2020 14:08:17 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 162C46EB97
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 21 Oct 2020 14:08:16 +0000 (UTC)
IronPort-SDR: +eh1HACocIW+nAsswx76buGPjT78IeMA5lP91iB9aXbBJUzfTVbiZ/71fT0TsSc5s26JqpN05y
 WQS8o4luHszw==
X-IronPort-AV: E=McAfee;i="6000,8403,9780"; a="154323296"
X-IronPort-AV: E=Sophos;i="5.77,401,1596524400"; d="scan'208";a="154323296"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2020 07:08:15 -0700
IronPort-SDR: HazeiHIPvF/SH/wFkoxcE7e6M3EkIjdBsxYbaTOfvV90gcbsrfCSKqKq4X4H8FC/ibSKvbsN0y
 Wm8+LUH9V3lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,401,1596524400"; d="scan'208";a="522759360"
Received: from lkp-server02.sh.intel.com (HELO 911c2f167757) ([10.239.97.151])
 by fmsmga006.fm.intel.com with ESMTP; 21 Oct 2020 07:08:13 -0700
Received: from kbuild by 911c2f167757 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kVEmj-00002R-62; Wed, 21 Oct 2020 14:08:13 +0000
Date: Wed, 21 Oct 2020 22:07:27 +0800
From: kernel test robot <lkp@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: [intel-gvt-linux:gvt-staging] BUILD SUCCESS
 29bf11ebaa6be95e125e2dc338a4c76967172d99
Message-ID: <5f90409f.JXsGH3zPsWGj1fag%lkp@intel.com>
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
branch HEAD: 29bf11ebaa6be95e125e2dc338a4c76967172d99  gvt-staging: 2020y-10m-21d-09h-56m-13s CST integration manifest

elapsed time: 723m

configs tested: 99
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                   bluestone_defconfig
sh                          rsk7203_defconfig
arc                 nsimosci_hs_smp_defconfig
sparc                            alldefconfig
m68k                          sun3x_defconfig
powerpc                      chrp32_defconfig
arc                        vdk_hs38_defconfig
powerpc                       ebony_defconfig
arm                           spitz_defconfig
powerpc                 mpc8315_rdb_defconfig
alpha                            alldefconfig
mips                      fuloong2e_defconfig
mips                      pic32mzda_defconfig
arm                         palmz72_defconfig
powerpc                 mpc834x_mds_defconfig
h8300                       h8s-sim_defconfig
arm                       imx_v4_v5_defconfig
arm                        magician_defconfig
powerpc                      ppc40x_defconfig
sh                          lboxre2_defconfig
mips                  cavium_octeon_defconfig
sh                          polaris_defconfig
arm                     am200epdkit_defconfig
mips                        nlm_xlr_defconfig
arm                      integrator_defconfig
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
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a001-20201021
x86_64               randconfig-a002-20201021
x86_64               randconfig-a003-20201021
x86_64               randconfig-a006-20201021
x86_64               randconfig-a005-20201021
x86_64               randconfig-a004-20201021
i386                 randconfig-a002-20201021
i386                 randconfig-a005-20201021
i386                 randconfig-a003-20201021
i386                 randconfig-a001-20201021
i386                 randconfig-a006-20201021
i386                 randconfig-a004-20201021
i386                 randconfig-a016-20201021
i386                 randconfig-a014-20201021
i386                 randconfig-a015-20201021
i386                 randconfig-a013-20201021
i386                 randconfig-a012-20201021
i386                 randconfig-a011-20201021
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
x86_64               randconfig-a011-20201021
x86_64               randconfig-a013-20201021
x86_64               randconfig-a016-20201021
x86_64               randconfig-a015-20201021
x86_64               randconfig-a012-20201021
x86_64               randconfig-a014-20201021

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
