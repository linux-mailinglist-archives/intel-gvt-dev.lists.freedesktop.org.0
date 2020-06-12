Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DFB1F72D7
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 12 Jun 2020 06:24:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B57616E11D;
	Fri, 12 Jun 2020 04:24:40 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9D176E11D
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 12 Jun 2020 04:24:38 +0000 (UTC)
IronPort-SDR: k+dVDxm6n4StoFEWMvBKbtP5CxgmoxpOaDiYJekIf5dot66WGZecsdUC8Y9dYxX0hFJ67LV/4I
 dmL7j+PGXwRg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2020 21:24:38 -0700
IronPort-SDR: LhEgMsLARGFHRqz6mHoC/eO9M3U4XC5ia50hTHMH3yVoV41/jmShR9FLpt6dT61hczNllO6Uz4
 cONxmSKQFkkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,501,1583222400"; d="scan'208";a="315030698"
Received: from lkp-server01.sh.intel.com (HELO b6eec31c25be) ([10.239.97.150])
 by FMSMGA003.fm.intel.com with ESMTP; 11 Jun 2020 21:24:36 -0700
Received: from kbuild by b6eec31c25be with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1jjbF6-0000UJ-4G; Fri, 12 Jun 2020 04:24:36 +0000
Date: Fri, 12 Jun 2020 12:24:12 +0800
From: kernel test robot <lkp@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: [intel-gvt-linux:gvt-staging] BUILD SUCCESS
 15375e2ecca3ac8e1ad655ce7ec24f7dfd72e505
Message-ID: <5ee3036c.9g0Z7Qc/leyagc0H%lkp@intel.com>
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
branch HEAD: 15375e2ecca3ac8e1ad655ce7ec24f7dfd72e505  gvt-staging: 2020y-06m-11d-11h-37m-34s CST integration manifest

elapsed time: 1474m

configs tested: 101
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

arm64                            allyesconfig
arm64                               defconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                               allnoconfig
mips                        workpad_defconfig
arm                         nhk8815_defconfig
mips                     loongson1b_defconfig
arm                       imx_v6_v7_defconfig
m68k                             allyesconfig
sh                     magicpanelr2_defconfig
m68k                        mvme16x_defconfig
riscv                            alldefconfig
powerpc                      ppc64e_defconfig
mips                            gpr_defconfig
i386                             allyesconfig
i386                                defconfig
i386                              debian-10.3
i386                              allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                              allnoconfig
m68k                           sun3_defconfig
m68k                                defconfig
nds32                               defconfig
nds32                             allnoconfig
csky                             allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                               defconfig
nios2                            allyesconfig
openrisc                            defconfig
c6x                              allyesconfig
c6x                               allnoconfig
openrisc                         allyesconfig
xtensa                           allyesconfig
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
i386                 randconfig-a006-20200611
i386                 randconfig-a002-20200611
i386                 randconfig-a001-20200611
i386                 randconfig-a004-20200611
i386                 randconfig-a005-20200611
i386                 randconfig-a003-20200611
i386                 randconfig-a015-20200611
i386                 randconfig-a011-20200611
i386                 randconfig-a014-20200611
i386                 randconfig-a013-20200611
i386                 randconfig-a016-20200611
i386                 randconfig-a012-20200611
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
um                                  defconfig
um                               allyesconfig
x86_64                                   rhel
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25
x86_64                               rhel-7.6
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
