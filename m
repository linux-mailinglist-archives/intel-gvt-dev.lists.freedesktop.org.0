Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 836A336173B
	for <lists+intel-gvt-dev@lfdr.de>; Fri, 16 Apr 2021 03:49:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 063506EB20;
	Fri, 16 Apr 2021 01:49:17 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C8736EB20
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 16 Apr 2021 01:49:16 +0000 (UTC)
IronPort-SDR: MDqoKXFURzrwKVssa3sv7NxGrNCp20a5qOLaiQXl+2R+uge/VJW5FnMoFDbmgletifzKrbZq/t
 ZAcB/biA9WAw==
X-IronPort-AV: E=McAfee;i="6200,9189,9955"; a="182100389"
X-IronPort-AV: E=Sophos;i="5.82,226,1613462400"; d="scan'208";a="182100389"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2021 18:49:14 -0700
IronPort-SDR: W4uOG8BxRN6csgbPlRmW6uQTyokHpcvZkTSvBqhA+jUqjIbveYapyWPieBP0NOxzaPb6HUXDUC
 ozCpD1Pp3Cbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,226,1613462400"; d="scan'208";a="421874740"
Received: from lkp-server02.sh.intel.com (HELO fa9c8fcc3464) ([10.239.97.151])
 by orsmga007.jf.intel.com with ESMTP; 15 Apr 2021 18:49:13 -0700
Received: from kbuild by fa9c8fcc3464 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lXDbc-0001CR-Be; Fri, 16 Apr 2021 01:49:12 +0000
Date: Fri, 16 Apr 2021 09:49:05 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [intel-gvt-linux:gvt-fixes] BUILD SUCCESS
 b6a37a93c9ac3900987c79b726d0bb3699d8db4e
Message-ID: <6078ed11.I7SAl6SkIf0Vjgj/%lkp@intel.com>
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

tree/branch: https://github.com/intel/gvt-linux.git gvt-fixes
branch HEAD: b6a37a93c9ac3900987c79b726d0bb3699d8db4e  drm/i915: Fix invalid access to ACPI _DSM objects

elapsed time: 10284m

configs tested: 251
configs skipped: 3

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
powerpc                 mpc8540_ads_defconfig
sparc64                             defconfig
xtensa                           alldefconfig
arm                            mps2_defconfig
um                            kunit_defconfig
m68k                          multi_defconfig
arm                       aspeed_g4_defconfig
xtensa                         virt_defconfig
arm                          gemini_defconfig
h8300                            alldefconfig
nios2                            alldefconfig
m68k                         apollo_defconfig
mips                        omega2p_defconfig
mips                        nlm_xlr_defconfig
powerpc                 mpc8315_rdb_defconfig
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
sh                      rts7751r2d1_defconfig
powerpc                   motionpro_defconfig
sh                         ap325rxa_defconfig
powerpc                       eiger_defconfig
mips                         tb0226_defconfig
sh                          rsk7269_defconfig
arm                        realview_defconfig
mips                      maltaaprp_defconfig
h8300                     edosk2674_defconfig
powerpc                    klondike_defconfig
mips                     cu1000-neo_defconfig
powerpc                 mpc832x_mds_defconfig
sparc64                          alldefconfig
parisc                           alldefconfig
m68k                         amcore_defconfig
mips                       bmips_be_defconfig
xtensa                  cadence_csp_defconfig
sh                          rsk7264_defconfig
sh                           se7751_defconfig
mips                        vocore2_defconfig
powerpc                           allnoconfig
um                                allnoconfig
sh                          polaris_defconfig
m68k                        m5307c3_defconfig
ia64                            zx1_defconfig
sh                           se7619_defconfig
arm                       spear13xx_defconfig
sh                           se7206_defconfig
mips                      fuloong2e_defconfig
arm                           sama5_defconfig
mips                      maltasmvp_defconfig
powerpc                 mpc832x_rdb_defconfig
powerpc                       ebony_defconfig
mips                            ar7_defconfig
m68k                        m5272c3_defconfig
powerpc                     tqm8560_defconfig
nios2                            allyesconfig
sh                ecovec24-romimage_defconfig
arm                          simpad_defconfig
powerpc                      ppc44x_defconfig
arm                       imx_v4_v5_defconfig
mips                           ip27_defconfig
mips                         mpc30x_defconfig
s390                                defconfig
powerpc                 mpc836x_rdk_defconfig
powerpc                     tqm8555_defconfig
arm                          iop32x_defconfig
sh                           sh2007_defconfig
powerpc                     stx_gp3_defconfig
riscv                          rv32_defconfig
mips                  maltasmvp_eva_defconfig
arm                       versatile_defconfig
sh                          lboxre2_defconfig
sh                          rsk7203_defconfig
arm                        vexpress_defconfig
sh                  sh7785lcr_32bit_defconfig
arm                        trizeps4_defconfig
arm                         cm_x300_defconfig
m68k                       m5475evb_defconfig
mips                         bigsur_defconfig
arm                            pleb_defconfig
mips                      pistachio_defconfig
sh                           se7705_defconfig
mips                        maltaup_defconfig
ia64                         bigsur_defconfig
um                               alldefconfig
arm                        clps711x_defconfig
riscv                            alldefconfig
arm                       cns3420vb_defconfig
riscv                             allnoconfig
arm                       mainstone_defconfig
sh                          sdk7786_defconfig
arm                        neponset_defconfig
arm                      integrator_defconfig
arm                        multi_v7_defconfig
mips                     cu1830-neo_defconfig
arc                 nsimosci_hs_smp_defconfig
arc                        nsim_700_defconfig
arm                       netwinder_defconfig
arm                          pxa910_defconfig
arm                           sunxi_defconfig
arm                  colibri_pxa300_defconfig
ia64                             allyesconfig
microblaze                          defconfig
sh                        sh7785lcr_defconfig
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
ia64                             allmodconfig
sh                          urquell_defconfig
arc                      axs103_smp_defconfig
sh                   rts7751r2dplus_defconfig
powerpc                     ppa8548_defconfig
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
arm                  colibri_pxa270_defconfig
arm                      jornada720_defconfig
mips                           ip28_defconfig
powerpc                    adder875_defconfig
mips                     loongson1b_defconfig
arm                         mv78xx0_defconfig
arm                       multi_v4t_defconfig
mips                            e55_defconfig
ia64                             alldefconfig
powerpc                     kilauea_defconfig
mips                        workpad_defconfig
arm                         s3c6400_defconfig
i386                             alldefconfig
powerpc                    mvme5100_defconfig
sh                             shx3_defconfig
ia64                                defconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
alpha                            allyesconfig
arc                                 defconfig
xtensa                           allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
x86_64               randconfig-a003-20210415
x86_64               randconfig-a002-20210415
x86_64               randconfig-a005-20210415
x86_64               randconfig-a001-20210415
x86_64               randconfig-a006-20210415
x86_64               randconfig-a004-20210415
i386                 randconfig-a003-20210409
i386                 randconfig-a001-20210409
i386                 randconfig-a004-20210409
i386                 randconfig-a002-20210409
i386                 randconfig-a005-20210409
i386                 randconfig-a003-20210415
i386                 randconfig-a006-20210415
i386                 randconfig-a001-20210415
i386                 randconfig-a005-20210415
i386                 randconfig-a004-20210415
i386                 randconfig-a002-20210415
i386                 randconfig-a006-20210409
x86_64               randconfig-a014-20210409
x86_64               randconfig-a015-20210409
x86_64               randconfig-a012-20210409
x86_64               randconfig-a011-20210409
x86_64               randconfig-a013-20210409
x86_64               randconfig-a016-20210409
i386                 randconfig-a015-20210415
i386                 randconfig-a014-20210415
i386                 randconfig-a013-20210415
i386                 randconfig-a012-20210415
i386                 randconfig-a016-20210415
i386                 randconfig-a011-20210415
i386                 randconfig-a014-20210409
i386                 randconfig-a011-20210409
i386                 randconfig-a016-20210409
i386                 randconfig-a012-20210409
i386                 randconfig-a013-20210409
i386                 randconfig-a015-20210409
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
x86_64               randconfig-a004-20210409
x86_64               randconfig-a005-20210409
x86_64               randconfig-a003-20210409
x86_64               randconfig-a001-20210409
x86_64               randconfig-a002-20210409
x86_64               randconfig-a006-20210409
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
