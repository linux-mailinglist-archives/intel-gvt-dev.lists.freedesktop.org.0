Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB51380DF2
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 14 May 2021 18:16:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 843AF6E204;
	Fri, 14 May 2021 16:16:28 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E53456E204
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 14 May 2021 16:16:26 +0000 (UTC)
IronPort-SDR: DD/phVtk74y1gcNanSrSmJGqSLGMCGWm5JTtA1ObTDLn5Q7FvG3kKRKK7zkLCnFGNVpA9NHHtW
 LzUwGd9M4WIQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9984"; a="264123398"
X-IronPort-AV: E=Sophos;i="5.82,300,1613462400"; d="scan'208";a="264123398"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2021 09:16:24 -0700
IronPort-SDR: /5DZxb3TM2g2ZWnuBIKO3YEbrOe5RJeRlpAd/VR6LhzGC7ZQa3+sEXyAX4L+vG8IGFSO01wCXM
 dFuqPNWBJ4nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,300,1613462400"; d="scan'208";a="392739180"
Received: from lkp-server01.sh.intel.com (HELO ddd90b05c979) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 14 May 2021 09:16:22 -0700
Received: from kbuild by ddd90b05c979 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lhaU9-0000nE-V4; Fri, 14 May 2021 16:16:21 +0000
Date: Sat, 15 May 2021 00:16:08 +0800
From: kernel test robot <lkp@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: [intel-gvt-linux:gvt-staging] BUILD REGRESSION
 a1b6427f07677e5f9816fcc638d73975f004951d
Message-ID: <609ea248.1N3CO21C1MI/UsEf%lkp@intel.com>
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

tree/branch: https://github.com/intel/gvt-linux.git gvt-staging
branch HEAD: a1b6427f07677e5f9816fcc638d73975f004951d  gvt-staging: 2021y-05m-14d-11h-16m-20s CST integration manifest

Error/Warning in current branch:

drivers/gpu/drm/i915/i915_active.c:1156:19: error: expected ';' before 'static'

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- i386-randconfig-a002-20210514
|   `-- drivers-gpu-drm-i915-i915_active.c:error:expected-before-static
|-- i386-randconfig-a006-20210514
|   `-- drivers-gpu-drm-i915-i915_active.c:error:expected-before-static
|-- x86_64-defconfig
|   `-- drivers-gpu-drm-i915-i915_active.c:error:expected-before-static
|-- x86_64-randconfig-a001-20210514
|   `-- drivers-gpu-drm-i915-i915_active.c:error:expected-before-static
|-- x86_64-randconfig-a005-20210514
|   `-- drivers-gpu-drm-i915-i915_active.c:error:expected-before-static
|-- x86_64-rhel-8.3
|   `-- drivers-gpu-drm-i915-i915_active.c:error:expected-before-static
|-- x86_64-rhel-8.3-kbuiltin
|   `-- drivers-gpu-drm-i915-i915_active.c:error:expected-before-static
`-- x86_64-rhel-8.3-kselftests
    `-- drivers-gpu-drm-i915-i915_active.c:error:expected-before-static

elapsed time: 723m

configs tested: 104
configs skipped: 2

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                                  defconfig
arc                              allyesconfig
powerpc                 mpc8313_rdb_defconfig
m68k                        mvme16x_defconfig
m68k                       m5249evb_defconfig
arc                          axs103_defconfig
mips                  maltasmvp_eva_defconfig
riscv                    nommu_virt_defconfig
powerpc                     taishan_defconfig
riscv             nommu_k210_sdcard_defconfig
arc                              alldefconfig
sh                          landisk_defconfig
m68k                         amcore_defconfig
sh                        apsh4ad0a_defconfig
arm                        keystone_defconfig
um                               alldefconfig
sh                        edosk7705_defconfig
powerpc                     sequoia_defconfig
powerpc                      makalu_defconfig
powerpc                        icon_defconfig
xtensa                  cadence_csp_defconfig
h8300                       h8s-sim_defconfig
riscv                            alldefconfig
sh                   sh7770_generic_defconfig
powerpc                     mpc512x_defconfig
powerpc                     ksi8560_defconfig
arm                          simpad_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
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
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20210514
x86_64               randconfig-a003-20210514
x86_64               randconfig-a001-20210514
x86_64               randconfig-a005-20210514
x86_64               randconfig-a002-20210514
x86_64               randconfig-a006-20210514
i386                 randconfig-a003-20210514
i386                 randconfig-a001-20210514
i386                 randconfig-a004-20210514
i386                 randconfig-a005-20210514
i386                 randconfig-a002-20210514
i386                 randconfig-a006-20210514
i386                 randconfig-a016-20210514
i386                 randconfig-a014-20210514
i386                 randconfig-a011-20210514
i386                 randconfig-a012-20210514
i386                 randconfig-a015-20210514
i386                 randconfig-a013-20210514
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a015-20210514
x86_64               randconfig-a012-20210514
x86_64               randconfig-a011-20210514
x86_64               randconfig-a013-20210514
x86_64               randconfig-a016-20210514
x86_64               randconfig-a014-20210514

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
