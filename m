Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D22065255A7
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 12 May 2022 21:22:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FAAA10EC63;
	Thu, 12 May 2022 19:22:50 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25BA110EC63
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 12 May 2022 19:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652383369; x=1683919369;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=grpAk3uKrzWYmx5GOqWgSPRKV2zab87POKvJSwN0Vs4=;
 b=Zpf+DGP5UOgJapSadgfWVrltZ8pjLODN5t7lcl0wmXcFz76rk9QDE49H
 Y3iRcM1D8HxvoduAIyU0uuPNNb+MTklt+IGm+I8tA5UputxRaRSiIo0hj
 Qi38FvdD2yXIXbgr+POF0gTnM6SrzvjUwoF440tVDGgY6U7IPakNFiNw4
 MnEJP9Qz83JI0EuOB8wvTQSz2m3hMKEtLfkT4X9jfOyzUo3Mu91efEb5q
 QTnceUbnM4QCntxChr78GmbRfHUhQ/PK5KWhhn5SqLEUl54nMAMhZq10T
 Yr9qvOQoK1QU8dteS34o+o2Yl//BlLGZ9Wdn5Seamp7G2YhCu82wJkJlC g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10345"; a="250644073"
X-IronPort-AV: E=Sophos;i="5.91,220,1647327600"; d="scan'208";a="250644073"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2022 12:22:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,220,1647327600"; d="scan'208";a="658742496"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
 by FMSMGA003.fm.intel.com with ESMTP; 12 May 2022 12:22:46 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1npEOc-000Kqh-7h;
 Thu, 12 May 2022 19:22:46 +0000
Date: Fri, 13 May 2022 03:22:15 +0800
From: kernel test robot <lkp@intel.com>
To: "Ville =?iso-8859-1?Q?Syrj=E4l=E4"?= <ville.syrjala@linux.intel.com>
Subject: [intel-gvt:gvt-next] BUILD SUCCESS
 949665a6e237a6fd49ff207e3876d71b20b7e9f2
Message-ID: <627d5e67.JU1kDXFljyB8Cx1f%lkp@intel.com>
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
branch HEAD: 949665a6e237a6fd49ff207e3876d71b20b7e9f2  drm/i915: Respect VBT seamless DRRS min refresh rate

elapsed time: 10055m

configs tested: 402
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
powerpc              randconfig-c003-20220505
powerpc              randconfig-c003-20220507
powerpc                          allmodconfig
m68k                             allyesconfig
m68k                             allmodconfig
powerpc                          allyesconfig
s390                             allmodconfig
s390                             allyesconfig
m68k                       m5208evb_defconfig
powerpc                      ep88xc_defconfig
arm                         at91_dt_defconfig
arm                        clps711x_defconfig
arc                 nsimosci_hs_smp_defconfig
mips                         tb0226_defconfig
xtensa                       common_defconfig
arm                      jornada720_defconfig
m68k                         apollo_defconfig
m68k                          atari_defconfig
sh                          sdk7786_defconfig
arm                           h3600_defconfig
powerpc                     rainier_defconfig
s390                                defconfig
powerpc                  storcenter_defconfig
arm                         nhk8815_defconfig
powerpc                     ep8248e_defconfig
sh                ecovec24-romimage_defconfig
arm                           sunxi_defconfig
ia64                             alldefconfig
arm                          exynos_defconfig
h8300                    h8300h-sim_defconfig
arm                        multi_v7_defconfig
powerpc                      mgcoge_defconfig
xtensa                    smp_lx200_defconfig
ia64                      gensparse_defconfig
powerpc64                           defconfig
sh                        edosk7760_defconfig
arc                          axs101_defconfig
h8300                       h8s-sim_defconfig
xtensa                generic_kc705_defconfig
powerpc                      arches_defconfig
mips                           ip32_defconfig
sparc64                             defconfig
m68k                       m5475evb_defconfig
arm                        shmobile_defconfig
m68k                        mvme16x_defconfig
m68k                       m5249evb_defconfig
arm                            pleb_defconfig
mips                          rb532_defconfig
riscv                               defconfig
powerpc                     sequoia_defconfig
arc                          axs103_defconfig
ia64                         bigsur_defconfig
xtensa                          iss_defconfig
powerpc                       ppc64_defconfig
csky                             alldefconfig
sh                             sh03_defconfig
sh                   sh7724_generic_defconfig
powerpc                      cm5200_defconfig
powerpc                       eiger_defconfig
h8300                            alldefconfig
sh                           se7343_defconfig
powerpc                      pasemi_defconfig
powerpc                     redwood_defconfig
mips                  decstation_64_defconfig
sh                          kfr2r09_defconfig
sh                           se7712_defconfig
sparc                       sparc32_defconfig
powerpc                     pq2fads_defconfig
sh                 kfr2r09-romimage_defconfig
arm                         axm55xx_defconfig
arm                        spear6xx_defconfig
x86_64                           alldefconfig
powerpc                     tqm8548_defconfig
m68k                       bvme6000_defconfig
xtensa                  audio_kc705_defconfig
arm                          pxa3xx_defconfig
sh                           se7705_defconfig
mips                       bmips_be_defconfig
sh                          landisk_defconfig
csky                                defconfig
xtensa                  nommu_kc705_defconfig
mips                           ci20_defconfig
sh                           se7721_defconfig
m68k                       m5275evb_defconfig
arm                      footbridge_defconfig
sh                           se7750_defconfig
arc                         haps_hs_defconfig
powerpc                    klondike_defconfig
mips                        vocore2_defconfig
s390                       zfcpdump_defconfig
m68k                           sun3_defconfig
sh                            hp6xx_defconfig
powerpc                      ppc40x_defconfig
powerpc                    adder875_defconfig
arc                        nsim_700_defconfig
sh                         ecovec24_defconfig
sh                               allmodconfig
sh                        dreamcast_defconfig
mips                 decstation_r4k_defconfig
powerpc64                        alldefconfig
arc                        nsimosci_defconfig
um                           x86_64_defconfig
powerpc                        warp_defconfig
powerpc                      tqm8xx_defconfig
mips                           jazz_defconfig
sh                     magicpanelr2_defconfig
powerpc                     tqm8555_defconfig
sh                         ap325rxa_defconfig
x86_64                              defconfig
mips                      loongson3_defconfig
sparc                            alldefconfig
powerpc                 mpc837x_rdb_defconfig
arm                        mvebu_v7_defconfig
sh                          r7785rp_defconfig
xtensa                         virt_defconfig
m68k                            q40_defconfig
arm                        keystone_defconfig
powerpc                 mpc85xx_cds_defconfig
parisc                generic-64bit_defconfig
m68k                          hp300_defconfig
ia64                          tiger_defconfig
powerpc                           allnoconfig
sh                             espt_defconfig
arm                       multi_v4t_defconfig
arm                             ezx_defconfig
arm                        mini2440_defconfig
xtensa                              defconfig
arm                           sama5_defconfig
powerpc                  iss476-smp_defconfig
sh                          rsk7203_defconfig
nios2                         3c120_defconfig
sparc                            allyesconfig
sh                         microdev_defconfig
arc                     nsimosci_hs_defconfig
powerpc                     stx_gp3_defconfig
um                               alldefconfig
openrisc                    or1ksim_defconfig
mips                            ar7_defconfig
powerpc                mpc7448_hpc2_defconfig
powerpc                       holly_defconfig
arm                            xcep_defconfig
riscv                            allyesconfig
arm                           viper_defconfig
sparc                       sparc64_defconfig
sh                          polaris_defconfig
sh                        sh7763rdp_defconfig
powerpc                         wii_defconfig
sparc                               defconfig
arm                        cerfcube_defconfig
arm64                            alldefconfig
m68k                          sun3x_defconfig
mips                     decstation_defconfig
xtensa                  cadence_csp_defconfig
arm                         assabet_defconfig
microblaze                      mmu_defconfig
sh                          r7780mp_defconfig
h8300                            allyesconfig
sh                                  defconfig
powerpc                     taishan_defconfig
powerpc                     tqm8541_defconfig
powerpc                 mpc834x_itx_defconfig
mips                         mpc30x_defconfig
arm                            zeus_defconfig
arm                     eseries_pxa_defconfig
arm                         lubbock_defconfig
parisc                generic-32bit_defconfig
alpha                               defconfig
mips                         bigsur_defconfig
sh                   rts7751r2dplus_defconfig
arm                           h5000_defconfig
i386                                defconfig
mips                      fuloong2e_defconfig
sh                          rsk7269_defconfig
alpha                            alldefconfig
m68k                        m5307c3_defconfig
powerpc                       maple_defconfig
ia64                            zx1_defconfig
xtensa                           alldefconfig
ia64                        generic_defconfig
powerpc                   motionpro_defconfig
arm                      integrator_defconfig
nios2                         10m50_defconfig
arm                          gemini_defconfig
powerpc                      pcm030_defconfig
alpha                            allyesconfig
arm                          lpd270_defconfig
arm                             pxa_defconfig
arm                         vf610m4_defconfig
arc                           tb10x_defconfig
microblaze                          defconfig
mips                         db1xxx_defconfig
powerpc                   currituck_defconfig
mips                      maltasmvp_defconfig
powerpc                      chrp32_defconfig
sh                           se7206_defconfig
sh                             shx3_defconfig
arm                            mps2_defconfig
nios2                            allyesconfig
sh                        apsh4ad0a_defconfig
sh                          lboxre2_defconfig
powerpc                      ppc6xx_defconfig
arm                         lpc18xx_defconfig
arm                         s3c6400_defconfig
arm                           stm32_defconfig
arm                       aspeed_g5_defconfig
m68k                        stmark2_defconfig
m68k                         amcore_defconfig
sh                            titan_defconfig
xtensa                    xip_kc705_defconfig
powerpc                      makalu_defconfig
nios2                               defconfig
arm                         cm_x300_defconfig
m68k                        m5407c3_defconfig
sh                     sh7710voipgw_defconfig
sh                   secureedge5410_defconfig
arm                             rpc_defconfig
nios2                            alldefconfig
arm                            lart_defconfig
arm                       imx_v6_v7_defconfig
openrisc                 simple_smp_defconfig
arm                        trizeps4_defconfig
mips                        bcm47xx_defconfig
m68k                          multi_defconfig
arm                            hisi_defconfig
arc                    vdk_hs38_smp_defconfig
mips                             allmodconfig
arc                              alldefconfig
arc                      axs103_smp_defconfig
sh                  sh7785lcr_32bit_defconfig
m68k                          amiga_defconfig
um                             i386_defconfig
h8300                               defconfig
m68k                            mac_defconfig
sh                          sdk7780_defconfig
arc                     haps_hs_smp_defconfig
xtensa                           allyesconfig
sh                               j2_defconfig
riscv                    nommu_k210_defconfig
sh                          rsk7264_defconfig
arm                       omap2plus_defconfig
powerpc                      bamboo_defconfig
mips                           gcw0_defconfig
sh                               alldefconfig
powerpc                     asp8347_defconfig
powerpc                    sam440ep_defconfig
sh                           se7722_defconfig
arm                          iop32x_defconfig
openrisc                            defconfig
powerpc                        cell_defconfig
openrisc                         alldefconfig
mips                  maltasmvp_eva_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220506
arm                  randconfig-c002-20220507
arm                  randconfig-c002-20220508
arm                  randconfig-c002-20220505
arm                  randconfig-c002-20220512
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                                defconfig
arc                              allyesconfig
arc                                 defconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
i386                             allyesconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220505
s390                 randconfig-r044-20220505
riscv                randconfig-r042-20220505
s390                 randconfig-r044-20220512
riscv                randconfig-r042-20220512
arc                  randconfig-r043-20220512
arc                  randconfig-r043-20220507
s390                 randconfig-r044-20220507
riscv                randconfig-r042-20220507
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                                  kexec
x86_64                           allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3

clang tested configs:
x86_64                        randconfig-c007
i386                          randconfig-c001
powerpc              randconfig-c003-20220505
riscv                randconfig-c006-20220505
arm                  randconfig-c002-20220505
powerpc              randconfig-c003-20220506
riscv                randconfig-c006-20220506
mips                 randconfig-c004-20220506
arm                  randconfig-c002-20220506
s390                 randconfig-c005-20220506
powerpc              randconfig-c003-20220507
riscv                randconfig-c006-20220507
mips                 randconfig-c004-20220507
arm                  randconfig-c002-20220507
powerpc              randconfig-c003-20220508
riscv                randconfig-c006-20220508
mips                 randconfig-c004-20220508
arm                  randconfig-c002-20220508
s390                 randconfig-c005-20220512
powerpc              randconfig-c003-20220512
riscv                randconfig-c006-20220512
mips                 randconfig-c004-20220512
arm                  randconfig-c002-20220512
arm                  colibri_pxa300_defconfig
arm                          pcm027_defconfig
mips                        omega2p_defconfig
powerpc                 mpc836x_rdk_defconfig
arm                           omap1_defconfig
arm                          moxart_defconfig
arm                          collie_defconfig
mips                         tb0219_defconfig
powerpc                     mpc5200_defconfig
arm                       cns3420vb_defconfig
mips                      pic32mzda_defconfig
i386                             allyesconfig
mips                           mtx1_defconfig
arm                         socfpga_defconfig
powerpc                     ksi8560_defconfig
mips                          ath25_defconfig
mips                           rs90_defconfig
powerpc                     pseries_defconfig
arm                        mvebu_v5_defconfig
powerpc                  mpc885_ads_defconfig
arm                        vexpress_defconfig
arm                     davinci_all_defconfig
arm                    vt8500_v6_v7_defconfig
powerpc                     skiroot_defconfig
powerpc                 mpc8560_ads_defconfig
powerpc                      walnut_defconfig
arm                             mxs_defconfig
arm                        neponset_defconfig
mips                      malta_kvm_defconfig
hexagon                             defconfig
mips                       lemote2f_defconfig
mips                  cavium_octeon_defconfig
mips                        workpad_defconfig
mips                          ath79_defconfig
arm                            mmp2_defconfig
arm                            dove_defconfig
arm                         lpc32xx_defconfig
arm                          ixp4xx_defconfig
powerpc                 mpc8313_rdb_defconfig
powerpc                    ge_imp3a_defconfig
mips                      maltaaprp_defconfig
mips                   sb1250_swarm_defconfig
arm                           spitz_defconfig
arm                       spear13xx_defconfig
powerpc                      katmai_defconfig
arm                         s3c2410_defconfig
mips                     cu1000-neo_defconfig
arm                       aspeed_g4_defconfig
powerpc                   lite5200b_defconfig
powerpc                     tqm5200_defconfig
arm                         s5pv210_defconfig
arm                       versatile_defconfig
mips                malta_qemu_32r6_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
i386                 randconfig-a004-20220509
i386                 randconfig-a006-20220509
i386                 randconfig-a002-20220509
i386                 randconfig-a003-20220509
i386                 randconfig-a001-20220509
i386                 randconfig-a005-20220509
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220506
riscv                randconfig-r042-20220506
hexagon              randconfig-r041-20220506
hexagon              randconfig-r045-20220512
hexagon              randconfig-r041-20220512
hexagon              randconfig-r045-20220505
hexagon              randconfig-r041-20220505
hexagon              randconfig-r045-20220509
hexagon              randconfig-r045-20220508
riscv                randconfig-r042-20220508
hexagon              randconfig-r041-20220509
hexagon              randconfig-r041-20220508

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
