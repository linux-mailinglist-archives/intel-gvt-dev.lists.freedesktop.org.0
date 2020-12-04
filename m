Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C9A2CE5A2
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  4 Dec 2020 03:22:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8BEC6E0FE;
	Fri,  4 Dec 2020 02:22:34 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0780A6E0FE
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  4 Dec 2020 02:22:33 +0000 (UTC)
IronPort-SDR: xVeufzryLrNSqjrjbrHodAL4UbeZQcY1tFe7iuCLo2tFIiIvMa1i4MoAh/YjKptDUOAM72tZ5u
 in4E3SAyr9yw==
X-IronPort-AV: E=McAfee;i="6000,8403,9824"; a="152565535"
X-IronPort-AV: E=Sophos;i="5.78,391,1599548400"; d="scan'208";a="152565535"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2020 18:22:33 -0800
IronPort-SDR: 0CPcXNIVskPItLYEwYVCiGQpXgdobz1LykiBFhK/SDmK6ycnxYxSd+5S8ofqGfE2zEkTFxPhyp
 gmuCNaGWm/lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,391,1599548400"; d="scan'208";a="331059981"
Received: from lkp-server01.sh.intel.com (HELO 14e4acb3e84f) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 03 Dec 2020 18:22:31 -0800
Received: from kbuild by 14e4acb3e84f with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kl0ju-00000V-E5; Fri, 04 Dec 2020 02:22:30 +0000
Date: Fri, 04 Dec 2020 10:22:11 +0800
From: kernel test robot <lkp@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: [intel-gvt-linux:gvt-next-fixes] BUILD SUCCESS
 0a8cad54792ebce476f6780d7fd1832d9d4b9217
Message-ID: <5fc99d53.Tqkr4Dp+SYFCxoeA%lkp@intel.com>
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

tree/branch: https://github.com/intel/gvt-linux.git  gvt-next-fixes
branch HEAD: 0a8cad54792ebce476f6780d7fd1832d9d4b9217  drm/i915/gvt: avoid useless use of inline

elapsed time: 1249m

configs tested: 116
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                     tqm8541_defconfig
nios2                         3c120_defconfig
powerpc                     pseries_defconfig
sparc                       sparc64_defconfig
mips                           ip22_defconfig
m68k                          multi_defconfig
sh                          r7780mp_defconfig
sh                           se7712_defconfig
riscv                               defconfig
m68k                             alldefconfig
arm                         socfpga_defconfig
mips                     loongson1b_defconfig
sh                ecovec24-romimage_defconfig
m68k                       m5275evb_defconfig
sh                                  defconfig
sh                          r7785rp_defconfig
powerpc                      arches_defconfig
arm                            xcep_defconfig
arm                            hisi_defconfig
arm                             ezx_defconfig
powerpc                 mpc836x_rdk_defconfig
sh                           se7724_defconfig
mips                      loongson3_defconfig
microblaze                          defconfig
powerpc                  mpc866_ads_defconfig
nios2                         10m50_defconfig
mips                          ath25_defconfig
powerpc                     stx_gp3_defconfig
xtensa                  cadence_csp_defconfig
powerpc                       maple_defconfig
parisc                           alldefconfig
um                             i386_defconfig
powerpc                       ppc64_defconfig
ia64                         bigsur_defconfig
powerpc                     tqm8560_defconfig
powerpc                          allyesconfig
powerpc                    socrates_defconfig
mips                           rs90_defconfig
arm                        magician_defconfig
m68k                                defconfig
powerpc                           allnoconfig
sh                           se7722_defconfig
arm                         mv78xx0_defconfig
sh                        dreamcast_defconfig
m68k                        m5272c3_defconfig
openrisc                 simple_smp_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
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
powerpc                          allmodconfig
i386                 randconfig-a004-20201203
i386                 randconfig-a005-20201203
i386                 randconfig-a001-20201203
i386                 randconfig-a002-20201203
i386                 randconfig-a006-20201203
i386                 randconfig-a003-20201203
x86_64               randconfig-a016-20201203
x86_64               randconfig-a012-20201203
x86_64               randconfig-a014-20201203
x86_64               randconfig-a013-20201203
x86_64               randconfig-a015-20201203
x86_64               randconfig-a011-20201203
i386                 randconfig-a014-20201203
i386                 randconfig-a013-20201203
i386                 randconfig-a011-20201203
i386                 randconfig-a015-20201203
i386                 randconfig-a012-20201203
i386                 randconfig-a016-20201203
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a006-20201203
x86_64               randconfig-a004-20201203
x86_64               randconfig-a001-20201203
x86_64               randconfig-a002-20201203
x86_64               randconfig-a005-20201203
x86_64               randconfig-a003-20201203

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
