Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B79CB274B83
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 22 Sep 2020 23:49:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E205893EA;
	Tue, 22 Sep 2020 21:49:49 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8A4B6E2DC
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 22 Sep 2020 21:49:47 +0000 (UTC)
IronPort-SDR: oxOwLK5FbnfvgPtZzQ1bv28GdizCg6KJHFfYdTHkGm+JI+UPFKj9yWv/ZUtn2rL7PrTURY1uaT
 2zOyNXoeQ1AA==
X-IronPort-AV: E=McAfee;i="6000,8403,9752"; a="148471304"
X-IronPort-AV: E=Sophos;i="5.77,292,1596524400"; d="scan'208";a="148471304"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2020 14:49:46 -0700
IronPort-SDR: suLz4APa0pErNmAXPvS5LFz609enLMSKd6JxlMxZ6X0/F4H6W2EZhLStjz5LMfEDfXaC1P/VFn
 7JZUj+IKyJUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,292,1596524400"; d="scan'208";a="305114057"
Received: from lkp-server01.sh.intel.com (HELO 928d8e596b58) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 22 Sep 2020 14:49:44 -0700
Received: from kbuild by 928d8e596b58 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kKqAS-0000eb-3n; Tue, 22 Sep 2020 21:49:44 +0000
Date: Wed, 23 Sep 2020 05:49:00 +0800
From: kernel test robot <lkp@intel.com>
To: Zhi Wang <zhi.wang.linux@gmail.com>
Subject: [intel-gvt-linux:topic/gvt-ww-lock] BUILD SUCCESS
 e1b49ae155451aaa039eeb23fce808c71a038283
Message-ID: <5f6a714c.XfgChovzarvClqdu%lkp@intel.com>
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

tree/branch: https://github.com/intel/gvt-linux.git  topic/gvt-ww-lock
branch HEAD: e1b49ae155451aaa039eeb23fce808c71a038283  drm/i915/gvt: Introduce per object locking in GVT scheduler.

elapsed time: 724m

configs tested: 167
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
xtensa                         virt_defconfig
powerpc                     asp8347_defconfig
arc                        nsim_700_defconfig
arm                        vexpress_defconfig
arm                       spear13xx_defconfig
arm                  colibri_pxa300_defconfig
arm                          pxa3xx_defconfig
um                           x86_64_defconfig
m68k                         amcore_defconfig
arm                       versatile_defconfig
powerpc                     pq2fads_defconfig
m68k                            q40_defconfig
arm                      tct_hammer_defconfig
arc                            hsdk_defconfig
xtensa                          iss_defconfig
sh                                  defconfig
mips                     cu1000-neo_defconfig
x86_64                           alldefconfig
arm                          badge4_defconfig
powerpc                 mpc834x_mds_defconfig
mips                        bcm63xx_defconfig
powerpc                  mpc866_ads_defconfig
arm                        clps711x_defconfig
ia64                            zx1_defconfig
powerpc                      tqm8xx_defconfig
sh                        edosk7760_defconfig
powerpc                      arches_defconfig
mips                      bmips_stb_defconfig
mips                       capcella_defconfig
powerpc                      makalu_defconfig
powerpc                 xes_mpc85xx_defconfig
arm                      footbridge_defconfig
m68k                        mvme147_defconfig
mips                      malta_kvm_defconfig
mips                            ar7_defconfig
sh                            hp6xx_defconfig
mips                  cavium_octeon_defconfig
arm                         lpc18xx_defconfig
sh                          rsk7203_defconfig
arm                         s5pv210_defconfig
arm                          exynos_defconfig
sh                           se7343_defconfig
powerpc                     tqm8540_defconfig
arm                          pxa910_defconfig
m68k                             alldefconfig
arm                            pleb_defconfig
x86_64                              defconfig
mips                        nlm_xlr_defconfig
c6x                        evmc6474_defconfig
m68k                       m5249evb_defconfig
arm                          ep93xx_defconfig
mips                           ip32_defconfig
arm                       mainstone_defconfig
powerpc                      pasemi_defconfig
arm                         lubbock_defconfig
sh                          sdk7780_defconfig
arm                          prima2_defconfig
powerpc                    gamecube_defconfig
h8300                            alldefconfig
m68k                          hp300_defconfig
sh                           se7722_defconfig
sh                             espt_defconfig
arm                        mvebu_v5_defconfig
powerpc                        icon_defconfig
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
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a005-20200920
x86_64               randconfig-a003-20200920
x86_64               randconfig-a004-20200920
x86_64               randconfig-a002-20200920
x86_64               randconfig-a006-20200920
x86_64               randconfig-a001-20200920
i386                 randconfig-a002-20200920
i386                 randconfig-a006-20200920
i386                 randconfig-a003-20200920
i386                 randconfig-a004-20200920
i386                 randconfig-a005-20200920
i386                 randconfig-a001-20200920
i386                 randconfig-a002-20200921
i386                 randconfig-a006-20200921
i386                 randconfig-a003-20200921
i386                 randconfig-a004-20200921
i386                 randconfig-a005-20200921
i386                 randconfig-a001-20200921
i386                 randconfig-a002-20200922
i386                 randconfig-a006-20200922
i386                 randconfig-a003-20200922
i386                 randconfig-a004-20200922
i386                 randconfig-a005-20200922
i386                 randconfig-a001-20200922
x86_64               randconfig-a011-20200921
x86_64               randconfig-a013-20200921
x86_64               randconfig-a014-20200921
x86_64               randconfig-a015-20200921
x86_64               randconfig-a012-20200921
x86_64               randconfig-a016-20200921
i386                 randconfig-a012-20200921
i386                 randconfig-a014-20200921
i386                 randconfig-a016-20200921
i386                 randconfig-a013-20200921
i386                 randconfig-a011-20200921
i386                 randconfig-a015-20200921
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a005-20200921
x86_64               randconfig-a003-20200921
x86_64               randconfig-a004-20200921
x86_64               randconfig-a002-20200921
x86_64               randconfig-a006-20200921
x86_64               randconfig-a001-20200921
x86_64               randconfig-a011-20200922
x86_64               randconfig-a013-20200922
x86_64               randconfig-a014-20200922
x86_64               randconfig-a015-20200922
x86_64               randconfig-a012-20200922
x86_64               randconfig-a016-20200922
x86_64               randconfig-a011-20200920
x86_64               randconfig-a013-20200920
x86_64               randconfig-a014-20200920
x86_64               randconfig-a015-20200920
x86_64               randconfig-a012-20200920
x86_64               randconfig-a016-20200920

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
