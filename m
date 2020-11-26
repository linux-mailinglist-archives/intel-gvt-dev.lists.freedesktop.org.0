Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEEBD2C5A6D
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 26 Nov 2020 18:22:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1EBC6E987;
	Thu, 26 Nov 2020 17:22:17 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E03186E987
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 26 Nov 2020 17:22:16 +0000 (UTC)
IronPort-SDR: aiW3CTtkNdSx+sE2bara3HaSd1Zj7YJRYr2akQAniU7TVWTQT0bR1X9oQcZZZ4EvPLVwJJt7GT
 qZeht2r9OK4Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="171528770"
X-IronPort-AV: E=Sophos;i="5.78,372,1599548400"; d="scan'208";a="171528770"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2020 09:22:14 -0800
IronPort-SDR: epHiLny2BBf1J0nop3fwoNTRgsJC0iAZUEV8eY5tnzt8Xk+XCGjE19tQQigVz1XgPk2ssOrQud
 1Fe1r+gY2XOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,372,1599548400"; d="scan'208";a="547781757"
Received: from lkp-server01.sh.intel.com (HELO acb209a98034) ([10.239.97.150])
 by orsmga005.jf.intel.com with ESMTP; 26 Nov 2020 09:22:12 -0800
Received: from kbuild by acb209a98034 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kiKyB-00001B-TL; Thu, 26 Nov 2020 17:22:11 +0000
Date: Fri, 27 Nov 2020 01:21:40 +0800
From: kernel test robot <lkp@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: [intel-gvt-linux:gvt-staging] BUILD SUCCESS
 f5f4380ef046d3a47c6caa1483e6936007168e95
Message-ID: <5fbfe424.2ywT2slELfuG+tqm%lkp@intel.com>
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
branch HEAD: f5f4380ef046d3a47c6caa1483e6936007168e95  gvt-staging: 2020y-11m-26d-12h-55m-43s CST integration manifest

elapsed time: 726m

configs tested: 101
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                        shmobile_defconfig
arm                           u8500_defconfig
xtensa                          iss_defconfig
sh                           se7619_defconfig
h8300                     edosk2674_defconfig
sparc                            alldefconfig
powerpc                     sequoia_defconfig
mips                    maltaup_xpa_defconfig
arc                          axs103_defconfig
mips                     loongson1c_defconfig
arc                        nsim_700_defconfig
parisc                generic-32bit_defconfig
arm                           viper_defconfig
s390                                defconfig
ia64                             allmodconfig
sh                             espt_defconfig
arm                        cerfcube_defconfig
powerpc                   currituck_defconfig
arm                        trizeps4_defconfig
sh                ecovec24-romimage_defconfig
riscv                            alldefconfig
powerpc                     taishan_defconfig
i386                                defconfig
arm                         ebsa110_defconfig
arm                           corgi_defconfig
mips                       rbtx49xx_defconfig
sh                        sh7757lcr_defconfig
powerpc                    amigaone_defconfig
powerpc               mpc834x_itxgp_defconfig
arc                     nsimosci_hs_defconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
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
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a004-20201126
i386                 randconfig-a003-20201126
i386                 randconfig-a002-20201126
i386                 randconfig-a005-20201126
i386                 randconfig-a001-20201126
i386                 randconfig-a006-20201126
i386                 randconfig-a012-20201126
i386                 randconfig-a013-20201126
i386                 randconfig-a011-20201126
i386                 randconfig-a016-20201126
i386                 randconfig-a014-20201126
i386                 randconfig-a015-20201126
x86_64               randconfig-a006-20201126
x86_64               randconfig-a003-20201126
x86_64               randconfig-a004-20201126
x86_64               randconfig-a005-20201126
x86_64               randconfig-a001-20201126
x86_64               randconfig-a002-20201126
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
x86_64               randconfig-a015-20201126
x86_64               randconfig-a011-20201126
x86_64               randconfig-a014-20201126
x86_64               randconfig-a016-20201126
x86_64               randconfig-a012-20201126
x86_64               randconfig-a013-20201126

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
