Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 489A6159F23
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 12 Feb 2020 03:37:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BE996E58E;
	Wed, 12 Feb 2020 02:37:55 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 156658855B
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 12 Feb 2020 02:37:54 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Feb 2020 18:37:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,428,1574150400"; d="scan'208";a="313263584"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga001.jf.intel.com with ESMTP; 11 Feb 2020 18:37:51 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1j1huR-000Amc-9S; Wed, 12 Feb 2020 10:37:51 +0800
Date: Wed, 12 Feb 2020 10:37:20 +0800
From: kbuild test robot <lkp@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: [intel-gvt-linux:gvt-fixes] BUILD SUCCESS
 0e9d7bb293f3f9c3ee376b126141407efb265f31
Message-ID: <5e4364e0.z7fMSycPkTITtlEn%lkp@intel.com>
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
branch HEAD: 0e9d7bb293f3f9c3ee376b126141407efb265f31  drm/i915/gvt: more locking for ppgtt mm LRU list

elapsed time: 2894m

configs tested: 298
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                              allmodconfig
arm                               allnoconfig
arm                              allyesconfig
arm                         at91_dt_defconfig
arm                           efm32_defconfig
arm                          exynos_defconfig
arm                        multi_v5_defconfig
arm                        multi_v7_defconfig
arm                        shmobile_defconfig
arm                           sunxi_defconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm64                            allyesconfig
arm64                               defconfig
sparc                            allyesconfig
riscv                               defconfig
m68k                           sun3_defconfig
csky                                defconfig
s390                                defconfig
m68k                             allmodconfig
sh                               allmodconfig
xtensa                       common_defconfig
mips                      fuloong2e_defconfig
s390                       zfcpdump_defconfig
nds32                               defconfig
alpha                               defconfig
arc                                 defconfig
sparc64                             defconfig
sh                          rsk7269_defconfig
riscv                          rv32_defconfig
h8300                     edosk2674_defconfig
parisc                            allnoconfig
ia64                                defconfig
m68k                       m5475evb_defconfig
ia64                             allyesconfig
nios2                         3c120_defconfig
sh                            titan_defconfig
s390                             alldefconfig
xtensa                          iss_defconfig
riscv                             allnoconfig
mips                      malta_kvm_defconfig
s390                          debug_defconfig
i386                             alldefconfig
ia64                              allnoconfig
parisc                              defconfig
s390                              allnoconfig
microblaze                      mmu_defconfig
h8300                       h8s-sim_defconfig
mips                              allnoconfig
um                                  defconfig
sparc64                           allnoconfig
sparc64                          allmodconfig
powerpc                           allnoconfig
nios2                         10m50_defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                                defconfig
ia64                             alldefconfig
ia64                             allmodconfig
c6x                              allyesconfig
c6x                        evmc6678_defconfig
openrisc                    or1ksim_defconfig
openrisc                 simple_smp_defconfig
nds32                             allnoconfig
h8300                    h8300h-sim_defconfig
m68k                          multi_defconfig
arc                              allyesconfig
powerpc                             defconfig
microblaze                    nommu_defconfig
powerpc                       ppc64_defconfig
powerpc                          rhel-kconfig
mips                           32r2_defconfig
mips                         64r6el_defconfig
mips                             allmodconfig
mips                             allyesconfig
parisc                           allyesconfig
parisc                         b180_defconfig
parisc                        c3000_defconfig
x86_64               randconfig-a001-20200212
x86_64               randconfig-a002-20200212
x86_64               randconfig-a003-20200212
i386                 randconfig-a001-20200212
i386                 randconfig-a002-20200212
i386                 randconfig-a003-20200212
x86_64               randconfig-a001-20200210
x86_64               randconfig-a002-20200210
x86_64               randconfig-a003-20200210
i386                 randconfig-a001-20200210
i386                 randconfig-a002-20200210
i386                 randconfig-a003-20200210
x86_64               randconfig-a001-20200211
x86_64               randconfig-a002-20200211
x86_64               randconfig-a003-20200211
i386                 randconfig-a001-20200211
i386                 randconfig-a002-20200211
i386                 randconfig-a003-20200211
riscv                randconfig-a001-20200210
parisc               randconfig-a001-20200210
m68k                 randconfig-a001-20200210
nds32                randconfig-a001-20200210
mips                 randconfig-a001-20200210
alpha                randconfig-a001-20200210
alpha                randconfig-a001-20200211
m68k                 randconfig-a001-20200211
mips                 randconfig-a001-20200211
nds32                randconfig-a001-20200211
parisc               randconfig-a001-20200211
riscv                randconfig-a001-20200211
alpha                randconfig-a001-20200212
m68k                 randconfig-a001-20200212
nds32                randconfig-a001-20200212
parisc               randconfig-a001-20200212
riscv                randconfig-a001-20200212
h8300                randconfig-a001-20200210
nios2                randconfig-a001-20200210
microblaze           randconfig-a001-20200210
sparc64              randconfig-a001-20200210
c6x                  randconfig-a001-20200210
c6x                  randconfig-a001-20200212
h8300                randconfig-a001-20200212
microblaze           randconfig-a001-20200212
nios2                randconfig-a001-20200212
sparc64              randconfig-a001-20200212
c6x                  randconfig-a001-20200211
h8300                randconfig-a001-20200211
microblaze           randconfig-a001-20200211
nios2                randconfig-a001-20200211
sparc64              randconfig-a001-20200211
sh                   randconfig-a001-20200210
s390                 randconfig-a001-20200210
xtensa               randconfig-a001-20200210
openrisc             randconfig-a001-20200210
csky                 randconfig-a001-20200210
csky                 randconfig-a001-20200211
openrisc             randconfig-a001-20200211
s390                 randconfig-a001-20200211
sh                   randconfig-a001-20200211
xtensa               randconfig-a001-20200211
csky                 randconfig-a001-20200212
openrisc             randconfig-a001-20200212
s390                 randconfig-a001-20200212
sh                   randconfig-a001-20200212
xtensa               randconfig-a001-20200212
x86_64               randconfig-b001-20200211
x86_64               randconfig-b002-20200211
x86_64               randconfig-b003-20200211
i386                 randconfig-b001-20200211
i386                 randconfig-b002-20200211
i386                 randconfig-b003-20200211
i386                 randconfig-b002-20200210
i386                 randconfig-b001-20200210
x86_64               randconfig-b001-20200210
x86_64               randconfig-b002-20200210
i386                 randconfig-b003-20200210
x86_64               randconfig-b003-20200210
x86_64               randconfig-b001-20200212
x86_64               randconfig-b002-20200212
x86_64               randconfig-b003-20200212
i386                 randconfig-b001-20200212
i386                 randconfig-b002-20200212
i386                 randconfig-b003-20200212
x86_64               randconfig-c001-20200211
x86_64               randconfig-c002-20200211
x86_64               randconfig-c003-20200211
i386                 randconfig-c001-20200211
i386                 randconfig-c002-20200211
i386                 randconfig-c003-20200211
x86_64               randconfig-c001-20200212
x86_64               randconfig-c002-20200212
x86_64               randconfig-c003-20200212
i386                 randconfig-c001-20200212
i386                 randconfig-c002-20200212
i386                 randconfig-c003-20200212
i386                 randconfig-c001-20200210
i386                 randconfig-c002-20200210
x86_64               randconfig-c003-20200210
x86_64               randconfig-c002-20200210
i386                 randconfig-c003-20200210
x86_64               randconfig-c001-20200210
x86_64               randconfig-d001-20200211
x86_64               randconfig-d002-20200211
x86_64               randconfig-d003-20200211
i386                 randconfig-d001-20200211
i386                 randconfig-d002-20200211
i386                 randconfig-d003-20200211
x86_64               randconfig-d001-20200212
x86_64               randconfig-d002-20200212
x86_64               randconfig-d003-20200212
i386                 randconfig-d001-20200212
i386                 randconfig-d002-20200212
i386                 randconfig-d003-20200212
x86_64               randconfig-d001-20200210
x86_64               randconfig-d002-20200210
x86_64               randconfig-d003-20200210
i386                 randconfig-d001-20200210
i386                 randconfig-d002-20200210
i386                 randconfig-d003-20200210
x86_64               randconfig-e001-20200211
x86_64               randconfig-e002-20200211
x86_64               randconfig-e003-20200211
i386                 randconfig-e001-20200211
i386                 randconfig-e002-20200211
i386                 randconfig-e003-20200211
x86_64               randconfig-e001-20200212
x86_64               randconfig-e002-20200212
x86_64               randconfig-e003-20200212
i386                 randconfig-e001-20200212
i386                 randconfig-e002-20200212
i386                 randconfig-e003-20200212
x86_64               randconfig-e001-20200210
x86_64               randconfig-e002-20200210
x86_64               randconfig-e003-20200210
i386                 randconfig-e001-20200210
i386                 randconfig-e002-20200210
i386                 randconfig-e003-20200210
x86_64               randconfig-f001-20200210
i386                 randconfig-f003-20200210
x86_64               randconfig-f002-20200210
i386                 randconfig-f001-20200210
x86_64               randconfig-f003-20200210
i386                 randconfig-f002-20200210
x86_64               randconfig-f001-20200211
x86_64               randconfig-f002-20200211
x86_64               randconfig-f003-20200211
i386                 randconfig-f001-20200211
i386                 randconfig-f002-20200211
i386                 randconfig-f003-20200211
x86_64               randconfig-f001-20200212
x86_64               randconfig-f002-20200212
x86_64               randconfig-f003-20200212
i386                 randconfig-f001-20200212
i386                 randconfig-f002-20200212
i386                 randconfig-f003-20200212
i386                 randconfig-g001-20200210
x86_64               randconfig-g003-20200210
x86_64               randconfig-g001-20200210
i386                 randconfig-g003-20200210
x86_64               randconfig-g002-20200210
i386                 randconfig-g002-20200210
x86_64               randconfig-g001-20200211
x86_64               randconfig-g002-20200211
x86_64               randconfig-g003-20200211
i386                 randconfig-g001-20200211
i386                 randconfig-g002-20200211
i386                 randconfig-g003-20200211
x86_64               randconfig-g001-20200212
x86_64               randconfig-g002-20200212
x86_64               randconfig-g003-20200212
i386                 randconfig-g001-20200212
i386                 randconfig-g002-20200212
i386                 randconfig-g003-20200212
x86_64               randconfig-h001-20200211
x86_64               randconfig-h002-20200211
x86_64               randconfig-h003-20200211
i386                 randconfig-h001-20200211
i386                 randconfig-h002-20200211
i386                 randconfig-h003-20200211
x86_64               randconfig-h001-20200212
x86_64               randconfig-h002-20200212
x86_64               randconfig-h003-20200212
i386                 randconfig-h001-20200212
i386                 randconfig-h002-20200212
i386                 randconfig-h003-20200212
arc                  randconfig-a001-20200210
arm                  randconfig-a001-20200210
arm64                randconfig-a001-20200210
ia64                 randconfig-a001-20200210
powerpc              randconfig-a001-20200210
sparc                randconfig-a001-20200210
arc                  randconfig-a001-20200211
arm                  randconfig-a001-20200211
arm64                randconfig-a001-20200211
ia64                 randconfig-a001-20200211
powerpc              randconfig-a001-20200211
sparc                randconfig-a001-20200211
arc                  randconfig-a001-20200212
arm                  randconfig-a001-20200212
arm64                randconfig-a001-20200212
ia64                 randconfig-a001-20200212
powerpc              randconfig-a001-20200212
sparc                randconfig-a001-20200212
riscv                            allmodconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
s390                             allmodconfig
s390                             allyesconfig
sh                                allnoconfig
sh                  sh7785lcr_32bit_defconfig
sparc                               defconfig
sparc64                          allyesconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              fedora-25
x86_64                                  kexec
x86_64                                    lkp
x86_64                                   rhel
x86_64                         rhel-7.2-clear
x86_64                               rhel-7.6

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
