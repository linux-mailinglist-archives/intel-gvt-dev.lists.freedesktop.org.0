Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E03250FB5F
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 26 Apr 2022 12:48:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE9DA10E46C;
	Tue, 26 Apr 2022 10:48:02 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1A4310E46C
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 26 Apr 2022 10:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650970081; x=1682506081;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=9xHZSPFxY1SXVSrNj2bADmqpQDyg/bUOKFP/eJ9blMM=;
 b=HgJzmYTkfzX8v/zthZ+95GRdA4KmpFWmo01jm/66NEvjZz028Y1YYV+u
 C606LPRJdpljZ/Q+iI2BQBJN8vJX8cck8JMgB3G5WiMyUOOCoI2y052Fx
 0uY1UmgsQHryek2ozcz4+R4n3wSzZ9iVsoI6ibq4h3cdyN/wu3QajyB1j
 DoUzFy1nKXvP1sG6m+UQ5ma+HJBPK0yH2DLl9AbCPSYAbzNJvcFuuo8B3
 /jEuiQ4g85EyRbCxYPHfNDZrqsMWGdZOPYxpgrmCnvOtstdhNr+0IkPpR
 tzjrQQRx+d7Jeyl0lUPIQqdDxaglWDixGXCZsd0jbwJXsTl9KKROoOXk2 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10328"; a="265343421"
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400"; d="scan'208";a="265343421"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 03:48:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400"; d="scan'208";a="595706774"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
 by orsmga001.jf.intel.com with ESMTP; 26 Apr 2022 03:47:58 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1njIjd-0003Rm-UE;
 Tue, 26 Apr 2022 10:47:57 +0000
Date: Tue, 26 Apr 2022 18:47:07 +0800
From: kernel test robot <lkp@intel.com>
To: Zhi Wang <zhi.a.wang@intel.com>
Subject: [intel-gvt:gvt-staging] BUILD SUCCESS
 a677374cc163a965c97c74052b06cfa6b77fd998
Message-ID: <6267cdab.KvFMAXHjyOm6sAXu%lkp@intel.com>
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
branch HEAD: a677374cc163a965c97c74052b06cfa6b77fd998  gvt-staging: 2022y-04m-20d-03h-22m-13s CST integration manifest

elapsed time: 8764m

configs tested: 109
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                              allmodconfig
arm                                 defconfig
arm64                               defconfig
arm                              allyesconfig
arm64                            allyesconfig
i386                          randconfig-c001
powerpc                    sam440ep_defconfig
s390                                defconfig
sh                   sh7724_generic_defconfig
ia64                             allyesconfig
arm                      jornada720_defconfig
mips                       bmips_be_defconfig
powerpc                 canyonlands_defconfig
arm                         lpc18xx_defconfig
powerpc                      pcm030_defconfig
ia64                             allmodconfig
arm                          simpad_defconfig
riscv                               defconfig
powerpc                     stx_gp3_defconfig
ia64                      gensparse_defconfig
powerpc                   motionpro_defconfig
sh                          r7780mp_defconfig
m68k                        m5407c3_defconfig
m68k                       m5208evb_defconfig
xtensa                    smp_lx200_defconfig
s390                             allyesconfig
powerpc                      ep88xc_defconfig
sh                          rsk7269_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220420
ia64                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
alpha                               defconfig
alpha                            allyesconfig
csky                                defconfig
nios2                            allyesconfig
arc                                 defconfig
h8300                            allyesconfig
sh                               allmodconfig
xtensa                           allyesconfig
parisc                              defconfig
parisc                           allyesconfig
parisc64                            defconfig
s390                             allmodconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                             allyesconfig
i386                                defconfig
sparc                            allyesconfig
sparc                               defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220420
riscv                            allmodconfig
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                                  kexec
x86_64                          rhel-8.3-func
x86_64                               rhel-8.3
x86_64                         rhel-8.3-kunit

clang tested configs:
arm                  randconfig-c002-20220422
powerpc              randconfig-c003-20220422
mips                 randconfig-c004-20220422
x86_64                        randconfig-c007
i386                          randconfig-c001
riscv                randconfig-c006-20220422
s390                 randconfig-c005-20220422
arm                       aspeed_g4_defconfig
hexagon                          alldefconfig
mips                           ip22_defconfig
powerpc                   microwatt_defconfig
arm                         palmz72_defconfig
mips                          rm200_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
hexagon              randconfig-r041-20220420
riscv                randconfig-r042-20220420
hexagon              randconfig-r045-20220420
s390                 randconfig-r044-20220420

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
