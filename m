Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5BF32DB28
	for <lists+intel-gvt-dev@lfdr.de>; Thu,  4 Mar 2021 21:26:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 215606E12A;
	Thu,  4 Mar 2021 20:26:49 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCA0C6E12A
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  4 Mar 2021 20:26:47 +0000 (UTC)
IronPort-SDR: czt9okoaeoVsSUpHFRhsfplKTMQC4XvC4Lt3lAN6wSHW4gPVWHgm6NekmCeG8MpWviGOM1WHON
 qTxGFn/W4yFg==
X-IronPort-AV: E=McAfee;i="6000,8403,9913"; a="272505556"
X-IronPort-AV: E=Sophos;i="5.81,223,1610438400"; d="scan'208";a="272505556"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2021 12:26:47 -0800
IronPort-SDR: vh8P8p9T3W70J6P5Sx/7doddLUaHGULTHdkfeYLk53HlcL7qbKu1aUSxdLRTF8lLIBS57azglm
 jtGQJWiFNZaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,223,1610438400"; d="scan'208";a="406985775"
Received: from lkp-server02.sh.intel.com (HELO 2482ff9f8ac0) ([10.239.97.151])
 by orsmga007.jf.intel.com with ESMTP; 04 Mar 2021 12:26:45 -0800
Received: from kbuild by 2482ff9f8ac0 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lHuYW-0002NQ-NG; Thu, 04 Mar 2021 20:26:44 +0000
Date: Fri, 05 Mar 2021 04:25:45 +0800
From: kernel test robot <lkp@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: [intel-gvt-linux:gvt-staging] BUILD SUCCESS
 9cd10e666959aae21783e00206e0a442d99a6329
Message-ID: <60414249.u9LdEmonNeZ5EMa4%lkp@intel.com>
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
branch HEAD: 9cd10e666959aae21783e00206e0a442d99a6329  gvt-staging: 2021y-03m-04d-15h-05m-55s CST integration manifest

elapsed time: 720m

configs tested: 120
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                             pxa_defconfig
xtensa                         virt_defconfig
powerpc                          allyesconfig
powerpc                 mpc8313_rdb_defconfig
powerpc                        icon_defconfig
mips                malta_kvm_guest_defconfig
arm                          badge4_defconfig
arm                            mps2_defconfig
arm                        multi_v7_defconfig
mips                      maltaaprp_defconfig
arc                          axs103_defconfig
powerpc                     ep8248e_defconfig
mips                      bmips_stb_defconfig
arm                        multi_v5_defconfig
mips                        vocore2_defconfig
sh                           se7780_defconfig
alpha                               defconfig
mips                         tb0287_defconfig
m68k                        m5307c3_defconfig
arc                 nsimosci_hs_smp_defconfig
arm                          imote2_defconfig
arm                         hackkit_defconfig
um                             i386_defconfig
mips                        maltaup_defconfig
powerpc                     sequoia_defconfig
arm                             ezx_defconfig
arm                         s3c2410_defconfig
powerpc                 mpc832x_rdb_defconfig
mips                      malta_kvm_defconfig
m68k                         amcore_defconfig
arm                          ep93xx_defconfig
powerpc                      pmac32_defconfig
microblaze                          defconfig
mips                      fuloong2e_defconfig
m68k                       m5208evb_defconfig
powerpc                       ebony_defconfig
sh                            titan_defconfig
mips                     loongson1c_defconfig
riscv                            allmodconfig
powerpc                     akebono_defconfig
powerpc                 mpc8272_ads_defconfig
powerpc               mpc834x_itxgp_defconfig
powerpc                      pasemi_defconfig
powerpc64                           defconfig
ia64                                defconfig
powerpc                      bamboo_defconfig
powerpc                     mpc83xx_defconfig
powerpc                      chrp32_defconfig
xtensa                generic_kc705_defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20210304
x86_64               randconfig-a001-20210304
x86_64               randconfig-a004-20210304
x86_64               randconfig-a005-20210304
x86_64               randconfig-a002-20210304
x86_64               randconfig-a003-20210304
i386                 randconfig-a005-20210304
i386                 randconfig-a003-20210304
i386                 randconfig-a002-20210304
i386                 randconfig-a004-20210304
i386                 randconfig-a006-20210304
i386                 randconfig-a001-20210304
i386                 randconfig-a016-20210304
i386                 randconfig-a012-20210304
i386                 randconfig-a013-20210304
i386                 randconfig-a014-20210304
i386                 randconfig-a011-20210304
i386                 randconfig-a015-20210304
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a013-20210304
x86_64               randconfig-a016-20210304
x86_64               randconfig-a015-20210304
x86_64               randconfig-a014-20210304
x86_64               randconfig-a012-20210304
x86_64               randconfig-a011-20210304

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
