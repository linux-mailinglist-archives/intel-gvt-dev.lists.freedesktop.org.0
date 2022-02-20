Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5E94BCCEA
	for <lists+intel-gvt-dev@lfdr.de>; Sun, 20 Feb 2022 08:16:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 503D910E239;
	Sun, 20 Feb 2022 07:16:38 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5A5110E212
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sun, 20 Feb 2022 07:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645341396; x=1676877396;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=HcULDU5A/F/osIo1mCpMLE2yRiOl4jTT7oOW5ip1SvE=;
 b=LDoGjH38nlDZVPhSf5Rje5eBqatUoZZIlBo9bfFrr0Dd53PjSOlijYIw
 X0/2g7HZfz6oVr6BKmw9G6Y5wU15/Gyi7cU9M5oyDjv9MjpPVhYDmcmRv
 rhwQToWGTgCeJ+INpIRlRXIWYjLngTZSz6KbcNvYoZhhMx1bcR/V+zYQq
 g3TmTYImf1XvJlgmWzP2sou7ERzdU/r9jtsrUL4o5CSs6BzgjWV8Fw+Fw
 zXHjy54apaal5v3l7KTJvO49lhtJxWWMCvDmTwnaF3jSRcvYZQBybTQ1+
 38X327vYYPQPRN0IsihFAVzpQhP/GJMFQykUfdVL1DsGyxsQyCoTpmugY g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10263"; a="314613069"
X-IronPort-AV: E=Sophos;i="5.88,383,1635231600"; d="scan'208";a="314613069"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2022 23:16:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,383,1635231600"; d="scan'208";a="572766762"
Received: from lkp-server01.sh.intel.com (HELO da3212ac2f54) ([10.239.97.150])
 by orsmga001.jf.intel.com with ESMTP; 19 Feb 2022 23:16:34 -0800
Received: from kbuild by da3212ac2f54 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nLgSP-00003U-Gp; Sun, 20 Feb 2022 07:16:33 +0000
Date: Sun, 20 Feb 2022 15:16:23 +0800
From: kernel test robot <lkp@intel.com>
To: Zhi Wang <zhi.a.wang@intel.com>
Subject: [intel-gvt:gvt-staging] BUILD SUCCESS
 11bd528bd71f1fd2e97a20e36b05f08602feb506
Message-ID: <6211eac7.z9gVUxvFoRydOVv3%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

tree/branch: https://github.com/intel/gvt-linux.git gvt-staging
branch HEAD: 11bd528bd71f1fd2e97a20e36b05f08602feb506  gvt-staging: 2022y-02m-17d-16h-19m-52s CST integration manifest

elapsed time: 3249m

configs tested: 104
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                          randconfig-c001
arm                        clps711x_defconfig
arm                            zeus_defconfig
sh                           se7780_defconfig
riscv                            allyesconfig
arc                          axs101_defconfig
arc                        vdk_hs38_defconfig
arc                    vdk_hs38_smp_defconfig
powerpc64                           defconfig
powerpc                    klondike_defconfig
sh                               j2_defconfig
arm                             pxa_defconfig
m68k                       m5208evb_defconfig
arm                             ezx_defconfig
microblaze                          defconfig
parisc64                            defconfig
sparc                       sparc32_defconfig
arm                  randconfig-c002-20220217
arm                  randconfig-c002-20220218
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
alpha                            allyesconfig
csky                                defconfig
alpha                               defconfig
nds32                               defconfig
nios2                            allyesconfig
arc                                 defconfig
h8300                            allyesconfig
sh                               allmodconfig
xtensa                           allyesconfig
parisc                              defconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
s390                             allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a003
i386                          randconfig-a001
i386                          randconfig-a005
riscv                randconfig-r042-20220218
arc                  randconfig-r043-20220217
s390                 randconfig-r044-20220218
arc                  randconfig-r043-20220218
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
riscv                randconfig-c006-20220217
x86_64                        randconfig-c007
powerpc              randconfig-c003-20220217
arm                  randconfig-c002-20220217
i386                          randconfig-c001
mips                 randconfig-c004-20220217
mips                          ath79_defconfig
mips                           ip22_defconfig
powerpc                     mpc5200_defconfig
powerpc                 xes_mpc85xx_defconfig
mips                     loongson2k_defconfig
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220217
hexagon              randconfig-r041-20220217
riscv                randconfig-r042-20220217
s390                 randconfig-r044-20220217

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
