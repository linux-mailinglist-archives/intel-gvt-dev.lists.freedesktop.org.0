Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D46B309047
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 29 Jan 2021 23:51:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5517C6EC49;
	Fri, 29 Jan 2021 22:51:31 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33C9C6EC49
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 29 Jan 2021 22:51:30 +0000 (UTC)
IronPort-SDR: dDSs9ko9iG/0iheh1WJ6JKZDtl30RmyKIV2xKZZFVP9GJOKrRCV090sKzQHQfnbYEGeDZzPlct
 TaCi8OBzpAFQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9879"; a="244580126"
X-IronPort-AV: E=Sophos;i="5.79,386,1602572400"; d="scan'208";a="244580126"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2021 14:51:29 -0800
IronPort-SDR: KcmV7sPRxjiUUHtrgmWCGLsMpyprtH0Um85jkzqzteWc5yyu4g7d3F5GvuIww38ZbOEvxgvsRj
 amugbDvLppXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,386,1602572400"; d="scan'208";a="354817798"
Received: from lkp-server02.sh.intel.com (HELO 625d3a354f04) ([10.239.97.151])
 by orsmga003.jf.intel.com with ESMTP; 29 Jan 2021 14:51:26 -0800
Received: from kbuild by 625d3a354f04 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1l5cbu-00047b-Uu; Fri, 29 Jan 2021 22:51:26 +0000
Date: Sat, 30 Jan 2021 06:50:34 +0800
From: kernel test robot <lkp@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: [intel-gvt-linux:gvt-staging] BUILD SUCCESS
 635f961a1719928edce2995b049e184ff4892ee3
Message-ID: <6014913a.Ls8Hdmjyw1R6bd0x%lkp@intel.com>
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
branch HEAD: 635f961a1719928edce2995b049e184ff4892ee3  gvt-staging: 2021y-01m-29d-17h-40m-55s CST integration manifest

elapsed time: 720m

configs tested: 96
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                          rsk7269_defconfig
powerpc                 mpc832x_rdb_defconfig
arm                        magician_defconfig
sh                           se7343_defconfig
powerpc                        icon_defconfig
arm                       imx_v4_v5_defconfig
h8300                     edosk2674_defconfig
powerpc                      ep88xc_defconfig
m68k                          amiga_defconfig
m68k                          sun3x_defconfig
powerpc                 mpc836x_rdk_defconfig
sh                           se7206_defconfig
sh                             sh03_defconfig
arm                        vexpress_defconfig
powerpc                 mpc836x_mds_defconfig
powerpc                     powernv_defconfig
m68k                       m5475evb_defconfig
arm                          ixp4xx_defconfig
arm                          collie_defconfig
openrisc                    or1ksim_defconfig
ia64                             allmodconfig
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
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a002-20210129
x86_64               randconfig-a003-20210129
x86_64               randconfig-a001-20210129
x86_64               randconfig-a005-20210129
x86_64               randconfig-a006-20210129
x86_64               randconfig-a004-20210129
i386                 randconfig-a001-20210129
i386                 randconfig-a002-20210129
i386                 randconfig-a004-20210129
i386                 randconfig-a005-20210129
i386                 randconfig-a003-20210129
i386                 randconfig-a006-20210129
i386                 randconfig-a013-20210129
i386                 randconfig-a011-20210129
i386                 randconfig-a012-20210129
i386                 randconfig-a016-20210129
i386                 randconfig-a014-20210129
i386                 randconfig-a015-20210129
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
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a012-20210129
x86_64               randconfig-a015-20210129
x86_64               randconfig-a016-20210129
x86_64               randconfig-a011-20210129
x86_64               randconfig-a013-20210129
x86_64               randconfig-a014-20210129

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
