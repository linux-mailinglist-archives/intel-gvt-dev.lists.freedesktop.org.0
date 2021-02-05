Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA94A311280
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  5 Feb 2021 21:30:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88ABE6F4CB;
	Fri,  5 Feb 2021 20:30:38 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 104F66F4CB
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  5 Feb 2021 20:30:38 +0000 (UTC)
IronPort-SDR: Ew4rAlv4AC7ihu0l1wQuDXTPN4YJjlf5GQ0ZgzgoFdNY9bcuW2VpjzLZEwNXL7TaH5MM/7w2YE
 WiLc3HapV0zQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9886"; a="200497676"
X-IronPort-AV: E=Sophos;i="5.81,156,1610438400"; d="scan'208";a="200497676"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2021 12:30:37 -0800
IronPort-SDR: Lzb4eA3ufhld+sPZGkktITf0AoUD2syqzFOeH5kqOj0KWpCCNlTPMU8d8hRE6wddPDTiUVyny7
 k+1E9r4pXzZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,156,1610438400"; d="scan'208";a="434591224"
Received: from lkp-server02.sh.intel.com (HELO 8b832f01bb9c) ([10.239.97.151])
 by orsmga001.jf.intel.com with ESMTP; 05 Feb 2021 12:30:33 -0800
Received: from kbuild by 8b832f01bb9c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1l87kO-0001yD-TH; Fri, 05 Feb 2021 20:30:32 +0000
Date: Sat, 06 Feb 2021 04:30:13 +0800
From: kernel test robot <lkp@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: [intel-gvt-linux:gvt-gt-next] BUILD SUCCESS
 e156285b120feaac6207e6bd3fa31d9ae8ffd80d
Message-ID: <601daad5.cb2dAm0OL9lMWSbk%lkp@intel.com>
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

tree/branch: https://github.com/intel/gvt-linux.git gvt-gt-next
branch HEAD: e156285b120feaac6207e6bd3fa31d9ae8ffd80d  drm/i915/gvt: Purge dev_priv->gt

elapsed time: 723m

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
arm                         axm55xx_defconfig
powerpc                      pcm030_defconfig
m68k                       m5475evb_defconfig
parisc                generic-32bit_defconfig
mips                       bmips_be_defconfig
nios2                            alldefconfig
c6x                                 defconfig
openrisc                            defconfig
m68k                         amcore_defconfig
powerpc                   motionpro_defconfig
arm                        mvebu_v7_defconfig
arm                        vexpress_defconfig
powerpc                      pmac32_defconfig
m68k                          hp300_defconfig
sh                          kfr2r09_defconfig
powerpc                 linkstation_defconfig
mips                        maltaup_defconfig
powerpc                     sequoia_defconfig
arm                           sunxi_defconfig
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
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20210205
i386                 randconfig-a005-20210205
i386                 randconfig-a003-20210205
i386                 randconfig-a006-20210205
i386                 randconfig-a002-20210205
i386                 randconfig-a004-20210205
i386                 randconfig-a013-20210205
i386                 randconfig-a016-20210205
i386                 randconfig-a014-20210205
i386                 randconfig-a012-20210205
i386                 randconfig-a015-20210205
i386                 randconfig-a011-20210205
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
x86_64               randconfig-a006-20210204
x86_64               randconfig-a001-20210204
x86_64               randconfig-a005-20210204
x86_64               randconfig-a002-20210204
x86_64               randconfig-a004-20210204
x86_64               randconfig-a003-20210204
x86_64               randconfig-a013-20210205
x86_64               randconfig-a014-20210205
x86_64               randconfig-a015-20210205
x86_64               randconfig-a011-20210205
x86_64               randconfig-a016-20210205
x86_64               randconfig-a012-20210205

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
