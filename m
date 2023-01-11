Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB884665BEF
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 11 Jan 2023 14:00:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11DC710E092;
	Wed, 11 Jan 2023 13:00:38 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02BD410E092
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 11 Jan 2023 13:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673442035; x=1704978035;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=KIN1VB5kqNZgFXK74RgLSCNoUCFxz/cliAbgR0eNl/Q=;
 b=WPDmgUmS0cv9x3esI+5iw+eS2Fg9fjvH98xtRdSLW5IjteOYY+94/ulA
 Z3h6A3JJHeBBRC/rWFjEaXvLdkz9kkG5dqCutWjZU4IbcRO3QAE5Ah6R5
 X+PpozII71FgSX/YdiwFv6ry15pi5O5D/bP7XhdwzimEEAg1gfUJPrkaI
 URXOIbHiTMVoozPJDittbgSd3bTCMUXFmLJbFholuspffuGAn8ajLRhCk
 +X0gmgQYCtXaMjXW1UFeg6Itb+rdzA/0UfgsB1IU5Ulu9An3ZMtGYjH0t
 9u/Df2tSf4J4PLpHM6CxrSumM97dcJsIl/95WfM/p70Z6eV2rv6tHSOvq A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="325413010"
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; d="scan'208";a="325413010"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2023 05:00:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="986155332"
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; d="scan'208";a="986155332"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
 by fmsmga005.fm.intel.com with ESMTP; 11 Jan 2023 05:00:30 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pFaiT-000996-1j;
 Wed, 11 Jan 2023 13:00:29 +0000
Date: Wed, 11 Jan 2023 20:59:38 +0800
From: kernel test robot <lkp@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: [intel-gvt:gvt-fixes] BUILD SUCCESS
 4a61648af68f5ba4884f0e3b494ee1cabc4b6620
Message-ID: <63beb2ba.WyJD3kzmQD1i/WE3%lkp@intel.com>
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
branch HEAD: 4a61648af68f5ba4884f0e3b494ee1cabc4b6620  drm/i915/gvt: fix double free bug in split_2MB_gtt_entry

elapsed time: 9351m

configs tested: 234
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
alpha                            allyesconfig
arc                              allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
arc                                 defconfig
alpha                               defconfig
powerpc                           allnoconfig
sh                               allmodconfig
s390                             allmodconfig
mips                             allyesconfig
um                             i386_defconfig
x86_64                            allnoconfig
s390                                defconfig
um                           x86_64_defconfig
x86_64                           rhel-8.3-bpf
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
s390                             allyesconfig
powerpc                          allmodconfig
x86_64                              defconfig
arm                                 defconfig
arc                  randconfig-r043-20230105
s390                 randconfig-r044-20230105
x86_64                        randconfig-a004
x86_64                        randconfig-a002
arm64                            allyesconfig
x86_64                        randconfig-a006
arm                              allyesconfig
riscv                randconfig-r042-20230105
i386                          randconfig-a001
i386                          randconfig-a003
i386                                defconfig
i386                          randconfig-a005
i386                          randconfig-a014
i386                          randconfig-a012
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a016
i386                             allyesconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
csky                                defconfig
ia64                             allmodconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
loongarch                           defconfig
loongarch                         allnoconfig
loongarch                        allmodconfig
i386                          randconfig-c001
riscv                               defconfig
sh                           sh2007_defconfig
riscv                            allyesconfig
arc                     nsimosci_hs_defconfig
arm                           imxrt_defconfig
riscv             nommu_k210_sdcard_defconfig
arm                          gemini_defconfig
powerpc                          allyesconfig
riscv                            allmodconfig
sh                   sh7724_generic_defconfig
ia64                             allyesconfig
powerpc                      chrp32_defconfig
nios2                            allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
sparc                             allnoconfig
arc                     haps_hs_smp_defconfig
ia64                      gensparse_defconfig
powerpc                      pasemi_defconfig
sparc                       sparc32_defconfig
sh                           se7721_defconfig
arm                          exynos_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20230106
sparc                               defconfig
xtensa                           allyesconfig
sparc                            allyesconfig
x86_64                                  kexec
sh                             sh03_defconfig
ia64                         bigsur_defconfig
sh                           se7751_defconfig
mips                         cobalt_defconfig
arc                      axs103_smp_defconfig
powerpc                      cm5200_defconfig
arc                          axs101_defconfig
powerpc                 mpc8540_ads_defconfig
powerpc                     mpc83xx_defconfig
mips                             allmodconfig
ia64                            zx1_defconfig
s390                       zfcpdump_defconfig
arc                            hsdk_defconfig
sh                              ul2_defconfig
arm                       multi_v4t_defconfig
mips                           gcw0_defconfig
nios2                         3c120_defconfig
mips                           jazz_defconfig
arm                           sama5_defconfig
powerpc                     asp8347_defconfig
arm                  randconfig-c002-20230108
sh                   rts7751r2dplus_defconfig
sh                                  defconfig
powerpc                  storcenter_defconfig
mips                     loongson1b_defconfig
xtensa                          iss_defconfig
sh                          landisk_defconfig
powerpc                      mgcoge_defconfig
xtensa                    smp_lx200_defconfig
arm64                               defconfig
arm                              allmodconfig
m68k                                defconfig
ia64                                defconfig
m68k                       m5208evb_defconfig
arm                       imx_v6_v7_defconfig
arm                             rpc_defconfig
xtensa                              defconfig
arm                        multi_v7_defconfig
openrisc                       virt_defconfig
xtensa                generic_kc705_defconfig
powerpc                        warp_defconfig
arm                           stm32_defconfig
mips                         db1xxx_defconfig
powerpc                 linkstation_defconfig
sh                           se7619_defconfig
arm                       omap2plus_defconfig
um                                  defconfig
openrisc                         alldefconfig
m68k                           sun3_defconfig
sparc64                          alldefconfig
powerpc                 mpc837x_rdb_defconfig
arm                        oxnas_v6_defconfig
m68k                          hp300_defconfig
arm                         s3c6400_defconfig
powerpc                      makalu_defconfig
arm                          iop32x_defconfig
m68k                       bvme6000_defconfig
i386                 randconfig-a015-20230109
i386                 randconfig-a011-20230109
i386                 randconfig-a013-20230109
i386                 randconfig-a014-20230109
i386                 randconfig-a016-20230109
i386                 randconfig-a012-20230109
s390                 randconfig-r044-20230109
arc                  randconfig-r043-20230108
arc                  randconfig-r043-20230109
arm                  randconfig-r046-20230108
riscv                randconfig-r042-20230109
riscv                randconfig-r042-20230110
s390                 randconfig-r044-20230110
arc                  randconfig-r043-20230110
arm                         lubbock_defconfig
powerpc                     redwood_defconfig
sh                          rsk7203_defconfig
sh                            hp6xx_defconfig
m68k                            q40_defconfig
sh                           se7780_defconfig
sh                         ap325rxa_defconfig
arm                               allnoconfig
m68k                        mvme16x_defconfig
sparc                            alldefconfig
arm                            hisi_defconfig
xtensa                  audio_kc705_defconfig
arc                           tb10x_defconfig
alpha                             allnoconfig
powerpc                 mpc834x_mds_defconfig
mips                     decstation_defconfig
mips                           ci20_defconfig
powerpc                      pcm030_defconfig
arm                          pxa3xx_defconfig
arm                         assabet_defconfig
arm                           h3600_defconfig
mips                 decstation_r4k_defconfig
arm                          pxa910_defconfig
m68k                       m5249evb_defconfig
openrisc                            defconfig

clang tested configs:
arm                  randconfig-r046-20230105
hexagon              randconfig-r041-20230105
hexagon              randconfig-r045-20230105
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a012
i386                          randconfig-a013
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a015
s390                 randconfig-r044-20230106
hexagon              randconfig-r041-20230106
hexagon              randconfig-r045-20230106
riscv                randconfig-r042-20230106
x86_64                        randconfig-k001
x86_64                           allyesconfig
arm                       aspeed_g4_defconfig
powerpc                     mpc5200_defconfig
arm                          moxart_defconfig
arm                        neponset_defconfig
mips                 randconfig-c004-20230106
x86_64                        randconfig-c007
i386                          randconfig-c001
s390                 randconfig-c005-20230106
arm                  randconfig-c002-20230106
riscv                randconfig-c006-20230106
powerpc              randconfig-c003-20230106
i386                             allyesconfig
powerpc                      acadia_defconfig
mips                          rm200_defconfig
arm                          collie_defconfig
powerpc                   microwatt_defconfig
powerpc                 mpc832x_rdb_defconfig
arm                          pcm027_defconfig
powerpc                       ebony_defconfig
s390                 randconfig-r044-20230108
hexagon              randconfig-r041-20230108
hexagon              randconfig-r045-20230108
riscv                randconfig-r042-20230108
x86_64               randconfig-a001-20230109
x86_64               randconfig-a002-20230109
x86_64               randconfig-a004-20230109
x86_64               randconfig-a003-20230109
x86_64               randconfig-a006-20230109
x86_64               randconfig-a005-20230109
arm                  colibri_pxa300_defconfig
x86_64                          rhel-8.3-rust

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
