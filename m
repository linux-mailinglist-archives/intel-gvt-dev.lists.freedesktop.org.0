Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AEF56260EC
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 11 Nov 2022 19:14:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33C9510E19E;
	Fri, 11 Nov 2022 18:14:22 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7821610E19E
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 11 Nov 2022 18:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668190459; x=1699726459;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=OG7Pq8Ss+iug/Ub/efo4KBre6jPeYZ7fCs5LPMdZFCc=;
 b=RrYgEFfPxFyPRImB0cUSBPlK/v78FW8QE7rhJ5sDxkvgrV61+KuoeBX0
 y7m7EboZsdZEP+iJFaT1+WEqp+2slUHrBwogY+Zz/LTONTB+WOO/rbJwC
 bQsYVZO+TffAVgiO2u6vFTQ+S8U8BzuLz7SsrrN+I0h7Y1eD6atMQBkeI
 CUz0xPQxbRVl1dQzRsZDJ2flOAEnff8RBkopQeGdUodSQkPvyyOwcne7I
 CLqwA1AhLdtkgGrZk11cAJuh3EHwqpriAd3fuw2oUQfQBl1kCu3Nju9bV
 aMLb8KPGoZjDBIRWDEUzVMSAIJRV5oy6Ej4c8TouVlCOm9m8ZhM+jbHUo Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10528"; a="312792309"
X-IronPort-AV: E=Sophos;i="5.96,157,1665471600"; d="scan'208";a="312792309"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2022 10:14:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10528"; a="706612954"
X-IronPort-AV: E=Sophos;i="5.96,157,1665471600"; d="scan'208";a="706612954"
Received: from lkp-server01.sh.intel.com (HELO e783503266e8) ([10.239.97.150])
 by fmsmga004.fm.intel.com with ESMTP; 11 Nov 2022 10:14:17 -0800
Received: from kbuild by e783503266e8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1otYXg-0004B5-1T;
 Fri, 11 Nov 2022 18:14:16 +0000
Date: Sat, 12 Nov 2022 02:14:11 +0800
From: kernel test robot <lkp@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: [intel-gvt:gvt-fixes] BUILD SUCCESS
 3c9fd44b9330adc5006653566f3d386784b2080e
Message-ID: <636e90f3.HJLf5/kJ8AqgERDX%lkp@intel.com>
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
branch HEAD: 3c9fd44b9330adc5006653566f3d386784b2080e  drm/i915/gvt: Unconditionally put reference to KVM when detaching vGPU

elapsed time: 721m

configs tested: 98
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
i386                                defconfig
arc                  randconfig-r043-20221111
x86_64                        randconfig-a002
x86_64                           rhel-8.3-kvm
arc                                 defconfig
x86_64                           rhel-8.3-syz
m68k                             allmodconfig
x86_64                         rhel-8.3-kunit
riscv                randconfig-r042-20221111
arc                              allyesconfig
s390                             allmodconfig
x86_64                              defconfig
alpha                            allyesconfig
alpha                               defconfig
s390                             allyesconfig
s390                                defconfig
x86_64                          rhel-8.3-func
powerpc                           allnoconfig
i386                          randconfig-a014
x86_64                               rhel-8.3
powerpc                          allmodconfig
x86_64                    rhel-8.3-kselftests
sh                               allmodconfig
x86_64                           allyesconfig
ia64                             allmodconfig
i386                          randconfig-a012
mips                             allyesconfig
i386                          randconfig-a016
i386                          randconfig-a005
x86_64                            allnoconfig
i386                             allyesconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
s390                 randconfig-r044-20221111
m68k                             allyesconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
mips                 randconfig-c004-20221111
i386                          randconfig-c001
powerpc                         ps3_defconfig
xtensa                  cadence_csp_defconfig
sh                         apsh4a3a_defconfig
loongarch                        alldefconfig
nios2                               defconfig
arm                            pleb_defconfig
arm                           sunxi_defconfig
xtensa                  nommu_kc705_defconfig
arm                            qcom_defconfig
powerpc                      ppc40x_defconfig
sparc64                             defconfig
arm                         lpc18xx_defconfig
powerpc                       maple_defconfig
arc                          axs103_defconfig
powerpc                 mpc834x_mds_defconfig
openrisc                         alldefconfig
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
arm                      integrator_defconfig
sh                           se7724_defconfig
arc                          axs101_defconfig
loongarch                 loongson3_defconfig
nios2                            allyesconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig

clang tested configs:
hexagon              randconfig-r041-20221111
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
x86_64                        randconfig-a016
i386                          randconfig-a004
i386                          randconfig-a006
i386                          randconfig-a002
powerpc                    socrates_defconfig
powerpc                        icon_defconfig
hexagon              randconfig-r045-20221111
arm                         hackkit_defconfig
arm                       netwinder_defconfig
arm                          ixp4xx_defconfig
powerpc                 mpc836x_rdk_defconfig
x86_64                        randconfig-a012
x86_64                        randconfig-a014
arm                         s3c2410_defconfig
x86_64                        randconfig-k001
arm                           sama7_defconfig
arm                          pcm027_defconfig
x86_64                        randconfig-a005
arm                           omap1_defconfig
mips                        qi_lb60_defconfig
mips                  cavium_octeon_defconfig
powerpc                     skiroot_defconfig
powerpc                  mpc866_ads_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
