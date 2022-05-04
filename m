Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1945E519297
	for <lists+intel-gvt-dev@lfdr.de>; Wed,  4 May 2022 02:11:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE084112028;
	Wed,  4 May 2022 00:11:34 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC494112028
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  4 May 2022 00:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651623093; x=1683159093;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=vryQn0y+k/o542x7VJF8RyvHwcJ9dUityAxZwrFkc2I=;
 b=MbqxK272YDK/T+v5Cpv3Plytc3DbNMIlPLFkp09c+hD9oCwsomQ7rVZQ
 SJIfwT/QSYdBtcXmVCFjZxn2d+/TEipCCGbqKmVbsnwUNbTZIIz3EQ2LV
 LxOcB8fMG8ybwxJAhEF1CF2e7WcT8ODXIRH2UqIQoLd4jApAreDwckLuC
 mb/JDK+539PtdJfKReZU+wxQOEkLhEybAMfuqs+wbbG6Q0lWm4LSxkP2/
 ypZTSp16SqdbASRP8gWefp1wT4ScgrJWm+8B1bJnpF9ccgUe8WEma0ljw
 oeaCBGdxIgWH2G1AQu+DFA4tyIRydzYbKgkxwpEoUC4TXqkch5jwD/NMk w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10336"; a="330612266"
X-IronPort-AV: E=Sophos;i="5.91,196,1647327600"; d="scan'208";a="330612266"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 17:11:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,196,1647327600"; d="scan'208";a="620562529"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
 by fmsmga008.fm.intel.com with ESMTP; 03 May 2022 17:11:31 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nm2c6-000Atz-CR;
 Wed, 04 May 2022 00:11:30 +0000
Date: Wed, 04 May 2022 08:10:37 +0800
From: kernel test robot <lkp@intel.com>
To: Zhi Wang <zhi.a.wang@intel.com>
Subject: [intel-gvt:topic/for-christoph] BUILD SUCCESS
 419f8299ddad6070a6c95aaedf78e50265871f36
Message-ID: <6271c47d.Hvdc7J7/estMry2O%lkp@intel.com>
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

tree/branch: https://github.com/intel/gvt-linux.git topic/for-christoph
branch HEAD: 419f8299ddad6070a6c95aaedf78e50265871f36  i915/gvt: Fix NULL pointer dereference in init_mmio_block_handlers

elapsed time: 7319m

configs tested: 234
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
s390                       zfcpdump_defconfig
arm                        realview_defconfig
arm                       multi_v4t_defconfig
xtensa                  nommu_kc705_defconfig
sparc64                          alldefconfig
arm                         lubbock_defconfig
m68k                                defconfig
sh                          sdk7780_defconfig
powerpc                     tqm8555_defconfig
parisc                              defconfig
sh                         microdev_defconfig
arc                            hsdk_defconfig
mips                          rb532_defconfig
powerpc                       holly_defconfig
mips                        vocore2_defconfig
sh                           se7619_defconfig
mips                  maltasmvp_eva_defconfig
powerpc                        cell_defconfig
parisc                generic-64bit_defconfig
arm                         cm_x300_defconfig
powerpc                      ep88xc_defconfig
arm                           imxrt_defconfig
powerpc                    klondike_defconfig
m68k                       m5208evb_defconfig
arc                              alldefconfig
sparc                       sparc64_defconfig
powerpc                 mpc837x_mds_defconfig
xtensa                       common_defconfig
ia64                         bigsur_defconfig
m68k                          sun3x_defconfig
arm                         nhk8815_defconfig
sh                        apsh4ad0a_defconfig
m68k                       m5275evb_defconfig
xtensa                           allyesconfig
powerpc                     tqm8541_defconfig
mips                            gpr_defconfig
powerpc                mpc7448_hpc2_defconfig
xtensa                              defconfig
sh                          lboxre2_defconfig
sparc64                             defconfig
arm                           sunxi_defconfig
powerpc                       maple_defconfig
powerpc                     taishan_defconfig
arm                       omap2plus_defconfig
mips                  decstation_64_defconfig
sh                          kfr2r09_defconfig
alpha                            alldefconfig
mips                      fuloong2e_defconfig
nios2                         3c120_defconfig
arm                         vf610m4_defconfig
m68k                        stmark2_defconfig
nios2                               defconfig
arm                            qcom_defconfig
powerpc64                           defconfig
sh                        edosk7760_defconfig
s390                          debug_defconfig
sh                      rts7751r2d1_defconfig
sh                   sh7724_generic_defconfig
sh                        sh7785lcr_defconfig
mips                     loongson1b_defconfig
arc                         haps_hs_defconfig
arm                        cerfcube_defconfig
sh                        edosk7705_defconfig
m68k                          multi_defconfig
sh                         ecovec24_defconfig
mips                     decstation_defconfig
powerpc                         wii_defconfig
powerpc                 mpc8540_ads_defconfig
powerpc                     sequoia_defconfig
powerpc                     mpc83xx_defconfig
mips                         rt305x_defconfig
powerpc                    amigaone_defconfig
mips                      maltasmvp_defconfig
sh                             sh03_defconfig
powerpc                 linkstation_defconfig
sh                          r7785rp_defconfig
mips                             allyesconfig
h8300                       h8s-sim_defconfig
sh                           sh2007_defconfig
powerpc                     asp8347_defconfig
mips                       bmips_be_defconfig
sh                           se7206_defconfig
sh                   rts7751r2dplus_defconfig
parisc64                            defconfig
sh                        sh7763rdp_defconfig
m68k                             allmodconfig
arm                        oxnas_v6_defconfig
sh                           se7721_defconfig
sh                           se7705_defconfig
sh                          polaris_defconfig
m68k                         amcore_defconfig
powerpc                    sam440ep_defconfig
m68k                       m5475evb_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220501
arm                  randconfig-c002-20220428
arm                  randconfig-c002-20220429
x86_64               randconfig-c001-20220502
i386                 randconfig-c001-20220502
arm                  randconfig-c002-20220502
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allyesconfig
arc                              allyesconfig
csky                                defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                                defconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                             allyesconfig
sparc                               defconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64               randconfig-a006-20220502
x86_64               randconfig-a001-20220502
x86_64               randconfig-a003-20220502
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                 randconfig-a004-20220502
i386                 randconfig-a006-20220502
i386                 randconfig-a002-20220502
i386                 randconfig-a003-20220502
i386                 randconfig-a001-20220502
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220501
s390                 randconfig-r044-20220501
riscv                randconfig-r042-20220501
arc                  randconfig-r043-20220428
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                                  kexec
x86_64                              defconfig
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3
x86_64                           allyesconfig

clang tested configs:
x86_64                        randconfig-c007
i386                          randconfig-c001
powerpc              randconfig-c003-20220501
riscv                randconfig-c006-20220501
mips                 randconfig-c004-20220501
arm                  randconfig-c002-20220501
riscv                randconfig-c006-20220428
mips                 randconfig-c004-20220428
arm                  randconfig-c002-20220428
powerpc              randconfig-c003-20220428
arm                       spear13xx_defconfig
mips                   sb1250_swarm_defconfig
arm                         shannon_defconfig
mips                     loongson2k_defconfig
arm                   milbeaut_m10v_defconfig
powerpc                    ge_imp3a_defconfig
arm                        vexpress_defconfig
arm                         palmz72_defconfig
arm                       cns3420vb_defconfig
riscv                    nommu_virt_defconfig
powerpc                  mpc866_ads_defconfig
mips                  cavium_octeon_defconfig
arm                          ep93xx_defconfig
arm                        neponset_defconfig
arm                          moxart_defconfig
arm                            mmp2_defconfig
powerpc                      katmai_defconfig
powerpc                     tqm8540_defconfig
mips                           mtx1_defconfig
powerpc                  mpc885_ads_defconfig
powerpc                    socrates_defconfig
arm                         bcm2835_defconfig
powerpc                        fsp2_defconfig
powerpc                   microwatt_defconfig
mips                       lemote2f_defconfig
powerpc                 mpc8315_rdb_defconfig
x86_64                           allyesconfig
mips                           ip28_defconfig
mips                      maltaaprp_defconfig
powerpc                      pmac32_defconfig
powerpc                     ksi8560_defconfig
arm                           omap1_defconfig
mips                        qi_lb60_defconfig
riscv                          rv32_defconfig
mips                          ath25_defconfig
powerpc                     skiroot_defconfig
powerpc                 linkstation_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64               randconfig-a015-20220502
x86_64               randconfig-a012-20220502
x86_64               randconfig-a016-20220502
x86_64               randconfig-a014-20220502
x86_64               randconfig-a013-20220502
x86_64               randconfig-a011-20220502
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220502
riscv                randconfig-r042-20220502
hexagon              randconfig-r041-20220502
hexagon              randconfig-r045-20220428
hexagon              randconfig-r041-20220428
riscv                randconfig-r042-20220428
s390                 randconfig-r044-20220428
hexagon              randconfig-r045-20220501
hexagon              randconfig-r041-20220501

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
