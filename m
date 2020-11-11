Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 371A02AF40B
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 11 Nov 2020 15:49:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE6C46E056;
	Wed, 11 Nov 2020 14:49:19 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29FEC6E056
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 11 Nov 2020 14:49:19 +0000 (UTC)
IronPort-SDR: R00kJBy8ydSgRq9htKCAVAgDUTMCva/f+qSJm/Vh9LNnepDhSoD7VX+/OfNpolx6xydjbmuNIo
 Cq4yWLp70K9Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9801"; a="169370931"
X-IronPort-AV: E=Sophos;i="5.77,469,1596524400"; d="scan'208";a="169370931"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2020 06:49:18 -0800
IronPort-SDR: 3HxNzLB9C9jpTH7QeyVK3KKHs4HzWxnJ8GTD/Yhyru6vP6I9itSNV9Agqey9woHBBIL2AnIiNR
 4++coAk1FmAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,469,1596524400"; d="scan'208";a="541828434"
Received: from lkp-server02.sh.intel.com (HELO 5b2c7e53fe46) ([10.239.97.151])
 by orsmga005.jf.intel.com with ESMTP; 11 Nov 2020 06:49:17 -0800
Received: from kbuild by 5b2c7e53fe46 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kcrQy-0000Iq-Cd; Wed, 11 Nov 2020 14:49:16 +0000
Date: Wed, 11 Nov 2020 22:48:57 +0800
From: kernel test robot <lkp@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: [intel-gvt-linux:gvt-next] BUILD SUCCESS
 64e65f443a43c35967242fd13b494c251bc5d7ee
Message-ID: <5fabf9d9.MwE34o5Qm0qn4/Qv%lkp@intel.com>
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
branch HEAD: 64e65f443a43c35967242fd13b494c251bc5d7ee  drm/i915/gvt: replace idr_init() by idr_init_base()

elapsed time: 725m

configs tested: 109
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc64                           defconfig
powerpc                 mpc836x_mds_defconfig
powerpc                 mpc85xx_cds_defconfig
c6x                                 defconfig
arm                          prima2_defconfig
arm                       aspeed_g5_defconfig
arm                        cerfcube_defconfig
arm                          badge4_defconfig
arm                         at91_dt_defconfig
mips                  decstation_64_defconfig
um                            kunit_defconfig
sh                          landisk_defconfig
mips                           rs90_defconfig
powerpc                       eiger_defconfig
arm                          tango4_defconfig
mips                          ath25_defconfig
powerpc                   bluestone_defconfig
sh                         ap325rxa_defconfig
s390                             allyesconfig
powerpc                      bamboo_defconfig
sh                            shmin_defconfig
powerpc                     tqm8540_defconfig
arm                            lart_defconfig
arm                        oxnas_v6_defconfig
mips                           ip22_defconfig
arc                        nsimosci_defconfig
arm                         ebsa110_defconfig
powerpc                     redwood_defconfig
openrisc                            defconfig
mips                     loongson1c_defconfig
arm                      footbridge_defconfig
m68k                            q40_defconfig
arc                      axs103_smp_defconfig
parisc                              defconfig
x86_64                           alldefconfig
arm                   milbeaut_m10v_defconfig
arm                         nhk8815_defconfig
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
parisc                           allyesconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                             allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a006-20201111
i386                 randconfig-a005-20201111
i386                 randconfig-a002-20201111
i386                 randconfig-a001-20201111
i386                 randconfig-a003-20201111
i386                 randconfig-a004-20201111
x86_64               randconfig-a015-20201111
x86_64               randconfig-a011-20201111
x86_64               randconfig-a014-20201111
x86_64               randconfig-a013-20201111
x86_64               randconfig-a016-20201111
x86_64               randconfig-a012-20201111
i386                 randconfig-a012-20201111
i386                 randconfig-a014-20201111
i386                 randconfig-a016-20201111
i386                 randconfig-a011-20201111
i386                 randconfig-a015-20201111
i386                 randconfig-a013-20201111
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
x86_64               randconfig-a003-20201111
x86_64               randconfig-a005-20201111
x86_64               randconfig-a004-20201111
x86_64               randconfig-a002-20201111
x86_64               randconfig-a006-20201111
x86_64               randconfig-a001-20201111

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
