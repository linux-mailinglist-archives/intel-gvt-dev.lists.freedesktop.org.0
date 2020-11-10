Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFC62ADF1B
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 10 Nov 2020 20:09:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04BD989BA1;
	Tue, 10 Nov 2020 19:09:21 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C9E489B65
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 10 Nov 2020 19:09:19 +0000 (UTC)
IronPort-SDR: L6qW2mxktYodzgwouipdg5BzKqiJrvmjXjfmjGTb+d7NA6T/v+13FMqBUa4mZvQ4ZlrWJPtoHT
 FwacCEQWPtLw==
X-IronPort-AV: E=McAfee;i="6000,8403,9801"; a="170141460"
X-IronPort-AV: E=Sophos;i="5.77,467,1596524400"; d="scan'208";a="170141460"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2020 11:09:18 -0800
IronPort-SDR: hRDPO+WUfJP8iLEdks3EIPFukruBLZUBVNIzozgjdr52ek5icj2+s51tbbiLa9I0kpT8RHa/cW
 IwwD7nJLA/qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,467,1596524400"; d="scan'208";a="360257300"
Received: from lkp-server02.sh.intel.com (HELO c6c5fbb3488a) ([10.239.97.151])
 by fmsmga002.fm.intel.com with ESMTP; 10 Nov 2020 11:09:16 -0800
Received: from kbuild by c6c5fbb3488a with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kcZ11-0000Pr-IO; Tue, 10 Nov 2020 19:09:15 +0000
Date: Wed, 11 Nov 2020 03:08:25 +0800
From: kernel test robot <lkp@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: [intel-gvt-linux:gvt-next] BUILD SUCCESS
 a5a8ef937cfa79167f4b2a5602092b8d14fd6b9a
Message-ID: <5faae529.ESokNe2EJO4WFXx1%lkp@intel.com>
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
branch HEAD: a5a8ef937cfa79167f4b2a5602092b8d14fd6b9a  drm/i915/gvt: Fix virtual display setup for BXT/APL

elapsed time: 724m

configs tested: 112
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                           se7750_defconfig
mips                           gcw0_defconfig
sh                          polaris_defconfig
powerpc                 mpc832x_mds_defconfig
csky                             alldefconfig
sh                     sh7710voipgw_defconfig
arm                        mvebu_v5_defconfig
arm                             rpc_defconfig
arm                        realview_defconfig
arc                        nsim_700_defconfig
sh                          rsk7201_defconfig
powerpc                   motionpro_defconfig
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
mips                         rt305x_defconfig
nios2                         3c120_defconfig
arm                        keystone_defconfig
powerpc                    gamecube_defconfig
sh                           se7343_defconfig
mips                           ip32_defconfig
sh                      rts7751r2d1_defconfig
powerpc                     ep8248e_defconfig
powerpc                     asp8347_defconfig
mips                        nlm_xlr_defconfig
arm                        multi_v5_defconfig
powerpc                     stx_gp3_defconfig
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
i386                 randconfig-a006-20201110
i386                 randconfig-a005-20201110
i386                 randconfig-a002-20201110
i386                 randconfig-a001-20201110
i386                 randconfig-a003-20201110
i386                 randconfig-a004-20201110
x86_64               randconfig-a003-20201110
x86_64               randconfig-a005-20201110
x86_64               randconfig-a004-20201110
x86_64               randconfig-a002-20201110
x86_64               randconfig-a006-20201110
x86_64               randconfig-a001-20201110
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
