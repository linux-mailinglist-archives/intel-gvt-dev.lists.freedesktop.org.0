Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6974411F6B2
	for <lists+intel-gvt-dev@lfdr.de>; Sun, 15 Dec 2019 07:51:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02BC36E212;
	Sun, 15 Dec 2019 06:51:46 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CFA46E212
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sun, 15 Dec 2019 06:51:45 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Dec 2019 22:51:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,316,1571727600"; d="scan'208";a="239730596"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by fmsmga004.fm.intel.com with ESMTP; 14 Dec 2019 22:51:42 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1igNkk-000E6Z-0Y; Sun, 15 Dec 2019 14:51:42 +0800
Date: Sun, 15 Dec 2019 14:50:11 +0800
From: kbuild test robot <lkp@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: [intel-gvt-linux:gvt-staging] BUILD INCOMPLETE
 1f322447f609d6d326a5c80e8186c748a21b4bbf
Message-ID: <5df5d7a3.Q6DdBm44HW2sipuI%lkp@intel.com>
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
branch HEAD: 1f322447f609d6d326a5c80e8186c748a21b4bbf  gvt-staging: 2019y-12m-13d-11h-24m-37s CST integration manifest

TIMEOUT after 2887m


Sorry we cannot finish the testset for your branch within a reasonable time.
It's our fault -- either some build server is down or some build worker is busy
doing bisects for _other_ trees. The branch will get more complete coverage and
possible error reports when our build infrastructure is restored or catches up.
There will be no more build success notification for this branch head, but you
can expect reasonably good test coverage after waiting for 1 day.

configs timed out: 22

c6x                              allyesconfig
c6x                        evmc6678_defconfig
nios2                         10m50_defconfig
nios2                         3c120_defconfig
openrisc                    or1ksim_defconfig
openrisc                 simple_smp_defconfig
parisc                            allnoconfig
parisc                            allyesonfig
parisc                         b180_defconfig
parisc                        c3000_defconfig
parisc                              defconfig
riscv                            allmodconfig
riscv                             allnoconfig
riscv                            allyesconfig
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
um                                  defconfig
um                             i386_defconfig
um                           x86_64_defconfig
xtensa                       common_defconfig
xtensa                          iss_defconfig

configs tested: 107

csky                 randconfig-a001-20191213
openrisc             randconfig-a001-20191213
s390                 randconfig-a001-20191213
sh                   randconfig-a001-20191213
xtensa               randconfig-a001-20191213
sparc                            allyesconfig
x86_64               randconfig-g001-20191213
x86_64               randconfig-g002-20191213
x86_64               randconfig-g003-20191213
i386                 randconfig-g001-20191213
i386                 randconfig-g002-20191213
i386                 randconfig-g003-20191213
alpha                               defconfig
csky                                defconfig
nds32                             allnoconfig
nds32                               defconfig
s390                             alldefconfig
s390                             allmodconfig
s390                              allnoconfig
s390                             allyesconfig
s390                          debug_defconfig
s390                                defconfig
s390                       zfcpdump_defconfig
x86_64                              fedora-25
x86_64                                  kexec
x86_64                                    lkp
x86_64                                   rhel
x86_64                               rhel-7.6
sparc                               defconfig
sparc64                          allmodconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                             defconfig
arm                              allmodconfig
arm64                            allmodconfig
x86_64               randconfig-e001-20191213
x86_64               randconfig-e002-20191213
x86_64               randconfig-e003-20191213
i386                 randconfig-e001-20191213
i386                 randconfig-e002-20191213
i386                 randconfig-e003-20191213
h8300                     edosk2674_defconfig
h8300                    h8300h-sim_defconfig
h8300                       h8s-sim_defconfig
m68k                             allmodconfig
m68k                       m5475evb_defconfig
m68k                          multi_defconfig
m68k                           sun3_defconfig
x86_64               randconfig-h001-20191213
x86_64               randconfig-h002-20191213
x86_64               randconfig-h003-20191213
i386                 randconfig-h001-20191213
i386                 randconfig-h002-20191213
i386                 randconfig-h003-20191213
i386                             alldefconfig
i386                              allnoconfig
i386                             allyesconfig
i386                                defconfig
mips                           32r2_defconfig
mips                         64r6el_defconfig
mips                             allmodconfig
mips                              allnoconfig
mips                             allyesconfig
mips                      fuloong2e_defconfig
mips                      malta_kvm_defconfig
x86_64               randconfig-a001-20191213
x86_64               randconfig-a002-20191213
x86_64               randconfig-a003-20191213
i386                 randconfig-a001-20191213
i386                 randconfig-a002-20191213
i386                 randconfig-a003-20191213
sh                               allmodconfig
sh                                allnoconfig
sh                          rsk7269_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                            titan_defconfig
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
arm64                               defconfig
ia64                             alldefconfig
ia64                             allmodconfig
ia64                              allnoconfig
ia64                             allyesconfig
ia64                                defconfig
arc                              allyesconfig
arc                                 defconfig
microblaze                      mmu_defconfig
microblaze                    nommu_defconfig
powerpc                           allnoconfig
powerpc                             defconfig
powerpc                       ppc64_defconfig
powerpc                          rhel-kconfig
x86_64               randconfig-d001-20191213
x86_64               randconfig-d002-20191213
x86_64               randconfig-d003-20191213
i386                 randconfig-d001-20191213
i386                 randconfig-d002-20191213
i386                 randconfig-d003-20191213

---
0-DAY kernel test infrastructure                 Open Source Technology Center
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org Intel Corporation
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
