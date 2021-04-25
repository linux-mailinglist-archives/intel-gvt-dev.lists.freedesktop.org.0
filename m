Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5F136A901
	for <lists+intel-gvt-dev@lfdr.de>; Sun, 25 Apr 2021 21:26:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E9A189DC2;
	Sun, 25 Apr 2021 19:26:47 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A42989DC2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sun, 25 Apr 2021 19:26:45 +0000 (UTC)
IronPort-SDR: C9sJn+hFfdaLsKQ4ohp6/sQ0n00prkiOuO3CPWpaFtmBojovIU0WfrLuFcwT90hb/zPN4m9uBg
 fgmKh9Zf9oQQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9965"; a="195805311"
X-IronPort-AV: E=Sophos;i="5.82,250,1613462400"; d="scan'208";a="195805311"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2021 12:26:43 -0700
IronPort-SDR: NilNPMclQ1YfuxcP+6B1i2bTAJkzhHsJ2tGrll8UF4T4SIVhutP89B05JYg7H1S/ig+VmL+mF2
 QxvrsgO14axg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,250,1613462400"; d="scan'208";a="402686571"
Received: from lkp-server01.sh.intel.com (HELO a48ff7ddd223) ([10.239.97.150])
 by orsmga002.jf.intel.com with ESMTP; 25 Apr 2021 12:26:41 -0700
Received: from kbuild by a48ff7ddd223 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lakOu-0005g4-GP; Sun, 25 Apr 2021 19:26:40 +0000
Date: Mon, 26 Apr 2021 03:25:49 +0800
From: kernel test robot <lkp@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: [intel-gvt-linux:gvt-staging] BUILD SUCCESS
 1f4f060f8832498d66c24f07b051ba8b47f5f436
Message-ID: <6085c23d.8kuSEQugNDFdXuAZ%lkp@intel.com>
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
branch HEAD: 1f4f060f8832498d66c24f07b051ba8b47f5f436  gvt-staging: 2021y-04m-25d-13h-59m-32s CST integration manifest

elapsed time: 726m

configs tested: 96
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
i386                             allyesconfig
riscv                            allyesconfig
arm                     davinci_all_defconfig
sh                           se7722_defconfig
powerpc                     sequoia_defconfig
mips                        bcm47xx_defconfig
xtensa                           alldefconfig
arm                        clps711x_defconfig
arm                         assabet_defconfig
arc                        nsimosci_defconfig
arm                      jornada720_defconfig
mips                         rt305x_defconfig
sh                           se7206_defconfig
powerpc               mpc834x_itxgp_defconfig
um                               allyesconfig
powerpc                 mpc837x_mds_defconfig
mips                      bmips_stb_defconfig
arm                        mini2440_defconfig
powerpc                        warp_defconfig
powerpc                   currituck_defconfig
powerpc                mpc7448_hpc2_defconfig
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
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a005-20210425
i386                 randconfig-a002-20210425
i386                 randconfig-a001-20210425
i386                 randconfig-a006-20210425
i386                 randconfig-a004-20210425
i386                 randconfig-a003-20210425
x86_64               randconfig-a004-20210425
x86_64               randconfig-a002-20210425
x86_64               randconfig-a001-20210425
x86_64               randconfig-a006-20210425
x86_64               randconfig-a005-20210425
x86_64               randconfig-a003-20210425
i386                 randconfig-a012-20210425
i386                 randconfig-a014-20210425
i386                 randconfig-a011-20210425
i386                 randconfig-a013-20210425
i386                 randconfig-a015-20210425
i386                 randconfig-a016-20210425
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                               allmodconfig
um                                allnoconfig
um                                  defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a015-20210425
x86_64               randconfig-a016-20210425
x86_64               randconfig-a011-20210425
x86_64               randconfig-a014-20210425
x86_64               randconfig-a013-20210425
x86_64               randconfig-a012-20210425

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
