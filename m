Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3CA1A264A
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  8 Apr 2020 17:50:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C1896EA83;
	Wed,  8 Apr 2020 15:50:37 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5A716E14F
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  8 Apr 2020 15:50:34 +0000 (UTC)
IronPort-SDR: RS7IONsFJRvxgBY1MH+xhc6VgwS0+58LsMpUQVk30ON1FN0Bfq8bXftbp41bE5mtrKRLAMo0kM
 kjh4PHu79kGw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2020 08:50:33 -0700
IronPort-SDR: IkFJvgOga3vEU/TpZ053ykgtMTOHKsJwyc1Zcw9gwOUmVvCcslKsoqWXbPzAAMkiFvSN5SWc1n
 ReihtiurMnVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,359,1580803200"; d="scan'208";a="297270119"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Apr 2020 08:50:31 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1jMCyE-000Cb3-DG; Wed, 08 Apr 2020 23:50:30 +0800
Date: Wed, 08 Apr 2020 23:50:20 +0800
From: kbuild test robot <lkp@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: [intel-gvt-linux:gvt-staging] BUILD SUCCESS
 6909791702ed5877588705cde2c120c83aa52c10
Message-ID: <5e8df2bc.T7l0v2lQ+qRWlQXt%lkp@intel.com>
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
branch HEAD: 6909791702ed5877588705cde2c120c83aa52c10  gvt-staging: 2020y-04m-08d-09h-03m-49s CST integration manifest

elapsed time: 860m

configs tested: 133
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

arm64                            allyesconfig
arm                              allyesconfig
arm64                            allmodconfig
arm                              allmodconfig
arm64                             allnoconfig
arm                               allnoconfig
arm                        shmobile_defconfig
arm64                               defconfig
arm                           sunxi_defconfig
arm                        multi_v7_defconfig
arm                           efm32_defconfig
arm                         at91_dt_defconfig
arm                          exynos_defconfig
arm                        multi_v5_defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                             alldefconfig
i386                                defconfig
i386                              debian-10.3
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
ia64                             allyesconfig
ia64                             alldefconfig
c6x                              allyesconfig
c6x                        evmc6678_defconfig
nios2                         10m50_defconfig
nios2                         3c120_defconfig
openrisc                    or1ksim_defconfig
openrisc                 simple_smp_defconfig
xtensa                       common_defconfig
xtensa                          iss_defconfig
m68k                       m5475evb_defconfig
m68k                           sun3_defconfig
m68k                          multi_defconfig
mips                           32r2_defconfig
mips                         64r6el_defconfig
mips                             allmodconfig
mips                              allnoconfig
mips                             allyesconfig
mips                      fuloong2e_defconfig
mips                      malta_kvm_defconfig
parisc                            allnoconfig
parisc                generic-64bit_defconfig
parisc                generic-32bit_defconfig
parisc                           allyesconfig
x86_64               randconfig-a003-20200408
i386                 randconfig-a002-20200408
x86_64               randconfig-a001-20200408
x86_64               randconfig-a002-20200408
i386                 randconfig-a003-20200408
i386                 randconfig-a001-20200408
nds32                randconfig-a001-20200408
m68k                 randconfig-a001-20200408
alpha                randconfig-a001-20200408
parisc               randconfig-a001-20200408
riscv                randconfig-a001-20200408
sparc64              randconfig-a001-20200408
h8300                randconfig-a001-20200408
nios2                randconfig-a001-20200408
c6x                  randconfig-a001-20200408
s390                 randconfig-a001-20200408
xtensa               randconfig-a001-20200408
csky                 randconfig-a001-20200408
openrisc             randconfig-a001-20200408
sh                   randconfig-a001-20200408
i386                 randconfig-b003-20200408
x86_64               randconfig-b002-20200408
x86_64               randconfig-b003-20200408
i386                 randconfig-b001-20200408
x86_64               randconfig-b001-20200408
i386                 randconfig-b002-20200408
x86_64               randconfig-c002-20200408
i386                 randconfig-c001-20200408
i386                 randconfig-c003-20200408
x86_64               randconfig-c003-20200408
i386                 randconfig-c002-20200408
x86_64               randconfig-c001-20200408
x86_64               randconfig-e002-20200408
i386                 randconfig-e003-20200408
i386                 randconfig-e001-20200408
x86_64               randconfig-e001-20200408
x86_64               randconfig-e003-20200408
i386                 randconfig-e002-20200408
i386                 randconfig-f001-20200408
i386                 randconfig-f003-20200408
x86_64               randconfig-f003-20200408
x86_64               randconfig-f001-20200408
i386                 randconfig-f002-20200408
x86_64               randconfig-g003-20200408
i386                 randconfig-g003-20200408
x86_64               randconfig-g002-20200408
i386                 randconfig-g002-20200408
i386                 randconfig-g001-20200408
sparc                randconfig-a001-20200408
arm64                randconfig-a001-20200408
ia64                 randconfig-a001-20200408
arc                  randconfig-a001-20200408
arm                  randconfig-a001-20200408
powerpc              randconfig-a001-20200408
riscv                          rv32_defconfig
riscv                            allmodconfig
riscv                             allnoconfig
riscv                            allyesconfig
riscv                               defconfig
riscv                    nommu_virt_defconfig
s390                       zfcpdump_defconfig
s390                          debug_defconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
s390                             alldefconfig
s390                                defconfig
sh                          rsk7269_defconfig
sh                               allmodconfig
sh                            titan_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                                allnoconfig
sparc                            allyesconfig
sparc                               defconfig
sparc64                          allmodconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                             defconfig
um                           x86_64_defconfig
um                             i386_defconfig
um                                  defconfig
x86_64                                   rhel
x86_64                               rhel-7.6
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
