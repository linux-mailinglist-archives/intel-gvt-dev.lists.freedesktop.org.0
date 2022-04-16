Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4D75036B2
	for <lists+intel-gvt-dev@lfdr.de>; Sat, 16 Apr 2022 15:17:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2E0710E52B;
	Sat, 16 Apr 2022 13:17:17 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4448810E4D4
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sat, 16 Apr 2022 13:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650115037; x=1681651037;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=vzxvOSZKiABsiImPDXtdFHZcJLhp7veXalSMBe9F8ss=;
 b=GnGaZCW7SvODHEbHZUMW313faV3EQiPbeywSwmsNENogXtO7mI8UJenV
 IDgFsfi6DRg/mYsUHlhybxn7bmBGnoFqo6AUxmoKzl39wy10NdO/Ka4j0
 PVW47f3ApPatLXQrkfsjUJoDue3WXyBsS0Lk0fWiuX0VwrjrtuC0epT40
 fVSjK7R3bNuyo6Wgf9X9HlxgkC1haK1eQHI4hh+DXCmRysbaukxPW4Lr9
 J3NSU5ai9Y8QsenO1QJa9/IxbhwVFQ/MZzmDgj24AQYE1vVu/4Nb2MLd/
 Q4UTm4pi2o6qpAGsQbhbpmbcfC70U45dE9u8uY+imNKqlEcGz3Dm9Brc6 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10318"; a="323733895"
X-IronPort-AV: E=Sophos;i="5.90,264,1643702400"; d="scan'208";a="323733895"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2022 06:17:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,264,1643702400"; d="scan'208";a="528272784"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
 by orsmga006.jf.intel.com with ESMTP; 16 Apr 2022 06:17:04 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nfiIR-00039B-Nr;
 Sat, 16 Apr 2022 13:17:03 +0000
Date: Sat, 16 Apr 2022 21:16:52 +0800
From: kernel test robot <lkp@intel.com>
To: Zhi Wang <zhi.a.wang@intel.com>
Subject: [intel-gvt:gvt-next] BUILD SUCCESS
 8d21120f853a2fc4afb5fc5ea9cf76a724d93359
Message-ID: <625ac1c4.IEUI+yaoYal/LDhF%lkp@intel.com>
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
branch HEAD: 8d21120f853a2fc4afb5fc5ea9cf76a724d93359  Merge branch 'topic/for-christoph' into gvt-next

elapsed time: 2593m

configs tested: 138
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allmodconfig
arm64                            allyesconfig
arm                              allyesconfig
arm64                               defconfig
i386                          randconfig-c001
powerpc              randconfig-c003-20220415
m68k                        stmark2_defconfig
arc                     haps_hs_smp_defconfig
arc                          axs103_defconfig
sh                   secureedge5410_defconfig
powerpc                   motionpro_defconfig
arm                       imx_v6_v7_defconfig
sh                               j2_defconfig
arm                         lubbock_defconfig
arm                           tegra_defconfig
arm                        trizeps4_defconfig
mips                         db1xxx_defconfig
mips                      fuloong2e_defconfig
arm                          pxa3xx_defconfig
m68k                          multi_defconfig
openrisc                         alldefconfig
powerpc                       eiger_defconfig
powerpc                 linkstation_defconfig
powerpc                        warp_defconfig
sparc                       sparc64_defconfig
h8300                       h8s-sim_defconfig
arm                       multi_v4t_defconfig
powerpc                     mpc83xx_defconfig
sh                        sh7757lcr_defconfig
mips                      maltasmvp_defconfig
powerpc                     taishan_defconfig
arm                        keystone_defconfig
arc                        vdk_hs38_defconfig
arm                          exynos_defconfig
sh                     magicpanelr2_defconfig
sh                          urquell_defconfig
m68k                        m5307c3_defconfig
m68k                          amiga_defconfig
m68k                       m5249evb_defconfig
sh                          rsk7264_defconfig
arm                       aspeed_g5_defconfig
sh                            hp6xx_defconfig
arm                           corgi_defconfig
alpha                            alldefconfig
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
ia64                                defconfig
m68k                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
nios2                               defconfig
arc                              allyesconfig
alpha                               defconfig
csky                                defconfig
nios2                            allyesconfig
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
x86_64                        randconfig-a002
x86_64                        randconfig-a004
x86_64                        randconfig-a006
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220414
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3

clang tested configs:
powerpc                          allyesconfig
mips                           mtx1_defconfig
arm                       versatile_defconfig
mips                        bcm63xx_defconfig
arm                  colibri_pxa300_defconfig
arm                       imx_v4_v5_defconfig
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
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
