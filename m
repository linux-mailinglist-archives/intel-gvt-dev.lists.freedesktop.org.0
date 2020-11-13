Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D382B21DF
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 13 Nov 2020 18:18:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDDA26E598;
	Fri, 13 Nov 2020 17:18:15 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBF5B6E598
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 13 Nov 2020 17:18:14 +0000 (UTC)
IronPort-SDR: AGzmQmeAobHc9VFY03FSF2WzJP2KHBEOKDvv4zolOTjxEKkU+D7bVOOFTlOdIIEpaHdx8IlDoL
 BRCzTyhTbWFw==
X-IronPort-AV: E=McAfee;i="6000,8403,9804"; a="170607302"
X-IronPort-AV: E=Sophos;i="5.77,476,1596524400"; d="scan'208";a="170607302"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2020 09:18:14 -0800
IronPort-SDR: VUG0xotwfJfBrqcnXjEzIuGAuubemzeruf/duD5oxZ/V/BE1JBhpBQZ69kltCgt9ZGwsxztmcd
 d/2hkACRfGHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,476,1596524400"; d="scan'208";a="542724503"
Received: from lkp-server02.sh.intel.com (HELO 697932c29306) ([10.239.97.151])
 by orsmga005.jf.intel.com with ESMTP; 13 Nov 2020 09:18:12 -0800
Received: from kbuild by 697932c29306 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kdciC-0000SQ-35; Fri, 13 Nov 2020 17:18:12 +0000
Date: Sat, 14 Nov 2020 01:17:42 +0800
From: kernel test robot <lkp@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: [intel-gvt-linux:gvt-staging] BUILD SUCCESS
 77002257d34073faeb517deffe6d7a41ff5e8220
Message-ID: <5faebfb6.ujuywhJQfnwrtwfy%lkp@intel.com>
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
branch HEAD: 77002257d34073faeb517deffe6d7a41ff5e8220  gvt-staging: 2020y-11m-13d-12h-39m-58s CST integration manifest

elapsed time: 720m

configs tested: 71
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                         rt305x_defconfig
sh                 kfr2r09-romimage_defconfig
m68k                       m5475evb_defconfig
sh                           se7724_defconfig
arm                        mvebu_v7_defconfig
arm                          gemini_defconfig
sh                          rsk7269_defconfig
arm                         s3c6400_defconfig
sh                           se7712_defconfig
s390                                defconfig
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
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
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
x86_64               randconfig-a015-20201113
x86_64               randconfig-a011-20201113
x86_64               randconfig-a014-20201113
x86_64               randconfig-a013-20201113
x86_64               randconfig-a016-20201113
x86_64               randconfig-a012-20201113
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                                  kexec
x86_64                                   rhel
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3

clang tested configs:
x86_64               randconfig-a003-20201113
x86_64               randconfig-a005-20201113
x86_64               randconfig-a004-20201113
x86_64               randconfig-a002-20201113
x86_64               randconfig-a006-20201113
x86_64               randconfig-a001-20201113

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
