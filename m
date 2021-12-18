Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E46194798B1
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 18 Dec 2021 05:54:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01C7B10EB6F;
	Sat, 18 Dec 2021 04:54:40 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11A7D10E647
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 18 Dec 2021 04:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639803278; x=1671339278;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=APCZ9vKMRWiMw4jrwu7Lzcbe+gbtPCXv3NrKap8bLLU=;
 b=jDCuqvki9XuoUfHh/C03HWWOixRp2dI/w/vHQ7NADddxjDU0kMzhwd/S
 YAUOIzh3j5uPlmiuGs5oO7TMfgQyCcwsE12gQiShTlGkxZFCuR4MYD091
 PfifY6MPCMgvrBBhzGJGSq58F0EaUDLArwWiSp38MVpsZaUiiTEtHsiO0
 uQJVV+iMoD24Lleq5W2RHFsX9/2RtkgWHCLNXPq5+Bcpbsm2O642rIOzs
 m8D50gpJEM6dQYHuOgtRWMo9jwBk+nzXsr9Jlv1d4HkiK4DXRPI8Fyza4
 Ef64eeAnPylOn90MDRQPzSFoNqhmCujrfJH/YY7rR9SGwpNgsgXn73aEm Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10201"; a="220567532"
X-IronPort-AV: E=Sophos;i="5.88,215,1635231600"; d="scan'208";a="220567532"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2021 20:54:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,215,1635231600"; d="scan'208";a="466739748"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
 by orsmga006.jf.intel.com with ESMTP; 17 Dec 2021 20:54:34 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1myRjt-0005cO-0G; Sat, 18 Dec 2021 04:54:33 +0000
Date: Sat, 18 Dec 2021 12:53:31 +0800
From: kernel test robot <lkp@intel.com>
To: Zhi Wang <zhi.a.wang@intel.com>
Subject: [intel-gvt:gvt-staging] BUILD SUCCESS
 7ea3999a9c2ed148d56e151c24d9b9d3af991fea
Message-ID: <61bd694b.GLDtjlopMpeH5tjD%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

tree/branch: https://github.com/intel/gvt-linux.git gvt-staging
branch HEAD: 7ea3999a9c2ed148d56e151c24d9b9d3af991fea  gvt-staging: 2021y-12m-16d-11h-59m-07s CST integration manifest

elapsed time: 2104m

configs tested: 112
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211216
m68k                       m5208evb_defconfig
mips                        vocore2_defconfig
sh                   rts7751r2dplus_defconfig
sh                           se7724_defconfig
sparc                               defconfig
m68k                            q40_defconfig
sh                         microdev_defconfig
arm                         lubbock_defconfig
sh                          rsk7203_defconfig
arm                        spear6xx_defconfig
riscv                            alldefconfig
arm                            mmp2_defconfig
arm                           tegra_defconfig
arm                        multi_v7_defconfig
powerpc               mpc834x_itxgp_defconfig
powerpc                      walnut_defconfig
mips                        omega2p_defconfig
sh                           se7721_defconfig
arm                       omap2plus_defconfig
powerpc                    adder875_defconfig
arm                        magician_defconfig
parisc                generic-32bit_defconfig
h8300                            allyesconfig
arm                  randconfig-c002-20211216
ia64                             allmodconfig
ia64                             allyesconfig
ia64                                defconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
parisc                           allyesconfig
s390                             allmodconfig
s390                                defconfig
s390                             allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allmodconfig
mips                             allyesconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a001-20211216
x86_64               randconfig-a002-20211216
x86_64               randconfig-a003-20211216
x86_64               randconfig-a006-20211216
x86_64               randconfig-a005-20211216
x86_64               randconfig-a004-20211216
i386                 randconfig-a001-20211216
i386                 randconfig-a002-20211216
i386                 randconfig-a005-20211216
i386                 randconfig-a003-20211216
i386                 randconfig-a006-20211216
i386                 randconfig-a004-20211216
arc                  randconfig-r043-20211216
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                                  kexec
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests

clang tested configs:
x86_64               randconfig-a011-20211216
x86_64               randconfig-a014-20211216
x86_64               randconfig-a012-20211216
x86_64               randconfig-a013-20211216
x86_64               randconfig-a016-20211216
x86_64               randconfig-a015-20211216
x86_64               randconfig-a011-20211214
x86_64               randconfig-a014-20211214
x86_64               randconfig-a012-20211214
x86_64               randconfig-a013-20211214
x86_64               randconfig-a015-20211214
x86_64               randconfig-a016-20211214
i386                 randconfig-a013-20211216
i386                 randconfig-a011-20211216
i386                 randconfig-a014-20211216
i386                 randconfig-a012-20211216
i386                 randconfig-a015-20211216
i386                 randconfig-a016-20211216
hexagon              randconfig-r045-20211216
hexagon              randconfig-r041-20211216
s390                 randconfig-r044-20211216
riscv                randconfig-r042-20211216

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
