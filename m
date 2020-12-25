Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BD22E2BD9
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 25 Dec 2020 16:38:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6132989873;
	Fri, 25 Dec 2020 15:38:54 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB63289872
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 25 Dec 2020 15:38:53 +0000 (UTC)
IronPort-SDR: u3V1DqdYA72khCrpcYL/ba534P1CZBvjZsns+JA3AxksKIY+BMYrT4EgltNhz50WfaJeruLCZ3
 vlIhOp2ylM0A==
X-IronPort-AV: E=McAfee;i="6000,8403,9845"; a="240308747"
X-IronPort-AV: E=Sophos;i="5.78,448,1599548400"; d="scan'208";a="240308747"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Dec 2020 07:38:52 -0800
IronPort-SDR: DfTim1ZdCLTRP7XQQOGH2VVjZcoNsyzFZZ+CuXoecphqi4B8gam1ivpIewmzMMfBpc5qe+lNx7
 PvZlR2Yp7oYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,448,1599548400"; d="scan'208";a="399242182"
Received: from lkp-server02.sh.intel.com (HELO 4242b19f17ef) ([10.239.97.151])
 by FMSMGA003.fm.intel.com with ESMTP; 25 Dec 2020 07:38:51 -0800
Received: from kbuild by 4242b19f17ef with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kspB4-0001bz-MS; Fri, 25 Dec 2020 15:38:50 +0000
Date: Fri, 25 Dec 2020 23:38:11 +0800
From: kernel test robot <lkp@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: [intel-gvt-linux:gvt-gt-next] BUILD SUCCESS
 02dd2b12a685944c4d52c569d05f636372a7b6c7
Message-ID: <5fe60763.l/ip2UokGimyMc3c%lkp@intel.com>
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

tree/branch: https://github.com/intel/gvt-linux.git  gvt-gt-next
branch HEAD: 02dd2b12a685944c4d52c569d05f636372a7b6c7  drm/i915/gvt: unify lri cmd handler and mmio handlers

elapsed time: 722m

configs tested: 92
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                            allyesconfig
arm64                               defconfig
arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                         shannon_defconfig
sh                             sh03_defconfig
mips                        qi_lb60_defconfig
ia64                            zx1_defconfig
m68k                        stmark2_defconfig
xtensa                generic_kc705_defconfig
mips                         tb0219_defconfig
mips                         db1xxx_defconfig
mips                          rm200_defconfig
arm                            mmp2_defconfig
mips                        workpad_defconfig
sh                           se7206_defconfig
um                             i386_defconfig
mips                          malta_defconfig
arm                           spitz_defconfig
powerpc                 mpc85xx_cds_defconfig
sh                           se7705_defconfig
powerpc                       ppc64_defconfig
m68k                       bvme6000_defconfig
x86_64                              defconfig
arm                            dove_defconfig
xtensa                           alldefconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
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
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a001-20201225
x86_64               randconfig-a006-20201225
x86_64               randconfig-a004-20201225
x86_64               randconfig-a002-20201225
x86_64               randconfig-a003-20201225
x86_64               randconfig-a005-20201225
i386                 randconfig-a002-20201225
i386                 randconfig-a005-20201225
i386                 randconfig-a006-20201225
i386                 randconfig-a004-20201225
i386                 randconfig-a003-20201225
i386                 randconfig-a001-20201225
i386                 randconfig-a011-20201225
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a015-20201225
x86_64               randconfig-a014-20201225
x86_64               randconfig-a016-20201225
x86_64               randconfig-a012-20201225
x86_64               randconfig-a013-20201225
x86_64               randconfig-a011-20201225

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
