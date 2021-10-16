Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9301E42FFB9
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 16 Oct 2021 04:26:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E44886EE38;
	Sat, 16 Oct 2021 02:26:41 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF12F6EE38
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 16 Oct 2021 02:26:40 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10138"; a="226794174"
X-IronPort-AV: E=Sophos;i="5.85,377,1624345200"; d="scan'208";a="226794174"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2021 19:26:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,377,1624345200"; d="scan'208";a="660707191"
Received: from lkp-server02.sh.intel.com (HELO 08b2c502c3de) ([10.239.97.151])
 by orsmga005.jf.intel.com with ESMTP; 15 Oct 2021 19:26:37 -0700
Received: from kbuild by 08b2c502c3de with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mbZPA-0008df-Ua; Sat, 16 Oct 2021 02:26:36 +0000
Date: Sat, 16 Oct 2021 10:26:21 +0800
From: kernel test robot <lkp@intel.com>
To: Zhi Wang <zhi.a.wang@intel.com>
Cc: intel-gvt-dev@lists.freedesktop.org, terrence.xu@intel.com,
 zhenyu.z.wang@intel.com
Subject: [intel-gvt:gvt-next] BUILD SUCCESS
 34f5ac9cbd9254a5ab12bebbc6fe926aaa0bcd73
Message-ID: <616a384d.0sx+60dXj1iSuJH4%lkp@intel.com>
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
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

tree/branch: https://github.com/intel/gvt-linux.git gvt-next
branch HEAD: 34f5ac9cbd9254a5ab12bebbc6fe926aaa0bcd73  drm/i915/gvt: Fix cmd parser error for Passmark9

elapsed time: 900m

configs tested: 150
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211015
i386                             alldefconfig
ia64                                defconfig
mips                          malta_defconfig
sh                     sh7710voipgw_defconfig
powerpc                        icon_defconfig
sh                          rsk7269_defconfig
m68k                        m5307c3_defconfig
m68k                          amiga_defconfig
arm                        realview_defconfig
sh                           se7343_defconfig
ia64                            zx1_defconfig
arm                          gemini_defconfig
openrisc                            defconfig
powerpc                          g5_defconfig
h8300                       h8s-sim_defconfig
sh                        sh7785lcr_defconfig
mips                      maltaaprp_defconfig
sh                     magicpanelr2_defconfig
arm                            zeus_defconfig
alpha                            alldefconfig
sh                   secureedge5410_defconfig
m68k                          sun3x_defconfig
arc                           tb10x_defconfig
s390                                defconfig
s390                       zfcpdump_defconfig
arm                    vt8500_v6_v7_defconfig
mips                        workpad_defconfig
powerpc                    ge_imp3a_defconfig
arm                         bcm2835_defconfig
arc                              alldefconfig
mips                         db1xxx_defconfig
microblaze                      mmu_defconfig
mips                        vocore2_defconfig
powerpc                      tqm8xx_defconfig
mips                           gcw0_defconfig
mips                         tb0219_defconfig
m68k                       m5475evb_defconfig
m68k                          atari_defconfig
sh                          rsk7201_defconfig
powerpc                   motionpro_defconfig
arm64                            alldefconfig
arm                           omap1_defconfig
arm                          ixp4xx_defconfig
mips                            e55_defconfig
riscv                    nommu_k210_defconfig
sh                        apsh4ad0a_defconfig
mips                        nlm_xlr_defconfig
arm                  randconfig-c002-20211015
x86_64               randconfig-c001-20211015
ia64                             allmodconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                              defconfig
parisc                           allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20211016
x86_64               randconfig-a004-20211016
x86_64               randconfig-a001-20211016
x86_64               randconfig-a005-20211016
x86_64               randconfig-a002-20211016
x86_64               randconfig-a003-20211016
x86_64               randconfig-a012-20211015
x86_64               randconfig-a015-20211015
x86_64               randconfig-a016-20211015
x86_64               randconfig-a014-20211015
x86_64               randconfig-a011-20211015
x86_64               randconfig-a013-20211015
i386                 randconfig-a016-20211015
i386                 randconfig-a014-20211015
i386                 randconfig-a011-20211015
i386                 randconfig-a015-20211015
i386                 randconfig-a012-20211015
i386                 randconfig-a013-20211015
arc                  randconfig-r043-20211014
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
mips                 randconfig-c004-20211015
arm                  randconfig-c002-20211015
i386                 randconfig-c001-20211015
s390                 randconfig-c005-20211015
x86_64               randconfig-c007-20211015
powerpc              randconfig-c003-20211015
riscv                randconfig-c006-20211015
x86_64               randconfig-a006-20211015
x86_64               randconfig-a004-20211015
x86_64               randconfig-a001-20211015
x86_64               randconfig-a005-20211015
x86_64               randconfig-a002-20211015
x86_64               randconfig-a003-20211015
i386                 randconfig-a003-20211015
i386                 randconfig-a001-20211015
i386                 randconfig-a005-20211015
i386                 randconfig-a004-20211015
i386                 randconfig-a002-20211015
i386                 randconfig-a006-20211015
i386                 randconfig-a016-20211016
i386                 randconfig-a014-20211016
i386                 randconfig-a011-20211016
i386                 randconfig-a015-20211016
i386                 randconfig-a012-20211016
i386                 randconfig-a013-20211016
hexagon              randconfig-r041-20211016
s390                 randconfig-r044-20211016
riscv                randconfig-r042-20211016
hexagon              randconfig-r045-20211016
hexagon              randconfig-r041-20211014
s390                 randconfig-r044-20211014
riscv                randconfig-r042-20211014
hexagon              randconfig-r045-20211014
hexagon              randconfig-r041-20211015
hexagon              randconfig-r045-20211015

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
