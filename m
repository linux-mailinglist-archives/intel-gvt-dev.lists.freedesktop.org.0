Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AE599155F
	for <lists+intel-gvt-dev@lfdr.de>; Sat,  5 Oct 2024 10:50:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D971810E028;
	Sat,  5 Oct 2024 08:50:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kTkFR9C+";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FFC510E028
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat,  5 Oct 2024 08:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728118206; x=1759654206; h=date:from:cc:subject:message-id;
 bh=ZxYatq1IpsMbPzEToj7H2lTI7VWy6OBpHPK9l9Rpduc=;
 b=kTkFR9C+IpAXtcoQa/vhOvpXSlL2kzQwKA4jCbn+wY+MZ/s2+lK2WC5A
 Y7k85ZtpcR3v50K7rbfqnXhmh3mSEIQhofsx3SHQGJDTGAnNnUbURhtpf
 7aDrvCaEUYq+t0wqeENI/z+xHoubk6ugN+qZjYsAhAJx/nDqgWb5JDG0G
 mIrwaP3E9RevI27G2sfrnOuvxNDLuFUdMf8b8uEZ8nv+uoChyXw+t6VYe
 GHTyuhcdw2fUMRwkkGY3qH4R50jNA1DiOo6Oy0x5ZZwo4vnZmG8a9z1di
 H6cmLziMry956qVVV0uJYMDpaSfrBIjRljEvpJKnSEO/m8NGmnO2t+YMs w==;
X-CSE-ConnectionGUID: CkbxhxF7SPukG4RWAeSXbg==
X-CSE-MsgGUID: gPq28BfqRoiRvlo9+tlQng==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="31038584"
X-IronPort-AV: E=Sophos;i="6.11,180,1725346800"; d="scan'208";a="31038584"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2024 01:50:05 -0700
X-CSE-ConnectionGUID: +sGMYwFdRcmQ0AVVwj/Myw==
X-CSE-MsgGUID: jjZWBZvwRAe2lkAkLvxu3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,180,1725346800"; d="scan'208";a="78925922"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
 by fmviesa003.fm.intel.com with ESMTP; 05 Oct 2024 01:50:03 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sx0UD-0002mY-0h;
 Sat, 05 Oct 2024 08:50:01 +0000
Date: Sat, 05 Oct 2024 16:49:46 +0800
From: kernel test robot <lkp@intel.com>
Cc: zhenyu.z.wang@intel.com, terrence.xu@intel.com,
 intel-gvt-dev@lists.freedesktop.org
Subject: [intel-gvt:gvt-staging] BUILD SUCCESS
 ce6b05e11a36e58e9ebb3b6314f0de6dc4fb63a1
Message-ID: <202410051631.osHrLScR-lkp@intel.com>
User-Agent: s-nail v14.9.24
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
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

tree/branch: https://github.com/intel/gvt-linux.git gvt-staging
branch HEAD: ce6b05e11a36e58e9ebb3b6314f0de6dc4fb63a1  Update README

elapsed time: 1941m

configs tested: 112
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-13.3.0
alpha                            allyesconfig    gcc-13.3.0
alpha                               defconfig    gcc-13.3.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-13.2.0
arc                   randconfig-001-20241005    gcc-13.2.0
arc                   randconfig-002-20241005    gcc-13.2.0
arm                              allmodconfig    gcc-14.1.0
arm                               allnoconfig    clang-20
arm                              allyesconfig    gcc-14.1.0
arm                     am200epdkit_defconfig    gcc-14.1.0
arm                                 defconfig    clang-14
arm                      jornada720_defconfig    clang-20
arm                   randconfig-001-20241005    gcc-14.1.0
arm                   randconfig-002-20241005    clang-20
arm                   randconfig-003-20241005    gcc-14.1.0
arm                   randconfig-004-20241005    clang-20
arm                           tegra_defconfig    gcc-14.1.0
arm                    vt8500_v6_v7_defconfig    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
arm64                 randconfig-001-20241005    clang-20
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241005    clang-18
i386        buildonly-randconfig-002-20241005    clang-18
i386        buildonly-randconfig-003-20241005    clang-18
i386        buildonly-randconfig-004-20241005    clang-18
i386        buildonly-randconfig-005-20241005    gcc-12
i386        buildonly-randconfig-006-20241005    gcc-12
i386                                defconfig    clang-18
i386                  randconfig-001-20241005    gcc-11
i386                  randconfig-002-20241005    clang-18
i386                  randconfig-003-20241005    gcc-12
i386                  randconfig-004-20241005    clang-18
i386                  randconfig-005-20241005    clang-18
i386                  randconfig-006-20241005    clang-18
i386                  randconfig-011-20241005    gcc-12
i386                  randconfig-012-20241005    clang-18
i386                  randconfig-013-20241005    clang-18
i386                  randconfig-014-20241005    gcc-12
i386                  randconfig-015-20241005    gcc-12
i386                  randconfig-016-20241005    gcc-12
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                          ath25_defconfig    clang-20
mips                     loongson1b_defconfig    clang-15
nios2                             allnoconfig    gcc-14.1.0
openrisc                          allnoconfig    gcc-14.1.0
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-14.1.0
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    gcc-14.1.0
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    gcc-14.1.0
powerpc                          allyesconfig    clang-20
powerpc                      ep88xc_defconfig    gcc-14.1.0
powerpc                        fsp2_defconfig    gcc-14.1.0
powerpc                 mpc834x_itx_defconfig    clang-20
powerpc                     tqm5200_defconfig    gcc-14.1.0
powerpc                     tqm8541_defconfig    clang-15
riscv                            alldefconfig    gcc-14.1.0
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.1.0
riscv                            allyesconfig    clang-20
riscv                               defconfig    clang-20
s390                             allmodconfig    clang-20
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    clang-20
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-14.1.0
sh                     magicpanelr2_defconfig    gcc-14.1.0
sh                          rsk7203_defconfig    gcc-14.1.0
sh                           se7712_defconfig    gcc-14.1.0
sh                           se7751_defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-14.1.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                               allyesconfig    gcc-12
um                                  defconfig    clang-20
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-18
x86_64                               rhel-8.3    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
