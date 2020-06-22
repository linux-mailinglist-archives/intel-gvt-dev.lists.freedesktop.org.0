Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FAC9204266
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 22 Jun 2020 23:04:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23E4689DFE;
	Mon, 22 Jun 2020 21:04:11 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB9D989DFE
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 22 Jun 2020 21:04:09 +0000 (UTC)
IronPort-SDR: 7WqbfdHPNVeuVcxp/n+s7iMq+TIXkCyapSRfR2Bg0GEXxKo6ZX+8pfKQgcwLPznOE7dXoXrSXv
 btzFPz4mUvbQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9660"; a="142932361"
X-IronPort-AV: E=Sophos;i="5.75,268,1589266800"; d="scan'208";a="142932361"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2020 14:03:42 -0700
IronPort-SDR: pqWvCxbR3ndUZir+cI5DM5/yd0VHPOHZVS8xA1kp5tn5mxgJRqrjulyP6OHgtqhzlwCyl3UfMF
 NekAwgMjjnKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,268,1589266800"; d="scan'208";a="478611804"
Received: from lkp-server01.sh.intel.com (HELO f484c95e4fd1) ([10.239.97.150])
 by fmsmga005.fm.intel.com with ESMTP; 22 Jun 2020 14:03:40 -0700
Received: from kbuild by f484c95e4fd1 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1jnTbQ-0000SW-65; Mon, 22 Jun 2020 21:03:40 +0000
Date: Tue, 23 Jun 2020 05:03:06 +0800
From: kernel test robot <lkp@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: [intel-gvt-linux:gvt-staging] BUILD SUCCESS
 bbb75a055175247493145d91497fab1ca6905076
Message-ID: <5ef11c8a.jfAZ08TIM8bIfmWn%lkp@intel.com>
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
branch HEAD: bbb75a055175247493145d91497fab1ca6905076  gvt-staging: 2020y-06m-22d-16h-34m-48s CST integration manifest

elapsed time: 725m

configs tested: 109
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                               allnoconfig
arm64                            allyesconfig
arm64                               defconfig
arm64                            allmodconfig
arm64                             allnoconfig
nds32                            alldefconfig
mips                         mpc30x_defconfig
arm                            dove_defconfig
arm                          lpd270_defconfig
xtensa                           allyesconfig
arm                           corgi_defconfig
arm                            mmp2_defconfig
arm                        realview_defconfig
parisc                           alldefconfig
mips                malta_qemu_32r6_defconfig
arc                    vdk_hs38_smp_defconfig
arm                       netwinder_defconfig
mips                          ath79_defconfig
xtensa                    xip_kc705_defconfig
arm                        keystone_defconfig
arm                       versatile_defconfig
m68k                            mac_defconfig
sh                           sh2007_defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                                defconfig
i386                              debian-10.3
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                              allnoconfig
m68k                           sun3_defconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
nios2                            allyesconfig
openrisc                            defconfig
c6x                              allyesconfig
c6x                               allnoconfig
openrisc                         allyesconfig
nds32                               defconfig
nds32                             allnoconfig
csky                             allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
h8300                            allmodconfig
xtensa                              defconfig
arc                                 defconfig
arc                              allyesconfig
sh                               allmodconfig
sh                                allnoconfig
microblaze                        allnoconfig
mips                             allyesconfig
mips                              allnoconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                              defconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a006-20200622
i386                 randconfig-a002-20200622
i386                 randconfig-a003-20200622
i386                 randconfig-a001-20200622
i386                 randconfig-a005-20200622
i386                 randconfig-a004-20200622
i386                 randconfig-a013-20200622
i386                 randconfig-a016-20200622
i386                 randconfig-a012-20200622
i386                 randconfig-a014-20200622
i386                 randconfig-a015-20200622
i386                 randconfig-a011-20200622
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                               rhel-7.6
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                                   rhel
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
