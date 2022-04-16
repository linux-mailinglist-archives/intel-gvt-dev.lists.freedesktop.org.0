Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29806503467
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 16 Apr 2022 08:12:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F21CF10E600;
	Sat, 16 Apr 2022 06:12:56 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32DB510E5F0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 16 Apr 2022 06:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650089575; x=1681625575;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=HtY2wK4bdDITZWiBsRqb8cbufTUNqXILiR/B9GXnvRQ=;
 b=Vr7KYqXfHoMr1L3VddCcCfM6Zoai5Jq/7r4eTDVElT9M5spxUnGssKLm
 64wopGfxnALZVH7gvMniC0hQoeiwH1KpfOloBiuUm4UofqvxYEkC6C5K7
 WBAkvYbM3NuCxK61n8vFjRcAPxZkpNIb2GivZa6LOvmtzMamU6z1cvVk7
 SKzAXmQaX0r3lagKHU7Au5/vUluaEAnDMQa2mIvx9paJMlJI7fvDR+Yqt
 n0gMN7KPXT9scAFH71/Z3TOK52+odVCJjdoc+D5j3jC/Jna0PRBorrX3g
 3ClDvxAUCb+xAa2LN4VwgTBBvaTdhzBiXvfUUsSXFJ4OAiQEDeZ7VwvHs Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10318"; a="288340507"
X-IronPort-AV: E=Sophos;i="5.90,264,1643702400"; d="scan'208";a="288340507"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2022 23:12:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,264,1643702400"; d="scan'208";a="527821518"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
 by orsmga002.jf.intel.com with ESMTP; 15 Apr 2022 23:12:52 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nfbfv-0002qX-G8;
 Sat, 16 Apr 2022 06:12:51 +0000
Date: Sat, 16 Apr 2022 14:12:12 +0800
From: kernel test robot <lkp@intel.com>
To: Zhi Wang <zhi.a.wang@intel.com>
Subject: [intel-gvt:topic/for-christoph] BUILD SUCCESS
 fd6f410fe5eced449a4d6467a4f4789a8eb10382
Message-ID: <625a5e3c.bN0zek1EfKWB6NsQ%lkp@intel.com>
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

tree/branch: https://github.com/intel/gvt-linux.git topic/for-christoph
branch HEAD: fd6f410fe5eced449a4d6467a4f4789a8eb10382  vfio/mdev: Remove mdev drvdata

elapsed time: 2167m

configs tested: 146
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
s390                          debug_defconfig
powerpc                     taishan_defconfig
arc                           tb10x_defconfig
m68k                           sun3_defconfig
m68k                                defconfig
m68k                            q40_defconfig
h8300                               defconfig
sh                             espt_defconfig
sh                        edosk7705_defconfig
arm                       imx_v6_v7_defconfig
sh                               j2_defconfig
arm                         lubbock_defconfig
arm                           tegra_defconfig
arc                     haps_hs_smp_defconfig
ia64                                defconfig
arm                        trizeps4_defconfig
mips                         db1xxx_defconfig
mips                      fuloong2e_defconfig
powerpc                       eiger_defconfig
powerpc                 linkstation_defconfig
powerpc                 mpc834x_mds_defconfig
sh                   sh7770_generic_defconfig
arm                          lpd270_defconfig
sh                           se7722_defconfig
powerpc                        warp_defconfig
sparc                       sparc64_defconfig
h8300                       h8s-sim_defconfig
arm                       multi_v4t_defconfig
powerpc                     mpc83xx_defconfig
sh                        sh7757lcr_defconfig
mips                      maltasmvp_defconfig
sh                          r7780mp_defconfig
sh                        edosk7760_defconfig
arm                       aspeed_g5_defconfig
openrisc                            defconfig
powerpc                 mpc85xx_cds_defconfig
powerpc64                        alldefconfig
sh                   sh7724_generic_defconfig
arm                     eseries_pxa_defconfig
i386                             alldefconfig
powerpc                      ppc6xx_defconfig
powerpc                   motionpro_defconfig
powerpc                      cm5200_defconfig
arm                            mps2_defconfig
powerpc                     ep8248e_defconfig
arc                        nsim_700_defconfig
xtensa                  cadence_csp_defconfig
xtensa                  nommu_kc705_defconfig
sh                         microdev_defconfig
x86_64                              defconfig
powerpc                     tqm8555_defconfig
um                                  defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220414
arm                  randconfig-c002-20220415
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                                defconfig
s390                             allmodconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                             allyesconfig
sparc                               defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
riscv                randconfig-r042-20220415
arc                  randconfig-r043-20220415
s390                 randconfig-r044-20220415
arc                  randconfig-r043-20220414
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                                  kexec
x86_64                          rhel-8.3-func
x86_64                               rhel-8.3
x86_64                         rhel-8.3-kunit

clang tested configs:
mips                         tb0287_defconfig
i386                             allyesconfig
powerpc                      ppc64e_defconfig
mips                     cu1000-neo_defconfig
arm                       aspeed_g4_defconfig
arm                          ixp4xx_defconfig
arm                  colibri_pxa300_defconfig
arm                       imx_v4_v5_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
riscv                randconfig-r042-20220414
hexagon              randconfig-r041-20220414
hexagon              randconfig-r045-20220414
s390                 randconfig-r044-20220414

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
