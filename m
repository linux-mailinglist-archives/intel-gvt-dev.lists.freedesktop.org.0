Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7D893211C
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 16 Jul 2024 09:20:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 614ED10E103;
	Tue, 16 Jul 2024 07:20:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gVvDd0bk";
	dkim-atps=neutral
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AB4010E103
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 16 Jul 2024 07:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721114433; x=1752650433; h=date:from:cc:subject:message-id;
 bh=SwpwDoXvrj3kYwa1zDX9SyS85IGsh8EvIrisqFXFU7A=;
 b=gVvDd0bkYw/+E2sGjA/vSZUKCL7O6ise0WDuQUoomWQcX+tz9ZDamqSN
 CK352qWV5GDH2J3KoCMeihhrJeYi1tzANMZMgJMlCnPOOnNsiHBsPsfAL
 lDOvejXckk7q2AnIw74H7Z2itT7tdJyWvvQbYWuuFt8T/C7vevEAbQTwZ
 kJ55wLqz1syvCVspnUlXNWqdhYZmyQ3mlv5pk1GqDXqsdTuE8DIbPSnkD
 fT0/8ycRvX2J8GcMGUdlrLjmYJhPCIdcHVvM+VUG9frg7+BMANlkxPpZW
 lb78xS8tAIET5R+mLrzhWopeC1xMkZuUHXQ/wBjdDXhMT7Mz+MqQ6ZaBt Q==;
X-CSE-ConnectionGUID: nsfoHUtLTiqizxSN4ZtnNg==
X-CSE-MsgGUID: gWomNrTaSGO3Q5bT7ANmag==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="18379683"
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; d="scan'208";a="18379683"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 00:20:33 -0700
X-CSE-ConnectionGUID: 2INbpit+SyWt2CViDxQlEg==
X-CSE-MsgGUID: nDZ61yjfTZGlw3h0NXgN6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; d="scan'208";a="49954153"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
 by orviesa009.jf.intel.com with ESMTP; 16 Jul 2024 00:20:31 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sTcU8-000f0M-0o;
 Tue, 16 Jul 2024 07:20:28 +0000
Date: Tue, 16 Jul 2024 15:19:54 +0800
From: kernel test robot <lkp@intel.com>
Cc: zhenyu.z.wang@intel.com, terrence.xu@intel.com,
 intel-gvt-dev@lists.freedesktop.org
Subject: [intel-gvt:dependabot/pip/drivers/gpu/drm/ci/xfails/setuptools-70.0.0] BUILD
 SUCCESS f758073736b8c7e3dd188497dea71bb40d045b1e
Message-ID: <202407161551.zMRAgL56-lkp@intel.com>
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

tree/branch: https://github.com/intel/gvt-linux.git dependabot/pip/drivers/gpu/drm/ci/xfails/setuptools-70.0.0
branch HEAD: f758073736b8c7e3dd188497dea71bb40d045b1e  build(deps): bump setuptools in /drivers/gpu/drm/ci/xfails

elapsed time: 730m

configs tested: 105
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                   randconfig-001-20240716   gcc-13.2.0
arc                   randconfig-002-20240716   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-19
arm                              allyesconfig   gcc-14.1.0
arm                   randconfig-001-20240716   gcc-14.1.0
arm                   randconfig-002-20240716   clang-19
arm                   randconfig-003-20240716   gcc-14.1.0
arm                   randconfig-004-20240716   gcc-14.1.0
arm64                            allmodconfig   clang-19
arm64                             allnoconfig   gcc-14.1.0
arm64                 randconfig-001-20240716   gcc-14.1.0
arm64                 randconfig-002-20240716   clang-19
arm64                 randconfig-003-20240716   gcc-14.1.0
arm64                 randconfig-004-20240716   gcc-14.1.0
csky                              allnoconfig   gcc-14.1.0
csky                  randconfig-001-20240716   gcc-14.1.0
csky                  randconfig-002-20240716   gcc-14.1.0
hexagon                          allmodconfig   clang-19
hexagon                           allnoconfig   clang-19
hexagon                          allyesconfig   clang-19
hexagon               randconfig-001-20240716   clang-19
hexagon               randconfig-002-20240716   clang-19
i386                             allmodconfig   gcc-13
i386                              allnoconfig   gcc-13
i386                             allyesconfig   gcc-13
i386         buildonly-randconfig-001-20240716   clang-18
i386         buildonly-randconfig-002-20240716   clang-18
i386         buildonly-randconfig-003-20240716   clang-18
i386         buildonly-randconfig-004-20240716   clang-18
i386         buildonly-randconfig-005-20240716   clang-18
i386         buildonly-randconfig-006-20240716   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240716   clang-18
i386                  randconfig-002-20240716   clang-18
i386                  randconfig-003-20240716   gcc-9
i386                  randconfig-004-20240716   gcc-7
i386                  randconfig-005-20240716   clang-18
i386                  randconfig-006-20240716   gcc-9
i386                  randconfig-011-20240716   gcc-8
i386                  randconfig-012-20240716   clang-18
i386                  randconfig-013-20240716   gcc-8
i386                  randconfig-014-20240716   clang-18
i386                  randconfig-015-20240716   clang-18
i386                  randconfig-016-20240716   gcc-10
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch             randconfig-001-20240716   gcc-14.1.0
loongarch             randconfig-002-20240716   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
mips                              allnoconfig   gcc-14.1.0
nios2                             allnoconfig   gcc-14.1.0
nios2                 randconfig-001-20240716   gcc-14.1.0
nios2                 randconfig-002-20240716   gcc-14.1.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240716   gcc-14.1.0
parisc                randconfig-002-20240716   gcc-14.1.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-19
powerpc               randconfig-001-20240716   clang-19
powerpc               randconfig-002-20240716   clang-19
powerpc               randconfig-003-20240716   clang-19
powerpc64             randconfig-001-20240716   clang-19
riscv                            allmodconfig   clang-19
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-19
riscv                               defconfig   clang-19
s390                             allmodconfig   clang-19
s390                              allnoconfig   clang-19
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   clang-19
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
um                               allmodconfig   clang-19
um                                allnoconfig   clang-17
um                               allyesconfig   gcc-13
um                                  defconfig   clang-19
um                             i386_defconfig   gcc-13
um                           x86_64_defconfig   clang-15
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64                              defconfig   gcc-13
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
