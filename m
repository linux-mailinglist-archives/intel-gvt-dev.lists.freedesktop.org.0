Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B5B50372B
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 16 Apr 2022 16:48:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 857F710E10F;
	Sat, 16 Apr 2022 14:48:12 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A678B10E0CF
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 16 Apr 2022 14:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650120490; x=1681656490;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=SkwEmvaTOPGXO1smTI2cs0nmTdCwxvIkLyHSAo2KPm4=;
 b=OxgsOSaCvPIqoU2m2oLuk7GZvN0nc3BCfVVk3dLeVcBQR7pDeOZzu+cd
 fCeufHvOKS2YskrszdAk+jCa2LxrQm634lxN6Y07Vz6sWtM9Spj1syW/0
 XgptsPpmuGhvDbABIwlU3xRj9DzUFQgztSp/P6qMHlqDkQRaSnmIr66Pt
 JYUsBP0v7uvdXQxqQiKQ+Jz1qAj7StXffAaD8+O9Jqd1WF0UyYpQl4u4x
 4C1roEEGS2Gq5Ohvhe3aLTV9bJXeRO3Wi6Si7WAKcx4lXMN5fAOm9VyKx
 gdCafVRvdsVfCYLiwh5ZH2GD7BHDXcLU3F215DquuNIT5NxDBZs3wHRAS A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10318"; a="263473053"
X-IronPort-AV: E=Sophos;i="5.90,264,1643702400"; d="scan'208";a="263473053"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2022 07:48:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,264,1643702400"; d="scan'208";a="528290721"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
 by orsmga006.jf.intel.com with ESMTP; 16 Apr 2022 07:48:07 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nfjiZ-0003E9-6J;
 Sat, 16 Apr 2022 14:48:07 +0000
Date: Sat, 16 Apr 2022 22:47:31 +0800
From: kernel test robot <lkp@intel.com>
To: Zhi Wang <zhi.a.wang@intel.com>
Subject: [intel-gvt:gvt-staging] BUILD SUCCESS
 e2bb3d785e0e03b8def9e8e8af7a90889533ac61
Message-ID: <625ad703.JQaziDW36hNvUi77%lkp@intel.com>
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
branch HEAD: e2bb3d785e0e03b8def9e8e8af7a90889533ac61  gvt-staging: 2022y-04m-14d-19h-33m-02s CST integration manifest

elapsed time: 2127m

configs tested: 108
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm64                               defconfig
arm                              allyesconfig
i386                          randconfig-c001
powerpc              randconfig-c003-20220414
powerpc                     tqm8548_defconfig
sh                            shmin_defconfig
arc                           tb10x_defconfig
m68k                           sun3_defconfig
powerpc                     taishan_defconfig
powerpc                 linkstation_defconfig
powerpc                       eiger_defconfig
powerpc                 mpc85xx_cds_defconfig
powerpc64                        alldefconfig
sh                           se7722_defconfig
sh                   sh7724_generic_defconfig
arm                     eseries_pxa_defconfig
arm                  randconfig-c002-20220414
x86_64                        randconfig-c001
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
alpha                               defconfig
csky                                defconfig
alpha                            allyesconfig
nios2                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
h8300                            allyesconfig
xtensa                           allyesconfig
parisc                              defconfig
parisc64                            defconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
s390                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
sparc                            allyesconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                                defconfig
i386                             allyesconfig
sparc                               defconfig
mips                             allmodconfig
mips                             allyesconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a016
i386                          randconfig-a014
arc                  randconfig-r043-20220414
riscv                            allmodconfig
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                            allyesconfig
riscv                               defconfig
riscv                          rv32_defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                                  kexec
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests

clang tested configs:
powerpc                   microwatt_defconfig
powerpc                    mvme5100_defconfig
arm                  colibri_pxa270_defconfig
powerpc                    socrates_defconfig
powerpc                  mpc885_ads_defconfig
powerpc                     akebono_defconfig
powerpc                        icon_defconfig
arm                        neponset_defconfig
riscv                          rv32_defconfig
arm                          ixp4xx_defconfig
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a014
x86_64                        randconfig-a012
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
hexagon              randconfig-r041-20220414
hexagon              randconfig-r045-20220414
riscv                randconfig-r042-20220414
s390                 randconfig-r044-20220414

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
