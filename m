Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB9F5278FE
	for <lists+intel-gvt-dev@lfdr.de>; Sun, 15 May 2022 20:03:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D1AA112888;
	Sun, 15 May 2022 18:03:20 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EB3F112888
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sun, 15 May 2022 18:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652637798; x=1684173798;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=fcypsBQ6XyhSIzJ8yK7w/ouip/g8A8owqt8yC8vHlyk=;
 b=jjoAKozgsO01TNjCTBgiy+VMBKpBVVIUQtzKju8ydUFQ7759IwlD0x5M
 KjLGjtC11OFG327IkJo93ZDFM9rYj60J3En4oI9QFKJrQ7lbufq/liD6J
 7eb30Xh8x/POJjSDDGwNKL8woUD26Gq7K1DSd8QtgiAMC4pKl8Y9IcPpq
 4KiVuUZfzFJSM4MjCRvFS9ukMVo4RzbvFBvnDX/RTPZf+XPG4k8D/TZ0i
 iPuEVGPll4qAfkvvhjpnDkW+JYDEilQ0A+TwqtJJCF6IEJg0j8o8YasYE
 +jTVTO5e4QQpBw04U1tl9ZTHbySYBu9kpLQUqSzXWO6tYXMA2OgIimifc g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10348"; a="270616878"
X-IronPort-AV: E=Sophos;i="5.91,228,1647327600"; d="scan'208";a="270616878"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2022 11:03:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,228,1647327600"; d="scan'208";a="554975422"
Received: from lkp-server01.sh.intel.com (HELO d1462bc4b09b) ([10.239.97.150])
 by orsmga002.jf.intel.com with ESMTP; 15 May 2022 11:03:15 -0700
Received: from kbuild by d1462bc4b09b with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nqIaI-0001s9-B2;
 Sun, 15 May 2022 18:03:14 +0000
Date: Mon, 16 May 2022 02:02:23 +0800
From: kernel test robot <lkp@intel.com>
To: Zhi Wang <zhi.a.wang@intel.com>
Subject: [intel-gvt:gvt-staging] BUILD SUCCESS
 c8f0c283393bd8f950e492451cc374ae21ba18d1
Message-ID: <6281402f.TROGlfgsX6gtwAFF%lkp@intel.com>
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
branch HEAD: c8f0c283393bd8f950e492451cc374ae21ba18d1  gvt-staging: 2022y-05m-12d-03h-00m-34s CST integration manifest

elapsed time: 4964m

configs tested: 100
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                              allmodconfig
arm                              allyesconfig
arm64                            allyesconfig
arm                                 defconfig
arm64                               defconfig
i386                          randconfig-c001
sh                   secureedge5410_defconfig
sh                          lboxre2_defconfig
powerpc                     taishan_defconfig
arm                             ezx_defconfig
sparc                       sparc32_defconfig
powerpc                  iss476-smp_defconfig
mips                       capcella_defconfig
parisc                generic-32bit_defconfig
sh                            hp6xx_defconfig
sh                           se7751_defconfig
sh                          rsk7264_defconfig
arm                  randconfig-c002-20220512
x86_64                        randconfig-c001
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
alpha                               defconfig
csky                                defconfig
nios2                            allyesconfig
alpha                            allyesconfig
arc                                 defconfig
h8300                            allyesconfig
sh                               allmodconfig
xtensa                           allyesconfig
parisc                              defconfig
s390                             allmodconfig
parisc                           allyesconfig
parisc64                            defconfig
s390                                defconfig
s390                             allyesconfig
i386                   debian-10.3-kselftests
i386                                defconfig
i386                             allyesconfig
sparc                               defconfig
i386                              debian-10.3
sparc                            allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a015
x86_64                        randconfig-a013
x86_64                        randconfig-a011
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
arc                  randconfig-r043-20220512
riscv                randconfig-r042-20220512
s390                 randconfig-r044-20220512
riscv                             allnoconfig
riscv                            allyesconfig
riscv                            allmodconfig
riscv                    nommu_k210_defconfig
riscv                          rv32_defconfig
riscv                    nommu_virt_defconfig
riscv                               defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                                  kexec
x86_64                          rhel-8.3-func
x86_64                               rhel-8.3
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz

clang tested configs:
powerpc                 mpc832x_rdb_defconfig
mips                     cu1830-neo_defconfig
arm                       aspeed_g4_defconfig
mips                           ip22_defconfig
mips                      pic32mzda_defconfig
x86_64               randconfig-a003-20220509
x86_64               randconfig-a001-20220509
x86_64               randconfig-a004-20220509
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a014
x86_64                        randconfig-a012
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
hexagon              randconfig-r041-20220512
hexagon              randconfig-r045-20220512

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
