Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0EAC4FA15A
	for <lists+intel-gvt-dev@lfdr.de>; Sat,  9 Apr 2022 03:43:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DE5510E169;
	Sat,  9 Apr 2022 01:43:56 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E45F810E223
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat,  9 Apr 2022 01:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649468635; x=1681004635;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=35wXBem8r0ltBTvCNRXgB3eQLr7QoeBNUwONBEHToic=;
 b=CuI2xtkTgO0pqCC0QD1m2PAar6A31WfI2i8wwzyS5Hd/PKq37FtP9ol3
 Qq8pjT9wpKQgakRW98oUSep4ONzMbX4WP66jmI7QvjggncPBP03Q+jWe4
 YJRZBnH53mEyb0m/zLWQrrZ9NKaXCI2OwLTNjmR2sapxDAyEdDUfOOqMy
 zwoVOw2PJ5JE1vWFgxLA41rxhRVTT0RwK00+ajR+NW27y6GB/AwyIptJW
 WoQZe7VcTBdi7IrOUkwEt58afPk7Luac+fCk6z4MK3GDx2rfTxSHeeU4g
 0Mmdb6hU8lwwy2P7AbZ38Pc3Qx4TWNoBNQJBBNsDm4KcWT6FM2/9wO54M A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10311"; a="286738387"
X-IronPort-AV: E=Sophos;i="5.90,246,1643702400"; d="scan'208";a="286738387"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2022 18:43:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,246,1643702400"; d="scan'208";a="852343057"
Received: from lkp-server02.sh.intel.com (HELO 7e80bc2a00a0) ([10.239.97.151])
 by fmsmga005.fm.intel.com with ESMTP; 08 Apr 2022 18:43:52 -0700
Received: from kbuild by 7e80bc2a00a0 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nd08m-0000mR-11;
 Sat, 09 Apr 2022 01:43:52 +0000
Date: Sat, 09 Apr 2022 09:42:54 +0800
From: kernel test robot <lkp@intel.com>
To: Zhi Wang <zhi.a.wang@intel.com>
Subject: [intel-gvt:gvt-staging] BUILD REGRESSION
 d7b5d2c7c69602d92c926075fb8191a7d6df2c08
Message-ID: <6250e49e.BEI2c4eEWmwEEAxK%lkp@intel.com>
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
branch HEAD: d7b5d2c7c69602d92c926075fb8191a7d6df2c08  gvt-staging: 2022y-04m-08d-09h-14m-20s CST integration manifest

Error/Warning reports:

https://lore.kernel.org/lkml/202204090309.4k0CRWvn-lkp@intel.com
https://lore.kernel.org/lkml/202204090611.WX3Wi3np-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

drivers/gpu/drm/i915/intel_gvt_mmio_table.c:1021:16: error: 'DMC_SSP_BASE' undeclared (first use in this function)
drivers/gpu/drm/i915/intel_gvt_mmio_table.c:1021:9: error: use of undeclared identifier 'DMC_SSP_BASE'
drivers/gpu/drm/i915/intel_gvt_mmio_table.c:1022:16: error: 'DMC_HTP_SKL' undeclared (first use in this function)
drivers/gpu/drm/i915/intel_gvt_mmio_table.c:1022:9: error: use of undeclared identifier 'DMC_HTP_SKL'
drivers/gpu/drm/i915/intel_gvt_mmio_table.c:1023:16: error: 'DMC_LAST_WRITE' undeclared (first use in this function)
drivers/gpu/drm/i915/intel_gvt_mmio_table.c:1023:9: error: use of undeclared identifier 'DMC_LAST_WRITE'
drivers/gpu/drm/i915/intel_gvt_mmio_table.c:1080:15: error: use of undeclared identifier 'DMC_MMIO_START_RANGE'
drivers/gpu/drm/i915/intel_gvt_mmio_table.c:1080:22: error: 'DMC_MMIO_START_RANGE' undeclared (first use in this function)

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
`-- x86_64-allyesconfig
    |-- drivers-gpu-drm-i915-intel_gvt_mmio_table.c:error:DMC_HTP_SKL-undeclared-(first-use-in-this-function)
    |-- drivers-gpu-drm-i915-intel_gvt_mmio_table.c:error:DMC_LAST_WRITE-undeclared-(first-use-in-this-function)
    |-- drivers-gpu-drm-i915-intel_gvt_mmio_table.c:error:DMC_MMIO_START_RANGE-undeclared-(first-use-in-this-function)
    `-- drivers-gpu-drm-i915-intel_gvt_mmio_table.c:error:DMC_SSP_BASE-undeclared-(first-use-in-this-function)

clang_recent_errors
`-- x86_64-randconfig-a005
    |-- drivers-gpu-drm-i915-intel_gvt_mmio_table.c:error:use-of-undeclared-identifier-DMC_HTP_SKL
    |-- drivers-gpu-drm-i915-intel_gvt_mmio_table.c:error:use-of-undeclared-identifier-DMC_LAST_WRITE
    |-- drivers-gpu-drm-i915-intel_gvt_mmio_table.c:error:use-of-undeclared-identifier-DMC_MMIO_START_RANGE
    `-- drivers-gpu-drm-i915-intel_gvt_mmio_table.c:error:use-of-undeclared-identifier-DMC_SSP_BASE

elapsed time: 722m

configs tested: 104
configs skipped: 3

gcc tested configs:
arm                              allyesconfig
arm                                 defconfig
arm                              allmodconfig
arm64                            allyesconfig
arm64                               defconfig
i386                          randconfig-c001
ia64                            zx1_defconfig
arm                           corgi_defconfig
sh                               alldefconfig
ia64                          tiger_defconfig
sh                        edosk7760_defconfig
h8300                            alldefconfig
sh                           se7722_defconfig
arc                          axs103_defconfig
m68k                        m5407c3_defconfig
arm                          gemini_defconfig
powerpc                 mpc8540_ads_defconfig
powerpc64                           defconfig
mips                     decstation_defconfig
arm                             pxa_defconfig
arm                  randconfig-c002-20220408
x86_64                        randconfig-c001
ia64                             allmodconfig
ia64                             allyesconfig
ia64                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
m68k                                defconfig
alpha                               defconfig
alpha                            allyesconfig
csky                                defconfig
nios2                            allyesconfig
arc                                 defconfig
h8300                            allyesconfig
sh                               allmodconfig
xtensa                           allyesconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                             allmodconfig
s390                             allyesconfig
s390                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
nios2                               defconfig
arc                              allyesconfig
mips                             allmodconfig
mips                             allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
x86_64                        randconfig-a002
x86_64                        randconfig-a006
x86_64                        randconfig-a004
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
riscv                randconfig-r042-20220408
s390                 randconfig-r044-20220408
arc                  randconfig-r043-20220408
riscv                            allmodconfig
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allyesconfig
riscv                               defconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                                  kexec
x86_64                          rhel-8.3-func
x86_64                               rhel-8.3
x86_64                         rhel-8.3-kunit

clang tested configs:
mips                      malta_kvm_defconfig
mips                        bcm63xx_defconfig
powerpc                     tqm8540_defconfig
arm                          collie_defconfig
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
hexagon              randconfig-r045-20220408
hexagon              randconfig-r041-20220408

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
