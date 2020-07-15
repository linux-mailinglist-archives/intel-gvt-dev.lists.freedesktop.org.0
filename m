Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0442207D0
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 15 Jul 2020 10:52:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC8A66EA58;
	Wed, 15 Jul 2020 08:52:20 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA7206EA58
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 15 Jul 2020 08:52:19 +0000 (UTC)
IronPort-SDR: x9pC6FyEFdaULY+TjJQcjmBxq6+Z3+jDDVPrV9FaDcB5Aq0EaqscpJZz0FKXL203PUCA0CfUo8
 9/A2tYGH2ieA==
X-IronPort-AV: E=McAfee;i="6000,8403,9682"; a="136564485"
X-IronPort-AV: E=Sophos;i="5.75,354,1589266800"; d="scan'208";a="136564485"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2020 01:52:19 -0700
IronPort-SDR: pnyXRSZbInCJHFN+UZx4PS5KsJ/T8BXNdaIpsWS2F5sa1UzA1qSlka2izzqWAEJ/OjeY/3C3eU
 tgnW+LurU98Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,354,1589266800"; d="scan'208";a="316643658"
Received: from lkp-server01.sh.intel.com (HELO b157d87b7ee7) ([10.239.97.150])
 by orsmga008.jf.intel.com with ESMTP; 15 Jul 2020 01:52:17 -0700
Received: from kbuild by b157d87b7ee7 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1jvd9F-00007f-0N; Wed, 15 Jul 2020 08:52:17 +0000
Date: Wed, 15 Jul 2020 16:51:48 +0800
From: kernel test robot <lkp@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: [intel-gvt-linux:gvt-next] BUILD SUCCESS
 02b5fc1527c0bb26a1012c6a806dc033f3b125a6
Message-ID: <5f0ec3a4.+Kma/LGVJ7cohi8Y%lkp@intel.com>
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
branch HEAD: 02b5fc1527c0bb26a1012c6a806dc033f3b125a6  drm/i915/gvt: Remove intel_vgpu_reset_gtt() since no one use it.

elapsed time: 1425m

configs tested: 117
configs skipped: 3

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
sh                           se7724_defconfig
sh                          sdk7786_defconfig
arm                          tango4_defconfig
sh                            migor_defconfig
arm                         s3c6400_defconfig
m68k                         amcore_defconfig
c6x                               allnoconfig
i386                             allyesconfig
arm                          moxart_defconfig
sparc                               defconfig
mips                        maltaup_defconfig
mips                          rb532_defconfig
powerpc                mpc7448_hpc2_defconfig
mips                        nlm_xlp_defconfig
xtensa                generic_kc705_defconfig
mips                     loongson1b_defconfig
arm                            u300_defconfig
h8300                            alldefconfig
arm                        clps711x_defconfig
sh                          landisk_defconfig
arm                         assabet_defconfig
mips                 decstation_r4k_defconfig
i386                              allnoconfig
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
openrisc                         allyesconfig
nds32                               defconfig
nds32                             allnoconfig
csky                             allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
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
i386                 randconfig-a001-20200714
i386                 randconfig-a005-20200714
i386                 randconfig-a002-20200714
i386                 randconfig-a006-20200714
i386                 randconfig-a003-20200714
i386                 randconfig-a004-20200714
x86_64               randconfig-a012-20200714
x86_64               randconfig-a011-20200714
x86_64               randconfig-a013-20200714
x86_64               randconfig-a015-20200714
x86_64               randconfig-a016-20200714
x86_64               randconfig-a014-20200714
i386                 randconfig-a016-20200714
i386                 randconfig-a011-20200714
i386                 randconfig-a015-20200714
i386                 randconfig-a012-20200714
i386                 randconfig-a013-20200714
i386                 randconfig-a014-20200714
x86_64               randconfig-a005-20200715
x86_64               randconfig-a006-20200715
x86_64               randconfig-a002-20200715
x86_64               randconfig-a001-20200715
x86_64               randconfig-a003-20200715
x86_64               randconfig-a004-20200715
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
s390                                defconfig
sparc                            allyesconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                                   rhel
x86_64                                    lkp
x86_64                              fedora-25

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
