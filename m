Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B450E4D27C7
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  9 Mar 2022 05:20:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ECE910E8EC;
	Wed,  9 Mar 2022 04:20:55 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2BAE10E8EE
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  9 Mar 2022 04:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646799653; x=1678335653;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=i7EifrnWJgcCPENtlvN6u3/ncBJXDJewFyQ+TwVm4os=;
 b=USIHr+xcmG8dQ6XxV8Y12uc6llf+Gcb6OdJFAujcKnINo6l8CJTNo+s7
 LvZ9GWQXfNWHqFDnM1ksj+O4CpJVEOrYfWUMYSDwRrpR1PQeWWxgV8JsJ
 HDZA8Ib7wNILiEIpkkssTkssYw+G47o31ttDRylsZkJUZQK8pK/rVAr1o
 gogA5ilwSxogwtzIjUTm2k1a2KHhx9da24Hu/VRfA33fhLLH5LzajzSkm
 CTuOP04dD+b6ojqgax+JgyhUCFb8RPRs+eMR2f/jcF30QXV8UfpwYynqb
 5wNn8WBbel1uidDqyAJR6d8U3LnEmTfjrVcNzPeoi5Cq4JGT3mN4rSHFh w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="254612424"
X-IronPort-AV: E=Sophos;i="5.90,166,1643702400"; d="scan'208";a="254612424"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 20:20:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,166,1643702400"; d="scan'208";a="596134365"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by fmsmga008.fm.intel.com with ESMTP; 08 Mar 2022 20:20:51 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nRnog-0002Zi-Cr; Wed, 09 Mar 2022 04:20:50 +0000
Date: Wed, 09 Mar 2022 12:20:29 +0800
From: kernel test robot <lkp@intel.com>
To: Zhi Wang <zhi.a.wang@intel.com>
Subject: [intel-gvt:gvt-next] BUILD SUCCESS
 43d26c4fc6c446d766253d546f0083d78023d34a
Message-ID: <62282b0d.VW0+Bi/pLYB49c7Q%lkp@intel.com>
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

tree/branch: https://github.com/intel/gvt-linux.git gvt-next
branch HEAD: 43d26c4fc6c446d766253d546f0083d78023d34a  drm/i915/gvt: add the missing mdev attribute "name"

elapsed time: 1880m

configs tested: 125
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20220307
mips                           xway_defconfig
sparc                               defconfig
arm                         assabet_defconfig
arm                        oxnas_v6_defconfig
arm                           u8500_defconfig
sh                          lboxre2_defconfig
sh                          landisk_defconfig
sh                          urquell_defconfig
mips                           ip32_defconfig
ia64                            zx1_defconfig
sh                           se7750_defconfig
xtensa                  cadence_csp_defconfig
mips                      fuloong2e_defconfig
m68k                          atari_defconfig
mips                    maltaup_xpa_defconfig
openrisc                 simple_smp_defconfig
sh                        edosk7705_defconfig
powerpc                      arches_defconfig
arm                        mini2440_defconfig
arc                        vdk_hs38_defconfig
microblaze                      mmu_defconfig
sh                         ecovec24_defconfig
sh                          rsk7201_defconfig
sh                           se7712_defconfig
arm                            hisi_defconfig
m68k                       m5249evb_defconfig
powerpc                 mpc834x_itx_defconfig
riscv                               defconfig
arm                  randconfig-c002-20220308
arm                  randconfig-c002-20220307
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
csky                                defconfig
alpha                               defconfig
nds32                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
h8300                            allyesconfig
xtensa                           allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
parisc                              defconfig
parisc64                            defconfig
s390                             allmodconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
x86_64               randconfig-a003-20220307
x86_64               randconfig-a001-20220307
x86_64               randconfig-a002-20220307
x86_64               randconfig-a004-20220307
x86_64               randconfig-a006-20220307
x86_64               randconfig-a005-20220307
i386                 randconfig-a003-20220307
i386                 randconfig-a001-20220307
i386                 randconfig-a004-20220307
i386                 randconfig-a002-20220307
i386                 randconfig-a006-20220307
i386                 randconfig-a005-20220307
x86_64                        randconfig-a015
x86_64                        randconfig-a013
x86_64                        randconfig-a011
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
riscv                randconfig-r042-20220308
arc                  randconfig-r043-20220307
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                                  kexec

clang tested configs:
x86_64                        randconfig-c007
arm                  randconfig-c002-20220308
mips                 randconfig-c004-20220308
i386                          randconfig-c001
s390                 randconfig-c005-20220308
riscv                randconfig-c006-20220308
powerpc              randconfig-c003-20220308
mips                     cu1830-neo_defconfig
powerpc                        icon_defconfig
powerpc                     mpc512x_defconfig
arm                         bcm2835_defconfig
mips                     loongson2k_defconfig
mips                          rm200_defconfig
powerpc                      walnut_defconfig
x86_64                        randconfig-a014
x86_64                        randconfig-a012
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r041-20220307

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
