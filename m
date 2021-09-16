Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4772440D828
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 16 Sep 2021 13:12:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0715A6EB71;
	Thu, 16 Sep 2021 11:12:29 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4110C6EB71
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 16 Sep 2021 11:12:28 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10108"; a="244916431"
X-IronPort-AV: E=Sophos;i="5.85,298,1624345200"; d="scan'208";a="244916431"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 04:12:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,298,1624345200"; d="scan'208";a="698823442"
Received: from lkp-server01.sh.intel.com (HELO 285e7b116627) ([10.239.97.150])
 by fmsmga006.fm.intel.com with ESMTP; 16 Sep 2021 04:12:20 -0700
Received: from kbuild by 285e7b116627 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mQpJT-0000yq-Kj; Thu, 16 Sep 2021 11:12:19 +0000
Date: Thu, 16 Sep 2021 19:11:50 +0800
From: kernel test robot <lkp@intel.com>
To: John Harrison <John.C.Harrison@Intel.com>
Cc: intel-gvt-dev@lists.freedesktop.org, terrence.xu@intel.com,
 zhenyu.z.wang@intel.com
Subject: [intel-gvt:gvt-gt-next] BUILD SUCCESS
 f25e3908b9cd4a3fe819e9bdcdde58f20bacb34c
Message-ID: <61432676./zhzdVL+1hP38IEt%lkp@intel.com>
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
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

tree/branch: https://github.com/intel/gvt-linux.git gvt-gt-next
branch HEAD: f25e3908b9cd4a3fe819e9bdcdde58f20bacb34c  drm/i915: Get PM ref before accessing HW register

elapsed time: 8049m

configs tested: 263
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20210916
i386                 randconfig-c001-20210910
powerpc                     pq2fads_defconfig
powerpc                      pasemi_defconfig
m68k                         amcore_defconfig
arm                         lpc32xx_defconfig
arm                  colibri_pxa270_defconfig
mips                        nlm_xlp_defconfig
sh                                  defconfig
arm                     am200epdkit_defconfig
arm                     eseries_pxa_defconfig
powerpc                   currituck_defconfig
powerpc                     skiroot_defconfig
mips                       lemote2f_defconfig
powerpc                 mpc8313_rdb_defconfig
mips                malta_qemu_32r6_defconfig
arm                      footbridge_defconfig
arm                          lpd270_defconfig
sh                   sh7724_generic_defconfig
sh                          kfr2r09_defconfig
sh                     sh7710voipgw_defconfig
mips                 decstation_r4k_defconfig
arm                           h3600_defconfig
mips                          rb532_defconfig
xtensa                          iss_defconfig
ia64                         bigsur_defconfig
arm                         nhk8815_defconfig
arm                       aspeed_g4_defconfig
sparc                            alldefconfig
powerpc                     ksi8560_defconfig
powerpc                 mpc834x_mds_defconfig
powerpc                  mpc885_ads_defconfig
mips                         rt305x_defconfig
mips                     loongson1b_defconfig
powerpc                   lite5200b_defconfig
powerpc                      acadia_defconfig
powerpc                      tqm8xx_defconfig
h8300                       h8s-sim_defconfig
sh                   sh7770_generic_defconfig
arm                            hisi_defconfig
powerpc                        warp_defconfig
mips                        workpad_defconfig
sh                        edosk7760_defconfig
sh                          r7785rp_defconfig
powerpc                 mpc832x_mds_defconfig
sparc                       sparc64_defconfig
mips                      loongson3_defconfig
arm                         axm55xx_defconfig
arm                           sama5_defconfig
arm                          ixp4xx_defconfig
arm                         bcm2835_defconfig
m68k                          atari_defconfig
sh                   secureedge5410_defconfig
sh                           se7721_defconfig
powerpc                     mpc5200_defconfig
arm                  colibri_pxa300_defconfig
arm                        clps711x_defconfig
s390                             alldefconfig
ia64                      gensparse_defconfig
powerpc                    mvme5100_defconfig
arm                       cns3420vb_defconfig
mips                        nlm_xlr_defconfig
mips                      bmips_stb_defconfig
arm                      pxa255-idp_defconfig
sh                            hp6xx_defconfig
sh                          urquell_defconfig
arm                         s5pv210_defconfig
arm                         palmz72_defconfig
arm                        multi_v7_defconfig
sh                      rts7751r2d1_defconfig
openrisc                         alldefconfig
m68k                        mvme16x_defconfig
powerpc                     ep8248e_defconfig
powerpc                      arches_defconfig
riscv                               defconfig
powerpc                     mpc83xx_defconfig
mips                         tb0226_defconfig
arm                          pxa168_defconfig
mips                        bcm63xx_defconfig
arm                              alldefconfig
arm                        multi_v5_defconfig
openrisc                    or1ksim_defconfig
sh                          rsk7203_defconfig
arc                      axs103_smp_defconfig
mips                         bigsur_defconfig
mips                           xway_defconfig
arc                              alldefconfig
m68k                             alldefconfig
powerpc                 mpc8272_ads_defconfig
powerpc                 mpc8560_ads_defconfig
sh                            shmin_defconfig
sh                        dreamcast_defconfig
x86_64               randconfig-c001-20210915
arm                  randconfig-c002-20210915
i386                 randconfig-c001-20210915
x86_64               randconfig-c001-20210916
arm                  randconfig-c002-20210916
x86_64               randconfig-c001-20210910
arm                  randconfig-c002-20210910
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                             allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a002-20210913
x86_64               randconfig-a003-20210913
x86_64               randconfig-a006-20210913
x86_64               randconfig-a004-20210913
x86_64               randconfig-a005-20210913
x86_64               randconfig-a001-20210913
x86_64               randconfig-a016-20210916
x86_64               randconfig-a013-20210916
x86_64               randconfig-a012-20210916
x86_64               randconfig-a011-20210916
x86_64               randconfig-a014-20210916
x86_64               randconfig-a015-20210916
x86_64               randconfig-a013-20210910
x86_64               randconfig-a016-20210910
x86_64               randconfig-a012-20210910
x86_64               randconfig-a011-20210910
x86_64               randconfig-a014-20210910
x86_64               randconfig-a015-20210910
x86_64               randconfig-a013-20210914
x86_64               randconfig-a016-20210914
x86_64               randconfig-a012-20210914
x86_64               randconfig-a011-20210914
x86_64               randconfig-a014-20210914
x86_64               randconfig-a015-20210914
i386                 randconfig-a016-20210916
i386                 randconfig-a015-20210916
i386                 randconfig-a011-20210916
i386                 randconfig-a012-20210916
i386                 randconfig-a013-20210916
i386                 randconfig-a014-20210916
i386                 randconfig-a016-20210914
i386                 randconfig-a015-20210914
i386                 randconfig-a011-20210914
i386                 randconfig-a012-20210914
i386                 randconfig-a013-20210914
i386                 randconfig-a014-20210914
i386                 randconfig-a016-20210910
i386                 randconfig-a011-20210910
i386                 randconfig-a015-20210910
i386                 randconfig-a012-20210910
i386                 randconfig-a013-20210910
i386                 randconfig-a014-20210910
riscv                randconfig-r042-20210910
s390                 randconfig-r044-20210910
arc                  randconfig-r043-20210910
arc                  randconfig-r043-20210913
riscv                randconfig-r042-20210916
s390                 randconfig-r044-20210916
arc                  randconfig-r043-20210916
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allyesconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-c007-20210912
i386                 randconfig-c001-20210912
arm                  randconfig-c002-20210912
riscv                randconfig-c006-20210912
mips                 randconfig-c004-20210912
powerpc              randconfig-c003-20210912
s390                 randconfig-c005-20210912
x86_64               randconfig-a002-20210910
x86_64               randconfig-a003-20210910
x86_64               randconfig-a004-20210910
x86_64               randconfig-a006-20210910
x86_64               randconfig-a005-20210910
x86_64               randconfig-a001-20210910
x86_64               randconfig-a002-20210914
x86_64               randconfig-a003-20210914
x86_64               randconfig-a004-20210914
x86_64               randconfig-a006-20210914
x86_64               randconfig-a005-20210914
x86_64               randconfig-a001-20210914
i386                 randconfig-a004-20210916
i386                 randconfig-a005-20210916
i386                 randconfig-a006-20210916
i386                 randconfig-a002-20210916
i386                 randconfig-a003-20210916
i386                 randconfig-a001-20210916
i386                 randconfig-a004-20210914
i386                 randconfig-a005-20210914
i386                 randconfig-a006-20210914
i386                 randconfig-a002-20210914
i386                 randconfig-a001-20210914
i386                 randconfig-a003-20210914
i386                 randconfig-a004-20210910
i386                 randconfig-a005-20210910
i386                 randconfig-a002-20210910
i386                 randconfig-a006-20210910
i386                 randconfig-a001-20210910
i386                 randconfig-a003-20210910
x86_64               randconfig-a016-20210913
x86_64               randconfig-a013-20210913
x86_64               randconfig-a012-20210913
x86_64               randconfig-a011-20210913
x86_64               randconfig-a014-20210913
x86_64               randconfig-a015-20210913
i386                 randconfig-a016-20210913
i386                 randconfig-a011-20210913
i386                 randconfig-a015-20210913
i386                 randconfig-a012-20210913
i386                 randconfig-a013-20210913
i386                 randconfig-a014-20210913
x86_64               randconfig-a002-20210916
x86_64               randconfig-a003-20210916
x86_64               randconfig-a006-20210916
x86_64               randconfig-a004-20210916
x86_64               randconfig-a005-20210916
x86_64               randconfig-a001-20210916
hexagon              randconfig-r045-20210910
hexagon              randconfig-r041-20210910
riscv                randconfig-r042-20210913
hexagon              randconfig-r045-20210913
s390                 randconfig-r044-20210913
hexagon              randconfig-r041-20210913
hexagon              randconfig-r045-20210914
hexagon              randconfig-r041-20210914
hexagon              randconfig-r045-20210916
hexagon              randconfig-r041-20210916

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
