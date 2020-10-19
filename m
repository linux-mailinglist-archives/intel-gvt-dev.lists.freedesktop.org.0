Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DED329302D
	for <lists+intel-gvt-dev@lfdr.de>; Mon, 19 Oct 2020 23:06:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5B7C6EAB0;
	Mon, 19 Oct 2020 21:06:46 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CEA46EAB0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 19 Oct 2020 21:06:46 +0000 (UTC)
IronPort-SDR: f7E2xHSnhopU5FrX3pAzWAM/VFiYy32s0360N5cgatREGDpCpeOGO0dsglkmZ8fwOEltx1Xs6T
 /4+KFr034Qqw==
X-IronPort-AV: E=McAfee;i="6000,8403,9779"; a="154890726"
X-IronPort-AV: E=Sophos;i="5.77,395,1596524400"; d="scan'208";a="154890726"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2020 14:06:36 -0700
IronPort-SDR: B0bhsrvNF3++bM1lYixkpeuAgDbIn6B/iK+v8VmPX+tVEqlNGgpN55QeUJ2m/ReQf2kwTXFFyz
 LFmrMIVt7MYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,395,1596524400"; d="scan'208";a="332011315"
Received: from lkp-server01.sh.intel.com (HELO 88424da292e0) ([10.239.97.150])
 by orsmga002.jf.intel.com with ESMTP; 19 Oct 2020 14:06:35 -0700
Received: from kbuild by 88424da292e0 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kUcMU-0000H6-Oa; Mon, 19 Oct 2020 21:06:34 +0000
Date: Tue, 20 Oct 2020 05:06:06 +0800
From: kernel test robot <lkp@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: [intel-gvt-linux:gvt-staging] BUILD SUCCESS
 a4563769b3b563b05d38ee55582958909770d272
Message-ID: <5f8dffbe.UgW+DsLSfr9lMgMG%lkp@intel.com>
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
branch HEAD: a4563769b3b563b05d38ee55582958909770d272  gvt-staging: 2020y-10m-19d-16h-58m-55s CST integration manifest

elapsed time: 724m

configs tested: 99
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                       omap2plus_defconfig
c6x                        evmc6678_defconfig
sparc                       sparc64_defconfig
arm                        keystone_defconfig
xtensa                          iss_defconfig
ia64                      gensparse_defconfig
mips                        workpad_defconfig
s390                          debug_defconfig
arm                       cns3420vb_defconfig
m68k                       m5275evb_defconfig
c6x                              allyesconfig
powerpc                 mpc836x_rdk_defconfig
sh                          rsk7203_defconfig
powerpc                       ppc64_defconfig
i386                                defconfig
mips                          ath25_defconfig
powerpc                     kilauea_defconfig
arm                            zeus_defconfig
powerpc                      katmai_defconfig
mips                    maltaup_xpa_defconfig
alpha                               defconfig
arm                           tegra_defconfig
sh                           se7724_defconfig
arm                             mxs_defconfig
powerpc                    mvme5100_defconfig
arm                       multi_v4t_defconfig
powerpc                 mpc837x_mds_defconfig
powerpc                     ppa8548_defconfig
ia64                             allmodconfig
ia64                                defconfig
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
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20201019
x86_64               randconfig-a002-20201019
x86_64               randconfig-a006-20201019
x86_64               randconfig-a003-20201019
x86_64               randconfig-a005-20201019
x86_64               randconfig-a001-20201019
i386                 randconfig-a006-20201019
i386                 randconfig-a005-20201019
i386                 randconfig-a001-20201019
i386                 randconfig-a003-20201019
i386                 randconfig-a004-20201019
i386                 randconfig-a002-20201019
i386                 randconfig-a015-20201019
i386                 randconfig-a013-20201019
i386                 randconfig-a016-20201019
i386                 randconfig-a012-20201019
i386                 randconfig-a011-20201019
i386                 randconfig-a014-20201019
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
x86_64               randconfig-a016-20201019
x86_64               randconfig-a015-20201019
x86_64               randconfig-a012-20201019
x86_64               randconfig-a013-20201019
x86_64               randconfig-a011-20201019
x86_64               randconfig-a014-20201019

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
