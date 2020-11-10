Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F892ADF19
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 10 Nov 2020 20:09:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06C1D89622;
	Tue, 10 Nov 2020 19:09:20 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D92689622
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 10 Nov 2020 19:09:19 +0000 (UTC)
IronPort-SDR: s4TpCPGLF38V55HsWC8iDMXq4Wcvh8GP+Gd9Blo1VMlzR4jNu3/r4KYBFSCvljqttdU13/C0B3
 JZhEtSvilUmw==
X-IronPort-AV: E=McAfee;i="6000,8403,9801"; a="234199708"
X-IronPort-AV: E=Sophos;i="5.77,467,1596524400"; d="scan'208";a="234199708"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2020 11:09:18 -0800
IronPort-SDR: 5nu4P4XrbUNmJlNSRPNoQa1ls9hjjvYaAy22Kqhz1tkdy/Ft9wSHR5seKWG3PY0KFdK9trVE06
 ldJDbM11YbbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,467,1596524400"; d="scan'208";a="356274955"
Received: from lkp-server02.sh.intel.com (HELO c6c5fbb3488a) ([10.239.97.151])
 by fmsmga004.fm.intel.com with ESMTP; 10 Nov 2020 11:09:16 -0800
Received: from kbuild by c6c5fbb3488a with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kcZ11-0000Px-R0; Tue, 10 Nov 2020 19:09:15 +0000
Date: Wed, 11 Nov 2020 03:08:29 +0800
From: kernel test robot <lkp@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: [intel-gvt-linux:gvt-fixes] BUILD SUCCESS
 642403e3599e80370f71ba7a8a8c8fa82e5f6706
Message-ID: <5faae52d.Hb5ZWFqS9fiw/dgH%lkp@intel.com>
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

tree/branch: https://github.com/intel/gvt-linux.git  gvt-fixes
branch HEAD: 642403e3599e80370f71ba7a8a8c8fa82e5f6706  drm/i915/gvt: Temporarily disable vfio_edid for BXT/APL

elapsed time: 725m

configs tested: 114
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                         cm_x300_defconfig
powerpc                        fsp2_defconfig
arm                         lpc32xx_defconfig
arm                            mps2_defconfig
sh                        sh7757lcr_defconfig
c6x                        evmc6474_defconfig
powerpc                   motionpro_defconfig
sh                           se7750_defconfig
arm                          moxart_defconfig
powerpc                          g5_defconfig
mips                           ip22_defconfig
arm                      jornada720_defconfig
powerpc                       maple_defconfig
sh                               alldefconfig
sh                ecovec24-romimage_defconfig
m68k                         amcore_defconfig
powerpc                      katmai_defconfig
sh                   sh7770_generic_defconfig
mips                         tb0287_defconfig
arc                          axs101_defconfig
arm                         at91_dt_defconfig
arm                           u8500_defconfig
arm                       omap2plus_defconfig
arm                           corgi_defconfig
mips                     loongson1b_defconfig
arm                   milbeaut_m10v_defconfig
mips                           ip32_defconfig
sh                      rts7751r2d1_defconfig
powerpc                     ep8248e_defconfig
powerpc                     asp8347_defconfig
mips                        nlm_xlr_defconfig
arm                        multi_v5_defconfig
powerpc                     stx_gp3_defconfig
sh                          r7785rp_defconfig
m68k                       bvme6000_defconfig
arm                       spear13xx_defconfig
sh                          urquell_defconfig
powerpc                     sequoia_defconfig
powerpc                     tqm8548_defconfig
sh                            hp6xx_defconfig
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
x86_64               randconfig-a003-20201110
x86_64               randconfig-a005-20201110
x86_64               randconfig-a004-20201110
x86_64               randconfig-a002-20201110
x86_64               randconfig-a006-20201110
x86_64               randconfig-a001-20201110
i386                 randconfig-a006-20201110
i386                 randconfig-a005-20201110
i386                 randconfig-a002-20201110
i386                 randconfig-a001-20201110
i386                 randconfig-a003-20201110
i386                 randconfig-a004-20201110
i386                 randconfig-a012-20201110
i386                 randconfig-a014-20201110
i386                 randconfig-a016-20201110
i386                 randconfig-a011-20201110
i386                 randconfig-a015-20201110
i386                 randconfig-a013-20201110
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
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a015-20201110
x86_64               randconfig-a011-20201110
x86_64               randconfig-a014-20201110
x86_64               randconfig-a013-20201110
x86_64               randconfig-a016-20201110
x86_64               randconfig-a012-20201110

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
