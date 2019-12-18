Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74303123E84
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 18 Dec 2019 05:30:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 908DF89483;
	Wed, 18 Dec 2019 04:30:01 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A84EC89261
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 18 Dec 2019 04:29:59 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Dec 2019 20:29:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,328,1571727600"; d="scan'208";a="390058952"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga005.jf.intel.com with ESMTP; 17 Dec 2019 20:29:57 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1ihQyC-0005QX-U1; Wed, 18 Dec 2019 12:29:56 +0800
Date: Wed, 18 Dec 2019 12:29:14 +0800
From: kbuild test robot <lkp@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: [intel-gvt-linux:gvt-staging] BUILD SUCCESS
 8ebb85eda9f4ac8ea491d808a1604276fbb4b114
Message-ID: <5df9ab1a.Sqc5eyOpde2giEer%lkp@intel.com>
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
Cc: libo.zhu@intel.com, terrence.xu@intel.com,
 intel-gvt-dev@lists.freedesktop.org, zhenyu.z.wang@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

tree/branch: https://github.com/intel/gvt-linux.git  gvt-staging
branch HEAD: 8ebb85eda9f4ac8ea491d808a1604276fbb4b114  gvt-staging: 2019y-12m-17d-11h-21m-31s CST integration manifest

elapsed time: 1453m

configs tested: 167

The following configs have been built successfully.
More configs may be tested in the coming days.

sh                               allmodconfig
sh                          rsk7269_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                                allnoconfig
sh                            titan_defconfig
sparc                            allyesconfig
sparc                               defconfig
sparc64                          allmodconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                             defconfig
nds32                               defconfig
alpha                               defconfig
csky                                defconfig
nds32                             allnoconfig
arc                              allyesconfig
arc                                 defconfig
microblaze                      mmu_defconfig
microblaze                    nommu_defconfig
powerpc                           allnoconfig
powerpc                             defconfig
powerpc                       ppc64_defconfig
powerpc                          rhel-kconfig
x86_64               randconfig-c001-20191217
x86_64               randconfig-c002-20191217
x86_64               randconfig-c003-20191217
i386                 randconfig-c001-20191217
i386                 randconfig-c002-20191217
i386                 randconfig-c003-20191217
h8300                     edosk2674_defconfig
h8300                    h8300h-sim_defconfig
h8300                       h8s-sim_defconfig
m68k                             allmodconfig
m68k                       m5475evb_defconfig
m68k                          multi_defconfig
m68k                           sun3_defconfig
x86_64                              fedora-25
x86_64                                  kexec
x86_64                                    lkp
x86_64                                   rhel
x86_64                               rhel-7.6
arc                  randconfig-a001-20191217
arm                  randconfig-a001-20191217
arm64                randconfig-a001-20191217
powerpc              randconfig-a001-20191217
sparc                randconfig-a001-20191217
x86_64               randconfig-e001-20191217
x86_64               randconfig-e002-20191217
x86_64               randconfig-e003-20191217
i386                 randconfig-e001-20191217
i386                 randconfig-e002-20191217
i386                 randconfig-e003-20191217
arm64                               defconfig
ia64                 randconfig-a001-20191217
x86_64               randconfig-a001-20191217
x86_64               randconfig-a002-20191217
x86_64               randconfig-a003-20191217
i386                 randconfig-a001-20191217
i386                 randconfig-a002-20191217
i386                 randconfig-a003-20191217
arm                              allmodconfig
arm64                            allmodconfig
csky                 randconfig-a001-20191217
openrisc             randconfig-a001-20191217
sh                   randconfig-a001-20191217
i386                             alldefconfig
i386                              allnoconfig
i386                             allyesconfig
i386                                defconfig
riscv                    nommu_virt_defconfig
ia64                             alldefconfig
ia64                              allnoconfig
ia64                                defconfig
alpha                randconfig-a001-20191217
mips                 randconfig-a001-20191217
nds32                randconfig-a001-20191217
parisc               randconfig-a001-20191217
riscv                randconfig-a001-20191217
mips                           32r2_defconfig
mips                         64r6el_defconfig
mips                             allmodconfig
mips                              allnoconfig
mips                             allyesconfig
mips                      fuloong2e_defconfig
mips                      malta_kvm_defconfig
ia64                             allmodconfig
ia64                             allyesconfig
riscv                            allmodconfig
riscv                             allnoconfig
riscv                            allyesconfig
riscv                               defconfig
riscv                          rv32_defconfig
xtensa                       common_defconfig
openrisc                    or1ksim_defconfig
nios2                         3c120_defconfig
xtensa                          iss_defconfig
c6x                        evmc6678_defconfig
c6x                              allyesconfig
nios2                         10m50_defconfig
openrisc                 simple_smp_defconfig
c6x                  randconfig-a001-20191218
h8300                randconfig-a001-20191218
microblaze           randconfig-a001-20191218
nios2                randconfig-a001-20191218
sparc64              randconfig-a001-20191218
x86_64               randconfig-h001-20191217
x86_64               randconfig-h002-20191217
x86_64               randconfig-h003-20191217
i386                 randconfig-h001-20191217
i386                 randconfig-h002-20191217
i386                 randconfig-h003-20191217
x86_64               randconfig-g001-20191217
x86_64               randconfig-g002-20191217
x86_64               randconfig-g003-20191217
i386                 randconfig-g001-20191217
i386                 randconfig-g002-20191217
i386                 randconfig-g003-20191217
um                                  defconfig
um                             i386_defconfig
um                           x86_64_defconfig
arm                               allnoconfig
arm                              allyesconfig
arm                         at91_dt_defconfig
arm                           efm32_defconfig
arm                          exynos_defconfig
arm                        multi_v5_defconfig
arm                        multi_v7_defconfig
arm                        shmobile_defconfig
arm                           sunxi_defconfig
arm64                             allnoconfig
arm64                            allyesconfig
s390                             alldefconfig
s390                             allmodconfig
s390                              allnoconfig
s390                          debug_defconfig
s390                                defconfig
s390                       zfcpdump_defconfig
s390                             allyesconfig
x86_64               randconfig-b001-20191217
x86_64               randconfig-b002-20191217
x86_64               randconfig-b003-20191217
i386                 randconfig-b001-20191217
i386                 randconfig-b002-20191217
i386                 randconfig-b003-20191217
s390                 randconfig-a001-20191217
xtensa               randconfig-a001-20191217
x86_64               randconfig-d001-20191217
x86_64               randconfig-d002-20191217
x86_64               randconfig-d003-20191217
i386                 randconfig-d001-20191217
i386                 randconfig-d002-20191217
i386                 randconfig-d003-20191217
x86_64               randconfig-f001-20191217
x86_64               randconfig-f002-20191217
x86_64               randconfig-f003-20191217
i386                 randconfig-f001-20191217
i386                 randconfig-f002-20191217
i386                 randconfig-f003-20191217
c6x                  randconfig-a001-20191217
h8300                randconfig-a001-20191217
nios2                randconfig-a001-20191217
sparc64              randconfig-a001-20191217
parisc                            allnoconfig
parisc                            allyesonfig
parisc                         b180_defconfig
parisc                        c3000_defconfig
parisc                              defconfig

---
0-DAY kernel test infrastructure                 Open Source Technology Center
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org Intel Corporation
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
