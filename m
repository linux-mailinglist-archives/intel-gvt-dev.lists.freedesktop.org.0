Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F52836173A
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 16 Apr 2021 03:49:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2F376EB22;
	Fri, 16 Apr 2021 01:49:17 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 870726EB20
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 16 Apr 2021 01:49:16 +0000 (UTC)
IronPort-SDR: 61KoKkeRPDFTJFFoBAXykXr4LFa7SP3UNI+xloLtgW1hZkOb05evIXz46RF+8e+kRdj+MSyYdM
 nPSwS/crLYxA==
X-IronPort-AV: E=McAfee;i="6200,9189,9955"; a="256290505"
X-IronPort-AV: E=Sophos;i="5.82,226,1613462400"; d="scan'208";a="256290505"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2021 18:49:15 -0700
IronPort-SDR: 8qNf+6srL4i7NeoV5U+RDEb0y3cuogonkOZOTBasp9J116uQy3wcY/g+zG17jQ0DixRl+TrXGf
 UHATfFHCC+AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,226,1613462400"; d="scan'208";a="444364365"
Received: from lkp-server02.sh.intel.com (HELO fa9c8fcc3464) ([10.239.97.151])
 by fmsmga004.fm.intel.com with ESMTP; 15 Apr 2021 18:49:13 -0700
Received: from kbuild by fa9c8fcc3464 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lXDbc-0001CO-AW; Fri, 16 Apr 2021 01:49:12 +0000
Date: Fri, 16 Apr 2021 09:49:07 +0800
From: kernel test robot <lkp@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: [intel-gvt-linux:gvt-next-fixes] BUILD SUCCESS
 01f98ffd51adf08bc2e4074afa0b9a4d2932e0c5
Message-ID: <6078ed13.qIKFyYn7G57OdJEq%lkp@intel.com>
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

tree/branch: https://github.com/intel/gvt-linux.git gvt-next-fixes
branch HEAD: 01f98ffd51adf08bc2e4074afa0b9a4d2932e0c5  drm/i915/gvt: Remove duplicated register accessible check

elapsed time: 723m

configs tested: 179
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
x86_64                           allyesconfig
riscv                            allmodconfig
i386                             allyesconfig
riscv                            allyesconfig
arm                       aspeed_g4_defconfig
xtensa                         virt_defconfig
arm                          gemini_defconfig
h8300                            alldefconfig
riscv                    nommu_k210_defconfig
um                               allmodconfig
powerpc                     tqm5200_defconfig
ia64                        generic_defconfig
csky                                defconfig
mips                          rb532_defconfig
m68k                             alldefconfig
arc                         haps_hs_defconfig
powerpc                      ppc64e_defconfig
powerpc                 mpc834x_mds_defconfig
powerpc                      makalu_defconfig
arm                    vt8500_v6_v7_defconfig
powerpc                     mpc5200_defconfig
sh                         apsh4a3a_defconfig
powerpc                     taishan_defconfig
s390                             alldefconfig
arm                          pxa168_defconfig
sh                          rsk7269_defconfig
arm                        realview_defconfig
mips                      maltaaprp_defconfig
h8300                     edosk2674_defconfig
powerpc                    klondike_defconfig
mips                     cu1000-neo_defconfig
powerpc                 mpc832x_mds_defconfig
sparc64                          alldefconfig
um                                allnoconfig
sh                          polaris_defconfig
m68k                        m5307c3_defconfig
ia64                            zx1_defconfig
sh                           se7619_defconfig
arm                       spear13xx_defconfig
powerpc                 mpc832x_rdb_defconfig
powerpc                       ebony_defconfig
arm                           sama5_defconfig
mips                            ar7_defconfig
m68k                        m5272c3_defconfig
powerpc                     tqm8560_defconfig
nios2                            allyesconfig
sh                ecovec24-romimage_defconfig
arm                          simpad_defconfig
powerpc                      ppc44x_defconfig
powerpc                 mpc836x_rdk_defconfig
powerpc                     tqm8555_defconfig
arm                          iop32x_defconfig
sh                           sh2007_defconfig
powerpc                     stx_gp3_defconfig
riscv                          rv32_defconfig
sh                          rsk7203_defconfig
arm                        vexpress_defconfig
sh                  sh7785lcr_32bit_defconfig
arm                            mps2_defconfig
arm                        trizeps4_defconfig
sh                           se7705_defconfig
mips                        maltaup_defconfig
ia64                         bigsur_defconfig
um                               alldefconfig
arm                        clps711x_defconfig
riscv                            alldefconfig
arm                       cns3420vb_defconfig
mips                       bmips_be_defconfig
riscv                             allnoconfig
arm                       mainstone_defconfig
sh                          sdk7786_defconfig
arm                        neponset_defconfig
arm                      integrator_defconfig
arm                        multi_v7_defconfig
arm                         cm_x300_defconfig
arm                          pxa910_defconfig
arm                           sunxi_defconfig
powerpc                 mpc8272_ads_defconfig
sh                            titan_defconfig
arm                        magician_defconfig
powerpc                     skiroot_defconfig
sh                        sh7757lcr_defconfig
nios2                         3c120_defconfig
arm                          moxart_defconfig
powerpc                        fsp2_defconfig
m68k                       m5275evb_defconfig
arm                         palmz72_defconfig
powerpc                    sam440ep_defconfig
mips                           ip32_defconfig
mips                  decstation_64_defconfig
powerpc                        cell_defconfig
sh                     sh7710voipgw_defconfig
arm                      tct_hammer_defconfig
sh                        apsh4ad0a_defconfig
arm                        mvebu_v7_defconfig
alpha                               defconfig
arm                           h3600_defconfig
powerpc64                           defconfig
sh                        edosk7760_defconfig
arc                           tb10x_defconfig
powerpc               mpc834x_itxgp_defconfig
mips                        nlm_xlr_defconfig
arm                  colibri_pxa270_defconfig
arm                      jornada720_defconfig
mips                            e55_defconfig
ia64                             alldefconfig
powerpc                     kilauea_defconfig
m68k                          multi_defconfig
mips                        workpad_defconfig
arm                         s3c6400_defconfig
i386                             alldefconfig
powerpc                    mvme5100_defconfig
sh                             shx3_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
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
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a003-20210415
x86_64               randconfig-a002-20210415
x86_64               randconfig-a005-20210415
x86_64               randconfig-a001-20210415
x86_64               randconfig-a006-20210415
x86_64               randconfig-a004-20210415
i386                 randconfig-a003-20210415
i386                 randconfig-a006-20210415
i386                 randconfig-a001-20210415
i386                 randconfig-a005-20210415
i386                 randconfig-a004-20210415
i386                 randconfig-a002-20210415
i386                 randconfig-a015-20210415
i386                 randconfig-a014-20210415
i386                 randconfig-a013-20210415
i386                 randconfig-a012-20210415
i386                 randconfig-a016-20210415
i386                 randconfig-a011-20210415
riscv                    nommu_virt_defconfig
riscv                               defconfig
um                               allyesconfig
um                                  defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a014-20210415
x86_64               randconfig-a015-20210415
x86_64               randconfig-a011-20210415
x86_64               randconfig-a013-20210415
x86_64               randconfig-a012-20210415
x86_64               randconfig-a016-20210415

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
