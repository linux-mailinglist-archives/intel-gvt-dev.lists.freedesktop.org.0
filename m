Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EED11AA98C
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 15 Apr 2020 16:17:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BA106E9E5;
	Wed, 15 Apr 2020 14:17:10 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 864C06E9E5
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 15 Apr 2020 14:17:08 +0000 (UTC)
IronPort-SDR: dgHiInJyGif1G6KtvvmGIE2hRH4XQbDrq8MmbelK3ZUPfY1+jE01EYRaOqVnLa0Ig5IkkxH7HG
 a2XbIA87eYuQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2020 07:17:07 -0700
IronPort-SDR: uX8QugexGn+d2NJmTmSZ8T5KKADckCJvkeQ97hm+hZoL4RfAnloF3DqMYHHzXOpGN2Ff/62dbU
 N7dZQaYRINVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,387,1580803200"; d="scan'208";a="244112926"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by fmsmga007.fm.intel.com with ESMTP; 15 Apr 2020 07:17:06 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1jOiqg-000BU2-0f; Wed, 15 Apr 2020 22:17:06 +0800
Date: Wed, 15 Apr 2020 22:16:37 +0800
From: kbuild test robot <lkp@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: [intel-gvt-linux:gvt-next] BUILD SUCCESS
 e5e113079efdffb9a39e16a88d109c3d47efdfcc
Message-ID: <5e971745.xYqTxDZGKu5NZ0tR%lkp@intel.com>
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

tree/branch: https://github.com/intel/gvt-linux.git  gvt-next
branch HEAD: e5e113079efdffb9a39e16a88d109c3d47efdfcc  drm/i915/gvt: combine access to consecutive guest context pages

elapsed time: 484m

configs tested: 125
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

arm64                            allyesconfig
arm                              allyesconfig
arm64                            allmodconfig
arm                              allmodconfig
arm64                             allnoconfig
arm                               allnoconfig
arm                           efm32_defconfig
arm                         at91_dt_defconfig
arm                        shmobile_defconfig
arm64                               defconfig
arm                          exynos_defconfig
arm                        multi_v5_defconfig
arm                           sunxi_defconfig
arm                        multi_v7_defconfig
sparc                            allyesconfig
powerpc                             defconfig
um                             i386_defconfig
parisc                           allyesconfig
sh                          rsk7269_defconfig
m68k                       m5475evb_defconfig
powerpc                           allnoconfig
parisc                generic-32bit_defconfig
h8300                     edosk2674_defconfig
sparc64                          allyesconfig
sh                               allmodconfig
ia64                             allyesconfig
nds32                               defconfig
microblaze                    nommu_defconfig
arc                                 defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                             alldefconfig
i386                                defconfig
i386                              debian-10.3
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
ia64                             alldefconfig
nios2                         3c120_defconfig
nios2                         10m50_defconfig
c6x                        evmc6678_defconfig
xtensa                          iss_defconfig
c6x                              allyesconfig
xtensa                       common_defconfig
openrisc                 simple_smp_defconfig
openrisc                    or1ksim_defconfig
nds32                             allnoconfig
csky                                defconfig
alpha                               defconfig
h8300                       h8s-sim_defconfig
m68k                             allmodconfig
h8300                    h8300h-sim_defconfig
m68k                           sun3_defconfig
m68k                          multi_defconfig
arc                              allyesconfig
powerpc                       ppc64_defconfig
powerpc                          rhel-kconfig
microblaze                      mmu_defconfig
mips                             allyesconfig
mips                         64r6el_defconfig
mips                              allnoconfig
mips                           32r2_defconfig
mips                             allmodconfig
mips                      fuloong2e_defconfig
mips                      malta_kvm_defconfig
parisc                            allnoconfig
parisc                generic-64bit_defconfig
i386                 randconfig-a002-20200415
x86_64               randconfig-a001-20200415
x86_64               randconfig-a002-20200415
i386                 randconfig-a003-20200415
i386                 randconfig-a001-20200415
x86_64               randconfig-a003-20200415
mips                 randconfig-a001-20200415
nds32                randconfig-a001-20200415
m68k                 randconfig-a001-20200415
riscv                randconfig-a001-20200415
alpha                randconfig-a001-20200415
parisc               randconfig-a001-20200415
s390                 randconfig-a001-20200415
xtensa               randconfig-a001-20200415
sh                   randconfig-a001-20200415
openrisc             randconfig-a001-20200415
csky                 randconfig-a001-20200415
x86_64               randconfig-c003-20200415
i386                 randconfig-c003-20200415
x86_64               randconfig-c002-20200415
i386                 randconfig-c002-20200415
x86_64               randconfig-c001-20200415
i386                 randconfig-c001-20200415
i386                 randconfig-d002-20200415
x86_64               randconfig-d003-20200415
i386                 randconfig-d003-20200415
x86_64               randconfig-d001-20200415
i386                 randconfig-d001-20200415
x86_64               randconfig-d002-20200415
x86_64               randconfig-e001-20200415
x86_64               randconfig-e002-20200415
i386                 randconfig-e002-20200415
i386                 randconfig-e001-20200415
i386                 randconfig-e003-20200415
x86_64               randconfig-e003-20200415
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
s390                       zfcpdump_defconfig
s390                          debug_defconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
s390                             alldefconfig
s390                                defconfig
sh                            titan_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                                allnoconfig
sparc                               defconfig
sparc64                           allnoconfig
sparc64                          allmodconfig
sparc64                             defconfig
um                           x86_64_defconfig
um                                  defconfig
x86_64                                   rhel

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
