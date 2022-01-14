Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BE148E634
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 14 Jan 2022 09:25:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C06E310E9FE;
	Fri, 14 Jan 2022 08:25:33 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D35A10E9F4
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 14 Jan 2022 08:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642148733; x=1673684733;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=3IIYzC2y/XQypvhEzmyjbfaXLSAmmn09h1Htc7yDBA0=;
 b=eLXhTN6KLldWAclY3wBSUnmjvuPirH0ZJyfBKmOW4VSiaJrEG2qA6FuB
 6/eGQ32E+04pGBCEgUIMi11WgCuRb6AVPAlk+kMa/PpvCPB5jHgKyhy2O
 5t+hODNL2a3AcfTvwh6Cdo0UPoFv4fuMigrfSljXf2mK7eQydgPESS8Tg
 6nG2MN6Zml1TY3J/T887Di3NEzjBIeYvgezmuSbCYJm6e7XDQ+c/qEqhC
 LKkkHWC8/AXSuVtgQJoaLryT+bwsB4W2WA8GoBwQcBkrRAkqgCc24Me1Z
 CBGKpLLSobe/H7zjsIl6C32d3RrebVMqceMErMiEA77uqzvFLtGT4NIOQ Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10226"; a="224189483"
X-IronPort-AV: E=Sophos;i="5.88,288,1635231600"; d="scan'208";a="224189483"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2022 00:25:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,288,1635231600"; d="scan'208";a="765811928"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by fmsmga005.fm.intel.com with ESMTP; 14 Jan 2022 00:25:31 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1n8Htq-0008I8-Id; Fri, 14 Jan 2022 08:25:30 +0000
Date: Fri, 14 Jan 2022 16:24:43 +0800
From: kernel test robot <lkp@intel.com>
To: Zhi Wang <zhi.a.wang@intel.com>
Subject: [intel-gvt:gvt-fixes] BUILD SUCCESS
 d72d69abfdb6e0375981cfdda8eb45143f12c77d
Message-ID: <61e1334b.9NuFNEx4Ho5W2E6A%lkp@intel.com>
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

tree/branch: https://github.com/intel/gvt-linux.git gvt-fixes
branch HEAD: d72d69abfdb6e0375981cfdda8eb45143f12c77d  drm/i915/gvt: Make DRM_I915_GVT depend on X86

elapsed time: 724m

configs tested: 135
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
arm                          gemini_defconfig
arm                         at91_dt_defconfig
nios2                         10m50_defconfig
sparc64                             defconfig
mips                        bcm47xx_defconfig
powerpc                 mpc837x_mds_defconfig
m68k                        mvme16x_defconfig
powerpc                     tqm8555_defconfig
arm                            hisi_defconfig
powerpc                      tqm8xx_defconfig
arm                         lpc18xx_defconfig
powerpc                      pcm030_defconfig
arm                         s3c6400_defconfig
arm                         axm55xx_defconfig
arm                           h5000_defconfig
powerpc                      pasemi_defconfig
sh                               j2_defconfig
arc                              alldefconfig
mips                           ci20_defconfig
arm                            qcom_defconfig
arm                            pleb_defconfig
ia64                        generic_defconfig
sh                   rts7751r2dplus_defconfig
sh                   sh7724_generic_defconfig
mips                         db1xxx_defconfig
powerpc                     mpc83xx_defconfig
mips                        vocore2_defconfig
openrisc                    or1ksim_defconfig
s390                          debug_defconfig
sh                          rsk7264_defconfig
sh                          r7785rp_defconfig
arm                            xcep_defconfig
sh                           se7343_defconfig
sh                                  defconfig
i386                             alldefconfig
sh                          sdk7786_defconfig
arm                           tegra_defconfig
sh                         microdev_defconfig
powerpc                       ppc64_defconfig
m68k                             allmodconfig
sh                              ul2_defconfig
arm                  randconfig-c002-20220113
ia64                                defconfig
ia64                             allyesconfig
ia64                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
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
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a003
i386                          randconfig-a001
i386                          randconfig-a005
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
riscv                randconfig-r042-20220113
arc                  randconfig-r043-20220113
s390                 randconfig-r044-20220113
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
arm                  randconfig-c002-20220113
x86_64                        randconfig-c007
riscv                randconfig-c006-20220113
powerpc              randconfig-c003-20220113
i386                          randconfig-c001
mips                 randconfig-c004-20220113
mips                           ip28_defconfig
arm                          pxa168_defconfig
powerpc                     powernv_defconfig
powerpc                        icon_defconfig
mips                        bcm63xx_defconfig
arm                          ixp4xx_defconfig
powerpc                     mpc5200_defconfig
mips                            e55_defconfig
powerpc                 mpc836x_mds_defconfig
riscv                             allnoconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220113
hexagon              randconfig-r041-20220113

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
