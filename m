Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9977123560
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 17 Dec 2019 20:06:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94D626E0D5;
	Tue, 17 Dec 2019 19:06:38 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97E3C6E0D5
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 17 Dec 2019 19:06:37 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Dec 2019 11:06:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,326,1571727600"; d="scan'208";a="266660773"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by FMSMGA003.fm.intel.com with ESMTP; 17 Dec 2019 11:06:34 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1ihIB0-000I4u-6y; Wed, 18 Dec 2019 03:06:34 +0800
Date: Wed, 18 Dec 2019 03:04:51 +0800
From: kbuild test robot <lkp@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: [intel-gvt-linux:gvt-fixes] BUILD SUCCESS
 5e822e44cecec1ea48925630aa31dfac827fd202
Message-ID: <5df926d3.OvKWWQvb8Z5Q9woJ%lkp@intel.com>
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

tree/branch: https://github.com/intel/gvt-linux.git  gvt-fixes
branch HEAD: 5e822e44cecec1ea48925630aa31dfac827fd202  drm/i915/gvt: Fix guest boot warning

elapsed time: 888m

configs tested: 157

The following configs have been built successfully.
More configs may be tested in the coming days.

sh                               allmodconfig
sh                          rsk7269_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                                allnoconfig
sh                            titan_defconfig
riscv                            allmodconfig
riscv                             allnoconfig
riscv                            allyesconfig
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
h8300                     edosk2674_defconfig
h8300                    h8300h-sim_defconfig
h8300                       h8s-sim_defconfig
m68k                             allmodconfig
m68k                       m5475evb_defconfig
m68k                          multi_defconfig
m68k                           sun3_defconfig
c6x                        evmc6678_defconfig
nios2                         10m50_defconfig
nios2                         3c120_defconfig
openrisc                    or1ksim_defconfig
openrisc                 simple_smp_defconfig
xtensa                       common_defconfig
xtensa                          iss_defconfig
c6x                  randconfig-a001-20191217
h8300                randconfig-a001-20191217
nios2                randconfig-a001-20191217
sparc64              randconfig-a001-20191217
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
um                                  defconfig
um                             i386_defconfig
um                           x86_64_defconfig
i386                             alldefconfig
i386                              allnoconfig
i386                             allyesconfig
i386                                defconfig
arc                  randconfig-a001-20191217
arm                  randconfig-a001-20191217
arm64                randconfig-a001-20191217
powerpc              randconfig-a001-20191217
sparc                randconfig-a001-20191217
parisc                            allnoconfig
parisc                            allyesonfig
parisc                         b180_defconfig
parisc                        c3000_defconfig
parisc                              defconfig
c6x                              allyesconfig
arm64                               defconfig
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
sparc                            allyesconfig
sparc                               defconfig
sparc64                          allmodconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                             defconfig
x86_64               randconfig-e001-20191217
x86_64               randconfig-e002-20191217
x86_64               randconfig-e003-20191217
i386                 randconfig-e001-20191217
i386                 randconfig-e002-20191217
i386                 randconfig-e003-20191217
ia64                             alldefconfig
ia64                              allnoconfig
ia64                                defconfig
x86_64               randconfig-g001-20191217
x86_64               randconfig-g002-20191217
x86_64               randconfig-g003-20191217
i386                 randconfig-g001-20191217
i386                 randconfig-g002-20191217
i386                 randconfig-g003-20191217
s390                             alldefconfig
s390                             allmodconfig
s390                              allnoconfig
s390                             allyesconfig
s390                          debug_defconfig
s390                                defconfig
s390                       zfcpdump_defconfig
x86_64               randconfig-f001-20191217
x86_64               randconfig-f002-20191217
x86_64               randconfig-f003-20191217
i386                 randconfig-f001-20191217
i386                 randconfig-f002-20191217
i386                 randconfig-f003-20191217
x86_64               randconfig-h001-20191217
x86_64               randconfig-h002-20191217
x86_64               randconfig-h003-20191217
i386                 randconfig-h001-20191217
i386                 randconfig-h002-20191217
i386                 randconfig-h003-20191217
x86_64                              fedora-25
x86_64                                  kexec
x86_64                                    lkp
x86_64                                   rhel
x86_64                               rhel-7.6
x86_64               randconfig-b001-20191217
x86_64               randconfig-b002-20191217
x86_64               randconfig-b003-20191217
i386                 randconfig-b001-20191217
i386                 randconfig-b002-20191217
i386                 randconfig-b003-20191217
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
x86_64               randconfig-d001-20191217
x86_64               randconfig-d002-20191217
x86_64               randconfig-d003-20191217
i386                 randconfig-d001-20191217
i386                 randconfig-d002-20191217
i386                 randconfig-d003-20191217

---
0-DAY kernel test infrastructure                 Open Source Technology Center
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org Intel Corporation
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
