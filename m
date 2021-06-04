Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F0639B4C0
	for <lists+intel-gvt-dev@lfdr.de>; Fri,  4 Jun 2021 10:20:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DBF16E15D;
	Fri,  4 Jun 2021 08:20:21 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C4E76E43F
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  4 Jun 2021 08:20:19 +0000 (UTC)
IronPort-SDR: kjVNoNLwNxfRVht77G7IpUn+iFqu2faJ7XMzDuRXc9t9FjTol31LljHgJlP7LS6jRWN3mfJNkN
 0DissnuXU1Yw==
X-IronPort-AV: E=McAfee;i="6200,9189,10004"; a="268113499"
X-IronPort-AV: E=Sophos;i="5.83,247,1616482800"; d="scan'208";a="268113499"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2021 01:20:18 -0700
IronPort-SDR: U0n9Vf1WXIJWn8+oZ+iWbsrFiyRLVwKQBpeSyfviIcJj0bA1CyAQUmbu6G9qGI4+PL7lzfebqa
 lyRJ57iBiJ5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,247,1616482800"; d="scan'208";a="446612370"
Received: from lkp-server02.sh.intel.com (HELO 1ec8406c5392) ([10.239.97.151])
 by orsmga008.jf.intel.com with ESMTP; 04 Jun 2021 01:20:16 -0700
Received: from kbuild by 1ec8406c5392 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lp53w-0006oS-1e; Fri, 04 Jun 2021 08:20:16 +0000
Date: Fri, 04 Jun 2021 16:19:35 +0800
From: kernel test robot <lkp@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: [intel-gvt-linux:gvt-next] BUILD SUCCESS
 428c051c49229c6db7ab252ceb2a4cb5b00b5550
Message-ID: <60b9e217.Nx6l59hiKu94oCVY%lkp@intel.com>
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

tree/branch: https://github.com/intel/gvt-linux.git gvt-next
branch HEAD: 428c051c49229c6db7ab252ceb2a4cb5b00b5550  drm/i915/gem: Use list_entry to access list members

elapsed time: 4193m

configs tested: 242
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                      tct_hammer_defconfig
sh                          sdk7780_defconfig
riscv                    nommu_virt_defconfig
arm                           tegra_defconfig
powerpc                     ppa8548_defconfig
arm                            zeus_defconfig
mips                           ip27_defconfig
powerpc                       ebony_defconfig
arm                            xcep_defconfig
h8300                               defconfig
powerpc                 mpc834x_mds_defconfig
arm                         cm_x300_defconfig
sh                          urquell_defconfig
mips                malta_qemu_32r6_defconfig
arm                       netwinder_defconfig
arm                        mvebu_v7_defconfig
powerpc                    gamecube_defconfig
powerpc                    mvme5100_defconfig
arm                      pxa255-idp_defconfig
arm                         s3c2410_defconfig
microblaze                          defconfig
arc                     nsimosci_hs_defconfig
nds32                            alldefconfig
arc                      axs103_smp_defconfig
sparc                       sparc64_defconfig
arm                         assabet_defconfig
powerpc                        cell_defconfig
powerpc                     tqm8541_defconfig
mips                            ar7_defconfig
m68k                             allmodconfig
powerpc                     taishan_defconfig
arm                        mini2440_defconfig
powerpc                     tqm8560_defconfig
arm                          pxa168_defconfig
sh                          polaris_defconfig
sh                          landisk_defconfig
um                           x86_64_defconfig
powerpc                 mpc832x_mds_defconfig
mips                    maltaup_xpa_defconfig
mips                        bcm47xx_defconfig
sh                           se7705_defconfig
m68k                       m5475evb_defconfig
parisc                              defconfig
arm                              alldefconfig
arc                     haps_hs_smp_defconfig
powerpc                 linkstation_defconfig
mips                           ip32_defconfig
sh                     sh7710voipgw_defconfig
mips                        vocore2_defconfig
sh                           se7780_defconfig
m68k                        m5307c3_defconfig
powerpc                     ep8248e_defconfig
powerpc                 mpc836x_mds_defconfig
powerpc64                           defconfig
arc                           tb10x_defconfig
arm                             ezx_defconfig
sh                           se7343_defconfig
sh                  sh7785lcr_32bit_defconfig
mips                   sb1250_swarm_defconfig
openrisc                            defconfig
sh                           se7619_defconfig
mips                        nlm_xlp_defconfig
arm                          imote2_defconfig
powerpc                    sam440ep_defconfig
mips                         tb0287_defconfig
powerpc                      pasemi_defconfig
sh                            hp6xx_defconfig
arm                         orion5x_defconfig
m68k                       m5208evb_defconfig
sh                          r7785rp_defconfig
mips                       capcella_defconfig
sh                           se7721_defconfig
ia64                                defconfig
arm                          pcm027_defconfig
arm                         s5pv210_defconfig
powerpc                     redwood_defconfig
powerpc                 mpc8272_ads_defconfig
sh                          r7780mp_defconfig
arm                         nhk8815_defconfig
arm                       imx_v4_v5_defconfig
i386                             alldefconfig
arm                         lubbock_defconfig
m68k                                defconfig
xtensa                    xip_kc705_defconfig
mips                      maltasmvp_defconfig
arm                             mxs_defconfig
arm                      footbridge_defconfig
parisc                generic-32bit_defconfig
openrisc                 simple_smp_defconfig
arc                        nsimosci_defconfig
m68k                         apollo_defconfig
m68k                       m5249evb_defconfig
sh                        dreamcast_defconfig
um                            kunit_defconfig
powerpc                 mpc836x_rdk_defconfig
sh                   sh7724_generic_defconfig
xtensa                    smp_lx200_defconfig
powerpc                 mpc837x_mds_defconfig
powerpc                        icon_defconfig
arm                    vt8500_v6_v7_defconfig
powerpc                     pq2fads_defconfig
arm                            lart_defconfig
mips                       rbtx49xx_defconfig
m68k                            q40_defconfig
m68k                        mvme16x_defconfig
mips                            gpr_defconfig
powerpc                         ps3_defconfig
sh                           se7206_defconfig
arm                         vf610m4_defconfig
riscv             nommu_k210_sdcard_defconfig
sparc                       sparc32_defconfig
mips                      bmips_stb_defconfig
sh                            titan_defconfig
arm                           u8500_defconfig
nios2                               defconfig
arc                        vdk_hs38_defconfig
arm                          moxart_defconfig
arm                  colibri_pxa300_defconfig
sh                               j2_defconfig
powerpc                 mpc837x_rdb_defconfig
mips                      malta_kvm_defconfig
arm                       versatile_defconfig
mips                          ath25_defconfig
sh                           sh2007_defconfig
sh                        sh7785lcr_defconfig
powerpc                      walnut_defconfig
arm                        spear6xx_defconfig
powerpc                 mpc8313_rdb_defconfig
powerpc                     tqm8555_defconfig
mips                         mpc30x_defconfig
arm                          gemini_defconfig
arm                           stm32_defconfig
powerpc                     pseries_defconfig
arm                          badge4_defconfig
arm                  colibri_pxa270_defconfig
mips                         cobalt_defconfig
sh                         ap325rxa_defconfig
m68k                            mac_defconfig
m68k                        mvme147_defconfig
powerpc                      chrp32_defconfig
powerpc                    adder875_defconfig
sh                        sh7763rdp_defconfig
mips                        nlm_xlr_defconfig
arm                       spear13xx_defconfig
arm                         at91_dt_defconfig
arm                            mmp2_defconfig
arm                        magician_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allyesconfig
arc                              allyesconfig
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
x86_64               randconfig-a002-20210602
x86_64               randconfig-a004-20210602
x86_64               randconfig-a003-20210602
x86_64               randconfig-a006-20210602
x86_64               randconfig-a005-20210602
x86_64               randconfig-a001-20210602
i386                 randconfig-a003-20210601
i386                 randconfig-a006-20210601
i386                 randconfig-a004-20210601
i386                 randconfig-a001-20210601
i386                 randconfig-a002-20210601
i386                 randconfig-a005-20210601
i386                 randconfig-a003-20210602
i386                 randconfig-a006-20210602
i386                 randconfig-a004-20210602
i386                 randconfig-a001-20210602
i386                 randconfig-a005-20210602
i386                 randconfig-a002-20210602
x86_64               randconfig-a015-20210601
x86_64               randconfig-a011-20210601
x86_64               randconfig-a012-20210601
x86_64               randconfig-a014-20210601
x86_64               randconfig-a016-20210601
x86_64               randconfig-a013-20210601
i386                 randconfig-a015-20210601
i386                 randconfig-a013-20210601
i386                 randconfig-a011-20210601
i386                 randconfig-a016-20210601
i386                 randconfig-a014-20210601
i386                 randconfig-a012-20210601
i386                 randconfig-a015-20210602
i386                 randconfig-a013-20210602
i386                 randconfig-a016-20210602
i386                 randconfig-a011-20210602
i386                 randconfig-a014-20210602
i386                 randconfig-a012-20210602
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210601
x86_64               randconfig-a002-20210601
x86_64               randconfig-a004-20210601
x86_64               randconfig-a003-20210601
x86_64               randconfig-a006-20210601
x86_64               randconfig-a005-20210601
x86_64               randconfig-a001-20210601
x86_64               randconfig-a015-20210602
x86_64               randconfig-a011-20210602
x86_64               randconfig-a012-20210602
x86_64               randconfig-a014-20210602
x86_64               randconfig-a016-20210602
x86_64               randconfig-a013-20210602

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
