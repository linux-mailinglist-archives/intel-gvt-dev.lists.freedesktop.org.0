Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 684B112E63E
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  2 Jan 2020 13:42:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D91A989D86;
	Thu,  2 Jan 2020 12:42:45 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7746A89D86
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  2 Jan 2020 12:42:44 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Jan 2020 04:42:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,386,1571727600"; d="scan'208";a="394013628"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga005.jf.intel.com with ESMTP; 02 Jan 2020 04:42:41 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1imzoH-0009Db-6f; Thu, 02 Jan 2020 20:42:41 +0800
Date: Thu, 02 Jan 2020 20:41:49 +0800
From: kbuild test robot <lkp@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: [intel-gvt-linux:gvt-staging] BUILD SUCCESS
 0f5a3d7bab65f23b5a122770b91ae5d58657afe1
Message-ID: <5e0de50d.sHp4hTlQNpvwmk3z%lkp@intel.com>
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
branch HEAD: 0f5a3d7bab65f23b5a122770b91ae5d58657afe1  gvt-staging: 2020y-01m-02d-16h-38m-49s CST integration manifest

elapsed time: 210m

configs tested: 157

The following configs have been built successfully.
More configs may be tested in the coming days.

alpha                               defconfig
csky                                defconfig
nds32                             allnoconfig
nds32                               defconfig
sparc                            allyesconfig
sparc                               defconfig
sparc64                          allmodconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                             defconfig
um                             i386_defconfig
parisc               randconfig-a001-20200102
mips                 randconfig-a001-20200102
riscv                randconfig-a001-20200102
alpha                randconfig-a001-20200102
m68k                 randconfig-a001-20200102
nds32                randconfig-a001-20200102
sh                               allmodconfig
sh                                allnoconfig
sh                          rsk7269_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                            titan_defconfig
sparc                randconfig-a001-20200102
arm64                randconfig-a001-20200102
arm                  randconfig-a001-20200102
ia64                 randconfig-a001-20200102
powerpc              randconfig-a001-20200102
arc                  randconfig-a001-20200102
parisc                            allnoconfig
parisc                            allyesonfig
parisc                         b180_defconfig
parisc                        c3000_defconfig
parisc                              defconfig
x86_64               randconfig-c001-20200102
x86_64               randconfig-c002-20200102
x86_64               randconfig-c003-20200102
i386                 randconfig-c001-20200102
i386                 randconfig-c002-20200102
i386                 randconfig-c003-20200102
riscv                            allmodconfig
riscv                             allnoconfig
riscv                            allyesconfig
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
c6x                              allyesconfig
c6x                        evmc6678_defconfig
nios2                         10m50_defconfig
nios2                         3c120_defconfig
openrisc                    or1ksim_defconfig
openrisc                 simple_smp_defconfig
xtensa                       common_defconfig
xtensa                          iss_defconfig
arc                              allyesconfig
arc                                 defconfig
microblaze                      mmu_defconfig
microblaze                    nommu_defconfig
powerpc                           allnoconfig
powerpc                             defconfig
powerpc                       ppc64_defconfig
powerpc                          rhel-kconfig
x86_64               randconfig-a001-20200102
x86_64               randconfig-a002-20200102
x86_64               randconfig-a003-20200102
i386                 randconfig-a001-20200102
i386                 randconfig-a002-20200102
i386                 randconfig-a003-20200102
i386                 randconfig-e002-20200102
x86_64               randconfig-e001-20200102
x86_64               randconfig-e002-20200102
i386                 randconfig-e003-20200102
x86_64               randconfig-e003-20200102
i386                 randconfig-e001-20200102
ia64                             alldefconfig
ia64                             allmodconfig
ia64                              allnoconfig
ia64                             allyesconfig
ia64                                defconfig
x86_64                              fedora-25
x86_64                                  kexec
x86_64                                    lkp
x86_64                                   rhel
x86_64                               rhel-7.6
i386                             alldefconfig
i386                              allnoconfig
i386                             allyesconfig
i386                                defconfig
csky                 randconfig-a001-20200102
openrisc             randconfig-a001-20200102
s390                 randconfig-a001-20200102
sh                   randconfig-a001-20200102
xtensa               randconfig-a001-20200102
microblaze           randconfig-a001-20200102
sparc64              randconfig-a001-20200102
nios2                randconfig-a001-20200102
c6x                  randconfig-a001-20200102
h8300                randconfig-a001-20200102
x86_64               randconfig-b003-20200102
i386                 randconfig-b001-20200102
x86_64               randconfig-b002-20200102
i386                 randconfig-b003-20200102
x86_64               randconfig-b001-20200102
i386                 randconfig-b002-20200102
x86_64               randconfig-h003-20200102
x86_64               randconfig-h002-20200102
i386                 randconfig-h002-20200102
i386                 randconfig-h003-20200102
i386                 randconfig-h001-20200102
x86_64               randconfig-h001-20200102
mips                           32r2_defconfig
mips                         64r6el_defconfig
mips                             allmodconfig
mips                              allnoconfig
mips                             allyesconfig
mips                      fuloong2e_defconfig
mips                      malta_kvm_defconfig
x86_64               randconfig-d001-20200102
x86_64               randconfig-d002-20200102
x86_64               randconfig-d003-20200102
i386                 randconfig-d001-20200102
i386                 randconfig-d002-20200102
i386                 randconfig-d003-20200102
s390                             alldefconfig
s390                             allmodconfig
s390                              allnoconfig
s390                             allyesconfig
s390                          debug_defconfig
s390                                defconfig
s390                       zfcpdump_defconfig
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
i386                 randconfig-f001-20200102
x86_64               randconfig-f003-20200102
i386                 randconfig-f002-20200102
i386                 randconfig-f003-20200102
x86_64               randconfig-f001-20200102
x86_64               randconfig-f002-20200102
um                                  defconfig
um                           x86_64_defconfig
x86_64               randconfig-g002-20200102
i386                 randconfig-g003-20200102
i386                 randconfig-g002-20200102
x86_64               randconfig-g003-20200102
x86_64               randconfig-g001-20200102
i386                 randconfig-g001-20200102

---
0-DAY kernel test infrastructure                 Open Source Technology Center
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org Intel Corporation
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
