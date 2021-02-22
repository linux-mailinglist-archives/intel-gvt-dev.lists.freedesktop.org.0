Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A9B3220BB
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 22 Feb 2021 21:20:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EF5589D53;
	Mon, 22 Feb 2021 20:20:22 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09F2F89D53
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 22 Feb 2021 20:20:20 +0000 (UTC)
IronPort-SDR: mifThKjeWqixuesXKqWA9yqsf+fJSVbsM9GyMGPDvBZBJi4aA/RUx2wiBgU2iEO18WsN0oybit
 PnxhNAxLLd8Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9903"; a="248636317"
X-IronPort-AV: E=Sophos;i="5.81,198,1610438400"; d="scan'208";a="248636317"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2021 12:20:17 -0800
IronPort-SDR: tJW1+T1NyW743TdR4x+5XkG1DUzoJ7Yz93JOgK/bzNl0RKHqwzN15E5VlPwW8Yc3j2b5lpMrdG
 UnoEytgRKk/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,198,1610438400"; d="scan'208";a="390001245"
Received: from lkp-server01.sh.intel.com (HELO 16660e54978b) ([10.239.97.150])
 by fmsmga008.fm.intel.com with ESMTP; 22 Feb 2021 12:20:15 -0800
Received: from kbuild by 16660e54978b with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lEHbu-0000e8-Fs; Mon, 22 Feb 2021 20:15:14 +0000
Date: Tue, 23 Feb 2021 04:15:06 +0800
From: kernel test robot <lkp@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: [intel-gvt-linux:gvt-staging] BUILD SUCCESS
 807cdc898d82284593bdeac078e2ce636b3f6ea8
Message-ID: <603410ca.+FawJYybSlWsSFAB%lkp@intel.com>
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

tree/branch: https://github.com/intel/gvt-linux.git gvt-staging
branch HEAD: 807cdc898d82284593bdeac078e2ce636b3f6ea8  gvt-staging: 2021y-02m-22d-14h-40m-38s CST integration manifest

elapsed time: 723m

configs tested: 106
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
h8300                       h8s-sim_defconfig
sh                          sdk7780_defconfig
arm                            xcep_defconfig
powerpc                      tqm8xx_defconfig
sh                          r7785rp_defconfig
mips                             allmodconfig
arm                        keystone_defconfig
m68k                          multi_defconfig
arm                         nhk8815_defconfig
arm                         shannon_defconfig
arm                        mvebu_v5_defconfig
sh                         ecovec24_defconfig
powerpc                     kmeter1_defconfig
m68k                          amiga_defconfig
arm                       netwinder_defconfig
mips                          ath79_defconfig
arm                        oxnas_v6_defconfig
powerpc                     akebono_defconfig
mips                            ar7_defconfig
sparc                       sparc32_defconfig
ia64                      gensparse_defconfig
powerpc                     ppa8548_defconfig
arm                        realview_defconfig
powerpc                     taishan_defconfig
arm                          pxa168_defconfig
arm                          simpad_defconfig
mips                           ci20_defconfig
i386                             allyesconfig
mips                        jmr3927_defconfig
powerpc                mpc7448_hpc2_defconfig
arm                  colibri_pxa270_defconfig
arc                        nsimosci_defconfig
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
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a005-20210222
i386                 randconfig-a006-20210222
i386                 randconfig-a004-20210222
i386                 randconfig-a003-20210222
i386                 randconfig-a001-20210222
i386                 randconfig-a002-20210222
x86_64               randconfig-a001-20210222
x86_64               randconfig-a002-20210222
x86_64               randconfig-a003-20210222
x86_64               randconfig-a005-20210222
x86_64               randconfig-a006-20210222
x86_64               randconfig-a004-20210222
i386                 randconfig-a013-20210222
i386                 randconfig-a012-20210222
i386                 randconfig-a011-20210222
i386                 randconfig-a014-20210222
i386                 randconfig-a016-20210222
i386                 randconfig-a015-20210222
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a015-20210222
x86_64               randconfig-a011-20210222
x86_64               randconfig-a012-20210222
x86_64               randconfig-a016-20210222
x86_64               randconfig-a014-20210222
x86_64               randconfig-a013-20210222

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
