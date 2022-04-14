Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBA3500493
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 14 Apr 2022 05:12:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4076C10FC46;
	Thu, 14 Apr 2022 03:12:52 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2857810FC46
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 14 Apr 2022 03:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649905971; x=1681441971;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=heqfLl1j6DjbF5BLk2kpOnAf+S3U9W0sIPjlI87xVaU=;
 b=W8OU4u43QvGJzLVGaux2tH7m0guFdIUaMT9z/b59uZcXgnh4aNOLe9ul
 Ovf5HvP2+u8IPCOEZd9Eom3hbzLdfFWttD/99hDKGCd38GCOKrOiX6bAj
 xSqplb2btp4TXyqpWEeti3jIL8msSSgSD6UJVn1yj7Vff7tLh8GTQTwb9
 HJoL6QyAaYNeyzOk9lqTMyHOfwwEiF9kjdQZ6YNPn/AlvJ49cQ6gNvo6u
 wdPzwfPHCjMgqaTglhoK9ElkH3aDGQE9grhVdy2IWJ2aa1Mqsn48Lo6aC
 PPvh3g6gBaK0bjOlOGqBfdXqK0ZdiBGnYbZzNbBsHAE0VpUlfK7gE3M4H A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10316"; a="263011120"
X-IronPort-AV: E=Sophos;i="5.90,258,1643702400"; d="scan'208";a="263011120"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2022 20:12:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,258,1643702400"; d="scan'208";a="527210209"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
 by orsmga006.jf.intel.com with ESMTP; 13 Apr 2022 20:12:48 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nepua-0000np-8B;
 Thu, 14 Apr 2022 03:12:48 +0000
Date: Thu, 14 Apr 2022 11:12:01 +0800
From: kernel test robot <lkp@intel.com>
To: Zhi Wang <zhi.a.wang@intel.com>
Subject: [intel-gvt:gvt-next-bak-without-chris-patches] BUILD SUCCESS
 1f9dedeee16643ba20fffd43296978bc434218d2
Message-ID: <62579101.27RyH94hbP8HMM2s%lkp@intel.com>
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

tree/branch: https://github.com/intel/gvt-linux.git gvt-next-bak-without-chris-patches
branch HEAD: 1f9dedeee16643ba20fffd43296978bc434218d2  drm/i915/gvt: better align the Makefile with i915 Makefile

elapsed time: 728m

configs tested: 88
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
powerpc                 mpc837x_mds_defconfig
sh                             sh03_defconfig
arm                           sunxi_defconfig
xtensa                           alldefconfig
x86_64                              defconfig
arm                           u8500_defconfig
arm                        spear6xx_defconfig
arm                            mps2_defconfig
arm                        oxnas_v6_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220413
ia64                             allmodconfig
ia64                             allyesconfig
ia64                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
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
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
riscv                randconfig-r042-20220413
arc                  randconfig-r043-20220413
s390                 randconfig-r044-20220413
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                           allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3

clang tested configs:
x86_64                        randconfig-c007
powerpc              randconfig-c003-20220413
arm                  randconfig-c002-20220413
i386                          randconfig-c001
riscv                randconfig-c006-20220413
mips                 randconfig-c004-20220413
arm                       spear13xx_defconfig
mips                malta_qemu_32r6_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
hexagon              randconfig-r041-20220413
hexagon              randconfig-r045-20220413

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
