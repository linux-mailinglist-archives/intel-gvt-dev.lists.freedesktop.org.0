Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF7F4D23C7
	for <lists+intel-gvt-dev@lfdr.de>; Tue,  8 Mar 2022 23:01:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE78910E5D0;
	Tue,  8 Mar 2022 22:01:43 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D58B410E517
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  8 Mar 2022 22:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646776902; x=1678312902;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=bg1bUXWbqMWnKUgdVLevGgfJVMYKNkXMHVNfCqO0d/Q=;
 b=S5cDLnw2o3vNv4vX621K//mUI5H8KEBI3WI67BRgS6sgb5bokXxZ2gED
 ECFGEUCFU+WppqfgJwT48Jng1lK1IBEYJ44ftHbVa0uY4rdH9341fRaz/
 ysYHAkp2bzKBDD0Y3nYcnG/bR5ymiyOwjLoJWkmwEXHLdVNfsPf4DmfEA
 Fc3dFDQCmc3hU5Jts2sFIQnAuUnFj5rSHLCbFtKFx3qCo4MNTidLYkSHV
 0UmgSo/9ZVYGun7cI1x2xf55NGKZaJSnI0Rx92UxtnC2QIAqpv7I6fs0x
 KsNJuXNLhfVYslFyW+oMbm+im6HQPxRJsluuRESWGun3rs0qxjU5G///b A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="318053316"
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="318053316"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 14:01:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="641927017"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by fmsmga002.fm.intel.com with ESMTP; 08 Mar 2022 14:01:40 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nRhtj-00025C-Td; Tue, 08 Mar 2022 22:01:39 +0000
Date: Wed, 09 Mar 2022 06:01:12 +0800
From: kernel test robot <lkp@intel.com>
To: Zhi Wang <zhi.a.wang@intel.com>
Subject: [intel-gvt:gvt-staging] BUILD SUCCESS
 18521b4e0c3f7c2c5717a41d6be85259fe308951
Message-ID: <6227d228.VfowD6S2XM++DpBW%lkp@intel.com>
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
branch HEAD: 18521b4e0c3f7c2c5717a41d6be85259fe308951  gvt-staging: 2022y-03m-07d-09h-44m-36s CST integration manifest

elapsed time: 1500m

configs tested: 130
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
alpha                            alldefconfig
arm                      footbridge_defconfig
m68k                           sun3_defconfig
sh                          rsk7269_defconfig
mips                             allyesconfig
sh                   secureedge5410_defconfig
powerpc                       ppc64_defconfig
sh                              ul2_defconfig
powerpc                      tqm8xx_defconfig
arm                         lubbock_defconfig
sh                        dreamcast_defconfig
powerpc                mpc7448_hpc2_defconfig
mips                     decstation_defconfig
ia64                          tiger_defconfig
x86_64                              defconfig
sparc                       sparc32_defconfig
arm                            zeus_defconfig
sh                          landisk_defconfig
powerpc                   currituck_defconfig
powerpc                      ppc40x_defconfig
xtensa                           alldefconfig
microblaze                          defconfig
powerpc                     redwood_defconfig
parisc                generic-32bit_defconfig
um                                  defconfig
sh                            titan_defconfig
arm                        oxnas_v6_defconfig
arm                            pleb_defconfig
mips                            ar7_defconfig
riscv                               defconfig
powerpc                 mpc834x_itx_defconfig
arm                            hisi_defconfig
m68k                       m5249evb_defconfig
um                           x86_64_defconfig
arm                  randconfig-c002-20220308
arm                  randconfig-c002-20220307
ia64                             allmodconfig
ia64                             allyesconfig
ia64                                defconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
csky                                defconfig
alpha                               defconfig
nds32                               defconfig
nios2                            allyesconfig
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
parisc64                            defconfig
parisc                           allyesconfig
s390                                defconfig
sparc                               defconfig
sparc                            allyesconfig
i386                             allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                 randconfig-a005-20220307
i386                 randconfig-a004-20220307
i386                 randconfig-a003-20220307
i386                 randconfig-a006-20220307
i386                 randconfig-a002-20220307
i386                 randconfig-a001-20220307
x86_64               randconfig-a003-20220307
x86_64               randconfig-a001-20220307
x86_64               randconfig-a002-20220307
x86_64               randconfig-a006-20220307
x86_64               randconfig-a005-20220307
x86_64               randconfig-a004-20220307
arc                  randconfig-r043-20220307
arc                  randconfig-r043-20220308
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                                  kexec
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit

clang tested configs:
x86_64                        randconfig-c007
powerpc              randconfig-c003-20220308
arm                  randconfig-c002-20220308
mips                 randconfig-c004-20220308
i386                          randconfig-c001
s390                 randconfig-c005-20220308
riscv                randconfig-c006-20220308
mips                           mtx1_defconfig
arm                            dove_defconfig
powerpc                     ksi8560_defconfig
riscv                    nommu_virt_defconfig
arm                         lpc32xx_defconfig
arm                      tct_hammer_defconfig
powerpc                      walnut_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r041-20220307
riscv                randconfig-r042-20220307
s390                 randconfig-r044-20220307
hexagon              randconfig-r045-20220308

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
